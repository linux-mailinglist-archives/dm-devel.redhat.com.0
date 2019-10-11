Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B5D3FD2
	for <lists+dm-devel@lfdr.de>; Fri, 11 Oct 2019 14:44:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D24F18CB90E;
	Fri, 11 Oct 2019 12:43:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6E2196B2;
	Fri, 11 Oct 2019 12:43:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 250874E58A;
	Fri, 11 Oct 2019 12:43:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9BChJOi003833 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 08:43:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03B4860BF4; Fri, 11 Oct 2019 12:43:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F214260BE1
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 12:43:16 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E115C3016EF8
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 12:43:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so11791715wrv.7
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=D4VAXIFeL4jPFXMFClQSGAAlC6VFZYAwRpCxo3+x1G4=;
	b=UnG5SviHDsh6IT7DEaswMPejecBCl4Hw5lnYMdVVTb2zOJTuxKqPnSvoXrrJl0WJrZ
	6yffmBjuNImDtKX4bR0db4CxjSx9NaHEQ9W4tEkwRx3bfr63nJ+iGV08kWu8ga4yXOIx
	wP2jqWjqD+Qn4rC/mmjuZnY4UOlNUde1mF5kpaGxjsxL6WULzjRTdo88WoOGA7MD7XgM
	Wi4rWCryDMt7POOWEFTKFWXdvSTJcsDwWF/jj++ROkd05Cl82ofCTMUn8TRku4iV4xLb
	+sazjEHJlh9Kzoe+nQznP3C4LRtDd2M2+oSKN6yAUKB2aR/xx+r7zfeP2qNryamoQw2l
	BJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D4VAXIFeL4jPFXMFClQSGAAlC6VFZYAwRpCxo3+x1G4=;
	b=gB+8ftIvQ0lyNRLOwTpJsWO3X2jjO2YicZ+KHlBQadKsQdTvkYi/lIofhBWc3e43ru
	LVWhLuIRqsXXWzj8hbPZJSBMS7DLtnPri+AImvAqKJ0pYCmdtrODKJPEPcJiAQ6Ex+WY
	v4fS3EH0pHD9348ypEPhC3fFLakMD2a7rYAnhkl9TFyQ7LW8Vdp6zoSBr+66Yx8LjDmX
	6HI3pbjp82QomylCHzrHZmaXqld8wkvpy6xWSE2dgxNzOVcKLLWGvRo4u/UkrTlbL2Po
	Am/n2cvmWk9gfEsk5B90sHISZNac6ELsLDdf1H28nzc+hIY1w+gL9eNH1uT3YBHtRDRf
	oebw==
X-Gm-Message-State: APjAAAX7LBIjHdtZBV6l/xQLPslGsEGCv2+VGklWxl1Mgo+zrIvCG9rk
	Z7IyYTc5jwpsaajjgVCKzj72RnrW964=
X-Google-Smtp-Source: APXvYqyZsDhP8wtjEpX9qKklJBDujS/Qh0qRVMRmnBoujteJL2EOJCt1p9vU/gFjBs8nuEVzEpz4qQ==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr12623458wrn.353.1570797793412; 
	Fri, 11 Oct 2019 05:43:13 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	o9sm15537223wrh.46.2019.10.11.05.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 05:43:13 -0700 (PDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
References: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <b9bf16a0-b099-898a-d4c2-189682103be7@arrikto.com>
Date: Fri, 11 Oct 2019 15:43:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1910020614190.973@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 11 Oct 2019 12:43:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 11 Oct 2019 12:43:15 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 12:44:02 +0000 (UTC)

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

's->in_progress = 0' is missing here.

I totally missed that during the review and d3775354 ("dm: Use kzalloc
for all structs with embedded biosets/mempools") changed the allocation
of 's' to using kzalloc(), so 'in_progress' was implicitly initialized
to zero and the tests ran fine.

Nikos

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
