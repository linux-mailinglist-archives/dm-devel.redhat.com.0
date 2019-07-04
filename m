Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7375FCFB
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 20:32:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8ACFA3082132;
	Thu,  4 Jul 2019 18:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61B01001B18;
	Thu,  4 Jul 2019 18:31:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31BDC41F66;
	Thu,  4 Jul 2019 18:31:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64IV0ik010317 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 14:31:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B64517184; Thu,  4 Jul 2019 18:31:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 362104D4
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:30:56 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E79307CDEA
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:30:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so7539012wrs.3
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N12ApufgoexL9WzpaPENxsB09Hf/go+8FiAedLdpfCo=;
	b=lm3/qUDBAkFuFnB2hVpM6WBybTS2O72DhYTcx/qbPto7tRXAyg3BQ56NSJbKceneaM
	xA4XkSKXxC8TAB9Zw8W3WQi3G/tcwER0SjIsblDpjJJncIsoyFOzClXiz+P3wYNlAqky
	rvMv+CGuZfY+vPqVUl+vB5khS3j8DJTqGBmPUmRcOR7SyJHE47QBKy7N/cpqteemJYRp
	ziJFFd3pRiR/e42mHqSqxODi4sLk11w2n8qmBQa2oohKfLPIqCAwlCG1aJeJafUW4UW6
	ATpjLHVybsLZo9mZp7mdGmf305ECIBj/fWwjo4b3igyXiayhU7qH2VeTZX3/jFy/KxFS
	F6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N12ApufgoexL9WzpaPENxsB09Hf/go+8FiAedLdpfCo=;
	b=C1GNBLiGYKxp7nB/hF7v5mj9b9B912lp/baT2L4BOjgUq4NDg/t2K8C2G6NaD7YF9a
	6cNf2N/nuxCllUuxwGeFdUoPEnxuKgFZ1J3gr6AZdxBjV4dIhIk1xY//2I00edO1iA3d
	qIxLFQsg6q8oQMoW8PGRhYYq5HLKPTNVO69/ytm4gSbGOEVqDJ0trq0Azn3A9yYhe7UM
	Bhmh8oQSdRN6H8IpeQBj3DGeLOxH4D0xcGAarS3jyiZgPqJBmLFMvDz8eSFDfOeoFt8F
	1lK/AifAj0UzySDH9zzKpA91+UP7jwdl/6gGm71y2aDgFOdWEaqdoFrWivaCUnTAtl3Z
	Gv1Q==
X-Gm-Message-State: APjAAAV1otyoqbhaJE5+VBTbGC/px7NlJdA5yZIM+OXhajgM/AVj2m0+
	uq3pyc7ZrHXsYyrmhZKKwsiUEw==
X-Google-Smtp-Source: APXvYqzc3yGxe5RGRlOLkuRJ8NXX83JN4eseDBgieuYoZugSK2nwSlK6S+7jcraA/FUQ+BhJLhi6KA==
X-Received: by 2002:adf:d081:: with SMTP id y1mr34406wrh.34.1562265046761;
	Thu, 04 Jul 2019 11:30:46 -0700 (PDT)
Received: from e111045-lin.arm.com (93-143-123-179.adsl.net.t-com.hr.
	[93.143.123.179]) by smtp.gmail.com with ESMTPSA id
	o6sm11114695wra.27.2019.07.04.11.30.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 11:30:46 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Thu,  4 Jul 2019 20:30:14 +0200
Message-Id: <20190704183017.31570-5-ard.biesheuvel@linaro.org>
In-Reply-To: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
References: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 04 Jul 2019 18:30:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 04 Jul 2019 18:30:48 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.215  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v8 4/7] md: dm-crypt: switch to ESSIV crypto API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 04 Jul 2019 18:32:10 +0000 (UTC)

Replace the explicit ESSIV handling in the dm-crypt driver with calls
into the crypto API, which now possesses the capability to perform
this processing within the crypto subsystem.

Reviewed-by: Milan Broz <gmazyland@gmail.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/Kconfig    |   1 +
 drivers/md/dm-crypt.c | 200 ++++----------------
 2 files changed, 36 insertions(+), 165 deletions(-)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index db269a348b20..3c57e76969fa 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -270,6 +270,7 @@ config DM_CRYPT
 	depends on BLK_DEV_DM
 	select CRYPTO
 	select CRYPTO_CBC
+	select CRYPTO_ESSIV
 	---help---
 	  This device-mapper target allows you to create a device that
 	  transparently encrypts the data on it. You'll need to activate
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 3c17d588f6db..e6b49b323543 100644
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
@@ -323,157 +315,15 @@ static int crypt_iv_plain64be_gen(struct crypt_config *cc, u8 *iv,
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
@@ -854,10 +704,6 @@ static const struct crypt_iv_operations crypt_iv_plain64be_ops = {
 };
 
 static const struct crypt_iv_operations crypt_iv_essiv_ops = {
-	.ctr       = crypt_iv_essiv_ctr,
-	.dtr       = crypt_iv_essiv_dtr,
-	.init      = crypt_iv_essiv_init,
-	.wipe      = crypt_iv_essiv_wipe,
 	.generator = crypt_iv_essiv_gen
 };
 
@@ -2397,7 +2243,7 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 				char **ivmode, char **ivopts)
 {
 	struct crypt_config *cc = ti->private;
-	char *tmp, *cipher_api;
+	char *tmp, *cipher_api, buf[CRYPTO_MAX_ALG_NAME];
 	int ret = -EINVAL;
 
 	cc->tfms_count = 1;
@@ -2436,9 +2282,19 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
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
+		if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME)
+			goto bad_mem;
+		cipher_api = buf;
 	}
 
 	cc->key_parts = cc->tfms_count;
@@ -2456,6 +2312,9 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
 
 	return 0;
+bad_mem:
+	ti->error = "Cannot allocate cipher string";
+	return -ENOMEM;
 }
 
 static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key,
@@ -2515,9 +2374,20 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
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
+			       "essiv(%s(%s),%s,%s)", chainmode, cipher,
+			       cipher, *ivopts);
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
