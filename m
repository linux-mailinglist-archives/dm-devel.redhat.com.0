Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6775B761
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 11:00:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D12886658;
	Mon,  1 Jul 2019 09:00:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B3F7DF6A;
	Mon,  1 Jul 2019 09:00:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7558F1833002;
	Mon,  1 Jul 2019 09:00:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x618x2Ot028255 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 04:59:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E567519C77; Mon,  1 Jul 2019 08:59:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF5E219C6A
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 08:59:00 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4B04859FE
	for <dm-devel@redhat.com>; Mon,  1 Jul 2019 08:58:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x17so12831904wrl.9
	for <dm-devel@redhat.com>; Mon, 01 Jul 2019 01:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZB9muExd+RSQxfZ5iBdaCUVYKgpUh2nYBHfJCMQqlwM=;
	b=rkLqD8nsIxsU17ZfdAuRJ8warBj1jj6tvGOHtaWAD7/OAT76DX7iTHY8IoqV1e5gB/
	UOPE9oddHIHUMl1CAJn4qVd4xfTIe8k/rcoax8J3iSqW7ST0LLeTXaE2rkYkOIce2X3/
	jWYP28rh+z73YhLyIUrN1dyswvORGgg3rb+iJIAMSAOEiLR36WT/xUVRxHK6dp4z7nSD
	2sgcqO704bmvqPL+ovYer2voC96etiAlfhEKngI2Po1t14CZyzG3jqMgN6vFMxqc4FbV
	JfgfUc7FF7uWd0R6abg+0gPboyLZ99igkME3x3cgp2RqtjCAUkum1eZhiibbNu2nbc5N
	BHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZB9muExd+RSQxfZ5iBdaCUVYKgpUh2nYBHfJCMQqlwM=;
	b=l5cKV+X+o7lpt4tWKDXJK2Z1KNdbAZGwJh7/Js57Iit+60q6VKir74ykEBAYeJfKig
	IsHzenSjYJ5h+Mkqwdj7niM15WRcUlenEiRyb/Br9ue3j2q/WFEo1iMzYBC0q5eWXZuZ
	VtG7MPVontD4PpaGVJe0Zd0CA3RLEIfQJpqsaFqO0HjtK24+I+O0bJLPHLj9+OBP9C3s
	rs7fT3xkBn2lQrVS4BAMfB0ndeuosdsPhciJfIm/xf5WOpYsllCIUThn+28K7ZEudZFq
	8Dzzfp5g9qqBNBumjCLji/Rf5MHUbeZLqZECMIY17mMbfx9zKTm8cXnXQZdrtkd698yL
	GRpQ==
X-Gm-Message-State: APjAAAUrH89gx359NWjWcb4b9R2RgwuXoasDEoFod3mokebU97PY+wb1
	doxokeGeOgB+Wk0Iu8ZvAIQqqSElAkPbwg==
X-Google-Smtp-Source: APXvYqyTj05KTHOmaeXlXryvdapZhOUS73dINv2tfGU/2VcdFq7oHkdIhByIbaxcYLlieMQ2PeiSSA==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr8979377wrq.143.1561971529451; 
	Mon, 01 Jul 2019 01:58:49 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id x16sm9323427wmj.4.2019.07.01.01.58.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 01:58:49 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-4-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <767ec609-d805-9bc2-1a73-d5000ce7f109@gmail.com>
Date: Mon, 1 Jul 2019 10:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628152112.914-4-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 01 Jul 2019 08:58:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 01 Jul 2019 08:58:50 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.309  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v6 3/7] md: dm-crypt: infer ESSIV block
 cipher from cipher string directly
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 01 Jul 2019 09:00:36 +0000 (UTC)

On 28/06/2019 17:21, Ard Biesheuvel wrote:
> Instead of allocating a crypto skcipher tfm 'foo' and attempting to
> infer the encapsulated block cipher from the driver's 'name' field,
> directly parse the string that we used to allocated the tfm. These
> are always identical (unless the allocation failed, in which case
> we bail anyway), but using the string allows us to use it in the
> allocation, which is something we will need when switching to the
> 'essiv' crypto API template.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

>  drivers/md/dm-crypt.c | 35 +++++++++-----------

> @@ -2445,21 +2451,10 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
>  
>  	/* Alloc AEAD, can be used only in new format. */

^^ This comment is now obsolete, please move it with the code or remove it.

>  	if (crypt_integrity_aead(cc)) {
> -		ret = crypt_ctr_auth_cipher(cc, cipher_api);
> -		if (ret < 0) {
> -			ti->error = "Invalid AEAD cipher spec";
> -			return -ENOMEM;
> -		}
>  		cc->iv_size = crypto_aead_ivsize(any_tfm_aead(cc));
>  	} else
>  		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));

Otherwise

Reviewed-by: Milan Broz <gmazyland@gmail.com>

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
