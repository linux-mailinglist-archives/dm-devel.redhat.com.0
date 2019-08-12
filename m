Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 697BD8972E
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 08:34:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A302F300501F;
	Mon, 12 Aug 2019 06:34:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA5410013A1;
	Mon, 12 Aug 2019 06:34:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA4381C93;
	Mon, 12 Aug 2019 06:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C6XgB9006939 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 02:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4890169CB8; Mon, 12 Aug 2019 06:33:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CA0690EA
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 06:33:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0654300DA78
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 06:33:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e8so9886108wme.1
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 23:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uZyZcBmr9tVQIt83TCEOc/l00emIgBlhTZYad4aAofw=;
	b=VB9Vzg2C9ADIvBOZK9/oZVxZHuPoA4uuMdlM8v54Tv/uS97hoV7BuBu5+Z7yoS+ssX
	OkmTggCX9e7unzkHVMuPMNBO7uR+NNeCOc9L6vU8aXow7MtKz5lybDdSMnvxyhHHE1KA
	3fxzEUqmmns1Qxl4ZHamdt48JWZASK3HjeItTT4r9fO3nN3d4GO0S46Oly6ZwfES+gJP
	7IhlzA5mWNZO9TyIEmm7rdJSoqDQtunFccbHv7e13O4plYnBzm34gQke+G61boJx+x/C
	KgkZunb7wLsqOAN/wSh1fNA8KKoPT3ghh5C11bCDSS9a+fwJpecz83ll2JNA0dhJH68+
	RYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uZyZcBmr9tVQIt83TCEOc/l00emIgBlhTZYad4aAofw=;
	b=o1oTB+3rIIugB6VuOw0B+K/v0YwiCWc6J2mso7HmwRH4z7uS6ulksSShmHAHMT9CKi
	6cONaZn0Hz1Xfdil+68mZh0kxcBADjsUPo6DRNOJkW63dyUpxuFp0SbKRansAPT+BJk3
	VTW1p8nbpVkhCFNyan0j8kZYIZbdhPsqWsQfKcAjt8tMG5tmhxlMm4HhD86qEvAJmKku
	JxGa/ZGrGUebQy/+t+NdznMORJYi6BviQGQhBYJ0U5Pgc7A7Rt570iEjtZg70mfftBqx
	530UDw51Yrx4rmffgfosx0UzZqrgjLbuUb1OhjMNdg7cLHmvvCPlRD4Mv+2vCeIopvnD
	AgDg==
X-Gm-Message-State: APjAAAU7pRDFsRvZvGv/AZdwoEXQg6aqVeH2VlB1azwX5u3UDBSsyC55
	qrUpmThTIjfkp29BNGddlpj/KFStFgQ=
X-Google-Smtp-Source: APXvYqyDs4Fx8K1sJ9CuUzgdhWOaNLbFjtMOEQR57ZK8iKqg6uKUoYsR6eSGr711E939zjTFoQ0l1w==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr15527259wmi.61.1565591614527; 
	Sun, 11 Aug 2019 23:33:34 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	r15sm110324859wrj.68.2019.08.11.23.33.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Aug 2019 23:33:33 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
Date: Mon, 12 Aug 2019 08:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810094053.7423-4-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 12 Aug 2019 06:33:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 12 Aug 2019 06:33:36 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.541  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v9 3/7] md: dm-crypt: switch to ESSIV crypto
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 12 Aug 2019 06:34:05 +0000 (UTC)

Hi,

On 10/08/2019 11:40, Ard Biesheuvel wrote:
> Replace the explicit ESSIV handling in the dm-crypt driver with calls
> into the crypto API, which now possesses the capability to perform
> this processing within the crypto subsystem.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/md/Kconfig    |   1 +
>  drivers/md/dm-crypt.c | 194 ++++----------------
>  2 files changed, 33 insertions(+), 162 deletions(-)
> 
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 3834332f4963..b727e8f15264 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
...
> @@ -2493,6 +2339,20 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
>  	if (*ivmode && !strcmp(*ivmode, "lmk"))
>  		cc->tfms_count = 64;
>  
> +	if (*ivmode && !strcmp(*ivmode, "essiv")) {
> +		if (!*ivopts) {
> +			ti->error = "Digest algorithm missing for ESSIV mode";
> +			return -EINVAL;
> +		}
> +		ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s)",
> +			       cipher_api, *ivopts);

This is wrong. It works only in length-preserving modes, not in AEAD modes.

Try for example
# cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1

It should produce Crypto API string
  authenc(hmac(sha256),essiv(cbc(aes),sha256))
while it produces
  essiv(authenc(hmac(sha256),cbc(aes)),sha256)
(and fails).

You can run "luks2-integrity-test" from cryptsetup test suite to detect it.

Just the test does not fail, it prints N/A for ESSIV use cases - we need to deal with older kernels...
I can probable change it to fail unconditionally though.

...
> @@ -2579,9 +2439,19 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
>  	if (!cipher_api)
>  		goto bad_mem;
>  
> -	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> -		       "%s(%s)", chainmode, cipher);
> -	if (ret < 0) {
> +	if (*ivmode && !strcmp(*ivmode, "essiv")) {
> +		if (!*ivopts) {
> +			ti->error = "Digest algorithm missing for ESSIV mode";
> +			kfree(cipher_api);
> +			return -EINVAL;
> +		}
> +		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> +			       "essiv(%s(%s),%s)", chainmode, cipher, *ivopts);

I guess here it is ok, because old forma cannot use AEAD.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
