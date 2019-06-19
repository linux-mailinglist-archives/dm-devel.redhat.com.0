Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE74B972
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 15:10:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28E7B87621;
	Wed, 19 Jun 2019 13:10:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F07D06014C;
	Wed, 19 Jun 2019 13:10:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AD8B1806B19;
	Wed, 19 Jun 2019 13:09:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JD8wMc005207 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 09:08:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA3A55DA5B; Wed, 19 Jun 2019 13:08:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F4F5D9E5
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 13:08:54 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27F7AC18B2C1
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 13:08:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so1738818wma.1
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8zhb8hlHZ2IPD3DkSDoimzd8qWZnkxy47wzD8yGLwIM=;
	b=Qcb1oWTjCRyj+QblvzpjTPXp+LLLa2XXLZKtqaqFsu04n/nVozlHL7gzrqpO/V8yRK
	w9SP+19ETahlqTUAFYX54IhK5woNz4SWWmfc9rJJLzYhh+I70wrVqAg+f6aaYro8dW2H
	5LBGc6zshMA1t4rzCiDmYTx6KJuZ4aVax+UW5mYUzX4VGiclvJiTJe+1nX85o7KPPhmS
	/yzlmu6Y6bq6XRPpvLW1NAjpgZxivZbxnX0R7SsvsimPRhouAjcsLajXM66P0GLbjeEX
	eppMnHY6o2o+EFie7WpjAqVIikYUtATiu5Zj3HD9IqmlpV6KDASzYsXp/DUQUOY4H0Dk
	g0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8zhb8hlHZ2IPD3DkSDoimzd8qWZnkxy47wzD8yGLwIM=;
	b=BmGqqNdJmseqRmBPl9FiKzW8xeKSuwUpz4QYMtBw1BrF1wGtWVOZyxY/6VibKWRQCQ
	bSFvbkHQag5kmC3sUm11X+bpREG3ZgKEboMQljz0qXQzctf+oiVvSMEviu2pelQVcc5l
	zSxy4qL4xruF5pD0vwKFxa+Kdr/JDpGut7hevYDLxy+c26XPoCPtz3zygAl+NOeUi5gZ
	vbnKMRUiPVeUri9m7u055aacpBYgK/MfE2JqlzpIA0HXEv2Sy/L5oS3Je/jvcrDLUUv3
	1s0ZmHjLFEeD8XE5YVq0gquEFB6jmucL+VK43XoSLfOy3dTbi1n7b4XPbPTAl24KofmK
	fUdg==
X-Gm-Message-State: APjAAAUoHV1RAcKTM5pz6g7DdoUAunA4jV032s5wJpQMOjyWLUvMpv9I
	QK5y7C/QIU3rSBaLxLAwGSs=
X-Google-Smtp-Source: APXvYqyMGZbNclb5vkgBaWyDA59F1aTeUP1b5Zvp/CsCCgIsBYrJLiBO/wBqXWbE6yUeaR9zUW/1zA==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr8483666wme.146.1560949722707;
	Wed, 19 Jun 2019 06:08:42 -0700 (PDT)
Received: from [10.43.17.224] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	t12sm21612244wrw.53.2019.06.19.06.08.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:08:41 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Milan Broz <gmazyland@gmail.com>
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
	<f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
	<CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
	<b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
	<CAKv+Gu91RHpwE6XzdFYcsN77DRJ-4OsFRjxNAyKk92Q3q6dCYw@mail.gmail.com>
	<CAKv+Gu_XFbB9TTjMO+=QmZ40H1LV5DB57-zeUEb9dN3yNyia=w@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <dea2ec13-61d4-5009-df04-9508bb8e7827@gmail.com>
Date: Wed, 19 Jun 2019 15:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_XFbB9TTjMO+=QmZ40H1LV5DB57-zeUEb9dN3yNyia=w@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 19 Jun 2019 13:08:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 19 Jun 2019 13:08:44 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.107  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v2 0/4] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 19 Jun 2019 13:10:53 +0000 (UTC)

On 19/06/2019 14:49, Ard Biesheuvel wrote:
> On Wed, 19 Jun 2019 at 14:36, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>
>> On Wed, 19 Jun 2019 at 13:33, Milan Broz <gmazyland@gmail.com> wrote:
>>>
>>> On 19/06/2019 13:16, Ard Biesheuvel wrote:
>>>>> Try
>>>>>   cryptsetup open --type plain -c null /dev/sdd test -q
>>>>> or
>>>>>   dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"
>>>>>
>>>>> (or just run full cryptsetup testsuite)
>>>>>
>>>>
>>>> Is that your mode-test script?
>>>>
>>>> I saw some errors about the null cipher, but tbh, it looked completely
>>>> unrelated to me, so i skipped those for the moment. But now, it looks
>>>> like it is related after all.
>>>
>>> This was triggered by align-test, mode-test fails the same though.
>>>
>>> It is definitely related, I think you just changed the mode parsing in dm-crypt.
>>> (cipher null contains only one dash I guess).
>>>
>>
>> On my unpatched 4.19 kernel, mode-test gives me
>>
>> $ sudo ./mode-test
>> aes                            PLAIN:[table OK][status OK]
>> LUKS1:[table OK][status OK] CHECKSUM:[OK]
>> aes-plain                      PLAIN:[table OK][status OK]
>> LUKS1:[table OK][status OK] CHECKSUM:[OK]
>> null                           PLAIN:[table OK][status OK]
>> LUKS1:[table OK][status OK] CHECKSUM:[OK]
>> cipher_null                    PLAIN:[table FAIL]
>>  Expecting cipher_null-ecb got cipher_null-cbc-plain.
>> FAILED at line 64 ./mode-test
>>
>> which is why I commented out those tests in the first place.
>>
>> I can reproduce the crash after I re-enable them again, so I will need
>> to look into that. But something seems to be broken already.
>> Note that this is running on arm64 using a kconfig based on the Debian kernel.
> 
> Actually, could this be an issue with cryptsetup being out of date? On
> another arm64 system with a more recent distro, it works fine

Ah yes, it was changed because we hardened dm-crypt mode validation in kernel
https://gitlab.com/cryptsetup/cryptsetup/commit/aeea93fa9553ad70ed57f273aecb233113b204d6#f40cab3037a50bf28ce20d8aae52bfa6a0c0e2c4_137_137

So either use test form the released version of cryptsetup (all version are here)
https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/

Or better use upstream git, we added a lot of tests anyway.

Milan


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
