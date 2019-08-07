Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E42498444F
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 08:11:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D9CCC06512C;
	Wed,  7 Aug 2019 06:11:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04893600C4;
	Wed,  7 Aug 2019 06:11:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E45825540;
	Wed,  7 Aug 2019 06:11:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x775oaPE030504 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 01:50:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CCF880A3; Wed,  7 Aug 2019 05:50:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EC319C69
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 05:50:33 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA15189C3D
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 05:50:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so80460456wma.1
	for <dm-devel@redhat.com>; Tue, 06 Aug 2019 22:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=CXyjD2LOgdjBHwvd9Z5OLX5HdLR1iysQUf/zzqY6Pg0=;
	b=lMdIxIi6yJdoqNFjkK2obWzPaZeIBmGxoeEOHIr1pzD9k61SjXsh8zh4Nm6xWfws3S
	0ANsw1PpWH0aQgvkRH2+kfNcAiS3xokvUz7g4ZxBCGkHJBDI3+KCGptK/+RFBkQdw1cX
	fySnCvJD19wnY4s9FX9yeFQgKm3NUEXBumMWanotIp11zUhCTJdFFnhDFIt84ttQ4Fby
	0fSjwFMzLdmMRUJWAR9IG4D7y4hcF4wUpeWwdF2ahvwNVLDBmVJGycNr8qC6KjlDDaVq
	/3UuW+MLvfDwRPjHCytTyLlKaY1fi670gSxm+r9NvBzn7hOg1IlPOnzaIyYj81xjkIHn
	sfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CXyjD2LOgdjBHwvd9Z5OLX5HdLR1iysQUf/zzqY6Pg0=;
	b=DRn/mmBOfatPjtJbgCg8kZQ+cDohEkH1VnNVl0kwkN4iX2sJ9TNI6FrXSLKF8uG/Xp
	2FepHhpURz4V7AMXpS1LSkXKXPOACQdk1vZMvAzoUpFpCP51BzdVb/fxyT3kqTLiq21U
	g3XKfLU4l3vq/owBzmZE/3NLhXBjq+w1oQDyxtQwYggwx3z6v12AG/KvPduRyOo1h52C
	yg4072BLYaNMMGUXeXU2Ka6ngHDJdQYqetbQunvvMAIo0fc2MnLv7D6+NnLv1noYztx8
	0h4cXmvdYg0f5/Y2wPsudPmXLp6mbffdj5m0du5eppJ8E44Y8shzCetntBe+JF/eV5fX
	9k3g==
X-Gm-Message-State: APjAAAVrRmMcpHw8AHIkYPZlg9N17NrhvkQ7H/w0JbNPdG6zXahoXh0Z
	/tPsgSmwrZcn/OjkWLJMcPvMEg==
X-Google-Smtp-Source: APXvYqy5kfvAkfH07mTHeHFHdgjVJ7ziNQjvaHEfPh0RCtkU5MmVmrtte4aRS9enZq15t2U40VZJNg==
X-Received: by 2002:a1c:9889:: with SMTP id a131mr1664005wme.22.1565157031209; 
	Tue, 06 Aug 2019 22:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id
	h11sm2659891wrc.35.2019.08.06.22.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 22:50:29 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Wed,  7 Aug 2019 08:50:22 +0300
Message-Id: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 07 Aug 2019 05:50:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 07 Aug 2019 05:50:33 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: herbert@gondor.apana.org.au, snitzer@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, ebiggers@kernel.org,
	dm-devel@redhat.com, gmazyland@gmail.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher for IV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 07 Aug 2019 06:11:46 +0000 (UTC)

Instead of instantiating a separate cipher to perform the encryption
needed to produce the IV, reuse the skcipher used for the block data
and invoke it one additional time for each block to encrypt a zero
vector and use the output as the IV.

For CBC mode, this is equivalent to using the bare block cipher, but
without the risk of ending up with a non-time invariant implementation
of AES when the skcipher itself is time variant (e.g., arm64 without
Crypto Extensions has a NEON based time invariant implementation of
cbc(aes) but no time invariant implementation of the core cipher other
than aes-ti, which is not enabled by default)

This approach is a compromise between dm-crypt API flexibility and
reducing dependence on parts of the crypto API that should not usually
be exposed to other subsystems, such as the bare cipher API.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 70 ++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d5216bcc4649..48cd76c88d77 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -120,10 +120,6 @@ struct iv_tcw_private {
 	u8 *whitening;
 };
 
-struct iv_eboiv_private {
-	struct crypto_cipher *tfm;
-};
-
 /*
  * Crypt: maps a linear range of a block device
  * and encrypts / decrypts at the same time.
@@ -163,7 +159,6 @@ struct crypt_config {
 		struct iv_benbi_private benbi;
 		struct iv_lmk_private lmk;
 		struct iv_tcw_private tcw;
-		struct iv_eboiv_private eboiv;
 	} iv_gen_private;
 	u64 iv_offset;
 	unsigned int iv_size;
@@ -847,65 +842,47 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
 	return 0;
 }
 
-static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
-{
-	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
-
-	crypto_free_cipher(eboiv->tfm);
-	eboiv->tfm = NULL;
-}
-
 static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 			    const char *opts)
 {
-	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
-	struct crypto_cipher *tfm;
-
-	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
-	if (IS_ERR(tfm)) {
-		ti->error = "Error allocating crypto tfm for EBOIV";
-		return PTR_ERR(tfm);
+	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags)) {
+		ti->error = "AEAD transforms not supported for EBOIV";
+		return -EINVAL;
 	}
 
-	if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
+	if (crypto_skcipher_blocksize(any_tfm(cc)) != cc->iv_size) {
 		ti->error = "Block size of EBOIV cipher does "
 			    "not match IV size of block cipher";
-		crypto_free_cipher(tfm);
 		return -EINVAL;
 	}
 
-	eboiv->tfm = tfm;
 	return 0;
 }
 
-static int crypt_iv_eboiv_init(struct crypt_config *cc)
+static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
+			    struct dm_crypt_request *dmreq)
 {
-	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+	u8 buf[MAX_CIPHER_BLOCKSIZE] __aligned(__alignof__(__le64));
+	struct skcipher_request *req;
+	struct scatterlist src, dst;
+	struct crypto_wait wait;
 	int err;
 
-	err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
-{
-	/* Called after cc->key is set to random key in crypt_wipe() */
-	return crypt_iv_eboiv_init(cc);
-}
+	req = skcipher_request_alloc(any_tfm(cc), GFP_KERNEL | GFP_NOFS);
+	if (!req)
+		return -ENOMEM;
 
-static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
-			    struct dm_crypt_request *dmreq)
-{
-	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+	memset(buf, 0, cc->iv_size);
+	*(__le64 *)buf = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
 
-	memset(iv, 0, cc->iv_size);
-	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
-	crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
+	sg_init_one(&src, page_address(ZERO_PAGE(0)), cc->iv_size);
+	sg_init_one(&dst, iv, cc->iv_size);
+	skcipher_request_set_crypt(req, &src, &dst, cc->iv_size, buf);
+	skcipher_request_set_callback(req, 0, crypto_req_done, &wait);
+	err = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	skcipher_request_free(req);
 
-	return 0;
+	return err;
 }
 
 static const struct crypt_iv_operations crypt_iv_plain_ops = {
@@ -962,9 +939,6 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
 
 static struct crypt_iv_operations crypt_iv_eboiv_ops = {
 	.ctr	   = crypt_iv_eboiv_ctr,
-	.dtr	   = crypt_iv_eboiv_dtr,
-	.init	   = crypt_iv_eboiv_init,
-	.wipe	   = crypt_iv_eboiv_wipe,
 	.generator = crypt_iv_eboiv_gen
 };
 
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
