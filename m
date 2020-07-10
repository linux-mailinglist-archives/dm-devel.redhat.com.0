Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0053621AF5B
	for <lists+dm-devel@lfdr.de>; Fri, 10 Jul 2020 08:22:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Pev_RVoRP_6oL6Fix85gWw-1; Fri, 10 Jul 2020 02:22:34 -0400
X-MC-Unique: Pev_RVoRP_6oL6Fix85gWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BEC800FF1;
	Fri, 10 Jul 2020 06:22:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E2586FEC3;
	Fri, 10 Jul 2020 06:22:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AA061809547;
	Fri, 10 Jul 2020 06:22:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06A6LrSm005866 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 02:21:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F074B1006510; Fri, 10 Jul 2020 06:21:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9ECD10EE836
	for <dm-devel@redhat.com>; Fri, 10 Jul 2020 06:21:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7017100E7C7
	for <dm-devel@redhat.com>; Fri, 10 Jul 2020 06:21:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-72-BfaWRnBmMTKUlX2EJKc44Q-1; 
	Fri, 10 Jul 2020 02:21:46 -0400
X-MC-Unique: BfaWRnBmMTKUlX2EJKc44Q-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EE3A22072E;
	Fri, 10 Jul 2020 06:21:44 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Thu,  9 Jul 2020 23:20:35 -0700
Message-Id: <20200710062042.113842-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06A6LrSm005866
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v2 0/7] crypto: add CRYPTO_ALG_ALLOCATES_MEMORY
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a flag that algorithms can set to indicate that
they allocate memory during processing of typical inputs, and thus
shouldn't be used in cases like dm-crypt where memory allocation
failures aren't acceptable.

Compared to Mikulas's patches, I've made the following improvements:

- Tried to clearly document the semantics of
  CRYPTO_ALG_ALLOCATES_MEMORY.  This includes documenting the usage
  constraints, since there are actually lots of cases that were
  overlooked where algorithms can still allocate memory in some edge
  cases where inputs are misaligned, fragemented, etc.  E.g. see
  crypto/skcipher.c and crypto/ahash.c.  Mikulas, please let me know if
  there are any concerns for dm-crypt.

- Moved the common mechanism for inheriting flags to its own patch.

- crypto_grab_spawn() now handles propagating CRYPTO_ALG_INHERITED_FLAGS
  to the new template instance.

- Inherit the flags in various places that were missed.

- Other cleanups.

Additional changes v1 => v2:

- Made crypto_check_attr_type() return the mask.

- Added patch that adds NEED_FALLBACK to INHERITED_FLAGS.

- Added patch that removes seqiv_create().

Eric Biggers (5):
  crypto: geniv - remove unneeded arguments from aead_geniv_alloc()
  crypto: seqiv - remove seqiv_create()
  crypto: algapi - use common mechanism for inheriting flags
  crypto: algapi - add NEED_FALLBACK to INHERITED_FLAGS
  crypto: algapi - introduce the flag CRYPTO_ALG_ALLOCATES_MEMORY

Mikulas Patocka (2):
  crypto: drivers - set the flag CRYPTO_ALG_ALLOCATES_MEMORY
  dm-crypt: don't use drivers that have CRYPTO_ALG_ALLOCATES_MEMORY

 crypto/adiantum.c                             |  14 +--
 crypto/algapi.c                               |  21 +++-
 crypto/authenc.c                              |  14 +--
 crypto/authencesn.c                           |  14 +--
 crypto/ccm.c                                  |  33 ++---
 crypto/chacha20poly1305.c                     |  14 +--
 crypto/cmac.c                                 |   5 +-
 crypto/cryptd.c                               |  59 ++++-----
 crypto/ctr.c                                  |  17 +--
 crypto/cts.c                                  |  13 +-
 crypto/echainiv.c                             |   2 +-
 crypto/essiv.c                                |  11 +-
 crypto/gcm.c                                  |  40 ++----
 crypto/geniv.c                                |  19 +--
 crypto/hmac.c                                 |   5 +-
 crypto/lrw.c                                  |  13 +-
 crypto/pcrypt.c                               |  14 +--
 crypto/rsa-pkcs1pad.c                         |  13 +-
 crypto/seqiv.c                                |  18 +--
 crypto/simd.c                                 |   6 +-
 crypto/skcipher.c                             |  13 +-
 crypto/vmac.c                                 |   5 +-
 crypto/xcbc.c                                 |   5 +-
 crypto/xts.c                                  |  15 +--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  12 +-
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  12 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c     |   6 +-
 drivers/crypto/axis/artpec6_crypto.c          |  20 ++-
 drivers/crypto/bcm/cipher.c                   |  72 ++++++++---
 drivers/crypto/caam/caamalg.c                 |   6 +-
 drivers/crypto/caam/caamalg_qi.c              |   6 +-
 drivers/crypto/caam/caamalg_qi2.c             |   8 +-
 drivers/crypto/caam/caamhash.c                |   2 +-
 drivers/crypto/cavium/cpt/cptvf_algs.c        |  18 ++-
 drivers/crypto/cavium/nitrox/nitrox_aead.c    |   4 +-
 .../crypto/cavium/nitrox/nitrox_skcipher.c    |  16 +--
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c      |   1 +
 drivers/crypto/ccp/ccp-crypto-aes-galois.c    |   1 +
 drivers/crypto/ccp/ccp-crypto-aes-xts.c       |   1 +
 drivers/crypto/ccp/ccp-crypto-aes.c           |   2 +
 drivers/crypto/ccp/ccp-crypto-des3.c          |   1 +
 drivers/crypto/ccp/ccp-crypto-sha.c           |   1 +
 drivers/crypto/chelsio/chcr_algo.c            |   7 +-
 drivers/crypto/hisilicon/sec/sec_algs.c       |  24 ++--
 drivers/crypto/hisilicon/sec2/sec_crypto.c    |   4 +-
 .../crypto/inside-secure/safexcel_cipher.c    |  47 +++++++
 drivers/crypto/inside-secure/safexcel_hash.c  |  18 +++
 drivers/crypto/ixp4xx_crypto.c                |   6 +-
 drivers/crypto/marvell/cesa/cipher.c          |  18 ++-
 drivers/crypto/marvell/cesa/hash.c            |   6 +
 .../crypto/marvell/octeontx/otx_cptvf_algs.c  |  30 ++---
 drivers/crypto/n2_core.c                      |   3 +-
 drivers/crypto/picoxcell_crypto.c             |  17 ++-
 drivers/crypto/qat/qat_common/qat_algs.c      |  13 +-
 drivers/crypto/qce/skcipher.c                 |   1 +
 drivers/crypto/talitos.c                      | 117 ++++++++++++------
 drivers/crypto/virtio/virtio_crypto_algs.c    |   3 +-
 drivers/crypto/xilinx/zynqmp-aes-gcm.c        |   1 +
 drivers/md/dm-crypt.c                         |  17 ++-
 include/crypto/algapi.h                       |  25 ++--
 include/crypto/internal/geniv.h               |   2 +-
 include/linux/crypto.h                        |  36 +++++-
 62 files changed, 562 insertions(+), 405 deletions(-)


base-commit: 3d2df84548ed88dc3344392d4e5afb8884d05360
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

