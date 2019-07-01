Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CC5B768
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 11:03:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1096C04BD44;
	Mon,  1 Jul 2019 09:03:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3269563B82;
	Mon,  1 Jul 2019 09:03:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AE061833002;
	Mon,  1 Jul 2019 09:03:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6190CVf029019 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 05:00:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6DA817CFF; Mon,  1 Jul 2019 09:00:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1AB517D32
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 09:00:09 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5698430872EE
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 08:59:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a15so14977281wmj.5
	for <dm-devel@redhat.com>; Mon, 01 Jul 2019 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w61ODbvkI0Zrw3EYxOf1VfxblVTs7Fwinzs4mF4Uw28=;
	b=dgvfmzPiBGjYavETfH1aqOg3TgAJMNmg3yENDIayIfGIrNEAbCCpjzOEXYJQjulb4/
	Fl0Dx5Q5MPg3IMUNN79TmVblHeswOa0YrCw8Zn6Nf1r2mMzOGCsa1m0nXVjnxcjY8Tfo
	zJFTPeju8KBM3BtrWtwmlc5+bS36CehftgWDjYHmNy5yNdDDqfqhWgaanbvsjN83wtj2
	SwKhJ6XEQf+b+fRZeVTMGujH3grDIgBlvu2UBlUnHNccdMRwemuSGQti04Be1zNW6JVS
	6HQaq7mxIoCcxhgjnyDFmECj34cWIyUhgTHzmnN7z/+LVjtWuTwV47A0DEcQc7FYiTVe
	Or1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w61ODbvkI0Zrw3EYxOf1VfxblVTs7Fwinzs4mF4Uw28=;
	b=f+6dz6c19TwnbylxVycVUxuPBmn1pGcjutdqiNVcSKMnlXkvJXzI1pTRFs4b60ZiPv
	xnssjWrqKH8MMULmhyYFG61Pfnp5ByO5BgVXBUbT5+8AMWhNn/5S2uOX5xS//mzO1JpK
	SxnW6G2Lfqp+q8wwO1dU4/LyrX6Tt28BER8QldIl7mun5SPDCDdqNIYDpu4Z+OUZacbM
	Az+c/xsJ2Phh18QNk0VN3+M3JqSktG1YxSlLvBnWY7+nRtd/NNKhBZd6PY0soUcNWRCJ
	9U8YNe2xV6/8jJLcDok4zNcffTV4YRPS4AgScpl+o0umb6UE84kjVlL3B67/vrHmvj4z
	ahBw==
X-Gm-Message-State: APjAAAWcySJbio9Migt0cEjQG7QvCXTzUruDOcZczc4TF4iQXdPMv4Yy
	KBqi0rbsinM/kqfnm48xNwY=
X-Google-Smtp-Source: APXvYqxrdqHGK9w8pJlZpIcrlORI9AX1/geKS8zqY+DV00b239EBSoZEjEHk6Kkaoy3lOnz8HytdJA==
X-Received: by 2002:a05:600c:2182:: with SMTP id
	e2mr16175249wme.104.1561971593030; 
	Mon, 01 Jul 2019 01:59:53 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	r16sm18499171wrr.42.2019.07.01.01.59.52
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 01:59:52 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-5-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f068888f-1a13-babf-0144-07939a79d9d9@gmail.com>
Date: Mon, 1 Jul 2019 10:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628152112.914-5-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 01 Jul 2019 08:59:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 01 Jul 2019 08:59:54 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v6 4/7] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 01 Jul 2019 09:03:32 +0000 (UTC)

On 28/06/2019 17:21, Ard Biesheuvel wrote:
> Replace the explicit ESSIV handling in the dm-crypt driver with calls
> into the crypto API, which now possesses the capability to perform
> this processing within the crypto subsystem.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

>  drivers/md/dm-crypt.c | 200 ++++----------------

...

> -/* Wipe salt and reset key derived from volume key */
> -static int crypt_iv_essiv_wipe(struct crypt_config *cc)

Do I understand it correctly, that this is now called inside the whole cipher
set key in wipe command (in crypt_wipe_key())?

(Wipe message is meant to suspend the device and wipe all key material
from memory without actually destroying the device.)

> -{
> -	struct iv_essiv_private *essiv = &cc->iv_gen_private.essiv;
> -	unsigned salt_size = crypto_shash_digestsize(essiv->hash_tfm);
> -	struct crypto_cipher *essiv_tfm;
> -	int r, err = 0;
> -
> -	memset(essiv->salt, 0, salt_size);
> -
> -	essiv_tfm = cc->iv_private;
> -	r = crypto_cipher_setkey(essiv_tfm, essiv->salt, salt_size);
> -	if (r)
> -		err = r;
> -
> -	return err;
> -}

...

> @@ -2435,9 +2281,19 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
>  	}
>  
>  	ret = crypt_ctr_blkdev_cipher(cc, cipher_api);
> -	if (ret < 0) {
> -		ti->error = "Cannot allocate cipher string";
> -		return -ENOMEM;
> +	if (ret < 0)
> +		goto bad_mem;
> +
> +	if (*ivmode && !strcmp(*ivmode, "essiv")) {
> +		if (!*ivopts) {
> +			ti->error = "Digest algorithm missing for ESSIV mode";
> +			return -EINVAL;
> +		}
> +		ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s,%s)",
> +			       cipher_api, cc->cipher, *ivopts);
> +		if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME)
> +			goto bad_mem;

Hm, nitpicking, but goto from only one place while we have another -ENOMEM above...

Just place this here without goto?

> +	ti->error = "Cannot allocate cipher string";
> +	return -ENOMEM;

Otherwise

Reviewed-by: Milan Broz <gmazyland@gmail.com>

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
