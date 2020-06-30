Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F25F220F997
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 18:36:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-zXuuv3LMN-iki74BpjgDaA-1; Tue, 30 Jun 2020 12:36:44 -0400
X-MC-Unique: zXuuv3LMN-iki74BpjgDaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13DBD9126D;
	Tue, 30 Jun 2020 16:36:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A102B4B1;
	Tue, 30 Jun 2020 16:36:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D20A66C9C4;
	Tue, 30 Jun 2020 16:36:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UGaFmg014954 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 12:36:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3254310E38D9; Tue, 30 Jun 2020 16:36:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B61710BC2BA
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 16:36:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630618EF3BD
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 16:36:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-72-aw5_FrOnNXuJml1IKYJY0Q-1; 
	Tue, 30 Jun 2020 12:36:05 -0400
X-MC-Unique: aw5_FrOnNXuJml1IKYJY0Q-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9CCC320724;
	Tue, 30 Jun 2020 16:36:03 +0000 (UTC)
Date: Tue, 30 Jun 2020 09:35:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200630163552.GA837@sol.localdomain>
References: <alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<alpine.LRH.2.02.2006281505250.347@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006300954150.15237@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006300954150.15237@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v4] crypto: introduce the flag
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 09:56:22AM -0400, Mikulas Patocka wrote:
> Index: linux-2.6/crypto/cryptd.c
> ===================================================================
> --- linux-2.6.orig/crypto/cryptd.c	2020-06-29 16:03:07.346417000 +0200
> +++ linux-2.6/crypto/cryptd.c	2020-06-30 15:49:04.206417000 +0200
> @@ -202,6 +202,7 @@ static inline void cryptd_check_internal
>  
>  	*type |= algt->type & CRYPTO_ALG_INTERNAL;
>  	*mask |= algt->mask & CRYPTO_ALG_INTERNAL;
> +	*mask |= algt->mask & CRYPTO_ALG_INHERITED_FLAGS;
>  }

This needs to use the correct logic (crypto_alg_inherited_mask) to decide which
inherited flags to set in 'mask'.

> --- linux-2.6.orig/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
> +++ linux-2.6/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
> @@ -507,7 +507,7 @@ static int adiantum_create(struct crypto
>  	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
>  		return -EINVAL;
>  
> -	mask = crypto_requires_sync(algt->type, algt->mask);
> +	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
>  
>  	inst = kzalloc(sizeof(*inst) + sizeof(*ictx), GFP_KERNEL);
>  	if (!inst)

This is still missing setting the flags correctly on the template instance being
constructed.  The flags need to be inherited from all "inner" algorithms:

	inst->alg.base.cra_flags = (streamcipher_alg->base.cra_flags |
				    blockcipher_alg->cra_flags |
				    hash_alg->base.cra_flags) &
				   CRYPTO_ALG_INHERITED_FLAGS;

If we don't do that, the template instance may allocate memory but not have
CRYPTO_ALG_ALLOCATES_MEMORY set.

> Index: linux-2.6/crypto/pcrypt.c
> ===================================================================
> --- linux-2.6.orig/crypto/pcrypt.c	2020-06-29 16:03:07.346417000 +0200
> +++ linux-2.6/crypto/pcrypt.c	2020-06-30 15:47:32.776417000 +0200
> @@ -263,7 +263,9 @@ static int pcrypt_create_aead(struct cry
>  	if (err)
>  		goto err_free_inst;
>  
> -	inst->alg.base.cra_flags = CRYPTO_ALG_ASYNC;
> +	inst->alg.base.cra_flags =
> +		CRYPTO_ALG_ASYNC |
> +		(alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS);
>  
>  	inst->alg.ivsize = crypto_aead_alg_ivsize(alg);
>  	inst->alg.maxauthsize = crypto_aead_alg_maxauthsize(alg);

And this is still missing setting the mask:

diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
index 7240e8bbdebb..643f7f1cc91c 100644
--- a/crypto/pcrypt.c
+++ b/crypto/pcrypt.c
@@ -232,12 +232,15 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
 	struct crypto_attr_type *algt;
 	struct aead_instance *inst;
 	struct aead_alg *alg;
+	u32 mask;
 	int err;
 
 	algt = crypto_get_attr_type(tb);
 	if (IS_ERR(algt))
 		return PTR_ERR(algt);
 
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
+
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
 		return -ENOMEM;
@@ -254,7 +257,7 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
 		goto err_free_inst;
 
 	err = crypto_grab_aead(&ctx->spawn, aead_crypto_instance(inst),
-			       crypto_attr_alg_name(tb[1]), 0, 0);
+			       crypto_attr_alg_name(tb[1]), 0, mask);
 	if (err)
 		goto err_free_inst;
 

Can you please think logically about what you're trying to accomplish?

In particular, if someone requests an algorithm that doesn't allocate memory
(which is indicated by type=0, mask=CRYPTO_ALG_ALLOCATES_MEMORY), that request
needs to be honored.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

