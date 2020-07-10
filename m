Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A52421AF5C
	for <lists+dm-devel@lfdr.de>; Fri, 10 Jul 2020 08:22:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-ore0-cPOMUSpnolzVgkRqw-1; Fri, 10 Jul 2020 02:22:33 -0400
X-MC-Unique: ore0-cPOMUSpnolzVgkRqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 340741DE3;
	Fri, 10 Jul 2020 06:22:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE8E10013D4;
	Fri, 10 Jul 2020 06:22:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8535384365;
	Fri, 10 Jul 2020 06:22:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06A6Lrin005869 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jul 2020 02:21:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F29581006513; Fri, 10 Jul 2020 06:21:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA53010EE844
	for <dm-devel@redhat.com>; Fri, 10 Jul 2020 06:21:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 983818007C9
	for <dm-devel@redhat.com>; Fri, 10 Jul 2020 06:21:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-370-XsxuKnQPOa2kF9jO6Xytuw-1;
	Fri, 10 Jul 2020 02:21:47 -0400
X-MC-Unique: XsxuKnQPOa2kF9jO6Xytuw-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1DBFB2078D;
	Fri, 10 Jul 2020 06:21:46 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Thu,  9 Jul 2020 23:20:39 -0700
Message-Id: <20200710062042.113842-5-ebiggers@kernel.org>
In-Reply-To: <20200710062042.113842-1-ebiggers@kernel.org>
References: <20200710062042.113842-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06A6Lrin005869
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v2 4/7] crypto: algapi - add NEED_FALLBACK to
	INHERITED_FLAGS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

CRYPTO_ALG_NEED_FALLBACK is handled inconsistently.  When it's requested
to be clear, some templates propagate that request to child algorithms,
while others don't.

It's apparently desired for NEED_FALLBACK to be propagated, to avoid
deadlocks where a module tries to load itself while it's being
initialized, and to avoid unnecessarily complex fallback chains where we
have e.g. cbc-aes-$driver falling back to cbc(aes-$driver) where
aes-$driver itself falls back to aes-generic, instead of cbc-aes-$driver
simply falling back to cbc(aes-generic).  There have been a number of
fixes to this effect:

commit 89027579bc6c ("crypto: xts - Propagate NEED_FALLBACK bit")
commit d2c2a85cfe82 ("crypto: ctr - Propagate NEED_FALLBACK bit")
commit e6c2e65c70a6 ("crypto: cbc - Propagate NEED_FALLBACK bit")

But it seems that other templates can have the same problems too.

To avoid this whack-a-mole, just add NEED_FALLBACK to INHERITED_FLAGS so
that it's always inherited.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/ctr.c            | 2 --
 crypto/skcipher.c       | 2 --
 crypto/xts.c            | 2 --
 include/crypto/algapi.h | 3 ++-
 include/linux/crypto.h  | 4 ++--
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/crypto/ctr.c b/crypto/ctr.c
index ae8d88c715d6..c39fcffba27f 100644
--- a/crypto/ctr.c
+++ b/crypto/ctr.c
@@ -265,8 +265,6 @@ static int crypto_rfc3686_create(struct crypto_template *tmpl,
 	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_SKCIPHER, &mask);
 	if (err)
 		return err;
-	mask |= crypto_requires_off(crypto_get_attr_type(tb),
-				    CRYPTO_ALG_NEED_FALLBACK);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
 	if (!inst)
diff --git a/crypto/skcipher.c b/crypto/skcipher.c
index 3b93a74ad124..467af525848a 100644
--- a/crypto/skcipher.c
+++ b/crypto/skcipher.c
@@ -943,8 +943,6 @@ struct skcipher_instance *skcipher_alloc_instance_simple(
 	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_SKCIPHER, &mask);
 	if (err)
 		return ERR_PTR(err);
-	mask |= crypto_requires_off(crypto_get_attr_type(tb),
-				    CRYPTO_ALG_NEED_FALLBACK);
 
 	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
 	if (!inst)
diff --git a/crypto/xts.c b/crypto/xts.c
index 35a30610569b..9a7adab6c3e1 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -340,8 +340,6 @@ static int create(struct crypto_template *tmpl, struct rtattr **tb)
 	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_SKCIPHER, &mask);
 	if (err)
 		return err;
-	mask |= crypto_requires_off(crypto_get_attr_type(tb),
-				    CRYPTO_ALG_NEED_FALLBACK);
 
 	cipher_name = crypto_attr_alg_name(tb[1]);
 	if (IS_ERR(cipher_name))
diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index da64c37482b4..22cf4d80959f 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -245,7 +245,8 @@ static inline u32 crypto_requires_off(struct crypto_attr_type *algt, u32 off)
  * template), these are the flags that should always be set on the "outer"
  * algorithm if any "inner" algorithm has them set.
  */
-#define CRYPTO_ALG_INHERITED_FLAGS	CRYPTO_ALG_ASYNC
+#define CRYPTO_ALG_INHERITED_FLAGS	\
+	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_NEED_FALLBACK)
 
 /*
  * Given the type and mask that specify the flags restrictions on a template
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 7cd2d00f0a05..f73f0b51e1cd 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -60,8 +60,8 @@
 #define CRYPTO_ALG_ASYNC		0x00000080
 
 /*
- * Set this bit if and only if the algorithm requires another algorithm of
- * the same type to handle corner cases.
+ * Set if the algorithm (or an algorithm which it uses) requires another
+ * algorithm of the same type to handle corner cases.
  */
 #define CRYPTO_ALG_NEED_FALLBACK	0x00000100
 
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

