Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 478DE26BB2A
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 05:54:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-GaA-9Oy3P6yAE8Iwec8ZlQ-1; Tue, 15 Sep 2020 23:54:30 -0400
X-MC-Unique: GaA-9Oy3P6yAE8Iwec8ZlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D6F1868410;
	Wed, 16 Sep 2020 03:54:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD4219D61;
	Wed, 16 Sep 2020 03:54:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B45044A5B;
	Wed, 16 Sep 2020 03:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G3sCcZ001348 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 23:54:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 729472156A2D; Wed, 16 Sep 2020 03:54:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CBC32156A23
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4992C88906D
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-588-pVY9GQY-Nb6C65M88I3a4w-1;
	Tue, 15 Sep 2020 23:54:07 -0400
X-MC-Unique: pVY9GQY-Nb6C65M88I3a4w-1
Received: from sol.attlocal.net (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7385A221E3;
	Wed, 16 Sep 2020 03:54:06 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 20:53:13 -0700
Message-Id: <20200916035315.34046-2-ebiggers@kernel.org>
In-Reply-To: <20200916035315.34046-1-ebiggers@kernel.org>
References: <20200916035315.34046-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G3sCcZ001348
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: [dm-devel] [PATCH v2 1/3] block: make bio_crypt_clone() able to fail
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

bio_crypt_clone() assumes its gfp_mask argument always includes
__GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.

However, bio_crypt_clone() might be called with GFP_ATOMIC via
setup_clone() in drivers/md/dm-rq.c, or with GFP_NOWAIT via
kcryptd_io_read() in drivers/md/dm-crypt.c.

Neither case is currently reachable with a bio that actually has an
encryption context.  However, it's fragile to rely on this.  Just make
bio_crypt_clone() able to fail, analogous to bio_integrity_clone().

Reported-by: Miaohe Lin <linmiaohe@huawei.com>
Cc: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/bio.c                | 20 +++++++++-----------
 block/blk-crypto.c         |  5 ++++-
 block/bounce.c             | 19 +++++++++----------
 drivers/md/dm.c            |  7 ++++---
 include/linux/blk-crypto.h | 20 ++++++++++++++++----
 5 files changed, 42 insertions(+), 29 deletions(-)

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
index 3dedd9cc4fb65..5487c3ff74b51 100644
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
index e82342907f2b1..69b24fe92cbf1 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -112,12 +112,24 @@ static inline bool bio_has_crypt_ctx(struct bio *bio)
 
 #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
 
-void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
-static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
-				   gfp_t gfp_mask)
+int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
+/**
+ * bio_crypt_clone - clone bio encryption context
+ * @dst: destination bio
+ * @src: source bio
+ * @gfp_mask: memory allocation flags
+ *
+ * If @src has an encryption context, clone it to @dst.
+ *
+ * Return: 0 on success, -ENOMEM if out of memory.  -ENOMEM is only possible if
+ *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
+ */
+static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
+				  gfp_t gfp_mask)
 {
 	if (bio_has_crypt_ctx(src))
-		__bio_crypt_clone(dst, src, gfp_mask);
+		return __bio_crypt_clone(dst, src, gfp_mask);
+	return 0;
 }
 
 #endif /* __LINUX_BLK_CRYPTO_H */
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

