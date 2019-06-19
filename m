Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B404BE4B
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 18:32:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12B4E23E6E7;
	Wed, 19 Jun 2019 16:32:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D775819C71;
	Wed, 19 Jun 2019 16:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF699206D2;
	Wed, 19 Jun 2019 16:32:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JGU0b3016585 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 12:30:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B8285C21E; Wed, 19 Jun 2019 16:30:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E1B5C207
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 16:30:00 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F376811DE
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 16:29:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so144864wmj.3
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s7YMvUeKHGCVPJ6h56oRKX/tJWXbZ14BKIbZN9gJZ54=;
	b=eMMMWYZGeoSYwM2Rb3U8pUTkVicJDmfOxgck1fjWi1SKUOs/Y8GqoTMbY4/XG0FKBf
	rSu7Q6/zA+WT/2CCI4L/vaPLP29Xi5DyYJW9cCs8ppKuiQiJXjg9K4RWSXwu8MZ7Ihgi
	ibDToRK5FS5Ohz43wVNxhK5ZmQeVzxT6rPSsKk+DTFxpFFQBySjY6DL0SMNW2J8CNlWy
	BOEsGvZkm1i1vUvJx5Fm4wge8wESv/ABJy4UOfqKgT3eXmnkkZSYQmHB8WGdJSte3XVX
	M/QBVQQ7eqjBna5Zob0eIfVT1Gbg3yzFz2zWYIgQNpSm6C0VH6ushjJMC1aHgrEqbq3N
	MBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s7YMvUeKHGCVPJ6h56oRKX/tJWXbZ14BKIbZN9gJZ54=;
	b=bPcE6S/W2qpwsDErmS0GBCMkH3hXb+6PdiqwMzazquPNm4uiUhlfl0Quir6g9fn/SH
	LF7VJduFwBg0srvcU0Y4C4OgZMJHdvay9LG3R/n/xRsL5mVDCQgSEpGMQH2ocxOTuw2D
	Rl7/Y9Hf+DkF3zpqzkwc9OH4l1z+7qFsy86d6cQTUXwLhb5L5szscqqFpVkPdO21eCMR
	smW/0yqDGnEJY4ysN8ioUTmAh/PNBsnf4XH5SFGx7XYXo+Ot+IfAj0J8v1HP/X9/RJML
	B60UeCPUzjEmrFzdKjQFzdWDLlCyGs12nQM/WiCXjw1cXrcxEQpWUq+NIYDRvFILlFS+
	2KLQ==
X-Gm-Message-State: APjAAAU7AJuYh5WvO1nZkn7kBfqiNxhdFsojSTCLVmu7Dzouah/+UNea
	cP3K3skZwzWGEqg7Qr8dZGWrhA==
X-Google-Smtp-Source: APXvYqyrwmONlQJLim0WamimribrTMlM1X8z6r0UVVTQFfT7okHbJzxy0T2AuaWZcCpYQcjG8u6OMQ==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr6648778wme.95.1560961776946; 
	Wed, 19 Jun 2019 09:29:36 -0700 (PDT)
Received: from localhost.localdomain
	(laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	32sm37815960wra.35.2019.06.19.09.29.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 09:29:36 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 19 Jun 2019 18:29:15 +0200
Message-Id: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 19 Jun 2019 16:29:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 19 Jun 2019 16:29:45 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE,
	SPF_NONE) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for ESSIV
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 16:32:31 +0000 (UTC)

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
https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=essiv-v3

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org
Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Milan Broz <gmazyland@gmail.com>

Ard Biesheuvel (6):
  crypto: essiv - create wrapper template for ESSIV generation
  fs: crypto: invoke crypto API for ESSIV handling
  md: dm-crypt: infer ESSIV block cipher from cipher string directly
  md: dm-crypt: switch to ESSIV crypto API template
  crypto: essiv - add test vector for essiv(cbc(aes),aes,sha256)
  crypto: arm64/aes - implement accelerated ESSIV/CBC mode

 arch/arm64/crypto/aes-glue.c  | 129 ++++
 arch/arm64/crypto/aes-modes.S |  99 +++
 crypto/Kconfig                |   4 +
 crypto/Makefile               |   1 +
 crypto/essiv.c                | 630 ++++++++++++++++++++
 crypto/tcrypt.c               |   9 +
 crypto/testmgr.c              |   6 +
 crypto/testmgr.h              | 208 +++++++
 drivers/md/Kconfig            |   1 +
 drivers/md/dm-crypt.c         | 237 ++------
 fs/crypto/Kconfig             |   1 +
 fs/crypto/crypto.c            |   5 -
 fs/crypto/fscrypt_private.h   |   9 -
 fs/crypto/keyinfo.c           |  88 +--
 14 files changed, 1132 insertions(+), 295 deletions(-)
 create mode 100644 crypto/essiv.c

-- 
2.20.1

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
