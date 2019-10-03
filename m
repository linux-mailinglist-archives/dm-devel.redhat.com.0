Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B4CAFC1
	for <lists+dm-devel@lfdr.de>; Thu,  3 Oct 2019 22:07:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87256308620B;
	Thu,  3 Oct 2019 20:07:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 068725D6A9;
	Thu,  3 Oct 2019 20:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40C0B1808878;
	Thu,  3 Oct 2019 20:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93K6pYx009445 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 16:06:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95ED21001B23; Thu,  3 Oct 2019 20:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3111D1001B01;
	Thu,  3 Oct 2019 20:06:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x93K6h2g027272; Thu, 3 Oct 2019 16:06:43 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x93K6hN5027268; Thu, 3 Oct 2019 16:06:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 3 Oct 2019 16:06:43 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <b63d2544-64fd-de75-15c1-d85be0cd887e@arrikto.com>
Message-ID: <alpine.LRH.2.02.1910031601030.26094@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
	<b63d2544-64fd-de75-15c1-d85be0cd887e@arrikto.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, guru2018@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 03 Oct 2019 20:07:01 +0000 (UTC)



On Wed, 2 Oct 2019, Nikos Tsironis wrote:

> Hi Mikulas,
> 
> I agree that it's better to avoid holding any locks while waiting for
> some pending kcopyd jobs to finish, but please see the comments below.
> 
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
> >  	s->kcopyd_client = dm_kcopyd_client_create(&dm_kcopyd_throttle);
> >  	if (IS_ERR(s->kcopyd_client)) {
> > @@ -1509,17 +1508,46 @@ static void snapshot_dtr(struct dm_targe
> >  
> >  	dm_put_device(ti, s->origin);
> >  
> > +	WARN_ON(s->in_progress);
> > +
> >  	kfree(s);
> >  }
> >  
> >  static void account_start_copy(struct dm_snapshot *s)
> >  {
> > -	down(&s->cow_count);
> > +	spin_lock(&s->in_progress_wait.lock);
> > +	s->in_progress++;
> > +	spin_unlock(&s->in_progress_wait.lock);
> >  }
> >  
> >  static void account_end_copy(struct dm_snapshot *s)
> >  {
> > -	up(&s->cow_count);
> > +	spin_lock(&s->in_progress_wait.lock);
> > +	BUG_ON(!s->in_progress);
> > +	s->in_progress--;
> > +	if (likely(s->in_progress <= cow_threshold) && unlikely(waitqueue_active(&s->in_progress_wait)))
> > +		wake_up_locked(&s->in_progress_wait);
> > +	spin_unlock(&s->in_progress_wait.lock);
> > +}
> > +
> > +static bool wait_for_in_progress(struct dm_snapshot *s, bool unlock_origins)
> > +{
> > +	if (unlikely(s->in_progress > cow_threshold)) {
> > +		spin_lock(&s->in_progress_wait.lock);
> > +		if (likely(s->in_progress > cow_threshold)) {
> > +			DECLARE_WAITQUEUE(wait, current);
> > +			__add_wait_queue(&s->in_progress_wait, &wait);
> > +			__set_current_state(TASK_UNINTERRUPTIBLE);
> > +			spin_unlock(&s->in_progress_wait.lock);
> > +			if (unlock_origins)
> > +				up_read(&_origins_lock);
> > +			io_schedule();
> > +			remove_wait_queue(&s->in_progress_wait, &wait);
> > +			return false;
> > +		}
> > +		spin_unlock(&s->in_progress_wait.lock);
> > +	}
> > +	return true;
> >  }
> 
> wait_for_in_progress() doesn't take into account which chunk is written
> and whether it has already been reallocated or it is currently
> reallocating.
> 
> This means, if I am not missing something, that both origin_map() and
> snapshot_map() might unnecessarily throttle writes that don't need any
> COW to take place.

I know about it, but I think it's not serious problem - if there are 2048 
outstanding I/Os the system is already heavily congested. It doesn't 
matter if you allow a few more writes or not.

Mikulas

> For example, if we have some writes coming in, that trigger COW and
> cause the COW limit to be reached, and then some more writes come in for
> chunks that have already been reallocated (and before any kcopyd job
> finishes and decrements s->in_progress), the latter writes would be
> delayed without a reason, as they don't require any COW to be performed.
> 
> It seems strange that the COW throttling mechanism might also throttle
> writes that don't require any COW.
> 
> Moreover, if we have reached the COW limit and we get a write for a
> chunk that is currently reallocating we will block the thread, when we
> could just add the bio to the origin_bios list of the pending exception
> and move on.
> 
> wait_for_in_progress() could check if the exception is already
> reallocated or is being reallocated, but the extra locking in the
> critical path might have an adverse effect on performance, especially in
> multi-threaded workloads. Maybe some benchmarks would help clarify that.
> 
> As a final note, in case the devices are slow, there might be many
> writers waiting in s->in_progress_wait. When a kcopyd job finishes, all
> of them will wake up and in some cases we might end up issuing more COW
> jobs than the cow_count limit, as the accounting for new COW jobs
> doesn't happen atomically with the check for the cow_count limit in
> wait_for_in_progress().
> 
> That said, I don't think having a few more COW jobs in flight, than the
> defined limit, will cause any issues.
> 
> Nikos
> 
> >  
> >  /*
> > @@ -1537,7 +1565,7 @@ static void flush_bios(struct bio *bio)
> >  	}
> >  }
> >  
> > -static int do_origin(struct dm_dev *origin, struct bio *bio);
> > +static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit);
> >  
> >  /*
> >   * Flush a list of buffers.
> > @@ -1550,7 +1578,7 @@ static void retry_origin_bios(struct dm_
> >  	while (bio) {
> >  		n = bio->bi_next;
> >  		bio->bi_next = NULL;
> > -		r = do_origin(s->origin, bio);
> > +		r = do_origin(s->origin, bio, false);
> >  		if (r == DM_MAPIO_REMAPPED)
> >  			generic_make_request(bio);
> >  		bio = n;
> > @@ -1926,6 +1954,10 @@ static int snapshot_map(struct dm_target
> >  	if (!s->valid)
> >  		return DM_MAPIO_KILL;
> >  
> > +	if (bio_data_dir(bio) == WRITE) {
> > +		while (unlikely(!wait_for_in_progress(s, false))) ;
> > +	}
> > +
> >  	down_read(&s->lock);
> >  	dm_exception_table_lock(&lock);
> >  
> > @@ -2122,7 +2154,7 @@ redirect_to_origin:
> >  
> >  	if (bio_data_dir(bio) == WRITE) {
> >  		up_write(&s->lock);
> > -		return do_origin(s->origin, bio);
> > +		return do_origin(s->origin, bio, false);
> >  	}
> >  
> >  out_unlock:
> > @@ -2497,15 +2529,24 @@ next_snapshot:
> >  /*
> >   * Called on a write from the origin driver.
> >   */
> > -static int do_origin(struct dm_dev *origin, struct bio *bio)
> > +static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit)
> >  {
> >  	struct origin *o;
> >  	int r = DM_MAPIO_REMAPPED;
> >  
> > +again:
> >  	down_read(&_origins_lock);
> >  	o = __lookup_origin(origin->bdev);
> > -	if (o)
> > +	if (o) {
> > +		struct dm_snapshot *s;
> > +		if (limit) {
> > +			list_for_each_entry(s, &o->snapshots, list)
> > +				if (unlikely(!wait_for_in_progress(s, true)))
> > +					goto again;
> > +		}
> > +
> >  		r = __origin_write(&o->snapshots, bio->bi_iter.bi_sector, bio);
> > +	}
> >  	up_read(&_origins_lock);
> >  
> >  	return r;
> > @@ -2618,7 +2659,7 @@ static int origin_map(struct dm_target *
> >  		dm_accept_partial_bio(bio, available_sectors);
> >  
> >  	/* Only tell snapshots if this is a write */
> > -	return do_origin(o->dev, bio);
> > +	return do_origin(o->dev, bio, true);
> >  }
> >  
> >  /*
> > 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
