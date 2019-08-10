Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CF88A63
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 11:41:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1507B30BC58E;
	Sat, 10 Aug 2019 09:41:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 958CC6CE4A;
	Sat, 10 Aug 2019 09:41:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DA2118005B9;
	Sat, 10 Aug 2019 09:41:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7A9fOQw009367 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 05:41:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6B0560F9F; Sat, 10 Aug 2019 09:41:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D089160C5D
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 09:41:22 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F7D530C01A3
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 09:41:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so100384789wrm.1
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=56ampqLUPOTSSPtRfg1LVltpdcwpm+t0SppiwG6MdWQ=;
	b=GtQ0dmnE804VqZHh5jpqC+lwABILW62Bwd4q22wI4C3aSaKdw2ws7yrXbO6G0U/yZv
	x3TFCyyz9CYCbp4twTvNVOa4W1BIsQFUts+5gFOCfeXCWRe1HsgfR5O9akciY6JvV2QK
	0pg0aeAr4UwOPx1u9zop17esAVjs7v5TEBz7piU3Ch8cg/RUKelMiMVyDpPanAuBzDup
	BMDQIo0N9LJiSZNq+8yKaiWbFUgKcw2EH7rOF+NdF0+8eoRNacK+THiPPDSn/jLefKwK
	6wO+RyJKqjtrXoDJsnCaeWZyjLqOUVkpG7q8FtjpUgWIJEFfACT6jRylagcTKshsuDB9
	CyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=56ampqLUPOTSSPtRfg1LVltpdcwpm+t0SppiwG6MdWQ=;
	b=CzfvxgEnGnClMwqX9nuA2NaBuia9OSIAYEzcJWr8ygE88AFyXQxbhnCDVw8YXSbBjO
	CqfOfH7IA9HgToMMstgmNUvoNtQ7Jq1u3qmiiaXWPJfUJiRgxfeC1mwvRcbWXEpvFJHA
	yrPd0jbcTWG7CCi05TyCAAZkfSJSxo34KW8nzHcAlgLNZ/qlbx+eco4uTr7LVIMDRHfz
	XS2oS5yXk4vGVH3cW9gnMstS6CSul5XeMNZPu47dkiBgz+533e9cRVZFXD8mhBxydVNI
	yDLw6naow1URUirXkXjYrlgQf/tG10LvF4kjrFLz5T+ZwU5IHykbnl8mSJ1w+W9XumWQ
	DQuw==
X-Gm-Message-State: APjAAAWQ7abhif5W7he3zB4YAeGnHTVYVCbbX6h36/vI7bIxhUZE8fs9
	RY+KFQNUTpd+9k01sLIvOp7DZg==
X-Google-Smtp-Source: APXvYqx8TarR2E/w3YsFQlNhncO6vBQ+Oh1CHshUY/lRklCURgAr7QGQ8rJZTO1J5S3gYPIG7JIT1Q==
X-Received: by 2002:adf:db09:: with SMTP id s9mr1282160wri.214.1565430079837; 
	Sat, 10 Aug 2019 02:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id n16sm519883wmk.12.2019.08.10.02.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Aug 2019 02:41:19 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Sat, 10 Aug 2019 12:40:49 +0300
Message-Id: <20190810094053.7423-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 10 Aug 2019 09:41:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 10 Aug 2019 09:41:21 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v9 3/7] md: dm-crypt: switch to ESSIV crypto API
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 10 Aug 2019 09:41:40 +0000 (UTC)

Replace the explicit ESSIV handling in the dm-crypt driver with calls
into the crypto API, which now possesses the capability to perform
this processing within the crypto subsystem.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/Kconfig    |   1 +
 drivers/md/dm-crypt.c | 194 ++++----------------
 2 files changed, 33 insertions(+), 162 deletions(-)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 3834332f4963..b727e8f15264 100644
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
index 48cd76c88d77..d3f2634f41a8 100644
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
@@ -324,157 +316,15 @@ static int crypt_iv_plain64be_gen(struct crypt_config *cc, u8 *iv,
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
 static int crypt_iv_essiv_gen(struct crypt_config *cc, u8 *iv,
 			      struct dm_crypt_request *dmreq)
 {
-	struct crypto_cipher *essiv_tfm = cc->iv_private;
-
+	/*
+	 * ESSIV encryption of the IV is now handled by the crypto API,
+	 * so just pass the plain sector number here.
+	 */
 	memset(iv, 0, cc->iv_size);
 	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector);
-	crypto_cipher_encrypt_one(essiv_tfm, iv, iv);
 
 	return 0;
 }
@@ -898,10 +748,6 @@ static const struct crypt_iv_operations crypt_iv_plain64be_ops = {
 };
 
 static const struct crypt_iv_operations crypt_iv_essiv_ops = {
-	.ctr       = crypt_iv_essiv_ctr,
-	.dtr       = crypt_iv_essiv_dtr,
-	.init      = crypt_iv_essiv_init,
-	.wipe      = crypt_iv_essiv_wipe,
 	.generator = crypt_iv_essiv_gen
 };
 
@@ -2464,7 +2310,7 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 				char **ivmode, char **ivopts)
 {
 	struct crypt_config *cc = ti->private;
-	char *tmp, *cipher_api;
+	char *tmp, *cipher_api, buf[CRYPTO_MAX_ALG_NAME];
 	int ret = -EINVAL;
 
 	cc->tfms_count = 1;
@@ -2493,6 +2339,20 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 	if (*ivmode && !strcmp(*ivmode, "lmk"))
 		cc->tfms_count = 64;
 
+	if (*ivmode && !strcmp(*ivmode, "essiv")) {
+		if (!*ivopts) {
+			ti->error = "Digest algorithm missing for ESSIV mode";
+			return -EINVAL;
+		}
+		ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s)",
+			       cipher_api, *ivopts);
+		if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
+			ti->error = "Cannot allocate cipher string";
+			return -ENOMEM;
+		}
+		cipher_api = buf;
+	}
+
 	cc->key_parts = cc->tfms_count;
 
 	/* Allocate cipher */
@@ -2579,9 +2439,19 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
 	if (!cipher_api)
 		goto bad_mem;
 
-	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
-		       "%s(%s)", chainmode, cipher);
-	if (ret < 0) {
+	if (*ivmode && !strcmp(*ivmode, "essiv")) {
+		if (!*ivopts) {
+			ti->error = "Digest algorithm missing for ESSIV mode";
+			kfree(cipher_api);
+			return -EINVAL;
+		}
+		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
+			       "essiv(%s(%s),%s)", chainmode, cipher, *ivopts);
+	} else {
+		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
+			       "%s(%s)", chainmode, cipher);
+	}
+	if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
 		kfree(cipher_api);
 		goto bad_mem;
 	}
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
