Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5B2350CA7
	for <lists+dm-devel@lfdr.de>; Thu,  1 Apr 2021 04:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617243849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cedO65RDWEOfObEVLsCyDcmjxfLMitzCQ7yffphQsHw=;
	b=E163K7zkv3Fynf8Pj3HoknKABDBrhLM/XwK4wlwy3uFQ1178S5gLlLzLdvSSdfjmPVCYMu
	nNYnXVQPdYzpwB3bto5PoOdC+iMdUlfYddd3Wj0Z39W9+C8FKVe+vZoZE2SgBymAnLAG9b
	496MpNuhtFrhWmLk0/Pz/E7a/ysGJQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-WeyZAbKbPHO4iljHX0IyYA-1; Wed, 31 Mar 2021 22:22:37 -0400
X-MC-Unique: WeyZAbKbPHO4iljHX0IyYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7172681746A;
	Thu,  1 Apr 2021 02:22:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3864719C44;
	Thu,  1 Apr 2021 02:22:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EFB61809C84;
	Thu,  1 Apr 2021 02:22:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1312Ljn5017668 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 22:21:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D030F5D72F; Thu,  1 Apr 2021 02:21:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-93.pek2.redhat.com [10.72.12.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0F795D720;
	Thu,  1 Apr 2021 02:21:38 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  1 Apr 2021 10:19:24 +0800
Message-Id: <20210401021927.343727-10-ming.lei@redhat.com>
In-Reply-To: <20210401021927.343727-1-ming.lei@redhat.com>
References: <20210401021927.343727-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: [dm-devel] [PATCH V5 09/12] blk-mq: limit hw queues to be polled in
	each blk_poll()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Limit at most 8 queues are polled in each blk_pull(), avoid to
add extra latency when queue depth is high.

Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c | 79 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 55 insertions(+), 24 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 20bfc8c2d02e..e2701d502e51 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3865,36 +3865,31 @@ static inline int blk_mq_poll_hctx(struct request_queue *q,
 	return ret;
 }
 
-static int blk_mq_poll_io(struct bio *bio)
-{
-	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
-	blk_qc_t cookie = bio_get_private_data(bio);
-	int ret = 0;
+#define POLL_HCTX_MAX_CNT 8
 
-	/* wait until the bio is submitted really */
-	if (!blk_qc_t_ready(cookie))
-		return 0;
+static bool blk_add_unique_hctx(struct blk_mq_hw_ctx **data, int *cnt,
+		struct blk_mq_hw_ctx *hctx)
+{
+	int i;
 
-	if (!bio_flagged(bio, BIO_DONE) && blk_qc_t_valid(cookie)) {
-		struct blk_mq_hw_ctx *hctx =
-			q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
+	for (i = 0; i < *cnt; i++) {
+		if (data[i] == hctx)
+			goto exit;
+	}
 
-		ret += blk_mq_poll_hctx(q, hctx);
+	if (i < POLL_HCTX_MAX_CNT) {
+		data[i] = hctx;
+		(*cnt)++;
 	}
-	return ret;
+ exit:
+	return *cnt == POLL_HCTX_MAX_CNT;
 }
 
-static int blk_bio_poll_and_end_io(struct bio_grp_list *grps)
+static void blk_build_poll_queues(struct bio_grp_list *grps,
+		struct blk_mq_hw_ctx **data, int *cnt)
 {
-	int ret = 0;
 	int i;
 
-	/*
-	 * Poll hw queue first.
-	 *
-	 * TODO: limit max poll times and make sure to not poll same
-	 * hw queue one more time.
-	 */
 	for (i = 0; i < grps->nr_grps; i++) {
 		struct bio_grp_list_data *grp = &grps->head[i];
 		struct bio *bio;
@@ -3902,11 +3897,31 @@ static int blk_bio_poll_and_end_io(struct bio_grp_list *grps)
 		if (bio_grp_list_grp_empty(grp))
 			continue;
 
-		for (bio = grp->list.head; bio; bio = bio->bi_poll)
-			ret += blk_mq_poll_io(bio);
+		for (bio = grp->list.head; bio; bio = bio->bi_poll) {
+			blk_qc_t  cookie;
+			struct blk_mq_hw_ctx *hctx;
+			struct request_queue *q;
+
+			if (bio_flagged(bio, BIO_DONE))
+				continue;
+
+			/* wait until the bio is submitted really */
+			cookie = bio_get_private_data(bio);
+			if (!blk_qc_t_ready(cookie) || !blk_qc_t_valid(cookie))
+				continue;
+
+			q = bio->bi_bdev->bd_disk->queue;
+			hctx = q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
+			if (blk_add_unique_hctx(data, cnt, hctx))
+				return;
+		}
 	}
+}
+
+static void blk_bio_poll_reap_ios(struct bio_grp_list *grps)
+{
+	int i;
 
-	/* reap bios */
 	for (i = 0; i < grps->nr_grps; i++) {
 		struct bio_grp_list_data *grp = &grps->head[i];
 		struct bio *bio;
@@ -3931,6 +3946,22 @@ static int blk_bio_poll_and_end_io(struct bio_grp_list *grps)
 		}
 		__bio_grp_list_merge(&grp->list, &bl);
 	}
+}
+
+static int blk_bio_poll_and_end_io(struct bio_grp_list *grps)
+{
+	int ret = 0;
+	int i;
+	struct blk_mq_hw_ctx *hctx[POLL_HCTX_MAX_CNT];
+	int cnt = 0;
+
+	blk_build_poll_queues(grps, hctx, &cnt);
+
+	for (i = 0; i < cnt; i++)
+		ret += blk_mq_poll_hctx(hctx[i]->queue, hctx[i]);
+
+	blk_bio_poll_reap_ios(grps);
+
 	return ret;
 }
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

