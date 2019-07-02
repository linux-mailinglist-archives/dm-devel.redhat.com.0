Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B432A5D4B6
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 18:50:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23A96C01F28C;
	Tue,  2 Jul 2019 16:50:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5909D5C28D;
	Tue,  2 Jul 2019 16:50:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFB3B1806B0F;
	Tue,  2 Jul 2019 16:50:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62GmlXc011366 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 12:48:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 680DD87C3; Tue,  2 Jul 2019 16:48:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E2787C0
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:48:45 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26E3837EEF
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:48:31 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r15so11872298lfm.11
	for <dm-devel@redhat.com>; Tue, 02 Jul 2019 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=n1MiZRQXY1X5/1Lfb3V7ryug15xS4eKlSLkntpBu3p8=;
	b=NIJMyvki0ukOG2yDafz+vzWNfARdo8Xk/QtUd/vJ7S0VvPLvYhtPx+yljhwzrIwBgp
	ZHrdkqMPUVVi/CvG+sI1nJuPrW9eu6gdPDCtrLf/KAs9oULJ5LVZ6xmwcU3gggS1V3YX
	RRQfRx4AnhZfszYn+TgMjNuMWUqMe1rQtWczE8wooWj9HNx+wi9t6Z2XAHVSqmm/NZys
	toRno9eyuR3rnF1tV4J39kZksTHQKYXCBpCBLXmz+d+ZhJedVQ9rDmk3WZXZYkL3b3BF
	6OkSPIxoH6OxV8W9DJmweixQrtpwwtogPYtbIuNprMVTPmDNQEQehjmxF5tYs4W/yAzB
	pQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n1MiZRQXY1X5/1Lfb3V7ryug15xS4eKlSLkntpBu3p8=;
	b=X1JhpKfKb8Ga6Vfg2xeFiIbH5im5j8E/qMoM2bkHamXi/y35rrDDoAngbA+GN0B1N8
	4uamtYdKJewphWA7QvB2Nhh8QG2YBs07Amf/0NQF2X+9v6ezQnwerU6hb9wPeM2pUxZa
	ZdmMOdT61OuwNUG0NH9Wze9lvbu5wK+qP5KMRvfsDIFdN/gp161FQ2VOl87AyCb6nsXU
	Y4l2BAIKx4IPtQVAf11zs0HSbNx19UwyAbeY5Haw6E2n1VJLViAGEEnTgn/7Tik2qK7O
	c7O9IzvI1pRg2ljGnfiHuD2dR7rVtntlYYE2b5q2AXOtgepqZ/xmO1P1lXF/T9wNrDF2
	QNew==
X-Gm-Message-State: APjAAAVKjuyT8b1ETtAKgNpViFQFPZMeSXbhOzIidRkrxTusVrgmzSS1
	ugr7ucyCLZqrQlAYBXiE62AXdg==
X-Google-Smtp-Source: APXvYqxF+/r4KCOGGCedGogDPlPJlaPfEYSAVZQw5bwdbPZFxOAbCJwriqBGDvCHDVCPc2LEE6pGJg==
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr15588960lfg.62.1562086108660; 
	Tue, 02 Jul 2019 09:48:28 -0700 (PDT)
Received: from e111045-lin.arm.com (89-212-78-239.static.t-2.net.
	[89.212.78.239]) by smtp.gmail.com with ESMTPSA id
	r17sm3906055ljc.85.2019.07.02.09.48.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 09:48:27 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue,  2 Jul 2019 18:48:08 +0200
Message-Id: <20190702164815.6341-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 02 Jul 2019 16:48:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 02 Jul 2019 16:48:31 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.226  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v7 0/7] crypto: switch to crypto API for ESSIV
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 16:50:43 +0000 (UTC)

This series creates an ESSIV template that produces a skcipher or AEAD
transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
(or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
encapsulated sync or async skcipher/aead by passing through all operations,
while using the cipher/shash pair to transform the input IV into an ESSIV
output IV.

This matches what both users of ESSIV in the kernel do, and so it is proposed
as a replacement for those, in patches #2 and #4.

This code has been tested using the fscrypt test suggested by Eric
(generic/549), as well as the mode-test script suggested by Milan for
the dm-crypt case. I also tested the aead case in a virtual machine,
but it definitely needs some wider testing from the dm-crypt experts.

The consensus appears to be that it would be useful if the crypto API
encapsulates the handling of multiple subsequent blocks that are
encrypted using a 64-bit LE counter as IV, and makes it the duty of
the algo to increment the counter between blocks. However, this is
equally suitable for non-ESSIV transforms (or even more so), and so
this is left as a future enhancement to  be applied on top.

Changes since v6:
- make CRYPTO_ESSIV user selectable so we can opt out of selecting it even
  if FS_ENCRYPTION (which cannot be built as a module) is enabled
- move a comment along with the code it referred to (#3), not that this change
  and removing some redundant braces makes the diff look totally different
- add Milan's R-b to #3 and #4

Changes since v5:
- drop redundant #includes and drop some unneeded braces (#2)
- add test case for essiv(authenc(hmac(sha256),cbc(aes)),aes,sha256)
- make ESSIV driver deal with assoc data that is described by more than two
  scatterlist entries - this only happens when the extended tests are being
  performed, so don't optimize for it
- clarify that both fscrypt and dm-crypt only use ESSIV in special cases (#7)

Changes since v4:
- make the ESSIV template IV size equal the IV size of the encapsulated
  cipher - defining it as 8 bytes was needlessly restrictive, and also
  complicated the code for no reason
- add a missing kfree() spotted by Smatch
- add additional algo length name checks when constructing the essiv()
  cipher name
- reinstate the 'essiv' IV generation implementation in dm-crypt, but
  make its generation function identical to plain64le (and drop the other
  methods)
- fix a bug in the arm64 CE/NEON code
- simplify the arm64 code by reusing more of the existing CBC implementation
  (patch #6 is new to this series and was added for this reason)

Changes since v3:
- address various review comments from Eric on patch #1
- use Kconfig's 'imply' instead of 'select' to permit CRYPTO_ESSIV to be
  enabled as a module or disabled entirely even if fscrypt is compiled in (#2)
- fix an issue in the AEAD encrypt path caused by the IV being clobbered by
  the inner skcipher before the hmac was being calculated

Changes since v2:
- fixed a couple of bugs that snuck in after I'd done the bulk of my
  testing
- some cosmetic tweaks to the ESSIV template skcipher setkey function
  to align it with the aead one
- add a test case for essiv(cbc(aes),aes,sha256)
- add an accelerated implementation for arm64 that combines the IV
  derivation and the actual en/decryption in a single asm routine

Scroll down for tcrypt speed test result comparing the essiv template
with the asm implementation. Bare cbc(aes) tests included for reference
as well. Taken on a 2GHz Cortex-A57 (AMD Seattle)

Code can be found here
https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=essiv-v6

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org
Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Milan Broz <gmazyland@gmail.com>

Ard Biesheuvel (7):
  crypto: essiv - create wrapper template for ESSIV generation
  fs: crypto: invoke crypto API for ESSIV handling
  md: dm-crypt: infer ESSIV block cipher from cipher string directly
  md: dm-crypt: switch to ESSIV crypto API template
  crypto: essiv - add test vector for essiv(cbc(aes),aes,sha256)
  crypto: arm64/aes-cts-cbc - factor out CBC en/decryption of a walk
  crypto: arm64/aes - implement accelerated ESSIV/CBC mode

 arch/arm64/crypto/aes-glue.c  | 205 +++++--
 arch/arm64/crypto/aes-modes.S |  29 +-
 crypto/Kconfig                |  28 +
 crypto/Makefile               |   1 +
 crypto/essiv.c                | 640 ++++++++++++++++++++
 crypto/tcrypt.c               |   9 +
 crypto/testmgr.c              |  14 +
 crypto/testmgr.h              | 497 +++++++++++++++
 drivers/md/Kconfig            |   1 +
 drivers/md/dm-crypt.c         | 235 ++-----
 fs/crypto/Kconfig             |   1 +
 fs/crypto/crypto.c            |   5 -
 fs/crypto/fscrypt_private.h   |   9 -
 fs/crypto/keyinfo.c           |  95 +--
 14 files changed, 1436 insertions(+), 333 deletions(-)
 create mode 100644 crypto/essiv.c

-- 
2.17.1

testing speed of async essiv(cbc(aes),aes,sha256) (essiv(cbc-aes-ce,aes-ce,sha256-ce)) encryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 3140785 ops/s ( 50252560 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 2672908 ops/s (171066112 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 1632811 ops/s (417999616 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks):  665980 ops/s (681963520 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks):  495180 ops/s (728904960 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):   99329 ops/s (813703168 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 3106888 ops/s ( 49710208 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 2582682 ops/s (165291648 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 1511160 ops/s (386856960 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks):  589841 ops/s (603997184 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks):  435094 ops/s (640458368 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):   82997 ops/s (679911424 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 3058592 ops/s ( 48937472 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 2496988 ops/s (159807232 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 1438355 ops/s (368218880 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks):  528902 ops/s (541595648 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks):  387861 ops/s (570931392 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):   75444 ops/s (618037248 bytes)

testing speed of async essiv(cbc(aes),aes,sha256) (essiv(cbc-aes-ce,aes-ce,sha256-ce)) decryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 3164752 ops/s (  50636032 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 2975874 ops/s ( 190455936 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 2393123 ops/s ( 612639488 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks): 1314745 ops/s (1346298880 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks): 1050717 ops/s (1546655424 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):  246457 ops/s (2018975744 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 3117489 ops/s (  49879824 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 2922089 ops/s ( 187013696 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 2292023 ops/s ( 586757888 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks): 1207942 ops/s (1236932608 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks):  955598 ops/s (1406640256 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):  195198 ops/s (1599062016 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 3081935 ops/s (  49310960 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 2883181 ops/s ( 184523584 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 2205147 ops/s ( 564517632 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks): 1119468 ops/s (1146335232 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks):  877017 ops/s (1290969024 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):  195255 ops/s (1599528960 bytes)


testing speed of async essiv(cbc(aes),aes,sha256) (essiv-cbc-aes-sha256-ce) encryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 5037539 ops/s ( 80600624 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 3884302 ops/s (248595328 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 2014999 ops/s (515839744 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks):  721147 ops/s (738454528 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks):  525262 ops/s (773185664 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):  100453 ops/s (822910976 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 4972667 ops/s ( 79562672 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 3721788 ops/s (238194432 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 1835967 ops/s (470007552 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks):  633524 ops/s (648728576 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks):  458306 ops/s (674626432 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):   83595 ops/s (684810240 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 4975101 ops/s ( 79601616 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 3581137 ops/s (229192768 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 1741799 ops/s (445900544 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks):  565340 ops/s (578908160 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks):  407040 ops/s (599162880 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):   76092 ops/s (623345664 bytes)

testing speed of async essiv(cbc(aes),aes,sha256) (essiv-cbc-aes-sha256-ce) decryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 5122947 ops/s (  81967152 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 4546576 ops/s ( 290980864 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 3314744 ops/s ( 848574464 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks): 1550823 ops/s (1588042752 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks): 1197388 ops/s (1762555136 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):  253661 ops/s (2077990912 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 5040644 ops/s (  80650304 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 4442490 ops/s ( 284319360 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 3138199 ops/s ( 803378944 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks): 1406038 ops/s (1439782912 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks): 1075658 ops/s (1583368576 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):  199652 ops/s (1635549184 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 4979432 ops/s (  79670912 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 4394406 ops/s ( 281241984 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 2999511 ops/s ( 767874816 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks): 1294498 ops/s (1325565952 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks):  981009 ops/s (1444045248 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):  200463 ops/s (1642192896 bytes)

testing speed of async cbc(aes) (cbc-aes-ce) encryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 5895884 ops/s ( 94334144 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 4347437 ops/s (278235968 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 2135454 ops/s (546676224 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks):  736839 ops/s (754523136 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks):  533261 ops/s (784960192 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):  100850 ops/s (826163200 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 5745691 ops/s ( 91931056 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 4113271 ops/s (263249344 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 1932208 ops/s (494645248 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks):  644555 ops/s (660024320 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks):  464237 ops/s (683356864 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):   84019 ops/s (688283648 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 5620065 ops/s ( 89921040 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 3982991 ops/s (254911424 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 1830587 ops/s (468630272 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks):  576151 ops/s (589978624 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks):  412487 ops/s (607180864 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):   76378 ops/s (625688576 bytes)

testing speed of async cbc(aes) (cbc-aes-ce) decryption
tcrypt: test  0 (128 bit key,   16 byte blocks): 5821314 ops/s (  93141024 bytes)
tcrypt: test  1 (128 bit key,   64 byte blocks): 5248040 ops/s ( 335874560 bytes)
tcrypt: test  2 (128 bit key,  256 byte blocks): 3677701 ops/s ( 941491456 bytes)
tcrypt: test  3 (128 bit key, 1024 byte blocks): 1650808 ops/s (1690427392 bytes)
tcrypt: test  4 (128 bit key, 1472 byte blocks): 1256545 ops/s (1849634240 bytes)
tcrypt: test  5 (128 bit key, 8192 byte blocks):  257922 ops/s (2112897024 bytes)
tcrypt: test  6 (192 bit key,   16 byte blocks): 5690108 ops/s (  91041728 bytes)
tcrypt: test  7 (192 bit key,   64 byte blocks): 5086441 ops/s ( 325532224 bytes)
tcrypt: test  8 (192 bit key,  256 byte blocks): 3447562 ops/s ( 882575872 bytes)
tcrypt: test  9 (192 bit key, 1024 byte blocks): 1490136 ops/s (1525899264 bytes)
tcrypt: test 10 (192 bit key, 1472 byte blocks): 1124620 ops/s (1655440640 bytes)
tcrypt: test 11 (192 bit key, 8192 byte blocks):  201222 ops/s (1648410624 bytes)
tcrypt: test 12 (256 bit key,   16 byte blocks): 5567247 ops/s (  89075952 bytes)
tcrypt: test 13 (256 bit key,   64 byte blocks): 5050010 ops/s ( 323200640 bytes)
tcrypt: test 14 (256 bit key,  256 byte blocks): 3290422 ops/s ( 842348032 bytes)
tcrypt: test 15 (256 bit key, 1024 byte blocks): 1359439 ops/s (1392065536 bytes)
tcrypt: test 16 (256 bit key, 1472 byte blocks): 1017751 ops/s (1498129472 bytes)
tcrypt: test 17 (256 bit key, 8192 byte blocks):  201492 ops/s (1650622464 bytes)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
