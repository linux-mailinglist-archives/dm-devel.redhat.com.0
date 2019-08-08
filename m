Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0F8624D
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 14:53:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B676300260E;
	Thu,  8 Aug 2019 12:53:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4DAA5D9CC;
	Thu,  8 Aug 2019 12:53:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B54D424F30;
	Thu,  8 Aug 2019 12:53:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78CqgvU031907 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 08:52:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C5A75D9CC; Thu,  8 Aug 2019 12:52:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9FA5D9D3;
	Thu,  8 Aug 2019 12:52:37 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E4D5302246D;
	Thu,  8 Aug 2019 12:52:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z1so94820793wru.13;
	Thu, 08 Aug 2019 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YWHYbWqY351NKxb89r4Xk4spZ3MRrynqi74kHBEauB4=;
	b=i1KjPVL7wuLeDIrZtcsn++lCvUh8QZ1KjRwNMn1TdhsFIfY4/fMa1AINrFpJ/9xTbB
	2M23mbb3hV81tjHLQ43l4vzcIKxkguqHM//x56/q7KHVa2s7wsuTHXoGYZD3QNa/pdML
	UlpdHY2kPVLO8Chzw3Uu+lRLPbCviV0EK+DUdmXCn1PiZ71EYsTyfvyGx5+5GAuxKnzo
	s0I/yGL+IlUaZfMbjfLmdSI5p4TR0DEs4fwnNfHik7S+G+IOHEFcfMvea3+awkwVHf3r
	vTUn9ugtP7qxSww3O91a+0yntuGu/MLElK/QgskXcLrxruB8gaTAqKV5ZmAwTC4RTnzu
	IQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YWHYbWqY351NKxb89r4Xk4spZ3MRrynqi74kHBEauB4=;
	b=XqLt1Z0D6ztEsUevMy/OVU9Z0MIlMkPk+HajCy6Q98Jseig0yb98AhSF4GOQbTa7Tx
	FLepXSiqC9BuyTuDPv8HgIuGCc+ZcEXEoHrcMV4GSvPn+d20j8HhP7ZehwpsSptVE0jb
	6+Q5IhFvdSPGBTxKHzEwcJZLkuGQ15OtmWkBbHdAnsg6zVk1NGwwQivYuYEHJgKa0JfJ
	JWCu24iJyRPWKm4eGB/ysBvrGuuTeKpyqG6Svjvg7jL5T3wzjqSqREQ6u/47FPV8Q+45
	+0EwsT28jZaz2FG3qeQsGnBzCpvEBpiZGbDbN05Hhvpe9jAk07mvF+KYz29H6UrNP1/A
	4JGw==
X-Gm-Message-State: APjAAAWS5hX9+zRBE5E0kgd4SIdyA6Y5yk/StTCKmDa5AZazKqUKb7O0
	d1lX/RPtUE+77BpUXBypo268j1eEL5w=
X-Google-Smtp-Source: APXvYqwqFr4h3LasP+XLgrOCuHThAVepCGECBX6Wbxnwn5oAu/fVhwaE63/A28aEDyOvT3GAzQnuTQ==
X-Received: by 2002:adf:cf02:: with SMTP id o2mr16943806wrj.352.1565268754588; 
	Thu, 08 Aug 2019 05:52:34 -0700 (PDT)
Received: from [10.43.17.10] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	g25sm2386442wmk.18.2019.08.08.05.52.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 05:52:33 -0700 (PDT)
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Eric Biggers <ebiggers@kernel.org>
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
	<MN2PR20MB297336108DF89337DDEEE2F6CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu_jFW26boEhpnAZg9sjWWZf60FXSWuSqNvC5FJiL7EVSA@mail.gmail.com>
	<MN2PR20MB2973A02FC4D6F1D11BA80792CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu8fgg=gt4LSnCfShnf0-PZ=B1TNwM3zdQr+V6hkozgDOA@mail.gmail.com>
	<MN2PR20MB29733EEF59CCD754256D5621CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190808083059.GB5319@sol.localdomain>
	<MN2PR20MB297328E243D74E03C1EF54ACCAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <67b4f0ee-b169-8af4-d7af-1c53a66ba587@gmail.com>
Date: Thu, 8 Aug 2019 14:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR20MB297328E243D74E03C1EF54ACCAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 08 Aug 2019 12:52:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 08 Aug 2019 12:52:36 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
 for IV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 08 Aug 2019 12:53:16 +0000 (UTC)

On 08/08/2019 11:31, Pascal Van Leeuwen wrote:
>> -----Original Message-----
>> From: Eric Biggers <ebiggers@kernel.org>
>> Sent: Thursday, August 8, 2019 10:31 AM
>> To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
>> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>; linux-crypto@vger.kernel.org;
>> herbert@gondor.apana.org.au; agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com;
>> gmazyland@gmail.com
>> Subject: Re: [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher for IV generation
>>
>> On Wed, Aug 07, 2019 at 04:14:22PM +0000, Pascal Van Leeuwen wrote:
>>>>>> In your case, we are not dealing with known plaintext attacks,
>>>>>>
>>>>> Since this is XTS, which is used for disk encryption, I would argue
>>>>> we do! For the tweak encryption, the sector number is known plaintext,
>>>>> same as for EBOIV. Also, you may be able to control data being written
>>>>> to the disk encrypted, either directly or indirectly.
>>>>> OK, part of the data into the CTS encryption will be previous ciphertext,
>>>>> but that may be just 1 byte with the rest being the known plaintext.
>>>>>
>>>>
>>>> The tweak encryption uses a dedicated key, so leaking it does not have
>>>> the same impact as it does in the EBOIV case.
>>>>
>>> Well ... yes and no. The spec defines them as seperately controllable -
>>> deviating from the original XEX definition - but in most practicle use cases
>>> I've seen, the same key is used for both, as having 2 keys just increases
>>> key  storage requirements and does not actually improve effective security
>>> (of the algorithm itself, implementation peculiarities like this one aside
>>> :-), as  XEX has been proven secure using a single key. And the security
>>> proof for XTS actually builds on that while using 2 keys deviates from it.
>>>
>>
>> This is a common misconception.  Actually, XTS needs 2 distinct keys to be a
>> CCA-secure tweakable block cipher, due to another subtle difference from XEX:
>> XEX (by which I really mean "XEX[E,2]") builds the sequence of masks starting
>> with x^1, while XTS starts with x^0.  If only 1 key is used, the inclusion of
>> the 0th power in XTS allows the attack described in Section 6 of the XEX paper
>> (https://web.cs.ucdavis.edu/~rogaway/papers/offsets.pdf).
>>
> Interesting ... I'm not a cryptographer, just a humble HW engineer specialized
> in implementing crypto. I'm basing my views mostly on the Liskov/Minematsu
> "Comments on XTS", who assert that using 2 keys in XTS was misguided. 
> (and I never saw any follow-on comments asserting that this view was wrong ...)
> On not avoiding j=0 in the XTS spec they actually comment:
> "This difference is significant in security, but has no impact on effectiveness 
> for practical applications.", which I read as "not relevant for normal use".
> 
> In any case, it's frequently *used* with both keys being equal for performance
> and key storage reasons.

There is already check in kernel for XTS "weak" keys (tweak and encryption keys must not be the same).
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/crypto/xts.h#n27

For now it applies only in FIPS mode... (and if I see correctly it is duplicated in all drivers).

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
