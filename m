Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B13503DC
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:43:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9435308339E;
	Mon, 24 Jun 2019 07:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DCC19936;
	Mon, 24 Jun 2019 07:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 197BBC598;
	Mon, 24 Jun 2019 07:43:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5L89p8a016496 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 04:09:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66B935D9E5; Fri, 21 Jun 2019 08:09:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DF15D9D2
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 08:09:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mx1.redhat.com (Postfix) with ESMTP id A063C308624B
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 08:09:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ED72CFC;
	Fri, 21 Jun 2019 01:09:34 -0700 (PDT)
Received: from e111045-lin.arm.com (unknown [10.37.10.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E2D93F246;
	Fri, 21 Jun 2019 01:09:32 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@arm.com>
To: linux-crypto@vger.kernel.org
Date: Fri, 21 Jun 2019 10:09:13 +0200
Message-Id: <20190621080918.22809-2-ard.biesheuvel@arm.com>
In-Reply-To: <20190621080918.22809-1-ard.biesheuvel@arm.com>
References: <20190621080918.22809-1-ard.biesheuvel@arm.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 21 Jun 2019 08:09:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 21 Jun 2019 08:09:41 +0000 (UTC) for IP:'217.140.110.172'
	DOMAIN:'foss.arm.com' HELO:'foss.arm.com'
	FROM:'ard.biesheuvel@arm.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 217.140.110.172 foss.arm.com 217.140.110.172
	foss.arm.com <ard.biesheuvel@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v4 1/6] crypto: essiv - create wrapper template
	for ESSIV generation
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: ard.biesheuvel@linaro.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 24 Jun 2019 07:43:44 +0000 (UTC)

From: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Implement a template that wraps a (skcipher,cipher,shash) or
(aead,cipher,shash) tuple so that we can consolidate the ESSIV handling
in fscrypt and dm-crypt and move it into the crypto API. This will result
in better test coverage, and will allow future changes to make the bare
cipher interface internal to the crypto subsystem, in order to increase
robustness of the API against misuse.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 crypto/Kconfig  |   4 +
 crypto/Makefile |   1 +
 crypto/essiv.c  | 639 ++++++++++++++++++++
 3 files changed, 644 insertions(+)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 3d056e7da65f..1aa47087c1a2 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1917,6 +1917,10 @@ config CRYPTO_STATS
 config CRYPTO_HASH_INFO
 	bool
 
+config CRYPTO_ESSIV
+	tristate
+	select CRYPTO_AUTHENC
+
 source "drivers/crypto/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
diff --git a/crypto/Makefile b/crypto/Makefile
index 266a4cdbb9e2..ad1d99ba6d56 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -148,6 +148,7 @@ obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 obj-$(CONFIG_CRYPTO_OFB) += ofb.o
 obj-$(CONFIG_CRYPTO_ECC) += ecc.o
+obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
diff --git a/crypto/essiv.c b/crypto/essiv.c
new file mode 100644
index 000000000000..8e80814ec7d6
--- /dev/null
+++ b/crypto/essiv.c
@@ -0,0 +1,639 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ESSIV skcipher and aead template for block encryption
+ *
+ * This template encapsulates the ESSIV IV generation algorithm used by
+ * dm-crypt and fscrypt, which converts a 64-bit sector number in little
+ * endian representation into an initial vector for the skcipher used for
+ * block encryption, by encrypting it using the hash of the skcipher key
+ * as encryption key.
+ *
+ * The typical use of this template is to instantiate the skcipher
+ * 'essiv(cbc(aes),aes,sha256)', which is the only instantiation used by
+ * fscrypt, and the most relevant one for dm-crypt. However, dm-crypt
+ * also permits ESSIV to be used in combination with the authenc template,
+ * e.g., 'essiv(authenc(hmac(sha256),cbc(aes)),aes,sha256)', in which case
+ * we need to instantiate an aead that accepts the same special key format
+ * as the authenc template, and deals with the way the encrypted IV is
+ * embedded into the AAD area of the aead request. This means the AEAD
+ * flavor produced by this template is tightly coupled to the way dm-crypt
+ * happens to use it.
+ *
+ * Copyright (c) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
+ *
+ * Heavily based on:
+ * adiantum length-preserving encryption mode
+ *
+ * Copyright 2018 Google LLC
+ */
+
+#include <crypto/authenc.h>
+#include <crypto/internal/aead.h>
+#include <crypto/internal/hash.h>
+#include <crypto/internal/skcipher.h>
+#include <crypto/scatterwalk.h>
+#include <linux/module.h>
+
+#include "internal.h"
+
+#define ESSIV_IV_SIZE		sizeof(__le64)	// IV size of the outer algo
+#define MAX_INNER_IV_SIZE	16		// max IV size of inner algo
+
+struct essiv_instance_ctx {
+	union {
+		struct crypto_skcipher_spawn	skcipher_spawn;
+		struct crypto_aead_spawn	aead_spawn;
+	} u;
+	struct crypto_spawn			essiv_cipher_spawn;
+	struct crypto_shash_spawn		hash_spawn;
+};
+
+struct essiv_tfm_ctx {
+	union {
+		struct crypto_skcipher	*skcipher;
+		struct crypto_aead	*aead;
+	} u;
+	struct crypto_cipher		*essiv_cipher;
+	struct crypto_shash		*hash;
+};
+
+struct essiv_skcipher_request_ctx {
+	u8				iv[MAX_INNER_IV_SIZE];
+	struct skcipher_request		skcipher_req;
+};
+
+struct essiv_aead_request_ctx {
+	u8				iv[2][MAX_INNER_IV_SIZE];
+	struct scatterlist		src[4], dst[4];
+	struct aead_request		aead_req;
+};
+
+static int essiv_skcipher_setkey(struct crypto_skcipher *tfm,
+				 const u8 *key, unsigned int keylen)
+{
+	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	SHASH_DESC_ON_STACK(desc, tctx->hash);
+	u8 salt[HASH_MAX_DIGESTSIZE];
+	int err;
+
+	crypto_skcipher_clear_flags(tctx->u.skcipher, CRYPTO_TFM_REQ_MASK);
+	crypto_skcipher_set_flags(tctx->u.skcipher,
+				  crypto_skcipher_get_flags(tfm) &
+				  CRYPTO_TFM_REQ_MASK);
+	err = crypto_skcipher_setkey(tctx->u.skcipher, key, keylen);
+	crypto_skcipher_set_flags(tfm,
+				  crypto_skcipher_get_flags(tctx->u.skcipher) &
+				  CRYPTO_TFM_RES_MASK);
+	if (err)
+		return err;
+
+	desc->tfm = tctx->hash;
+	err = crypto_shash_digest(desc, key, keylen, salt);
+	if (err)
+		return err;
+
+	crypto_cipher_clear_flags(tctx->essiv_cipher, CRYPTO_TFM_REQ_MASK);
+	crypto_cipher_set_flags(tctx->essiv_cipher,
+				crypto_skcipher_get_flags(tfm) &
+				CRYPTO_TFM_REQ_MASK);
+	err = crypto_cipher_setkey(tctx->essiv_cipher, salt,
+				   crypto_shash_digestsize(tctx->hash));
+	crypto_skcipher_set_flags(tfm,
+				  crypto_cipher_get_flags(tctx->essiv_cipher) &
+				  CRYPTO_TFM_RES_MASK);
+
+	return err;
+}
+
+static int essiv_aead_setkey(struct crypto_aead *tfm, const u8 *key,
+			     unsigned int keylen)
+{
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+	SHASH_DESC_ON_STACK(desc, tctx->hash);
+	struct crypto_authenc_keys keys;
+	u8 salt[HASH_MAX_DIGESTSIZE];
+	int err;
+
+	crypto_aead_clear_flags(tctx->u.aead, CRYPTO_TFM_REQ_MASK);
+	crypto_aead_set_flags(tctx->u.aead, crypto_aead_get_flags(tfm) &
+					    CRYPTO_TFM_REQ_MASK);
+	err = crypto_aead_setkey(tctx->u.aead, key, keylen);
+	crypto_aead_set_flags(tfm, crypto_aead_get_flags(tctx->u.aead) &
+				   CRYPTO_TFM_RES_MASK);
+	if (err)
+		return err;
+
+	if (crypto_authenc_extractkeys(&keys, key, keylen) != 0) {
+		crypto_aead_set_flags(tfm, CRYPTO_TFM_RES_BAD_KEY_LEN);
+		return -EINVAL;
+	}
+
+	desc->tfm = tctx->hash;
+	err = crypto_shash_init(desc) ?:
+	      crypto_shash_update(desc, keys.enckey, keys.enckeylen) ?:
+	      crypto_shash_finup(desc, keys.authkey, keys.authkeylen, salt);
+	if (err)
+		return err;
+
+	crypto_cipher_clear_flags(tctx->essiv_cipher, CRYPTO_TFM_REQ_MASK);
+	crypto_cipher_set_flags(tctx->essiv_cipher, crypto_aead_get_flags(tfm) &
+						    CRYPTO_TFM_REQ_MASK);
+	err = crypto_cipher_setkey(tctx->essiv_cipher, salt,
+				   crypto_shash_digestsize(tctx->hash));
+	crypto_aead_set_flags(tfm, crypto_cipher_get_flags(tctx->essiv_cipher) &
+				   CRYPTO_TFM_RES_MASK);
+
+	return err;
+}
+
+static int essiv_aead_setauthsize(struct crypto_aead *tfm,
+				  unsigned int authsize)
+{
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+
+	return crypto_aead_setauthsize(tctx->u.aead, authsize);
+}
+
+static void essiv_skcipher_done(struct crypto_async_request *areq, int err)
+{
+	struct skcipher_request *req = areq->data;
+
+	skcipher_request_complete(req, err);
+}
+
+static void essiv_skcipher_prepare_subreq(struct skcipher_request *req)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	struct essiv_skcipher_request_ctx *rctx = skcipher_request_ctx(req);
+	struct skcipher_request *subreq = &rctx->skcipher_req;
+
+	memset(rctx->iv, 0, crypto_cipher_blocksize(tctx->essiv_cipher));
+	memcpy(rctx->iv, req->iv, crypto_skcipher_ivsize(tfm));
+
+	crypto_cipher_encrypt_one(tctx->essiv_cipher, rctx->iv, rctx->iv);
+
+	skcipher_request_set_tfm(subreq, tctx->u.skcipher);
+	skcipher_request_set_crypt(subreq, req->src, req->dst, req->cryptlen,
+				   rctx->iv);
+	skcipher_request_set_callback(subreq, skcipher_request_flags(req),
+				      essiv_skcipher_done, req);
+}
+
+static int essiv_skcipher_encrypt(struct skcipher_request *req)
+{
+	struct essiv_skcipher_request_ctx *rctx = skcipher_request_ctx(req);
+
+	essiv_skcipher_prepare_subreq(req);
+	return crypto_skcipher_encrypt(&rctx->skcipher_req);
+}
+
+static int essiv_skcipher_decrypt(struct skcipher_request *req)
+{
+	struct essiv_skcipher_request_ctx *rctx = skcipher_request_ctx(req);
+
+	essiv_skcipher_prepare_subreq(req);
+	return crypto_skcipher_decrypt(&rctx->skcipher_req);
+}
+
+static void essiv_aead_done(struct crypto_async_request *areq, int err)
+{
+	struct aead_request *req = areq->data;
+
+	aead_request_complete(req, err);
+}
+
+static int essiv_aead_prepare_subreq(struct aead_request *req)
+{
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	const struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
+	int ivsize = crypto_cipher_blocksize(tctx->essiv_cipher);
+	int ssize = req->assoclen - crypto_aead_ivsize(tfm);
+	struct aead_request *subreq = &rctx->aead_req;
+	struct scatterlist *sg;
+
+	/*
+	 * dm-crypt embeds the sector number and the IV in the AAD region so we
+	 * have to splice the converted IV into the subrequest that we pass on
+	 * to the AEAD transform. This means we are tightly coupled to dm-crypt,
+	 * but that should be the only user of this code in AEAD mode.
+	 */
+	if (ssize < 0 || sg_nents_for_len(req->src, ssize) != 1)
+		return -EINVAL;
+
+	memset(rctx->iv[0], 0, ivsize);
+	memcpy(rctx->iv[0], req->iv, crypto_aead_ivsize(tfm));
+
+	crypto_cipher_encrypt_one(tctx->essiv_cipher, rctx->iv[0], rctx->iv[0]);
+
+	sg_init_table(rctx->src, 4);
+	sg_set_page(rctx->src, sg_page(req->src), ssize, req->src->offset);
+	sg_set_buf(rctx->src + 1, rctx->iv[0], ivsize);
+	sg = scatterwalk_ffwd(rctx->src + 2, req->src, req->assoclen);
+	if (sg != rctx->src + 2)
+		sg_chain(rctx->src, 3, sg);
+
+	sg_init_table(rctx->dst, 4);
+	sg_set_page(rctx->dst, sg_page(req->dst), ssize, req->dst->offset);
+	sg_set_buf(rctx->dst + 1, rctx->iv[1], ivsize);
+	sg = scatterwalk_ffwd(rctx->dst + 2, req->dst, req->assoclen);
+	if (sg != rctx->dst + 2)
+		sg_chain(rctx->dst, 3, sg);
+
+	aead_request_set_tfm(subreq, tctx->u.aead);
+	aead_request_set_crypt(subreq, rctx->src, rctx->dst, req->cryptlen,
+			       rctx->iv[0]);
+	aead_request_set_ad(subreq, ssize + ivsize);
+	aead_request_set_callback(subreq, aead_request_flags(req),
+				  essiv_aead_done, req);
+
+	return 0;
+}
+
+static int essiv_aead_encrypt(struct aead_request *req)
+{
+	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
+
+	return essiv_aead_prepare_subreq(req) ?:
+	       crypto_aead_encrypt(&rctx->aead_req);
+}
+
+static int essiv_aead_decrypt(struct aead_request *req)
+{
+	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
+
+	return essiv_aead_prepare_subreq(req) ?:
+	       crypto_aead_decrypt(&rctx->aead_req);
+}
+
+static int essiv_init_tfm(struct essiv_instance_ctx *ictx,
+			  struct essiv_tfm_ctx *tctx)
+{
+	struct crypto_cipher *essiv_cipher;
+	struct crypto_shash *hash;
+	int err;
+
+	essiv_cipher = crypto_spawn_cipher(&ictx->essiv_cipher_spawn);
+	if (IS_ERR(essiv_cipher))
+		return PTR_ERR(essiv_cipher);
+
+	hash = crypto_spawn_shash(&ictx->hash_spawn);
+	if (IS_ERR(hash)) {
+		err = PTR_ERR(hash);
+		goto err_free_essiv_cipher;
+	}
+
+	tctx->essiv_cipher = essiv_cipher;
+	tctx->hash = hash;
+
+	return 0;
+
+err_free_essiv_cipher:
+	crypto_free_cipher(essiv_cipher);
+	return err;
+}
+
+static int essiv_skcipher_init_tfm(struct crypto_skcipher *tfm)
+{
+	struct skcipher_instance *inst = skcipher_alg_instance(tfm);
+	struct essiv_instance_ctx *ictx = skcipher_instance_ctx(inst);
+	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	struct crypto_skcipher *skcipher;
+	unsigned int subreq_size;
+	int err;
+
+	BUILD_BUG_ON(offsetofend(struct essiv_skcipher_request_ctx,
+				 skcipher_req) !=
+		     sizeof(struct essiv_skcipher_request_ctx));
+
+	skcipher = crypto_spawn_skcipher(&ictx->u.skcipher_spawn);
+	if (IS_ERR(skcipher))
+		return PTR_ERR(skcipher);
+
+	subreq_size = FIELD_SIZEOF(struct essiv_skcipher_request_ctx,
+				   skcipher_req) +
+		      crypto_skcipher_reqsize(skcipher);
+
+	crypto_skcipher_set_reqsize(tfm,
+				    offsetof(struct essiv_skcipher_request_ctx,
+					     skcipher_req) + subreq_size);
+
+	err = essiv_init_tfm(ictx, tctx);
+	if (err) {
+		crypto_free_skcipher(skcipher);
+		return err;
+	}
+
+	tctx->u.skcipher = skcipher;
+	return 0;
+}
+
+static int essiv_aead_init_tfm(struct crypto_aead *tfm)
+{
+	struct aead_instance *inst = aead_alg_instance(tfm);
+	struct essiv_instance_ctx *ictx = aead_instance_ctx(inst);
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+	struct crypto_aead *aead;
+	unsigned int subreq_size;
+	int err;
+
+	BUILD_BUG_ON(offsetofend(struct essiv_aead_request_ctx, aead_req) !=
+		     sizeof(struct essiv_aead_request_ctx));
+
+	aead = crypto_spawn_aead(&ictx->u.aead_spawn);
+	if (IS_ERR(aead))
+		return PTR_ERR(aead);
+
+	subreq_size = FIELD_SIZEOF(struct essiv_aead_request_ctx, aead_req) +
+		      crypto_aead_reqsize(aead);
+
+	crypto_aead_set_reqsize(tfm, offsetof(struct essiv_aead_request_ctx,
+					      aead_req) + subreq_size);
+
+	err = essiv_init_tfm(ictx, tctx);
+	if (err) {
+		crypto_free_aead(aead);
+		return err;
+	}
+
+	tctx->u.aead = aead;
+	return 0;
+}
+
+static void essiv_skcipher_exit_tfm(struct crypto_skcipher *tfm)
+{
+	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+
+	crypto_free_skcipher(tctx->u.skcipher);
+	crypto_free_cipher(tctx->essiv_cipher);
+	crypto_free_shash(tctx->hash);
+}
+
+static void essiv_aead_exit_tfm(struct crypto_aead *tfm)
+{
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+
+	crypto_free_aead(tctx->u.aead);
+	crypto_free_cipher(tctx->essiv_cipher);
+	crypto_free_shash(tctx->hash);
+}
+
+static void essiv_skcipher_free_instance(struct skcipher_instance *inst)
+{
+	struct essiv_instance_ctx *ictx = skcipher_instance_ctx(inst);
+
+	crypto_drop_skcipher(&ictx->u.skcipher_spawn);
+	crypto_drop_spawn(&ictx->essiv_cipher_spawn);
+	crypto_drop_shash(&ictx->hash_spawn);
+	kfree(inst);
+}
+
+static void essiv_aead_free_instance(struct aead_instance *inst)
+{
+	struct essiv_instance_ctx *ictx = aead_instance_ctx(inst);
+
+	crypto_drop_aead(&ictx->u.aead_spawn);
+	crypto_drop_spawn(&ictx->essiv_cipher_spawn);
+	crypto_drop_shash(&ictx->hash_spawn);
+	kfree(inst);
+}
+
+static bool essiv_supported_algorithms(struct crypto_alg *essiv_cipher_alg,
+				       struct shash_alg *hash_alg,
+				       int ivsize)
+{
+	if (hash_alg->digestsize < essiv_cipher_alg->cra_cipher.cia_min_keysize ||
+	    hash_alg->digestsize > essiv_cipher_alg->cra_cipher.cia_max_keysize)
+		return false;
+
+	if (ivsize != essiv_cipher_alg->cra_blocksize)
+		return false;
+
+	if (ivsize > MAX_INNER_IV_SIZE)
+		return false;
+
+	if (crypto_shash_alg_has_setkey(hash_alg))
+		return false;
+
+	return true;
+}
+
+static int essiv_create(struct crypto_template *tmpl, struct rtattr **tb)
+{
+	struct crypto_attr_type *algt;
+	const char *inner_cipher_name;
+	const char *essiv_cipher_name;
+	const char *shash_name;
+	struct skcipher_instance *skcipher_inst = NULL;
+	struct aead_instance *aead_inst = NULL;
+	struct crypto_instance *inst;
+	struct crypto_alg *base, *block_base;
+	struct essiv_instance_ctx *ictx;
+	struct skcipher_alg *skcipher_alg = NULL;
+	struct aead_alg *aead_alg = NULL;
+	struct crypto_alg *essiv_cipher_alg;
+	struct crypto_alg *_hash_alg;
+	struct shash_alg *hash_alg;
+	int ivsize;
+	u32 type;
+	int err;
+
+	algt = crypto_get_attr_type(tb);
+	if (IS_ERR(algt))
+		return PTR_ERR(algt);
+
+	inner_cipher_name = crypto_attr_alg_name(tb[1]);
+	if (IS_ERR(inner_cipher_name))
+		return PTR_ERR(inner_cipher_name);
+
+	essiv_cipher_name = crypto_attr_alg_name(tb[2]);
+	if (IS_ERR(essiv_cipher_name))
+		return PTR_ERR(essiv_cipher_name);
+
+	shash_name = crypto_attr_alg_name(tb[3]);
+	if (IS_ERR(shash_name))
+		return PTR_ERR(shash_name);
+
+	type = algt->type & algt->mask;
+
+	switch (type) {
+	case CRYPTO_ALG_TYPE_BLKCIPHER:
+		skcipher_inst = kzalloc(sizeof(*skcipher_inst) +
+					sizeof(*ictx), GFP_KERNEL);
+		if (!skcipher_inst)
+			return -ENOMEM;
+		inst = skcipher_crypto_instance(skcipher_inst);
+		base = &skcipher_inst->alg.base;
+		ictx = crypto_instance_ctx(inst);
+
+		/* Block cipher, e.g. "cbc(aes)" */
+		crypto_set_skcipher_spawn(&ictx->u.skcipher_spawn, inst);
+		err = crypto_grab_skcipher(&ictx->u.skcipher_spawn,
+					   inner_cipher_name, 0,
+					   crypto_requires_sync(algt->type,
+								algt->mask));
+		if (err)
+			goto out_free_inst;
+		skcipher_alg = crypto_spawn_skcipher_alg(&ictx->u.skcipher_spawn);
+		block_base = &skcipher_alg->base;
+		ivsize = crypto_skcipher_alg_ivsize(skcipher_alg);
+		break;
+
+	case CRYPTO_ALG_TYPE_AEAD:
+		aead_inst = kzalloc(sizeof(*aead_inst) +
+				    sizeof(*ictx), GFP_KERNEL);
+		if (!aead_inst)
+			return -ENOMEM;
+		inst = aead_crypto_instance(aead_inst);
+		base = &aead_inst->alg.base;
+		ictx = crypto_instance_ctx(inst);
+
+		/* AEAD cipher, e.g. "authenc(hmac(sha256),cbc(aes))" */
+		crypto_set_aead_spawn(&ictx->u.aead_spawn, inst);
+		err = crypto_grab_aead(&ictx->u.aead_spawn,
+				       inner_cipher_name, 0,
+				       crypto_requires_sync(algt->type,
+							    algt->mask));
+		if (err)
+			goto out_free_inst;
+		aead_alg = crypto_spawn_aead_alg(&ictx->u.aead_spawn);
+		block_base = &aead_alg->base;
+		ivsize = aead_alg->ivsize;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Block cipher, e.g. "aes" */
+	crypto_set_spawn(&ictx->essiv_cipher_spawn, inst);
+	err = crypto_grab_spawn(&ictx->essiv_cipher_spawn, essiv_cipher_name,
+				CRYPTO_ALG_TYPE_CIPHER, CRYPTO_ALG_TYPE_MASK);
+	if (err)
+		goto out_drop_skcipher;
+	essiv_cipher_alg = ictx->essiv_cipher_spawn.alg;
+
+	/* Synchronous hash, e.g., "sha256" */
+	_hash_alg = crypto_alg_mod_lookup(shash_name,
+					  CRYPTO_ALG_TYPE_SHASH,
+					  CRYPTO_ALG_TYPE_MASK);
+	if (IS_ERR(_hash_alg)) {
+		err = PTR_ERR(_hash_alg);
+		goto out_drop_essiv_cipher;
+	}
+	hash_alg = __crypto_shash_alg(_hash_alg);
+	err = crypto_init_shash_spawn(&ictx->hash_spawn, hash_alg, inst);
+	if (err)
+		goto out_put_hash;
+
+	/* Check the set of algorithms */
+	if (!essiv_supported_algorithms(essiv_cipher_alg, hash_alg, ivsize)) {
+		pr_warn("Unsupported essiv instantiation: essiv(%s,%s,%s)\n",
+			block_base->cra_name,
+			essiv_cipher_alg->cra_name,
+			hash_alg->base.cra_name);
+		err = -EINVAL;
+		goto out_drop_hash;
+	}
+
+	/* Instance fields */
+
+	err = -ENAMETOOLONG;
+	if (snprintf(base->cra_name, CRYPTO_MAX_ALG_NAME,
+		     "essiv(%s,%s,%s)", block_base->cra_name,
+		     essiv_cipher_alg->cra_name,
+		     hash_alg->base.cra_name) >= CRYPTO_MAX_ALG_NAME)
+		goto out_drop_hash;
+	if (snprintf(base->cra_driver_name, CRYPTO_MAX_ALG_NAME,
+		     "essiv(%s,%s,%s)",
+		     block_base->cra_driver_name,
+		     essiv_cipher_alg->cra_driver_name,
+		     hash_alg->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
+		goto out_drop_hash;
+
+	base->cra_flags		= block_base->cra_flags & CRYPTO_ALG_ASYNC;
+	base->cra_blocksize	= block_base->cra_blocksize;
+	base->cra_ctxsize	= sizeof(struct essiv_tfm_ctx);
+	base->cra_alignmask	= block_base->cra_alignmask;
+	base->cra_priority	= block_base->cra_priority;
+
+	if (type == CRYPTO_ALG_TYPE_BLKCIPHER) {
+		skcipher_inst->alg.setkey	= essiv_skcipher_setkey;
+		skcipher_inst->alg.encrypt	= essiv_skcipher_encrypt;
+		skcipher_inst->alg.decrypt	= essiv_skcipher_decrypt;
+		skcipher_inst->alg.init		= essiv_skcipher_init_tfm;
+		skcipher_inst->alg.exit		= essiv_skcipher_exit_tfm;
+
+		skcipher_inst->alg.min_keysize	= crypto_skcipher_alg_min_keysize(skcipher_alg);
+		skcipher_inst->alg.max_keysize	= crypto_skcipher_alg_max_keysize(skcipher_alg);
+		skcipher_inst->alg.ivsize	= ESSIV_IV_SIZE;
+		skcipher_inst->alg.chunksize	= skcipher_alg->chunksize;
+		skcipher_inst->alg.walksize	= skcipher_alg->walksize;
+
+		skcipher_inst->free		= essiv_skcipher_free_instance;
+
+		err = skcipher_register_instance(tmpl, skcipher_inst);
+	} else {
+		aead_inst->alg.setkey		= essiv_aead_setkey;
+		aead_inst->alg.setauthsize	= essiv_aead_setauthsize;
+		aead_inst->alg.encrypt		= essiv_aead_encrypt;
+		aead_inst->alg.decrypt		= essiv_aead_decrypt;
+		aead_inst->alg.init		= essiv_aead_init_tfm;
+		aead_inst->alg.exit		= essiv_aead_exit_tfm;
+
+		aead_inst->alg.ivsize		= ESSIV_IV_SIZE;
+		aead_inst->alg.maxauthsize	= aead_alg->maxauthsize;
+		aead_inst->alg.chunksize	= aead_alg->chunksize;
+
+		aead_inst->free			= essiv_aead_free_instance;
+
+		err = aead_register_instance(tmpl, aead_inst);
+	}
+
+	if (err)
+		goto out_drop_hash;
+
+	crypto_mod_put(_hash_alg);
+	return 0;
+
+out_drop_hash:
+	crypto_drop_shash(&ictx->hash_spawn);
+out_put_hash:
+	crypto_mod_put(_hash_alg);
+out_drop_essiv_cipher:
+	crypto_drop_spawn(&ictx->essiv_cipher_spawn);
+out_drop_skcipher:
+	if (type == CRYPTO_ALG_TYPE_BLKCIPHER)
+		crypto_drop_skcipher(&ictx->u.skcipher_spawn);
+	else
+		crypto_drop_aead(&ictx->u.aead_spawn);
+out_free_inst:
+	kfree(skcipher_inst);
+	kfree(aead_inst);
+	return err;
+}
+
+/* essiv(inner_cipher_name, essiv_cipher_name, shash_name) */
+static struct crypto_template essiv_tmpl = {
+	.name	= "essiv",
+	.create	= essiv_create,
+	.module	= THIS_MODULE,
+};
+
+static int __init essiv_module_init(void)
+{
+	return crypto_register_template(&essiv_tmpl);
+}
+
+static void __exit essiv_module_exit(void)
+{
+	crypto_unregister_template(&essiv_tmpl);
+}
+
+subsys_initcall(essiv_module_init);
+module_exit(essiv_module_exit);
+
+MODULE_DESCRIPTION("ESSIV skcipher/aead wrapper for block encryption");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS_CRYPTO("essiv");
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
