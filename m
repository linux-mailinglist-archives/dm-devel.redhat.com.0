Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E991C3A9B8C
	for <lists+dm-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623848831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KnM5isQukCikJIZkG5vtnFmFYgnrf4Pht1BrtBc0QNY=;
	b=YsVHQxFi6Uv95ZfyUxG3u3q2y6QA/j4AsGmV7xhLCixCdhaddo2ejCWUUV1E9ZNpEQarsH
	oYJ9531nAVDymSTbxGv+N1qlOnuE4Y+2IowMC8jahPyGr3N9DbK2QX3vDnQ8BFvOHMIan6
	eSXuAVG7JrkJi5UcrYYq5ywWZB26NGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-N9bmZqk_PhuddI1Zb7s4_Q-1; Wed, 16 Jun 2021 09:07:09 -0400
X-MC-Unique: N9bmZqk_PhuddI1Zb7s4_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 197D6100C630;
	Wed, 16 Jun 2021 13:07:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3E8A60C4A;
	Wed, 16 Jun 2021 13:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8D261809CAE;
	Wed, 16 Jun 2021 13:06:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15GD6t3Y001412 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 09:06:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 221275C1C5; Wed, 16 Jun 2021 13:06:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-48.pek2.redhat.com [10.72.12.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5C835C26D;
	Wed, 16 Jun 2021 13:06:10 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 16 Jun 2021 21:05:30 +0800
Message-Id: <20210616130533.754248-2-ming.lei@redhat.com>
In-Reply-To: <20210616130533.754248-1-ming.lei@redhat.com>
References: <20210616130533.754248-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 1/4] block: add helper of blk_queue_poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There has been 3 users, and will be more, so add one such helper.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c         | 5 ++---
 block/blk-sysfs.c        | 4 ++--
 drivers/nvme/host/core.c | 2 +-
 include/linux/blkdev.h   | 1 +
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 531176578221..1e24c71c6738 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -835,7 +835,7 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		}
 	}
 
-	if (!test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!blk_queue_poll(q))
 		bio->bi_opf &= ~REQ_POLLED;
 
 	switch (bio_op(bio)) {
@@ -1117,8 +1117,7 @@ int bio_poll(struct bio *bio, unsigned int flags)
 	blk_qc_t cookie = READ_ONCE(bio->bi_cookie);
 	int ret;
 
-	if (cookie == BLK_QC_T_NONE ||
-	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (cookie == BLK_QC_T_NONE || !blk_queue_poll(q))
 		return 0;
 
 	if (current->plug)
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index f78e73ca6091..93dcf2dfaafd 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -422,13 +422,13 @@ static ssize_t queue_poll_delay_store(struct request_queue *q, const char *page,
 
 static ssize_t queue_poll_show(struct request_queue *q, char *page)
 {
-	return queue_var_show(test_bit(QUEUE_FLAG_POLL, &q->queue_flags), page);
+	return queue_var_show(blk_queue_poll(q), page);
 }
 
 static ssize_t queue_poll_store(struct request_queue *q, const char *page,
 				size_t count)
 {
-	if (!test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+	if (!blk_queue_poll(q))
 		return -EINVAL;
 	pr_info_ratelimited("writes to the poll attribute are ignored.\n");
 	pr_info_ratelimited("please use driver specific parameters instead.\n");
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index fe0b8da3de7f..e31c7704ef4d 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1025,7 +1025,7 @@ static void nvme_execute_rq_polled(struct request_queue *q,
 {
 	DECLARE_COMPLETION_ONSTACK(wait);
 
-	WARN_ON_ONCE(!test_bit(QUEUE_FLAG_POLL, &q->queue_flags));
+	WARN_ON_ONCE(!blk_queue_poll(q));
 
 	rq->cmd_flags |= REQ_POLLED;
 	rq->end_io_data = &wait;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 561b04117bd4..fc0ba0b80776 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -677,6 +677,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_fua(q)	test_bit(QUEUE_FLAG_FUA, &(q)->queue_flags)
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
 #define blk_queue_nowait(q)	test_bit(QUEUE_FLAG_NOWAIT, &(q)->queue_flags)
+#define blk_queue_poll(q)	test_bit(QUEUE_FLAG_POLL, &(q)->queue_flags)
 
 extern void blk_set_pm_only(struct request_queue *q);
 extern void blk_clear_pm_only(struct request_queue *q);
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

