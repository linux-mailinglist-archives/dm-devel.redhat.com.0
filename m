Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F174621032B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:54:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-daXkE4NvOqavsKEVIScLVw-1; Wed, 01 Jul 2020 00:54:20 -0400
X-MC-Unique: daXkE4NvOqavsKEVIScLVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E368804004;
	Wed,  1 Jul 2020 04:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBE962B4A9;
	Wed,  1 Jul 2020 04:54:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 970561809554;
	Wed,  1 Jul 2020 04:54:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614qdDv008761 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:52:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 865ACFC74D; Wed,  1 Jul 2020 04:52:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B42FC756
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AE031859164
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-212-B1dd1O_wOxqN1QY3CiZZog-1;
	Wed, 01 Jul 2020 00:52:30 -0400
X-MC-Unique: B1dd1O_wOxqN1QY3CiZZog-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5ACCB20775;
	Wed,  1 Jul 2020 04:52:29 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Tue, 30 Jun 2020 21:52:14 -0700
Message-Id: <20200701045217.121126-4-ebiggers@kernel.org>
In-Reply-To: <20200701045217.121126-1-ebiggers@kernel.org>
References: <20200701045217.121126-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614qdDv008761
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/6] crypto: algapi - introduce the flag
	CRYPTO_ALG_ALLOCATES_MEMORY
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

Introduce a new algorithm flag CRYPTO_ALG_ALLOCATES_MEMORY.  If this
flag is set, then the driver allocates memory in its request routine.
Such drivers are not suitable for disk encryption because GFP_ATOMIC
allocation can fail anytime (causing random I/O errors) and GFP_KERNEL
allocation can recurse into the block layer, causing a deadlock.

For now, this flag is only implemented for some algorithm types.  We
also assume some usage constraints for it to be meaningful, since there
are lots of edge cases the crypto API allows (e.g., misaligned or
fragmented scatterlists) that mean that nearly any crypto algorithm can
allocate memory in some case.  See the comment for details.

Also add this flag to CRYPTO_ALG_INHERITED_FLAGS so that when a template
is instantiated, this flag is set on the template instance if it is set
on any algorithm the instance uses.

Originally-from: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/algapi.h |  3 ++-
 include/linux/crypto.h  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 5385443dcf9b..dce57c89cf98 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -246,7 +246,8 @@ static inline u32 crypto_requires_off(u32 type, u32 mask, u32 off)
  * algorithm if any "inner" algorithm has them set.  In some cases other flags
  * are inherited too; these are just the flags that are *always* inherited.
  */
-#define CRYPTO_ALG_INHERITED_FLAGS	CRYPTO_ALG_ASYNC
+#define CRYPTO_ALG_INHERITED_FLAGS	\
+	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)
 
 /*
  * Given the type and mask that specify the flags restrictions on a template
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 763863dbc079..5e7c04391be8 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -101,6 +101,38 @@
  */
 #define CRYPTO_NOLOAD			0x00008000
 
+/*
+ * The algorithm may allocate memory during request processing, i.e. during
+ * encryption, decryption, or hashing.  Users can request an algorithm with this
+ * flag unset if they can't handle memory allocation failures.
+ *
+ * This flag is currently only implemented for algorithms of type "skcipher",
+ * "aead", "ahash", "shash", and "cipher".  Algorithms of other types might not
+ * have this flag set even if they allocate memory.
+ *
+ * In some edge cases, algorithms can allocate memory regardless of this flag.
+ * To avoid these cases, users must obey the following usage constraints:
+ *    skcipher:
+ *	- The IV buffer and all scatterlist elements must be aligned to the
+ *	  algorithm's alignmask.
+ *	- If the data were to be divided into chunks of size
+ *	  crypto_skcipher_walksize() (with any remainder going at the end), no
+ *	  chunk can cross a page boundary or a scatterlist element boundary.
+ *    aead:
+ *	- The IV buffer and all scatterlist elements must be aligned to the
+ *	  algorithm's alignmask.
+ *	- The first scatterlist element must contain all the associated data,
+ *	  and its pages must be !PageHighMem.
+ *	- If the plaintext/ciphertext were to be divided into chunks of size
+ *	  crypto_aead_walksize() (with the remainder going at the end), no chunk
+ *	  can cross a page boundary or a scatterlist element boundary.
+ *    ahash:
+ *	- The result buffer must be aligned to the algorithm's alignmask.
+ *	- crypto_ahash_finup() must not be used unless the algorithm implements
+ *	  ->finup() natively.
+ */
+#define CRYPTO_ALG_ALLOCATES_MEMORY	0x00010000
+
 /*
  * Transform masks and values (for crt_flags).
  */
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

