Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6520C9CE
	for <lists+dm-devel@lfdr.de>; Sun, 28 Jun 2020 21:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593371285;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L4nb7L5dhCPUttHpRwZPh7C7GvU35/FuZlv+ytTZ41E=;
	b=iIhgAjjv24Zokh02fp6dYEC4SA99pOTiFngFd2cOCL/blbg8ZzLbwiu6d0QL/jT5lD4dmq
	QaE6U1blzS7KQJhnfBDvLdrREBqDPMN2TMPpkXU4KO2G+FM0Vud4YmNC4xs2yx5oh/SEwu
	sbARNMfDK6vfZxvbeHbSXfKe3EH2uM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-fdlDYpsLP5OONclaBlqkMg-1; Sun, 28 Jun 2020 15:08:02 -0400
X-MC-Unique: fdlDYpsLP5OONclaBlqkMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC340107B267;
	Sun, 28 Jun 2020 19:07:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 368AB5D9D5;
	Sun, 28 Jun 2020 19:07:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA6E61809547;
	Sun, 28 Jun 2020 19:07:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05SJ7qpM014963 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jun 2020 15:07:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8FBD5C57D; Sun, 28 Jun 2020 19:07:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E50935C1D2;
	Sun, 28 Jun 2020 19:07:49 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05SJ7n1T003745; Sun, 28 Jun 2020 15:07:49 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05SJ7nbm003741; Sun, 28 Jun 2020 15:07:49 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 28 Jun 2020 15:07:49 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200626170039.GB211634@gmail.com>
Message-ID: <alpine.LRH.2.02.2006281505530.347@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<20200626170039.GB211634@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 26 Jun 2020, Eric Biggers wrote:

> On Fri, Jun 26, 2020 at 09:46:17AM -0700, Eric Biggers wrote:
> > On Fri, Jun 26, 2020 at 12:16:33PM -0400, Mikulas Patocka wrote:
> > > +/*
> > > + * Pass these flags down through the crypto API.
> > > + */
> > > +#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)
> > 
> > This comment is useless.  How about:
> > 
> > /*
> >  * When an algorithm uses another algorithm (e.g., if it's an instance of a
> >  * template), these are the flags that always get set on the "outer" algorithm
> >  * if any "inner" algorithm has them set.  In some cases other flags are
> >  * inherited too; these are just the flags that are *always* inherited.
> >  */
> > #define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)
> > 
> > Also I wonder about the case where the inner algorithm is a fallback rather than
> > part of a template instance.  This patch only handles templates, not fallbacks.
> > Is that intentional?  Isn't that technically a bug?
> 
> Also is CRYPTO_ALG_ALLOCATES_MEMORY meant to apply for algorithms of type
> "cipher" and "shash"?  The code doesn't handle those, so presumably not?
> 
> What about "akcipher"?

Yes - the patch should apply for these cases, but I don't know how to do 
it. Please, do it.

> > > Index: linux-2.6/crypto/xts.c
> > > ===================================================================
> > > --- linux-2.6.orig/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> > > +++ linux-2.6/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> > > @@ -415,7 +415,7 @@ static int create(struct crypto_template
> > >  	} else
> > >  		goto err_free_inst;
> > >  
> > > -	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
> > > +	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
> > >  	inst->alg.base.cra_priority = alg->base.cra_priority;
> > >  	inst->alg.base.cra_blocksize = XTS_BLOCK_SIZE;
> > >  	inst->alg.base.cra_alignmask = alg->base.cra_alignmask |
> > 
> > Need to set the mask correctly in this file.
> 
> cryptd_create_skcipher(), cryptd_create_hash(), cryptd_create_aead(), and
> crypto_rfc4309_create() are also missing setting the mask.
> 
> pcrypt_create_aead() is missing both setting the mask and inheriting the flags.

I added CRYPTO_ALG_ALLOCATES_MEMORY there.

> Also, "seqiv" instances can be created without CRYPTO_ALG_ALLOCATES_MEMORY set,
> despite seqiv_aead_encrypt() allocating memory.
> 
> - Eric

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

