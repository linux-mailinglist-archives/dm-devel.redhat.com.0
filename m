Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8700333CBF3
	for <lists+dm-devel@lfdr.de>; Tue, 16 Mar 2021 04:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615864773;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SwbAd1aQm3UanO1YUQXvY06xaEBb/4yMiTzSe//bt3M=;
	b=P/9upcFeOpHUyXVVOtNU6BCHl9xl+VCtPCmi4eOUB1AyjfR9MoMwZY9NdmVFHgkr8/1OHv
	VsdeEZcZGLbWu310Gy4sv6rDPARNOjD7iQfcSRZdXgHNCUVsPQVDf+8incQ56ckXXwrUCs
	3uixy29K5Bj7MsENrB2M+8TbcLiI8j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-IBtuzuYbO1-3kbTNmEPK7Q-1; Mon, 15 Mar 2021 23:18:57 -0400
X-MC-Unique: IBtuzuYbO1-3kbTNmEPK7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3EFA3E746;
	Tue, 16 Mar 2021 03:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2079A5C5DF;
	Tue, 16 Mar 2021 03:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87B7718155DE;
	Tue, 16 Mar 2021 03:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G3HOC4002663 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 23:17:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE50D2A89E; Tue, 16 Mar 2021 03:17:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-86.pek2.redhat.com [10.72.12.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26B7360C0F;
	Tue, 16 Mar 2021 03:17:12 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 16 Mar 2021 11:15:13 +0800
Message-Id: <20210316031523.864506-2-ming.lei@redhat.com>
In-Reply-To: <20210316031523.864506-1-ming.lei@redhat.com>
References: <20210316031523.864506-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 01/11] block: add helper of blk_queue_poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There has been 3 users, and will be more, so add one such helper.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c         | 2 +-
 block/blk-mq.c           | 3 +--
 drivers/nvme/host/core.c | 2 +-
 include/linux/blkdev.h   | 1 +
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index fc60ff208497..a31371d55b9d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -836,7 +836,7 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		}
 	}
 
-	if (!test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!blk_queue_poll(q))
 		bio->bi_opf &= ~REQ_HIPRI;
 
 	switch (bio_op(bio)) {
diff --git a/block/blk-mq.c b/block/blk-mq.c
index d4d7c1caa439..63c81df3b8b5 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3869,8 +3869,7 @@ int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
 	struct blk_mq_hw_ctx *hctx;
 	long state;
 
-	if (!blk_qc_t_valid(cookie) ||
-	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!blk_qc_t_valid(cookie) || !blk_queue_poll(q))
 		return 0;
 
 	if (current->plug)
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index e68a8c4ac5a6..bb7da34dd967 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -955,7 +955,7 @@ static void nvme_execute_rq_polled(struct request_queue *q,
 {
 	DECLARE_COMPLETION_ONSTACK(wait);
 
-	WARN_ON_ONCE(!test_bit(QUEUE_FLAG_POLL, &q->queue_flags));
+	WARN_ON_ONCE(!blk_queue_poll(q));
 
 	rq->cmd_flags |= REQ_HIPRI;
 	rq->end_io_data = &wait;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bc6bc8383b43..89a01850cf12 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -665,6 +665,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_fua(q)	test_bit(QUEUE_FLAG_FUA, &(q)->queue_flags)
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
 #define blk_queue_nowait(q)	test_bit(QUEUE_FLAG_NOWAIT, &(q)->queue_flags)
+#define blk_queue_poll(q)	test_bit(QUEUE_FLAG_POLL, &(q)->queue_flags)
 
 extern void blk_set_pm_only(struct request_queue *q);
 extern void blk_clear_pm_only(struct request_queue *q);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

