Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D698120A014
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 15:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593092130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z3IdVApRdWSilNh2WfQiY2G0ODuQ3Y/GuArSjntAGNA=;
	b=NYuZ1nJsrRqxVensAeSRlc0q1jQRBJepdIHQ8nvVHaon+EhrSHuhwPVFXp6mjR4sVHjstU
	vBRH28AOCAVnfJmcJVFKp4dmW9svEnqxaw7fnbPKbcyZ9rrAJcKMAqLLz6W6WB+xB8gSzM
	/JHTbYZlRnNmBMGYDywQ/Q3QGIeEbkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-k7LlFZpdPgG348uCyqGmGA-1; Thu, 25 Jun 2020 09:35:28 -0400
X-MC-Unique: k7LlFZpdPgG348uCyqGmGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6184A464;
	Thu, 25 Jun 2020 13:35:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B2675D9C5;
	Thu, 25 Jun 2020 13:35:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61BEC87582;
	Thu, 25 Jun 2020 13:35:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PDZGsj001575 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B0902144B4A; Thu, 25 Jun 2020 13:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A26A2144B39
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:35:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69C38001E1
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:35:13 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-b_ZAV1vHOCOftxg_CtjJjQ-1; Thu, 25 Jun 2020 09:35:06 -0400
X-MC-Unique: b_ZAV1vHOCOftxg_CtjJjQ-1
Received: by mail-wr1-f68.google.com with SMTP id b6so5843946wrs.11;
	Thu, 25 Jun 2020 06:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=IgYZrPxHW1Yk3TwSNNUUSYdD36C5CbbVMe0vITplDXw=;
	b=fQDsJbS29OW+Tl7njxrutfArmaKIHYUTYzqIpVMfztUyLxy43mlXG30kdjZx7jTE5L
	Dyv3UhAK2SuzhjqhX1nXbZ7mQk6DzCxwMsc6T/dDY2N2BQU64saNaq1Dan7jB28jvImk
	kqXorC9zB26diSx4PJWqjXgxVFiMgZFcvmpvEeRUXeOq9zaZBfM2eOoS/CJFgsD0Mx5s
	7F7fbrElgjUPZcFwE05Y++3Kt6a8vo7mhQp5DxpvnsJckk4H/1SOMJWU1GG2BAKzYl+6
	yW7zH5yk0ceq+xDnzXWSg8GtC3CA8VP1YmdY8VZznfTMbIR0UdmHAXnoCwXyZna12kp5
	53IA==
X-Gm-Message-State: AOAM532GONeDg06ujmT3hxQ1fMb/eCQO4QEfE4nWGMySttaYUwlwJGxu
	rImTkL27hSEh5homqMsp2BQ=
X-Google-Smtp-Source: ABdhPJwaddI6ttW180z9XolsU5F/8EUo6u4oLwe5Z7g00mWKYqqFcDJ9Z0yPcz+5CvQGbwEE1bpQkg==
X-Received: by 2002:a05:6000:18c:: with SMTP id
	p12mr39132209wrx.66.1593092105200; 
	Thu, 25 Jun 2020 06:35:05 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	c143sm14010709wmd.1.2020.06.25.06.35.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 06:35:04 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:35:03 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200625133503.GO1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-5-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-5-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/6] mm: Replace PF_MEMALLOC_NOFS with
	memalloc_nofs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 12:31:20, Matthew Wilcox wrote:
> We're short on PF_* flags, so make memalloc_nofs its own bit where we
> have plenty of space.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

forgot to add
Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  fs/iomap/buffered-io.c   |  2 +-
>  include/linux/sched.h    |  2 +-
>  include/linux/sched/mm.h | 13 ++++++-------
>  3 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index bcfc288dba3f..87d66c13bf5c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1502,7 +1502,7 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
>  	 * Given that we do not allow direct reclaim to call us, we should
>  	 * never be called in a recursive filesystem reclaim context.
>  	 */
> -	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> +	if (WARN_ON_ONCE(current->memalloc_nofs))
>  		goto redirty;
>  
>  	/*
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cf18a3d2bc4c..eaf36ae1fde2 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -802,6 +802,7 @@ struct task_struct {
>  	unsigned			in_memstall:1;
>  #endif
>  	unsigned			memalloc_noio:1;
> +	unsigned			memalloc_nofs:1;
>  
>  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
>  
> @@ -1505,7 +1506,6 @@ extern struct pid *cad_pid;
>  #define PF_NOFREEZE		0x00008000	/* This thread should not be frozen */
>  #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
>  #define PF_KSWAPD		0x00020000	/* I am kswapd */
> -#define PF_MEMALLOC_NOFS	0x00040000	/* All allocation requests will inherit GFP_NOFS */
>  #define PF_LOCAL_THROTTLE	0x00100000	/* Throttle writes only against the bdi I write to,
>  						 * I am cleaning dirty pages from some other bdi. */
>  #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index b0089eadc367..08bc9d0606a8 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -175,20 +175,19 @@ static inline bool in_vfork(struct task_struct *tsk)
>  
>  /*
>   * Applies per-task gfp context to the given allocation flags.
> - * PF_MEMALLOC_NOFS implies GFP_NOFS
>   * PF_MEMALLOC_NOCMA implies no allocation from CMA region.
>   */
>  static inline gfp_t current_gfp_context(gfp_t flags)
>  {
> -	if (unlikely(current->flags & (PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA) ||
> -		     current->memalloc_noio)) {
> +	if (unlikely((current->flags & PF_MEMALLOC_NOCMA) ||
> +		     current->memalloc_noio || current->memalloc_nofs)) {
>  		/*
>  		 * NOIO implies both NOIO and NOFS and it is a weaker context
>  		 * so always make sure it makes precedence
>  		 */
>  		if (current->memalloc_noio)
>  			flags &= ~(__GFP_IO | __GFP_FS);
> -		else if (current->flags & PF_MEMALLOC_NOFS)
> +		else if (current->memalloc_nofs)
>  			flags &= ~__GFP_FS;
>  #ifdef CONFIG_CMA
>  		if (current->flags & PF_MEMALLOC_NOCMA)
> @@ -254,8 +253,8 @@ static inline void memalloc_noio_restore(unsigned int flags)
>   */
>  static inline unsigned int memalloc_nofs_save(void)
>  {
> -	unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
> -	current->flags |= PF_MEMALLOC_NOFS;
> +	unsigned int flags = current->memalloc_nofs;
> +	current->memalloc_nofs = 1;
>  	return flags;
>  }
>  
> @@ -269,7 +268,7 @@ static inline unsigned int memalloc_nofs_save(void)
>   */
>  static inline void memalloc_nofs_restore(unsigned int flags)
>  {
> -	current->flags = (current->flags & ~PF_MEMALLOC_NOFS) | flags;
> +	current->memalloc_nofs = flags ? 1 : 0;
>  }
>  
>  static inline unsigned int memalloc_noreclaim_save(void)
> -- 
> 2.27.0

-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

