Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B357210E2
	for <lists+dm-devel@lfdr.de>; Sat,  3 Jun 2023 17:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685806524;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hS8bx63bwxlcHyb0CACeNzQy6MI0YCwmd3vwGhj/AMo=;
	b=MFIoYgEMvsrIo6kQJnpO/Jh99u3II9WmzsK8Ih7VqnX/SWbbH+qgRMhZgyxxBmQ9NfwVgo
	X1LRyu2sSRZeE3OAC+ILTn78RNICtiZ5zfuo0SZXQ6H1YS5d0HnCiFNhrFKd7C9vEZKYmI
	tv5R9M145BHyNc1zA2uxRkqrMRig/IY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-TJb6x8VlM2CBrbI9zvUF2w-1; Sat, 03 Jun 2023 11:35:21 -0400
X-MC-Unique: TJb6x8VlM2CBrbI9zvUF2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18BFB101A531;
	Sat,  3 Jun 2023 15:35:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD9EC40C6CDD;
	Sat,  3 Jun 2023 15:35:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8E0E19465A0;
	Sat,  3 Jun 2023 15:35:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CA2C1946595
 for <dm-devel@listman.corp.redhat.com>; Sat,  3 Jun 2023 15:35:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 001AE40C6CCC; Sat,  3 Jun 2023 15:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD3840D1B63
 for <dm-devel@redhat.com>; Sat,  3 Jun 2023 15:35:15 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72CA3C02B7D
 for <dm-devel@redhat.com>; Sat,  3 Jun 2023 15:35:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-iiIEr6CXPpy5IP2Eku8f-A-1; Sat, 03 Jun 2023 11:35:11 -0400
X-MC-Unique: iiIEr6CXPpy5IP2Eku8f-A-1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="356097519"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; d="scan'208";a="356097519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2023 08:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="702274281"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; d="scan'208";a="702274281"
Received: from chang-linux-3.sc.intel.com ([172.25.66.173])
 by orsmga007.jf.intel.com with ESMTP; 03 Jun 2023 08:35:09 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dm-devel@redhat.com
Date: Sat,  3 Jun 2023 08:22:26 -0700
Message-Id: <20230603152227.12335-12-chang.seok.bae@intel.com>
In-Reply-To: <20230603152227.12335-1-chang.seok.bae@intel.com>
References: <20230524165717.14062-1-chang.seok.bae@intel.com>
 <20230603152227.12335-1-chang.seok.bae@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH v8 11/12] crypto: x86/aes - Prepare for a new
 AES-XTS implementation
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: x86@kernel.org, herbert@gondor.apana.org.au,
 "David S. Miller" <davem@davemloft.net>, ardb@kernel.org,
 chang.seok.bae@intel.com, dave.hansen@linux.intel.com,
 dan.j.williams@intel.com, mingo@kernel.org, ebiggers@kernel.org,
 lalithambika.krishnakumar@intel.com, Ingo Molnar <mingo@redhat.com>,
 bp@alien8.de, charishma1.gairuboyina@intel.com, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, bernie.keany@intel.com, tglx@linutronix.de,
 nhuck@google.com, gmazyland@gmail.com, elliott@hpe.com
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Key Locker's AES instruction set ('AES-KL') has a similar programming
interface to AES-NI. The internal ABI in the assembly code will have
the same prototype as AES-NI. Then, the glue code will be the same as
AES-NI's.

The new AES code will support the XTS mode alone as disk encryption is
the only intended use case.

Refactor the XTS-related code to avoid code duplication, and also move
some constant values to be shareable. Introduce wrappers for data
transformation functions to return an error code as AES-KL may
populate it.

The refactored code needs to invoke the implementation-specific
functions. Then, while reusable, the code has to be inlined to the
caller to avoid the indirect call for its possible overhead.

Neither functional change nor performance regression is intended.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: x86@kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
Changes from v7:
* Remove aesni_dec() as not referenced by the refactored helpers. But,
  keep the ASM symbol '__aesni_dec' to make it appears consistent with
  its counterpart '__aesni_enc'.
* Call out 'AES-XTS' in the subject.

Changes from v6:
* Inline the helper code to avoid the indirect call. (Eric Biggers)
* Rename the filename: aes-intel* -> aes-helper*. (Eric Biggers)
* Don't export symbols yet here. Instead, do it when needed later.
* Improve the coding style:
  - Follow the symbol convention: '_' -> '__' (Eric Biggers)
  - Fix a style issue -- 'dst = src = ...' catched by checkpatch.pl:
    "CHECK: multiple assignments should be avoided"
* Cleanup: move some define back to AES-NI code as not used by AES-KL

Changes from v5:
* Clean up the staled function definition -- cbc_crypt_common().
* Ensure kernel_fpu_end() for the possible error return from
  xts_crypt_common()->crypt1_fn().

Changes from v4:
* Drop CBC mode changes. (Eric Biggers)

Changes from v3:
* Drop ECB and CTR mode changes. (Eric Biggers)
* Export symbols. (Eric Biggers)

Changes from RFC v2:
* Massage the changelog. (Dan Williams)

Changes from RFC v1:
* Added as a new patch. (Ard Biesheuvel)
  Link:
https://lore.kernel.org/lkml/CAMj1kXGa4f21eH0mdxd1pQsZMUjUr1Btq+Dgw-gC=O-yYft7xw@mail.gmail.com/
---
 arch/x86/crypto/aes-helper_asm.S   |  22 +++
 arch/x86/crypto/aes-helper_glue.h  | 161 ++++++++++++++++++++++
 arch/x86/crypto/aesni-intel_asm.S  |  47 +++----
 arch/x86/crypto/aesni-intel_glue.c | 209 +++++++----------------------
 4 files changed, 249 insertions(+), 190 deletions(-)
 create mode 100644 arch/x86/crypto/aes-helper_asm.S
 create mode 100644 arch/x86/crypto/aes-helper_glue.h

diff --git a/arch/x86/crypto/aes-helper_asm.S b/arch/x86/crypto/aes-helper_asm.S
new file mode 100644
index 000000000000..b31abcdf63cb
--- /dev/null
+++ b/arch/x86/crypto/aes-helper_asm.S
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Constant values shared between AES implementations:
+ */
+
+.pushsection .rodata
+.align 16
+.Lcts_permute_table:
+	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
+	.byte		0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
+	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+.popsection
+
+.section	.rodata.cst16.gf128mul_x_ble_mask, "aM", @progbits, 16
+.align 16
+.Lgf128mul_x_ble_mask:
+	.octa 0x00000000000000010000000000000087
+.previous
diff --git a/arch/x86/crypto/aes-helper_glue.h b/arch/x86/crypto/aes-helper_glue.h
new file mode 100644
index 000000000000..fbb5a70f1e1b
--- /dev/null
+++ b/arch/x86/crypto/aes-helper_glue.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Shared glue code between AES implementations, refactored from the AES-NI's.
+ *
+ * The helper code is inlined for a performance reason. With the mitigation
+ * for speculative executions like retpoline, indirect calls become very
+ * expensive at a cost of measurable overhead.
+ */
+
+#ifndef _AES_INTEL_GLUE_H
+#define _AES_INTEL_GLUE_H
+
+#include <linux/err.h>
+#include <crypto/algapi.h>
+#include <crypto/aes.h>
+#include <crypto/xts.h>
+#include <crypto/scatterwalk.h>
+#include <crypto/internal/aead.h>
+#include <crypto/internal/simd.h>
+
+#define AES_ALIGN		16
+#define AES_ALIGN_ATTR		__attribute__((__aligned__(AES_ALIGN)))
+#define AES_ALIGN_EXTRA		((AES_ALIGN - 1) & ~(CRYPTO_MINALIGN - 1))
+#define XTS_AES_CTX_SIZE	(sizeof(struct aes_xts_ctx) + AES_ALIGN_EXTRA)
+
+struct aes_xts_ctx {
+	struct crypto_aes_ctx tweak_ctx AES_ALIGN_ATTR;
+	struct crypto_aes_ctx crypt_ctx AES_ALIGN_ATTR;
+};
+
+static inline void *aes_align_addr(void *addr)
+{
+	return (crypto_tfm_ctx_alignment() >= AES_ALIGN) ? addr : PTR_ALIGN(addr, AES_ALIGN);
+}
+
+static inline struct aes_xts_ctx *aes_xts_ctx(struct crypto_skcipher *tfm)
+{
+	return (struct aes_xts_ctx *)aes_align_addr(crypto_skcipher_ctx(tfm));
+}
+
+static inline int
+xts_setkey_common(struct crypto_skcipher *tfm, const u8 *key, unsigned int keylen,
+		  int (*fn)(struct crypto_tfm *tfm, void *ctx, const u8 *in_key,
+			    unsigned int key_len))
+{
+	struct aes_xts_ctx *ctx = aes_xts_ctx(tfm);
+	int err;
+
+	err = xts_verify_key(tfm, key, keylen);
+	if (err)
+		return err;
+
+	keylen /= 2;
+
+	/* first half of xts-key is for crypt */
+	err = fn(crypto_skcipher_tfm(tfm), &ctx->crypt_ctx, key, keylen);
+	if (err)
+		return err;
+
+	/* second half of xts-key is for tweak */
+	return fn(crypto_skcipher_tfm(tfm), &ctx->tweak_ctx, key + keylen, keylen);
+}
+
+static inline int
+xts_crypt_common(struct skcipher_request *req,
+		 int (*crypt_fn)(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in,
+				 unsigned int len, u8 *iv),
+		 int (*crypt1_fn)(const void *ctx, u8 *out, const u8 *in))
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct aes_xts_ctx *ctx = aes_xts_ctx(tfm);
+	int tail = req->cryptlen % AES_BLOCK_SIZE;
+	struct skcipher_request subreq;
+	struct skcipher_walk walk;
+	int err;
+
+	if (req->cryptlen < AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	err = skcipher_walk_virt(&walk, req, false);
+	if (!walk.nbytes)
+		return err;
+
+	if (unlikely(tail > 0 && walk.nbytes < walk.total)) {
+		int blocks = DIV_ROUND_UP(req->cryptlen, AES_BLOCK_SIZE) - 2;
+
+		skcipher_walk_abort(&walk);
+
+		skcipher_request_set_tfm(&subreq, tfm);
+		skcipher_request_set_callback(&subreq,
+					      skcipher_request_flags(req),
+					      NULL, NULL);
+		skcipher_request_set_crypt(&subreq, req->src, req->dst,
+					   blocks * AES_BLOCK_SIZE, req->iv);
+		req = &subreq;
+
+		err = skcipher_walk_virt(&walk, req, false);
+		if (!walk.nbytes)
+			return err;
+	} else {
+		tail = 0;
+	}
+
+	kernel_fpu_begin();
+
+	/* calculate first value of T */
+	err = crypt1_fn(&ctx->tweak_ctx, walk.iv, walk.iv);
+	if (err) {
+		kernel_fpu_end();
+		return err;
+	}
+
+	while (walk.nbytes > 0) {
+		int nbytes = walk.nbytes;
+
+		if (nbytes < walk.total)
+			nbytes &= ~(AES_BLOCK_SIZE - 1);
+
+		err = crypt_fn(&ctx->crypt_ctx, walk.dst.virt.addr, walk.src.virt.addr,
+			       nbytes, walk.iv);
+		kernel_fpu_end();
+		if (err)
+			return err;
+
+		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
+
+		if (walk.nbytes > 0)
+			kernel_fpu_begin();
+	}
+
+	if (unlikely(tail > 0 && !err)) {
+		struct scatterlist sg_src[2], sg_dst[2];
+		struct scatterlist *src, *dst;
+
+		src = scatterwalk_ffwd(sg_src, req->src, req->cryptlen);
+		if (req->dst != req->src)
+			dst = scatterwalk_ffwd(sg_dst, req->dst, req->cryptlen);
+		else
+			dst = src;
+
+		skcipher_request_set_crypt(req, src, dst, AES_BLOCK_SIZE + tail,
+					   req->iv);
+
+		err = skcipher_walk_virt(&walk, &subreq, false);
+		if (err)
+			return err;
+
+		kernel_fpu_begin();
+		err = crypt_fn(&ctx->crypt_ctx, walk.dst.virt.addr, walk.src.virt.addr,
+			       walk.nbytes, walk.iv);
+		kernel_fpu_end();
+		if (err)
+			return err;
+
+		err = skcipher_walk_done(&walk, 0);
+	}
+	return err;
+}
+
+#endif /* _AES_INTEL_GLUE_H */
diff --git a/arch/x86/crypto/aesni-intel_asm.S b/arch/x86/crypto/aesni-intel_asm.S
index 3ac7487ecad2..3922d24cae2b 100644
--- a/arch/x86/crypto/aesni-intel_asm.S
+++ b/arch/x86/crypto/aesni-intel_asm.S
@@ -28,6 +28,7 @@
 #include <linux/linkage.h>
 #include <asm/frame.h>
 #include <asm/nospec-branch.h>
+#include "aes-helper_asm.S"
 
 /*
  * The following macros are used to move an (un)aligned 16 byte value to/from
@@ -1935,9 +1936,9 @@ SYM_FUNC_START(aesni_set_key)
 SYM_FUNC_END(aesni_set_key)
 
 /*
- * void aesni_enc(const void *ctx, u8 *dst, const u8 *src)
+ * void __aesni_enc(const void *ctx, u8 *dst, const u8 *src)
  */
-SYM_FUNC_START(aesni_enc)
+SYM_FUNC_START(__aesni_enc)
 	FRAME_BEGIN
 #ifndef __x86_64__
 	pushl KEYP
@@ -1956,7 +1957,7 @@ SYM_FUNC_START(aesni_enc)
 #endif
 	FRAME_END
 	RET
-SYM_FUNC_END(aesni_enc)
+SYM_FUNC_END(__aesni_enc)
 
 /*
  * _aesni_enc1:		internal ABI
@@ -2124,9 +2125,9 @@ SYM_FUNC_START_LOCAL(_aesni_enc4)
 SYM_FUNC_END(_aesni_enc4)
 
 /*
- * void aesni_dec (const void *ctx, u8 *dst, const u8 *src)
+ * void __aesni_dec (const void *ctx, u8 *dst, const u8 *src)
  */
-SYM_FUNC_START(aesni_dec)
+SYM_FUNC_START(__aesni_dec)
 	FRAME_BEGIN
 #ifndef __x86_64__
 	pushl KEYP
@@ -2146,7 +2147,7 @@ SYM_FUNC_START(aesni_dec)
 #endif
 	FRAME_END
 	RET
-SYM_FUNC_END(aesni_dec)
+SYM_FUNC_END(__aesni_dec)
 
 /*
  * _aesni_dec1:		internal ABI
@@ -2689,22 +2690,14 @@ SYM_FUNC_START(aesni_cts_cbc_dec)
 	RET
 SYM_FUNC_END(aesni_cts_cbc_dec)
 
+#ifdef __x86_64__
+
 .pushsection .rodata
 .align 16
-.Lcts_permute_table:
-	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
-	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
-	.byte		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
-	.byte		0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
-	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
-	.byte		0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
-#ifdef __x86_64__
 .Lbswap_mask:
 	.byte 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
-#endif
 .popsection
 
-#ifdef __x86_64__
 /*
  * _aesni_inc_init:	internal ABI
  *	setup registers used by _aesni_inc
@@ -2819,12 +2812,6 @@ SYM_FUNC_END(aesni_ctr_enc)
 
 #endif
 
-.section	.rodata.cst16.gf128mul_x_ble_mask, "aM", @progbits, 16
-.align 16
-.Lgf128mul_x_ble_mask:
-	.octa 0x00000000000000010000000000000087
-.previous
-
 /*
  * _aesni_gf128mul_x_ble:		internal ABI
  *	Multiply in GF(2^128) for XTS IVs
@@ -2844,10 +2831,10 @@ SYM_FUNC_END(aesni_ctr_enc)
 	pxor KEY, IV;
 
 /*
- * void aesni_xts_encrypt(const struct crypto_aes_ctx *ctx, u8 *dst,
- *			  const u8 *src, unsigned int len, le128 *iv)
+ * void __aesni_xts_encrypt(const struct crypto_aes_ctx *ctx, u8 *dst,
+ *			    const u8 *src, unsigned int len, le128 *iv)
  */
-SYM_FUNC_START(aesni_xts_encrypt)
+SYM_FUNC_START(__aesni_xts_encrypt)
 	FRAME_BEGIN
 #ifndef __x86_64__
 	pushl IVP
@@ -2996,13 +2983,13 @@ SYM_FUNC_START(aesni_xts_encrypt)
 
 	movups STATE, (OUTP)
 	jmp .Lxts_enc_ret
-SYM_FUNC_END(aesni_xts_encrypt)
+SYM_FUNC_END(__aesni_xts_encrypt)
 
 /*
- * void aesni_xts_decrypt(const struct crypto_aes_ctx *ctx, u8 *dst,
- *			  const u8 *src, unsigned int len, le128 *iv)
+ * void __aesni_xts_decrypt(const struct crypto_aes_ctx *ctx, u8 *dst,
+ *			    const u8 *src, unsigned int len, le128 *iv)
  */
-SYM_FUNC_START(aesni_xts_decrypt)
+SYM_FUNC_START(__aesni_xts_decrypt)
 	FRAME_BEGIN
 #ifndef __x86_64__
 	pushl IVP
@@ -3158,4 +3145,4 @@ SYM_FUNC_START(aesni_xts_decrypt)
 
 	movups STATE, (OUTP)
 	jmp .Lxts_dec_ret
-SYM_FUNC_END(aesni_xts_decrypt)
+SYM_FUNC_END(__aesni_xts_decrypt)
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 589648142c17..518f48f3bd6b 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -36,33 +36,25 @@
 #include <linux/spinlock.h>
 #include <linux/static_call.h>
 
+#include "aes-helper_glue.h"
 
-#define AESNI_ALIGN	16
-#define AESNI_ALIGN_ATTR __attribute__ ((__aligned__(AESNI_ALIGN)))
-#define AES_BLOCK_MASK	(~(AES_BLOCK_SIZE - 1))
 #define RFC4106_HASH_SUBKEY_SIZE 16
-#define AESNI_ALIGN_EXTRA ((AESNI_ALIGN - 1) & ~(CRYPTO_MINALIGN - 1))
-#define CRYPTO_AES_CTX_SIZE (sizeof(struct crypto_aes_ctx) + AESNI_ALIGN_EXTRA)
-#define XTS_AES_CTX_SIZE (sizeof(struct aesni_xts_ctx) + AESNI_ALIGN_EXTRA)
+#define AES_BLOCK_MASK (~(AES_BLOCK_SIZE - 1))
+#define CRYPTO_AES_CTX_SIZE (sizeof(struct crypto_aes_ctx) + AES_ALIGN_EXTRA)
 
 /* This data is stored at the end of the crypto_tfm struct.
  * It's a type of per "session" data storage location.
  * This needs to be 16 byte aligned.
  */
 struct aesni_rfc4106_gcm_ctx {
-	u8 hash_subkey[16] AESNI_ALIGN_ATTR;
-	struct crypto_aes_ctx aes_key_expanded AESNI_ALIGN_ATTR;
+	u8 hash_subkey[16] AES_ALIGN_ATTR;
+	struct crypto_aes_ctx aes_key_expanded AES_ALIGN_ATTR;
 	u8 nonce[4];
 };
 
 struct generic_gcmaes_ctx {
-	u8 hash_subkey[16] AESNI_ALIGN_ATTR;
-	struct crypto_aes_ctx aes_key_expanded AESNI_ALIGN_ATTR;
-};
-
-struct aesni_xts_ctx {
-	struct crypto_aes_ctx tweak_ctx AESNI_ALIGN_ATTR;
-	struct crypto_aes_ctx crypt_ctx AESNI_ALIGN_ATTR;
+	u8 hash_subkey[16] AES_ALIGN_ATTR;
+	struct crypto_aes_ctx aes_key_expanded AES_ALIGN_ATTR;
 };
 
 #define GCM_BLOCK_LEN 16
@@ -80,17 +72,10 @@ struct gcm_context_data {
 	u8 hash_keys[GCM_BLOCK_LEN * 16];
 };
 
-static inline void *aes_align_addr(void *addr)
-{
-	if (crypto_tfm_ctx_alignment() >= AESNI_ALIGN)
-		return addr;
-	return PTR_ALIGN(addr, AESNI_ALIGN);
-}
-
 asmlinkage int aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
 			     unsigned int key_len);
-asmlinkage void aesni_enc(const void *ctx, u8 *out, const u8 *in);
-asmlinkage void aesni_dec(const void *ctx, u8 *out, const u8 *in);
+asmlinkage void __aesni_enc(const void *ctx, u8 *out, const u8 *in);
+asmlinkage void __aesni_dec(const void *ctx, u8 *out, const u8 *in);
 asmlinkage void aesni_ecb_enc(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len);
 asmlinkage void aesni_ecb_dec(struct crypto_aes_ctx *ctx, u8 *out,
@@ -104,14 +89,34 @@ asmlinkage void aesni_cts_cbc_enc(struct crypto_aes_ctx *ctx, u8 *out,
 asmlinkage void aesni_cts_cbc_dec(struct crypto_aes_ctx *ctx, u8 *out,
 				  const u8 *in, unsigned int len, u8 *iv);
 
+static int aesni_enc(const void *ctx, u8 *out, const u8 *in)
+{
+	__aesni_enc(ctx, out, in);
+	return 0;
+}
+
 #define AVX_GEN2_OPTSIZE 640
 #define AVX_GEN4_OPTSIZE 4096
 
-asmlinkage void aesni_xts_encrypt(const struct crypto_aes_ctx *ctx, u8 *out,
-				  const u8 *in, unsigned int len, u8 *iv);
+asmlinkage void __aesni_xts_encrypt(const struct crypto_aes_ctx *ctx, u8 *out,
+				    const u8 *in, unsigned int len, u8 *iv);
 
-asmlinkage void aesni_xts_decrypt(const struct crypto_aes_ctx *ctx, u8 *out,
-				  const u8 *in, unsigned int len, u8 *iv);
+asmlinkage void __aesni_xts_decrypt(const struct crypto_aes_ctx *ctx, u8 *out,
+				    const u8 *in, unsigned int len, u8 *iv);
+
+static int aesni_xts_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in,
+			     unsigned int len, u8 *iv)
+{
+	__aesni_xts_encrypt(ctx, out, in, len, iv);
+	return 0;
+}
+
+static int aesni_xts_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in,
+			     unsigned int len, u8 *iv)
+{
+	__aesni_xts_decrypt(ctx, out, in, len, iv);
+	return 0;
+}
 
 #ifdef CONFIG_X86_64
 
@@ -223,11 +228,6 @@ static inline struct crypto_aes_ctx *aes_ctx(void *raw_ctx)
 	return (struct crypto_aes_ctx *)aes_align_addr(raw_ctx);
 }
 
-static inline struct aesni_xts_ctx *aes_xts_ctx(struct crypto_skcipher *tfm)
-{
-	return (struct aesni_xts_ctx *)aes_align_addr(crypto_skcipher_ctx(tfm));
-}
-
 static int aes_set_key_common(struct crypto_tfm *tfm, void *raw_ctx,
 			      const u8 *in_key, unsigned int key_len)
 {
@@ -263,7 +263,7 @@ static void aesni_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
 		aes_encrypt(ctx, dst, src);
 	} else {
 		kernel_fpu_begin();
-		aesni_enc(ctx, dst, src);
+		__aesni_enc(ctx, dst, src);
 		kernel_fpu_end();
 	}
 }
@@ -276,7 +276,7 @@ static void aesni_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
 		aes_decrypt(ctx, dst, src);
 	} else {
 		kernel_fpu_begin();
-		aesni_dec(ctx, dst, src);
+		__aesni_dec(ctx, dst, src);
 		kernel_fpu_end();
 	}
 }
@@ -527,7 +527,7 @@ static int ctr_crypt(struct skcipher_request *req)
 		nbytes &= ~AES_BLOCK_MASK;
 
 		if (walk.nbytes == walk.total && nbytes > 0) {
-			aesni_enc(ctx, keystream, walk.iv);
+			__aesni_enc(ctx, keystream, walk.iv);
 			crypto_xor_cpy(walk.dst.virt.addr + walk.nbytes - nbytes,
 				       walk.src.virt.addr + walk.nbytes - nbytes,
 				       keystream, nbytes);
@@ -672,8 +672,8 @@ static int gcmaes_crypt_by_sg(bool enc, struct aead_request *req,
 			      u8 *iv, void *aes_ctx, u8 *auth_tag,
 			      unsigned long auth_tag_len)
 {
-	u8 databuf[sizeof(struct gcm_context_data) + (AESNI_ALIGN - 8)] __aligned(8);
-	struct gcm_context_data *data = PTR_ALIGN((void *)databuf, AESNI_ALIGN);
+	u8 databuf[sizeof(struct gcm_context_data) + (AES_ALIGN - 8)] __aligned(8);
+	struct gcm_context_data *data = PTR_ALIGN((void *)databuf, AES_ALIGN);
 	unsigned long left = req->cryptlen;
 	struct scatter_walk assoc_sg_walk;
 	struct skcipher_walk walk;
@@ -828,8 +828,8 @@ static int helper_rfc4106_encrypt(struct aead_request *req)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct aesni_rfc4106_gcm_ctx *ctx = aesni_rfc4106_gcm_ctx_get(tfm);
 	void *aes_ctx = &(ctx->aes_key_expanded);
-	u8 ivbuf[16 + (AESNI_ALIGN - 8)] __aligned(8);
-	u8 *iv = PTR_ALIGN(&ivbuf[0], AESNI_ALIGN);
+	u8 ivbuf[16 + (AES_ALIGN - 8)] __aligned(8);
+	u8 *iv = PTR_ALIGN(&ivbuf[0], AES_ALIGN);
 	unsigned int i;
 	__be32 counter = cpu_to_be32(1);
 
@@ -856,8 +856,8 @@ static int helper_rfc4106_decrypt(struct aead_request *req)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct aesni_rfc4106_gcm_ctx *ctx = aesni_rfc4106_gcm_ctx_get(tfm);
 	void *aes_ctx = &(ctx->aes_key_expanded);
-	u8 ivbuf[16 + (AESNI_ALIGN - 8)] __aligned(8);
-	u8 *iv = PTR_ALIGN(&ivbuf[0], AESNI_ALIGN);
+	u8 ivbuf[16 + (AES_ALIGN - 8)] __aligned(8);
+	u8 *iv = PTR_ALIGN(&ivbuf[0], AES_ALIGN);
 	unsigned int i;
 
 	if (unlikely(req->assoclen != 16 && req->assoclen != 20))
@@ -882,128 +882,17 @@ static int helper_rfc4106_decrypt(struct aead_request *req)
 static int xts_aesni_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			    unsigned int keylen)
 {
-	struct aesni_xts_ctx *ctx = aes_xts_ctx(tfm);
-	int err;
-
-	err = xts_verify_key(tfm, key, keylen);
-	if (err)
-		return err;
-
-	keylen /= 2;
-
-	/* first half of xts-key is for crypt */
-	err = aes_set_key_common(crypto_skcipher_tfm(tfm), &ctx->crypt_ctx,
-				 key, keylen);
-	if (err)
-		return err;
-
-	/* second half of xts-key is for tweak */
-	return aes_set_key_common(crypto_skcipher_tfm(tfm), &ctx->tweak_ctx,
-				  key + keylen, keylen);
-}
-
-static int xts_crypt(struct skcipher_request *req, bool encrypt)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct aesni_xts_ctx *ctx = aes_xts_ctx(tfm);
-	int tail = req->cryptlen % AES_BLOCK_SIZE;
-	struct skcipher_request subreq;
-	struct skcipher_walk walk;
-	int err;
-
-	if (req->cryptlen < AES_BLOCK_SIZE)
-		return -EINVAL;
-
-	err = skcipher_walk_virt(&walk, req, false);
-	if (!walk.nbytes)
-		return err;
-
-	if (unlikely(tail > 0 && walk.nbytes < walk.total)) {
-		int blocks = DIV_ROUND_UP(req->cryptlen, AES_BLOCK_SIZE) - 2;
-
-		skcipher_walk_abort(&walk);
-
-		skcipher_request_set_tfm(&subreq, tfm);
-		skcipher_request_set_callback(&subreq,
-					      skcipher_request_flags(req),
-					      NULL, NULL);
-		skcipher_request_set_crypt(&subreq, req->src, req->dst,
-					   blocks * AES_BLOCK_SIZE, req->iv);
-		req = &subreq;
-
-		err = skcipher_walk_virt(&walk, req, false);
-		if (!walk.nbytes)
-			return err;
-	} else {
-		tail = 0;
-	}
-
-	kernel_fpu_begin();
-
-	/* calculate first value of T */
-	aesni_enc(&ctx->tweak_ctx, walk.iv, walk.iv);
-
-	while (walk.nbytes > 0) {
-		int nbytes = walk.nbytes;
-
-		if (nbytes < walk.total)
-			nbytes &= ~(AES_BLOCK_SIZE - 1);
-
-		if (encrypt)
-			aesni_xts_encrypt(&ctx->crypt_ctx,
-					  walk.dst.virt.addr, walk.src.virt.addr,
-					  nbytes, walk.iv);
-		else
-			aesni_xts_decrypt(&ctx->crypt_ctx,
-					  walk.dst.virt.addr, walk.src.virt.addr,
-					  nbytes, walk.iv);
-		kernel_fpu_end();
-
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-
-		if (walk.nbytes > 0)
-			kernel_fpu_begin();
-	}
-
-	if (unlikely(tail > 0 && !err)) {
-		struct scatterlist sg_src[2], sg_dst[2];
-		struct scatterlist *src, *dst;
-
-		dst = src = scatterwalk_ffwd(sg_src, req->src, req->cryptlen);
-		if (req->dst != req->src)
-			dst = scatterwalk_ffwd(sg_dst, req->dst, req->cryptlen);
-
-		skcipher_request_set_crypt(req, src, dst, AES_BLOCK_SIZE + tail,
-					   req->iv);
-
-		err = skcipher_walk_virt(&walk, &subreq, false);
-		if (err)
-			return err;
-
-		kernel_fpu_begin();
-		if (encrypt)
-			aesni_xts_encrypt(&ctx->crypt_ctx,
-					  walk.dst.virt.addr, walk.src.virt.addr,
-					  walk.nbytes, walk.iv);
-		else
-			aesni_xts_decrypt(&ctx->crypt_ctx,
-					  walk.dst.virt.addr, walk.src.virt.addr,
-					  walk.nbytes, walk.iv);
-		kernel_fpu_end();
-
-		err = skcipher_walk_done(&walk, 0);
-	}
-	return err;
+	return xts_setkey_common(tfm, key, keylen, aes_set_key_common);
 }
 
 static int xts_encrypt(struct skcipher_request *req)
 {
-	return xts_crypt(req, true);
+	return xts_crypt_common(req, aesni_xts_encrypt, aesni_enc);
 }
 
 static int xts_decrypt(struct skcipher_request *req)
 {
-	return xts_crypt(req, false);
+	return xts_crypt_common(req, aesni_xts_decrypt, aesni_enc);
 }
 
 static struct crypto_alg aesni_cipher_alg = {
@@ -1159,8 +1048,8 @@ static int generic_gcmaes_encrypt(struct aead_request *req)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct generic_gcmaes_ctx *ctx = generic_gcmaes_ctx_get(tfm);
 	void *aes_ctx = &(ctx->aes_key_expanded);
-	u8 ivbuf[16 + (AESNI_ALIGN - 8)] __aligned(8);
-	u8 *iv = PTR_ALIGN(&ivbuf[0], AESNI_ALIGN);
+	u8 ivbuf[16 + (AES_ALIGN - 8)] __aligned(8);
+	u8 *iv = PTR_ALIGN(&ivbuf[0], AES_ALIGN);
 	__be32 counter = cpu_to_be32(1);
 
 	memcpy(iv, req->iv, 12);
@@ -1176,8 +1065,8 @@ static int generic_gcmaes_decrypt(struct aead_request *req)
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
 	struct generic_gcmaes_ctx *ctx = generic_gcmaes_ctx_get(tfm);
 	void *aes_ctx = &(ctx->aes_key_expanded);
-	u8 ivbuf[16 + (AESNI_ALIGN - 8)] __aligned(8);
-	u8 *iv = PTR_ALIGN(&ivbuf[0], AESNI_ALIGN);
+	u8 ivbuf[16 + (AES_ALIGN - 8)] __aligned(8);
+	u8 *iv = PTR_ALIGN(&ivbuf[0], AES_ALIGN);
 
 	memcpy(iv, req->iv, 12);
 	*((__be32 *)(iv+12)) = counter;
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

