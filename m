Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA338A016
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 15:51:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD326316E531;
	Mon, 12 Aug 2019 13:51:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5128771C82;
	Mon, 12 Aug 2019 13:51:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE761180B536;
	Mon, 12 Aug 2019 13:51:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CDpDCx021897 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 09:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B4CB71C8D; Mon, 12 Aug 2019 13:51:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E0271C82
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 13:51:13 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D39530084AE
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 13:51:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z23so11852913wmf.2
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rBbM+UdJ5ZjF04CiXCd6y2tkG1h3M6zsC0WpzRFsUIQ=;
	b=DIKKpbK7MTnkOm83W/loz9snj3ua+vVVx7sWii6rL6U7FiE6ngBOI8ozRpV3njikkE
	2eeQiuTX3UiBBh8WL0OwXy4/EW0AW8Qi95jB0GK2XuQ0q5rq4q/Z7315cE5LKZetPgy+
	0QIuQGM4EMMvHuYvLpRW8q8kJp2xGf3i/bfRjdTLIN5ZyEw0LK7aOXhSxz/n1E1pSknF
	pPISm8xkLwRI/XBPxQNMEo/TGyBLJA1x56OAxr8gyfY4LUFjPUSmw21ScbQiprleWxEr
	SzgVgsTNx0JzUKHxXUN85Sk+tUNaRZ1nBEPjHn9u8TMcSzpJKuTf6xnlX97REZXhvqFT
	Cdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rBbM+UdJ5ZjF04CiXCd6y2tkG1h3M6zsC0WpzRFsUIQ=;
	b=db/U83Rjm4zUjqkDnHMjue3XlVLO6fWaUoBZc0MEMHM7kYBL0dfFIGjHEEJu99jsWc
	hIa4cHKdm+xZjm7VmP/mgFRyoaDgwBAefNg4IhTALVTBCb7j/uGN1dVwnNzaSRPZx0Sf
	utirgGX+c1g9cuQaAMg6rjxCRY6faZ7ATBcGw7iNm6AqhkUNV9/Fitu1+gxrzuKCN2zG
	xY/L1joUn5dj0ochJ3yj4iP1y5V7sIf9mWLtaur2XATkmAT41UALid/OozhigxaWyJ56
	zMHjO4Lp6mcTei5dk0wb5oJfPwNYykW83WXSY9SQlIyZuShKKck7ivLNi+7QIHR4GALy
	SUTQ==
X-Gm-Message-State: APjAAAWiKzJlhOcefgaBL4U79f+qTORV3bI9kZnXP7sc1yxgFyjtPdk1
	O8qovP1KOe/qeHguJcyddbo=
X-Google-Smtp-Source: APXvYqydyG0HxLjtoA5pPzW3JZSa52vifGyk5rD7QL125itbnnPxp17aqg2nTfJDRX/Epo3eoRVuEA==
X-Received: by 2002:a1c:6087:: with SMTP id
	u129mr27021088wmb.108.1565617870305; 
	Mon, 12 Aug 2019 06:51:10 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	e11sm13985393wrc.4.2019.08.12.06.51.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 06:51:09 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
	<8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
	<CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
	<82a87cae-8eb7-828c-35c3-fb39a9abe692@gmail.com>
	<CAKv+Gu_d+3NsTKFZbS+xeuxf5uCz=ENmPX-a=s-2kgLrW4d7cQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <7b3365a9-42ca-5426-660f-e87898bb9f7a@gmail.com>
Date: Mon, 12 Aug 2019 15:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_d+3NsTKFZbS+xeuxf5uCz=ENmPX-a=s-2kgLrW4d7cQ@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 12 Aug 2019 13:51:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 12 Aug 2019 13:51:11 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.541  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 12 Aug 2019 13:51:37 +0000 (UTC)

On 12/08/2019 09:50, Ard Biesheuvel wrote:
> On Mon, 12 Aug 2019 at 10:44, Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 12/08/2019 08:54, Ard Biesheuvel wrote:
>>> On Mon, 12 Aug 2019 at 09:33, Milan Broz <gmazyland@gmail.com> wrote:
>>>> Try for example
>>>> # cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1
>>>>
>>>> It should produce Crypto API string
>>>>   authenc(hmac(sha256),essiv(cbc(aes),sha256))
>>>> while it produces
>>>>   essiv(authenc(hmac(sha256),cbc(aes)),sha256)
>>>> (and fails).
>>>>
>>>
>>> No. I don't know why it fails, but the latter is actually the correct
>>> string. The essiv template is instantiated either as a skcipher or as
>>> an aead, and it encapsulates the entire transformation. (This is
>>> necessary considering that the IV is passed via the AAD and so the
>>> ESSIV handling needs to touch that as well)
>>
>> Hm. Constructing these strings seems to be more confusing than dmcrypt mode combinations :-)
>>
>> But you are right, I actually tried the former string (authenc(hmac(sha256),essiv(cbc(aes),sha256)))
>> and it worked, but I guess the authenticated IV (AAD) was actually the input to IV (plain sector number)
>> not the output of ESSIV? Do I understand it correctly now?
>>
> 
> Indeed. The former string instantiates the skcipher version of the
> ESSIV template, and so the AAD handling is omitted, and we end up
> using the plain IV in the authentication rather than the encrypted IV.
> 
> So when using the latter string, does it produce any error messages
> when it fails?

The error is
table: 253:1: crypt: Error decoding and setting key

and it is failing in crypt_setkey() int this  crypto_aead_setkey();

And it is because it now wrongly calculates MAC key length.
(We have two keys here - one for length-preserving CBC-ESSIV encryption
and one for HMAC.)

This super-ugly hotfix helps here... I guess it can be done better :-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index e9a0093c88ee..7b06d975a2e1 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2342,6 +2342,9 @@ static int crypt_ctr_auth_cipher(struct crypt_config *cc, char *cipher_api)
        char *start, *end, *mac_alg = NULL;
        struct crypto_ahash *mac;
 
+       if (strstarts(cipher_api, "essiv(authenc("))
+               cipher_api += strlen("essiv(");
+
        if (!strstarts(cipher_api, "authenc("))
                return 0;
 
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
