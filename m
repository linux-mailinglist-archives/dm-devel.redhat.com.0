Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2A5F69FF
	for <lists+dm-devel@lfdr.de>; Thu,  6 Oct 2022 16:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665067660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JuGn2y1vDTLqBg+Q7+v5/B9cJIPqyNRmEPNKu5pcO1w=;
	b=SHFvmsQ04qV/yFscNCwZ9WnYlw6jvPK7t5wcoxP/punVPKRNL9m0n3ZQSYWY6By7Dl2XLb
	lN3Xzji32RZQTiBrq0HLHqhPsatGbNnW9kjN6cNJGNzu4/t5xkz3XwcJYTKqanfnRy0Uki
	fDVlhWIJDRk5eFU0oz9KsBhRL3r9jiY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-iqhrCfvEM7mKyrEhG9AHcw-1; Thu, 06 Oct 2022 10:47:39 -0400
X-MC-Unique: iqhrCfvEM7mKyrEhG9AHcw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 900B53C0F428;
	Thu,  6 Oct 2022 14:47:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94093403167;
	Thu,  6 Oct 2022 14:47:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ED9F319465B2;
	Thu,  6 Oct 2022 14:47:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0DF081946588
 for <dm-devel@listman.corp.redhat.com>; Thu,  6 Oct 2022 14:47:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4CC7200D8C3; Thu,  6 Oct 2022 14:47:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD782200D8C0
 for <dm-devel@redhat.com>; Thu,  6 Oct 2022 14:47:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF953C0F435
 for <dm-devel@redhat.com>; Thu,  6 Oct 2022 14:47:26 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-6BnZGh-aPomdzx8dZMgyDw-1; Thu, 06 Oct 2022 10:47:23 -0400
X-MC-Unique: 6BnZGh-aPomdzx8dZMgyDw-1
Received: by mail-qv1-f72.google.com with SMTP id
 kr13-20020a0562142b8d00b004b1d5953a2cso1234049qvb.3
 for <dm-devel@redhat.com>; Thu, 06 Oct 2022 07:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7KJVCGDP1E6PHwh3K1PS2Vq1v9Vxn8/icFx8u9Ndy0=;
 b=D5/o5M5GAcp3uUSdtPQFdMJYrzP22p3Bv9zxv6Cu9zMEz4WahJtEdIrMfogIy1It5U
 ibXo26HBGRLuU7PAL1DsE8TzpXNbw4bsyaCQVIYWZpZ6nt4LcqVTw30phds61baOVVMU
 JcP9tcJdeva4gIij6gC+MekK5egFTJWKG5Nmysq5HGEkzK9oWZFcbcnYverMP3UuYZo+
 +MXomJj2u2x8qTgpDlHPqPeTCp/XhrV5ftnBaYw5tJhdKObST5U1t3Q3CKRSWKI9VkXw
 TzMmZtChXLW4ALc113PfuWdAiJIgkOzqT/mu+cbPktBfS6xVoIvf+fPGIcqZMhPkjgyO
 GIAQ==
X-Gm-Message-State: ACrzQf1GMm35a/4+tAu+Xa1/2K8gCKSHbduYyshfYdi0Ni1aILwXOupH
 g16zth/6jIjNVBAP/mygirUhCUkCwD68c8QcTUuT/D8h3GeBRDIMQsUmT1NzRPI3FkcU4K77GZZ
 pnWW11AvlrqgLRGU=
X-Received: by 2002:a05:6214:242a:b0:4aa:9c94:5d77 with SMTP id
 gy10-20020a056214242a00b004aa9c945d77mr83382qvb.99.1665067642952; 
 Thu, 06 Oct 2022 07:47:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OOQ87tnoM4g+nsxhTviTOUzCc0wFPb5JS+fAFspnuAaAOWqj1mCTZjwNgGex0q2mmvO7zGg==
X-Received: by 2002:a05:6214:242a:b0:4aa:9c94:5d77 with SMTP id
 gy10-20020a056214242a00b004aa9c945d77mr83348qvb.99.1665067642543; 
 Thu, 06 Oct 2022 07:47:22 -0700 (PDT)
Received: from bfoster (c-24-61-119-116.hsd1.ma.comcast.net. [24.61.119.116])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05620a244600b006d94c499d8fsm5500940qkn.50.2022.10.06.07.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 07:47:22 -0700 (PDT)
Date: Thu, 6 Oct 2022 10:47:20 -0400
From: Brian Foster <bfoster@redhat.com>
To: Yang Shi <shy828301@gmail.com>
Message-ID: <Yz7qeI0s6TjSEIFe@bfoster>
References: <20221005180341.1738796-1-shy828301@gmail.com>
 <20221005180341.1738796-3-shy828301@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221005180341.1738796-3-shy828301@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 2/4] mm: mempool: introduce page bulk
 allocator
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 akpm@linux-foundation.org, mgorman@techsingularity.net, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 05, 2022 at 11:03:39AM -0700, Yang Shi wrote:
> Since v5.13 the page bulk allocator was introduced to allocate order-0
> pages in bulk.  There are a few mempool allocator callers which does
> order-0 page allocation in a loop, for example, dm-crypt, f2fs compress,
> etc.  A mempool page bulk allocator seems useful.  So introduce the
> mempool page bulk allocator.
> 
> It introduces the below APIs:
>   - mempool_init_pages_bulk()
>   - mempool_create_pages_bulk()
> They initialize the mempool for page bulk allocator.  The pool is filled
> by alloc_page() in a loop.
> 
>   - mempool_alloc_pages_bulk_list()
>   - mempool_alloc_pages_bulk_array()
> They do bulk allocation from mempool.
> They do the below conceptually:
>   1. Call bulk page allocator
>   2. If the allocation is fulfilled then return otherwise try to
>      allocate the remaining pages from the mempool
>   3. If it is fulfilled then return otherwise retry from #1 with sleepable
>      gfp
>   4. If it is still failed, sleep for a while to wait for the mempool is
>      refilled, then retry from #1
> The populated pages will stay on the list or array until the callers
> consume them or free them.
> Since mempool allocator is guaranteed to success in the sleepable context,
> so the two APIs return true for success or false for fail.  It is the
> caller's responsibility to handle failure case (partial allocation), just
> like the page bulk allocator.
> 
> The mempool typically is an object agnostic allocator, but bulk allocation
> is only supported by pages, so the mempool bulk allocator is for page
> allocation only as well.
> 
> Signed-off-by: Yang Shi <shy828301@gmail.com>
> ---

Hi Yang,

I'm not terribly familiar with either component so I'm probably missing
context/details, but just a couple high level thoughts when reading your
patches...

>  include/linux/mempool.h |  19 ++++
>  mm/mempool.c            | 188 +++++++++++++++++++++++++++++++++++++---
>  2 files changed, 197 insertions(+), 10 deletions(-)
> 
...
> diff --git a/mm/mempool.c b/mm/mempool.c
> index ba32151f3843..7711ca2e6d66 100644
> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -177,6 +177,7 @@ void mempool_destroy(mempool_t *pool)
>  EXPORT_SYMBOL(mempool_destroy);
>  
>  static inline int __mempool_init(mempool_t *pool, int min_nr,
> +				 mempool_alloc_pages_bulk_t *alloc_pages_bulk_fn,
>  				 mempool_alloc_t *alloc_fn,
>  				 mempool_free_t *free_fn, void *pool_data,
>  				 gfp_t gfp_mask, int node_id)
> @@ -186,8 +187,11 @@ static inline int __mempool_init(mempool_t *pool, int min_nr,
>  	pool->pool_data = pool_data;
>  	pool->alloc	= alloc_fn;
>  	pool->free	= free_fn;
> +	pool->alloc_pages_bulk = alloc_pages_bulk_fn;
>  	init_waitqueue_head(&pool->wait);
>  
> +	WARN_ON_ONCE(alloc_pages_bulk_fn && alloc_fn);
> +
>  	pool->elements = kmalloc_array_node(min_nr, sizeof(void *),
>  					    gfp_mask, node_id);
>  	if (!pool->elements)
> @@ -199,7 +203,10 @@ static inline int __mempool_init(mempool_t *pool, int min_nr,
>  	while (pool->curr_nr < pool->min_nr) {
>  		void *element;
>  
> -		element = pool->alloc(gfp_mask, pool->pool_data);
> +		if (pool->alloc_pages_bulk)
> +			element = alloc_page(gfp_mask);

Any reason to not use the callback from the caller for the bulk variant
here? It looks like some users might expect consistency between the
alloc / free callbacks for the pool. I.e., I'm not familiar with
dm-crypt, but the code modified in the subsequent patches looks like it
keeps an allocated page count. Will that still work with this, assuming
these pages are freed through free_fn?

> +		else
> +			element = pool->alloc(gfp_mask, pool->pool_data);
>  		if (unlikely(!element)) {
>  			mempool_exit(pool);
>  			return -ENOMEM;
...
> @@ -457,6 +499,132 @@ void *mempool_alloc(mempool_t *pool, gfp_t gfp_mask)
>  }
>  EXPORT_SYMBOL(mempool_alloc);
>  
> +/**
> + * mempool_alloc_pages_bulk - allocate a bulk of pagesfrom a specific
> + *                           memory pool
> + * @pool:       pointer to the memory pool which was allocated via
> + *              mempool_create().
> + * @gfp_mask:   the usual allocation bitmask.
> + * @nr:         the number of requested pages.
> + * @page_list:  the list the pages will be added to.
> + * @page_array: the array the pages will be added to.
> + *
> + * this function only sleeps if the alloc_pages_bulk_fn() function sleeps
> + * or the allocation can not be satisfied even though the mempool is depleted.
> + * Note that due to preallocation, this function *never* fails when called
> + * from process contexts. (it might fail if called from an IRQ context.)
> + * Note: using __GFP_ZERO is not supported.  And the caller should not pass
> + * in both valid page_list and page_array.
> + *
> + * Return: true when nr pages are allocated or false if not.  It is the
> + *         caller's responsibility to free the partial allocated pages.
> + */
> +static bool mempool_alloc_pages_bulk(mempool_t *pool, gfp_t gfp_mask,
> +				     unsigned int nr,
> +				     struct list_head *page_list,
> +				     struct page **page_array)
> +{
> +	unsigned long flags;
> +	wait_queue_entry_t wait;
> +	gfp_t gfp_temp;
> +	int i;
> +	unsigned int ret, nr_remaining;
> +	struct page *page;
> +

This looks like a lot of duplicate boilerplate from mempool_alloc().
Could this instead do something like: rename the former to
__mempool_alloc() and add a count parameter, implement bulk alloc
support in there for count > 1, then let traditional (i.e., non-bulk)
mempool_alloc() callers pass a count of 1?

Along the same lines, I also wonder if there's any value in generic bulk
alloc support for mempool. For example, I suppose technically this could
be implemented via one change to support a pool->alloc_bulk() callback
that any user could implement via a loop if they wanted
mempool_alloc_bulk() support backed by a preallocated pool. The page
based user could then just use that to call alloc_pages_bulk_*() as an
optimization without the mempool layer needing to know or care about
whether the underlying elements are pages or not. Hm?

Brian

> +	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
> +	might_alloc(gfp_mask);
> +
> +	gfp_mask |= __GFP_NOMEMALLOC;   /* don't allocate emergency reserves */
> +	gfp_mask |= __GFP_NORETRY;      /* don't loop in __alloc_pages */
> +	gfp_mask |= __GFP_NOWARN;       /* failures are OK */
> +
> +	gfp_temp = gfp_mask & ~(__GFP_DIRECT_RECLAIM|__GFP_IO);
> +
> +repeat_alloc:
> +	i = 0;
> +	ret = pool->alloc_pages_bulk(gfp_temp, nr, pool->pool_data, page_list,
> +				     page_array);
> +
> +	if (ret == nr)
> +		return true;
> +
> +	nr_remaining = nr - ret;
> +
> +	spin_lock_irqsave(&pool->lock, flags);
> +	/* Allocate page from the pool and add to the list or array */
> +	while (pool->curr_nr && (nr_remaining > 0)) {
> +		page = remove_element(pool);
> +		spin_unlock_irqrestore(&pool->lock, flags);
> +		smp_wmb();
> +
> +		kmemleak_update_trace((void *)page);
> +
> +		if (page_list)
> +			list_add(&page->lru, page_list);
> +		else
> +			page_array[ret + i] = page;
> +
> +		i++;
> +		nr_remaining--;
> +
> +		spin_lock_irqsave(&pool->lock, flags);
> +	}
> +
> +	spin_unlock_irqrestore(&pool->lock, flags);
> +
> +	if (!nr_remaining)
> +		return true;
> +
> +	/*
> +	 * The bulk allocator counts in the populated pages for array,
> +	 * but don't do it for list.
> +	 */
> +	if (page_list)
> +		nr = nr_remaining;
> +
> +	/*
> +	 * We use gfp mask w/o direct reclaim or IO for the first round.  If
> +	 * alloc failed with that and @pool was empty, retry immediately.
> +	 */
> +	if (gfp_temp != gfp_mask) {
> +		gfp_temp = gfp_mask;
> +		goto repeat_alloc;
> +	}
> +
> +	/* We must not sleep if !__GFP_DIRECT_RECLAIM */
> +	if (!(gfp_mask & __GFP_DIRECT_RECLAIM))
> +		return false;
> +
> +	/* Let's wait for someone else to return an element to @pool */
> +	init_wait(&wait);
> +	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
> +
> +	/*
> +	 * FIXME: this should be io_schedule().  The timeout is there as a
> +	 * workaround for some DM problems in 2.6.18.
> +	 */
> +	io_schedule_timeout(5*HZ);
> +
> +	finish_wait(&pool->wait, &wait);
> +	goto repeat_alloc;
> +}
> +
> +bool mempool_alloc_pages_bulk_list(mempool_t *pool, gfp_t gfp_mask,
> +				   unsigned int nr,
> +				   struct list_head *page_list)
> +{
> +	return mempool_alloc_pages_bulk(pool, gfp_mask, nr, page_list, NULL);
> +}
> +EXPORT_SYMBOL(mempool_alloc_pages_bulk_list);
> +
> +bool mempool_alloc_pages_bulk_array(mempool_t *pool, gfp_t gfp_mask,
> +				    unsigned int nr,
> +				    struct page **page_array)
> +{
> +	return mempool_alloc_pages_bulk(pool, gfp_mask, nr, NULL, page_array);
> +}
> +EXPORT_SYMBOL(mempool_alloc_pages_bulk_array);
> +
>  /**
>   * mempool_free - return an element to the pool.
>   * @element:   pool element pointer.
> -- 
> 2.26.3
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

