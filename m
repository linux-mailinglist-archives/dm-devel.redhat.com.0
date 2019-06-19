Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EBE4B69D
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 13:03:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EDEE60CC;
	Wed, 19 Jun 2019 11:03:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DB5360A9A;
	Wed, 19 Jun 2019 11:02:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CA811806B18;
	Wed, 19 Jun 2019 11:02:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JB1cfV009474 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 07:01:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FA235D71A; Wed, 19 Jun 2019 11:01:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A2635D71B
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 11:01:35 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA68E8CB51
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 11:01:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so1257421wmj.3
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=x2X3n8XSQziFMnKt/w2zwh+U+Dl1utfi0mDvOWX3BxI=;
	b=aNuKNkXa+TolShT9Z6UUZ3S8MUndFAF7P3On82mkNQZmyukwm78kvM4Z2z+UQJBHSD
	Q+YY5MD3avZRuh+OnFwBvgrJoaeYHTfs/wdUZdpZNkhg+31XXNLqDWB19FAknqOhWFqk
	rxZKppYQJDKja97Ne7LhH9EyJTqwrXjz0yCDydTKjUA/KY4ZVkx2Ag4wMtS+EAWYODnl
	mZS/2t8gazrwGpWXCUnhxUbvV5QDT4exP1ws85LShWDdYCVFwFF3HyAS7fd3H73jCyec
	ko1/eL+b1dNXiDrlvJRt5Kbnm2LRePu/5WMscnOSXEK7de2X6PMr1LvfhOoleUvPL1yo
	ONoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x2X3n8XSQziFMnKt/w2zwh+U+Dl1utfi0mDvOWX3BxI=;
	b=NpJqGTMJj0KWAmCYpn+GRTGo5JW0EBAO8CeWBSKg4W0rosvHVpdl1/RMfRZoo78HkS
	blumjfWUqahHHRlQ21JpwF2VdBbADeowC7IoLogPWhc2I6Qxd85TqosZ0B6xPw7AbK4d
	/ZZjb3EAtVT8XsX2Q0c5XuBebuOp0Z+BvjvycKwObGXFcZZvGM1IZCiIWzkHPDH5oSta
	HQxr9Mu3VzB/WW+3plYJDp+w1I9Bh0bpI/vfgnLtrKYsEyU0euf6B+ADuhLcFQh8hqBG
	AmFPfnIQwgLzdVJwXxx3QPE0LeOMzk5tWUtxjXJF+x/0rJWBRtB+SFC4CNeiGHs04v1K
	+QJQ==
X-Gm-Message-State: APjAAAXDCYrza6wmvWKOARcxojMfdzDLCmdHJ/ZW62/D+LkIGEomjKkV
	QmQ1t7XXD2WBEJbM3NhFmJA=
X-Google-Smtp-Source: APXvYqzbi/iw8SjHaxzRpGlQyJSqfJ8G1hR0Pf6gvsLq2noK6yiW2rRwxGdi34j7bDGmlzFbE8O4GQ==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr7719166wmg.5.1560942076262;
	Wed, 19 Jun 2019 04:01:16 -0700 (PDT)
Received: from [10.43.17.224] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id z6sm19814770wrw.2.2019.06.19.04.01.15
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 04:01:15 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Milan Broz <gmazyland@gmail.com>
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
Date: Wed, 19 Jun 2019 13:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 19 Jun 2019 11:01:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 19 Jun 2019 11:01:18 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-crypto@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 19 Jun 2019 11:03:31 +0000 (UTC)

On 19/06/2019 11:14, Ard Biesheuvel wrote:
> Apologies, this was a rebase error on my part.
> 
> Could you please apply the hunk below and try again?
> 
> diff --git a/crypto/essiv.c b/crypto/essiv.c
> index 029a65afb4d7..5dc2e592077e 100644
> --- a/crypto/essiv.c
> +++ b/crypto/essiv.c
> @@ -243,6 +243,8 @@ static int essiv_aead_encrypt(struct aead_request *req)
>  static int essiv_skcipher_decrypt(struct skcipher_request *req)
>  {
>         struct essiv_skcipher_request_ctx *rctx = skcipher_request_ctx(req);
> +
> +       essiv_skcipher_prepare_subreq(req);
>         return crypto_skcipher_decrypt(&rctx->blockcipher_req);
>  }

That helps, but now the null cipher is broken...
(We use it for debugging and during reencryption from non-encrypted device)

Try
  cryptsetup open --type plain -c null /dev/sdd test -q
or
  dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"

(or just run full cryptsetup testsuite)

kernel: BUG: kernel NULL pointer dereference, address: 00000000
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: *pde = 00000000 
kernel: Oops: 0000 [#1] PREEMPT SMP
kernel: CPU: 2 PID: 2261 Comm: cryptsetup Not tainted 5.2.0-rc5+ #521
kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 04/13/2018
kernel: EIP: strcmp+0x9/0x20
kernel: Code: 00 55 89 c1 89 e5 57 89 c7 56 89 d6 ac aa 84 c0 75 fa 5e 89 c8 5f 5d c3 8d b4 26 00 00 00 00 66 90 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 8d 76
kernel: EAX: 00000000 EBX: ef51016c ECX: 0000000c EDX: f78e585e
kernel: ESI: 00000000 EDI: f78e585e EBP: f238dcb0 ESP: f238dca8
kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210282
kernel: CR0: 80050033 CR2: 00000000 CR3: 30a28000 CR4: 00140690
kernel: Call Trace:
kernel:  crypt_ctr+0x473/0xf4e [dm_crypt]
kernel:  dm_table_add_target+0x15f/0x340 [dm_mod]
kernel:  table_load+0xe9/0x280 [dm_mod]
kernel:  ? retrieve_status+0x200/0x200 [dm_mod]
kernel:  ctl_ioctl+0x1c8/0x400 [dm_mod]
kernel:  ? retrieve_status+0x200/0x200 [dm_mod]
kernel:  ? ctl_ioctl+0x400/0x400 [dm_mod]
kernel:  dm_ctl_ioctl+0x8/0x10 [dm_mod]
kernel:  do_vfs_ioctl+0x3dd/0x790
kernel:  ? trace_hardirqs_on+0x4a/0xf0
kernel:  ? ksys_old_semctl+0x27/0x30
kernel:  ksys_ioctl+0x2e/0x60
kernel:  ? mpihelp_add_n+0x39/0x50
kernel:  sys_ioctl+0x11/0x20
kernel:  do_int80_syscall_32+0x4b/0x1a0
kernel:  ? mpihelp_add_n+0x39/0x50
kernel:  entry_INT80_32+0xcf/0xcf
kernel: EIP: 0xb7f5bbf2
kernel: Code: de 01 00 05 ed 73 02 00 83 ec 14 8d 80 0c ac ff ff 50 6a 02 e8 5f 12 01 00 c7 04 24 7f 00 00 00 e8 ce cd 01 00 66 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
kernel: EAX: ffffffda EBX: 00000005 ECX: c138fd09 EDX: 00511080
kernel: ESI: b7b83d40 EDI: b7b785af EBP: 0050dda0 ESP: bf9e1c34
kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200286
kernel:  ? mpihelp_add_n+0x39/0x50
kernel: Modules linked in: dm_crypt loop dm_mod pktcdvd crc32_pclmul crc32c_intel aesni_intel aes_i586 crypto_simd cryptd ata_piix
kernel: CR2: 0000000000000000
kernel: ---[ end trace 0d32231f952fd372 ]---

m.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
