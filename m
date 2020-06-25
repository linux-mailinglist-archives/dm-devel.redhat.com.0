Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 18E3E209E7A
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 14:32:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593088332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QsvpEXjwTy/YO0AbLC5dwcymS3bZl5YD2GlXtYk+V54=;
	b=b6oQyg6LHqMwrDWJhqyeoSefuNmZpkh9jUERbtgoaVMly3Rz62BK0fkJXnI0CH1SHItSSi
	NZojDjCwbVYiWxqdXw3g7NNkqljRKpAfbrnFES1Bo3GqQ1zcTkYYIS9rU36yQjm3KaW6+E
	0EgI3hsm4UkoQF0zr6svPcUryAjE+9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369--ZBDK8LfMNO94wHMfnLS9w-1; Thu, 25 Jun 2020 08:32:09 -0400
X-MC-Unique: -ZBDK8LfMNO94wHMfnLS9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 396C318FE860;
	Thu, 25 Jun 2020 12:32:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BAEB71688;
	Thu, 25 Jun 2020 12:32:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 893921809547;
	Thu, 25 Jun 2020 12:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PCVpMr027961 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 08:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3F0F2022EA2; Thu, 25 Jun 2020 12:31:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFC3A202A97F
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:31:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEF0C8007D0
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 12:31:48 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-fzJc6_LPOP69sS8Zf2xWYA-1; Thu, 25 Jun 2020 08:31:46 -0400
X-MC-Unique: fzJc6_LPOP69sS8Zf2xWYA-1
Received: by mail-ej1-f68.google.com with SMTP id mb16so5768154ejb.4;
	Thu, 25 Jun 2020 05:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=LfL/J6kcjTPEsDskt6aLX8PefsDeHP4anavcHPUMTKA=;
	b=GjgDuaKT4UlKj5jslwPtxqyEFQ7D/WayeK8CgE9iIeMgGMbuQb8WzuCYXthbaesF6o
	xgSG4vhvuzlvxVZ+Q3rr+gpEDI5VivJDLGEGB4XfYkVfSByCC9iJeAMlct4/L+wbjs9a
	i4XuKD27LQ41I4cbSQL+fswFRhgUGkNbPAqvTO+iMw0DaaMhcaGgwEn3/pVI12UE9aGE
	VkOCtFixlU40w/8+zWrcBCy10VTL9JNSdfEjRuxlhRAOqT2hmOEJYT8zZfa3Ukpgp1Hh
	YSbaXfHcvpBR8hDvtjRoptvKUiQJreYZrs8IQKo9BXK+JvnIDICVfKm+mXls9hyQ4Zq7
	feAw==
X-Gm-Message-State: AOAM532xAUXa17u+uAcVKYCnaDBG3hzzEDyY4Xch+IRAEMHHFLKujI32
	nJaLdvn2HpV5mOL8Ra40vaE=
X-Google-Smtp-Source: ABdhPJyiXDwgXlrcNxDquN/m7X009TUFeb5rEVdNCJL2oLKPwCGm2N5mD6JL7UM8/mFBSoWnOD0BJw==
X-Received: by 2002:a17:906:3d41:: with SMTP id
	q1mr30164872ejf.12.1593088305149; 
	Thu, 25 Jun 2020 05:31:45 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	u13sm11449983ejx.3.2020.06.25.05.31.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 05:31:44 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:31:43 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200625123143.GK1320@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-3-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-3-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/6] mm: Add become_kswapd and restore_kswapd
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

On Thu 25-06-20 12:31:18, Matthew Wilcox wrote:
> Since XFS needs to pretend to be kswapd in some of its worker threads,
> create methods to save & restore kswapd state.  Don't bother restoring
> kswapd state in kswapd -- the only time we reach this code is when we're
> exiting and the task_struct is about to be destroyed anyway.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Certainly better than an opencoded PF_$FOO manipulation
Acked-by: Michal Hocko <mhocko@suse.com>

I would just ask for a clarification because this is rellying to have a
good MM knowledge to follow

> +/*
> + * Tell the memory management that we're a "memory allocator",

I would go with.
Tell the memory management that the caller is working on behalf of the
background memory reclaim (aka kswapd) and help it to make a forward
progress. That means that it will get an access to memory reserves
should there be a need to allocate memory in order to make a forward
progress. Note that the caller has to be extremely careful when doing
that.

Or something like that.

> + * and that if we need more memory we should get access to it
> + * regardless (see "__alloc_pages()"). "kswapd" should
> + * never get caught in the normal page freeing logic.
> + *
> + * (Kswapd normally doesn't need memory anyway, but sometimes
> + * you need a small amount of memory in order to be able to
> + * page out something else, and this flag essentially protects
> + * us from recursively trying to free more memory as we're
> + * trying to free the first piece of memory in the first place).
> + */
> +#define KSWAPD_PF_FLAGS		(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD)
> +
> +static inline unsigned long become_kswapd(void)
> +{
> +	unsigned long flags = current->flags & KSWAPD_PF_FLAGS;
> +	current->flags |= KSWAPD_PF_FLAGS;
> +	return flags;
> +}
> +
> +static inline void restore_kswapd(unsigned long flags)
> +{
> +	current->flags &= ~(flags ^ KSWAPD_PF_FLAGS);
> +}
> +
>  static inline void set_current_io_flusher(void)
>  {
>  	current->flags |= PF_LOCAL_THROTTLE;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b6d84326bdf2..27ae76699899 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3870,19 +3870,7 @@ static int kswapd(void *p)
>  	if (!cpumask_empty(cpumask))
>  		set_cpus_allowed_ptr(tsk, cpumask);
>  
> -	/*
> -	 * Tell the memory management that we're a "memory allocator",
> -	 * and that if we need more memory we should get access to it
> -	 * regardless (see "__alloc_pages()"). "kswapd" should
> -	 * never get caught in the normal page freeing logic.
> -	 *
> -	 * (Kswapd normally doesn't need memory anyway, but sometimes
> -	 * you need a small amount of memory in order to be able to
> -	 * page out something else, and this flag essentially protects
> -	 * us from recursively trying to free more memory as we're
> -	 * trying to free the first piece of memory in the first place).
> -	 */
> -	tsk->flags |= PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD;
> +	become_kswapd();
>  	set_freezable();
>  
>  	WRITE_ONCE(pgdat->kswapd_order, 0);
> @@ -3932,8 +3920,6 @@ static int kswapd(void *p)
>  			goto kswapd_try_sleep;
>  	}
>  
> -	tsk->flags &= ~(PF_MEMALLOC | PF_SWAPWRITE | PF_KSWAPD);
> -
>  	return 0;
>  }
>  
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

