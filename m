Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 70824C92B9
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 22:00:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A66DD309BF02;
	Wed,  2 Oct 2019 20:00:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEEC60BE0;
	Wed,  2 Oct 2019 20:00:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E6EB18089C8;
	Wed,  2 Oct 2019 20:00:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92K0TTi018625 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 16:00:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0419760C18; Wed,  2 Oct 2019 20:00:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F20D460BE0
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 20:00:26 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7719309BF02
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 20:00:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 5so224660wmg.0
	for <dm-devel@redhat.com>; Wed, 02 Oct 2019 13:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RfaapF2O2nO4XtJE0Sp9/W+WL5rrB7/5PtQvYL6hbQs=;
	b=Y1pdN4J/3swmFOp6tfZaZe/c9N3fxxv+Y4ruLHIynPI1nIC9j4aAZFWry+QxTItE28
	sAE2VpLvz6DlMKf9sjEfQ9qDEfBEk1b7fY9q0UA4wR412I5uGh2Wj/yDeJCn6Oi8xyU5
	lKvLpntQQDeqgmPXQvQeD0WEoApsPMy913SJWtjWPOqyUADLnnWDAnbblgoCzanA0YQf
	9mTSFvfTPUwavCyPPaOePXo1Gix77kJRd7Rjf9NyIvj+oZeEcOKFgLxr1F6/aBoK433A
	ORxf3FqWA6vGMVD9MzqdA2y21ySEb8qTRtzH+YxFF9Nw4d40G0oJEYkTIiQukxYVFmvW
	v+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RfaapF2O2nO4XtJE0Sp9/W+WL5rrB7/5PtQvYL6hbQs=;
	b=EBma+k3k6peRYFmTFq8DPZMUX74IiLv32pIwcvC8bOg+dqgCZpRksq02uvCY7Da/F8
	/jxj9+TiKpZVY75+Lcp9RkVTqj8J7EcfT4UkdO+mNAx0YpeIvJhKPNaSGa2tCWn7xkJe
	uhh7D0Ah75mdiD9I4iEgwyjXcpwvRIikYlXnF4VZC9nG/HHXSyyIGOSQnp+40hN6qb/m
	9uHzLV9lOd8wU59Bujx4XK0ldJPhe670PV6zai1gycgF7SfxqQxGSoqC8uazbmTcnc4X
	X04EsKpXLkSOLTcV5QuRNuaGnGk/5SJfrq6h4lsREe3N/eVVrAPwrPCmbNMVam5yMgb4
	y0tA==
X-Gm-Message-State: APjAAAUBMpkJ9n9E6Fl2OZqGSi9SHcdoglc6PzYnr2DGOsCOS8r9dOuS
	UuJMt48+J4rNLYQYBUECtAuYQSpF474=
X-Google-Smtp-Source: APXvYqyobOlVOHBSkxOxuEYRQLXTbCJHKwVvEhxUi60gbGAMI3KC5vCloDNlKslsJSs417DBwqi/gQ==
X-Received: by 2002:a05:600c:34e:: with SMTP id
	u14mr3922774wmd.110.1570046423207; 
	Wed, 02 Oct 2019 13:00:23 -0700 (PDT)
Received: from [192.168.1.108] (130.43.56.1.dsl.dyn.forthnet.gr. [130.43.56.1])
	by smtp.gmail.com with ESMTPSA id
	q192sm304338wme.23.2019.10.02.13.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Oct 2019 13:00:22 -0700 (PDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>, 
	Alasdair Kergon <agk@redhat.com>
References: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <b63d2544-64fd-de75-15c1-d85be0cd887e@arrikto.com>
Date: Wed, 2 Oct 2019 23:00:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 02 Oct 2019 20:00:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 02 Oct 2019 20:00:25 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, guru2018@gmail.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 02 Oct 2019 20:00:49 +0000 (UTC)

Hi Mikulas,

I agree that it's better to avoid holding any locks while waiting for
some pending kcopyd jobs to finish, but please see the comments below.

On 10/2/19 1:15 PM, Mikulas Patocka wrote:
> Commit 721b1d98fb517a ("dm snapshot: Fix excessive memory usage and
> workqueue stalls") introduced a semaphore to limit the maximum number of
> in-flight kcopyd (COW) jobs.
> 
> The implementation of this throttling mechanism is prone to a deadlock:
> 
> 1. One or more threads write to the origin device causing COW, which is
>    performed by kcopyd.
> 
> 2. At some point some of these threads might reach the s->cow_count
>    semaphore limit and block in down(&s->cow_count), holding a read lock
>    on _origins_lock.
> 
> 3. Someone tries to acquire a write lock on _origins_lock, e.g.,
>    snapshot_ctr(), which blocks because the threads at step (2) already
>    hold a read lock on it.
> 
> 4. A COW operation completes and kcopyd runs dm-snapshot's completion
>    callback, which ends up calling pending_complete().
>    pending_complete() tries to resubmit any deferred origin bios. This
>    requires acquiring a read lock on _origins_lock, which blocks.
> 
>    This happens because the read-write semaphore implementation gives
>    priority to writers, meaning that as soon as a writer tries to enter
>    the critical section, no readers will be allowed in, until all
>    writers have completed their work.
> 
>    So, pending_complete() waits for the writer at step (3) to acquire
>    and release the lock. This writer waits for the readers at step (2)
>    to release the read lock and those readers wait for
>    pending_complete() (the kcopyd thread) to signal the s->cow_count
>    semaphore: DEADLOCK.
> 
> In order to fix the bug, I reworked limiting, so that it waits without 
> holding any locks. The patch adds a variable in_progress that counts how 
> many kcopyd jobs are running. A function wait_for_in_progress will sleep 
> if the variable in_progress is over the limit. It drops _origins_lock in 
> order to avoid the deadlock.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v5.0+
> Fixes: 721b1d98fb51 ("dm snapshot: Fix excessive memory usage and workqueue stalls")
> 
> ---
>  drivers/md/dm-snap.c |   69 ++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 14 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-snap.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-snap.c	2019-10-01 15:23:42.000000000 +0200
> +++ linux-2.6/drivers/md/dm-snap.c	2019-10-02 12:01:23.000000000 +0200
> @@ -18,7 +18,6 @@
>  #include <linux/vmalloc.h>
>  #include <linux/log2.h>
>  #include <linux/dm-kcopyd.h>
> -#include <linux/semaphore.h>
>  
>  #include "dm.h"
>  
> @@ -107,8 +106,8 @@ struct dm_snapshot {
>  	/* The on disk metadata handler */
>  	struct dm_exception_store *store;
>  
> -	/* Maximum number of in-flight COW jobs. */
> -	struct semaphore cow_count;
> +	unsigned in_progress;
> +	struct wait_queue_head in_progress_wait;
>  
>  	struct dm_kcopyd_client *kcopyd_client;
>  
> @@ -162,8 +161,8 @@ struct dm_snapshot {
>   */
>  #define DEFAULT_COW_THRESHOLD 2048
>  
> -static int cow_threshold = DEFAULT_COW_THRESHOLD;
> -module_param_named(snapshot_cow_threshold, cow_threshold, int, 0644);
> +static unsigned cow_threshold = DEFAULT_COW_THRESHOLD;
> +module_param_named(snapshot_cow_threshold, cow_threshold, uint, 0644);
>  MODULE_PARM_DESC(snapshot_cow_threshold, "Maximum number of chunks being copied on write");
>  
>  DECLARE_DM_KCOPYD_THROTTLE_WITH_MODULE_PARM(snapshot_copy_throttle,
> @@ -1327,7 +1326,7 @@ static int snapshot_ctr(struct dm_target
>  		goto bad_hash_tables;
>  	}
>  
> -	sema_init(&s->cow_count, (cow_threshold > 0) ? cow_threshold : INT_MAX);
> +	init_waitqueue_head(&s->in_progress_wait);
>  
>  	s->kcopyd_client = dm_kcopyd_client_create(&dm_kcopyd_throttle);
>  	if (IS_ERR(s->kcopyd_client)) {
> @@ -1509,17 +1508,46 @@ static void snapshot_dtr(struct dm_targe
>  
>  	dm_put_device(ti, s->origin);
>  
> +	WARN_ON(s->in_progress);
> +
>  	kfree(s);
>  }
>  
>  static void account_start_copy(struct dm_snapshot *s)
>  {
> -	down(&s->cow_count);
> +	spin_lock(&s->in_progress_wait.lock);
> +	s->in_progress++;
> +	spin_unlock(&s->in_progress_wait.lock);
>  }
>  
>  static void account_end_copy(struct dm_snapshot *s)
>  {
> -	up(&s->cow_count);
> +	spin_lock(&s->in_progress_wait.lock);
> +	BUG_ON(!s->in_progress);
> +	s->in_progress--;
> +	if (likely(s->in_progress <= cow_threshold) && unlikely(waitqueue_active(&s->in_progress_wait)))
> +		wake_up_locked(&s->in_progress_wait);
> +	spin_unlock(&s->in_progress_wait.lock);
> +}
> +
> +static bool wait_for_in_progress(struct dm_snapshot *s, bool unlock_origins)
> +{
> +	if (unlikely(s->in_progress > cow_threshold)) {
> +		spin_lock(&s->in_progress_wait.lock);
> +		if (likely(s->in_progress > cow_threshold)) {
> +			DECLARE_WAITQUEUE(wait, current);
> +			__add_wait_queue(&s->in_progress_wait, &wait);
> +			__set_current_state(TASK_UNINTERRUPTIBLE);
> +			spin_unlock(&s->in_progress_wait.lock);
> +			if (unlock_origins)
> +				up_read(&_origins_lock);
> +			io_schedule();
> +			remove_wait_queue(&s->in_progress_wait, &wait);
> +			return false;
> +		}
> +		spin_unlock(&s->in_progress_wait.lock);
> +	}
> +	return true;
>  }

wait_for_in_progress() doesn't take into account which chunk is written
and whether it has already been reallocated or it is currently
reallocating.

This means, if I am not missing something, that both origin_map() and
snapshot_map() might unnecessarily throttle writes that don't need any
COW to take place.

For example, if we have some writes coming in, that trigger COW and
cause the COW limit to be reached, and then some more writes come in for
chunks that have already been reallocated (and before any kcopyd job
finishes and decrements s->in_progress), the latter writes would be
delayed without a reason, as they don't require any COW to be performed.

It seems strange that the COW throttling mechanism might also throttle
writes that don't require any COW.

Moreover, if we have reached the COW limit and we get a write for a
chunk that is currently reallocating we will block the thread, when we
could just add the bio to the origin_bios list of the pending exception
and move on.

wait_for_in_progress() could check if the exception is already
reallocated or is being reallocated, but the extra locking in the
critical path might have an adverse effect on performance, especially in
multi-threaded workloads. Maybe some benchmarks would help clarify that.

As a final note, in case the devices are slow, there might be many
writers waiting in s->in_progress_wait. When a kcopyd job finishes, all
of them will wake up and in some cases we might end up issuing more COW
jobs than the cow_count limit, as the accounting for new COW jobs
doesn't happen atomically with the check for the cow_count limit in
wait_for_in_progress().

That said, I don't think having a few more COW jobs in flight, than the
defined limit, will cause any issues.

Nikos

>  
>  /*
> @@ -1537,7 +1565,7 @@ static void flush_bios(struct bio *bio)
>  	}
>  }
>  
> -static int do_origin(struct dm_dev *origin, struct bio *bio);
> +static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit);
>  
>  /*
>   * Flush a list of buffers.
> @@ -1550,7 +1578,7 @@ static void retry_origin_bios(struct dm_
>  	while (bio) {
>  		n = bio->bi_next;
>  		bio->bi_next = NULL;
> -		r = do_origin(s->origin, bio);
> +		r = do_origin(s->origin, bio, false);
>  		if (r == DM_MAPIO_REMAPPED)
>  			generic_make_request(bio);
>  		bio = n;
> @@ -1926,6 +1954,10 @@ static int snapshot_map(struct dm_target
>  	if (!s->valid)
>  		return DM_MAPIO_KILL;
>  
> +	if (bio_data_dir(bio) == WRITE) {
> +		while (unlikely(!wait_for_in_progress(s, false))) ;
> +	}
> +
>  	down_read(&s->lock);
>  	dm_exception_table_lock(&lock);
>  
> @@ -2122,7 +2154,7 @@ redirect_to_origin:
>  
>  	if (bio_data_dir(bio) == WRITE) {
>  		up_write(&s->lock);
> -		return do_origin(s->origin, bio);
> +		return do_origin(s->origin, bio, false);
>  	}
>  
>  out_unlock:
> @@ -2497,15 +2529,24 @@ next_snapshot:
>  /*
>   * Called on a write from the origin driver.
>   */
> -static int do_origin(struct dm_dev *origin, struct bio *bio)
> +static int do_origin(struct dm_dev *origin, struct bio *bio, bool limit)
>  {
>  	struct origin *o;
>  	int r = DM_MAPIO_REMAPPED;
>  
> +again:
>  	down_read(&_origins_lock);
>  	o = __lookup_origin(origin->bdev);
> -	if (o)
> +	if (o) {
> +		struct dm_snapshot *s;
> +		if (limit) {
> +			list_for_each_entry(s, &o->snapshots, list)
> +				if (unlikely(!wait_for_in_progress(s, true)))
> +					goto again;
> +		}
> +
>  		r = __origin_write(&o->snapshots, bio->bi_iter.bi_sector, bio);
> +	}
>  	up_read(&_origins_lock);
>  
>  	return r;
> @@ -2618,7 +2659,7 @@ static int origin_map(struct dm_target *
>  		dm_accept_partial_bio(bio, available_sectors);
>  
>  	/* Only tell snapshots if this is a write */
> -	return do_origin(o->dev, bio);
> +	return do_origin(o->dev, bio, true);
>  }
>  
>  /*
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
