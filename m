Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1286129
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 13:54:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C29A42D1EF1;
	Thu,  8 Aug 2019 11:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCC65DC1E;
	Thu,  8 Aug 2019 11:53:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DECF2551C;
	Thu,  8 Aug 2019 11:53:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78BrGAo019751 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 07:53:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59D63608AB; Thu,  8 Aug 2019 11:53:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5B1608A5;
	Thu,  8 Aug 2019 11:53:16 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEDD130B64E7;
	Thu,  8 Aug 2019 11:53:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so20043997wru.10;
	Thu, 08 Aug 2019 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vILGCjKtV3eGAFYGxVaZEjKfTjQI0RrbwrN7GVSVEp4=;
	b=NjSJoJ6OshZWe6QGnwvrZhuR9NFMXymXAvOePeDJ7RBvXNgPuPHQ3mdEpkMW0Ks4LJ
	FR72b0/q4C7nZNL5/Lpebz1xDzAVOIpyDl5kThlgJECt4h4ZjT8tzjeg1XyPOFuIG4k8
	vYylheCi4ZquCIPZT4Gu9CUzAb5OLmz8Xvat5q5oh/3UbsGsr5/lNUCVbeaMVnI4dTLU
	oxF0TBDGblXa1+3SFW2n/hSjB0ulDOv32fNG//kZTZkGGZkuJ6az2hP7BemIDngzdoFW
	Zpossbf0oE7cFPX/2g2eBsdOr8hGU7FrtyXTLdwjY5a/RL3HtroI1mJyGw9yE+SvvfUP
	olNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vILGCjKtV3eGAFYGxVaZEjKfTjQI0RrbwrN7GVSVEp4=;
	b=PehN9qaVOGnJbXoGxzV4J1hLQ79mxdgHgakFQtvJ1jhITSOSebKLtpT8lRvJXpRsPJ
	Ek52jSXFg3FEYpKCOb/8MHlLuqyBBVtxU11gardqU5ZLCFoNc2q8AVQakoPQ7fnZlgpq
	1L2LrSws/PIUSHdsqgkfjfbv5F/SMQXGoXG1yYeLFBHsS7+7NlOZzA1GuWkowf5ScMl/
	e5HsJRmWaoksp7iJZZpAYmepLmTmtfz1UqbEiMWkzPGpAk49LiMdXgi9e12CCmzZL2ou
	Wz+r2Ax99bIszansgAH2jgaWSQp/DEKjtc0I24WOMLF+w8qzXFAyIjXUzKzem8yeR3fu
	YNng==
X-Gm-Message-State: APjAAAWovrc5BRjqc0ooovhFrIAp7xiSlr9XX0LPRcujnoKDilBWwwZB
	gtDNa9HA0gdAyDIRKlPI2qlTvQfto78=
X-Google-Smtp-Source: APXvYqxm780O8ckDgYoEDh8DvDZ5LgviPaPxu/Ldk3Lgsd9780EhXxKJqwqCrOND8kBKjKxQ26FpoA==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr695153wrs.347.1565265193339; 
	Thu, 08 Aug 2019 04:53:13 -0700 (PDT)
Received: from [10.43.17.10] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	u130sm3196942wmg.28.2019.08.08.04.53.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 04:53:12 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <e13525a4-4885-e0f3-6711-efd83dd4a9fb@gmail.com>
Date: Thu, 8 Aug 2019 13:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 11:53:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Thu, 08 Aug 2019 11:53:15 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: ebiggers@kernel.org, snitzer@redhat.com, dm-devel@redhat.com,
	herbert@gondor.apana.org.au, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
 for IV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 08 Aug 2019 11:54:02 +0000 (UTC)

Hi,

On 07/08/2019 07:50, Ard Biesheuvel wrote:
> Instead of instantiating a separate cipher to perform the encryption
> needed to produce the IV, reuse the skcipher used for the block data
> and invoke it one additional time for each block to encrypt a zero
> vector and use the output as the IV.
> 
> For CBC mode, this is equivalent to using the bare block cipher, but
> without the risk of ending up with a non-time invariant implementation
> of AES when the skcipher itself is time variant (e.g., arm64 without
> Crypto Extensions has a NEON based time invariant implementation of
> cbc(aes) but no time invariant implementation of the core cipher other
> than aes-ti, which is not enabled by default)
> 
> This approach is a compromise between dm-crypt API flexibility and
> reducing dependence on parts of the crypto API that should not usually
> be exposed to other subsystems, such as the bare cipher API.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

For now I have just pair of images here to test, but seems checksums are ok.

Tested-by: Milan Broz <gmazyland@gmail.com>

I talked with Mike already, so it should go through DM tree now.

Thanks!
Milan


> ---
>  drivers/md/dm-crypt.c | 70 ++++++++++++++-----------------------------
>  1 file changed, 22 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index d5216bcc4649..48cd76c88d77 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -120,10 +120,6 @@ struct iv_tcw_private {
>  	u8 *whitening;
>  };
>  
> -struct iv_eboiv_private {
> -	struct crypto_cipher *tfm;
> -};
> -
>  /*
>   * Crypt: maps a linear range of a block device
>   * and encrypts / decrypts at the same time.
> @@ -163,7 +159,6 @@ struct crypt_config {
>  		struct iv_benbi_private benbi;
>  		struct iv_lmk_private lmk;
>  		struct iv_tcw_private tcw;
> -		struct iv_eboiv_private eboiv;
>  	} iv_gen_private;
>  	u64 iv_offset;
>  	unsigned int iv_size;
> @@ -847,65 +842,47 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
>  	return 0;
>  }
>  
> -static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
> -{
> -	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> -
> -	crypto_free_cipher(eboiv->tfm);
> -	eboiv->tfm = NULL;
> -}
> -
>  static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
>  			    const char *opts)
>  {
> -	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> -	struct crypto_cipher *tfm;
> -
> -	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
> -	if (IS_ERR(tfm)) {
> -		ti->error = "Error allocating crypto tfm for EBOIV";
> -		return PTR_ERR(tfm);
> +	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags)) {
> +		ti->error = "AEAD transforms not supported for EBOIV";
> +		return -EINVAL;
>  	}
>  
> -	if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
> +	if (crypto_skcipher_blocksize(any_tfm(cc)) != cc->iv_size) {
>  		ti->error = "Block size of EBOIV cipher does "
>  			    "not match IV size of block cipher";
> -		crypto_free_cipher(tfm);
>  		return -EINVAL;
>  	}
>  
> -	eboiv->tfm = tfm;
>  	return 0;
>  }
>  
> -static int crypt_iv_eboiv_init(struct crypt_config *cc)
> +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> +			    struct dm_crypt_request *dmreq)
>  {
> -	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +	u8 buf[MAX_CIPHER_BLOCKSIZE] __aligned(__alignof__(__le64));
> +	struct skcipher_request *req;
> +	struct scatterlist src, dst;
> +	struct crypto_wait wait;
>  	int err;
>  
> -	err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
> -	if (err)
> -		return err;
> -
> -	return 0;
> -}
> -
> -static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
> -{
> -	/* Called after cc->key is set to random key in crypt_wipe() */
> -	return crypt_iv_eboiv_init(cc);
> -}
> +	req = skcipher_request_alloc(any_tfm(cc), GFP_KERNEL | GFP_NOFS);
> +	if (!req)
> +		return -ENOMEM;
>  
> -static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> -			    struct dm_crypt_request *dmreq)
> -{
> -	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +	memset(buf, 0, cc->iv_size);
> +	*(__le64 *)buf = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
>  
> -	memset(iv, 0, cc->iv_size);
> -	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> -	crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
> +	sg_init_one(&src, page_address(ZERO_PAGE(0)), cc->iv_size);
> +	sg_init_one(&dst, iv, cc->iv_size);
> +	skcipher_request_set_crypt(req, &src, &dst, cc->iv_size, buf);
> +	skcipher_request_set_callback(req, 0, crypto_req_done, &wait);
> +	err = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> +	skcipher_request_free(req);
>  
> -	return 0;
> +	return err;
>  }
>  
>  static const struct crypt_iv_operations crypt_iv_plain_ops = {
> @@ -962,9 +939,6 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
>  
>  static struct crypt_iv_operations crypt_iv_eboiv_ops = {
>  	.ctr	   = crypt_iv_eboiv_ctr,
> -	.dtr	   = crypt_iv_eboiv_dtr,
> -	.init	   = crypt_iv_eboiv_init,
> -	.wipe	   = crypt_iv_eboiv_wipe,
>  	.generator = crypt_iv_eboiv_gen
>  };
>  
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
