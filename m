Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED640340A92
	for <lists+dm-devel@lfdr.de>; Thu, 18 Mar 2021 17:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616086198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kZiphOORTiJm6vhvubRN6CaPyvhBsOlM2TbtfQIvco0=;
	b=BW56JKLVvHNkn1LMZctX4gcyK7AHsqUuwDKi2drCS+0l9LELcUPKJxbYNz7CteqqhzeWjt
	3n6ho0Bza4TQJmtM79Yod0lJerhfGsOXLmDaNfXxh0kf7WB+GvlDlnuUY3VAyrYu71XOc5
	GrGQIsMUDQl84ysa7MKxtC1t2B9rSxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-I-nCM7YlNnaftmhKqhdkgQ-1; Thu, 18 Mar 2021 12:49:56 -0400
X-MC-Unique: I-nCM7YlNnaftmhKqhdkgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2738E94F0E;
	Thu, 18 Mar 2021 16:49:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21FC5D6A8;
	Thu, 18 Mar 2021 16:49:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93C561809C83;
	Thu, 18 Mar 2021 16:49:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12IGnSsi030520 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Mar 2021 12:49:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80AF310074FC; Thu, 18 Mar 2021 16:49:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-24.pek2.redhat.com [10.72.12.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC0A10023BE;
	Thu, 18 Mar 2021 16:49:27 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 19 Mar 2021 00:48:19 +0800
Message-Id: <20210318164827.1481133-6-ming.lei@redhat.com>
In-Reply-To: <20210318164827.1481133-1-ming.lei@redhat.com>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH V2 05/13] block: add req flag of REQ_TAG
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add one req flag REQ_TAG which will be used in the following patch for
supporting bio based IO polling.

Exactly this flag can help us to do:

1) request flag is cloned in bio_fast_clone(), so if we mark one FS bio
as REQ_TAG, all bios cloned from this FS bio will be marked as REQ_TAG.

2)create per-task io polling context if the bio based queue supports polling
and the submitted bio is HIPRI. This per-task io polling context will be
created during submit_bio() before marking this HIPRI bio as REQ_TAG. Then
we can avoid to create such io polling context if one cloned bio with REQ_TAG
is submitted from another kernel context.

3) for supporting bio based io polling, we need to poll IOs from all
underlying queues of bio device/driver, this way help us to recognize which
IOs need to polled in bio based style, which will be implemented in next
patch.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c          | 29 +++++++++++++++++++++++++++--
 include/linux/blk_types.h |  4 ++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 0b00c21cbefb..efc7a61a84b4 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -840,11 +840,30 @@ static inline bool blk_queue_support_bio_poll(struct request_queue *q)
 static inline void blk_bio_poll_preprocess(struct request_queue *q,
 		struct bio *bio)
 {
+	bool mq;
+
 	if (!(bio->bi_opf & REQ_HIPRI))
 		return;
 
-	if (!blk_queue_poll(q) || (!queue_is_mq(q) && !blk_get_bio_poll_ctx()))
+	/*
+	 * Can't support bio based IO poll without per-task poll queue
+	 *
+	 * Now we have created per-task io poll context, and mark this
+	 * bio as REQ_TAG, so: 1) if any cloned bio from this bio is
+	 * submitted from another kernel context, we won't create bio
+	 * poll context for it, so that bio will be completed by IRQ;
+	 * 2) If such bio is submitted from current context, we will
+	 * complete it via blk_poll(); 3) If driver knows that one
+	 * underlying bio allocated from driver is for FS bio, meantime
+	 * it is submitted in current context, driver can mark such bio
+	 * as REQ_TAG manually, so the bio can be completed via blk_poll
+	 * too.
+	 */
+	mq = queue_is_mq(q);
+	if (!blk_queue_poll(q) || (!mq && !blk_get_bio_poll_ctx()))
 		bio->bi_opf &= ~REQ_HIPRI;
+	else if (!mq)
+		bio->bi_opf |= REQ_TAG;
 }
 
 static noinline_for_stack bool submit_bio_checks(struct bio *bio)
@@ -893,9 +912,15 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 
 	/*
 	 * Created per-task io poll queue if we supports bio polling
-	 * and it is one HIPRI bio.
+	 * and it is one HIPRI bio, and this HIPRI bio has to be from
+	 * FS. If REQ_TAG isn't set for HIPRI bio, we think it originated
+	 * from FS.
+	 *
+	 * Driver may allocated bio by itself and REQ_TAG is set, but they
+	 * won't be marked as HIPRI.
 	 */
 	blk_create_io_context(q, blk_queue_support_bio_poll(q) &&
+			!(bio->bi_opf & REQ_TAG) &&
 			(bio->bi_opf & REQ_HIPRI));
 
 	blk_bio_poll_preprocess(q, bio);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index db026b6ec15a..a1bcade4bcc3 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -394,6 +394,9 @@ enum req_flag_bits {
 
 	__REQ_HIPRI,
 
+	/* for marking IOs originated from same FS bio in same context */
+	__REQ_TAG,
+
 	/* for driver use */
 	__REQ_DRV,
 	__REQ_SWAP,		/* swapping request. */
@@ -418,6 +421,7 @@ enum req_flag_bits {
 
 #define REQ_NOUNMAP		(1ULL << __REQ_NOUNMAP)
 #define REQ_HIPRI		(1ULL << __REQ_HIPRI)
+#define REQ_TAG			(1ULL << __REQ_TAG)
 
 #define REQ_DRV			(1ULL << __REQ_DRV)
 #define REQ_SWAP		(1ULL << __REQ_SWAP)
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

