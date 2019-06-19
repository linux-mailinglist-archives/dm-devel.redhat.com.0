Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D24BE43
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 18:31:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD2572EED28;
	Wed, 19 Jun 2019 16:31:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1895D9C6;
	Wed, 19 Jun 2019 16:31:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6876F1806B16;
	Wed, 19 Jun 2019 16:30:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JGTsPf016563 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 12:29:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60BC65C21E; Wed, 19 Jun 2019 16:29:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 599C55C207
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 16:29:53 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CC4130C1AD7
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 16:29:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so4109279wrv.2
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kjpyG4QSb7CCwwRX38tZpZKMpAm3I4YnPSinMK6X+JQ=;
	b=WBlxCuru3l09JniQ555phaoU/Ac27NuiCr4iJJpalhGoY+S24ONpBqW/aVgLV9U4OJ
	e3Q2zhj6J77G0D5nnIsOeK4jpC6pqjkBI4lQpaLl+XwhCxXB8opEffXdQCZ0FdivzS/F
	foUNvizxcGeZ9cVUVZv8rssO9DRqdtxlxDh7i3hCQtYygWYZcz3DkIQvAYZs5gnxwvfF
	5bg6euYMuAoduxiIUgC7v0cJ7tmGjE6D6kvWK4Qs1upZJHLu4KfpdxTg77BXrDVWZWcH
	tACmn2b9mloV65e1RN+yfe0ggysKB95LMgwZijceFiIatnwzfzc82Bq4WTSpYfel9t9q
	gDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kjpyG4QSb7CCwwRX38tZpZKMpAm3I4YnPSinMK6X+JQ=;
	b=hzWLTZE0aQ0M7M1mQ5ESThTKEIgH/iDA6FbVBIfUBSGgSGLPLEcLwKpdmFTa0Lyk9l
	YCnciQdpt5le8xPuLvp8WVsdsSEuz/Qq8x3K8kz6FPViQrYJGWBYAFdGhcfrLDqD3QDS
	XAfuHOEiBr3+YpYWGlpOi5KJybQcPA1IL1QI5XwpEmUPfDVOxBa3++fE3ogMKn5JstgN
	BQqlJrOXQYmiafNk/JLWD/fd/UuvMVXxU5+5rHXnI+aXDK6mALRRRaiZWz1fZCCBDlh/
	j4TPYuTJVh/3eMO+PsTvfufPmwShRUbeT5UY7gjqgxAQTcZ149ovxmISS3udPS7PCcxC
	if8w==
X-Gm-Message-State: APjAAAWXhNY/JJe5sxLSei0hNKqpx7MdMqme3gwt8LOah9ikGRYEHjmb
	gMQ5x8NzrXVsSchdqQYl8ZUvZQ==
X-Google-Smtp-Source: APXvYqxzH55oTiSWBn4l0mJ7xRpS8KZ5rvpVEiI2ZjCtkMfIdcTUKBs2yCTIPs7+TgK+4mOq9c5aCQ==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr37939284wrs.146.1560961781854; 
	Wed, 19 Jun 2019 09:29:41 -0700 (PDT)
Received: from localhost.localdomain
	(laubervilliers-657-1-83-120.w92-154.abo.wanadoo.fr. [92.154.90.120])
	by smtp.gmail.com with ESMTPSA id
	32sm37815960wra.35.2019.06.19.09.29.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 09:29:41 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 19 Jun 2019 18:29:19 +0200
Message-Id: <20190619162921.12509-5-ard.biesheuvel@linaro.org>
In-Reply-To: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 19 Jun 2019 16:29:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 19 Jun 2019 16:29:43 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v3 4/6] md: dm-crypt: switch to ESSIV crypto API
	template
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 16:31:42 +0000 (UTC)

Replace the explicit ESSIV handling in the dm-crypt driver with calls
into the crypto API, which now possesses the capability to perform
this processing within the crypto subsystem.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/Kconfig    |   1 +
 drivers/md/dm-crypt.c | 208 +++-----------------
 2 files changed, 31 insertions(+), 178 deletions(-)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 45254b3ef715..30ca87cf25db 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -271,6 +271,7 @@ config DM_CRYPT
 	depends on BLK_DEV_DM
 	select CRYPTO
 	select CRYPTO_CBC
+	select CRYPTO_ESSIV
 	---help---
 	  This device-mapper target allows you to create a device that
 	  transparently encrypts the data on it. You'll need to activate
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index f001f1104cb5..12d28880ec34 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -98,11 +98,6 @@ struct crypt_iv_operations {
 		    struct dm_crypt_request *dmreq);
 };
 
-struct iv_essiv_private {
-	struct crypto_shash *hash_tfm;
-	u8 *salt;
-};
-
 struct iv_benbi_private {
 	int shift;
 };
@@ -155,7 +150,6 @@ struct crypt_config {
 
 	const struct crypt_iv_operations *iv_gen_ops;
 	union {
-		struct iv_essiv_private essiv;
 		struct iv_benbi_private benbi;
 		struct iv_lmk_private lmk;
 		struct iv_tcw_private tcw;
@@ -165,8 +159,6 @@ struct crypt_config {
 	unsigned short int sector_size;
 	unsigned char sector_shift;
 
-	/* ESSIV: struct crypto_cipher *essiv_tfm */
-	void *iv_private;
 	union {
 		struct crypto_skcipher **tfms;
 		struct crypto_aead **tfms_aead;
@@ -323,161 +315,6 @@ static int crypt_iv_plain64be_gen(struct crypt_config *cc, u8 *iv,
 	return 0;
 }
 
-/* Initialise ESSIV - compute salt but no local memory allocations */
-static int crypt_iv_essiv_init(struct crypt_config *cc)
-{
-	struct iv_essiv_private *essiv = &cc->iv_gen_private.essiv;
-	SHASH_DESC_ON_STACK(desc, essiv->hash_tfm);
-	struct crypto_cipher *essiv_tfm;
-	int err;
-
-	desc->tfm = essiv->hash_tfm;
-
-	err = crypto_shash_digest(desc, cc->key, cc->key_size, essiv->salt);
-	shash_desc_zero(desc);
-	if (err)
-		return err;
-
-	essiv_tfm = cc->iv_private;
-
-	err = crypto_cipher_setkey(essiv_tfm, essiv->salt,
-			    crypto_shash_digestsize(essiv->hash_tfm));
-	if (err)
-		return err;
-
-	return 0;
-}
-
-/* Wipe salt and reset key derived from volume key */
-static int crypt_iv_essiv_wipe(struct crypt_config *cc)
-{
-	struct iv_essiv_private *essiv = &cc->iv_gen_private.essiv;
-	unsigned salt_size = crypto_shash_digestsize(essiv->hash_tfm);
-	struct crypto_cipher *essiv_tfm;
-	int r, err = 0;
-
-	memset(essiv->salt, 0, salt_size);
-
-	essiv_tfm = cc->iv_private;
-	r = crypto_cipher_setkey(essiv_tfm, essiv->salt, salt_size);
-	if (r)
-		err = r;
-
-	return err;
-}
-
-/* Allocate the cipher for ESSIV */
-static struct crypto_cipher *alloc_essiv_cipher(struct crypt_config *cc,
-						struct dm_target *ti,
-						const u8 *salt,
-						unsigned int saltsize)
-{
-	struct crypto_cipher *essiv_tfm;
-	int err;
-
-	/* Setup the essiv_tfm with the given salt */
-	essiv_tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
-	if (IS_ERR(essiv_tfm)) {
-		ti->error = "Error allocating crypto tfm for ESSIV";
-		return essiv_tfm;
-	}
-
-	if (crypto_cipher_blocksize(essiv_tfm) != cc->iv_size) {
-		ti->error = "Block size of ESSIV cipher does "
-			    "not match IV size of block cipher";
-		crypto_free_cipher(essiv_tfm);
-		return ERR_PTR(-EINVAL);
-	}
-
-	err = crypto_cipher_setkey(essiv_tfm, salt, saltsize);
-	if (err) {
-		ti->error = "Failed to set key for ESSIV cipher";
-		crypto_free_cipher(essiv_tfm);
-		return ERR_PTR(err);
-	}
-
-	return essiv_tfm;
-}
-
-static void crypt_iv_essiv_dtr(struct crypt_config *cc)
-{
-	struct crypto_cipher *essiv_tfm;
-	struct iv_essiv_private *essiv = &cc->iv_gen_private.essiv;
-
-	crypto_free_shash(essiv->hash_tfm);
-	essiv->hash_tfm = NULL;
-
-	kzfree(essiv->salt);
-	essiv->salt = NULL;
-
-	essiv_tfm = cc->iv_private;
-
-	if (essiv_tfm)
-		crypto_free_cipher(essiv_tfm);
-
-	cc->iv_private = NULL;
-}
-
-static int crypt_iv_essiv_ctr(struct crypt_config *cc, struct dm_target *ti,
-			      const char *opts)
-{
-	struct crypto_cipher *essiv_tfm = NULL;
-	struct crypto_shash *hash_tfm = NULL;
-	u8 *salt = NULL;
-	int err;
-
-	if (!opts) {
-		ti->error = "Digest algorithm missing for ESSIV mode";
-		return -EINVAL;
-	}
-
-	/* Allocate hash algorithm */
-	hash_tfm = crypto_alloc_shash(opts, 0, 0);
-	if (IS_ERR(hash_tfm)) {
-		ti->error = "Error initializing ESSIV hash";
-		err = PTR_ERR(hash_tfm);
-		goto bad;
-	}
-
-	salt = kzalloc(crypto_shash_digestsize(hash_tfm), GFP_KERNEL);
-	if (!salt) {
-		ti->error = "Error kmallocing salt storage in ESSIV";
-		err = -ENOMEM;
-		goto bad;
-	}
-
-	cc->iv_gen_private.essiv.salt = salt;
-	cc->iv_gen_private.essiv.hash_tfm = hash_tfm;
-
-	essiv_tfm = alloc_essiv_cipher(cc, ti, salt,
-				       crypto_shash_digestsize(hash_tfm));
-	if (IS_ERR(essiv_tfm)) {
-		crypt_iv_essiv_dtr(cc);
-		return PTR_ERR(essiv_tfm);
-	}
-	cc->iv_private = essiv_tfm;
-
-	return 0;
-
-bad:
-	if (hash_tfm && !IS_ERR(hash_tfm))
-		crypto_free_shash(hash_tfm);
-	kfree(salt);
-	return err;
-}
-
-static int crypt_iv_essiv_gen(struct crypt_config *cc, u8 *iv,
-			      struct dm_crypt_request *dmreq)
-{
-	struct crypto_cipher *essiv_tfm = cc->iv_private;
-
-	memset(iv, 0, cc->iv_size);
-	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector);
-	crypto_cipher_encrypt_one(essiv_tfm, iv, iv);
-
-	return 0;
-}
-
 static int crypt_iv_benbi_ctr(struct crypt_config *cc, struct dm_target *ti,
 			      const char *opts)
 {
@@ -853,14 +690,6 @@ static const struct crypt_iv_operations crypt_iv_plain64be_ops = {
 	.generator = crypt_iv_plain64be_gen
 };
 
-static const struct crypt_iv_operations crypt_iv_essiv_ops = {
-	.ctr       = crypt_iv_essiv_ctr,
-	.dtr       = crypt_iv_essiv_dtr,
-	.init      = crypt_iv_essiv_init,
-	.wipe      = crypt_iv_essiv_wipe,
-	.generator = crypt_iv_essiv_gen
-};
-
 static const struct crypt_iv_operations crypt_iv_benbi_ops = {
 	.ctr	   = crypt_iv_benbi_ctr,
 	.dtr	   = crypt_iv_benbi_dtr,
@@ -2283,7 +2112,7 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
 	else if (strcmp(ivmode, "plain64be") == 0)
 		cc->iv_gen_ops = &crypt_iv_plain64be_ops;
 	else if (strcmp(ivmode, "essiv") == 0)
-		cc->iv_gen_ops = &crypt_iv_essiv_ops;
+		cc->iv_gen_ops = &crypt_iv_plain64_ops;
 	else if (strcmp(ivmode, "benbi") == 0)
 		cc->iv_gen_ops = &crypt_iv_benbi_ops;
 	else if (strcmp(ivmode, "null") == 0)
@@ -2397,7 +2226,7 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 				char **ivmode, char **ivopts)
 {
 	struct crypt_config *cc = ti->private;
-	char *tmp, *cipher_api;
+	char *tmp, *cipher_api, buf[CRYPTO_MAX_ALG_NAME];
 	int ret = -EINVAL;
 
 	cc->tfms_count = 1;
@@ -2435,9 +2264,19 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 	}
 
 	ret = crypt_ctr_blkdev_cipher(cc, cipher_api);
-	if (ret < 0) {
-		ti->error = "Cannot allocate cipher string";
-		return -ENOMEM;
+	if (ret < 0)
+		goto bad_mem;
+
+	if (*ivmode && !strcmp(*ivmode, "essiv")) {
+		if (!*ivopts) {
+			ti->error = "Digest algorithm missing for ESSIV mode";
+			return -EINVAL;
+		}
+		ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s,%s)",
+			       cipher_api, cc->cipher, *ivopts);
+		if (ret < 0)
+			goto bad_mem;
+		cipher_api = buf;
 	}
 
 	cc->key_parts = cc->tfms_count;
@@ -2456,6 +2295,9 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
 
 	return 0;
+bad_mem:
+	ti->error = "Cannot allocate cipher string";
+	return -ENOMEM;
 }
 
 static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key,
@@ -2515,8 +2357,18 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
 	if (!cipher_api)
 		goto bad_mem;
 
-	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
-		       "%s(%s)", chainmode, cipher);
+	if (*ivmode && !strcmp(*ivmode, "essiv")) {
+		if (!*ivopts) {
+			ti->error = "Digest algorithm missing for ESSIV mode";
+			return -EINVAL;
+		}
+		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
+			       "essiv(%s(%s),%s,%s)", chainmode, cipher,
+			       cipher, *ivopts);
+	} else {
+		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
+			       "%s(%s)", chainmode, cipher);
+	}
 	if (ret < 0) {
 		kfree(cipher_api);
 		goto bad_mem;
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
