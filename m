Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B087D44F9
	for <lists+dm-devel@lfdr.de>; Fri, 11 Oct 2019 18:06:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6947E7FDCD;
	Fri, 11 Oct 2019 16:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C86B60BF4;
	Fri, 11 Oct 2019 16:06:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE4D54E589;
	Fri, 11 Oct 2019 16:05:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9BG529P016034 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 12:05:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1ED76031D; Fri, 11 Oct 2019 16:05:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22402601B7;
	Fri, 11 Oct 2019 16:05:00 +0000 (UTC)
Date: Fri, 11 Oct 2019 12:04:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191011160459.GA29323@redhat.com>
References: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
	<b9bf16a0-b099-898a-d4c2-189682103be7@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9bf16a0-b099-898a-d4c2-189682103be7@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, guru2018@gmail.com
Subject: Re: [dm-devel] [PATCH 2/2] dm-snapshot: Reimplement the cow limit.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 11 Oct 2019 16:06:07 +0000 (UTC)

On Fri, Oct 11 2019 at  8:43am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 10/2/19 1:15 PM, Mikulas Patocka wrote:
> > Commit 721b1d98fb517a ("dm snapshot: Fix excessive memory usage and
> > workqueue stalls") introduced a semaphore to limit the maximum number of
> > in-flight kcopyd (COW) jobs.
> > 
> > The implementation of this throttling mechanism is prone to a deadlock:
> > 
> > 1. One or more threads write to the origin device causing COW, which is
> >    performed by kcopyd.
> > 
> > 2. At some point some of these threads might reach the s->cow_count
> >    semaphore limit and block in down(&s->cow_count), holding a read lock
> >    on _origins_lock.
> > 
> > 3. Someone tries to acquire a write lock on _origins_lock, e.g.,
> >    snapshot_ctr(), which blocks because the threads at step (2) already
> >    hold a read lock on it.
> > 
> > 4. A COW operation completes and kcopyd runs dm-snapshot's completion
> >    callback, which ends up calling pending_complete().
> >    pending_complete() tries to resubmit any deferred origin bios. This
> >    requires acquiring a read lock on _origins_lock, which blocks.
> > 
> >    This happens because the read-write semaphore implementation gives
> >    priority to writers, meaning that as soon as a writer tries to enter
> >    the critical section, no readers will be allowed in, until all
> >    writers have completed their work.
> > 
> >    So, pending_complete() waits for the writer at step (3) to acquire
> >    and release the lock. This writer waits for the readers at step (2)
> >    to release the read lock and those readers wait for
> >    pending_complete() (the kcopyd thread) to signal the s->cow_count
> >    semaphore: DEADLOCK.
> > 
> > In order to fix the bug, I reworked limiting, so that it waits without 
> > holding any locks. The patch adds a variable in_progress that counts how 
> > many kcopyd jobs are running. A function wait_for_in_progress will sleep 
> > if the variable in_progress is over the limit. It drops _origins_lock in 
> > order to avoid the deadlock.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org	# v5.0+
> > Fixes: 721b1d98fb51 ("dm snapshot: Fix excessive memory usage and workqueue stalls")
> > 
> > ---
> >  drivers/md/dm-snap.c |   69 ++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 55 insertions(+), 14 deletions(-)
> > 
> > Index: linux-2.6/drivers/md/dm-snap.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-snap.c	2019-10-01 15:23:42.000000000 +0200
> > +++ linux-2.6/drivers/md/dm-snap.c	2019-10-02 12:01:23.000000000 +0200
> > @@ -18,7 +18,6 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/log2.h>
> >  #include <linux/dm-kcopyd.h>
> > -#include <linux/semaphore.h>
> >  
> >  #include "dm.h"
> >  
> > @@ -107,8 +106,8 @@ struct dm_snapshot {
> >  	/* The on disk metadata handler */
> >  	struct dm_exception_store *store;
> >  
> > -	/* Maximum number of in-flight COW jobs. */
> > -	struct semaphore cow_count;
> > +	unsigned in_progress;
> > +	struct wait_queue_head in_progress_wait;
> >  
> >  	struct dm_kcopyd_client *kcopyd_client;
> >  
> > @@ -162,8 +161,8 @@ struct dm_snapshot {
> >   */
> >  #define DEFAULT_COW_THRESHOLD 2048
> >  
> > -static int cow_threshold = DEFAULT_COW_THRESHOLD;
> > -module_param_named(snapshot_cow_threshold, cow_threshold, int, 0644);
> > +static unsigned cow_threshold = DEFAULT_COW_THRESHOLD;
> > +module_param_named(snapshot_cow_threshold, cow_threshold, uint, 0644);
> >  MODULE_PARM_DESC(snapshot_cow_threshold, "Maximum number of chunks being copied on write");
> >  
> >  DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(snapshot_copy_throttle,
> > @@ -1327,7 +1326,7 @@ static int snapshot_ctr(struct dm_target
> >  		goto bad_hash_tables;
> >  	}
> >  
> > -	sema_init(&s->cow_count, (cow_threshold > 0) ? cow_threshold : INT_MAX);
> > +	init_waitqueue_head(&s->in_progress_wait);
> >  
> 
> 's->in_progress = 0' is missing here.
> 
> I totally missed that during the review and d3775354 ("dm: Use kzalloc
> for all structs with embedded biosets/mempools") changed the allocation
> of 's' to using kzalloc(), so 'in_progress' was implicitly initialized
> to zero and the tests ran fine.

OK, so the need to explicitly initialize to zero only exists in older
kernel (e.g. the 4.4-stable kernel).  Either that or cherry-pick commit
d3775354 (even if only the hunk that modifies dm-snap.c)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
