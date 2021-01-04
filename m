Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CEC812E9DA8
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:03:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-7LDfNwM-PUWBBJyEvMYgqg-1; Mon, 04 Jan 2021 14:03:41 -0500
X-MC-Unique: 7LDfNwM-PUWBBJyEvMYgqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818871842145;
	Mon,  4 Jan 2021 19:03:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5792A27C30;
	Mon,  4 Jan 2021 19:03:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F12915002D;
	Mon,  4 Jan 2021 19:03:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BNMlxI7014960 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Dec 2020 17:47:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29E882026D3A; Wed, 23 Dec 2020 22:47:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FA62026D48
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 22:47:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82EDD101A53F
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 22:47:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-449-CYzyAJTXOd6tP_32L_vlvA-1;
	Wed, 23 Dec 2020 17:47:53 -0500
X-MC-Unique: CYzyAJTXOd6tP_32L_vlvA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7AB82251E;
	Wed, 23 Dec 2020 22:39:18 +0000 (UTC)
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 23 Dec 2020 23:38:39 +0100
Message-Id: <20201223223841.11311-9-ardb@kernel.org>
In-Reply-To: <20201223223841.11311-1-ardb@kernel.org>
References: <20201223223841.11311-1-ardb@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:11 -0500
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>, Megha Dey <megha.dey@intel.com>
Subject: [dm-devel] [RFC PATCH 08/10] crypto: x86/serpent - drop CTR mode
	implementation
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Serpent in CTR mode is never used by the kernel directly, and is highly
unlikely to be relied upon by dm-crypt or algif_skcipher. So let's drop
the accelerated CTR mode implementation, and instead, rely on the CTR
template and the bare cipher.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/crypto/serpent-avx-x86_64-asm_64.S | 20 ------
 arch/x86/crypto/serpent-avx2-asm_64.S       | 25 --------
 arch/x86/crypto/serpent_avx2_glue.c         | 38 -----------
 arch/x86/crypto/serpent_avx_glue.c          | 51 ---------------
 arch/x86/crypto/serpent_sse2_glue.c         | 67 --------------------
 5 files changed, 201 deletions(-)

diff --git a/arch/x86/crypto/serpent-avx-x86_64-asm_64.S b/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
index 6b41f46bcc76..b7ee24df7fba 100644
--- a/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
+++ b/arch/x86/crypto/serpent-avx-x86_64-asm_64.S
@@ -711,23 +711,3 @@ SYM_FUNC_START(serpent_cbc_dec_8way_avx)
 	FRAME_END
 	ret;
 SYM_FUNC_END(serpent_cbc_dec_8way_avx)
-
-SYM_FUNC_START(serpent_ctr_8way_avx)
-	/* input:
-	 *	%rdi: ctx, CTX
-	 *	%rsi: dst
-	 *	%rdx: src
-	 *	%rcx: iv (little endian, 128bit)
-	 */
-	FRAME_BEGIN
-
-	load_ctr_8way(%rcx, .Lbswap128_mask, RA1, RB1, RC1, RD1, RA2, RB2, RC2,
-		      RD2, RK0, RK1, RK2);
-
-	call __serpent_enc_blk8_avx;
-
-	store_ctr_8way(%rdx, %rsi, RA1, RB1, RC1, RD1, RA2, RB2, RC2, RD2);
-
-	FRAME_END
-	ret;
-SYM_FUNC_END(serpent_ctr_8way_avx)
diff --git a/arch/x86/crypto/serpent-avx2-asm_64.S b/arch/x86/crypto/serpent-avx2-asm_64.S
index a510a949f02f..9161b6e441f3 100644
--- a/arch/x86/crypto/serpent-avx2-asm_64.S
+++ b/arch/x86/crypto/serpent-avx2-asm_64.S
@@ -724,28 +724,3 @@ SYM_FUNC_START(serpent_cbc_dec_16way)
 	FRAME_END
 	ret;
 SYM_FUNC_END(serpent_cbc_dec_16way)
-
-SYM_FUNC_START(serpent_ctr_16way)
-	/* input:
-	 *	%rdi: ctx, CTX
-	 *	%rsi: dst (16 blocks)
-	 *	%rdx: src (16 blocks)
-	 *	%rcx: iv (little endian, 128bit)
-	 */
-	FRAME_BEGIN
-
-	vzeroupper;
-
-	load_ctr_16way(%rcx, .Lbswap128_mask, RA1, RB1, RC1, RD1, RA2, RB2, RC2,
-		       RD2, RK0, RK0x, RK1, RK1x, RK2, RK2x, RK3, RK3x, RNOT,
-		       tp);
-
-	call __serpent_enc_blk16;
-
-	store_ctr_16way(%rdx, %rsi, RA1, RB1, RC1, RD1, RA2, RB2, RC2, RD2);
-
-	vzeroupper;
-
-	FRAME_END
-	ret;
-SYM_FUNC_END(serpent_ctr_16way)
diff --git a/arch/x86/crypto/serpent_avx2_glue.c b/arch/x86/crypto/serpent_avx2_glue.c
index 9cdf2c078e21..28e542c6512a 100644
--- a/arch/x86/crypto/serpent_avx2_glue.c
+++ b/arch/x86/crypto/serpent_avx2_glue.c
@@ -22,8 +22,6 @@ asmlinkage void serpent_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
 asmlinkage void serpent_ecb_dec_16way(const void *ctx, u8 *dst, const u8 *src);
 asmlinkage void serpent_cbc_dec_16way(const void *ctx, u8 *dst, const u8 *src);
 
-asmlinkage void serpent_ctr_16way(const void *ctx, u8 *dst, const u8 *src,
-				  le128 *iv);
 static int serpent_setkey_skcipher(struct crypto_skcipher *tfm,
 				   const u8 *key, unsigned int keylen)
 {
@@ -46,22 +44,6 @@ static const struct common_glue_ctx serpent_enc = {
 	} }
 };
 
-static const struct common_glue_ctx serpent_ctr = {
-	.num_funcs = 3,
-	.fpu_blocks_limit = 8,
-
-	.funcs = { {
-		.num_blocks = 16,
-		.fn_u = { .ctr = serpent_ctr_16way }
-	},  {
-		.num_blocks = 8,
-		.fn_u = { .ctr = serpent_ctr_8way_avx }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = __serpent_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx serpent_dec = {
 	.num_funcs = 3,
 	.fpu_blocks_limit = 8,
@@ -114,11 +96,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&serpent_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&serpent_ctr, req);
-}
-
 static struct skcipher_alg serpent_algs[] = {
 	{
 		.base.cra_name		= "__ecb(serpent)",
@@ -147,21 +124,6 @@ static struct skcipher_alg serpent_algs[] = {
 		.setkey			= serpent_setkey_skcipher,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "__ctr(serpent)",
-		.base.cra_driver_name	= "__ctr-serpent-avx2",
-		.base.cra_priority	= 600,
-		.base.cra_flags		= CRYPTO_ALG_INTERNAL,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct serpent_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= SERPENT_MIN_KEY_SIZE,
-		.max_keysize		= SERPENT_MAX_KEY_SIZE,
-		.ivsize			= SERPENT_BLOCK_SIZE,
-		.chunksize		= SERPENT_BLOCK_SIZE,
-		.setkey			= serpent_setkey_skcipher,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	},
 };
 
diff --git a/arch/x86/crypto/serpent_avx_glue.c b/arch/x86/crypto/serpent_avx_glue.c
index b17a08b57a91..aa4605baf9d4 100644
--- a/arch/x86/crypto/serpent_avx_glue.c
+++ b/arch/x86/crypto/serpent_avx_glue.c
@@ -31,24 +31,6 @@ asmlinkage void serpent_cbc_dec_8way_avx(const void *ctx, u8 *dst,
 					 const u8 *src);
 EXPORT_SYMBOL_GPL(serpent_cbc_dec_8way_avx);
 
-asmlinkage void serpent_ctr_8way_avx(const void *ctx, u8 *dst, const u8 *src,
-				     le128 *iv);
-EXPORT_SYMBOL_GPL(serpent_ctr_8way_avx);
-
-void __serpent_crypt_ctr(const void *ctx, u8 *d, const u8 *s, le128 *iv)
-{
-	be128 ctrblk;
-	u128 *dst = (u128 *)d;
-	const u128 *src = (const u128 *)s;
-
-	le128_to_be128(&ctrblk, iv);
-	le128_inc(iv);
-
-	__serpent_encrypt(ctx, (u8 *)&ctrblk, (u8 *)&ctrblk);
-	u128_xor(dst, src, (u128 *)&ctrblk);
-}
-EXPORT_SYMBOL_GPL(__serpent_crypt_ctr);
-
 static int serpent_setkey_skcipher(struct crypto_skcipher *tfm,
 				   const u8 *key, unsigned int keylen)
 {
@@ -68,19 +50,6 @@ static const struct common_glue_ctx serpent_enc = {
 	} }
 };
 
-static const struct common_glue_ctx serpent_ctr = {
-	.num_funcs = 2,
-	.fpu_blocks_limit = SERPENT_PARALLEL_BLOCKS,
-
-	.funcs = { {
-		.num_blocks = SERPENT_PARALLEL_BLOCKS,
-		.fn_u = { .ctr = serpent_ctr_8way_avx }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = __serpent_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx serpent_dec = {
 	.num_funcs = 2,
 	.fpu_blocks_limit = SERPENT_PARALLEL_BLOCKS,
@@ -127,11 +96,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&serpent_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&serpent_ctr, req);
-}
-
 static struct skcipher_alg serpent_algs[] = {
 	{
 		.base.cra_name		= "__ecb(serpent)",
@@ -160,21 +124,6 @@ static struct skcipher_alg serpent_algs[] = {
 		.setkey			= serpent_setkey_skcipher,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "__ctr(serpent)",
-		.base.cra_driver_name	= "__ctr-serpent-avx",
-		.base.cra_priority	= 500,
-		.base.cra_flags		= CRYPTO_ALG_INTERNAL,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct serpent_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= SERPENT_MIN_KEY_SIZE,
-		.max_keysize		= SERPENT_MAX_KEY_SIZE,
-		.ivsize			= SERPENT_BLOCK_SIZE,
-		.chunksize		= SERPENT_BLOCK_SIZE,
-		.setkey			= serpent_setkey_skcipher,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	},
 };
 
diff --git a/arch/x86/crypto/serpent_sse2_glue.c b/arch/x86/crypto/serpent_sse2_glue.c
index 4fed8d26b91a..9acb3bf28feb 100644
--- a/arch/x86/crypto/serpent_sse2_glue.c
+++ b/arch/x86/crypto/serpent_sse2_glue.c
@@ -10,8 +10,6 @@
  *
  * CBC & ECB parts based on code (crypto/cbc.c,ecb.c) by:
  *   Copyright (c) 2006 Herbert Xu <herbert@gondor.apana.org.au>
- * CTR part based on code (crypto/ctr.c) by:
- *   (C) Copyright IBM Corp. 2007 - Joy Latten <latten@us.ibm.com>
  */
 
 #include <linux/module.h>
@@ -47,38 +45,6 @@ static void serpent_decrypt_cbc_xway(const void *ctx, u8 *d, const u8 *s)
 		u128_xor(dst + (j + 1), dst + (j + 1), ivs + j);
 }
 
-static void serpent_crypt_ctr(const void *ctx, u8 *d, const u8 *s, le128 *iv)
-{
-	be128 ctrblk;
-	u128 *dst = (u128 *)d;
-	const u128 *src = (const u128 *)s;
-
-	le128_to_be128(&ctrblk, iv);
-	le128_inc(iv);
-
-	__serpent_encrypt(ctx, (u8 *)&ctrblk, (u8 *)&ctrblk);
-	u128_xor(dst, src, (u128 *)&ctrblk);
-}
-
-static void serpent_crypt_ctr_xway(const void *ctx, u8 *d, const u8 *s,
-				   le128 *iv)
-{
-	be128 ctrblks[SERPENT_PARALLEL_BLOCKS];
-	u128 *dst = (u128 *)d;
-	const u128 *src = (const u128 *)s;
-	unsigned int i;
-
-	for (i = 0; i < SERPENT_PARALLEL_BLOCKS; i++) {
-		if (dst != src)
-			dst[i] = src[i];
-
-		le128_to_be128(&ctrblks[i], iv);
-		le128_inc(iv);
-	}
-
-	serpent_enc_blk_xway_xor(ctx, (u8 *)dst, (u8 *)ctrblks);
-}
-
 static const struct common_glue_ctx serpent_enc = {
 	.num_funcs = 2,
 	.fpu_blocks_limit = SERPENT_PARALLEL_BLOCKS,
@@ -92,19 +58,6 @@ static const struct common_glue_ctx serpent_enc = {
 	} }
 };
 
-static const struct common_glue_ctx serpent_ctr = {
-	.num_funcs = 2,
-	.fpu_blocks_limit = SERPENT_PARALLEL_BLOCKS,
-
-	.funcs = { {
-		.num_blocks = SERPENT_PARALLEL_BLOCKS,
-		.fn_u = { .ctr = serpent_crypt_ctr_xway }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = serpent_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx serpent_dec = {
 	.num_funcs = 2,
 	.fpu_blocks_limit = SERPENT_PARALLEL_BLOCKS,
@@ -152,11 +105,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&serpent_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&serpent_ctr, req);
-}
-
 static struct skcipher_alg serpent_algs[] = {
 	{
 		.base.cra_name		= "__ecb(serpent)",
@@ -185,21 +133,6 @@ static struct skcipher_alg serpent_algs[] = {
 		.setkey			= serpent_setkey_skcipher,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "__ctr(serpent)",
-		.base.cra_driver_name	= "__ctr-serpent-sse2",
-		.base.cra_priority	= 400,
-		.base.cra_flags		= CRYPTO_ALG_INTERNAL,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct serpent_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= SERPENT_MIN_KEY_SIZE,
-		.max_keysize		= SERPENT_MAX_KEY_SIZE,
-		.ivsize			= SERPENT_BLOCK_SIZE,
-		.chunksize		= SERPENT_BLOCK_SIZE,
-		.setkey			= serpent_setkey_skcipher,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	},
 };
 
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

