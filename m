Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C73636DE
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 15:25:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C25F307D90D;
	Tue,  9 Jul 2019 13:24:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306713792;
	Tue,  9 Jul 2019 13:24:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7B86E160;
	Tue,  9 Jul 2019 13:23:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69DMfa7006660 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 09:22:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBBB8831C5; Tue,  9 Jul 2019 13:22:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5615831BC
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:39 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 005F0308330C
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so10874801wrr.5
	for <dm-devel@redhat.com>; Tue, 09 Jul 2019 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wPhcfQRL6NW2tNfq/SWFOjSLpF4JrsR8NpUH9uwxvGQ=;
	b=biGsqAe6SMpn0viFc5cP8wcJ8p+Pqvb0UfHJpmwtfjxkzWPhRx//lkKdN4JuOeZgW8
	UzdNI+4DdSrTzllnEiP9W4qjxgIdPtZXuy050KftBtBOuFoH/qv0dn35oRYtp31vk1fe
	NnNU4OQG8xKivnCHsalap3miB0AADKFL7+UGS+hs2esTEGZK0JSYoGZmWY90A7Skxtw8
	axGocdpEgftybOG7ldM22vmp0saClTE56g8H8Ww02RrLWqr2AJDG5n73Qy7XLpSs8kEi
	hJoV40NfFF/K/bWQxO95Icb7YE4T+iPiDLJxIqc6PbKvsBoUs8OjC/nvp30RboBOTrwi
	yhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wPhcfQRL6NW2tNfq/SWFOjSLpF4JrsR8NpUH9uwxvGQ=;
	b=MkoiYB3zLqkNtVQxMcoPFFhYpzlnd6H3QGPqJDDQ2lK0KRoJbmz0rS80BoBhh3kaUC
	VIAAGMBx3hGV+OESVWj4D4o9KeGvK18Wh6zGqLz4oky+wkVGf/7/7F8X0HKrjnk1oFdp
	H3EDhlYKJVqcK1qFlfL/5i/CtqwlFp+JqspKjMPHNtomym242JFvJRUvPj/kiS6nGoET
	ZbA2Hkh+o7T6uIockPV4UgYqcTJpkvfHkBQ/Y7UwUSFpFUetxbgJ3hzloNcfd/BXgokX
	/usRCPCc+fNjzdMA2Jd/rmeRG/MsteevqnjLG5XTDABCD1Yx0IAkYj6GpOUqcaOij+xy
	PwgQ==
X-Gm-Message-State: APjAAAV7rTsMqNoBWdUOzJekUvIJyGgxJlXsi9bHy+CSGqMs7weKDSSs
	L68vaP71X2o1jva3isAR3Uw3YjqHTG8=
X-Google-Smtp-Source: APXvYqy4cfQ7Si1/rlVfBdK4OI7sMkreIHpmy+2YEm7gEa5GaZjBgz5X/QkPwJZ0+5+pIwQuEWvE5A==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr19879999wri.224.1562678548331;
	Tue, 09 Jul 2019 06:22:28 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	z25sm3533319wmf.38.2019.07.09.06.22.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 06:22:27 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Tue,  9 Jul 2019 15:22:14 +0200
Message-Id: <20190709132214.3905-3-gmazyland@gmail.com>
In-Reply-To: <20190709132214.3905-1-gmazyland@gmail.com>
References: <20190709132214.3905-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 13:22:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 13:22:30 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.229 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v2 3/3] dm-crypt: Implement eboiv - encrypted
	byte-offset initialization vector.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 09 Jul 2019 13:25:17 +0000 (UTC)

This IV is used in some BitLocker devices with CBC encryption mode.

IV is encrypted little-endian byte-offset (with the same key and cipher
as the volume).

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index c567e13a0e5f..0443a925840b 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -120,6 +120,10 @@ struct iv_tcw_private {
 	u8 *whitening;
 };
 
+struct iv_eboiv_private {
+	struct crypto_cipher *tfm;
+};
+
 /*
  * Crypt: maps a linear range of a block device
  * and encrypts / decrypts at the same time.
@@ -159,6 +163,7 @@ struct crypt_config {
 		struct iv_benbi_private benbi;
 		struct iv_lmk_private lmk;
 		struct iv_tcw_private tcw;
+		struct iv_eboiv_private eboiv;
 	} iv_gen_private;
 	u64 iv_offset;
 	unsigned int iv_size;
@@ -290,6 +295,10 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
  *       is calculated from initial key, sector number and mixed using CRC32.
  *       Note that this encryption scheme is vulnerable to watermarking attacks
  *       and should be used for old compatible containers access only.
+ *
+ * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
+ *        The IV is encrypted little-endian byte-offset (with the same key
+ *        and cipher as the volume).
  */
 
 static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
@@ -838,6 +847,67 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
 	return 0;
 }
 
+static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
+{
+	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+
+	crypto_free_cipher(eboiv->tfm);
+	eboiv->tfm = NULL;
+}
+
+static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
+			    const char *opts)
+{
+	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+	struct crypto_cipher *tfm;
+
+	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
+	if (IS_ERR(tfm)) {
+		ti->error = "Error allocating crypto tfm for EBOIV";
+		return PTR_ERR(tfm);
+	}
+
+	if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
+		ti->error = "Block size of EBOIV cipher does "
+			    "not match IV size of block cipher";
+		crypto_free_cipher(tfm);
+		return -EINVAL;
+	}
+
+	eboiv->tfm = tfm;
+	return 0;
+}
+
+static int crypt_iv_eboiv_init(struct crypt_config *cc)
+{
+	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+	int err;
+
+	err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
+{
+	/* Called after cc->key is set to random key in crypt_wipe() */
+	return crypt_iv_eboiv_init(cc);
+}
+
+static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
+			    struct dm_crypt_request *dmreq)
+{
+	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+
+	memset(iv, 0, cc->iv_size);
+	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
+	crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
+
+	return 0;
+}
+
 static const struct crypt_iv_operations crypt_iv_plain_ops = {
 	.generator = crypt_iv_plain_gen
 };
@@ -890,6 +960,14 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
 	.generator = crypt_iv_random_gen
 };
 
+static struct crypt_iv_operations crypt_iv_eboiv_ops = {
+	.ctr	   = crypt_iv_eboiv_ctr,
+	.dtr	   = crypt_iv_eboiv_dtr,
+	.init	   = crypt_iv_eboiv_init,
+	.wipe	   = crypt_iv_eboiv_wipe,
+	.generator = crypt_iv_eboiv_gen
+};
+
 /*
  * Integrity extensions
  */
@@ -2293,6 +2371,8 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
 		cc->iv_gen_ops = &crypt_iv_benbi_ops;
 	else if (strcmp(ivmode, "null") == 0)
 		cc->iv_gen_ops = &crypt_iv_null_ops;
+	else if (strcmp(ivmode, "eboiv") == 0)
+		cc->iv_gen_ops = &crypt_iv_eboiv_ops;
 	else if (strcmp(ivmode, "lmk") == 0) {
 		cc->iv_gen_ops = &crypt_iv_lmk_ops;
 		/*
@@ -3093,7 +3173,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
 
 static struct target_type crypt_target = {
 	.name   = "crypt",
-	.version = {1, 18, 1},
+	.version = {1, 19, 0},
 	.module = THIS_MODULE,
 	.ctr    = crypt_ctr,
 	.dtr    = crypt_dtr,
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
