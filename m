Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64BB8210328
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:54:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-cX5niqLmPTmGqVXA_99E3w-1; Wed, 01 Jul 2020 00:54:17 -0400
X-MC-Unique: cX5niqLmPTmGqVXA_99E3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F62800D5C;
	Wed,  1 Jul 2020 04:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A50F310013C0;
	Wed,  1 Jul 2020 04:54:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0E7D6C9C3;
	Wed,  1 Jul 2020 04:54:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614qaNR008737 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:52:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F93F202A97E; Wed,  1 Jul 2020 04:52:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB41920234BC
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317B58EF3A5
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-209-yykyPcocMKO0iwJcf8hrTQ-1;
	Wed, 01 Jul 2020 00:52:30 -0400
X-MC-Unique: yykyPcocMKO0iwJcf8hrTQ-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BBBF220747;
	Wed,  1 Jul 2020 04:52:28 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Tue, 30 Jun 2020 21:52:12 -0700
Message-Id: <20200701045217.121126-2-ebiggers@kernel.org>
In-Reply-To: <20200701045217.121126-1-ebiggers@kernel.org>
References: <20200701045217.121126-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614qaNR008737
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/6] crypto: geniv - remove unneeded arguments
	from aead_geniv_alloc()
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

The type and mask arguments to aead_geniv_alloc() are always 0, so
remove them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/echainiv.c               | 2 +-
 crypto/geniv.c                  | 7 ++++---
 crypto/seqiv.c                  | 2 +-
 include/crypto/internal/geniv.h | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/crypto/echainiv.c b/crypto/echainiv.c
index 4a2f02baba14..69686668625e 100644
--- a/crypto/echainiv.c
+++ b/crypto/echainiv.c
@@ -115,7 +115,7 @@ static int echainiv_aead_create(struct crypto_template *tmpl,
 	struct aead_instance *inst;
 	int err;
 
-	inst = aead_geniv_alloc(tmpl, tb, 0, 0);
+	inst = aead_geniv_alloc(tmpl, tb);
 
 	if (IS_ERR(inst))
 		return PTR_ERR(inst);
diff --git a/crypto/geniv.c b/crypto/geniv.c
index 6a90c52d49ad..07496c8af0ab 100644
--- a/crypto/geniv.c
+++ b/crypto/geniv.c
@@ -39,7 +39,7 @@ static void aead_geniv_free(struct aead_instance *inst)
 }
 
 struct aead_instance *aead_geniv_alloc(struct crypto_template *tmpl,
-				       struct rtattr **tb, u32 type, u32 mask)
+				       struct rtattr **tb)
 {
 	struct crypto_aead_spawn *spawn;
 	struct crypto_attr_type *algt;
@@ -47,6 +47,7 @@ struct aead_instance *aead_geniv_alloc(struct crypto_template *tmpl,
 	struct aead_alg *alg;
 	unsigned int ivsize;
 	unsigned int maxauthsize;
+	u32 mask;
 	int err;
 
 	algt = crypto_get_attr_type(tb);
@@ -63,10 +64,10 @@ struct aead_instance *aead_geniv_alloc(struct crypto_template *tmpl,
 	spawn = aead_instance_ctx(inst);
 
 	/* Ignore async algorithms if necessary. */
-	mask |= crypto_requires_sync(algt->type, algt->mask);
+	mask = crypto_requires_sync(algt->type, algt->mask);
 
 	err = crypto_grab_aead(spawn, aead_crypto_instance(inst),
-			       crypto_attr_alg_name(tb[1]), type, mask);
+			       crypto_attr_alg_name(tb[1]), 0, mask);
 	if (err)
 		goto err_free_inst;
 
diff --git a/crypto/seqiv.c b/crypto/seqiv.c
index f124b9b54e15..e48f875a7aac 100644
--- a/crypto/seqiv.c
+++ b/crypto/seqiv.c
@@ -138,7 +138,7 @@ static int seqiv_aead_create(struct crypto_template *tmpl, struct rtattr **tb)
 	struct aead_instance *inst;
 	int err;
 
-	inst = aead_geniv_alloc(tmpl, tb, 0, 0);
+	inst = aead_geniv_alloc(tmpl, tb);
 
 	if (IS_ERR(inst))
 		return PTR_ERR(inst);
diff --git a/include/crypto/internal/geniv.h b/include/crypto/internal/geniv.h
index 229d37681a9d..7fd7126f593a 100644
--- a/include/crypto/internal/geniv.h
+++ b/include/crypto/internal/geniv.h
@@ -20,7 +20,7 @@ struct aead_geniv_ctx {
 };
 
 struct aead_instance *aead_geniv_alloc(struct crypto_template *tmpl,
-				       struct rtattr **tb, u32 type, u32 mask);
+				       struct rtattr **tb);
 int aead_init_geniv(struct crypto_aead *tfm);
 void aead_exit_geniv(struct crypto_aead *tfm);
 
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

