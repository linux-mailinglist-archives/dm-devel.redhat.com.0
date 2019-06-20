Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CED4CE7F
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:18:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1DCC3092677;
	Thu, 20 Jun 2019 13:17:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D05BB5DA5B;
	Thu, 20 Jun 2019 13:17:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3057206D2;
	Thu, 20 Jun 2019 13:16:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDF9W2025993 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:15:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5527E1001E67; Thu, 20 Jun 2019 13:15:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E2021001DDC
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:15:07 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77ED130BB557
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:14:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p11so2982299wre.7
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yUEjeqQ0jNyrj9kyIDpLfI3dn5L2tIgCnprfg5xm1/c=;
	b=ShTJHW6Udd+/LO/fIOr8xO03mRnKoXy3kpjQxkHSCJDlcadPO4WrmNfFwjNYFk75M8
	yr3leADjmiHH1pynhsZgiQYqXu/4DRdLzPapwV+Eb05vLXR4PRThYyxdABLREf+v8FRO
	qesMcdbvenbMowdKbRAsMsNks9rSDvFkGD4txyMngAj54Tp24bFCoO5htf2MHTPSywo8
	ocS1Zu8VrYi5XtcjH9YUsO9sGQ5BEMY/fDAKtjI1LBX/iSyonmS6q2TYI3dq32MWDZG6
	uWY/I+NdkWjKkW5B3BtjZXs5Yw8NMmMjx7KN17n6/u8Q8dO1miDpfCIqYe96O29d2KLo
	kgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yUEjeqQ0jNyrj9kyIDpLfI3dn5L2tIgCnprfg5xm1/c=;
	b=ZL+mGuPnLy4myGCkneFrHmyuYespZoTxj1hlG4o8Qo0wB5EihYhkxhATG474wnQJKy
	/+xHiOSwkCa4DWlSRCm/ro5yRo20KVbnbTn31CDzuJ0RGlTxWBnQykyB2jUj7+6YNtMA
	cB18Hi+DNiXOBx1fm/q++a35CZtcBwLhuBeGJ3QgaV0BcLIxqB2otLD/ZJa8zji3NvUR
	mpCr3orANi7HLCuAJKiuhjCKNNTZDsoyt00L/1sgLIJQ8yZKnhMAM6sk2SISfuJemaKg
	DV9A0LRuOvq8/JVYMGlaVAYwr1mgwCaxZlX7kKQ18VoW11eJhVfuTG17HIvOZSw/9gVu
	pFkw==
X-Gm-Message-State: APjAAAWhTXDR+HOn/8LCTEJ+euh8oMVjerAC+47dI1XiympySkZ0ny4C
	YnT9+etgosxqccW2G0e3/8k=
X-Google-Smtp-Source: APXvYqzkYTONjcOvje7w7mlhrENaLDkyERI+zs7xtF5UEmgBcddzsKV9+lyHCOnmYpjzRy3uQ+K+Qw==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr3756893wrs.178.1561036494161; 
	Thu, 20 Jun 2019 06:14:54 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	k82sm5780984wma.15.2019.06.20.06.14.53
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 06:14:53 -0700 (PDT)
To: Milan Broz <gmazyland@gmail.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
	<CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
	<075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <6a45dfa5-e383-d8a3-ebf1-abdc43c95ebd@gmail.com>
Date: Thu, 20 Jun 2019 15:14:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 20 Jun 2019 13:14:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 20 Jun 2019 13:14:55 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
	ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 20 Jun 2019 13:18:40 +0000 (UTC)

On 20/06/2019 14:09, Milan Broz wrote:
> On 20/06/2019 13:54, Ard Biesheuvel wrote:
>> On Thu, 20 Jun 2019 at 13:22, Milan Broz <gmazyland@gmail.com> wrote:
>>>
>>> On 19/06/2019 18:29, Ard Biesheuvel wrote:
>>>> This series creates an ESSIV template that produces a skcipher or AEAD
>>>> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
>>>> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
>>>> encapsulated sync or async skcipher/aead by passing through all operations,
>>>> while using the cipher/shash pair to transform the input IV into an ESSIV
>>>> output IV.
>>>>
>>>> This matches what both users of ESSIV in the kernel do, and so it is proposed
>>>> as a replacement for those, in patches #2 and #4.
>>>>
>>>> This code has been tested using the fscrypt test suggested by Eric
>>>> (generic/549), as well as the mode-test script suggested by Milan for
>>>> the dm-crypt case. I also tested the aead case in a virtual machine,
>>>> but it definitely needs some wider testing from the dm-crypt experts.
>>>>
>>>> Changes since v2:
>>>> - fixed a couple of bugs that snuck in after I'd done the bulk of my
>>>>   testing
>>>> - some cosmetic tweaks to the ESSIV template skcipher setkey function
>>>>   to align it with the aead one
>>>> - add a test case for essiv(cbc(aes),aes,sha256)
>>>> - add an accelerated implementation for arm64 that combines the IV
>>>>   derivation and the actual en/decryption in a single asm routine
>>>
>>> I run tests for the whole patchset, including some older scripts and seems
>>> it works for dm-crypt now.
>>>
>>
>> Thanks Milan, that is really helpful.
>>
>> Does this include configurations that combine authenc with essiv?
> 
> Hm, seems that we are missing these in luks2-integrity-test. I'll add them there.
> 
> I also used this older test
> https://gitlab.com/omos/dm-crypt-test-scripts/blob/master/root/test_dmintegrity.sh
> 
> (just aes-gcm-random need to be commented out, we never supported this format, it was
> written for some devel version)
> 
> But seems ESSIV is there tested only without AEAD composition...
> 
> So yes, this AEAD part need more testing.

And unfortunately it does not work - it returns EIO on sectors where it should not be data corruption.

I added few lines with length-preserving mode with ESSIV + AEAD, please could you run luks2-integrity-test
in cryptsetup upstream?

This patch adds the tests:
https://gitlab.com/cryptsetup/cryptsetup/commit/4c74ff5e5ae328cb61b44bf99f98d08ffee3366a

It is ok on mainline kernel, fails with the patchset:

# ./luks2-integrity-test 
[aes-cbc-essiv:sha256:hmac-sha256:128:512][FORMAT][ACTIVATE]sha256sum: /dev/mapper/dmi_test: Input/output error
[FAIL]
 Expecting ee501705a084cd0ab6f4a28014bcf62b8bfa3434de00b82743c50b3abf06232c got .

FAILED backtrace:
77 ./luks2-integrity-test
112 intformat ./luks2-integrity-test
127 main ./luks2-integrity-test

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
