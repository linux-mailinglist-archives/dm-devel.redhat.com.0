Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F41C29E6F7
	for <lists+dm-devel@lfdr.de>; Thu, 29 Oct 2020 10:09:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-1c-wGTG8O4y8tv5bC1uFsg-1; Thu, 29 Oct 2020 05:08:11 -0400
X-MC-Unique: 1c-wGTG8O4y8tv5bC1uFsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3191009E4C;
	Thu, 29 Oct 2020 09:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F8D5D98F;
	Thu, 29 Oct 2020 09:08:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C143C181A872;
	Thu, 29 Oct 2020 09:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09SCYhp2015973 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Oct 2020 08:34:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 500AC1111A75; Wed, 28 Oct 2020 12:34:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD831000625
	for <dm-devel@redhat.com>; Wed, 28 Oct 2020 12:34:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3388C1078502
	for <dm-devel@redhat.com>; Wed, 28 Oct 2020 12:34:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172]) by
	relay.mimecast.com with ESMTP id us-mta-147-1tR4qzx4PSq00RWJUoVD9w-1;
	Wed, 28 Oct 2020 08:34:40 -0400
X-MC-Unique: 1tR4qzx4PSq00RWJUoVD9w-1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DB2D176B;
	Wed, 28 Oct 2020 05:34:40 -0700 (PDT)
Received: from e110176-lin.kfn.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5697C3F719;
	Wed, 28 Oct 2020 05:34:38 -0700 (PDT)
From: Gilad Ben-Yossef <gilad@benyossef.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
Date: Wed, 28 Oct 2020 14:34:19 +0200
Message-Id: <20201028123420.30623-5-gilad@benyossef.com>
In-Reply-To: <20201028123420.30623-1-gilad@benyossef.com>
References: <20201028123420.30623-1-gilad@benyossef.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09SCYhp2015973
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 29 Oct 2020 05:07:36 -0400
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Ofir Drang <ofir.drang@arm.com>
Subject: [dm-devel] [PATCH v2 4/4] crypto: ccree: re-introduce ccree eboiv
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BitLocker eboiv support, which was removed in
commit 1d8b41ff6991 ("crypto: ccree - remove bitlocker cipher")
is reintroduced based on the crypto API new support for
eboiv.

Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
Fixes: 1d8b41ff6991 ("crypto: ccree - remove bitlocker cipher")
---
 drivers/crypto/ccree/cc_cipher.c     | 132 +++++++++++++++++++--------
 drivers/crypto/ccree/cc_crypto_ctx.h |   1 +
 2 files changed, 96 insertions(+), 37 deletions(-)

diff --git a/drivers/crypto/ccree/cc_cipher.c b/drivers/crypto/ccree/cc_cipher.c
index dafa6577a845..a13ae60189ed 100644
--- a/drivers/crypto/ccree/cc_cipher.c
+++ b/drivers/crypto/ccree/cc_cipher.c
@@ -74,10 +74,14 @@ static int validate_keys_sizes(struct cc_cipher_ctx *ctx_p, u32 size)
 	case S_DIN_to_AES:
 		switch (size) {
 		case CC_AES_128_BIT_KEY_SIZE:
-		case CC_AES_192_BIT_KEY_SIZE:
 			if (ctx_p->cipher_mode != DRV_CIPHER_XTS)
 				return 0;
 			break;
+		case CC_AES_192_BIT_KEY_SIZE:
+			if (ctx_p->cipher_mode != DRV_CIPHER_XTS &&
+			    ctx_p->cipher_mode != DRV_CIPHER_BITLOCKER)
+				return 0;
+			break;
 		case CC_AES_256_BIT_KEY_SIZE:
 			return 0;
 		case (CC_AES_192_BIT_KEY_SIZE * 2):
@@ -120,6 +124,7 @@ static int validate_data_size(struct cc_cipher_ctx *ctx_p,
 		case DRV_CIPHER_ECB:
 		case DRV_CIPHER_CBC:
 		case DRV_CIPHER_ESSIV:
+		case DRV_CIPHER_BITLOCKER:
 			if (IS_ALIGNED(size, AES_BLOCK_SIZE))
 				return 0;
 			break;
@@ -345,7 +350,8 @@ static int cc_cipher_sethkey(struct crypto_skcipher *sktfm, const u8 *key,
 		}
 
 		if (ctx_p->cipher_mode == DRV_CIPHER_XTS ||
-		    ctx_p->cipher_mode == DRV_CIPHER_ESSIV) {
+		    ctx_p->cipher_mode == DRV_CIPHER_ESSIV ||
+		    ctx_p->cipher_mode == DRV_CIPHER_BITLOCKER) {
 			if (hki.hw_key1 == hki.hw_key2) {
 				dev_err(dev, "Illegal hw key numbers (%d,%d)\n",
 					hki.hw_key1, hki.hw_key2);
@@ -543,6 +549,7 @@ static void cc_setup_readiv_desc(struct crypto_tfm *tfm,
 		break;
 	case DRV_CIPHER_XTS:
 	case DRV_CIPHER_ESSIV:
+	case DRV_CIPHER_BITLOCKER:
 		/*  IV */
 		hw_desc_init(&desc[*seq_size]);
 		set_setup_mode(&desc[*seq_size], SETUP_WRITE_STATE1);
@@ -597,6 +604,7 @@ static void cc_setup_state_desc(struct crypto_tfm *tfm,
 		break;
 	case DRV_CIPHER_XTS:
 	case DRV_CIPHER_ESSIV:
+	case DRV_CIPHER_BITLOCKER:
 		break;
 	default:
 		dev_err(dev, "Unsupported cipher mode (%d)\n", cipher_mode);
@@ -616,56 +624,70 @@ static void cc_setup_xex_state_desc(struct crypto_tfm *tfm,
 	int flow_mode = ctx_p->flow_mode;
 	int direction = req_ctx->gen_ctx.op_type;
 	dma_addr_t key_dma_addr = ctx_p->user.key_dma_addr;
-	unsigned int key_len = (ctx_p->keylen / 2);
 	dma_addr_t iv_dma_addr = req_ctx->gen_ctx.iv_dma_addr;
-	unsigned int key_offset = key_len;
+	unsigned int key_len;
+	unsigned int key_offset;
 
 	switch (cipher_mode) {
 	case DRV_CIPHER_ECB:
-		break;
 	case DRV_CIPHER_CBC:
 	case DRV_CIPHER_CBC_CTS:
 	case DRV_CIPHER_CTR:
 	case DRV_CIPHER_OFB:
-		break;
-	case DRV_CIPHER_XTS:
-	case DRV_CIPHER_ESSIV:
+		/* No secondary key for these ciphers, so just return */
+		return;
 
-		if (cipher_mode == DRV_CIPHER_ESSIV)
-			key_len = SHA256_DIGEST_SIZE;
+	case DRV_CIPHER_XTS:
+		/* Secondary key is same size as primary key and stored after primary key */
+		key_len = ctx_p->keylen / 2;
+		key_offset = key_len;
+		break;
 
-		/* load XEX key */
-		hw_desc_init(&desc[*seq_size]);
-		set_cipher_mode(&desc[*seq_size], cipher_mode);
-		set_cipher_config0(&desc[*seq_size], direction);
-		if (cc_key_type(tfm) == CC_HW_PROTECTED_KEY) {
-			set_hw_crypto_key(&desc[*seq_size],
-					  ctx_p->hw.key2_slot);
-		} else {
-			set_din_type(&desc[*seq_size], DMA_DLLI,
-				     (key_dma_addr + key_offset),
-				     key_len, NS_BIT);
-		}
-		set_xex_data_unit_size(&desc[*seq_size], nbytes);
-		set_flow_mode(&desc[*seq_size], S_DIN_to_AES2);
-		set_key_size_aes(&desc[*seq_size], key_len);
-		set_setup_mode(&desc[*seq_size], SETUP_LOAD_XEX_KEY);
-		(*seq_size)++;
+	case DRV_CIPHER_ESSIV:
+		/* Secondary key is a digest of primary key and stored after primary key */
+		key_len = SHA256_DIGEST_SIZE;
+		key_offset = ctx_p->keylen / 2;
+		break;
 
-		/* Load IV */
-		hw_desc_init(&desc[*seq_size]);
-		set_setup_mode(&desc[*seq_size], SETUP_LOAD_STATE1);
-		set_cipher_mode(&desc[*seq_size], cipher_mode);
-		set_cipher_config0(&desc[*seq_size], direction);
-		set_key_size_aes(&desc[*seq_size], key_len);
-		set_flow_mode(&desc[*seq_size], flow_mode);
-		set_din_type(&desc[*seq_size], DMA_DLLI, iv_dma_addr,
-			     CC_AES_BLOCK_SIZE, NS_BIT);
-		(*seq_size)++;
+	case DRV_CIPHER_BITLOCKER:
+		/* Secondary key is same as primary key */
+		key_len = ctx_p->keylen;
+		key_offset = 0;
 		break;
+
 	default:
+		/* This should never really happen */
 		dev_err(dev, "Unsupported cipher mode (%d)\n", cipher_mode);
+		return;
+	}
+
+	/* load XEX key */
+	hw_desc_init(&desc[*seq_size]);
+	set_cipher_mode(&desc[*seq_size], cipher_mode);
+	set_cipher_config0(&desc[*seq_size], direction);
+	if (cc_key_type(tfm) == CC_HW_PROTECTED_KEY) {
+		set_hw_crypto_key(&desc[*seq_size],
+				  ctx_p->hw.key2_slot);
+	} else {
+		set_din_type(&desc[*seq_size], DMA_DLLI,
+			     (key_dma_addr + key_offset),
+			     key_len, NS_BIT);
 	}
+	set_xex_data_unit_size(&desc[*seq_size], nbytes);
+	set_flow_mode(&desc[*seq_size], S_DIN_to_AES2);
+	set_key_size_aes(&desc[*seq_size], key_len);
+	set_setup_mode(&desc[*seq_size], SETUP_LOAD_XEX_KEY);
+	(*seq_size)++;
+
+	/* Load IV */
+	hw_desc_init(&desc[*seq_size]);
+	set_setup_mode(&desc[*seq_size], SETUP_LOAD_STATE1);
+	set_cipher_mode(&desc[*seq_size], cipher_mode);
+	set_cipher_config0(&desc[*seq_size], direction);
+	set_key_size_aes(&desc[*seq_size], key_len);
+	set_flow_mode(&desc[*seq_size], flow_mode);
+	set_din_type(&desc[*seq_size], DMA_DLLI, iv_dma_addr, CC_AES_BLOCK_SIZE, NS_BIT);
+	(*seq_size)++;
 }
 
 static int cc_out_flow_mode(struct cc_cipher_ctx *ctx_p)
@@ -702,6 +724,7 @@ static void cc_setup_key_desc(struct crypto_tfm *tfm,
 	case DRV_CIPHER_CTR:
 	case DRV_CIPHER_OFB:
 	case DRV_CIPHER_ECB:
+	case DRV_CIPHER_BITLOCKER:
 		/* Load key */
 		hw_desc_init(&desc[*seq_size]);
 		set_cipher_mode(&desc[*seq_size], cipher_mode);
@@ -1040,6 +1063,24 @@ static const struct cc_alg_template skcipher_algs[] = {
 		.std_body = CC_STD_NIST,
 		.sec_func = true,
 	},
+	{
+		.name = "eboiv(cbc(paes))",
+		.driver_name = "eboiv-cbc-paes-ccree",
+		.blocksize = AES_BLOCK_SIZE,
+		.template_skcipher = {
+			.setkey = cc_cipher_sethkey,
+			.encrypt = cc_cipher_encrypt,
+			.decrypt = cc_cipher_decrypt,
+			.min_keysize = CC_HW_KEY_SIZE,
+			.max_keysize = CC_HW_KEY_SIZE,
+			.ivsize = AES_BLOCK_SIZE,
+			},
+		.cipher_mode = DRV_CIPHER_BITLOCKER,
+		.flow_mode = S_DIN_to_AES,
+		.min_hw_rev = CC_HW_REV_712,
+		.std_body = CC_STD_NIST,
+		.sec_func = true,
+	},
 	{
 		.name = "ecb(paes)",
 		.driver_name = "ecb-paes-ccree",
@@ -1168,6 +1209,23 @@ static const struct cc_alg_template skcipher_algs[] = {
 		.min_hw_rev = CC_HW_REV_712,
 		.std_body = CC_STD_NIST,
 	},
+	{
+		.name = "eboiv(cbc(aes))",
+		.driver_name = "eboiv-cbc-aes-ccree",
+		.blocksize = AES_BLOCK_SIZE,
+		.template_skcipher = {
+			.setkey = cc_cipher_setkey,
+			.encrypt = cc_cipher_encrypt,
+			.decrypt = cc_cipher_decrypt,
+			.min_keysize = AES_MIN_KEY_SIZE,
+			.max_keysize = AES_MAX_KEY_SIZE,
+			.ivsize = AES_BLOCK_SIZE,
+			},
+		.cipher_mode = DRV_CIPHER_BITLOCKER,
+		.flow_mode = S_DIN_to_AES,
+		.min_hw_rev = CC_HW_REV_712,
+		.std_body = CC_STD_NIST,
+	},
 	{
 		.name = "ecb(aes)",
 		.driver_name = "ecb-aes-ccree",
diff --git a/drivers/crypto/ccree/cc_crypto_ctx.h b/drivers/crypto/ccree/cc_crypto_ctx.h
index bd9a1c0896b3..ccf960a0d989 100644
--- a/drivers/crypto/ccree/cc_crypto_ctx.h
+++ b/drivers/crypto/ccree/cc_crypto_ctx.h
@@ -108,6 +108,7 @@ enum drv_cipher_mode {
 	DRV_CIPHER_CBC_CTS = 11,
 	DRV_CIPHER_GCTR = 12,
 	DRV_CIPHER_ESSIV = 13,
+	DRV_CIPHER_BITLOCKER = 14,
 	DRV_CIPHER_RESERVE32B = S32_MAX
 };
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

