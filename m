Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73AC820FA11
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 19:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593536513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RYrx2pIFIyJDOQvCHB/o6mIA5/8EhNia2UDXejJmulk=;
	b=boQrYs5U7Gd4TkYvhC+fuOWydiwAJOAhiXhxDRtxkurglCbgK8XlRVub6hMAiNgQWAJ9mI
	UKqWXJrEsucx2CQcjI+27s7lYVtLSHCg+JKLCmcdYhaiDeYdT5Ab0b5hWyRFeY+9NsHmUS
	A5lcydin+SQI3YeitPW/6Q3et3wJdbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-nUbN7qJ_Oga6BolLRpmaUQ-1; Tue, 30 Jun 2020 13:01:51 -0400
X-MC-Unique: nUbN7qJ_Oga6BolLRpmaUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA7AB800C60;
	Tue, 30 Jun 2020 17:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3D97FEA9;
	Tue, 30 Jun 2020 17:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE66D6C9C4;
	Tue, 30 Jun 2020 17:01:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UH1LfW018035 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 13:01:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 197B610016EB; Tue, 30 Jun 2020 17:01:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034431036D11;
	Tue, 30 Jun 2020 17:01:17 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05UH1HNG002340; Tue, 30 Jun 2020 13:01:17 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05UH1GeY002319; Tue, 30 Jun 2020 13:01:16 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 30 Jun 2020 13:01:16 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200630163552.GA837@sol.localdomain>
Message-ID: <alpine.LRH.2.02.2006301256110.30526@file01.intranet.prod.int.rdu2.redhat.com>
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
	<20200630163552.GA837@sol.localdomain>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 30 Jun 2020, Eric Biggers wrote:

> On Tue, Jun 30, 2020 at 09:56:22AM -0400, Mikulas Patocka wrote:
> > Index: linux-2.6/crypto/cryptd.c
> > ===================================================================
> > --- linux-2.6.orig/crypto/cryptd.c	2020-06-29 16:03:07.346417000 +0200
> > +++ linux-2.6/crypto/cryptd.c	2020-06-30 15:49:04.206417000 +0200
> > @@ -202,6 +202,7 @@ static inline void cryptd_check_internal
> >  
> >  	*type |= algt->type & CRYPTO_ALG_INTERNAL;
> >  	*mask |= algt->mask & CRYPTO_ALG_INTERNAL;
> > +	*mask |= algt->mask & CRYPTO_ALG_INHERITED_FLAGS;
> >  }
> 
> This needs to use the correct logic (crypto_alg_inherited_mask) to decide which
> inherited flags to set in 'mask'.

I added "*mask |= crypto_alg_inherited_mask(algt->type, algt->mask);" 
there.


> > --- linux-2.6.orig/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
> > +++ linux-2.6/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
> > @@ -507,7 +507,7 @@ static int adiantum_create(struct crypto
> >  	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
> >  		return -EINVAL;
> >  
> > -	mask = crypto_requires_sync(algt->type, algt->mask);
> > +	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
> >  
> >  	inst = kzalloc(sizeof(*inst) + sizeof(*ictx), GFP_KERNEL);
> >  	if (!inst)
> 
> This is still missing setting the flags correctly on the template instance being
> constructed.  The flags need to be inherited from all "inner" algorithms:
> 
> 	inst->alg.base.cra_flags = (streamcipher_alg->base.cra_flags |
> 				    blockcipher_alg->cra_flags |
> 				    hash_alg->base.cra_flags) &
> 				   CRYPTO_ALG_INHERITED_FLAGS;
> 
> If we don't do that, the template instance may allocate memory but not have
> CRYPTO_ALG_ALLOCATES_MEMORY set.

OK


> > Index: linux-2.6/crypto/pcrypt.c
> > ===================================================================
> > --- linux-2.6.orig/crypto/pcrypt.c	2020-06-29 16:03:07.346417000 +0200
> > +++ linux-2.6/crypto/pcrypt.c	2020-06-30 15:47:32.776417000 +0200
> > @@ -263,7 +263,9 @@ static int pcrypt_create_aead(struct cry
> >  	if (err)
> >  		goto err_free_inst;
> >  
> > -	inst->alg.base.cra_flags = CRYPTO_ALG_ASYNC;
> > +	inst->alg.base.cra_flags =
> > +		CRYPTO_ALG_ASYNC |
> > +		(alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS);
> >  
> >  	inst->alg.ivsize = crypto_aead_alg_ivsize(alg);
> >  	inst->alg.maxauthsize = crypto_aead_alg_maxauthsize(alg);

What's wrong with this?


> And this is still missing setting the mask:
> 
> diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
> index 7240e8bbdebb..643f7f1cc91c 100644
> --- a/crypto/pcrypt.c
> +++ b/crypto/pcrypt.c
> @@ -232,12 +232,15 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
>  	struct crypto_attr_type *algt;
>  	struct aead_instance *inst;
>  	struct aead_alg *alg;
> +	u32 mask;
>  	int err;
>  
>  	algt = crypto_get_attr_type(tb);
>  	if (IS_ERR(algt))
>  		return PTR_ERR(algt);
>  
> +	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
> +
>  	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
>  	if (!inst)
>  		return -ENOMEM;
> @@ -254,7 +257,7 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
>  		goto err_free_inst;
>  
>  	err = crypto_grab_aead(&ctx->spawn, aead_crypto_instance(inst),
> -			       crypto_attr_alg_name(tb[1]), 0, 0);
> +			       crypto_attr_alg_name(tb[1]), 0, mask);
>  	if (err)
>  		goto err_free_inst;
>  

I added "mask" there - but there is still a "mask" argument that is 
unused - is it a bug to have two "mask" variables?


> Can you please think logically about what you're trying to accomplish?

I am not an expert in crypto code.

> In particular, if someone requests an algorithm that doesn't allocate memory
> (which is indicated by type=0, mask=CRYPTO_ALG_ALLOCATES_MEMORY), that request
> needs to be honored.
> 
> - Eric

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

