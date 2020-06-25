Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D6889209E64
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 14:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593087814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/vF4prrfOSq7GcBBMSYPIOw8Oi6YE0CWAHk6lDHwaFw=;
	b=QseZ0faw+h00kBlTK9WqUfxsp49VBDBcIPr+AKpIJOSobkmDn+q25b8f47fFmg93MJkLQH
	XGywlP7I56svzulJWCiHS4jBfo6in8xHM1a5qHod+/hXUDv/TuJOqeLmWYG8dNxhtoMY+S
	vyzXx+psbqVO/bwna7AzkSE2fi9Xiuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-acAOkAibP1Ce4kM5cgK2Ig-1; Thu, 25 Jun 2020 08:23:32 -0400
X-MC-Unique: acAOkAibP1Ce4kM5cgK2Ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B96106C010;
	Thu, 25 Jun 2020 12:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF4722B476;
	Thu, 25 Jun 2020 12:23:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8296C87592;
	Thu, 25 Jun 2020 12:23:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PCMpQr027315 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 08:22:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3726C2144B35; Thu, 25 Jun 2020 12:22:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DAE2144B37
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:22:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E87EF18A6660
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:22:47 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-moWkEq1wPWC7WxGtKUYafA-1; Thu, 25 Jun 2020 08:22:43 -0400
X-MC-Unique: moWkEq1wPWC7WxGtKUYafA-1
Received: by mail-ej1-f68.google.com with SMTP id a1so5697599ejg.12;
	Thu, 25 Jun 2020 05:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=TYH8Ej/PPMwtZMk1atQ1DDjN+0+NMiukCpyuH/l8Kqo=;
	b=MQ0TqPH/r5KhlHVVCcLeo8ezdzvsVdCoTz0y49JnPAKALFguVMGgFnjIpwp19o7vN9
	rPX+wiIRE0XwsX4gxJsH5JQBGO3gD9f9HbnNgj/Yjdk59EScmcjDrulmDbVZrAc9TtOk
	f6LboMGwIYLy9dZ7LKTGow0uEjDHGwWuvPSzflMbuCmNNbF6WlAhsORa6PPZIO8h0X73
	Y11FJ42yYoJ+Fpr/mPT9VvoNiD6xjuwDJwvMKbsEKxQyadKwvMU7EV1Dq/vJOYPHLRHl
	Xjf+eCpYlCX6CDQ1LxheV4qbtWn+hsOrKl819FKNG09iBIDC62hPhYe08nM6UmJPm2RK
	qxlg==
X-Gm-Message-State: AOAM530Vb8gCPjSnYqjrlMgqH+j2bQ5wPIYqpxDDLx4Ge0bXcIG6WyNG
	AucvZE5WZ0iwqHEtWX/zasqt81GK
X-Google-Smtp-Source: ABdhPJxee0+FCUz90KDfNPrGix/+3ufKfv7M9wy1KKSns79yzVg+Jz95sa5CdEjBwCDMijHTFZfU3g==
X-Received: by 2002:a17:906:7e04:: with SMTP id
	e4mr20722062ejr.502.1593087762175; 
	Thu, 25 Jun 2020 05:22:42 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	l18sm17858417eds.46.2020.06.25.05.22.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 05:22:41 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:22:39 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200625122239.GJ1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-2-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-2-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/6] mm: Replace PF_MEMALLOC_NOIO with
	memalloc_noio
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 25-06-20 12:31:17, Matthew Wilcox wrote:
> We're short on PF_* flags, so make memalloc_noio its own bit where we
> have plenty of space.

I do not mind moving that outside of the PF_* space. Unless I
misremember all flags in this space were intented to be set only on the
current which rules out any RMW races and therefore they can be
lockless. I am not sure this holds for the bitfield you are adding this
to. At least in_memstall seem to be set on external task as well. But
this would require double checking. Maybe that is not really intended or
just a bug.

> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  drivers/block/loop.c           |  3 ++-
>  drivers/md/dm-zoned-metadata.c |  5 ++---
>  include/linux/sched.h          |  2 +-
>  include/linux/sched/mm.h       | 30 +++++++++++++++++++++++-------
>  kernel/sys.c                   |  8 +++-----
>  5 files changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 475e1a738560..c8742e25e58a 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -52,6 +52,7 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/sched.h>
> +#include <linux/sched/mm.h>
>  #include <linux/fs.h>
>  #include <linux/file.h>
>  #include <linux/stat.h>
> @@ -929,7 +930,7 @@ static void loop_unprepare_queue(struct loop_device *lo)
>  
>  static int loop_kthread_worker_fn(void *worker_ptr)
>  {
> -	current->flags |= PF_LOCAL_THROTTLE | PF_MEMALLOC_NOIO;
> +	set_current_io_flusher();
>  	return kthread_worker_fn(worker_ptr);
>  }
>  
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 130b5a6d9f12..1c5ae674ba20 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1599,9 +1599,8 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  	/*
>  	 * Get zone information from disk. Since blkdev_report_zones() uses
> -	 * GFP_KERNEL by default for memory allocations, set the per-task
> -	 * PF_MEMALLOC_NOIO flag so that all allocations are done as if
> -	 * GFP_NOIO was specified.
> +	 * GFP_KERNEL by default for memory allocations, use
> +	 * memalloc_noio_save() to prevent recursion into the driver.
>  	 */
>  	noio_flag = memalloc_noio_save();
>  	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index b62e6aaf28f0..cf18a3d2bc4c 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -801,6 +801,7 @@ struct task_struct {
>  	/* Stalled due to lack of memory */
>  	unsigned			in_memstall:1;
>  #endif
> +	unsigned			memalloc_noio:1;
>  
>  	unsigned long			atomic_flags; /* Flags requiring atomic access. */
>  
> @@ -1505,7 +1506,6 @@ extern struct pid *cad_pid;
>  #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
>  #define PF_KSWAPD		0x00020000	/* I am kswapd */
>  #define PF_MEMALLOC_NOFS	0x00040000	/* All allocation requests will inherit GFP_NOFS */
> -#define PF_MEMALLOC_NOIO	0x00080000	/* All allocation requests will inherit GFP_NOIO */
>  #define PF_LOCAL_THROTTLE	0x00100000	/* Throttle writes only against the bdi I write to,
>  						 * I am cleaning dirty pages from some other bdi. */
>  #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 480a4d1b7dd8..1a7e1ab1be85 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -175,19 +175,18 @@ static inline bool in_vfork(struct task_struct *tsk)
>  
>  /*
>   * Applies per-task gfp context to the given allocation flags.
> - * PF_MEMALLOC_NOIO implies GFP_NOIO
>   * PF_MEMALLOC_NOFS implies GFP_NOFS
>   * PF_MEMALLOC_NOCMA implies no allocation from CMA region.
>   */
>  static inline gfp_t current_gfp_context(gfp_t flags)
>  {
> -	if (unlikely(current->flags &
> -		     (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA))) {
> +	if (unlikely(current->flags & (PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA) ||
> +		     current->memalloc_noio)) {
>  		/*
>  		 * NOIO implies both NOIO and NOFS and it is a weaker context
>  		 * so always make sure it makes precedence
>  		 */
> -		if (current->flags & PF_MEMALLOC_NOIO)
> +		if (current->memalloc_noio)
>  			flags &= ~(__GFP_IO | __GFP_FS);
>  		else if (current->flags & PF_MEMALLOC_NOFS)
>  			flags &= ~__GFP_FS;
> @@ -224,8 +223,8 @@ static inline void fs_reclaim_release(gfp_t gfp_mask) { }
>   */
>  static inline unsigned int memalloc_noio_save(void)
>  {
> -	unsigned int flags = current->flags & PF_MEMALLOC_NOIO;
> -	current->flags |= PF_MEMALLOC_NOIO;
> +	unsigned int flags = current->memalloc_noio;
> +	current->memalloc_noio = 1;
>  	return flags;
>  }
>  
> @@ -239,7 +238,7 @@ static inline unsigned int memalloc_noio_save(void)
>   */
>  static inline void memalloc_noio_restore(unsigned int flags)
>  {
> -	current->flags = (current->flags & ~PF_MEMALLOC_NOIO) | flags;
> +	current->memalloc_noio = flags ? 1 : 0;
>  }
>  
>  /**
> @@ -309,6 +308,23 @@ static inline void memalloc_nocma_restore(unsigned int flags)
>  }
>  #endif
>  
> +static inline void set_current_io_flusher(void)
> +{
> +	current->flags |= PF_LOCAL_THROTTLE;
> +	current->memalloc_noio = 1;
> +}
> +
> +static inline void clear_current_io_flusher(void)
> +{
> +	current->flags &= ~PF_LOCAL_THROTTLE;
> +	current->memalloc_noio = 0;
> +}
> +
> +static inline bool get_current_io_flusher(void)
> +{
> +	return current->flags & PF_LOCAL_THROTTLE;
> +}
> +
>  #ifdef CONFIG_MEMCG
>  /**
>   * memalloc_use_memcg - Starts the remote memcg charging scope.
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 00a96746e28a..78c90d1e92f4 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2275,8 +2275,6 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
>  	return -EINVAL;
>  }
>  
> -#define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
> -
>  SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  		unsigned long, arg4, unsigned long, arg5)
>  {
> @@ -2512,9 +2510,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  			return -EINVAL;
>  
>  		if (arg2 == 1)
> -			current->flags |= PR_IO_FLUSHER;
> +			set_current_io_flusher();
>  		else if (!arg2)
> -			current->flags &= ~PR_IO_FLUSHER;
> +			clear_current_io_flusher();
>  		else
>  			return -EINVAL;
>  		break;
> @@ -2525,7 +2523,7 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  		if (arg2 || arg3 || arg4 || arg5)
>  			return -EINVAL;
>  
> -		error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
> +		error = get_current_io_flusher();
>  		break;
>  	default:
>  		error = -EINVAL;
> -- 
> 2.27.0
> 

-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

