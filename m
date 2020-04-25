Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 411781B8498
	for <lists+dm-devel@lfdr.de>; Sat, 25 Apr 2020 10:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587802754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RhG9/CG2uF28UYGNe5SeHvsPN5Ib0+Sj3/TGWMRrC+0=;
	b=QMEyFTVIlmZSsXcBAx1tsM72aE6HQWe70wbaQUN8uHhstJoSz1PR+02VMqIilvaNCEwWZZ
	8ljqI8XzJK1sELutiynll8mV9LkPD/dUspuZfdnrfk3uyajXwLDv4/7+P757nFgDkgKHmx
	z7YC1r5qUBTO7Ms1BoGFN6K4uPgh79o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-UhjQU0iYPm2DtwEIj-ysdQ-1; Sat, 25 Apr 2020 04:19:01 -0400
X-MC-Unique: UhjQU0iYPm2DtwEIj-ysdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF63460;
	Sat, 25 Apr 2020 08:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49C4D5D9C5;
	Sat, 25 Apr 2020 08:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E29CD4CA95;
	Sat, 25 Apr 2020 08:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03P8IkYT016431 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Apr 2020 04:18:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B44AC2166BA0; Sat, 25 Apr 2020 08:18:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFCF02157F24
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 08:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0DEF800260
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 08:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-Vz0VZy2XNHSrK_l56vP89g-1; Sat, 25 Apr 2020 04:18:38 -0400
X-MC-Unique: Vz0VZy2XNHSrK_l56vP89g-1
Received: from [2001:4bb8:193:f203:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSFdC-0007dx-3k; Sat, 25 Apr 2020 07:53:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 25 Apr 2020 09:53:36 +0200
Message-Id: <20200425075336.721021-4-hch@lst.de>
In-Reply-To: <20200425075336.721021-1-hch@lst.de>
References: <20200425075336.721021-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03P8IkYT016431
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-bcache@vger.kernel.org
Subject: [dm-devel] [PATCH 3/3] block: bypass ->make_request_fn for blk-mq
	drivers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Call blk_mq_make_request when no ->make_request_fn is set.  This is
safe now that blk_alloc_queue always sets up the pointer for make_request
based drivers.  This avoids an indirect call in the blk-mq driver I/O
fast path, which is rather expensive due to spectre mitigations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c       | 26 +++++++++++++++++---------
 block/blk-mq.c         |  4 ++--
 drivers/md/dm.c        |  3 +++
 include/linux/blk-mq.h |  2 ++
 4 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 311596d5dbc41..0e9e1c83e5e84 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1072,7 +1072,10 @@ blk_qc_t generic_make_request(struct bio *bio)
 			/* Create a fresh bio_list for all subordinate requests */
 			bio_list_on_stack[1] = bio_list_on_stack[0];
 			bio_list_init(&bio_list_on_stack[0]);
-			ret = q->make_request_fn(q, bio);
+			if (q->make_request_fn)
+				ret = q->make_request_fn(q, bio);
+			else
+				ret = blk_mq_make_request(q, bio);
 
 			blk_queue_exit(q);
 
@@ -1112,9 +1115,7 @@ EXPORT_SYMBOL(generic_make_request);
  *
  * This function behaves like generic_make_request(), but does not protect
  * against recursion.  Must only be used if the called driver is known
- * to not call generic_make_request (or direct_make_request) again from
- * its make_request function.  (Calling direct_make_request again from
- * a workqueue is perfectly fine as that doesn't recurse).
+ * to be blk-mq based.
  */
 blk_qc_t direct_make_request(struct bio *bio)
 {
@@ -1122,20 +1123,27 @@ blk_qc_t direct_make_request(struct bio *bio)
 	bool nowait = bio->bi_opf & REQ_NOWAIT;
 	blk_qc_t ret;
 
+	if (WARN_ON_ONCE(q->make_request_fn))
+		goto io_error;
 	if (!generic_make_request_checks(bio))
 		return BLK_QC_T_NONE;
 
 	if (unlikely(blk_queue_enter(q, nowait ? BLK_MQ_REQ_NOWAIT : 0))) {
 		if (nowait && !blk_queue_dying(q))
-			bio_wouldblock_error(bio);
-		else
-			bio_io_error(bio);
-		return BLK_QC_T_NONE;
+			goto would_block;
+		goto io_error;
 	}
 
-	ret = q->make_request_fn(q, bio);
+	ret = blk_mq_make_request(q, bio);
 	blk_queue_exit(q);
 	return ret;
+
+would_block:
+	bio_wouldblock_error(bio);
+	return BLK_QC_T_NONE;
+io_error:
+	bio_io_error(bio);
+	return BLK_QC_T_NONE;
 }
 EXPORT_SYMBOL_GPL(direct_make_request);
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 71d0894ce1c58..bcc3a2397d4ae 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1984,7 +1984,7 @@ static void blk_add_rq_to_plug(struct blk_plug *plug, struct request *rq)
  *
  * Returns: Request queue cookie.
  */
-static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
+blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 {
 	const int is_sync = op_is_sync(bio->bi_opf);
 	const int is_flush_fua = op_is_flush(bio->bi_opf);
@@ -2096,6 +2096,7 @@ static blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 
 	return cookie;
 }
+EXPORT_SYMBOL_GPL(blk_mq_make_request); /* only for request based dm */
 
 void blk_mq_free_rqs(struct blk_mq_tag_set *set, struct blk_mq_tags *tags,
 		     unsigned int hctx_idx)
@@ -2955,7 +2956,6 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	INIT_LIST_HEAD(&q->requeue_list);
 	spin_lock_init(&q->requeue_lock);
 
-	q->make_request_fn = blk_mq_make_request;
 	q->nr_requests = set->queue_depth;
 
 	/*
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index db9e461146531..0eb93da44ea2a 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1788,6 +1788,9 @@ static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
 	int srcu_idx;
 	struct dm_table *map;
 
+	if (dm_get_md_type(md) == DM_TYPE_REQUEST_BASED)
+		return blk_mq_make_request(q, bio);
+
 	map = dm_get_live_table(md, &srcu_idx);
 
 	/* if we're suspended, we have to queue this io for later */
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 51fbf6f76593a..d7307795439a4 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -578,4 +578,6 @@ static inline void blk_mq_cleanup_rq(struct request *rq)
 		rq->q->mq_ops->cleanup_rq(rq);
 }
 
+blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio);
+
 #endif
-- 
2.26.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

