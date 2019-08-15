Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7308F49C
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 21:30:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE743084242;
	Thu, 15 Aug 2019 19:30:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3026B1000329;
	Thu, 15 Aug 2019 19:30:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A51F82551D;
	Thu, 15 Aug 2019 19:30:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FJTOlK018954 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 15:29:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 387CD10001BB; Thu, 15 Aug 2019 19:29:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330D41001B17
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 19:29:21 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 940DF308A968
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 19:29:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z1so3156496wru.13
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=huVoFUpMc5dzWwrmJm9Qwvn6MCUViGlDp2QJ3557fZk=;
	b=noy61VfHR7U2BgfdW30pqSNYezEMOuuESP7Kxt2spwIyqZclbrVt9uq/fnWCA/55Tt
	0lYC7xcVVxwpwPaDm3iZlXreSOgQH4g2HroXrWABayTOOld+C/YNV2RxNATK3TbjO4BH
	DK7hrEqLdVOHt5kRdB8ae9zmJFbgttdLBJX/oilIiW9DmEyFyETFNZcjAnbztc7kEwcc
	JCnD2EP01sCpQJ0udZjkIapv/e+QkwO4u8xFnOAORqVMvnzofA36yHoD/c8wo8csmHDL
	rbH+FGMMgW9QwBwl6uURBhwHPectNJTWNSdGO5MdjX48I3gLO6q0gL9FbGwdmiVujIGU
	OIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=huVoFUpMc5dzWwrmJm9Qwvn6MCUViGlDp2QJ3557fZk=;
	b=bmbNyflXBXl7+gPOuWYCPKRkc0ULiPyJAuNS/c9U1MQ2ZDlBUw6gsltz+BrnASMUpl
	y+ghuRJp9e9/zwuv0K5oSWrGw43O5+2EeQmH5U4HESpSOqMhiF8rPRPlU2L65OoDoLLR
	dc57xtGWvcsX/jGAB20KSqMUrmPrx3/WxWTLP8BisT26czbkqUDu9NaZocXtt2x35WbM
	/nG+jdYpXX72DTzD0ILZp2lPGQ9d0HSvDULPcjkXLyks7Lt3zcgy0Iz001JBU0FJ7t8R
	LqjJh95LGY+t4TWd1eVOxM/XgX7vt09qnUJVE1i+XivXIeONTcpbIqDLR9oYXqG5Nzdp
	mHmA==
X-Gm-Message-State: APjAAAXfOLoyRXKLmRD67bWB1a8QnDLg9rjX0Ef0KRJq1ah6nvmFVSIn
	YQn3KEeh5dK8ygt22nwAzax7xA9JoCfd6hyj
X-Google-Smtp-Source: APXvYqyxxP92ZNffa1tenVrrYKVzTdqCcngjq2SfLrGaHgkvzoJ8IGTCxq1wAiw2sJzRBVnTO3NjwQ==
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr6966623wrn.324.1565897359259; 
	Thu, 15 Aug 2019 12:29:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:f1b5:e68c:5f7f:79e7])
	by smtp.gmail.com with ESMTPSA id h9sm2949063wrt.53.2019.08.15.12.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 12:29:18 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Thu, 15 Aug 2019 22:28:57 +0300
Message-Id: <20190815192858.28125-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 15 Aug 2019 19:29:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Thu, 15 Aug 2019 19:29:20 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.363  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v12 3/4] crypto: arm64/aes-cts-cbc - factor out
	CBC en/decryption of a walk
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 15 Aug 2019 19:30:17 +0000 (UTC)

The plain CBC driver and the CTS one share some code that iterates over
a scatterwalk and invokes the CBC asm code to do the processing. The
upcoming ESSIV/CBC mode will clone that pattern for the third time, so
let's factor it out first.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm64/crypto/aes-glue.c | 82 ++++++++++----------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index 55d6d4838708..23abf335f1ee 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -186,46 +186,64 @@ static int ecb_decrypt(struct skcipher_request *req)
 	return err;
 }
 
-static int cbc_encrypt(struct skcipher_request *req)
+static int cbc_encrypt_walk(struct skcipher_request *req,
+			    struct skcipher_walk *walk)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int err, rounds = 6 + ctx->key_length / 4;
-	struct skcipher_walk walk;
+	int err = 0, rounds = 6 + ctx->key_length / 4;
 	unsigned int blocks;
 
-	err = skcipher_walk_virt(&walk, req, false);
-
-	while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
+	while ((blocks = (walk->nbytes / AES_BLOCK_SIZE))) {
 		kernel_neon_begin();
-		aes_cbc_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_enc, rounds, blocks, walk.iv);
+		aes_cbc_encrypt(walk->dst.virt.addr, walk->src.virt.addr,
+				ctx->key_enc, rounds, blocks, walk->iv);
 		kernel_neon_end();
-		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
+		err = skcipher_walk_done(walk, walk->nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
 }
 
-static int cbc_decrypt(struct skcipher_request *req)
+static int cbc_encrypt(struct skcipher_request *req)
 {
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int err, rounds = 6 + ctx->key_length / 4;
 	struct skcipher_walk walk;
-	unsigned int blocks;
+	int err;
 
 	err = skcipher_walk_virt(&walk, req, false);
+	if (err)
+		return err;
+	return cbc_encrypt_walk(req, &walk);
+}
 
-	while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
+static int cbc_decrypt_walk(struct skcipher_request *req,
+			    struct skcipher_walk *walk)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	int err = 0, rounds = 6 + ctx->key_length / 4;
+	unsigned int blocks;
+
+	while ((blocks = (walk->nbytes / AES_BLOCK_SIZE))) {
 		kernel_neon_begin();
-		aes_cbc_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_dec, rounds, blocks, walk.iv);
+		aes_cbc_decrypt(walk->dst.virt.addr, walk->src.virt.addr,
+				ctx->key_dec, rounds, blocks, walk->iv);
 		kernel_neon_end();
-		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
+		err = skcipher_walk_done(walk, walk->nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
 }
 
+static int cbc_decrypt(struct skcipher_request *req)
+{
+	struct skcipher_walk walk;
+	int err;
+
+	err = skcipher_walk_virt(&walk, req, false);
+	if (err)
+		return err;
+	return cbc_decrypt_walk(req, &walk);
+}
+
 static int cts_cbc_init_tfm(struct crypto_skcipher *tfm)
 {
 	crypto_skcipher_set_reqsize(tfm, sizeof(struct cts_cbc_req_ctx));
@@ -251,22 +269,12 @@ static int cts_cbc_encrypt(struct skcipher_request *req)
 	}
 
 	if (cbc_blocks > 0) {
-		unsigned int blocks;
-
 		skcipher_request_set_crypt(&rctx->subreq, req->src, req->dst,
 					   cbc_blocks * AES_BLOCK_SIZE,
 					   req->iv);
 
-		err = skcipher_walk_virt(&walk, &rctx->subreq, false);
-
-		while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
-			kernel_neon_begin();
-			aes_cbc_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-					ctx->key_enc, rounds, blocks, walk.iv);
-			kernel_neon_end();
-			err = skcipher_walk_done(&walk,
-						 walk.nbytes % AES_BLOCK_SIZE);
-		}
+		err = skcipher_walk_virt(&walk, &rctx->subreq, false) ?:
+		      cbc_encrypt_walk(&rctx->subreq, &walk);
 		if (err)
 			return err;
 
@@ -316,22 +324,12 @@ static int cts_cbc_decrypt(struct skcipher_request *req)
 	}
 
 	if (cbc_blocks > 0) {
-		unsigned int blocks;
-
 		skcipher_request_set_crypt(&rctx->subreq, req->src, req->dst,
 					   cbc_blocks * AES_BLOCK_SIZE,
 					   req->iv);
 
-		err = skcipher_walk_virt(&walk, &rctx->subreq, false);
-
-		while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
-			kernel_neon_begin();
-			aes_cbc_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-					ctx->key_dec, rounds, blocks, walk.iv);
-			kernel_neon_end();
-			err = skcipher_walk_done(&walk,
-						 walk.nbytes % AES_BLOCK_SIZE);
-		}
+		err = skcipher_walk_virt(&walk, &rctx->subreq, false) ?:
+		      cbc_decrypt_walk(&rctx->subreq, &walk);
 		if (err)
 			return err;
 
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
