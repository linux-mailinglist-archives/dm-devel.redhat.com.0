Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D463C5F8F5
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 15:15:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11CAE13A98;
	Thu,  4 Jul 2019 13:14:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E20759442;
	Thu,  4 Jul 2019 13:14:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E86D41F53;
	Thu,  4 Jul 2019 13:13:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64DCJ8P028607 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 09:12:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1621286BBC; Thu,  4 Jul 2019 13:12:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FAB5891A7
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:16 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EED19308FC4E
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c27so6623742wrb.2
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j9ZgjohFzAaYD7yrF8N/LTC6X+yDRv1YytjPRhSO5cw=;
	b=m2gH37pxx/ZbWWZ0iM0ZIMD5bLhbg58fVue120H/r2/bCRoy4LCYR/Xqbmm7QRcm8l
	QHUt0GzDX758cu1ALkfB8oLfpsrz6W//iBrf80UjTJtv12cxfSLw5vjZy/VCJeAMYq24
	BLmEuaTnSREHqfHV8A6ZGnaw6ir1k8ZCT1GT2IZfFs18LtZlv8Y7w1XcMeQlcVK/GDIF
	sXTR3hVOy7/2jfxQG86hYft146xzo/6Dmix81ETYXCZmgOIzuidrbnbmbROV43KbnI8T
	/XNT3fTkbM2nmRaWiKptCStumSO1W/0xF0kKFvE0GKV8/p6fw3dRiWFSVVE4Bi1U+lwt
	6NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j9ZgjohFzAaYD7yrF8N/LTC6X+yDRv1YytjPRhSO5cw=;
	b=dEy+ro3o+zKmGVFhesVUVbJjjO4tNLtAbckV2rWvI0/nlJHDpm8VJ3u6J2sXE7Tdj7
	LoWUkWK9/OU8f6eRHcpg/VsPiZSIGdOTwrwHNbIuVDKIyos7mPpbzgSwffLFfc5ZCtnb
	gT7FUYjk+vYQVquFWcG7UCCFBzWF7NHEara/OWm794VVS/df6Xadv3MOLmXGh7XEkOXX
	kGC0IKudlzyB95XLTYYUS8aIlmyoEH6877q9nZeeCjMXjTuoTL76mPwd+I/0kNjh283L
	JGaViwpk9XBGJrQzlzP8D+45NlHPNwcxXMDuQhHL4T8N2cyHamHm8V1pcftvdc5qs0QQ
	URGg==
X-Gm-Message-State: APjAAAXDNVKID3912f6CX7Ahbhs/f/1ys6+JbPZnl6pGa5/zKxtJRZmY
	HwsO1QDoj1+6+uwsH52yFnBwRCw9tKw=
X-Google-Smtp-Source: APXvYqy8o/3SMKKQJ7WU3DsNZ2+750IbHfu1hRh0mEVsWsEH7N2TJ5yTLamUF68XvlX6TlIOkccgHw==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr16290499wri.178.1562245923390;
	Thu, 04 Jul 2019 06:12:03 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	u6sm1844555wrw.15.2019.07.04.06.12.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 06:12:02 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu,  4 Jul 2019 15:10:33 +0200
Message-Id: <20190704131033.9919-3-gmazyland@gmail.com>
In-Reply-To: <20190704131033.9919-1-gmazyland@gmail.com>
References: <20190704131033.9919-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 04 Jul 2019 13:12:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 04 Jul 2019 13:12:05 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.089  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH 3/3] dm-crypt: Implement eboiv - encrypted
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 04 Jul 2019 13:15:07 +0000 (UTC)

This IV is used in some BitLocker devices with CBC encryption mode.

NOTE: maybe we need to use another crypto API if the bare cipher
      API is going to be deprecated.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 96ead4492787..a5ffa1ac6a28 100644
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
