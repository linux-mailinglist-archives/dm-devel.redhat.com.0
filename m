Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CBADF10273C
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:47:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574174820;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=f/bqeSRibBg+2tZvzmdK7v6vZ1isXX/Q8Ri8blRRZpE=;
	b=KE5SBIVy7vavkpyb6HHJbEs2VHcgmk1watG+Sl3XdXJFiit9BZ06bCaSX9mBE9oEqyzhiM
	0XzgqX8miLmEyIKw6Gwem1HKXKT/UmnJlEma6d7/qEgQGkka1azZpmgsXz0SYCnsDhAcxk
	EE+ZsaUCqtrbz9/LGyWtTBJXtJNaAc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-qGYBl3ykNNKN50Wj6HYSzA-1; Tue, 19 Nov 2019 09:46:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68FDB1525FA;
	Tue, 19 Nov 2019 14:46:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA3C63620;
	Tue, 19 Nov 2019 14:46:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37B1718089C8;
	Tue, 19 Nov 2019 14:46:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEkgFd027856 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:46:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F7C551A6; Tue, 19 Nov 2019 14:46:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F1F1758E
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:46:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C897F900AA3
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:46:37 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-5B692EXzNpelqyb5HeCETg-1; Tue, 19 Nov 2019 09:46:35 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so23633949ljl.4
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4A46jEOs89cuJTCiP0sBoycf37LERXsLrkbM+Mgt/Fw=;
	b=BmWwt7Ig/819TtC3ZdI2hSNjZLHsnrzSSQHjtk7ICYndMIvDrh+iRwBAo43ZXjscIR
	3GXgI0gktuATuLB/BRVz+nLtxtF4YsGMxDwrkoN349NJg2+/MKL0jyMH8VvkyUPBWt0V
	aprvtdydRjaEGasu5n3f1poGxkBuhjxsuE4i3qAIHnGOhnJvM7AZsFnuTc3Dpm5jhdZM
	eaVtztUp38hR2dVp8+wmFj1N1KwVgoFKvdxPzL78voWyk3G5mxQvJCn1dptlewFFitSL
	GiNXDH0RBxbzXsxeDNkc4mjaBJc37cmjqe7Xj/Cfm6fupavPSx+X7Yzw/8rLydv+8Azv
	P8ow==
X-Gm-Message-State: APjAAAWcd9NIpwcYLkyHWAY+L0n1aMtExHxnfJUnW7oMibLYfeZzYSOS
	McJ4sBlkR9pMhEpVXdbhcF/pQw4d+2U=
X-Google-Smtp-Source: APXvYqwbgndZGhMH4z0KafYiRb8x+yMpKhzGdtphxCaNEDoDMuyCH6emgR1xUdInsWfUxOY77wiSIA==
X-Received: by 2002:a2e:87cf:: with SMTP id v15mr4193087ljj.79.1574174793779; 
	Tue, 19 Nov 2019 06:46:33 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	x12sm10504841lfq.52.2019.11.19.06.46.33 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:46:33 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:46:32 +0200
Resent-Message-ID: <105e8be4-e5e3-e585-6ade-ed7b9bb7b8a6@arrikto.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Scott Wood <swood@redhat.com>
References: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <c9a772e9-e305-cf0b-1155-fb19bdb84e55@arrikto.com>
Date: Mon, 11 Nov 2019 18:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911110811060.28408@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: 5B692EXzNpelqyb5HeCETg-1
X-MC-Unique: qGYBl3ykNNKN50Wj6HYSzA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: fix crash with the realtime
	kernel
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/11/19 3:59 PM, Mikulas Patocka wrote:
> Snapshot doesn't work with realtime kernels since the commit f79ae415b64c.
> hlist_bl is implemented as a raw spinlock and the code takes two non-raw
> spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexes
> in the realtime kernel, so they couldn't be taken inside a raw spinlock).
> 
> This patch fixes the problem by using non-raw spinlock
> exception_table_lock instead of the hlist_bl lock.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
> 

Hi Mikulas,

I wasn't aware that hlist_bl is implemented as a raw spinlock in the
real time kernel. I would expect it to be a standard non-raw spinlock,
so everything works as expected. But, after digging further in the real
time tree, I found commit ad7675b15fd87f1 ("list_bl: Make list head
locking RT safe") which suggests that such a conversion would break
other parts of the kernel.

That said,

  Reviewed-by: Nikos Tsironis <ntsironis@arrikto.com>

> ---
>  drivers/md/dm-snap.c |   65 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 23 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-snap.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-snap.c	2019-11-08 15:51:42.000000000 +0100
> +++ linux-2.6/drivers/md/dm-snap.c	2019-11-08 15:54:58.000000000 +0100
> @@ -141,6 +141,10 @@ struct dm_snapshot {
>  	 * for them to be committed.
>  	 */
>  	struct bio_list bios_queued_during_merge;
> +
> +#ifdef CONFIG_PREEMPT_RT_BASE
> +	spinlock_t exception_table_lock;
> +#endif
>  };
>  
>  /*
> @@ -625,30 +629,42 @@ static uint32_t exception_hash(struct dm
>  
>  /* Lock to protect access to the completed and pending exception hash tables. */
>  struct dm_exception_table_lock {
> +#ifndef CONFIG_PREEMPT_RT_BASE
>  	struct hlist_bl_head *complete_slot;
>  	struct hlist_bl_head *pending_slot;
> +#endif
>  };
>  
>  static void dm_exception_table_lock_init(struct dm_snapshot *s, chunk_t chunk,
>  					 struct dm_exception_table_lock *lock)
>  {
> +#ifndef CONFIG_PREEMPT_RT_BASE
>  	struct dm_exception_table *complete = &s->complete;
>  	struct dm_exception_table *pending = &s->pending;
>  
>  	lock->complete_slot = &complete->table[exception_hash(complete, chunk)];
>  	lock->pending_slot = &pending->table[exception_hash(pending, chunk)];
> +#endif
>  }
>  
> -static void dm_exception_table_lock(struct dm_exception_table_lock *lock)
> +static void dm_exception_table_lock(struct dm_snapshot *s, struct dm_exception_table_lock *lock)
>  {
> +#ifdef CONFIG_PREEMPT_RT_BASE
> +	spin_lock(&s->exception_table_lock);
> +#else
>  	hlist_bl_lock(lock->complete_slot);
>  	hlist_bl_lock(lock->pending_slot);
> +#endif
>  }
>  
> -static void dm_exception_table_unlock(struct dm_exception_table_lock *lock)
> +static void dm_exception_table_unlock(struct dm_snapshot *s, struct dm_exception_table_lock *lock)
>  {
> +#ifdef CONFIG_PREEMPT_RT_BASE
> +	spin_unlock(&s->exception_table_lock);
> +#else
>  	hlist_bl_unlock(lock->pending_slot);
>  	hlist_bl_unlock(lock->complete_slot);
> +#endif
>  }
>  
>  static int dm_exception_table_init(struct dm_exception_table *et,
> @@ -835,9 +851,9 @@ static int dm_add_exception(void *contex
>  	 */
>  	dm_exception_table_lock_init(s, old, &lock);
>  
> -	dm_exception_table_lock(&lock);
> +	dm_exception_table_lock(s, &lock);
>  	dm_insert_exception(&s->complete, e);
> -	dm_exception_table_unlock(&lock);
> +	dm_exception_table_unlock(s, &lock);
>  
>  	return 0;
>  }
> @@ -1318,6 +1334,9 @@ static int snapshot_ctr(struct dm_target
>  	s->first_merging_chunk = 0;
>  	s->num_merging_chunks = 0;
>  	bio_list_init(&s->bios_queued_during_merge);
> +#ifdef CONFIG_PREEMPT_RT_BASE
> +	spin_lock_init(&s->exception_table_lock);
> +#endif
>  
>  	/* Allocate hash table for COW data */
>  	if (init_hash_tables(s)) {
> @@ -1651,7 +1670,7 @@ static void pending_complete(void *conte
>  		invalidate_snapshot(s, -EIO);
>  		error = 1;
>  
> -		dm_exception_table_lock(&lock);
> +		dm_exception_table_lock(s, &lock);
>  		goto out;
>  	}
>  
> @@ -1660,13 +1679,13 @@ static void pending_complete(void *conte
>  		invalidate_snapshot(s, -ENOMEM);
>  		error = 1;
>  
> -		dm_exception_table_lock(&lock);
> +		dm_exception_table_lock(s, &lock);
>  		goto out;
>  	}
>  	*e = pe->e;
>  
>  	down_read(&s->lock);
> -	dm_exception_table_lock(&lock);
> +	dm_exception_table_lock(s, &lock);
>  	if (!s->valid) {
>  		up_read(&s->lock);
>  		free_completed_exception(e);
> @@ -1687,16 +1706,16 @@ static void pending_complete(void *conte
>  
>  	/* Wait for conflicting reads to drain */
>  	if (__chunk_is_tracked(s, pe->e.old_chunk)) {
> -		dm_exception_table_unlock(&lock);
> +		dm_exception_table_unlock(s, &lock);
>  		__check_for_conflicting_io(s, pe->e.old_chunk);
> -		dm_exception_table_lock(&lock);
> +		dm_exception_table_lock(s, &lock);
>  	}
>  
>  out:
>  	/* Remove the in-flight exception from the list */
>  	dm_remove_exception(&pe->e);
>  
> -	dm_exception_table_unlock(&lock);
> +	dm_exception_table_unlock(s, &lock);
>  
>  	snapshot_bios = bio_list_get(&pe->snapshot_bios);
>  	origin_bios = bio_list_get(&pe->origin_bios);
> @@ -1968,7 +1987,7 @@ static int snapshot_map(struct dm_target
>  	}
>  
>  	down_read(&s->lock);
> -	dm_exception_table_lock(&lock);
> +	dm_exception_table_lock(s, &lock);
>  
>  	if (!s->valid || (unlikely(s->snapshot_overflowed) &&
>  	    bio_data_dir(bio) == WRITE)) {
> @@ -1997,7 +2016,7 @@ static int snapshot_map(struct dm_target
>  		remap_exception(s, e, bio, chunk);
>  		if (unlikely(bio_op(bio) == REQ_OP_DISCARD) &&
>  		    io_overlaps_chunk(s, bio)) {
> -			dm_exception_table_unlock(&lock);
> +			dm_exception_table_unlock(s, &lock);
>  			up_read(&s->lock);
>  			zero_exception(s, e, bio, chunk);
>  			r = DM_MAPIO_SUBMITTED; /* discard is not issued */
> @@ -2024,9 +2043,9 @@ static int snapshot_map(struct dm_target
>  	if (bio_data_dir(bio) == WRITE) {
>  		pe = __lookup_pending_exception(s, chunk);
>  		if (!pe) {
> -			dm_exception_table_unlock(&lock);
> +			dm_exception_table_unlock(s, &lock);
>  			pe = alloc_pending_exception(s);
> -			dm_exception_table_lock(&lock);
> +			dm_exception_table_lock(s, &lock);
>  
>  			e = dm_lookup_exception(&s->complete, chunk);
>  			if (e) {
> @@ -2037,7 +2056,7 @@ static int snapshot_map(struct dm_target
>  
>  			pe = __find_pending_exception(s, pe, chunk);
>  			if (!pe) {
> -				dm_exception_table_unlock(&lock);
> +				dm_exception_table_unlock(s, &lock);
>  				up_read(&s->lock);
>  
>  				down_write(&s->lock);
> @@ -2063,7 +2082,7 @@ static int snapshot_map(struct dm_target
>  		if (!pe->started && io_overlaps_chunk(s, bio)) {
>  			pe->started = 1;
>  
> -			dm_exception_table_unlock(&lock);
> +			dm_exception_table_unlock(s, &lock);
>  			up_read(&s->lock);
>  
>  			start_full_bio(pe, bio);
> @@ -2076,7 +2095,7 @@ static int snapshot_map(struct dm_target
>  			/* this is protected by the exception table lock */
>  			pe->started = 1;
>  
> -			dm_exception_table_unlock(&lock);
> +			dm_exception_table_unlock(s, &lock);
>  			up_read(&s->lock);
>  
>  			start_copy(pe);
> @@ -2088,7 +2107,7 @@ static int snapshot_map(struct dm_target
>  	}
>  
>  out_unlock:
> -	dm_exception_table_unlock(&lock);
> +	dm_exception_table_unlock(s, &lock);
>  	up_read(&s->lock);
>  out:
>  	return r;
> @@ -2449,7 +2468,7 @@ static int __origin_write(struct list_he
>  		dm_exception_table_lock_init(snap, chunk, &lock);
>  
>  		down_read(&snap->lock);
> -		dm_exception_table_lock(&lock);
> +		dm_exception_table_lock(snap, &lock);
>  
>  		/* Only deal with valid and active snapshots */
>  		if (!snap->valid || !snap->active)
> @@ -2466,9 +2485,9 @@ static int __origin_write(struct list_he
>  			if (e)
>  				goto next_snapshot;
>  
> -			dm_exception_table_unlock(&lock);
> +			dm_exception_table_unlock(snap, &lock);
>  			pe = alloc_pending_exception(snap);
> -			dm_exception_table_lock(&lock);
> +			dm_exception_table_lock(snap, &lock);
>  
>  			pe2 = __lookup_pending_exception(snap, chunk);
>  
> @@ -2481,7 +2500,7 @@ static int __origin_write(struct list_he
>  
>  				pe = __insert_pending_exception(snap, pe, chunk);
>  				if (!pe) {
> -					dm_exception_table_unlock(&lock);
> +					dm_exception_table_unlock(snap, &lock);
>  					up_read(&snap->lock);
>  
>  					invalidate_snapshot(snap, -ENOMEM);
> @@ -2516,7 +2535,7 @@ static int __origin_write(struct list_he
>  		}
>  
>  next_snapshot:
> -		dm_exception_table_unlock(&lock);
> +		dm_exception_table_unlock(snap, &lock);
>  		up_read(&snap->lock);
>  
>  		if (pe_to_start_now) {
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

