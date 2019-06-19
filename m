Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B40AB4B720
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 13:34:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA6593087950;
	Wed, 19 Jun 2019 11:34:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE9760142;
	Wed, 19 Jun 2019 11:34:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4086C1806B16;
	Wed, 19 Jun 2019 11:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JBXUU4016057 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 07:33:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6F2D6014C; Wed, 19 Jun 2019 11:33:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A17D160142
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 11:33:28 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C55730821B2
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 11:33:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so4420755wmd.1
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GGMWcYLCV7t4/9cNcGVR3MQcrhQTdeMjAQRXmJAFNwo=;
	b=WObqFvoMzYeNXzXTnHP+4wMK//dCk2xLMAXfsF4OvhjmqMLropZ4q+W0PZfDAAUD0P
	8sbSQ2c+8OQGArlIV3VpEmi2k1bZCsAMbN84uIeFq3GEcewSAAWzatTPgeQYCHi4XQ6c
	E9UAL916Ane4FG52htNRZn0fmvGaQbWh+w/DL475EtpgJ7f44Nl15UeudP1jof62yT5n
	KEfKtYX1LmyOrWWPbpJg0FvbzZWSiWNPvkZRrXJlC6ezmoxrqdA6bs7YyndxBi4BqIlW
	Onp6oVrxLatfrcxg/Plw9/kPuNJFvyuWHgNlkWwHdGgzsufo8L4L2PyNW/N/1oy2b7eA
	mPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GGMWcYLCV7t4/9cNcGVR3MQcrhQTdeMjAQRXmJAFNwo=;
	b=RWIl7LAJXWS2qjMIDmnLQgdZ8U6+wetQI8Uc0z9orHg5z7k/p10CPOrCf7nBnbVHgI
	3EyYwHOcUHKJgf0O27pLEdaPHj448KVp8e3Xi94N0zJcGe39AhUJcl2y50ZKu+NLbWmf
	tPL6e01m82HRA+jJfuwgefX/coGCEn+tjJTOaxrkIEIPT7PXetVYbJGOSUSxZ2EFYpw+
	c9OASkuZyhBdpVBVNaPV+46YAHgx/AP0c0CkGGdGLD/TOFntoQDFwvwzbu1zg42AaYdo
	aQWIxeScMUUpwUBsuVMTTyyZV1TBY0iciIMBUF/nlRI8aooL3UljeI1ES7GLvKmN2F3b
	tshw==
X-Gm-Message-State: APjAAAWXrMR6SD4VUL2z0eqNWKPzxd9l3hPRuABRmXDuMynr9EjvgkP8
	ufZeSOHucix9/sLEcTfzA8I=
X-Google-Smtp-Source: APXvYqz/e5QiGPcuvAiHUBfYuK6SN6vOh4fhuQyaJKVRKci6IWE0sYGx9o2/Tw+mjMmz66aMGvaXGQ==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr7808241wme.125.1560943996514; 
	Wed, 19 Jun 2019 04:33:16 -0700 (PDT)
Received: from [10.43.17.224] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	y19sm1596666wmc.21.2019.06.19.04.33.15
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 04:33:15 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Milan Broz <gmazyland@gmail.com>
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
	<f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
	<CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
Date: Wed, 19 Jun 2019 13:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 19 Jun 2019 11:33:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 19 Jun 2019 11:33:18 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 19 Jun 2019 11:34:57 +0000 (UTC)

On 19/06/2019 13:16, Ard Biesheuvel wrote:
>> Try
>>   cryptsetup open --type plain -c null /dev/sdd test -q
>> or
>>   dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"
>>
>> (or just run full cryptsetup testsuite)
>>
> 
> Is that your mode-test script?
> 
> I saw some errors about the null cipher, but tbh, it looked completely
> unrelated to me, so i skipped those for the moment. But now, it looks
> like it is related after all.

This was triggered by align-test, mode-test fails the same though.

It is definitely related, I think you just changed the mode parsing in dm-crypt.
(cipher null contains only one dash I guess).

m.


> 
> 
>> kernel: BUG: kernel NULL pointer dereference, address: 00000000
>> kernel: #PF: supervisor read access in kernel mode
>> kernel: #PF: error_code(0x0000) - not-present page
>> kernel: *pde = 00000000
>> kernel: Oops: 0000 [#1] PREEMPT SMP
>> kernel: CPU: 2 PID: 2261 Comm: cryptsetup Not tainted 5.2.0-rc5+ #521
>> kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 04/13/2018
>> kernel: EIP: strcmp+0x9/0x20
>> kernel: Code: 00 55 89 c1 89 e5 57 89 c7 56 89 d6 ac aa 84 c0 75 fa 5e 89 c8 5f 5d c3 8d b4 26 00 00 00 00 66 90 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 8d 76
>> kernel: EAX: 00000000 EBX: ef51016c ECX: 0000000c EDX: f78e585e
>> kernel: ESI: 00000000 EDI: f78e585e EBP: f238dcb0 ESP: f238dca8
>> kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210282
>> kernel: CR0: 80050033 CR2: 00000000 CR3: 30a28000 CR4: 00140690
>> kernel: Call Trace:
>> kernel:  crypt_ctr+0x473/0xf4e [dm_crypt]
>> kernel:  dm_table_add_target+0x15f/0x340 [dm_mod]
>> kernel:  table_load+0xe9/0x280 [dm_mod]
>> kernel:  ? retrieve_status+0x200/0x200 [dm_mod]
>> kernel:  ctl_ioctl+0x1c8/0x400 [dm_mod]
>> kernel:  ? retrieve_status+0x200/0x200 [dm_mod]
>> kernel:  ? ctl_ioctl+0x400/0x400 [dm_mod]
>> kernel:  dm_ctl_ioctl+0x8/0x10 [dm_mod]
>> kernel:  do_vfs_ioctl+0x3dd/0x790
>> kernel:  ? trace_hardirqs_on+0x4a/0xf0
>> kernel:  ? ksys_old_semctl+0x27/0x30
>> kernel:  ksys_ioctl+0x2e/0x60
>> kernel:  ? mpihelp_add_n+0x39/0x50
>> kernel:  sys_ioctl+0x11/0x20
>> kernel:  do_int80_syscall_32+0x4b/0x1a0
>> kernel:  ? mpihelp_add_n+0x39/0x50
>> kernel:  entry_INT80_32+0xcf/0xcf
>> kernel: EIP: 0xb7f5bbf2
>> kernel: Code: de 01 00 05 ed 73 02 00 83 ec 14 8d 80 0c ac ff ff 50 6a 02 e8 5f 12 01 00 c7 04 24 7f 00 00 00 e8 ce cd 01 00 66 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
>> kernel: EAX: ffffffda EBX: 00000005 ECX: c138fd09 EDX: 00511080
>> kernel: ESI: b7b83d40 EDI: b7b785af EBP: 0050dda0 ESP: bf9e1c34
>> kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200286
>> kernel:  ? mpihelp_add_n+0x39/0x50
>> kernel: Modules linked in: dm_crypt loop dm_mod pktcdvd crc32_pclmul crc32c_intel aesni_intel aes_i586 crypto_simd cryptd ata_piix
>> kernel: CR2: 0000000000000000
>> kernel: ---[ end trace 0d32231f952fd372 ]---
>>
>> m.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
