Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 281533E82ED
	for <lists+dm-devel@lfdr.de>; Tue, 10 Aug 2021 20:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628619756;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RqyKNNoXQ8Jk6wae47Jt44s/XUoGGYSyXM7Y8Ga5YRg=;
	b=Nsrgy/BZw4uE3nzZ+JiE2jtj+zf8Bxu3Y1pPb8s12PCnaH85Ht4DWaAhsmnBBbWHBZ6DpX
	6lL06BZ/b8hghwBpibUUdeLvbk1Xbq3RNIvBDX2khn+D3q05lsbzdAlXrNlmAQaRRwKfuX
	MBzOiSAP62d9kke4TCtiQCdLK+tb6Bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-lqeALovNPTes2WZYL1hY2Q-1; Tue, 10 Aug 2021 14:22:34 -0400
X-MC-Unique: lqeALovNPTes2WZYL1hY2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A77E801AEB;
	Tue, 10 Aug 2021 18:22:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E846E1816A;
	Tue, 10 Aug 2021 18:22:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C48044BB7C;
	Tue, 10 Aug 2021 18:22:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17AILMcA030572 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 14:21:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9A4F100EB3D; Tue, 10 Aug 2021 18:21:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0E310372CC;
	Tue, 10 Aug 2021 18:21:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 17AILEuL026650; Tue, 10 Aug 2021 14:21:14 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 17AILDmZ026646; Tue, 10 Aug 2021 14:21:13 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 10 Aug 2021 14:21:13 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Arne Welzel <arne.welzel@corelight.com>
In-Reply-To: <20210808134205.1981531-1-arne.welzel@corelight.com>
Message-ID: <alpine.LRH.2.02.2108101420250.26585@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210808134205.1981531-1-arne.welzel@corelight.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-crypt@saout.de, dm-devel@redhat.com, DJ Gregor <dj@corelight.com>,
	agk@redhat.com, snitzer@redhat.com
Subject: Re: [dm-devel] [PATCH] dm crypt: Avoid percpu_counter spinlock
 contention in crypt_page_alloc()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>


On Sun, 8 Aug 2021, Arne Welzel wrote:

> On many core systems using dm-crypt, heavy spinlock contention in
> percpu_counter_compare() can be observed when the dmcrypt page allocation
> limit for a given device is reached or close to be reached. This is due
> to percpu_counter_compare() taking a spinlock to compute an exact
> result on potentially many CPUs at the same time.
> 
> Switch to non-exact comparison of allocated and allowed pages by using
> the value returned by percpu_counter_read_positive().
> 
> This may over/under estimate the actual number of allocated pages by at
> most (batch-1) * num_online_cpus() (assuming my understanding of the
> percpu_counter logic is proper).
> 
> Currently, batch is bounded by 32. The system on which this issue was
> first observed has 256 CPUs and 512G of RAM. With a 4k page size, this
> change may over/under estimate by 31MB. With ~10G (2%) allowed for dmcrypt
> allocations, this seems an acceptable error. Certainly preferred over
> running into the spinlock contention.
> 
> This behavior was separately/artificially reproduced on an EC2 c5.24xlarge
> instance system with 96 CPUs and 192GB RAM as follows, but can be
> provokes on systems with less available CPUs.
> 
>  * Disable swap
>  * Tune vm settings to promote regular writeback
>      $ echo 50 > /proc/sys/vm/dirty_expire_centisecs
>      $ echo 25 > /proc/sys/vm/dirty_writeback_centisecs
>      $ echo $((128 * 1024 * 1024)) > /proc/sys/vm/dirty_background_bytes
> 
>  * Create 8 dmcrypt devices based on files on a tmpfs
>  * Create and mount an ext4 filesystem on each crypt devices
>  * Run stress-ng --hdd 8 within one of above filesystems
> 
> Total %system usage shown via sysstat goes to ~35%, write througput on the
> underlying loop device is ~2GB/s. perf profiling an individual kworker
> kcryptd thread shows the following in the profile, indicating it hits
> heavy spinlock contention in percpu_counter_compare():
> 
>     99.98%     0.00%  kworker/u193:46  [kernel.kallsyms]  [k] ret_from_fork
>             |
>             ---ret_from_fork
>                kthread
>                worker_thread
>                |
>                 --99.92%--process_one_work
>                           |
>                           |--80.52%--kcryptd_crypt
>                           |          |
>                           |          |--62.58%--mempool_alloc
>                           |          |          |
>                           |          |           --62.24%--crypt_page_alloc
>                           |          |                     |
>                           |          |                      --61.51%--__percpu_counter_compare
>                           |          |                                |
>                           |          |                                 --61.34%--__percpu_counter_sum
>                           |          |                                           |
>                           |          |                                           |--58.68%--_raw_spin_lock_irqsave
>                           |          |                                           |          |
>                           |          |                                           |           --58.30%--native_queued_spin_lock_slowpath
>                           |          |                                           |
>                           |          |                                            --0.69%--cpumask_next
>                           |          |                                                      |
>                           |          |                                                       --0.51%--_find_next_bit
>                           |          |
>                           |          |--10.61%--crypt_convert
>                           |          |          |
>                           |          |          |--6.05%--xts_crypt
>                           ...
> 
> After apply this change, %system usage is lowered to ~7% and
> write throughput on the loopback interface increases to 2.7GB/s.
> The profile shows mempool_alloc() as ~8% rather than ~62% in the
> profile and not hitting the percpu_counter() spinlock anymore.
> 
>     |--8.15%--mempool_alloc
>     |          |
>     |          |--3.93%--crypt_page_alloc
>     |          |          |
>     |          |           --3.75%--__alloc_pages
>     |          |                     |
>     |          |                      --3.62%--get_page_from_freelist
>     |          |                                |
>     |          |                                 --3.22%--rmqueue_bulk
>     |          |                                           |
>     |          |                                            --2.59%--_raw_spin_lock
>     |                                                      |
>     |          |                                                       --2.57%--native_queued_spin_lock_slowpath
>     |          |
>     |           --3.05%--_raw_spin_lock_irqsave
>     |                     |
>     |                      --2.49%--native_queued_spin_lock_slowpath
> 
> Suggested-by: DJ Gregor <dj@corelight.com>
> Signed-off-by: Arne Welzel <arne.welzel@corelight.com>
> ---
>  drivers/md/dm-crypt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 50f4cbd600d5..2ae481610f12 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -2661,7 +2661,12 @@ static void *crypt_page_alloc(gfp_t gfp_mask, void *pool_data)
>  	struct crypt_config *cc = pool_data;
>  	struct page *page;
>  
> -	if (unlikely(percpu_counter_compare(&cc->n_allocated_pages, dm_crypt_pages_per_client) >= 0) &&
> +	/*
> +	 * Note, percpu_counter_read_positive() may over (and under) estimate
> +	 * the current usage by at most (batch - 1) * num_online_cpus() pages,
> +	 * but avoids potential spinlock contention of an exact result.
> +	 */
> +	if (unlikely(percpu_counter_read_positive(&cc->n_allocated_pages) > dm_crypt_pages_per_client) &&
>  	    likely(gfp_mask & __GFP_NORETRY))
>  		return NULL;
>  
> -- 
> 2.20.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

