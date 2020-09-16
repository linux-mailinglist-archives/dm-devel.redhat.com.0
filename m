Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 911F026BB29
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 05:54:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-j07zQVWQPxOEus9Uc_yuCA-1; Tue, 15 Sep 2020 23:54:30 -0400
X-MC-Unique: j07zQVWQPxOEus9Uc_yuCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CED1425CE;
	Wed, 16 Sep 2020 03:54:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 035E619D6C;
	Wed, 16 Sep 2020 03:54:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FF4044A6B;
	Wed, 16 Sep 2020 03:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G3sCXt001347 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 23:54:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7956E2024508; Wed, 16 Sep 2020 03:54:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E3720244F7
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56DC288907A
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 03:54:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-371-jUDkuFbyPBq42LF_YbsihA-1;
	Tue, 15 Sep 2020 23:54:08 -0400
X-MC-Unique: jUDkuFbyPBq42LF_YbsihA-1
Received: from sol.attlocal.net (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AF638221E5;
	Wed, 16 Sep 2020 03:54:06 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 20:53:14 -0700
Message-Id: <20200916035315.34046-3-ebiggers@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G3sCXt001347
X-loop: dm-devel@redhat.com
Cc: Miaohe Lin <linmiaohe@huawei.com>, dm-devel@redhat.com,
	Satya Tangirala <satyat@google.com>
Subject: [dm-devel] [PATCH v2 2/3] block: make blk_crypto_rq_bio_prep() able
	to fail
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

blk_crypto_rq_bio_prep() assumes its gfp_mask argument always includes
__GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.

However, blk_crypto_rq_bio_prep() might be called with GFP_ATOMIC via
setup_clone() in drivers/md/dm-rq.c.

This case isn't currently reachable with a bio that actually has an
encryption context.  However, it's fragile to rely on this.  Just make
blk_crypto_rq_bio_prep() able to fail.

Cc: Miaohe Lin <linmiaohe@huawei.com>
Suggested-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/blk-core.c            |  8 +++++---
 block/blk-crypto-internal.h | 21 ++++++++++++++++-----
 block/blk-crypto.c          | 18 +++++++-----------
 block/blk-mq.c              |  7 ++++++-
 4 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index ca3f0f00c9435..fbeaa49f6fe2c 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1620,8 +1620,10 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 		if (rq->bio) {
 			rq->biotail->bi_next = bio;
 			rq->biotail = bio;
-		} else
+		} else {
 			rq->bio = rq->biotail = bio;
+		}
+		bio = NULL;
 	}
 
 	/* Copy attributes of the original request to the clone request. */
@@ -1634,8 +1636,8 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 	rq->nr_phys_segments = rq_src->nr_phys_segments;
 	rq->ioprio = rq_src->ioprio;
 
-	if (rq->bio)
-		blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask);
+	if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
+		goto free_and_out;
 
 	return 0;
 
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
index d2b0f565d83cb..0d36aae538d7b 100644
--- a/block/blk-crypto-internal.h
+++ b/block/blk-crypto-internal.h
@@ -142,13 +142,24 @@ static inline void blk_crypto_free_request(struct request *rq)
 		__blk_crypto_free_request(rq);
 }
 
-void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
-			      gfp_t gfp_mask);
-static inline void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
-					  gfp_t gfp_mask)
+int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+			     gfp_t gfp_mask);
+/**
+ * blk_crypto_rq_bio_prep - Prepare a request's crypt_ctx when its first bio
+ *			    is inserted
+ * @rq: The request to prepare
+ * @bio: The first bio being inserted into the request
+ * @gfp_mask: Memory allocation flags
+ *
+ * Return: 0 on success, -ENOMEM if out of memory.  -ENOMEM is only possible if
+ *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
+ */
+static inline int blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+					 gfp_t gfp_mask)
 {
 	if (bio_has_crypt_ctx(bio))
-		__blk_crypto_rq_bio_prep(rq, bio, gfp_mask);
+		return __blk_crypto_rq_bio_prep(rq, bio, gfp_mask);
+	return 0;
 }
 
 /**
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index a3f27a19067c9..bbe7974fd74f0 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -283,20 +283,16 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 	return false;
 }
 
-/**
- * __blk_crypto_rq_bio_prep - Prepare a request's crypt_ctx when its first bio
- *			      is inserted
- *
- * @rq: The request to prepare
- * @bio: The first bio being inserted into the request
- * @gfp_mask: gfp mask
- */
-void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
-			      gfp_t gfp_mask)
+int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
+			     gfp_t gfp_mask)
 {
-	if (!rq->crypt_ctx)
+	if (!rq->crypt_ctx) {
 		rq->crypt_ctx = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
+		if (!rq->crypt_ctx)
+			return -ENOMEM;
+	}
 	*rq->crypt_ctx = *bio->bi_crypt_context;
+	return 0;
 }
 
 /**
diff --git a/block/blk-mq.c b/block/blk-mq.c
index e04b759add758..9ec0e7149ae69 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1940,13 +1940,18 @@ void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
 static void blk_mq_bio_to_request(struct request *rq, struct bio *bio,
 		unsigned int nr_segs)
 {
+	int err;
+
 	if (bio->bi_opf & REQ_RAHEAD)
 		rq->cmd_flags |= REQ_FAILFAST_MASK;
 
 	rq->__sector = bio->bi_iter.bi_sector;
 	rq->write_hint = bio->bi_write_hint;
 	blk_rq_bio_prep(rq, bio, nr_segs);
-	blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
+
+	/* This can't fail, since GFP_NOIO includes __GFP_DIRECT_RECLAIM. */
+	err = blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
+	WARN_ON_ONCE(err);
 
 	blk_account_io_start(rq);
 }
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

