Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1AE92660
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 16:17:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D46E46673;
	Mon, 19 Aug 2019 14:17:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C60F41001DCD;
	Mon, 19 Aug 2019 14:17:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BB8324F32;
	Mon, 19 Aug 2019 14:17:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JEHhFn012670 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 10:17:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C59F11C9BF; Mon, 19 Aug 2019 14:17:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15CAA11C9B0
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:17:38 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D11D31955CF3
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:17:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so8922298wrr.5
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=9Xrs6PZejrdbYuAGd9A0Bw17AwMfilxW7+CqMJVtBPI=;
	b=dGv3mm31pmCbdLGVe1vigGT4JTyXPV/Mda7rlHDMoJ/zN1H9HG2NxJCGH+Fn1Sdehu
	FBHEAwKqAjDqjYyX8/RewEzYXbPnD58fiIrjQGVDftD5ennsB0BunKLzbv4KZsS2opPX
	uZIS1Eyi83D8xgTxLyg3c2jp+Vrk87jCFD90yvmAxyeV6cfK/XVfBZXakW3ZRI+cuNo0
	PiKAAteRJVNcWe2ao4RMGDENnThoecJ04sxxFS7bFTLhgEvXK2A4N3jooDN1YL2Pa3RD
	GIoECd3qzyvuJhMjdFhgPQusMVg96NiCSVHgeHXIXbZJBxGNsOPCZQR9R04J9M/TAF+a
	U2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Xrs6PZejrdbYuAGd9A0Bw17AwMfilxW7+CqMJVtBPI=;
	b=nBTpTMg6FhN0CyxnfmnR34ZtQZZJONw0tE5LQ2vMFZ/FtoIRhf22YhcAthKAZ5mJ5w
	suKC85f490GDL8Y5TzOc6iiGJJt4GBZcGzNPu53M3YNB8HncCP715/w7hGswviYMm11x
	mfH5wf+r8ZNwSt2T4SYgIS+e3zPCEpNKMAZRHLYoiN+ct7yvJZwxBLFoTu7ShqPbiI99
	zjBG9P6jld4wi0tA1KddmOisPQqmTXyfW6MeOGBgIyBAAn1UQuUUcojzxfwlpVx1brog
	SVmSS0S/QKFin1VEA0VDbi9vYLFyzCNUzQt8c3NVEd/VI43TfboCI8tDEn23Pxv2GMUf
	URvA==
X-Gm-Message-State: APjAAAVGWtmBFcn+ZJtyZL4wdc9H1FuiMDht2zr3gibKJcpbPLbsz+Pv
	I2283cUrBCMo82TN/mYZbfxXxg==
X-Google-Smtp-Source: APXvYqy2NrlHoI/QHWVvXP2A0fy5mgEEmo/UHs+9ks1kdMRq1l8TjnQyPXLRkJY7cvuRlrs6C3RzOQ==
X-Received: by 2002:a05:6000:1041:: with SMTP id
	c1mr26116018wrx.99.1566224255401; 
	Mon, 19 Aug 2019 07:17:35 -0700 (PDT)
Received: from localhost.localdomain (11.172.185.81.rev.sfr.net.
	[81.185.172.11]) by smtp.gmail.com with ESMTPSA id
	b26sm12693352wmj.14.2019.08.19.07.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Aug 2019 07:17:34 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Mon, 19 Aug 2019 17:17:32 +0300
Message-Id: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Mon, 19 Aug 2019 14:17:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Mon, 19 Aug 2019 14:17:37 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v13 0/6] crypto: switch to crypto API for ESSIV
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 19 Aug 2019 14:17:51 +0000 (UTC)

This series creates an ESSIV template that produces a skcipher or AEAD
transform based on a tuple of the form '<skcipher>,<shash>' (or '<aead>,<shash>'
for the AEAD case). It exposes the encapsulated sync or async skcipher/aead by
passing through all operations, while using the cipher/shash pair to transform
the input IV into an ESSIV output IV.

Changes since v12:
- don't use a per-instance shash but only record the cra_driver_name of the
  shash when instantiating the template, and allocate the shash for each
  allocated transform instead
- add back the dm-crypt patch -> as Milan has indicated, his preference would
  be to queue these changes for v5.4 (with the first patch shared between the
  cryptodev and md trees on a stable branch based on v5.3-rc1 - if needed,
  I can provide a signed tag)

Changes since v11:
- Avoid spawns for the ESSIV shash and cipher algos. Instead, the shash TFM is
  allocated per-instance (which is appropriate since it is unkeyed and thus
  stateless), and the cipher is allocated explicitly based on the parsed
  skcipher/aead cra_name.

Changes since v10:
- Drop patches against fscrypt and dm-crypt - these will be routed via the
  respective maintainer trees during the next cycle
- Fix error handling when parsing the cipher name from the skcipher cra_name
- Use existing ivsize temporary instead of retrieving it again
- Expose cra_name via module alias (#4)

Changes since v9:
- Fix cipher_api parsing bug that was introduced by dropping the cipher name
  parsing patch in v9 (#3). Thanks to Milan for finding it.
- Fix a couple of instances where the old essiv(x,y,z) format was used in
  comments instead of the essiv(x,z) format we adopted in v9

Changes since v8:
- Remove 'cipher' argument from essiv() template, and instead, parse the
  cra_name of the skcipher to obtain the cipher. This is slightly cleaner
  than what dm-crypt currently does, since we can get the cra_name from the
  spawn, and we don't have to actually allocate the TFM. Since this implies
  that dm-crypt does not need to provide the cipher, we can drop the parsing
  code from it entirely (assuming the eboiv patch I sent out recently is
  applied first) (patch #7)
- Restrict the essiv() AEAD instantiation to AEADs whose cra_name starts with
  'authenc('
- Rebase onto cryptodev/master
- Drop dm-crypt to reorder/refactor cipher name parsing, since it was wrong
  and it is no longer needed.
- Drop Milan's R-b since the code has changed
- Fix bug in accelerated arm64 implementation.

Changes since v7:
- rebase onto cryptodev/master
- drop change to ivsize in #2
- add Milan's R-b's

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

Code can be found here
https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=essiv-v11

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org
Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Milan Broz <gmazyland@gmail.com>

Ard Biesheuvel (6):
  crypto: essiv - create wrapper template for ESSIV generation
  crypto: essiv - add tests for essiv in cbc(aes)+sha256 mode
  crypto: arm64/aes-cts-cbc - factor out CBC en/decryption of a walk
  crypto: arm64/aes - implement accelerated ESSIV/CBC mode
  md: dm-crypt: switch to ESSIV crypto API template
  md: dm-crypt: omit parsing of the encapsulated cipher

 arch/arm64/crypto/aes-glue.c  | 206 ++++--
 arch/arm64/crypto/aes-modes.S |  28 +
 crypto/Kconfig                |  28 +
 crypto/Makefile               |   1 +
 crypto/essiv.c                | 663 ++++++++++++++++++++
 crypto/tcrypt.c               |   9 +
 crypto/testmgr.c              |  14 +
 crypto/testmgr.h              | 497 +++++++++++++++
 drivers/md/Kconfig            |   1 +
 drivers/md/dm-crypt.c         | 271 ++------
 10 files changed, 1448 insertions(+), 270 deletions(-)
 create mode 100644 crypto/essiv.c

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
