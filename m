Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3590520F674
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 15:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593525527;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hVByTurpQcigi+xVzBu0GXVpnRgMvcwq/pAOebN68TQ=;
	b=FmSVIpLyTBkXkuLFtXrR3F/q21+kHBrvDOvE2s/tT01wezBlQKh4rUWVDLEp7hk4qhhxj2
	TXfJ7TPVZ2lr6yNpOQSzNK7tVzwM9GEqGrVbEDkZZLChqrZNNPo5o7XbKhzdFTvvfIb8mz
	MAKsBvmK1vMlkjGIrrbIxWUcWDZvaAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-2066h6OTO4u9HwDhyV2Dfg-1; Tue, 30 Jun 2020 09:58:44 -0400
X-MC-Unique: 2066h6OTO4u9HwDhyV2Dfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C09D107B64F;
	Tue, 30 Jun 2020 13:56:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 676777166E;
	Tue, 30 Jun 2020 13:56:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED1831809547;
	Tue, 30 Jun 2020 13:56:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UDuRSI025818 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 09:56:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D21B67BEDE; Tue, 30 Jun 2020 13:56:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 115A37BEAF;
	Tue, 30 Jun 2020 13:56:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05UDuNn5016718; Tue, 30 Jun 2020 09:56:23 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05UDuMLs016714; Tue, 30 Jun 2020 09:56:22 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 30 Jun 2020 09:56:22 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <alpine.LRH.2.02.2006281505250.347@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2006300954150.15237@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<alpine.LRH.2.02.2006281505250.347@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@Huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: [dm-devel] [PATCH 1/3 v4] crypto: introduce the flag
 CRYPTO_ALG_ALLOCATES_MEMORY
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a new flag CRYPTO_ALG_ALLOCATES_MEMORY and pass it down the
crypto stack.

If the flag is set, then the crypto driver allocates memory in its request
routine. Such drivers are not suitable for disk encryption because
GFP_ATOMIC allocation can fail anytime (causing random I/O errors) and
GFP_KERNEL allocation can recurse into the block layer, causing a
deadlock.

Pass the flag CRYPTO_ALG_ALLOCATES_MEMORY down through the crypto API.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 crypto/adiantum.c         |    2 +-
 crypto/authenc.c          |    7 ++++---
 crypto/authencesn.c       |    7 ++++---
 crypto/ccm.c              |    8 ++++----
 crypto/chacha20poly1305.c |    7 ++++---
 crypto/cryptd.c           |   16 +++++++++++-----
 crypto/ctr.c              |    4 ++--
 crypto/cts.c              |    4 ++--
 crypto/essiv.c            |    4 ++--
 crypto/gcm.c              |   15 ++++++++-------
 crypto/geniv.c            |    4 ++--
 crypto/lrw.c              |    4 ++--
 crypto/pcrypt.c           |    4 +++-
 crypto/rsa-pkcs1pad.c     |    4 ++--
 crypto/seqiv.c            |    2 ++
 crypto/xts.c              |    4 ++--
 include/crypto/algapi.h   |   10 ++++++----
 include/linux/crypto.h    |   15 +++++++++++++++
 18 files changed, 76 insertions(+), 45 deletions(-)

Index: linux-2.6/include/linux/crypto.h
===================================================================
--- linux-2.6.orig/include/linux/crypto.h	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/include/linux/crypto.h	2020-06-29 16:03:07.336417000 +0200
@@ -102,6 +102,21 @@
 #define CRYPTO_NOLOAD			0x00008000
 
 /*
+ * The driver may allocate memory during request processing, so it shouldn't be
+ * used in cases where memory allocation failures aren't acceptable, such as
+ * during block device encryption.
+ */
+#define CRYPTO_ALG_ALLOCATES_MEMORY	0x00010000
+
+/*
+ * When an algorithm uses another algorithm (e.g., if it's an instance of a
+ * template), these are the flags that always get set on the "outer" algorithm
+ * if any "inner" algorithm has them set.  In some cases other flags are
+ * inherited too; these are just the flags that are *always* inherited.
+ */
+#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)
+
+/*
  * Transform masks and values (for crt_flags).
  */
 #define CRYPTO_TFM_NEED_KEY		0x00000001
Index: linux-2.6/crypto/authenc.c
===================================================================
--- linux-2.6.orig/crypto/authenc.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/authenc.c	2020-06-30 15:47:56.516417000 +0200
@@ -388,7 +388,7 @@ static int crypto_authenc_create(struct
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -423,8 +423,9 @@ static int crypto_authenc_create(struct
 		     enc->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = (auth_base->cra_flags |
-				    enc->base.cra_flags) & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags =
+		(auth_base->cra_flags | enc->base.cra_flags) &
+		CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = enc->base.cra_priority * 10 +
 				      auth_base->cra_priority;
 	inst->alg.base.cra_blocksize = enc->base.cra_blocksize;
Index: linux-2.6/crypto/authencesn.c
===================================================================
--- linux-2.6.orig/crypto/authencesn.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/authencesn.c	2020-06-30 15:48:11.996417000 +0200
@@ -406,7 +406,7 @@ static int crypto_authenc_esn_create(str
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -437,8 +437,9 @@ static int crypto_authenc_esn_create(str
 		     enc->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = (auth_base->cra_flags |
-				    enc->base.cra_flags) & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags =
+		(auth_base->cra_flags | enc->base.cra_flags) &
+		CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = enc->base.cra_priority * 10 +
 				      auth_base->cra_priority;
 	inst->alg.base.cra_blocksize = enc->base.cra_blocksize;
Index: linux-2.6/crypto/ccm.c
===================================================================
--- linux-2.6.orig/crypto/ccm.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/ccm.c	2020-06-29 16:03:07.336417000 +0200
@@ -462,7 +462,7 @@ static int crypto_ccm_create_common(stru
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ictx), GFP_KERNEL);
 	if (!inst)
@@ -507,7 +507,7 @@ static int crypto_ccm_create_common(stru
 		     mac->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = ctr->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = ctr->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = (mac->base.cra_priority +
 				       ctr->base.cra_priority) / 2;
 	inst->alg.base.cra_blocksize = 1;
@@ -726,7 +726,7 @@ static int crypto_rfc4309_create(struct
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
 	if (!inst)
@@ -759,7 +759,7 @@ static int crypto_rfc4309_create(struct
 	    CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = 1;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
Index: linux-2.6/crypto/chacha20poly1305.c
===================================================================
--- linux-2.6.orig/crypto/chacha20poly1305.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/chacha20poly1305.c	2020-06-30 15:47:19.816417000 +0200
@@ -573,7 +573,7 @@ static int chachapoly_create(struct cryp
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -613,8 +613,9 @@ static int chachapoly_create(struct cryp
 		     poly->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = (chacha->base.cra_flags |
-				    poly->base.cra_flags) & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags =
+		(chacha->base.cra_flags |
+		poly->base.cra_flags) & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = (chacha->base.cra_priority +
 				       poly->base.cra_priority) / 2;
 	inst->alg.base.cra_blocksize = 1;
Index: linux-2.6/crypto/cryptd.c
===================================================================
--- linux-2.6.orig/crypto/cryptd.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/cryptd.c	2020-06-30 15:49:04.206417000 +0200
@@ -202,6 +202,7 @@ static inline void cryptd_check_internal
 
 	*type |= algt->type & CRYPTO_ALG_INTERNAL;
 	*mask |= algt->mask & CRYPTO_ALG_INTERNAL;
+	*mask |= algt->mask & CRYPTO_ALG_INHERITED_FLAGS;
 }
 
 static int cryptd_init_instance(struct crypto_instance *inst,
@@ -395,8 +396,10 @@ static int cryptd_create_skcipher(struct
 	if (err)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = CRYPTO_ALG_ASYNC |
-				   (alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
+	inst->alg.base.cra_flags =
+		CRYPTO_ALG_ASYNC |
+		(alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS) |
+		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
 
 	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
@@ -663,7 +666,8 @@ static int cryptd_create_hash(struct cry
 
 	inst->alg.halg.base.cra_flags = CRYPTO_ALG_ASYNC |
 		(alg->base.cra_flags & (CRYPTO_ALG_INTERNAL |
-					CRYPTO_ALG_OPTIONAL_KEY));
+					CRYPTO_ALG_OPTIONAL_KEY |
+					CRYPTO_ALG_INHERITED_FLAGS));
 
 	inst->alg.halg.digestsize = alg->digestsize;
 	inst->alg.halg.statesize = alg->statesize;
@@ -848,8 +852,10 @@ static int cryptd_create_aead(struct cry
 	if (err)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = CRYPTO_ALG_ASYNC |
-				   (alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
+	inst->alg.base.cra_flags =
+		CRYPTO_ALG_ASYNC |
+		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL) |
+		(alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS);
 	inst->alg.base.cra_ctxsize = sizeof(struct cryptd_aead_ctx);
 
 	inst->alg.ivsize = crypto_aead_alg_ivsize(alg);
Index: linux-2.6/crypto/ctr.c
===================================================================
--- linux-2.6.orig/crypto/ctr.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/ctr.c	2020-06-29 16:03:07.336417000 +0200
@@ -275,7 +275,7 @@ static int crypto_rfc3686_create(struct
 	if (!inst)
 		return -ENOMEM;
 
-	mask = crypto_requires_sync(algt->type, algt->mask) |
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask) |
 		crypto_requires_off(algt->type, algt->mask,
 				    CRYPTO_ALG_NEED_FALLBACK);
 
@@ -310,7 +310,7 @@ static int crypto_rfc3686_create(struct
 	inst->alg.base.cra_blocksize = 1;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 
 	inst->alg.ivsize = CTR_RFC3686_IV_SIZE;
 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
Index: linux-2.6/crypto/cts.c
===================================================================
--- linux-2.6.orig/crypto/cts.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/cts.c	2020-06-29 16:03:07.346417000 +0200
@@ -337,7 +337,7 @@ static int crypto_cts_create(struct cryp
 	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
 	if (!inst)
@@ -364,7 +364,7 @@ static int crypto_cts_create(struct cryp
 	if (err)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = alg->base.cra_blocksize;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
Index: linux-2.6/crypto/essiv.c
===================================================================
--- linux-2.6.orig/crypto/essiv.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/essiv.c	2020-06-29 16:03:07.346417000 +0200
@@ -466,7 +466,7 @@ static int essiv_create(struct crypto_te
 		return PTR_ERR(shash_name);
 
 	type = algt->type & algt->mask;
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	switch (type) {
 	case CRYPTO_ALG_TYPE_SKCIPHER:
@@ -557,7 +557,7 @@ static int essiv_create(struct crypto_te
 		     hash_alg->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
 		goto out_free_hash;
 
-	base->cra_flags		= block_base->cra_flags & CRYPTO_ALG_ASYNC;
+	base->cra_flags		= block_base->cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	base->cra_blocksize	= block_base->cra_blocksize;
 	base->cra_ctxsize	= sizeof(struct essiv_tfm_ctx);
 	base->cra_alignmask	= block_base->cra_alignmask;
Index: linux-2.6/crypto/gcm.c
===================================================================
--- linux-2.6.orig/crypto/gcm.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/gcm.c	2020-06-30 15:48:26.566417000 +0200
@@ -593,7 +593,7 @@ static int crypto_gcm_create_common(stru
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -635,8 +635,9 @@ static int crypto_gcm_create_common(stru
 	    CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = (ghash->base.cra_flags |
-				    ctr->base.cra_flags) & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags =
+		(ghash->base.cra_flags | ctr->base.cra_flags) &
+		CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = (ghash->base.cra_priority +
 				       ctr->base.cra_priority) / 2;
 	inst->alg.base.cra_blocksize = 1;
@@ -849,7 +850,7 @@ static int crypto_rfc4106_create(struct
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
 	if (!inst)
@@ -882,7 +883,7 @@ static int crypto_rfc4106_create(struct
 	    CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = 1;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
@@ -1071,7 +1072,7 @@ static int crypto_rfc4543_create(struct
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -1104,7 +1105,7 @@ static int crypto_rfc4543_create(struct
 	    CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = 1;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
Index: linux-2.6/crypto/geniv.c
===================================================================
--- linux-2.6.orig/crypto/geniv.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/geniv.c	2020-06-29 16:03:07.346417000 +0200
@@ -63,7 +63,7 @@ struct aead_instance *aead_geniv_alloc(s
 	spawn = aead_instance_ctx(inst);
 
 	/* Ignore async algorithms if necessary. */
-	mask |= crypto_requires_sync(algt->type, algt->mask);
+	mask |= crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	err = crypto_grab_aead(spawn, aead_crypto_instance(inst),
 			       crypto_attr_alg_name(tb[1]), type, mask);
@@ -89,7 +89,7 @@ struct aead_instance *aead_geniv_alloc(s
 	    CRYPTO_MAX_ALG_NAME)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = alg->base.cra_blocksize;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask;
Index: linux-2.6/crypto/lrw.c
===================================================================
--- linux-2.6.orig/crypto/lrw.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/lrw.c	2020-06-29 16:03:07.346417000 +0200
@@ -311,7 +311,7 @@ static int create(struct crypto_template
 	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	cipher_name = crypto_attr_alg_name(tb[1]);
 	if (IS_ERR(cipher_name))
@@ -379,7 +379,7 @@ static int create(struct crypto_template
 	} else
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = LRW_BLOCK_SIZE;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask |
Index: linux-2.6/crypto/rsa-pkcs1pad.c
===================================================================
--- linux-2.6.orig/crypto/rsa-pkcs1pad.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/rsa-pkcs1pad.c	2020-06-30 15:49:13.696417000 +0200
@@ -611,7 +611,7 @@ static int pkcs1pad_create(struct crypto
 	if ((algt->type ^ CRYPTO_ALG_TYPE_AKCIPHER) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
 	if (!inst)
@@ -658,7 +658,7 @@ static int pkcs1pad_create(struct crypto
 			goto err_free_inst;
 	}
 
-	inst->alg.base.cra_flags = rsa_alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = rsa_alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = rsa_alg->base.cra_priority;
 	inst->alg.base.cra_ctxsize = sizeof(struct pkcs1pad_ctx);
 
Index: linux-2.6/crypto/xts.c
===================================================================
--- linux-2.6.orig/crypto/xts.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/xts.c	2020-06-29 16:04:38.096417000 +0200
@@ -357,7 +357,7 @@ static int create(struct crypto_template
 
 	mask = crypto_requires_off(algt->type, algt->mask,
 				   CRYPTO_ALG_NEED_FALLBACK |
-				   CRYPTO_ALG_ASYNC);
+				   CRYPTO_ALG_INHERITED_FLAGS);
 
 	err = crypto_grab_skcipher(&ctx->spawn, skcipher_crypto_instance(inst),
 				   cipher_name, 0, mask);
@@ -415,7 +415,7 @@ static int create(struct crypto_template
 	} else
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
 	inst->alg.base.cra_priority = alg->base.cra_priority;
 	inst->alg.base.cra_blocksize = XTS_BLOCK_SIZE;
 	inst->alg.base.cra_alignmask = alg->base.cra_alignmask |
Index: linux-2.6/include/crypto/algapi.h
===================================================================
--- linux-2.6.orig/include/crypto/algapi.h	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/include/crypto/algapi.h	2020-06-29 16:03:07.346417000 +0200
@@ -241,12 +241,14 @@ static inline int crypto_requires_off(u3
 }
 
 /*
- * Returns CRYPTO_ALG_ASYNC if type/mask requires the use of sync algorithms.
- * Otherwise returns zero.
+ * Returns the flag CRYPTO_ALG_ASYNC if type/mask requires the use of sync
+ * algorithms.
+ * Returns the flag CRYPTO_ALG_ALLOCATES_MEMORY if type/mask requires the use
+ * of drivers that don't allocate memory. Otherwise returns zero.
  */
-static inline int crypto_requires_sync(u32 type, u32 mask)
+static inline int crypto_alg_inherited_mask(u32 type, u32 mask)
 {
-	return crypto_requires_off(type, mask, CRYPTO_ALG_ASYNC);
+	return crypto_requires_off(type, mask, CRYPTO_ALG_INHERITED_FLAGS);
 }
 
 noinline unsigned long __crypto_memneq(const void *a, const void *b, size_t size);
Index: linux-2.6/crypto/adiantum.c
===================================================================
--- linux-2.6.orig/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/adiantum.c	2020-06-29 16:03:07.346417000 +0200
@@ -507,7 +507,7 @@ static int adiantum_create(struct crypto
 	if ((algt->type ^ CRYPTO_ALG_TYPE_SKCIPHER) & algt->mask)
 		return -EINVAL;
 
-	mask = crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*ictx), GFP_KERNEL);
 	if (!inst)
Index: linux-2.6/crypto/pcrypt.c
===================================================================
--- linux-2.6.orig/crypto/pcrypt.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/pcrypt.c	2020-06-30 15:47:32.776417000 +0200
@@ -263,7 +263,9 @@ static int pcrypt_create_aead(struct cry
 	if (err)
 		goto err_free_inst;
 
-	inst->alg.base.cra_flags = CRYPTO_ALG_ASYNC;
+	inst->alg.base.cra_flags =
+		CRYPTO_ALG_ASYNC |
+		(alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS);
 
 	inst->alg.ivsize = crypto_aead_alg_ivsize(alg);
 	inst->alg.maxauthsize = crypto_aead_alg_maxauthsize(alg);
Index: linux-2.6/crypto/seqiv.c
===================================================================
--- linux-2.6.orig/crypto/seqiv.c	2020-06-29 16:03:07.346417000 +0200
+++ linux-2.6/crypto/seqiv.c	2020-06-29 16:03:07.346417000 +0200
@@ -147,6 +147,8 @@ static int seqiv_aead_create(struct cryp
 	if (inst->alg.ivsize != sizeof(u64))
 		goto free_inst;
 
+	inst->alg.base.cra_flags |= CRYPTO_ALG_ALLOCATES_MEMORY;
+
 	inst->alg.encrypt = seqiv_aead_encrypt;
 	inst->alg.decrypt = seqiv_aead_decrypt;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

