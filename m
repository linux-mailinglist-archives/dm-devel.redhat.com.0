Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A683A2AEE44
	for <lists+dm-devel@lfdr.de>; Wed, 11 Nov 2020 10:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605088621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ok8MOqo3xpU1J7ZB9FZFBF7vUlGBEPqGjfOfiivR0nE=;
	b=bo+69zjdhugtJkZpSI1zDNlrpNkoIZ5/cSjDhnCPVv6xVexxghu8aSasGp5xCLt/KZWI0V
	M4rLUIqLHtlmpBo7A8PZv6+9cDo93d91aXIgrTp+ggoOdvqtU0OA4sge4d+VD7uVs2AtJj
	4W8OC79zq6y65sTTnqup1i0Sv7nWBCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-eq1pMHH_P1GN-WVieNxBOQ-1; Wed, 11 Nov 2020 04:56:59 -0500
X-MC-Unique: eq1pMHH_P1GN-WVieNxBOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26E3593B2;
	Wed, 11 Nov 2020 09:56:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7545E9D0;
	Wed, 11 Nov 2020 09:56:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE675181A050;
	Wed, 11 Nov 2020 09:56:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB9uSRG003941 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 04:56:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFD8473663; Wed, 11 Nov 2020 09:56:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B3C6EF5B;
	Wed, 11 Nov 2020 09:56:28 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AB9uSqU029365; Wed, 11 Nov 2020 04:56:28 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AB9uSYG029361; Wed, 11 Nov 2020 04:56:28 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 11 Nov 2020 04:56:27 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <20201111024140.1483879-1-ndesaulniers@google.com>
Message-ID: <alpine.LRH.2.02.2011110456030.25804@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201111024140.1483879-1-ndesaulniers@google.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com, dm-devel@redhat.com,
	Rob Herring <robherring2@gmail.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] Revert "dm cache: fix arm link errors with
	inline"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Acked-by: Mikulas Patocka <mpatocka@redhat.com>



On Tue, 10 Nov 2020, Nick Desaulniers wrote:

> This reverts commit 43aeaa29573924df76f44eda2bbd94ca36e407b5.
> 
> Since
> commit 0bddd227f3dc ("Documentation: update for gcc 4.9 requirement")
> the minimum supported version of GCC is gcc-4.9. It's now safe to remove
> this code.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/427
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  drivers/md/dm-cache-target.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
> index 9644424591da..4bc453f5bbaa 100644
> --- a/drivers/md/dm-cache-target.c
> +++ b/drivers/md/dm-cache-target.c
> @@ -712,10 +712,6 @@ static bool block_size_is_power_of_two(struct cache *cache)
>  	return cache->sectors_per_block_shift >= 0;
>  }
>  
> -/* gcc on ARM generates spurious references to __udivdi3 and __umoddi3 */
> -#if defined(CONFIG_ARM) && __GNUC__ == 4 && __GNUC_MINOR__ <= 6
> -__always_inline
> -#endif
>  static dm_block_t block_div(dm_block_t b, uint32_t n)
>  {
>  	do_div(b, n);
> -- 
> 2.29.2.222.g5d2a92d10f8-goog
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

