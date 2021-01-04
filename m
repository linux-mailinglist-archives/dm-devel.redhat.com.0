Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9F72E9DAF
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:03:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-suR3S2HrO066eJaM-p8bRw-1; Mon, 04 Jan 2021 14:03:47 -0500
X-MC-Unique: suR3S2HrO066eJaM-p8bRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 854CB8144F1;
	Mon,  4 Jan 2021 19:03:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E0B3614F5;
	Mon,  4 Jan 2021 19:03:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E04FD1809CA5;
	Mon,  4 Jan 2021 19:03:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BNMlxdr014970 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Dec 2020 17:48:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4E162026D3A; Wed, 23 Dec 2020 22:47:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D01862026D48
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 22:47:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7691800198
	for <dm-devel@redhat.com>; Wed, 23 Dec 2020 22:47:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-422-5dCtkaI4P9ymLylp_Pz62Q-1;
	Wed, 23 Dec 2020 17:47:55 -0500
X-MC-Unique: 5dCtkaI4P9ymLylp_Pz62Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5C1C22518;
	Wed, 23 Dec 2020 22:39:13 +0000 (UTC)
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 23 Dec 2020 23:38:37 +0100
Message-Id: <20201223223841.11311-7-ardb@kernel.org>
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
Subject: [dm-devel] [RFC PATCH 06/10] crypto: x86/camellia - drop CTR mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Camellia in CTR mode is never used by the kernel directly, and is highly
unlikely to be relied upon by dm-crypt or algif_skcipher. So let's drop
the accelerated CTR mode implementation, and instead, rely on the CTR
template and the bare cipher.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/crypto/camellia-aesni-avx-asm_64.S  | 117 ----------------
 arch/x86/crypto/camellia-aesni-avx2-asm_64.S | 144 --------------------
 arch/x86/crypto/camellia_aesni_avx2_glue.c   |  41 ------
 arch/x86/crypto/camellia_aesni_avx_glue.c    |  40 ------
 arch/x86/crypto/camellia_glue.c              |  68 ---------
 arch/x86/include/asm/crypto/camellia.h       |   6 -
 6 files changed, 416 deletions(-)

diff --git a/arch/x86/crypto/camellia-aesni-avx-asm_64.S b/arch/x86/crypto/camellia-aesni-avx-asm_64.S
index 1e0383a84247..ccac3822f4ea 100644
--- a/arch/x86/crypto/camellia-aesni-avx-asm_64.S
+++ b/arch/x86/crypto/camellia-aesni-avx-asm_64.S
@@ -589,10 +589,6 @@ SYM_FUNC_END(roundsm16_x4_x5_x6_x7_x0_x1_x2_x3_y4_y5_y6_y7_y0_y1_y2_y3_ab)
 	.long 0x80808080
 	.long 0x80808080
 
-/* For CTR-mode IV byteswap */
-.Lbswap128_mask:
-	.byte 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
-
 /*
  * pre-SubByte transform
  *
@@ -994,116 +990,3 @@ SYM_FUNC_START(camellia_cbc_dec_16way)
 	FRAME_END
 	ret;
 SYM_FUNC_END(camellia_cbc_dec_16way)
-
-#define inc_le128(x, minus_one, tmp) \
-	vpcmpeqq minus_one, x, tmp; \
-	vpsubq minus_one, x, x; \
-	vpslldq $8, tmp, tmp; \
-	vpsubq tmp, x, x;
-
-SYM_FUNC_START(camellia_ctr_16way)
-	/* input:
-	 *	%rdi: ctx, CTX
-	 *	%rsi: dst (16 blocks)
-	 *	%rdx: src (16 blocks)
-	 *	%rcx: iv (little endian, 128bit)
-	 */
-	FRAME_BEGIN
-
-	subq $(16 * 16), %rsp;
-	movq %rsp, %rax;
-
-	vmovdqa .Lbswap128_mask, %xmm14;
-
-	/* load IV and byteswap */
-	vmovdqu (%rcx), %xmm0;
-	vpshufb %xmm14, %xmm0, %xmm15;
-	vmovdqu %xmm15, 15 * 16(%rax);
-
-	vpcmpeqd %xmm15, %xmm15, %xmm15;
-	vpsrldq $8, %xmm15, %xmm15; /* low: -1, high: 0 */
-
-	/* construct IVs */
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm13;
-	vmovdqu %xmm13, 14 * 16(%rax);
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm13;
-	vmovdqu %xmm13, 13 * 16(%rax);
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm12;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm11;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm10;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm9;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm8;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm7;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm6;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm5;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm4;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm3;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm2;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vpshufb %xmm14, %xmm0, %xmm1;
-	inc_le128(%xmm0, %xmm15, %xmm13);
-	vmovdqa %xmm0, %xmm13;
-	vpshufb %xmm14, %xmm0, %xmm0;
-	inc_le128(%xmm13, %xmm15, %xmm14);
-	vmovdqu %xmm13, (%rcx);
-
-	/* inpack16_pre: */
-	vmovq (key_table)(CTX), %xmm15;
-	vpshufb .Lpack_bswap, %xmm15, %xmm15;
-	vpxor %xmm0, %xmm15, %xmm0;
-	vpxor %xmm1, %xmm15, %xmm1;
-	vpxor %xmm2, %xmm15, %xmm2;
-	vpxor %xmm3, %xmm15, %xmm3;
-	vpxor %xmm4, %xmm15, %xmm4;
-	vpxor %xmm5, %xmm15, %xmm5;
-	vpxor %xmm6, %xmm15, %xmm6;
-	vpxor %xmm7, %xmm15, %xmm7;
-	vpxor %xmm8, %xmm15, %xmm8;
-	vpxor %xmm9, %xmm15, %xmm9;
-	vpxor %xmm10, %xmm15, %xmm10;
-	vpxor %xmm11, %xmm15, %xmm11;
-	vpxor %xmm12, %xmm15, %xmm12;
-	vpxor 13 * 16(%rax), %xmm15, %xmm13;
-	vpxor 14 * 16(%rax), %xmm15, %xmm14;
-	vpxor 15 * 16(%rax), %xmm15, %xmm15;
-
-	call __camellia_enc_blk16;
-
-	addq $(16 * 16), %rsp;
-
-	vpxor 0 * 16(%rdx), %xmm7, %xmm7;
-	vpxor 1 * 16(%rdx), %xmm6, %xmm6;
-	vpxor 2 * 16(%rdx), %xmm5, %xmm5;
-	vpxor 3 * 16(%rdx), %xmm4, %xmm4;
-	vpxor 4 * 16(%rdx), %xmm3, %xmm3;
-	vpxor 5 * 16(%rdx), %xmm2, %xmm2;
-	vpxor 6 * 16(%rdx), %xmm1, %xmm1;
-	vpxor 7 * 16(%rdx), %xmm0, %xmm0;
-	vpxor 8 * 16(%rdx), %xmm15, %xmm15;
-	vpxor 9 * 16(%rdx), %xmm14, %xmm14;
-	vpxor 10 * 16(%rdx), %xmm13, %xmm13;
-	vpxor 11 * 16(%rdx), %xmm12, %xmm12;
-	vpxor 12 * 16(%rdx), %xmm11, %xmm11;
-	vpxor 13 * 16(%rdx), %xmm10, %xmm10;
-	vpxor 14 * 16(%rdx), %xmm9, %xmm9;
-	vpxor 15 * 16(%rdx), %xmm8, %xmm8;
-	write_output(%xmm7, %xmm6, %xmm5, %xmm4, %xmm3, %xmm2, %xmm1, %xmm0,
-		     %xmm15, %xmm14, %xmm13, %xmm12, %xmm11, %xmm10, %xmm9,
-		     %xmm8, %rsi);
-
-	FRAME_END
-	ret;
-SYM_FUNC_END(camellia_ctr_16way)
diff --git a/arch/x86/crypto/camellia-aesni-avx2-asm_64.S b/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
index 432bfaf54ff9..963e04cd66b0 100644
--- a/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
+++ b/arch/x86/crypto/camellia-aesni-avx2-asm_64.S
@@ -625,10 +625,6 @@ SYM_FUNC_END(roundsm32_x4_x5_x6_x7_x0_x1_x2_x3_y4_y5_y6_y7_y0_y1_y2_y3_ab)
 .section	.rodata.cst16, "aM", @progbits, 16
 .align 16
 
-/* For CTR-mode IV byteswap */
-.Lbswap128_mask:
-	.byte 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
-
 /*
  * pre-SubByte transform
  *
@@ -1055,143 +1051,3 @@ SYM_FUNC_START(camellia_cbc_dec_32way)
 	FRAME_END
 	ret;
 SYM_FUNC_END(camellia_cbc_dec_32way)
-
-#define inc_le128(x, minus_one, tmp) \
-	vpcmpeqq minus_one, x, tmp; \
-	vpsubq minus_one, x, x; \
-	vpslldq $8, tmp, tmp; \
-	vpsubq tmp, x, x;
-
-#define add2_le128(x, minus_one, minus_two, tmp1, tmp2) \
-	vpcmpeqq minus_one, x, tmp1; \
-	vpcmpeqq minus_two, x, tmp2; \
-	vpsubq minus_two, x, x; \
-	vpor tmp2, tmp1, tmp1; \
-	vpslldq $8, tmp1, tmp1; \
-	vpsubq tmp1, x, x;
-
-SYM_FUNC_START(camellia_ctr_32way)
-	/* input:
-	 *	%rdi: ctx, CTX
-	 *	%rsi: dst (32 blocks)
-	 *	%rdx: src (32 blocks)
-	 *	%rcx: iv (little endian, 128bit)
-	 */
-	FRAME_BEGIN
-
-	vzeroupper;
-
-	movq %rsp, %r10;
-	cmpq %rsi, %rdx;
-	je .Lctr_use_stack;
-
-	/* dst can be used as temporary storage, src is not overwritten. */
-	movq %rsi, %rax;
-	jmp .Lctr_continue;
-
-.Lctr_use_stack:
-	subq $(16 * 32), %rsp;
-	movq %rsp, %rax;
-
-.Lctr_continue:
-	vpcmpeqd %ymm15, %ymm15, %ymm15;
-	vpsrldq $8, %ymm15, %ymm15; /* ab: -1:0 ; cd: -1:0 */
-	vpaddq %ymm15, %ymm15, %ymm12; /* ab: -2:0 ; cd: -2:0 */
-
-	/* load IV and byteswap */
-	vmovdqu (%rcx), %xmm0;
-	vmovdqa %xmm0, %xmm1;
-	inc_le128(%xmm0, %xmm15, %xmm14);
-	vbroadcasti128 .Lbswap128_mask, %ymm14;
-	vinserti128 $1, %xmm0, %ymm1, %ymm0;
-	vpshufb %ymm14, %ymm0, %ymm13;
-	vmovdqu %ymm13, 15 * 32(%rax);
-
-	/* construct IVs */
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13); /* ab:le2 ; cd:le3 */
-	vpshufb %ymm14, %ymm0, %ymm13;
-	vmovdqu %ymm13, 14 * 32(%rax);
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm13;
-	vmovdqu %ymm13, 13 * 32(%rax);
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm13;
-	vmovdqu %ymm13, 12 * 32(%rax);
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm13;
-	vmovdqu %ymm13, 11 * 32(%rax);
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm10;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm9;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm8;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm7;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm6;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm5;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm4;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm3;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm2;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vpshufb %ymm14, %ymm0, %ymm1;
-	add2_le128(%ymm0, %ymm15, %ymm12, %ymm11, %ymm13);
-	vextracti128 $1, %ymm0, %xmm13;
-	vpshufb %ymm14, %ymm0, %ymm0;
-	inc_le128(%xmm13, %xmm15, %xmm14);
-	vmovdqu %xmm13, (%rcx);
-
-	/* inpack32_pre: */
-	vpbroadcastq (key_table)(CTX), %ymm15;
-	vpshufb .Lpack_bswap, %ymm15, %ymm15;
-	vpxor %ymm0, %ymm15, %ymm0;
-	vpxor %ymm1, %ymm15, %ymm1;
-	vpxor %ymm2, %ymm15, %ymm2;
-	vpxor %ymm3, %ymm15, %ymm3;
-	vpxor %ymm4, %ymm15, %ymm4;
-	vpxor %ymm5, %ymm15, %ymm5;
-	vpxor %ymm6, %ymm15, %ymm6;
-	vpxor %ymm7, %ymm15, %ymm7;
-	vpxor %ymm8, %ymm15, %ymm8;
-	vpxor %ymm9, %ymm15, %ymm9;
-	vpxor %ymm10, %ymm15, %ymm10;
-	vpxor 11 * 32(%rax), %ymm15, %ymm11;
-	vpxor 12 * 32(%rax), %ymm15, %ymm12;
-	vpxor 13 * 32(%rax), %ymm15, %ymm13;
-	vpxor 14 * 32(%rax), %ymm15, %ymm14;
-	vpxor 15 * 32(%rax), %ymm15, %ymm15;
-
-	call __camellia_enc_blk32;
-
-	movq %r10, %rsp;
-
-	vpxor 0 * 32(%rdx), %ymm7, %ymm7;
-	vpxor 1 * 32(%rdx), %ymm6, %ymm6;
-	vpxor 2 * 32(%rdx), %ymm5, %ymm5;
-	vpxor 3 * 32(%rdx), %ymm4, %ymm4;
-	vpxor 4 * 32(%rdx), %ymm3, %ymm3;
-	vpxor 5 * 32(%rdx), %ymm2, %ymm2;
-	vpxor 6 * 32(%rdx), %ymm1, %ymm1;
-	vpxor 7 * 32(%rdx), %ymm0, %ymm0;
-	vpxor 8 * 32(%rdx), %ymm15, %ymm15;
-	vpxor 9 * 32(%rdx), %ymm14, %ymm14;
-	vpxor 10 * 32(%rdx), %ymm13, %ymm13;
-	vpxor 11 * 32(%rdx), %ymm12, %ymm12;
-	vpxor 12 * 32(%rdx), %ymm11, %ymm11;
-	vpxor 13 * 32(%rdx), %ymm10, %ymm10;
-	vpxor 14 * 32(%rdx), %ymm9, %ymm9;
-	vpxor 15 * 32(%rdx), %ymm8, %ymm8;
-	write_output(%ymm7, %ymm6, %ymm5, %ymm4, %ymm3, %ymm2, %ymm1, %ymm0,
-		     %ymm15, %ymm14, %ymm13, %ymm12, %ymm11, %ymm10, %ymm9,
-		     %ymm8, %rsi);
-
-	vzeroupper;
-
-	FRAME_END
-	ret;
-SYM_FUNC_END(camellia_ctr_32way)
diff --git a/arch/x86/crypto/camellia_aesni_avx2_glue.c b/arch/x86/crypto/camellia_aesni_avx2_glue.c
index d956d0473668..8f25a2a6222e 100644
--- a/arch/x86/crypto/camellia_aesni_avx2_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx2_glue.c
@@ -22,8 +22,6 @@ asmlinkage void camellia_ecb_enc_32way(const void *ctx, u8 *dst, const u8 *src);
 asmlinkage void camellia_ecb_dec_32way(const void *ctx, u8 *dst, const u8 *src);
 
 asmlinkage void camellia_cbc_dec_32way(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void camellia_ctr_32way(const void *ctx, u8 *dst, const u8 *src,
-				   le128 *iv);
 
 static const struct common_glue_ctx camellia_enc = {
 	.num_funcs = 4,
@@ -44,25 +42,6 @@ static const struct common_glue_ctx camellia_enc = {
 	} }
 };
 
-static const struct common_glue_ctx camellia_ctr = {
-	.num_funcs = 4,
-	.fpu_blocks_limit = CAMELLIA_AESNI_PARALLEL_BLOCKS,
-
-	.funcs = { {
-		.num_blocks = CAMELLIA_AESNI_AVX2_PARALLEL_BLOCKS,
-		.fn_u = { .ctr = camellia_ctr_32way }
-	}, {
-		.num_blocks = CAMELLIA_AESNI_PARALLEL_BLOCKS,
-		.fn_u = { .ctr = camellia_ctr_16way }
-	}, {
-		.num_blocks = 2,
-		.fn_u = { .ctr = camellia_crypt_ctr_2way }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = camellia_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx camellia_dec = {
 	.num_funcs = 4,
 	.fpu_blocks_limit = CAMELLIA_AESNI_PARALLEL_BLOCKS,
@@ -127,11 +106,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&camellia_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&camellia_ctr, req);
-}
-
 static struct skcipher_alg camellia_algs[] = {
 	{
 		.base.cra_name		= "__ecb(camellia)",
@@ -160,21 +134,6 @@ static struct skcipher_alg camellia_algs[] = {
 		.setkey			= camellia_setkey,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "__ctr(camellia)",
-		.base.cra_driver_name	= "__ctr-camellia-aesni-avx2",
-		.base.cra_priority	= 500,
-		.base.cra_flags		= CRYPTO_ALG_INTERNAL,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct camellia_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= CAMELLIA_MIN_KEY_SIZE,
-		.max_keysize		= CAMELLIA_MAX_KEY_SIZE,
-		.ivsize			= CAMELLIA_BLOCK_SIZE,
-		.chunksize		= CAMELLIA_BLOCK_SIZE,
-		.setkey			= camellia_setkey,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	},
 };
 
diff --git a/arch/x86/crypto/camellia_aesni_avx_glue.c b/arch/x86/crypto/camellia_aesni_avx_glue.c
index 44614f8a452c..22a89cdfedfb 100644
--- a/arch/x86/crypto/camellia_aesni_avx_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
@@ -26,10 +26,6 @@ EXPORT_SYMBOL_GPL(camellia_ecb_dec_16way);
 asmlinkage void camellia_cbc_dec_16way(const void *ctx, u8 *dst, const u8 *src);
 EXPORT_SYMBOL_GPL(camellia_cbc_dec_16way);
 
-asmlinkage void camellia_ctr_16way(const void *ctx, u8 *dst, const u8 *src,
-				   le128 *iv);
-EXPORT_SYMBOL_GPL(camellia_ctr_16way);
-
 static const struct common_glue_ctx camellia_enc = {
 	.num_funcs = 3,
 	.fpu_blocks_limit = CAMELLIA_AESNI_PARALLEL_BLOCKS,
@@ -46,22 +42,6 @@ static const struct common_glue_ctx camellia_enc = {
 	} }
 };
 
-static const struct common_glue_ctx camellia_ctr = {
-	.num_funcs = 3,
-	.fpu_blocks_limit = CAMELLIA_AESNI_PARALLEL_BLOCKS,
-
-	.funcs = { {
-		.num_blocks = CAMELLIA_AESNI_PARALLEL_BLOCKS,
-		.fn_u = { .ctr = camellia_ctr_16way }
-	}, {
-		.num_blocks = 2,
-		.fn_u = { .ctr = camellia_crypt_ctr_2way }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = camellia_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx camellia_dec = {
 	.num_funcs = 3,
 	.fpu_blocks_limit = CAMELLIA_AESNI_PARALLEL_BLOCKS,
@@ -120,11 +100,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&camellia_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&camellia_ctr, req);
-}
-
 static struct skcipher_alg camellia_algs[] = {
 	{
 		.base.cra_name		= "__ecb(camellia)",
@@ -153,21 +128,6 @@ static struct skcipher_alg camellia_algs[] = {
 		.setkey			= camellia_setkey,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "__ctr(camellia)",
-		.base.cra_driver_name	= "__ctr-camellia-aesni",
-		.base.cra_priority	= 400,
-		.base.cra_flags		= CRYPTO_ALG_INTERNAL,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct camellia_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= CAMELLIA_MIN_KEY_SIZE,
-		.max_keysize		= CAMELLIA_MAX_KEY_SIZE,
-		.ivsize			= CAMELLIA_BLOCK_SIZE,
-		.chunksize		= CAMELLIA_BLOCK_SIZE,
-		.setkey			= camellia_setkey,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	}
 };
 
diff --git a/arch/x86/crypto/camellia_glue.c b/arch/x86/crypto/camellia_glue.c
index 242c056e5fa8..fefeedf2b33d 100644
--- a/arch/x86/crypto/camellia_glue.c
+++ b/arch/x86/crypto/camellia_glue.c
@@ -1274,42 +1274,6 @@ void camellia_decrypt_cbc_2way(const void *ctx, u8 *d, const u8 *s)
 }
 EXPORT_SYMBOL_GPL(camellia_decrypt_cbc_2way);
 
-void camellia_crypt_ctr(const void *ctx, u8 *d, const u8 *s, le128 *iv)
-{
-	be128 ctrblk;
-	u128 *dst = (u128 *)d;
-	const u128 *src = (const u128 *)s;
-
-	if (dst != src)
-		*dst = *src;
-
-	le128_to_be128(&ctrblk, iv);
-	le128_inc(iv);
-
-	camellia_enc_blk_xor(ctx, (u8 *)dst, (u8 *)&ctrblk);
-}
-EXPORT_SYMBOL_GPL(camellia_crypt_ctr);
-
-void camellia_crypt_ctr_2way(const void *ctx, u8 *d, const u8 *s, le128 *iv)
-{
-	be128 ctrblks[2];
-	u128 *dst = (u128 *)d;
-	const u128 *src = (const u128 *)s;
-
-	if (dst != src) {
-		dst[0] = src[0];
-		dst[1] = src[1];
-	}
-
-	le128_to_be128(&ctrblks[0], iv);
-	le128_inc(iv);
-	le128_to_be128(&ctrblks[1], iv);
-	le128_inc(iv);
-
-	camellia_enc_blk_xor_2way(ctx, (u8 *)dst, (u8 *)ctrblks);
-}
-EXPORT_SYMBOL_GPL(camellia_crypt_ctr_2way);
-
 static const struct common_glue_ctx camellia_enc = {
 	.num_funcs = 2,
 	.fpu_blocks_limit = -1,
@@ -1323,19 +1287,6 @@ static const struct common_glue_ctx camellia_enc = {
 	} }
 };
 
-static const struct common_glue_ctx camellia_ctr = {
-	.num_funcs = 2,
-	.fpu_blocks_limit = -1,
-
-	.funcs = { {
-		.num_blocks = 2,
-		.fn_u = { .ctr = camellia_crypt_ctr_2way }
-	}, {
-		.num_blocks = 1,
-		.fn_u = { .ctr = camellia_crypt_ctr }
-	} }
-};
-
 static const struct common_glue_ctx camellia_dec = {
 	.num_funcs = 2,
 	.fpu_blocks_limit = -1,
@@ -1382,11 +1333,6 @@ static int cbc_decrypt(struct skcipher_request *req)
 	return glue_cbc_decrypt_req_128bit(&camellia_dec_cbc, req);
 }
 
-static int ctr_crypt(struct skcipher_request *req)
-{
-	return glue_ctr_req_128bit(&camellia_ctr, req);
-}
-
 static struct crypto_alg camellia_cipher_alg = {
 	.cra_name		= "camellia",
 	.cra_driver_name	= "camellia-asm",
@@ -1433,20 +1379,6 @@ static struct skcipher_alg camellia_skcipher_algs[] = {
 		.setkey			= camellia_setkey_skcipher,
 		.encrypt		= cbc_encrypt,
 		.decrypt		= cbc_decrypt,
-	}, {
-		.base.cra_name		= "ctr(camellia)",
-		.base.cra_driver_name	= "ctr-camellia-asm",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct camellia_ctx),
-		.base.cra_module	= THIS_MODULE,
-		.min_keysize		= CAMELLIA_MIN_KEY_SIZE,
-		.max_keysize		= CAMELLIA_MAX_KEY_SIZE,
-		.ivsize			= CAMELLIA_BLOCK_SIZE,
-		.chunksize		= CAMELLIA_BLOCK_SIZE,
-		.setkey			= camellia_setkey_skcipher,
-		.encrypt		= ctr_crypt,
-		.decrypt		= ctr_crypt,
 	}
 };
 
diff --git a/arch/x86/include/asm/crypto/camellia.h b/arch/x86/include/asm/crypto/camellia.h
index 0e5f82adbaf9..1dcea79e8f8e 100644
--- a/arch/x86/include/asm/crypto/camellia.h
+++ b/arch/x86/include/asm/crypto/camellia.h
@@ -38,8 +38,6 @@ asmlinkage void camellia_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
 asmlinkage void camellia_ecb_dec_16way(const void *ctx, u8 *dst, const u8 *src);
 
 asmlinkage void camellia_cbc_dec_16way(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void camellia_ctr_16way(const void *ctx, u8 *dst, const u8 *src,
-				   le128 *iv);
 
 static inline void camellia_enc_blk(const void *ctx, u8 *dst, const u8 *src)
 {
@@ -65,9 +63,5 @@ static inline void camellia_enc_blk_xor_2way(const void *ctx, u8 *dst,
 
 /* glue helpers */
 extern void camellia_decrypt_cbc_2way(const void *ctx, u8 *dst, const u8 *src);
-extern void camellia_crypt_ctr(const void *ctx, u8 *dst, const u8 *src,
-			       le128 *iv);
-extern void camellia_crypt_ctr_2way(const void *ctx, u8 *dst, const u8 *src,
-				    le128 *iv);
 
 #endif /* ASM_X86_CAMELLIA_H */
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

