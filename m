Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D57502C0
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:07:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 764803092649;
	Mon, 24 Jun 2019 07:07:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55F1F60BFC;
	Mon, 24 Jun 2019 07:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E243C1806B18;
	Mon, 24 Jun 2019 07:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O75saf024658 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 03:05:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92FF160C05; Mon, 24 Jun 2019 07:05:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3D460BFB
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 07:05:52 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09B6F33025E
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 07:05:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so12599261wrm.8
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 00:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/dsVZYxomLMoyXfQ9mUiAOft0OKIueHGnSJjcph32Cw=;
	b=GEIfAnvWKV2cM8oGcFp3ij+jFe48MAsv65mEMsXEuF0n6HNp090g3BbJ/pmx094Bl1
	hP02uJOzrd9bb5kYCp0rQDC+wu322cBBMfnFbBs/ggiXcm2xS4StK4pvVqbEhOmNNLwe
	ZQ81Cw1GBBkA5FU8XLioNSYwnj6Q5QnOfhRoVZQ+qmfx3nDAjVBSxMLiyn2qBv5r3cPR
	T50UFs+dAEHvc3fnRMOUnl2rRm0T8BKbTgKvWA69qATU9VpgAC5jksGE2/ZNF/fHWpuk
	XvL+Rvwv4EdS5cZeszfMm6XDuAIVb5IJEzkuDuGzFTQ/mx1WWWiL9WEx8ybZHBOYuoU1
	zW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/dsVZYxomLMoyXfQ9mUiAOft0OKIueHGnSJjcph32Cw=;
	b=Nr1WN7K3RzjtDmWfhDoAalrBdfYPcZy28+UCEqebtRzFKIl6+4jWWknFtNWfJ7DAmq
	OaUgd/oDO4MyGDwqnSb6Jo1vD0Jf000giHhoMnPxujnksJad3dcOqq3yVMlPPBjCjqBC
	lOfWtGXKOT6zX+taUuiMtGx7ulwt9dxFziB88+bgcjx3oCTnLi1qTjtWXOOOmoO0ub4Y
	fLoTlRJzEZ2OeHR/Xk8gGgzd72UDcDSr7paofpt1ML/URbsu8UbndLFYVT/ARsWerrQG
	fV3n+d+OL8hBTL72j3faElHFXiw6lI7ExzoqhP2xUe/WmQgIwX3KuS3yRuIY8m6R6xtm
	QFLw==
X-Gm-Message-State: APjAAAUli+/DetQubHBvg03kQl1GBuzyTbSFvsVVqVGzAUXSf/GqUZWT
	4eB3+aNa9mzwXsBevrIL/h/yv0VRbbzk0A==
X-Google-Smtp-Source: APXvYqyUI9sxarZRT7ca/pkV9SQLxHe4kaJgAVev+gcG6bN3l+xz6UD8eLF1tXxeq+KeVVwHdVs/HA==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr44329691wrv.25.1561359931675; 
	Mon, 24 Jun 2019 00:05:31 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	t15sm8225210wrx.84.2019.06.24.00.05.30
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 00:05:31 -0700 (PDT)
To: ard.biesheuvel@linaro.org, linux-crypto@vger.kernel.org
References: <20190621080918.22809-1-ard.biesheuvel@arm.com>
	<20190621080918.22809-5-ard.biesheuvel@arm.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <af75aefc-438b-9e31-b922-c847879d9dd9@gmail.com>
Date: Mon, 24 Jun 2019 09:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621080918.22809-5-ard.biesheuvel@arm.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 24 Jun 2019 07:05:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 24 Jun 2019 07:05:33 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.391 * (DKIM_ADSP_CUSTOM_MED, DKIM_INVALID, DKIM_SIGNED,
	FREEMAIL_FROM, NML_ADSP_CUSTOM_MED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v4 4/6] md: dm-crypt: switch to ESSIV crypto
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 24 Jun 2019 07:07:30 +0000 (UTC)

On 21/06/2019 10:09, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> 
> Replace the explicit ESSIV handling in the dm-crypt driver with calls
> into the crypto API, which now possesses the capability to perform
> this processing within the crypto subsystem.

I tried a few crazy dm-crypt configurations and was not able to crash it this time :-)

So, it definitely need some more testing, but for now, I think it works.

Few comments below for this part:

> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c

>  static const struct crypt_iv_operations crypt_iv_benbi_ops = {
>  	.ctr	   = crypt_iv_benbi_ctr,
>  	.dtr	   = crypt_iv_benbi_dtr,
> @@ -2283,7 +2112,7 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
>  	else if (strcmp(ivmode, "plain64be") == 0)
>  		cc->iv_gen_ops = &crypt_iv_plain64be_ops;
>  	else if (strcmp(ivmode, "essiv") == 0)
> -		cc->iv_gen_ops = &crypt_iv_essiv_ops;
> +		cc->iv_gen_ops = &crypt_iv_plain64_ops;

This is quite misleading - it looks like you are switching to plain64 here.
The reality is that it uses plain64 to feed the ESSIV wrapper.

So either it need some comment to explain it here, or just keep simple essiv_iv_ops
and duplicate that plain64 generator (it is 2 lines of code).

For the clarity, I would prefer the second variant (duplicate ops) here.

> @@ -2515,8 +2357,18 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
>  	if (!cipher_api)
>  		goto bad_mem;
>  
> -	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> -		       "%s(%s)", chainmode, cipher);
> +	if (*ivmode && !strcmp(*ivmode, "essiv")) {
> +		if (!*ivopts) {
> +			ti->error = "Digest algorithm missing for ESSIV mode";
> +			return -EINVAL;
> +		}
> +		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> +			       "essiv(%s(%s),%s,%s)", chainmode, cipher,
> +			       cipher, *ivopts);

This becomes quite long string already (limit is now 128 bytes), we should probably
check also for too long string. It will perhaps fail later, but I would better add

	if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
	...

> +	} else {
> +		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> +			       "%s(%s)", chainmode, cipher);
> +	}
>  	if (ret < 0) {
>  		kfree(cipher_api);
>  		goto bad_mem;
> 

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
