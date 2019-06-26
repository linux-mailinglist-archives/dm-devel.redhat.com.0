Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2C572CA
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 22:42:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 568FB88306;
	Wed, 26 Jun 2019 20:42:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF29160C69;
	Wed, 26 Jun 2019 20:42:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C8001806B0E;
	Wed, 26 Jun 2019 20:42:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QKfHu9007819 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 16:41:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E21B95D71B; Wed, 26 Jun 2019 20:41:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8C55D719
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 20:41:17 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C489E307D849
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 20:40:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so4308189wru.0
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NPjxqtyjQpYCgybS5zN78zffB956dgNyXrI9VH1y9Hc=;
	b=IIHfq8mCVktitxkEaThPZUfzgKbkr3QTYmX2SgJ6H0We5g1vtQscSIvE2OTtjaDQ3C
	+4+TjStEWDjMKdKm/SyAA12jVhu2yYFeSBuM58Ir1x0bsp/e9NJjODm2Ym6B4N7ZsTjD
	00GSJbQNyCvojnjTVMzq31XyKvzY4yUW7+XH3CVNURSYmQ01eNF2ukHpukfVQeiOYEsj
	2lOpFgA8UwWZ44zGgHx8ksc+gLrG8zfF5+p2cWP7oSzotuZ6S0ydvQwHL4G07DZKO302
	Miyt4b5mFXqFHGCyqD8VILdjvAlnF87KAp9rNGb7HW3qaaDvvfjcSOPcJw0bcpA+OQqU
	ivjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NPjxqtyjQpYCgybS5zN78zffB956dgNyXrI9VH1y9Hc=;
	b=UbjRDdZ7ebL0Q50/PPBafyiy/MsUA3NLCabqmW9VDWs0sQTQierEonfwxKJWd6IcTV
	GYKL/+MZ5zdBfa9kmyYZlC987ESiE8BTeNKQL3tDQRokQ+vBZ588S59ZYj4XuZWeQKoQ
	zNE5/JPUw27MpasQDmq5uiDyTj7+6wfFtk8Im7vefL7KD3tJZjnnzskLAybzVLOVuMpb
	w63ZxezUGHboeFsDtFesUV1n9aFb1vU/EdzCm9/HdXYjjIeoxSpI3M2hfNVcjJu0I91p
	Q/JH+R3ryKpaOQ0kEsFTvthgyspbrifbu3xRJQlu9i3XGAhF6+rVI8/RRFUi8srDgL6V
	Lfyg==
X-Gm-Message-State: APjAAAVViwDL2NTlwXQgiBfP1S0S7+1Dzjm5t795RK4ZCEUsHFxgeL5Q
	s+FRma+TTJnpFVQavGV9Cpl1iQ==
X-Google-Smtp-Source: APXvYqzyPP2kqpROYclJaOZTSu+oBTttt7ijJE2qrnLMB35rJqOYfqlpYR3U9Q9USBzOTxHA6dZ5xA==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr5328474wrv.89.1561581651363;
	Wed, 26 Jun 2019 13:40:51 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:9c7f:f574:ee94:7dec])
	by smtp.gmail.com with ESMTPSA id
	32sm35164587wra.35.2019.06.26.13.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 13:40:50 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 26 Jun 2019 22:40:40 +0200
Message-Id: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 20:40:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 20:40:53 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [dm-devel] [PATCH v5 0/7] crypto: switch to crypto API for ESSIV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 26 Jun 2019 20:42:31 +0000 (UTC)

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
https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=essiv-v5

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
 crypto/Kconfig                |   4 +
 crypto/Makefile               |   1 +
 crypto/essiv.c                | 636 ++++++++++++++++++++
 crypto/tcrypt.c               |   9 +
 crypto/testmgr.c              |   6 +
 crypto/testmgr.h              | 213 +++++++
 drivers/md/Kconfig            |   1 +
 drivers/md/dm-crypt.c         | 229 ++-----
 fs/crypto/Kconfig             |   1 +
 fs/crypto/crypto.c            |   5 -
 fs/crypto/fscrypt_private.h   |   9 -
 fs/crypto/keyinfo.c           |  88 +--
 14 files changed, 1111 insertions(+), 325 deletions(-)
 create mode 100644 crypto/essiv.c

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
