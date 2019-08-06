Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD48336D
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 15:59:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EC06C009A05;
	Tue,  6 Aug 2019 13:59:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42F41001284;
	Tue,  6 Aug 2019 13:59:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D5474EE50;
	Tue,  6 Aug 2019 13:58:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76DJjEV016918 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 09:19:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA68C6061E; Tue,  6 Aug 2019 13:19:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D698360605;
	Tue,  6 Aug 2019 13:19:40 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C733F23D31;
	Tue,  6 Aug 2019 13:19:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so72333835wme.1;
	Tue, 06 Aug 2019 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YOmDP5pcS9DP+kILEPX6UYyio2UB1ntP/9I75g0ifwU=;
	b=hqoY8rdyta096nGprC4Fp5kIOvA+OpDXMtT8CFsQP8qF8pfm3fG0D1q1nFJbvGd2z9
	zZiFMTLaKzwd8PcuMKOQubNyDdAhHKxFQ5AgT0Tc9mtcW/2U9USUs6mraUdYnSlRWCCO
	0Co6nAICxQlZUfZ877upnqVryp+d5zEbotiAlJyLyxg0QdNM4R0iQZqKDuzNi72HCru8
	/bpdCyrluNfN+BCJr6VlAjIsySy/8ok6u1OeU8nOqCel3WZP5q1OFD9htBuAzoFied2B
	YBwzApUGHhjbZwettmdZlufbCVk1pRcNoWQgfZTkQGmz9z3KVFiRV6OQXN2lOgFcD4B3
	+4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YOmDP5pcS9DP+kILEPX6UYyio2UB1ntP/9I75g0ifwU=;
	b=ud1EkMH6aNLQBl9F89bG4visub74LlHOPbFsRvxILBMsPRvF6QBy9A7UdqCz8EsqEJ
	IB2WjJgdNXMxGHOid4LPnrr4CcUzdo4peHrcWwWvEZnYgEgRnxE2tSweG+7+6brh6Uhl
	m9O659PJpNS4lXp4lfwV0jBRoYNyaAVGhs9d6De74yX4pNyYffCxhDmlCY5EVrc/LXzL
	t25Hq9SIihhmm71M7m3a4Izc1h7o+dtUys1m35rAlKnorQ21x8mv8wh3j6HgutfZLBi6
	XZNaounzs9hBqRaRxDg1K+0/JoFYtQtYIVzTETqyyVmgO9rZy4Cg868WgIy1qnIwAy+u
	zfhw==
X-Gm-Message-State: APjAAAVJItANGHlMKneCViMv/i1k7bXIJAeKtvUSU8Shn5yFAOmXY3t9
	gmIjnpvYv2HUFdGCx9NVy5lKzj45PlA=
X-Google-Smtp-Source: APXvYqw6GndavLc1jXE4mw+YFt5Qemf4yvKM3zxDtz6Cg7Crq9Y7Bl3909My/muyCCo7xmJUq3DOcQ==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr5049545wmb.129.1565097576186; 
	Tue, 06 Aug 2019 06:19:36 -0700 (PDT)
Received: from [10.43.17.10] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	b8sm119228737wmh.46.2019.08.06.06.19.35
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 06:19:35 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Milan Broz <gmazyland@gmail.com>
References: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
	<20190806080234.27998-3-ard.biesheuvel@linaro.org>
	<22f5bfd5-7563-b85b-925e-6d46e7584966@gmail.com>
	<CAKv+Gu_LQwtM47njiksCJL2tMx_Zv8Paoegfkah--T6Mh55u3A@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <922068a1-6123-b4b6-fe2e-d453c28c45dd@gmail.com>
Date: Tue, 6 Aug 2019 15:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_LQwtM47njiksCJL2tMx_Zv8Paoegfkah--T6Mh55u3A@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 06 Aug 2019 13:19:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 06 Aug 2019 13:19:38 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, "Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] md/dm-crypt - switch to AES library
	for EBOIV
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 06 Aug 2019 13:59:12 +0000 (UTC)

On 06/08/2019 14:17, Ard Biesheuvel wrote:
> On Tue, 6 Aug 2019 at 13:43, Milan Broz <gmazyland@gmail.com> wrote:
>>
>> On 06/08/2019 10:02, Ard Biesheuvel wrote:
>>> The EBOIV IV mode reuses the same AES encryption key that is used for
>>> encrypting the data, and uses it to perform a single block encryption
>>> of the byte offset to produce the IV.
>>>
>>> Since table-based AES is known to be susceptible to known-plaintext
>>> attacks on the key, and given that the same key is used to encrypt
>>> the byte offset (which is known to an attacker), we should be
>>> careful not to permit arbitrary instantiations where the allocated
>>> AES cipher is provided by aes-generic or other table-based drivers
>>> that are known to be time variant and thus susceptible to this kind
>>> of attack.
>>>
>>> Instead, let's switch to the new AES library, which has a D-cache
>>> footprint that is only 1/32th of the generic AES driver, and which
>>> contains some mitigations to reduce the timing variance even further.
>>
>> NACK.
>>
>> We discussed here that we will not limit combinations inside dm-crypt.
>> For generic crypto API, this policy should be different, but I really
>> do not want these IVs to be visible outside of dm-crypt.
>>
>> Allowing arbitrary combinations of a cipher, mode, and IV is how dm-crypt
>> works since the beginning, and I really do not see the reason to change it.
>>
>> This IV mode is intended to be used for accessing old BitLocker images,
>> so I do not care about performance much.
>>
> 
> Apologies for being blunt, but you are basically driving home the
> point I made before about why the cipher API should become internal to
> the crypto subsystem.
> 
> Even though EBOIV is explicitly only intended for accessing old
> BitLocker images, you prioritize non-functional properties like API
> symmetry and tradition over sound cryptographic engineering practice,
> even after I pointed out to you that
> a) the way EBOIV uses the same symmetric key for two different
> purposes is a bad idea in general, and
> b) table based AES in particular is a hazard for this mode, since the
> way the IV is generated is susceptible to exactly the attack that
> table based AES is most criticized for.
> 
> So if you insist on supporting EBOIV in combination with arbitrary
> skciphers or AEADs (or AES on systems where crypto_alloc_cipher()
> produces a table based AES driver), how do you intend to mitigate
> these issues?
 I am not going to mitigate these. We will never format new devices
using these exotic configurations. And if user enforces it, there can be
a reason - or it is just stupid, like using cipher_null.
(Which is entirely insecure but very useful for testing.)

The IV concept in dm-crypt is straightforward and allows many insecure
and obscure combinations (aes-ecb-null, for example - and this is used
for millions of chipset encrypted drivers, people used it to access through
dmcrypt without the USB bridge.) The same applies for obscure cryptloop
image combinations. (I would better spent time to remove cryptoloop,
it is much worse that what we are discussing here :)

So I see no reason to spend hours and hours attacks for devices
that use crypto that is obsolete anyway (all new drives use XTS).

I would like to provide way to access data on existing, maybe obsolete and insecure,
encrypted images from foreign OSes.

But all that said is meant in the isolated context of dm-crypt driver,
if you want to provide generic API, it perhaps makes sense to enforce such a policy.

I understand you want to propose more secure ways of implementing crypto,
but then - if you decide to remove existing API I used, we can switch to something better.
(Is there something better except AES-only lib you used?)

I just disagree with adding various checks for cipher/mode/iv combinations inside dm-crypt.
It was meant to be configurable from userspace.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
