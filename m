Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C272F26FB54
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 13:22:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-5mRSL6x3NFitydeBCXmC1w-1; Fri, 18 Sep 2020 07:22:18 -0400
X-MC-Unique: 5mRSL6x3NFitydeBCXmC1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0C488EF20;
	Fri, 18 Sep 2020 11:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7957073679;
	Fri, 18 Sep 2020 11:22:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3701B8C7AA;
	Fri, 18 Sep 2020 11:22:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HMQHVc027270 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 18:26:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC28C2026F94; Thu, 17 Sep 2020 22:26:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E638E2028CCE
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:26:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89136185A78B
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:26:14 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-260-rtc36xc7NcC9mQ-ajNt44w-1; Thu, 17 Sep 2020 18:26:11 -0400
X-MC-Unique: rtc36xc7NcC9mQ-ajNt44w-1
Received: by mail-pf1-f194.google.com with SMTP id z19so2120927pfn.8
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 15:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Q77gUSamNF92wlJ+lR4GPQtw23AEZMyMYEOoR6N4qAA=;
	b=P33XBL3KYrZxA6vjKhos+mmqshWC6Zm+yIeAyny9mBjHqFxNVK1cK7w/T3+RaCGIHl
	y5f29sAMbj1Is37bgsv+Xbb81c4ZwCCghCZl12qMgLJadf4wO0nSWD6dVtk/tuEs3VDR
	DL+jWNTzFNrRsDE0kasLScyWzcdU48fsnrqdF0byMnmybQh3L+grKrasLLazm2x5uYft
	Mv23HAr6Nfq7E+SFk0CtkxaOdHgi5MG7hQTtuD2FO+ByHMlzBUK7thbdabWHDIK71Tev
	UU20xtsyUNONK57O2XAPCiTR090QrM5HI6vPjoTb3kOzOsBfKHqDT3xflhNDYUgBAkiV
	kaSw==
X-Gm-Message-State: AOAM533kqdviGLu4uW8I5LzJEgYb/ZoIfXdYy3K5OxrDNl/BnU+uUWVa
	izZi2UMXCmA0xZjKXZDWX2AjpA==
X-Google-Smtp-Source: ABdhPJydTfNwtlMrd82NIkSVsPt/owVM7ehmZAjCmZBjvbBuEggXWuRHybUb74uWQNjYQwGD4UeW5Q==
X-Received: by 2002:a63:5952:: with SMTP id j18mr25156407pgm.317.1600381570500;
	Thu, 17 Sep 2020 15:26:10 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
	[35.199.190.124])
	by smtp.gmail.com with ESMTPSA id b10sm616516pgm.64.2020.09.17.15.26.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Sep 2020 15:26:10 -0700 (PDT)
Date: Thu, 17 Sep 2020 22:26:06 +0000
From: Satya Tangirala <satyat@google.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200917222606.GC421296@google.com>
References: <20200916035315.34046-1-ebiggers@kernel.org>
	<20200916035315.34046-4-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200916035315.34046-4-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:20:50 -0400
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [dm-devel] [PATCH v2 3/3] block: warn if !__GFP_DIRECT_RECLAIM
 in bio_crypt_set_ctx()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 08:53:15PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> bio_crypt_set_ctx() assumes its gfp_mask argument always includes
> __GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.
> 
> For now this assumption is still fine, since no callers violate it.
> Making bio_crypt_set_ctx() able to fail would add unneeded complexity.
> 
> However, if a caller didn't use __GFP_DIRECT_RECLAIM, it would be very
> hard to notice the bug.  Make it easier by adding a WARN_ON_ONCE().
> 
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Satya Tangirala <satyat@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  block/blk-crypto.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index bbe7974fd74f0..5da43f0973b46 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -81,7 +81,15 @@ subsys_initcall(bio_crypt_ctx_init);
>  void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
>  		       const u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE], gfp_t gfp_mask)
>  {
> -	struct bio_crypt_ctx *bc = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
> +	struct bio_crypt_ctx *bc;
> +
> +	/*
> +	 * The caller must use a gfp_mask that contains __GFP_DIRECT_RECLAIM so
> +	 * that the mempool_alloc() can't fail.
> +	 */
> +	WARN_ON_ONCE(!(gfp_mask & __GFP_DIRECT_RECLAIM));
> +
> +	bc = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
>  
>  	bc->bc_key = key;
>  	memcpy(bc->bc_dun, dun, sizeof(bc->bc_dun));
> -- 
Looks good!

Reviewed-by: Satya Tangirala <satyat@google.com>

> 2.28.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

