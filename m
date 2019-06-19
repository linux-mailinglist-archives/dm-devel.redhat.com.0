Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AC4B283
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 09:00:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B8715946F;
	Wed, 19 Jun 2019 06:59:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2E9611B0;
	Wed, 19 Jun 2019 06:59:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BC4A1806B18;
	Wed, 19 Jun 2019 06:58:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J6uqeO023686 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 02:56:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 335E21001E79; Wed, 19 Jun 2019 06:56:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AE361001E73
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 06:56:49 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2262A307EA81
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 06:56:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a15so459552wmj.5
	for <dm-devel@redhat.com>; Tue, 18 Jun 2019 23:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z5Lq2K5kUPobNobq2iR7E+LqKNxsXkXSwtrm7ZATaEM=;
	b=o0jxOh/kY0d4eqeiQKNpijXiGIDk2kg+2hmcewaLRor4DykVFIrarwPOgKP12N+Oma
	B56aX4r36wMZhGWg77z5MQQi8h/hmxYIl1PJ7tcKNbkw0hDghbFLopyAHlGY1sZylF7Z
	XMbH9qSc6pFGlF7N39AKBE9UVRZLaxJT06HOPNUhR/oAPcU8gzURr48QQQqdO78oKnVR
	M4neTbwb4MDj1T6Amjiki4sG/eBSoHAr9AB8bj/sH7pydwotptmfe+mcicuaZ57QnFcw
	eizPeHHGhRdp4yJdqwl2aRhHaK95m4B4Cu4r66Y5Pgpj0LDqjeQE8gsGZygA4bmyiNBq
	QW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z5Lq2K5kUPobNobq2iR7E+LqKNxsXkXSwtrm7ZATaEM=;
	b=qMi6Hbn1ajsHCB/7Fmccv5k0ZqiO41vEBQibX4s+5vzxsm9IoG/e7JdH0Rcq3TFbWl
	w8OQsNLynre7vy/VBjWTJLac2h7zRy/HOzoBdx8Lq56/Jaiqo73m6QCe6/rAtr3Qxbbm
	6+hAxys0x8JJVOIg6cdH+O54zEtuUH6r3ytKydCC5GBhDpGeserPvQXOXnuc2L2v4jLC
	8jSFOHiBS9VbjSxI/fAXKfP9hYm36j7orF1s//DWWJWpT6n0oqPGvK8Xmf3nD/gfHPbk
	4BAp3sDOF27ij1ZgBP5gAHXsqbwLtc1gqXnPmnZ7ot5eq5ZSAdIlgTXFBH45CgHK3QJF
	9NAw==
X-Gm-Message-State: APjAAAXDRwx3sVN0PSgh0V/nLjV8da3AM9bF3kujtftX6FJL1mHrBO6u
	0IzjoJyWhRJsXf+j1eqVGX8=
X-Google-Smtp-Source: APXvYqwG07vLMQDZN3G5vu06Z8GCIDSxUmuZsFWTbKDRWd1Dw0ykn7p6vWNnoI81MtOovKpcrhufeQ==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr6577226wma.158.1560927395287;
	Tue, 18 Jun 2019 23:56:35 -0700 (PDT)
Received: from [10.43.17.224] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	l1sm26603752wrf.46.2019.06.18.23.56.34
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 23:56:34 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
Date: Wed, 19 Jun 2019 08:56:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 19 Jun 2019 06:56:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 19 Jun 2019 06:56:38 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 19 Jun 2019 07:00:05 +0000 (UTC)

On 18/06/2019 23:27, Ard Biesheuvel wrote:
> This series creates an ESSIV template that produces a skcipher or AEAD
> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> encapsulated sync or async skcipher/aead by passing through all operations,
> while using the cipher/shash pair to transform the input IV into an ESSIV
> output IV.
> 
> This matches what both users of ESSIV in the kernel do, and so it is proposed
> as a replacement for those, in patches #2 and #4.
> 
> This code has been tested using the fscrypt test suggested by Eric
> (generic/549), as well as the mode-test script suggested by Milan for
> the dm-crypt case. I also tested the aead case in a virtual machine,
> but it definitely needs some wider testing from the dm-crypt experts.

Well, I just run "make check" on cyptsetup upstream (32bit VM, Linus' tree
with this patcheset applied), and get this on the first api test...

Just try
cryptsetup open --type plain -c aes-cbc-essiv:sha256 /dev/sdd test

kernel: alg: No test for essiv(cbc(aes),aes,sha256) (essiv(cbc-aes-aesni,aes-aesni,sha256-generic))
kernel: BUG: unable to handle page fault for address: 00c14578
kernel: #PF: supervisor read access in kernel mode
kernel: #PF: error_code(0x0000) - not-present page
kernel: *pde = 00000000 
kernel: Oops: 0000 [#1] PREEMPT SMP
kernel: CPU: 2 PID: 15611 Comm: kworker/u17:2 Not tainted 5.2.0-rc5+ #519
kernel: Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 04/13/2018
kernel: Workqueue: kcryptd/253:2 kcryptd_crypt [dm_crypt]
kernel: EIP: essiv_skcipher_decrypt+0x3/0x20
kernel: Code: 5f 5d c3 90 90 90 90 55 8b 48 0c 89 e5 8d 41 10 ff 51 18 5d c3 66 90 55 8b 40 0c 89 e5 ff 50 08 5d c3 8d 74 26 00 90 8b 50 58 <f6> 02 01 75 10 55 83 c0 38 89 e5 ff 52 f0 5d c3 8d 74 26 00 90 b8
kernel: EAX: ee87fc08 EBX: ee87fd40 ECX: ee87fdc4 EDX: 00c14578
kernel: ESI: ee87fb78 EDI: f0a70800 EBP: ef7a9ed8 ESP: ef7a9e3c
kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
kernel: CR0: 80050033 CR2: 00c14578 CR3: 01b87000 CR4: 00140690
kernel: Call Trace:
kernel:  ? crypt_convert+0x864/0xe50 [dm_crypt]
kernel:  ? static_obj+0x32/0x50
kernel:  ? lockdep_init_map+0x34/0x1b0
kernel:  ? __init_waitqueue_head+0x29/0x40
kernel:  kcryptd_crypt+0xca/0x3b0 [dm_crypt]
kernel:  ? process_one_work+0x1a6/0x5a0
kernel:  process_one_work+0x214/0x5a0
kernel:  worker_thread+0x134/0x3e0
kernel:  ? process_one_work+0x5a0/0x5a0
kernel:  kthread+0xd4/0x100
kernel:  ? process_one_work+0x5a0/0x5a0
kernel:  ? kthread_park+0x90/0x90
kernel:  ret_from_fork+0x19/0x24
kernel: Modules linked in: dm_zero dm_integrity async_xor xor async_tx dm_verity reed_solomon dm_bufio dm_crypt loop dm_mod pktcdvd crc32_pclmul crc32c_intel aesni_intel aes_i586 crypto_simd cryptd ata_piix
kernel: CR2: 0000000000c14578
kernel: ---[ end trace 8a651b067b7b6a10 ]---
kernel: EIP: essiv_skcipher_decrypt+0x3/0x20
kernel: Code: 5f 5d c3 90 90 90 90 55 8b 48 0c 89 e5 8d 41 10 ff 51 18 5d c3 66 90 55 8b 40 0c 89 e5 ff 50 08 5d c3 8d 74 26 00 90 8b 50 58 <f6> 02 01 75 10 55 83 c0 38 89 e5 ff 52 f0 5d c3 8d 74 26 00 90 b8
kernel: EAX: ee87fc08 EBX: ee87fd40 ECX: ee87fdc4 EDX: 00c14578
kernel: ESI: ee87fb78 EDI: f0a70800 EBP: ef7a9ed8 ESP: c1b8b45c
kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
kernel: CR0: 80050033 CR2: 00c14578 CR3: 01b87000 CR4: 00140690

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
