Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F78E2CC
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 04:37:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1034301D67F;
	Thu, 15 Aug 2019 02:37:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8AF45D1;
	Thu, 15 Aug 2019 02:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 684D624F30;
	Thu, 15 Aug 2019 02:37:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7F2bj8B013743 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 22:37:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1CE945D1; Thu, 15 Aug 2019 02:37:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64E564299F
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 02:37:43 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hy5dv-0003Gw-Je; Thu, 15 Aug 2019 12:37:35 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hy5du-0006Fp-QT; Thu, 15 Aug 2019 12:37:34 +1000
Date: Thu, 15 Aug 2019 12:37:34 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190815023734.GB23782@gondor.apana.org.au>
References: <20190814163746.3525-1-ard.biesheuvel@linaro.org>
	<20190814163746.3525-2-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814163746.3525-2-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v11 1/4] crypto: essiv - create wrapper
 template for ESSIV generation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 02:37:57 +0000 (UTC)

On Wed, Aug 14, 2019 at 07:37:43PM +0300, Ard Biesheuvel wrote:
>
> +	/* Block cipher, e.g., "aes" */
> +	crypto_set_spawn(&ictx->essiv_cipher_spawn, inst);
> +	err = crypto_grab_spawn(&ictx->essiv_cipher_spawn, essiv_cipher_name,
> +				CRYPTO_ALG_TYPE_CIPHER, CRYPTO_ALG_TYPE_MASK);
> +	if (err)
> +		goto out_drop_skcipher;
> +	essiv_cipher_alg = ictx->essiv_cipher_spawn.alg;
> +
> +	/* Synchronous hash, e.g., "sha256" */
> +	_hash_alg = crypto_alg_mod_lookup(shash_name,
> +					  CRYPTO_ALG_TYPE_SHASH,
> +					  CRYPTO_ALG_TYPE_MASK);
> +	if (IS_ERR(_hash_alg)) {
> +		err = PTR_ERR(_hash_alg);
> +		goto out_drop_essiv_cipher;
> +	}
> +	hash_alg = __crypto_shash_alg(_hash_alg);
> +	err = crypto_init_shash_spawn(&ictx->hash_spawn, hash_alg, inst);
> +	if (err)
> +		goto out_put_hash;

I wouldn't use spawns for these two algorithms.  The point of
spawns is mainly to serve as a notification channel so we can
tear down the top-level instance when a better underlying spawn
implementation is added to the system.

For these two algorithms, we don't really care about their performance
to do such a tear-down since they only operate on small pieces of
data.

Therefore just keep things simple and allocate them in the tfm
init function.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
