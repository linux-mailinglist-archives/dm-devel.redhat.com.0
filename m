Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4DD1FBD39
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 19:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cV9S5MxzzzTxsNIqEJdW9la2gcK9gZcybgKJKmgaKUc=;
	b=TzAC5poQfEZjtVhLrBKaUmD7dD/Ai0UF1J34WOv/0e9RBJqssFr3u3bvaiDik5jDWXnXE8
	ualpxYkJ+Z9HfQRw9TeYzPD7GbFwlo9Y5f3LxfDXAm9nRB+fN+HeWXrcTc2DFaEEzyUk9r
	glOUWfJifNEswIf9bvYFxwB6Azv2Zm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-SIWZmj_cMq2_b5N6359orA-1; Tue, 16 Jun 2020 13:43:12 -0400
X-MC-Unique: SIWZmj_cMq2_b5N6359orA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04685108594B;
	Tue, 16 Jun 2020 17:43:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDAE78911;
	Tue, 16 Jun 2020 17:43:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2245D1809547;
	Tue, 16 Jun 2020 17:42:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHgrY8013753 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:42:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 314902157F26; Tue, 16 Jun 2020 17:42:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8912166BA3
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:42:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543CD101A525
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:42:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-329-jH7olmODPGWZZ1-JcKBYog-1;
	Tue, 16 Jun 2020 13:42:44 -0400
X-MC-Unique: jH7olmODPGWZZ1-JcKBYog-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 46E93214DB;
	Tue, 16 Jun 2020 17:42:42 +0000 (UTC)
Date: Tue, 16 Jun 2020 10:42:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200616174240.GB207319@gmail.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101380.28052@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006161101380.28052@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/4] crypto: pass the flag
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:01:58AM -0400, Mikulas Patocka wrote:
> Pass the flag CRYPTO_ALG_ALLOCATES_MEMORY down through the crypto API.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  crypto/adiantum.c         |    3 ++-
>  crypto/authenc.c          |    5 +++--
>  crypto/authencesn.c       |    5 +++--
>  crypto/ccm.c              |    7 ++++---
>  crypto/chacha20poly1305.c |    5 +++--
>  crypto/cryptd.c           |    7 +++++--
>  crypto/ctr.c              |    3 ++-
>  crypto/cts.c              |    5 +++--
>  crypto/essiv.c            |    5 +++--
>  crypto/gcm.c              |   15 +++++++++------
>  crypto/geniv.c            |    3 ++-
>  crypto/lrw.c              |    5 +++--
>  crypto/rsa-pkcs1pad.c     |    5 +++--
>  crypto/xts.c              |    2 +-
>  include/crypto/algapi.h   |    9 +++++++++
>  15 files changed, 55 insertions(+), 29 deletions(-)
> 
> Index: linux-2.6/crypto/authenc.c
> ===================================================================
> --- linux-2.6.orig/crypto/authenc.c
> +++ linux-2.6/crypto/authenc.c
> @@ -388,7 +388,8 @@ static int crypto_authenc_create(struct
>  	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
>  		return -EINVAL;
>  
> -	mask = crypto_requires_sync(algt->type, algt->mask);
> +	mask = crypto_requires_sync(algt->type, algt->mask) |
> +	       crypto_requires_nomem(algt->type, algt->mask);
>  
>  	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
>  	if (!inst)
> @@ -424,7 +425,7 @@ static int crypto_authenc_create(struct
>  		goto err_free_inst;
>  
>  	inst->alg.base.cra_flags = (auth_base->cra_flags |
> -				    enc->base.cra_flags) & CRYPTO_ALG_ASYNC;
> +				    enc->base.cra_flags) & (CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY);

ASYNC and ALLOCATES_MEMORY are both handled the same way.  They're both
"inherited" from inner algorithms to the template instance.  And if someone
requests that one of these flags be clear when instantiating a template, then we
have to honor the same for the inner algorithms too.

So, shouldn't we define something like crypto_algt_mask() and
CRYPTO_ALG_INHERITED_FLAGS and make them handle both ASYNC and ALLOCATES_MEMORY,
rather than explicitly handling each of these flags everywhere again?

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

