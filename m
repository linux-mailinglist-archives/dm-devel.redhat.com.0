Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A18F498
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 21:29:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 160D086662;
	Thu, 15 Aug 2019 19:29:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB38BABF;
	Thu, 15 Aug 2019 19:29:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26FFC180B536;
	Thu, 15 Aug 2019 19:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FJTO4P018959 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 15:29:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DD83171EA; Thu, 15 Aug 2019 19:29:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4605F171E5
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 19:29:19 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7CEC85541
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 19:29:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t16so3194473wra.6
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E9ab7vjs0VuhUjsbpNJ/6ViwvtsqaUBIlx/v5SgzSk0=;
	b=s6nqR7OoAmiJhBsAx+GKhMx/kiCfn4Cdgx9d9WafN+DaHkrXSed/kVqklMgObuwsIb
	GzbJqeoYXI9dI4CaIoeO6jUhoFO0XOtyzATQtLD5QBaIr4Kv5f34LtagvyByBQga6cRm
	QcXMctcK2gEE8jYb9XwYWaVV/krZ7yGVfFmj9qjNwHWigkiZ8TbCLY8K/cc/h7Z5Epti
	qf8G5v/PpF8FdiCotkMgy45Pqp4E9x/sLdp9R2cC9+7IjoLz+dmMTaRxmNM/KeCtvZOa
	nxg7SHUAv8wGucp09ogU4iziWZdOdNurLuTbwYFR3vk/vszgFJ7DfAmvg+LzfOe10RVL
	BLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E9ab7vjs0VuhUjsbpNJ/6ViwvtsqaUBIlx/v5SgzSk0=;
	b=DJGLE4hJogrAqdsFmKcVnr4b3iIC1TV2zzgNb+Sal6tq4q7mDO21/sjxXCPuNYMg2B
	uG3C9rEdTIfgQ5RPIRZLFVxARwuzqxGYQEb7ZY6+v/ZTRH7+2aUNpt6JFQhEi/nqOFO0
	trpNDyajWjz9+nBmPCCtvesRqpL5K9xn1vCAjUptUbEgf7NRhOHl4OYmsWKkdOUZ8jKg
	hkpzlSCBhLeFvaNE9IpsozhCILzvkRIYqLBv+eP0F9GmWFyZ7f0JY+e9zBuFD9nD75U2
	tkHCH6u6mu2fsnt7Yhxjx46NKAQvl6zomgpFEkZQDvPibhpX8P/gNdyQXVWP82LoZwDW
	Q2GA==
X-Gm-Message-State: APjAAAVqrx8gSBPBqvVmLnkCFH9Sn1InbYNMRZboecmUq/hK7JLZ7DGV
	drJAOKHpax1he3dxVI/P8S+PdQ==
X-Google-Smtp-Source: APXvYqzpXssRWAaH+flAqYpffBi3hVtL3k3eb8hCLKcYxumgplqcEecAAT6xFvOZgrQmxAeSJwUUcw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr6965991wrm.282.1565897355261; 
	Thu, 15 Aug 2019 12:29:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:f1b5:e68c:5f7f:79e7])
	by smtp.gmail.com with ESMTPSA id h9sm2949063wrt.53.2019.08.15.12.29.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 12:29:14 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Thu, 15 Aug 2019 22:28:55 +0300
Message-Id: <20190815192858.28125-2-ard.biesheuvel@linaro.org>
In-Reply-To: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 19:29:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 19:29:18 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.28  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v12 1/4] crypto: essiv - create wrapper template
	for ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 15 Aug 2019 19:29:55 +0000 (UTC)

Implement a template that wraps a (skcipher,shash) or (aead,shash) tuple
so that we can consolidate the ESSIV handling in fscrypt and dm-crypt and
move it into the crypto API. This will result in better test coverage, and
will allow future changes to make the bare cipher interface internal to the
crypto subsystem, in order to increase robustness of the API against misuse.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 crypto/Kconfig  |  28 +
 crypto/Makefile |   1 +
 crypto/essiv.c  | 645 ++++++++++++++++++++
 3 files changed, 674 insertions(+)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 455a3354e291..01f81c1f3138 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -487,6 +487,34 @@ config CRYPTO_ADIANTUM
 
 	  If unsure, say N.
 
+config CRYPTO_ESSIV
+	tristate "ESSIV support for block encryption"
+	select CRYPTO_AUTHENC
+	help
+	  Encrypted salt-sector initialization vector (ESSIV) is an IV
+	  generation method that is used in some cases by fscrypt and/or
+	  dm-crypt. It uses the hash of the block encryption key as the
+	  symmetric key for a block encryption pass applied to the input
+	  IV, making low entropy IV sources more suitable for block
+	  encryption.
+
+	  This driver implements a crypto API template that can be
+	  instantiated either as a skcipher or as a aead (depending on the
+	  type of the first template argument), and which defers encryption
+	  and decryption requests to the encapsulated cipher after applying
+	  ESSIV to the input IV. Note that in the aead case, it is assumed
+	  that the keys are presented in the same format used by the authenc
+	  template, and that the IV appears at the end of the authenticated
+	  associated data (AAD) region (which is how dm-crypt uses it.)
+
+	  Note that the use of ESSIV is not recommended for new deployments,
+	  and so this only needs to be enabled when interoperability with
+	  existing encrypted volumes of filesystems is required, or when
+	  building for a particular system that requires it (e.g., when
+	  the SoC in question has accelerated CBC but not XTS, making CBC
+	  combined with ESSIV the only feasible mode for h/w accelerated
+	  block encryption)
+
 comment "Hash modes"
 
 config CRYPTO_CMAC
diff --git a/crypto/Makefile b/crypto/Makefile
index 0d2cdd523fd9..fcb1ee679782 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
 obj-$(CONFIG_CRYPTO_OFB) += ofb.o
 obj-$(CONFIG_CRYPTO_ECC) += ecc.o
+obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
diff --git a/crypto/essiv.c b/crypto/essiv.c
new file mode 100644
index 000000000000..38b18907ce25
--- /dev/null
+++ b/crypto/essiv.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ESSIV skcipher and aead template for block encryption
+ *
+ * This template encapsulates the ESSIV IV generation algorithm used by
+ * dm-crypt and fscrypt, which converts the initial vector for the skcipher
+ * used for block encryption, by encrypting it using the hash of the
+ * skcipher key as encryption key. Usually, the input IV is a 64-bit sector
+ * number in LE representation zero-padded to the size of the IV, but this
+ * is not assumed by this driver.
+ *
+ * The typical use of this template is to instantiate the skcipher
+ * 'essiv(cbc(aes),sha256)', which is the only instantiation used by
+ * fscrypt, and the most relevant one for dm-crypt. However, dm-crypt
+ * also permits ESSIV to be used in combination with the authenc template,
+ * e.g., 'essiv(authenc(hmac(sha256),cbc(aes)),sha256)', in which case
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
+struct essiv_instance_ctx {
+	union {
+		struct crypto_skcipher_spawn	skcipher_spawn;
+		struct crypto_aead_spawn	aead_spawn;
+	} u;
+	char				essiv_cipher_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_shash		*hash;
+};
+
+struct essiv_tfm_ctx {
+	union {
+		struct crypto_skcipher	*skcipher;
+		struct crypto_aead	*aead;
+	} u;
+	struct crypto_cipher		*essiv_cipher;
+	int				ivoffset;
+};
+
+struct essiv_aead_request_ctx {
+	struct scatterlist		sg[4];
+	u8				*assoc;
+	struct aead_request		aead_req;
+};
+
+static int essiv_skcipher_setkey(struct crypto_skcipher *tfm,
+				 const u8 *key, unsigned int keylen)
+{
+	struct skcipher_instance *inst = skcipher_alg_instance(tfm);
+	struct essiv_instance_ctx *ictx = skcipher_instance_ctx(inst);
+	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	SHASH_DESC_ON_STACK(desc, ictx->hash);
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
+	desc->tfm = ictx->hash;
+	err = crypto_shash_digest(desc, key, keylen, salt);
+	if (err)
+		return err;
+
+	crypto_cipher_clear_flags(tctx->essiv_cipher, CRYPTO_TFM_REQ_MASK);
+	crypto_cipher_set_flags(tctx->essiv_cipher,
+				crypto_skcipher_get_flags(tfm) &
+				CRYPTO_TFM_REQ_MASK);
+	err = crypto_cipher_setkey(tctx->essiv_cipher, salt,
+				   crypto_shash_digestsize(ictx->hash));
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
+	struct aead_instance *inst = aead_alg_instance(tfm);
+	struct essiv_instance_ctx *ictx = aead_instance_ctx(inst);
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+	SHASH_DESC_ON_STACK(desc, ictx->hash);
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
+	desc->tfm = ictx->hash;
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
+				   crypto_shash_digestsize(ictx->hash));
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
+static int essiv_skcipher_crypt(struct skcipher_request *req, bool enc)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	struct skcipher_request *subreq = skcipher_request_ctx(req);
+
+	crypto_cipher_encrypt_one(tctx->essiv_cipher, req->iv, req->iv);
+
+	skcipher_request_set_tfm(subreq, tctx->u.skcipher);
+	skcipher_request_set_crypt(subreq, req->src, req->dst, req->cryptlen,
+				   req->iv);
+	skcipher_request_set_callback(subreq, skcipher_request_flags(req),
+				      essiv_skcipher_done, req);
+
+	return enc ? crypto_skcipher_encrypt(subreq) :
+		     crypto_skcipher_decrypt(subreq);
+}
+
+static int essiv_skcipher_encrypt(struct skcipher_request *req)
+{
+	return essiv_skcipher_crypt(req, true);
+}
+
+static int essiv_skcipher_decrypt(struct skcipher_request *req)
+{
+	return essiv_skcipher_crypt(req, false);
+}
+
+static void essiv_aead_done(struct crypto_async_request *areq, int err)
+{
+	struct aead_request *req = areq->data;
+	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
+
+	if (rctx->assoc)
+		kfree(rctx->assoc);
+	aead_request_complete(req, err);
+}
+
+static int essiv_aead_crypt(struct aead_request *req, bool enc)
+{
+	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
+	const struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+	struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
+	struct aead_request *subreq = &rctx->aead_req;
+	struct scatterlist *src = req->src;
+	int err;
+
+	crypto_cipher_encrypt_one(tctx->essiv_cipher, req->iv, req->iv);
+
+	/*
+	 * dm-crypt embeds the sector number and the IV in the AAD region, so
+	 * we have to copy the converted IV into the right scatterlist before
+	 * we pass it on.
+	 */
+	rctx->assoc = NULL;
+	if (req->src == req->dst || !enc) {
+		scatterwalk_map_and_copy(req->iv, req->dst,
+					 req->assoclen - crypto_aead_ivsize(tfm),
+					 crypto_aead_ivsize(tfm), 1);
+	} else {
+		u8 *iv = (u8 *)aead_request_ctx(req) + tctx->ivoffset;
+		int ivsize = crypto_aead_ivsize(tfm);
+		int ssize = req->assoclen - ivsize;
+		struct scatterlist *sg;
+		int nents;
+
+		if (ssize < 0)
+			return -EINVAL;
+
+		nents = sg_nents_for_len(req->src, ssize);
+		if (nents < 0)
+			return -EINVAL;
+
+		memcpy(iv, req->iv, ivsize);
+		sg_init_table(rctx->sg, 4);
+
+		if (unlikely(nents > 1)) {
+			/*
+			 * This is a case that rarely occurs in practice, but
+			 * for correctness, we have to deal with it nonetheless.
+			 */
+			rctx->assoc = kmalloc(ssize, GFP_ATOMIC);
+			if (!rctx->assoc)
+				return -ENOMEM;
+
+			scatterwalk_map_and_copy(rctx->assoc, req->src, 0,
+						 ssize, 0);
+			sg_set_buf(rctx->sg, rctx->assoc, ssize);
+		} else {
+			sg_set_page(rctx->sg, sg_page(req->src), ssize,
+				    req->src->offset);
+		}
+
+		sg_set_buf(rctx->sg + 1, iv, ivsize);
+		sg = scatterwalk_ffwd(rctx->sg + 2, req->src, req->assoclen);
+		if (sg != rctx->sg + 2)
+			sg_chain(rctx->sg, 3, sg);
+
+		src = rctx->sg;
+	}
+
+	aead_request_set_tfm(subreq, tctx->u.aead);
+	aead_request_set_ad(subreq, req->assoclen);
+	aead_request_set_callback(subreq, aead_request_flags(req),
+				  essiv_aead_done, req);
+	aead_request_set_crypt(subreq, src, req->dst, req->cryptlen, req->iv);
+
+	err = enc ? crypto_aead_encrypt(subreq) :
+		    crypto_aead_decrypt(subreq);
+
+	if (rctx->assoc && err != -EINPROGRESS)
+		kfree(rctx->assoc);
+	return err;
+}
+
+static int essiv_aead_encrypt(struct aead_request *req)
+{
+	return essiv_aead_crypt(req, true);
+}
+
+static int essiv_aead_decrypt(struct aead_request *req)
+{
+	return essiv_aead_crypt(req, false);
+}
+
+static int essiv_init_tfm(struct essiv_instance_ctx *ictx,
+			  struct essiv_tfm_ctx *tctx)
+{
+	struct crypto_cipher *essiv_cipher;
+
+	essiv_cipher = crypto_alloc_cipher(ictx->essiv_cipher_name, 0, 0);
+	if (IS_ERR(essiv_cipher))
+		return PTR_ERR(essiv_cipher);
+
+	tctx->essiv_cipher = essiv_cipher;
+
+	return 0;
+}
+
+static int essiv_skcipher_init_tfm(struct crypto_skcipher *tfm)
+{
+	struct skcipher_instance *inst = skcipher_alg_instance(tfm);
+	struct essiv_instance_ctx *ictx = skcipher_instance_ctx(inst);
+	struct essiv_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
+	struct crypto_skcipher *skcipher;
+	int err;
+
+	skcipher = crypto_spawn_skcipher(&ictx->u.skcipher_spawn);
+	if (IS_ERR(skcipher))
+		return PTR_ERR(skcipher);
+
+	crypto_skcipher_set_reqsize(tfm, sizeof(struct skcipher_request) +
+				         crypto_skcipher_reqsize(skcipher));
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
+	tctx->ivoffset = offsetof(struct essiv_aead_request_ctx, aead_req) +
+			 subreq_size;
+	crypto_aead_set_reqsize(tfm, tctx->ivoffset + crypto_aead_ivsize(aead));
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
+}
+
+static void essiv_aead_exit_tfm(struct crypto_aead *tfm)
+{
+	struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
+
+	crypto_free_aead(tctx->u.aead);
+	crypto_free_cipher(tctx->essiv_cipher);
+}
+
+static void essiv_skcipher_free_instance(struct skcipher_instance *inst)
+{
+	struct essiv_instance_ctx *ictx = skcipher_instance_ctx(inst);
+
+	crypto_drop_skcipher(&ictx->u.skcipher_spawn);
+	crypto_free_shash(ictx->hash);
+	kfree(inst);
+}
+
+static void essiv_aead_free_instance(struct aead_instance *inst)
+{
+	struct essiv_instance_ctx *ictx = aead_instance_ctx(inst);
+
+	crypto_drop_aead(&ictx->u.aead_spawn);
+	crypto_free_shash(ictx->hash);
+	kfree(inst);
+}
+
+static bool parse_cipher_name(char *essiv_cipher_name, const char *cra_name)
+{
+	const char *p, *q;
+	int len;
+
+	/* find the last opening parens */
+	p = strrchr(cra_name, '(');
+	if (!p++)
+		return false;
+
+	/* find the first closing parens in the tail of the string */
+	q = strchr(p, ')');
+	if (!q)
+		return false;
+
+	len = q - p;
+	if (len >= CRYPTO_MAX_ALG_NAME)
+		return false;
+
+	memcpy(essiv_cipher_name, p, len);
+	essiv_cipher_name[len] = '\0';
+	return true;
+}
+
+static bool essiv_supported_algorithms(const char *essiv_cipher_name,
+				       struct shash_alg *hash_alg,
+				       int ivsize)
+{
+	struct crypto_alg *alg;
+	bool ret = false;
+
+	alg = crypto_alg_mod_lookup(essiv_cipher_name,
+				    CRYPTO_ALG_TYPE_CIPHER,
+				    CRYPTO_ALG_TYPE_MASK);
+	if (IS_ERR(alg))
+		return false;
+
+	if (hash_alg->digestsize < alg->cra_cipher.cia_min_keysize ||
+	    hash_alg->digestsize > alg->cra_cipher.cia_max_keysize)
+		goto out;
+
+	if (ivsize != alg->cra_blocksize)
+		goto out;
+
+	if (crypto_shash_alg_has_setkey(hash_alg))
+		goto out;
+
+	ret = true;
+
+out:
+	crypto_mod_put(alg);
+	return ret;
+}
+
+static int essiv_create(struct crypto_template *tmpl, struct rtattr **tb)
+{
+	struct crypto_attr_type *algt;
+	const char *inner_cipher_name;
+	const char *shash_name;
+	struct skcipher_instance *skcipher_inst = NULL;
+	struct aead_instance *aead_inst = NULL;
+	struct crypto_instance *inst;
+	struct crypto_alg *base, *block_base;
+	struct essiv_instance_ctx *ictx;
+	struct skcipher_alg *skcipher_alg = NULL;
+	struct aead_alg *aead_alg = NULL;
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
+	shash_name = crypto_attr_alg_name(tb[2]);
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
+		/* Symmetric cipher, e.g., "cbc(aes)" */
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
+		/* AEAD cipher, e.g., "authenc(hmac(sha256),cbc(aes))" */
+		crypto_set_aead_spawn(&ictx->u.aead_spawn, inst);
+		err = crypto_grab_aead(&ictx->u.aead_spawn,
+				       inner_cipher_name, 0,
+				       crypto_requires_sync(algt->type,
+							    algt->mask));
+		if (err)
+			goto out_free_inst;
+		aead_alg = crypto_spawn_aead_alg(&ictx->u.aead_spawn);
+		block_base = &aead_alg->base;
+		if (!strstarts(block_base->cra_name, "authenc(")) {
+			pr_warn("Only authenc() type AEADs are supported by ESSIV\n");
+			err = -EINVAL;
+			goto out_drop_skcipher;
+		}
+		ivsize = aead_alg->ivsize;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (!parse_cipher_name(ictx->essiv_cipher_name, block_base->cra_name)) {
+		pr_warn("Failed to parse ESSIV cipher name from skcipher cra_name\n");
+		err = -EINVAL;
+		goto out_drop_skcipher;
+	}
+
+	/* Synchronous hash, e.g., "sha256" */
+	ictx->hash = crypto_alloc_shash(shash_name, 0, 0);
+	if (IS_ERR(ictx->hash)) {
+		err = PTR_ERR(ictx->hash);
+		goto out_drop_skcipher;
+	}
+	hash_alg = crypto_shash_alg(ictx->hash);
+
+	/* Check the set of algorithms */
+	if (!essiv_supported_algorithms(ictx->essiv_cipher_name, hash_alg,
+					ivsize)) {
+		pr_warn("Unsupported essiv instantiation: essiv(%s,%s)\n",
+			block_base->cra_name, hash_alg->base.cra_name);
+		err = -EINVAL;
+		goto out_free_hash;
+	}
+
+	/* Instance fields */
+
+	err = -ENAMETOOLONG;
+	if (snprintf(base->cra_name, CRYPTO_MAX_ALG_NAME,
+		     "essiv(%s,%s)", block_base->cra_name,
+		     hash_alg->base.cra_name) >= CRYPTO_MAX_ALG_NAME)
+		goto out_free_hash;
+	if (snprintf(base->cra_driver_name, CRYPTO_MAX_ALG_NAME,
+		     "essiv(%s,%s)", block_base->cra_driver_name,
+		     hash_alg->base.cra_driver_name) >= CRYPTO_MAX_ALG_NAME)
+		goto out_free_hash;
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
+		skcipher_inst->alg.ivsize	= ivsize;
+		skcipher_inst->alg.chunksize	= crypto_skcipher_alg_chunksize(skcipher_alg);
+		skcipher_inst->alg.walksize	= crypto_skcipher_alg_walksize(skcipher_alg);
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
+		aead_inst->alg.ivsize		= ivsize;
+		aead_inst->alg.maxauthsize	= crypto_aead_alg_maxauthsize(aead_alg);
+		aead_inst->alg.chunksize	= crypto_aead_alg_chunksize(aead_alg);
+
+		aead_inst->free			= essiv_aead_free_instance;
+
+		err = aead_register_instance(tmpl, aead_inst);
+	}
+
+	if (err)
+		goto out_free_hash;
+
+	return 0;
+
+out_free_hash:
+	crypto_free_shash(ictx->hash);
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
+/* essiv(cipher_name, shash_name) */
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
