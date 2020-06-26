Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4E28020B628
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 18:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593190021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xAv/XRJbMFLdkHxJqNNPQ2oH4iI7dw8ma+OyoEjdYT8=;
	b=XAGILLMXIOBotvKDQ3O4TDTObNplMdD5M9mUaKPx4jRjOfZZ1jOvGkAU2ftw1avs6TSVlC
	wxCe8K695ziz6+91hqhO01pBDp4DvEPvKzlEQND6aKeNTUZ3QkNx3DaQ/E36ipCKEGBCNA
	sjWItNiAUIb1ISNtJdE5ckluKOVMtUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-ij8xyxVTPti83NtmwHjZ_Q-1; Fri, 26 Jun 2020 12:46:58 -0400
X-MC-Unique: ij8xyxVTPti83NtmwHjZ_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B2A107ACF3;
	Fri, 26 Jun 2020 16:46:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F0F61984;
	Fri, 26 Jun 2020 16:46:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19718875B7;
	Fri, 26 Jun 2020 16:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGkUKA014902 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BB332063239; Fri, 26 Jun 2020 16:46:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E2C206323B
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 16:46:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D18E805F51
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 16:46:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-236-JZRFus9eNMy7V6Y63BpBiA-1;
	Fri, 26 Jun 2020 12:46:23 -0400
X-MC-Unique: JZRFus9eNMy7V6Y63BpBiA-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 34A0E20781;
	Fri, 26 Jun 2020 16:46:19 +0000 (UTC)
Date: Fri, 26 Jun 2020 09:46:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200626164617.GA211634@gmail.com>
References: <alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@Huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v2] crypto: introduce the flag
 CRYPTO_ALG_ALLOCATES_MEMORY
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 26, 2020 at 12:16:33PM -0400, Mikulas Patocka wrote:
> +/*
> + * Pass these flags down through the crypto API.
> + */
> +#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)

This comment is useless.  How about:

/*
 * When an algorithm uses another algorithm (e.g., if it's an instance of a
 * template), these are the flags that always get set on the "outer" algorithm
 * if any "inner" algorithm has them set.  In some cases other flags are
 * inherited too; these are just the flags that are *always* inherited.
 */
#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)

Also I wonder about the case where the inner algorithm is a fallback rather than
part of a template instance.  This patch only handles templates, not fallbacks.
Is that intentional?  Isn't that technically a bug?

> +
> +/*
>   * Transform masks and values (for crt_flags).
>   */
>  #define CRYPTO_TFM_NEED_KEY		0x00000001
> Index: linux-2.6/crypto/authenc.c
> ===================================================================
> --- linux-2.6.orig/crypto/authenc.c	2020-06-26 17:24:03.566417000 +0200
> +++ linux-2.6/crypto/authenc.c	2020-06-26 17:24:03.566417000 +0200
> @@ -388,7 +388,8 @@ static int crypto_authenc_create(struct
>  	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
>  		return -EINVAL;
>  
> -	mask = crypto_requires_sync(algt->type, algt->mask);
> +	mask = crypto_requires_sync(algt->type, algt->mask) |
> +	       crypto_requires_nomem(algt->type, algt->mask);

As I suggested earlier, shouldn't there be a function that returns the mask for
all inherited flags, rather than handling each flag individually?

>  
>  	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
>  	if (!inst)
> @@ -424,7 +425,7 @@ static int crypto_authenc_create(struct
>  		goto err_free_inst;
>  
>  	inst->alg.base.cra_flags = (auth_base->cra_flags |
> -				    enc->base.cra_flags) & CRYPTO_ALG_ASYNC;
> +			enc->base.cra_flags) & CRYPTO_ALG_INHERITED_FLAGS;

Strange indentation here.  Likewise in most of the other files.

> Index: linux-2.6/crypto/xts.c
> ===================================================================
> --- linux-2.6.orig/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> +++ linux-2.6/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> @@ -415,7 +415,7 @@ static int create(struct crypto_template
>  	} else
>  		goto err_free_inst;
>  
> -	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
> +	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
>  	inst->alg.base.cra_priority = alg->base.cra_priority;
>  	inst->alg.base.cra_blocksize = XTS_BLOCK_SIZE;
>  	inst->alg.base.cra_alignmask = alg->base.cra_alignmask |

Need to set the mask correctly in this file.

> Index: linux-2.6/crypto/adiantum.c
> ===================================================================
> --- linux-2.6.orig/crypto/adiantum.c	2020-06-26 17:24:03.566417000 +0200
> +++ linux-2.6/crypto/adiantum.c	2020-06-26 17:24:03.566417000 +0200
> @@ -507,7 +507,8 @@ static int adiantum_create(struct crypto
>  	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
>  		return -EINVAL;
>  
> -	mask = crypto_requires_sync(algt->type, algt->mask);
> +	mask = crypto_requires_sync(algt->type, algt->mask) |
> +	       crypto_requires_nomem(algt->type, algt->mask);
>  
>  	inst = kzalloc(sizeof(*inst) + sizeof(*ictx), GFP_KERNEL);
>  	if (!inst)

Need to use CRYPTO_ALG_INHERITED_FLAGS in this file.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

