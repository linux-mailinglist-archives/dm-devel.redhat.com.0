Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAFC10271A
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:43:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574174634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=F9T5HSyfvF19VwzcOBhfmBmfQXpvE+6qVKb54HcQYmE=;
	b=XWD6B4PS7JIuP+NNOk9kaoVl2Z/LhOqNNskelZ867ByVtEGi0P4dFpFwfMLcjQHznfWsxK
	i07CgNWwKqxQ5jUH1h0V4Cdy8qFYC9TlNUarnbWgU8jCKSaA2ZFC6+930x1ItpL+cY35vl
	eDHNGLgTw68V3ZMFXJp0TMIwciUikng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-409ZOFLKNdOKDHodGKF7Tg-1; Tue, 19 Nov 2019 09:43:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07C5B101FB38;
	Tue, 19 Nov 2019 14:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A23A04DA02;
	Tue, 19 Nov 2019 14:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BAF24BB65;
	Tue, 19 Nov 2019 14:43:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEhcIG027792 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:43:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CDF12063FFC; Tue, 19 Nov 2019 14:43:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58BCF201EA7B
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDD70185A78E
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:43:35 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-5_pxhqgHOt6snEa4WnVsEQ-1; Tue, 19 Nov 2019 09:43:34 -0500
Received: by mail-lf1-f66.google.com with SMTP id q28so17270295lfa.5
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oIUwVCoXTRy2Xzc2WTbShQwLgC231DhggYOStvhTE1g=;
	b=BiH0SU4qIHqUWX+D9mJxQoewg1cpIiBxPZhLOdRVo88iFBCuCztQGw8wNSElhgq7HA
	/sSK4yfTTOGNAl+hLOHdCyjWETjuWwyzmbJKX4hks7Wo3e7Q95E70K7B2WhS+IdHd6W0
	egq0plgBRRgozhjDMU3Hnu4vbrAImCaWhUWhpejvmBsUkkVRMOzQS/D645Kn0TCeWxsH
	HyfDHKAiXTX6CFUr7POURhY5wIQPsKRnxzKHKJw22goH7zKggVjnNqiEf5hKQu/7+Ltb
	h9U1VmAG26j0c+h3qd+qnK369qw4FVgC09uTQRZHIaIzpgXjcLyLA4rHdxxpGLqZUKUc
	b9og==
X-Gm-Message-State: APjAAAUp/C3Tbv0rYrNWceFX0SN0RsPwAFhmbPSNDahgwm7hUYY4lbRR
	uOI8Fpv1l4ZTx3Dd4MwKyCJhPLwf+qU=
X-Google-Smtp-Source: APXvYqyZRxi8VZeKTkI/tQ0j1mk1MLNvHKsrubwoQT/e71P6blfgo2BmBobgVj7/PZgF3mefbBiOKw==
X-Received: by 2002:ac2:5499:: with SMTP id t25mr4187394lfk.157.1574174612142; 
	Tue, 19 Nov 2019 06:43:32 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	143sm7282503lfj.67.2019.11.19.06.43.31 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:43:31 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:43:30 +0200
Resent-Message-ID: <33267d60-746f-c528-dfd5-5b1b54608a7b@arrikto.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
References: <alpine.LRH.2.02.1911121057490.12815@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <ab6fa08d-256a-1f8c-24dd-e5c23b3328bf@arrikto.com>
Date: Wed, 13 Nov 2019 11:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911121057490.12815@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: 5_pxhqgHOt6snEa4WnVsEQ-1
X-MC-Unique: 409ZOFLKNdOKDHodGKF7Tg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-rt-users@vger.kernel.org, Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de,
	Scott Wood <swood@redhat.com>
Subject: Re: [dm-devel] [PATCH RT 1/2 v2] dm-snapshot: fix crash with the
	realtime kernel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/12/19 6:09 PM, Mikulas Patocka wrote:
> Snapshot doesn't work with realtime kernels since the commit f79ae415b64c.
> hlist_bl is implemented as a raw spinlock and the code takes two non-raw
> spinlocks while holding hlist_bl (non-raw spinlocks are blocking mutexes
> in the realtime kernel).
> 
> We can't change hlist_bl to use non-raw spinlocks, this triggers warnings 
> in dentry lookup code, because the dentry lookup code uses hlist_bl while 
> holding a seqlock.
> 
> This patch fixes the problem by using non-raw spinlock 
> exception_table_lock instead of the hlist_bl lock.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: f79ae415b64c ("dm snapshot: Make exception tables scalable")
> 

Reviewed-by: Nikos Tsironis <ntsironis@arrikto.com>

> ---
>  drivers/md/dm-snap.c |   23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> Index: linux-2.6/drivers/md/dm-snap.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-snap.c	2019-11-12 16:44:36.000000000 +0100
> +++ linux-2.6/drivers/md/dm-snap.c	2019-11-12 17:01:46.000000000 +0100
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
> @@ -625,30 +629,46 @@ static uint32_t exception_hash(struct dm
>  
>  /* Lock to protect access to the completed and pending exception hash tables. */
>  struct dm_exception_table_lock {
> +#ifndef CONFIG_PREEMPT_RT_BASE
>  	struct hlist_bl_head *complete_slot;
>  	struct hlist_bl_head *pending_slot;
> +#else
> +	spinlock_t *lock;
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
> +#else
> +	lock->lock = &s->exception_table_lock;
> +#endif
>  }
>  
>  static void dm_exception_table_lock(struct dm_exception_table_lock *lock)
>  {
> +#ifndef CONFIG_PREEMPT_RT_BASE
>  	hlist_bl_lock(lock->complete_slot);
>  	hlist_bl_lock(lock->pending_slot);
> +#else
> +	spin_lock(lock->lock);
> +#endif
>  }
>  
>  static void dm_exception_table_unlock(struct dm_exception_table_lock *lock)
>  {
> +#ifndef CONFIG_PREEMPT_RT_BASE
>  	hlist_bl_unlock(lock->pending_slot);
>  	hlist_bl_unlock(lock->complete_slot);
> +#else
> +	spin_unlock(lock->lock);
> +#endif
>  }
>  
>  static int dm_exception_table_init(struct dm_exception_table *et,
> @@ -1318,6 +1338,9 @@ static int snapshot_ctr(struct dm_target
>  	s->first_merging_chunk = 0;
>  	s->num_merging_chunks = 0;
>  	bio_list_init(&s->bios_queued_during_merge);
> +#ifdef CONFIG_PREEMPT_RT_BASE
> +	spin_lock_init(&s->exception_table_lock);
> +#endif
>  
>  	/* Allocate hash table for COW data */
>  	if (init_hash_tables(s)) {
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

