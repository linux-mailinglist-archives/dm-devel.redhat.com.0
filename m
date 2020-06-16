Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 78E801FBD20
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 19:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4wbFAvCF05JbAIbvKEynarpOkyzT3H7NYk5CFQ1GMXQ=;
	b=Z6C0guTTLGSIpYvtqG7Dz62sRU9TBczazalu+TY8VF0ESReXuA0a8Deb47zTot0jg+q/6B
	Au+c9vCfc/Ur4T3aR90+AjIyxcnfWXo9TCkZpCF6tWX1UbckzjEalS31QWzp4oYBO8o3dI
	lpByj3rOOxdXgkSoEOgTG0G6hrpG5vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-34sHF203OyGvZM2J07aXag-1; Tue, 16 Jun 2020 13:37:25 -0400
X-MC-Unique: 34sHF203OyGvZM2J07aXag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEA12106B24D;
	Tue, 16 Jun 2020 17:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD595D9E4;
	Tue, 16 Jun 2020 17:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5D81833C6;
	Tue, 16 Jun 2020 17:37:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHaSse013222 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:36:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0EE49202683E; Tue, 16 Jun 2020 17:36:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A8F82026E1C
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:36:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5AF2101A525
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:36:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-320-ChD2kj65ODWMens_pReBHg-1;
	Tue, 16 Jun 2020 13:36:23 -0400
X-MC-Unique: ChD2kj65ODWMens_pReBHg-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 71CD52078D;
	Tue, 16 Jun 2020 17:36:21 +0000 (UTC)
Date: Tue, 16 Jun 2020 10:36:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200616173620.GA207319@gmail.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] crypto: introduce
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:01:31AM -0400, Mikulas Patocka wrote:
> Introduce a new flag CRYPTO_ALG_ALLOCATES_MEMORY and modify dm-crypt, so
> that it uses only drivers without this flag.
> 
> If the flag is set, then the crypto driver allocates memory in its request
> routine. Such drivers are not suitable for disk encryption because
> GFP_ATOMIC allocation can fail anytime (causing random I/O errors) and
> GFP_KERNEL allocation can recurse into the block layer, causing a
> deadlock.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> Index: linux-2.6/include/linux/crypto.h
> ===================================================================
> --- linux-2.6.orig/include/linux/crypto.h
> +++ linux-2.6/include/linux/crypto.h
> @@ -97,9 +97,15 @@
>  #define CRYPTO_ALG_OPTIONAL_KEY		0x00004000
>  
>  /*
> + * The driver is allocating emmory in its encrypt or decrypt callback,
> + * so it should not be used to encrypt block devices.
> + */

"is allocating emmory" => "may allocate memory"

"so it should not be used to encrypt block devices" =>
"so it shouldn't be used in cases where memory allocation failures aren't
 acceptable, such as during block device encryption".

Also, which types of algorithms does this flag apply to?  E.g. if it applies to
hash algorithms too, it's not sufficient to say "encrypt or decrypt callback".

How about:

 /*
  * The driver may allocate memory during request processing, so it shouldn't be
  * used in cases where memory allocation failures aren't acceptable, such as
  * during block device encryption.
  */

> +#define CRYPTO_ALG_ALLOCATES_MEMORY	0x00008000
> +
> +/*
>   * Don't trigger module loading
>   */
> -#define CRYPTO_NOLOAD			0x00008000
> +#define CRYPTO_NOLOAD			0x00010000
>  
>  /*
>   * Transform masks and values (for crt_flags).
> Index: linux-2.6/drivers/md/dm-crypt.c
> ===================================================================

This would better belong as two separate patches: one to introduce
CRYPTO_ALG_ALLOCATES_MEMORY, and one to make dm-crypt use it.

> --- linux-2.6.orig/drivers/md/dm-crypt.c
> +++ linux-2.6/drivers/md/dm-crypt.c
> @@ -419,7 +419,7 @@ static int crypt_iv_lmk_ctr(struct crypt
>  		return -EINVAL;
>  	}
>  
> -	lmk->hash_tfm = crypto_alloc_shash("md5", 0, 0);
> +	lmk->hash_tfm = crypto_alloc_shash("md5", 0, CRYPTO_ALG_ALLOCATES_MEMORY);
>  	if (IS_ERR(lmk->hash_tfm)) {
>  		ti->error = "Error initializing LMK hash";
>  		return PTR_ERR(lmk->hash_tfm);
> @@ -581,7 +581,7 @@ static int crypt_iv_tcw_ctr(struct crypt
>  		return -EINVAL;
>  	}
>  
> -	tcw->crc32_tfm = crypto_alloc_shash("crc32", 0, 0);
> +	tcw->crc32_tfm = crypto_alloc_shash("crc32", 0, CRYPTO_ALG_ALLOCATES_MEMORY);
>  	if (IS_ERR(tcw->crc32_tfm)) {
>  		ti->error = "Error initializing CRC32 in TCW";
>  		return PTR_ERR(tcw->crc32_tfm);
> @@ -768,7 +768,7 @@ static int crypt_iv_elephant_ctr(struct
>  	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
>  	int r;
>  
> -	elephant->tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
> +	elephant->tfm = crypto_alloc_skcipher("ecb(aes)", 0, CRYPTO_ALG_ALLOCATES_MEMORY);
>  	if (IS_ERR(elephant->tfm)) {
>  		r = PTR_ERR(elephant->tfm);
>  		elephant->tfm = NULL;
> @@ -2088,7 +2088,7 @@ static int crypt_alloc_tfms_skcipher(str
>  		return -ENOMEM;
>  
>  	for (i = 0; i < cc->tfms_count; i++) {
> -		cc->cipher_tfm.tfms[i] = crypto_alloc_skcipher(ciphermode, 0, 0);
> +		cc->cipher_tfm.tfms[i] = crypto_alloc_skcipher(ciphermode, 0, CRYPTO_ALG_ALLOCATES_MEMORY);

Despite the recent relaxation in rules, the preferred length of a line is still
80 columns.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

