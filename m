Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13D503D0
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:42:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DE7030C021A;
	Mon, 24 Jun 2019 07:42:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BB75D9C5;
	Mon, 24 Jun 2019 07:41:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2EC419725;
	Mon, 24 Jun 2019 07:41:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O7eqvG010698 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 03:40:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54A175D9C9; Mon, 24 Jun 2019 07:40:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F87D5D9C8
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 07:40:50 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B9A30832D8
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 07:40:42 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k8so858962iot.1
	for <dm-devel@redhat.com>; Mon, 24 Jun 2019 00:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8dWeSIsidu/P7YsuUWucyysKYbzHuX6DsanqLCDVdyY=;
	b=cawtwA/hvq1bKSlAN/Yro4UJfOs1Do+w1Tz8Q7Ydrv6hktmpz7VixOW3j3Q3E9keTl
	PKzu4RemPIw4/Vwk8ahNyd6NleKRrU9S+Nf8icfFDTbnFXAwyPr4yRpCnc5V5v4SyR2C
	VdBApvsmq0eCN09kBZCfaOx0kKBRFYA7qQ/wqvqSPZ/MMrzFBK5JfkXETUouXdL6RQ8c
	w5yrm0YS84SUA0ZoE9sDyuF5+LkpyD/ChkdO0S7ega4LrB+bmLbjUxQ/9nFoAUN9o66x
	NIKkyFrEBi9TnzeOYxqOoOx8Vf8A1mTdUPkHZO2AZ8FscnXpZBpkTpDsnbUaWyeibIL0
	1IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8dWeSIsidu/P7YsuUWucyysKYbzHuX6DsanqLCDVdyY=;
	b=GHaLGnTsgpevnGmFzcznlvXBJPrlbUYmOLupNsJxTBd8ii12CNSeqrzt975j1HaFLl
	Kw2WcV7tbkFwwfcgkApPuhpmyQ6tERhEsV41OXq+UK+xrim1LJVQCrW4iPy7W8SgU6M7
	5awAwhBBBjhXs9S850w/+NSGTReLjbEPffAsvR8UuP48NeqAvWRCS0XrQKZ7isru39X3
	xTniYSDkDOOneDLRyqwnxuPiVrApBp3lVd7xx9w3JqKuwka+U9iUbruMYN1geCOp5K7a
	OlVc/+4WEjfLdRU6Yg43p/ypluIDmQ6J2PIzls7FcSW4zQDW+FZjF7ZQVu341zRRRu3g
	OiYA==
X-Gm-Message-State: APjAAAVg1VXB/f32GSFXCophOTzOyPyklkCkh2yAusGPXdQN2odheGgn
	Ync0947YZsgi7IlTi4roLA/cuaPtPvGdTDupF9DKT15p3RU=
X-Google-Smtp-Source: APXvYqxAkDNHhm8nw4Daqg7MaBDWvII5tBWjXXxj+x9xAMGNRq8t5fajlOjTlm53fZwOtP4vdRUYaCwMWuXihPzxOQE=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr32114562ioc.179.1561362041175;
	Mon, 24 Jun 2019 00:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:9896:0:0:0:0:0 with HTTP; Mon, 24 Jun 2019 00:40:40
	-0700 (PDT)
In-Reply-To: <af75aefc-438b-9e31-b922-c847879d9dd9@gmail.com>
References: <20190621080918.22809-1-ard.biesheuvel@arm.com>
	<20190621080918.22809-5-ard.biesheuvel@arm.com>
	<af75aefc-438b-9e31-b922-c847879d9dd9@gmail.com>
From: Surachai Saiwong <buriram1601@gmail.com>
Date: Mon, 24 Jun 2019 14:40:40 +0700
Message-ID: <CAL1AwE-77TnQubVJDDhtCb0CW9QkMD+h+oZ72CKCrSc7gtkJfw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 24 Jun 2019 07:40:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 24 Jun 2019 07:40:42 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'buriram1601@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.14  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <buriram1601@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, ard.biesheuvel@linaro.org,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 07:42:05 +0000 (UTC)

2562-06-24 14:05 GMT+07:00, Milan Broz <gmazyland@gmail.com>:
> On 21/06/2019 10:09, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>
>> Replace the explicit ESSIV handling in the dm-crypt driver with calls
>> into the crypto API, which now possesses the capability to perform
>> this processing within the crypto subsystem.
>
> I tried a few crazy dm-crypt configurations and was not able to crash it
> this time :-)
>
> So, it definitely need some more testing, but for now, I think it works.
>
> Few comments below for this part:
>
>> --- a/drivers/md/dm-crypt.c
>> +++ b/drivers/md/dm-crypt.c
>
>>  static const struct crypt_iv_operations crypt_iv_benbi_ops = {
>>  	.ctr	   = crypt_iv_benbi_ctr,
>>  	.dtr	   = crypt_iv_benbi_dtr,
>> @@ -2283,7 +2112,7 @@ static int crypt_ctr_ivmode(struct dm_target *ti,
>> const char *ivmode)
>>  	else if (strcmp(ivmode, "plain64be") == 0)
>>  		cc->iv_gen_ops = &crypt_iv_plain64be_ops;
>>  	else if (strcmp(ivmode, "essiv") == 0)
>> -		cc->iv_gen_ops = &crypt_iv_essiv_ops;
>> +		cc->iv_gen_ops = &crypt_iv_plain64_ops;
>
> This is quite misleading - it looks like you are switching to plain64 here.
> The reality is that it uses plain64 to feed the ESSIV wrapper.
>
> So either it need some comment to explain it here, or just keep simple
> essiv_iv_ops
> and duplicate that plain64 generator (it is 2 lines of code).
>
> For the clarity, I would prefer the second variant (duplicate ops) here.
>
>> @@ -2515,8 +2357,18 @@ static int crypt_ctr_cipher_old(struct dm_target
>> *ti, char *cipher_in, char *key
>>  	if (!cipher_api)
>>  		goto bad_mem;
>>
>> -	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
>> -		       "%s(%s)", chainmode, cipher);
>> +	if (*ivmode && !strcmp(*ivmode, "essiv")) {
>> +		if (!*ivopts) {
>> +			ti->error = "Digest algorithm missing for ESSIV mode";
>> +			return -EINVAL;
>> +		}
>> +		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
>> +			       "essiv(%s(%s),%s,%s)", chainmode, cipher,
>> +			       cipher, *ivopts);
>
> This becomes quite long string already (limit is now 128 bytes), we should
> probably
> check also for too long string. It will perhaps fail later, but I would
> better add
>
> 	if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
> 	...
>
>> +	} else {
>> +		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
>> +			       "%s(%s)", chainmode, cipher);
>> +	}
>>  	if (ret < 0) {
>>  		kfree(cipher_api);
>>  		goto bad_mem;
>>
>
> Thanks,
> Milan
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
