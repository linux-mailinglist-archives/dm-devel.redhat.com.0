Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF748AD2
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 19:54:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61BA8776D5;
	Mon, 17 Jun 2019 17:53:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFC8D5E7C6;
	Mon, 17 Jun 2019 17:53:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A42051806B12;
	Mon, 17 Jun 2019 17:53:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HHqpSn022405 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 13:52:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF04F7DF66; Mon, 17 Jun 2019 17:52:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E92967DF63
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:52:49 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F8FF30C79A8
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:52:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so10912049wru.10
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FMNyAGci+1vv5qg7rKwKydEtDLbo9Wlt1X0ych19Ewc=;
	b=urmUSgh9tF3F62J4bEZmojsMD4JAHsM3KUMy4kiZL62eDAvkdCtyuPW/UKA3Ica0uW
	0ZTLGLk+2Z1otWThtmM2jSTJCg6gIuDD9p2loMDnCEJjcgYvh1CYxWhD1FzuAhtuGp/z
	SiAoGTI8xItGjWpW5D/uL0U+ZbRRXhT6bE9ihyJLQblbgEFvExO6WO1xp+mxTMCKv5Ff
	b7EzOfK2aAYRmqttRzor8ZPw7jiGCAsjp6naQt7282xLNZHjLHrnN/nmrgfVghrIBx3k
	X4SFiWzKEbg5tuCgUH0+XTdfHN9uzvUp4iwCVTyHyG3O+sBbD21yYQk5p7ycHi4f/eJZ
	fIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FMNyAGci+1vv5qg7rKwKydEtDLbo9Wlt1X0ych19Ewc=;
	b=P8r/E9V9MSCZW6pYDDVh8RSmJ+L/54/KI72MJH+5sVUeLyXacvgkOdWECaHLG+qat8
	VnF5QpJHzEfOpjAi98twLbVU5JahMXr4DTQ8inGQGiMKVpHPiaO4ty88c6gcKQItK76Y
	pYp6tOSdvuXie+ValQKpn8PU9Tw2rJT9QsadDfePsg6uG8YJ5pV48o9o3wHfqfInyu/f
	IE7Wuqzx0q86m+i7mevLJRE+iGaxzjqul4kNAtXripCm2jOtf/J7oEf5/Fv/5d1/I4kp
	NseeS4yBHg+SV7wXfiU3pDJMBKwCP7WqWUu2NkDDe5Bom22AKBc9txkRNCdJclLoNtvX
	ZEQA==
X-Gm-Message-State: APjAAAWxTay2nMpL5o7npxpxRBxJjOxI993GObtjxnKqPkq+OjZM39XF
	4RoDi6tveM5LqKMDfTgfmDA=
X-Google-Smtp-Source: APXvYqxr6IIazoq3qaPHcNh1UDqgm+Shl1gva0JzuijN+e5bVTSaFJL7YdibRGjKUNadAIAgDpEGlA==
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr25495595wru.242.1560793956857; 
	Mon, 17 Jun 2019 10:52:36 -0700 (PDT)
Received: from [192.168.2.28] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id u2sm292638wmc.3.2019.06.17.10.52.35
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 10:52:36 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
	<CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
	<90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
	<CAKv+Gu82BLPWrX1UzUBLf7UB+qJT6ZPtkvJ2Sa9t28OpXArhnw@mail.gmail.com>
	<af1b7ea1-bc98-06ff-e46c-945e6bae20d8@gmail.com>
	<CAKv+Gu-37P+_4=Men92wR7S7LQS7U-4L2-ZaPdEN18TWAa3QaQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <900cdd2e-eccc-3188-fdb0-911e713e0cda@gmail.com>
Date: Mon, 17 Jun 2019 19:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-37P+_4=Men92wR7S7LQS7U-4L2-ZaPdEN18TWAa3QaQ@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 17 Jun 2019 17:52:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 17 Jun 2019 17:52:38 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 17:54:03 +0000 (UTC)

On 17/06/2019 19:29, Ard Biesheuvel wrote:
> On Mon, 17 Jun 2019 at 19:05, Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 17/06/2019 16:39, Ard Biesheuvel wrote:
>>>>
>>>> In other words, if you add some additional limit, we are breaking backward compatibility.
>>>> (Despite the configuration is "wrong" from the security point of view.)
>>>>
>>>
>>> Yes, but breaking backward compatibility only happens if you break
>>> something that is actually being *used*. So sure,
>>> xts(aes)-essiv:sha256 makes no sense but people use it anyway. But is
>>> that also true for, say, gcm(aes)-essiv:sha256 ?
>>
>> These should not be used.  The only way when ESSIV can combine with AEAD mode
>> is when you combine length-preserving mode with additional integrity tag, for example
>>
>>   # cryptsetup luksFormat -c aes-cbc-essiv:sha256 --integrity hmac-sha256 /dev/sdb
>>
>> it will produce this dm-crypt cipher spec:
>>   capi:authenc(hmac(sha256),cbc(aes))-essiv:sha256
>>
>> the authenc(hmac(sha256),cbc(aes)) is direct crypto API cipher composition, the essiv:sha256
>> IV is processed inside dm-crypt as IV.
>>
>> So if authenc() composition is problem, then yes, I am afraid these can be used in reality.
>>
>> But for things like gcm(aes)-essiv:sha256 (IOW real AEAD mode with ESSIV) - these are
>> not supported by cryptsetup (we support only random IV in this case), so these should
>> not be used anywhere.
>>
> 
> OK, understood. Unfortunately, that means that the essiv template
> should be dynamically instantiated as either a aead or a skcipher
> depending on the context, but perhaps this is not a big deal in
> reality, I will check.
> 
> One final question before I can proceed with my v2: in
> crypt_ctr_blkdev_cipher(), do you think we could change the code to
> look at the cipher string rather than the name of the actual cipher?
> In practice, I don't think they can be different, but in order to be
> able to instantiate
> 'essiv(authenc(hmac(sha256),cbc(aes)),sha256,aes)', the cipher part
> needs to be parsed before the TFM(s) are instantiated.

You mean to replace crypto_tfm_alg_name() with the cipher string
from the device-mapper table constructor?

I hope I am not missing anything, but it should be ok. It just could
fail later (in tfm init).
The constructor is de-facto atomic step for device-mapper, I think
it does not matter when it fails, the effect of failure is the same
for userspace.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
