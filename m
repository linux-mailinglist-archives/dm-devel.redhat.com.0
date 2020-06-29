Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AE50E20CD20
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 10:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593417842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ShQyVYZ4BO52aDvRf3/k5Wns7ywQ8VTGdejDh61v9uU=;
	b=Y6Czp9cHSBxyb8BjQQfryXcpK8tGG8aPhPAH8kNeoY9/MiJg5uqS+tQ60N+SMX6QR+bHvG
	CbkHIjkA1SqrYdfRkQAbQe545o0KW0WuEsNLI6frMux8ykd9VywGXZ+zUGTowxp1ojdJb6
	GmVmlEvE5NbaSek3tLU+v2qzDcO6lbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-ITLILRlsP82-0QhkoDFN3Q-1; Mon, 29 Jun 2020 04:03:23 -0400
X-MC-Unique: ITLILRlsP82-0QhkoDFN3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9B018FE86A;
	Mon, 29 Jun 2020 08:03:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E27C798FE0;
	Mon, 29 Jun 2020 08:03:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D8EB1809554;
	Mon, 29 Jun 2020 08:03:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T5FOkj019628 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 01:15:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56FB72017F10; Mon, 29 Jun 2020 05:15:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5304E20267F2
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 05:15:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33748101A525
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 05:15:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-229-rXxnmAFzMFSled-Dz2_XHg-1;
	Mon, 29 Jun 2020 01:15:17 -0400
X-MC-Unique: rXxnmAFzMFSled-Dz2_XHg-1
Received: from kernel.org (unknown [87.71.40.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3FEEC2311E;
	Mon, 29 Jun 2020 05:08:55 +0000 (UTC)
Date: Mon, 29 Jun 2020 08:08:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200629050851.GC1492837@kernel.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-7-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 04:02:53 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 25, 2020 at 12:31:22PM +0100, Matthew Wilcox (Oracle) wrote:
> Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> guarantees we will not sleep to reclaim memory.  Use it to simplify
> dm-bufio's allocations.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  drivers/md/dm-bufio.c    | 30 ++++++++----------------------
>  include/linux/sched.h    |  1 +
>  include/linux/sched/mm.h | 12 ++++++++----
>  3 files changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index 6d1565021d74..140ada9a2c8f 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -412,23 +412,6 @@ static void *alloc_buffer_data(struct dm_bufio_client *c, gfp_t gfp_mask,
>  
>  	*data_mode = DATA_MODE_VMALLOC;
>  
> -	/*
> -	 * __vmalloc allocates the data pages and auxiliary structures with
> -	 * gfp_flags that were specified, but pagetables are always allocated
> -	 * with GFP_KERNEL, no matter what was specified as gfp_mask.
> -	 *
> -	 * Consequently, we must set per-process flag PF_MEMALLOC_NOIO so that
> -	 * all allocations done by this process (including pagetables) are done
> -	 * as if GFP_NOIO was specified.
> -	 */
> -	if (gfp_mask & __GFP_NORETRY) {
> -		unsigned noio_flag = memalloc_noio_save();
> -		void *ptr = __vmalloc(c->block_size, gfp_mask);
> -
> -		memalloc_noio_restore(noio_flag);
> -		return ptr;
> -	}
> -
>  	return __vmalloc(c->block_size, gfp_mask);
>  }
>  
> @@ -866,9 +849,6 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
>  	 * dm-bufio is resistant to allocation failures (it just keeps
>  	 * one buffer reserved in cases all the allocations fail).
>  	 * So set flags to not try too hard:
> -	 *	GFP_NOWAIT: don't wait; if we need to sleep we'll release our
> -	 *		    mutex and wait ourselves.
> -	 *	__GFP_NORETRY: don't retry and rather return failure
>  	 *	__GFP_NOMEMALLOC: don't use emergency reserves
>  	 *	__GFP_NOWARN: don't print a warning in case of failure
>  	 *
> @@ -877,7 +857,9 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
>  	 */
>  	while (1) {
>  		if (dm_bufio_cache_size_latch != 1) {
> -			b = alloc_buffer(c, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +			unsigned nowait_flag = memalloc_nowait_save();
> +			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +			memalloc_nowait_restore(nowait_flag);
>  			if (b)
>  				return b;
>  		}
> @@ -886,8 +868,12 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
>  			return NULL;
>  
>  		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
> +			unsigned noio_flag;
> +
>  			dm_bufio_unlock(c);
> -			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
> +			noio_flag = memalloc_noio_save();

I've read the series twice and I'm still missing the definition of
memalloc_noio_save().

And also it would be nice to have a paragraph about it in
Documentation/core-api/memory-allocation.rst

> +			b = alloc_buffer(c, GFP_KERNEL |
> __GFP_NOMEMALLOC | __GFP_NOWARN); +
> memalloc_noio_restore(noio_flag); dm_bufio_lock(c); if (b)
>  				return b;
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 90336850e940..b1c2cddd366c 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -803,6 +803,7 @@ struct task_struct {
>  #endif
>  	unsigned			memalloc_noio:1;
>  	unsigned			memalloc_nofs:1;
> +	unsigned			memalloc_nowait:1;
>  	unsigned			memalloc_nocma:1;
>  
>  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 6f7b59a848a6..6484569f50df 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -179,12 +179,16 @@ static inline bool in_vfork(struct task_struct *tsk)
>  static inline gfp_t current_gfp_context(gfp_t flags)
>  {
>  	if (unlikely(current->memalloc_noio || current->memalloc_nofs ||
> -		     current->memalloc_nocma)) {
> +		     current->memalloc_nocma) || current->memalloc_nowait) {
>  		/*
> -		 * NOIO implies both NOIO and NOFS and it is a weaker context
> -		 * so always make sure it makes precedence
> +		 * Clearing DIRECT_RECLAIM means we won't get to the point
> +		 * of testing IO or FS, so we don't need to bother clearing
> +		 * them.  noio implies neither IO nor FS and it is a weaker
> +		 * context so always make sure it takes precedence.
>  		 */
> -		if (current->memalloc_noio)
> +		if (current->memalloc_nowait)
> +			flags &= ~__GFP_DIRECT_RECLAIM;
> +		else if (current->memalloc_noio)
>  			flags &= ~(__GFP_IO | __GFP_FS);
>  		else if (current->memalloc_nofs)
>  			flags &= ~__GFP_FS;
> -- 
> 2.27.0
> 
> 

-- 
Sincerely yours,
Mike.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

