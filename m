Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEE125A503
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 07:26:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-03wA6zO9OC-J3SIBnDfsSw-1; Wed, 02 Sep 2020 01:26:15 -0400
X-MC-Unique: 03wA6zO9OC-J3SIBnDfsSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1552B10ABDAB;
	Wed,  2 Sep 2020 05:26:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A0AD7049D;
	Wed,  2 Sep 2020 05:26:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29B2279A32;
	Wed,  2 Sep 2020 05:25:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0825PXsO016627 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 01:25:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E29EB34F7; Wed,  2 Sep 2020 05:25:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4981FB34FB
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 05:25:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 333148008A5
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 05:25:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-21-n_eBNpu-PHObqWAxxK2asg-1; 
	Wed, 02 Sep 2020 01:25:28 -0400
X-MC-Unique: n_eBNpu-PHObqWAxxK2asg-1
Received: from sol.localdomain (ip-99-203-42-15.pools.cgn.spcsdns.net
	[99.203.42.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2871020758;
	Wed,  2 Sep 2020 05:16:28 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Tue,  1 Sep 2020 22:15:11 -0700
Message-Id: <20200902051511.79821-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0825PXsO016627
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: [dm-devel] [PATCH] block: make bio_crypt_clone() return an error
	code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

Callers of bio_clone_fast() may use a gfp_mask that excludes
GFP_DIRECT_RECLAIM.  For example, map_request() uses GFP_ATOMIC.

If this were to happen, the mempool_alloc() in __bio_crypt_clone() can
fail, causing a NULL dereference.

In reality map_request() currently never has to clone an encryption
context, since inline encryption isn't yet supported on device-mapper
devices at all, let alone on request-based ones.

But it is fragile to rely on this.  Just make bio_crypt_clone() able to
fail, similar to bio_integrity_clone().

Reported-by: Miaohe Lin <linmiaohe@huawei.com>
Cc: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/bio.c                | 20 +++++++++-----------
 block/blk-crypto.c         |  5 ++++-
 block/bounce.c             | 19 +++++++++----------
 drivers/md/dm.c            |  7 ++++---
 include/linux/blk-crypto.h |  9 +++++----
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index a9931f23d9332..b42e046b12eb3 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -713,20 +713,18 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 
 	__bio_clone_fast(b, bio);
 
-	bio_crypt_clone(b, bio, gfp_mask);
+	if (bio_crypt_clone(b, bio, gfp_mask) < 0)
+		goto err_put;
 
-	if (bio_integrity(bio)) {
-		int ret;
-
-		ret = bio_integrity_clone(b, bio, gfp_mask);
-
-		if (ret < 0) {
-			bio_put(b);
-			return NULL;
-		}
-	}
+	if (bio_integrity(bio) &&
+	    bio_integrity_clone(b, bio, gfp_mask) < 0)
+		goto err_put;
 
 	return b;
+
+err_put:
+	bio_put(b);
+	return NULL;
 }
 EXPORT_SYMBOL(bio_clone_fast);
 
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 2d5e60023b08b..a3f27a19067c9 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -95,10 +95,13 @@ void __bio_crypt_free_ctx(struct bio *bio)
 	bio->bi_crypt_context = NULL;
 }
 
-void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
+int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
 {
 	dst->bi_crypt_context = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+	if (!dst->bi_crypt_context)
+		return -ENOMEM;
 	*dst->bi_crypt_context = *src->bi_crypt_context;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(__bio_crypt_clone);
 
diff --git a/block/bounce.c b/block/bounce.c
index 431be88a02405..162a6eee89996 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -267,22 +267,21 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
 		break;
 	}
 
-	bio_crypt_clone(bio, bio_src, gfp_mask);
+	if (bio_crypt_clone(bio, bio_src, gfp_mask) < 0)
+		goto err_put;
 
-	if (bio_integrity(bio_src)) {
-		int ret;
-
-		ret = bio_integrity_clone(bio, bio_src, gfp_mask);
-		if (ret < 0) {
-			bio_put(bio);
-			return NULL;
-		}
-	}
+	if (bio_integrity(bio_src) &&
+	    bio_integrity_clone(bio, bio_src, gfp_mask) < 0)
+		goto err_put;
 
 	bio_clone_blkg_association(bio, bio_src);
 	blkcg_bio_issue_init(bio);
 
 	return bio;
+
+err_put:
+	bio_put(bio);
+	return NULL;
 }
 
 static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index fb0255d25e4b2..e987b417d702f 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1326,14 +1326,15 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
 		     sector_t sector, unsigned len)
 {
 	struct bio *clone = &tio->clone;
+	int r;
 
 	__bio_clone_fast(clone, bio);
 
-	bio_crypt_clone(clone, bio, GFP_NOIO);
+	r = bio_crypt_clone(clone, bio, GFP_NOIO);
+	if (r < 0)
+		return r;
 
 	if (bio_integrity(bio)) {
-		int r;
-
 		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
 			     !dm_target_passes_integrity(tio->ti->type))) {
 			DMWARN("%s: the target %s doesn't support integrity data.",
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index e82342907f2b1..d0dba84f6a608 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -112,12 +112,13 @@ static inline bool bio_has_crypt_ctx(struct bio *bio)
 
 #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
 
-void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
-static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
-				   gfp_t gfp_mask)
+int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
+static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
+				  gfp_t gfp_mask)
 {
 	if (bio_has_crypt_ctx(src))
-		__bio_crypt_clone(dst, src, gfp_mask);
+		return __bio_crypt_clone(dst, src, gfp_mask);
+	return 0;
 }
 
 #endif /* __LINUX_BLK_CRYPTO_H */

base-commit: f75aef392f869018f78cfedf3c320a6b3fcfda6b
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

