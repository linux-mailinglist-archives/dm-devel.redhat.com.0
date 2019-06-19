Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F84B2E7
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 09:13:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BC6681E04;
	Wed, 19 Jun 2019 07:13:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E375D9DE;
	Wed, 19 Jun 2019 07:12:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA5CB1806B16;
	Wed, 19 Jun 2019 07:12:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J7CIqu028833 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 03:12:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 330FE611B0; Wed, 19 Jun 2019 07:12:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29F6C5C660
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 07:12:14 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41C3A88305
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 07:12:02 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r185so29858124iod.6
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=khnbFY+vxU45Z/bVGnwlJLSWDQ4jzZbITR9wBBaC8uk=;
	b=Xp7egYypJ1kbQ0AAgct+yvD6EOg/K/SONXCkZdeT0qL1eWbBsNAofOl/7i0DCGviof
	2NJqUzzGD2xPK0qhm8I2OXc8O6iDLaYvCwE+FiDxy+xzw/0xTWO7/qGHNKmXkta3pw/l
	7me/CE1mqqsHXZzAOQFybNVrM6skXz+lsfaSNx/S43pkpUgrOD60HpEs2p86n5n/RmVk
	KYej0t8PQOpqyA26wqHzPMu9RHLHrz5pMj6Qx8e7wmasYPMA3ZygIDc/z68aXblHver6
	vZ7vsVa6yoduq/lyDOd3Pv5eQaahdU4pN9IG/LznbOgE+rcD/MW/jF9GxRq5LyQ0mN2c
	SlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=khnbFY+vxU45Z/bVGnwlJLSWDQ4jzZbITR9wBBaC8uk=;
	b=L1BshGiS9qciGEZbkNm4vI1GVxJ7+uZzN6XZIItAbZWbIRFDJ+HtNwnkMpt4N+IVzt
	s3B1+XNEDnNcGl5MufpWpnQbIznetTKZCYtDdUvhCfbLx7UtJzZFgSOoH4ARy4n8AXoH
	V/tYenDBwa4q19NtKB1key64a2l+94MQpmI8u+XyC0YiUm5m1P1yWL6lKgURpJAN1Ay4
	uH292JgbRCVK5Ly8ME4gB+kjB4iN4j9xfAzouC/RoO8tf7/L0ZDMNCUZZ93t10lD9CFB
	sFXZJKvd8/PplQOxbiYKZ0GwTg4iui7eIHzYP6Jl2tQUs0BQ6pt52+EzB14K1QE8ReFH
	05pQ==
X-Gm-Message-State: APjAAAUitPz/O6NqqUxkhC3jwY7Wthe6fByZ8iZkBUMe095nm8XvJYqg
	7j4z9LvJKhtvlA7Lb1c7Vs9TTzz8hCfIZs2Kk8T/3w==
X-Google-Smtp-Source: APXvYqxZzF1yYZ3cuIGoQ4Pm325A2HZQlSEb+LTS4vpHA+DWAPGcc5lg3zik3JwMTlCrnHtxiAOTkIBn6EJAOw1sAXk=
X-Received: by 2002:a5d:8794:: with SMTP id f20mr22173241ion.128.1560928321432;
	Wed, 19 Jun 2019 00:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
In-Reply-To: <099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 09:11:50 +0200
Message-ID: <CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 19 Jun 2019 07:12:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 19 Jun 2019 07:12:02 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 19 Jun 2019 07:13:06 +0000 (UTC)

On Wed, 19 Jun 2019 at 08:56, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 18/06/2019 23:27, Ard Biesheuvel wrote:
> > This series creates an ESSIV template that produces a skcipher or AEAD
> > transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> > (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> > encapsulated sync or async skcipher/aead by passing through all operations,
> > while using the cipher/shash pair to transform the input IV into an ESSIV
> > output IV.
> >
> > This matches what both users of ESSIV in the kernel do, and so it is proposed
> > as a replacement for those, in patches #2 and #4.
> >
> > This code has been tested using the fscrypt test suggested by Eric
> > (generic/549), as well as the mode-test script suggested by Milan for
> > the dm-crypt case. I also tested the aead case in a virtual machine,
> > but it definitely needs some wider testing from the dm-crypt experts.
>
> Well, I just run "make check" on cyptsetup upstream (32bit VM, Linus' tree
> with this patcheset applied), and get this on the first api test...
>

Ugh. Thanks for trying. I will have a look today.


> Just try
> cryptsetup open --type plain -c aes-cbc-essiv:sha256 /dev/sdd test
>
> kernel: alg: No test for essiv(cbc(aes),aes,sha256) (essiv(cbc-aes-aesni,aes-aesni,sha256-generic))
> kernel: BUG: unable to handle page fault for address: 00c14578
> kernel: #PF: supervisor read access in kernel mode
> kernel: #PF: error_code(0x0000) - not-present page
> kernel: *pde = 00000000
> kernel: Oops: 0000 [#1] PREEMPT SMP
> kernel: CPU: 2 PID: 15611 Comm: kworker/u17:2 Not tainted 5.2.0-rc5+ #519
> kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 04/13/2018
> kernel: Workqueue: kcryptd/253:2 kcryptd_crypt [dm_crypt]
> kernel: EIP: essiv_skcipher_decrypt+0x3/0x20
> kernel: Code: 5f 5d c3 90 90 90 90 55 8b 48 0c 89 e5 8d 41 10 ff 51 18 5d c3 66 90 55 8b 40 0c 89 e5 ff 50 08 5d c3 8d 74 26 00 90 8b 50 58 <f6> 02 01 75 10 55 83 c0 38 89 e5 ff 52 f0 5d c3 8d 74 26 00 90 b8
> kernel: EAX: ee87fc08 EBX: ee87fd40 ECX: ee87fdc4 EDX: 00c14578
> kernel: ESI: ee87fb78 EDI: f0a70800 EBP: ef7a9ed8 ESP: ef7a9e3c
> kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
> kernel: CR0: 80050033 CR2: 00c14578 CR3: 01b87000 CR4: 00140690
> kernel: Call Trace:
> kernel:  ? crypt_convert+0x864/0xe50 [dm_crypt]
> kernel:  ? static_obj+0x32/0x50
> kernel:  ? lockdep_init_map+0x34/0x1b0
> kernel:  ? __init_waitqueue_head+0x29/0x40
> kernel:  kcryptd_crypt+0xca/0x3b0 [dm_crypt]
> kernel:  ? process_one_work+0x1a6/0x5a0
> kernel:  process_one_work+0x214/0x5a0
> kernel:  worker_thread+0x134/0x3e0
> kernel:  ? process_one_work+0x5a0/0x5a0
> kernel:  kthread+0xd4/0x100
> kernel:  ? process_one_work+0x5a0/0x5a0
> kernel:  ? kthread_park+0x90/0x90
> kernel:  ret_from_fork+0x19/0x24
> kernel: Modules linked in: dm_zero dm_integrity async_xor xor async_tx dm_verity reed_solomon dm_bufio dm_crypt loop dm_mod pktcdvd crc32_pclmul crc32c_intel aesni_intel aes_i586 crypto_simd cryptd ata_piix
> kernel: CR2: 0000000000c14578
> kernel: ---[ end trace 8a651b067b7b6a10 ]---
> kernel: EIP: essiv_skcipher_decrypt+0x3/0x20
> kernel: Code: 5f 5d c3 90 90 90 90 55 8b 48 0c 89 e5 8d 41 10 ff 51 18 5d c3 66 90 55 8b 40 0c 89 e5 ff 50 08 5d c3 8d 74 26 00 90 8b 50 58 <f6> 02 01 75 10 55 83 c0 38 89 e5 ff 52 f0 5d c3 8d 74 26 00 90 b8
> kernel: EAX: ee87fc08 EBX: ee87fd40 ECX: ee87fdc4 EDX: 00c14578
> kernel: ESI: ee87fb78 EDI: f0a70800 EBP: ef7a9ed8 ESP: c1b8b45c
> kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
> kernel: CR0: 80050033 CR2: 00c14578 CR3: 01b87000 CR4: 00140690
>
> Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
