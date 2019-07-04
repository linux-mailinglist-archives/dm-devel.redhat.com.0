Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F95F92A
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 15:31:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF1373082E51;
	Thu,  4 Jul 2019 13:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 500DB140FD;
	Thu,  4 Jul 2019 13:30:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1919206D1;
	Thu,  4 Jul 2019 13:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64DU878018429 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 09:30:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44EE980E7; Thu,  4 Jul 2019 13:30:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F4D484268
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:30:05 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DFD9308339F
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:29:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so5765240wmj.3
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ayCRIhqWSMy1q+h3XFfGHK2FQt5FIGxphjkjd92VHhk=;
	b=gN6z8PaWvpr8YE/cko1K6YBvILZ7rGhriXRhyHHRuXAzd883jK/ww80apHEFrz4KIg
	P49jRyZPl6Xzc8PES+o4sjO0QVJVPKJaMD4Bcxj1MTIqQDH33XuMc2oPEJ5LeKakNEVg
	JYVZ1zw3Yudpjc3PqJg/XwmmlESvgf6GSm+a7GHMEWSYcjcL1qA++o/7thutebYIrhhc
	vBla3RyCP0OvRSO/tSQqs1pHfpdGLuCEW6YpDSvESdx0iGDVvj6zxwn6nltulp1QbZ+7
	LqMd5lVz33UpXeBQcj5GZR2KtSh89lAv8CU/7A2Oxx78JcKc0H1UhTcDkPbLlAMI6SLx
	qoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ayCRIhqWSMy1q+h3XFfGHK2FQt5FIGxphjkjd92VHhk=;
	b=j7XTguU5j9Q4cmL+kvTW78ZHngKAIVafJ7fYbe3AisEo5cJTpI3lezBFcKR4O/MLJ1
	b007k+Z/zm4rXw78MswITjzLsPKAyi5IGDp567qI7iXcQNrjDf/u8TvH4Tmzdysbhhc0
	VJitvzfgmHglxes5Cn6MpMaXLqMBBjy2L8bcUtqzUgNfDpb+gFL9R1CY3roo93LVvIdR
	7lRKBOgLD3hJj4S8KW+J4et9vIVS6GyC8o3CIL6DohEqIQ40bUqI5v5/cZIW9Bc5IRmo
	N1q8HWb6qoSWDlPt/+RrBoC+NmNF3pRXSYDk7u0p8XelMKulTQ2KOmiLZ57bYYutiPxl
	LFIw==
X-Gm-Message-State: APjAAAWuTIPNKiAGT91OUc+ZFfLfLkkOgwnt18c2ZzzaYjd3H+ybX5Xm
	krclDUwDYjv0v3G2B1fEwr8=
X-Google-Smtp-Source: APXvYqwW1jYLR8Ba8FxJ5l+p5J+yFVs7stOGcg8QskjeuX19yVbT5frTpAbrw5wnE0HNNleeKaGkFA==
X-Received: by 2002:a1c:5f87:: with SMTP id
	t129mr13528498wmb.150.1562246992850; 
	Thu, 04 Jul 2019 06:29:52 -0700 (PDT)
Received: from [10.43.17.24] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id o1sm4738327wrw.54.2019.07.04.06.29.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 06:29:51 -0700 (PDT)
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
Date: Thu, 4 Jul 2019 15:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704131033.9919-3-gmazyland@gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 04 Jul 2019 13:29:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 04 Jul 2019 13:29:54 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.089  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [dm-devel] [PATCH 3/3] dm-crypt: Implement eboiv - encrypted
 byte-offset initialization vector.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 04 Jul 2019 13:31:39 +0000 (UTC)

Hi Herbert,

I have a question about the crypto_cipher API in dm-crypt:

We are apparently trying to deprecate cryto_cipher API (see the ESSIV patchset),
but I am not sure what API now should be used instead.

See the patch below - all we need is to one block encryption for IV.

This algorithm makes sense only for FDE (old compatible Bitlocker devices),
I really do not want this to be shared in some crypto module...

What API should I use here? Sync skcipher? Is the crypto_cipher API
really a problem in this case?

Thanks,
Milan


On 04/07/2019 15:10, Milan Broz wrote:
> This IV is used in some BitLocker devices with CBC encryption mode.
> 
> NOTE: maybe we need to use another crypto API if the bare cipher
>       API is going to be deprecated.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> ---
>  drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 96ead4492787..a5ffa1ac6a28 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -120,6 +120,10 @@ struct iv_tcw_private {
>  	u8 *whitening;
>  };
>  
> +struct iv_eboiv_private {
> +	struct crypto_cipher *tfm;
> +};
> +
>  /*
>   * Crypt: maps a linear range of a block device
>   * and encrypts / decrypts at the same time.
> @@ -159,6 +163,7 @@ struct crypt_config {
>  		struct iv_benbi_private benbi;
>  		struct iv_lmk_private lmk;
>  		struct iv_tcw_private tcw;
> +		struct iv_eboiv_private eboiv;
>  	} iv_gen_private;
>  	u64 iv_offset;
>  	unsigned int iv_size;
> @@ -290,6 +295,10 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
>   *       is calculated from initial key, sector number and mixed using CRC32.
>   *       Note that this encryption scheme is vulnerable to watermarking attacks
>   *       and should be used for old compatible containers access only.
> + *
> + * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
> + *        The IV is encrypted little-endian byte-offset (with the same key
> + *        and cipher as the volume).
>   */
>  
>  static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
> @@ -838,6 +847,67 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
>  	return 0;
>  }
>  
> +static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
> +{
> +	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +
> +	crypto_free_cipher(eboiv->tfm);
> +	eboiv->tfm = NULL;
> +}
> +
> +static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
> +			    const char *opts)
> +{
> +	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +	struct crypto_cipher *tfm;
> +
> +	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
> +	if (IS_ERR(tfm)) {
> +		ti->error = "Error allocating crypto tfm for EBOIV";
> +		return PTR_ERR(tfm);
> +	}
> +
> +	if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
> +		ti->error = "Block size of EBOIV cipher does "
> +			    "not match IV size of block cipher";
> +		crypto_free_cipher(tfm);
> +		return -EINVAL;
> +	}
> +
> +	eboiv->tfm = tfm;
> +	return 0;
> +}
> +
> +static int crypt_iv_eboiv_init(struct crypt_config *cc)
> +{
> +	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +	int err;
> +
> +	err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
> +{
> +	/* Called after cc->key is set to random key in crypt_wipe() */
> +	return crypt_iv_eboiv_init(cc);
> +}
> +
> +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> +			    struct dm_crypt_request *dmreq)
> +{
> +	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> +
> +	memset(iv, 0, cc->iv_size);
> +	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> +	crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
> +
> +	return 0;
> +}
> +
>  static const struct crypt_iv_operations crypt_iv_plain_ops = {
>  	.generator = crypt_iv_plain_gen
>  };
> @@ -890,6 +960,14 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
>  	.generator = crypt_iv_random_gen
>  };
>  
> +static struct crypt_iv_operations crypt_iv_eboiv_ops = {
> +	.ctr	   = crypt_iv_eboiv_ctr,
> +	.dtr	   = crypt_iv_eboiv_dtr,
> +	.init	   = crypt_iv_eboiv_init,
> +	.wipe	   = crypt_iv_eboiv_wipe,
> +	.generator = crypt_iv_eboiv_gen
> +};
> +
>  /*
>   * Integrity extensions
>   */
> @@ -2293,6 +2371,8 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
>  		cc->iv_gen_ops = &crypt_iv_benbi_ops;
>  	else if (strcmp(ivmode, "null") == 0)
>  		cc->iv_gen_ops = &crypt_iv_null_ops;
> +	else if (strcmp(ivmode, "eboiv") == 0)
> +		cc->iv_gen_ops = &crypt_iv_eboiv_ops;
>  	else if (strcmp(ivmode, "lmk") == 0) {
>  		cc->iv_gen_ops = &crypt_iv_lmk_ops;
>  		/*
> @@ -3093,7 +3173,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  static struct target_type crypt_target = {
>  	.name   = "crypt",
> -	.version = {1, 18, 1},
> +	.version = {1, 19, 0},
>  	.module = THIS_MODULE,
>  	.ctr    = crypt_ctr,
>  	.dtr    = crypt_dtr,
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
