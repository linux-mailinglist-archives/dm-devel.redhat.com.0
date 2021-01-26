Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 189563038B5
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 10:10:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-k11Na5xYNcuAYV8azJX7Zw-1; Tue, 26 Jan 2021 04:10:34 -0500
X-MC-Unique: k11Na5xYNcuAYV8azJX7Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF690107ACF8;
	Tue, 26 Jan 2021 09:10:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97E8210013BD;
	Tue, 26 Jan 2021 09:10:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 525B94E58E;
	Tue, 26 Jan 2021 09:10:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PCDtju021894 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 07:13:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F305449C38; Mon, 25 Jan 2021 12:13:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDD7C4C80A
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 503A8800B3B
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:52 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-211-3D7_mw38N1OPIalPP_4nEQ-1;
	Mon, 25 Jan 2021 07:13:46 -0500
X-MC-Unique: 3D7_mw38N1OPIalPP_4nEQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UMqjSks_1611576822
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UMqjSks_1611576822) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 25 Jan 2021 20:13:42 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com
Date: Mon, 25 Jan 2021 20:13:37 +0800
Message-Id: <20210125121340.70459-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 26 Jan 2021 04:10:04 -0500
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: [dm-devel] [PATCH v2 3/6] block: add iopoll method to support
	bio-based IO polling
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

->poll_fn was introduced in commit ea435e1b9392 ("block: add a poll_fn
callback to struct request_queue") to support bio-based queues such as
nvme multipath, but was later removed in commit 529262d56dbe ("block:
remove ->poll_fn").

Given commit c62b37d96b6e ("block: move ->make_request_fn to struct
block_device_operations") restore the possibility of bio-based IO
polling support by adding an ->iopoll method to gendisk->fops.
Elevate bulk of blk_mq_poll() implementation to blk_poll() and reduce
blk_mq_poll() to blk-mq specific code that is called from blk_poll().

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Suggested-by: Mike Snitzer <snitzer@redhat.com>
---
 block/blk-core.c       | 70 +++++++++++++++++++++++++++++++++++++++
 block/blk-mq.c         | 74 ++++++------------------------------------
 include/linux/blk-mq.h |  3 ++
 include/linux/blkdev.h |  1 +
 4 files changed, 84 insertions(+), 64 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 7663a9b94b80..3d93aaa9a49b 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1132,6 +1132,76 @@ blk_qc_t submit_bio(struct bio *bio)
 }
 EXPORT_SYMBOL(submit_bio);
 
+/**
+ * blk_poll - poll for IO completions
+ * @q:  the queue
+ * @cookie: cookie passed back at IO submission time
+ * @spin: whether to spin for completions
+ *
+ * Description:
+ *    Poll for completions on the passed in queue. Returns number of
+ *    completed entries found. If @spin is true, then blk_poll will continue
+ *    looping until at least one completion is found, unless the task is
+ *    otherwise marked running (or we need to reschedule).
+ */
+int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
+{
+	long state;
+	struct blk_mq_hw_ctx *hctx = NULL;
+	struct gendisk *disk = NULL;
+
+	if (!blk_qc_t_valid(cookie) ||
+	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
+		return 0;
+
+	if (current->plug)
+		blk_flush_plug_list(current->plug, false);
+
+	if (queue_is_mq(q)) {
+		/*
+		 * If we sleep, have the caller restart the poll loop to reset
+		 * the state. Like for the other success return cases, the
+		 * caller is responsible for checking if the IO completed. If
+		 * the IO isn't complete, we'll get called again and will go
+		 * straight to the busy poll loop. If specified not to spin,
+		 * we also should not sleep.
+		 */
+		hctx = q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
+		if (spin && blk_mq_poll_hybrid(q, hctx, cookie))
+			return 1;
+		hctx->poll_considered++;
+	} else
+		disk = queue_to_disk(q);
+
+	state = current->state;
+	do {
+		int ret;
+
+		if (hctx)
+			ret = blk_mq_poll(q, hctx);
+		else if (disk->fops->iopoll)
+			ret = disk->fops->iopoll(q, cookie);
+
+		if (ret > 0) {
+			__set_current_state(TASK_RUNNING);
+			return ret;
+		}
+
+		if (signal_pending_state(state, current))
+			__set_current_state(TASK_RUNNING);
+
+		if (current->state == TASK_RUNNING)
+			return 1;
+		if (ret < 0 || !spin)
+			break;
+		cpu_relax();
+	} while (!need_resched());
+
+	__set_current_state(TASK_RUNNING);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(blk_poll);
+
 /**
  * blk_cloned_rq_check_limits - Helper function to check a cloned request
  *                              for the new queue limits
diff --git a/block/blk-mq.c b/block/blk-mq.c
index f285a9123a8b..d058b9cbdf76 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3801,8 +3801,8 @@ static bool blk_mq_poll_hybrid_sleep(struct request_queue *q,
 	return true;
 }
 
-static bool blk_mq_poll_hybrid(struct request_queue *q,
-			       struct blk_mq_hw_ctx *hctx, blk_qc_t cookie)
+bool blk_mq_poll_hybrid(struct request_queue *q,
+			struct blk_mq_hw_ctx *hctx, blk_qc_t cookie)
 {
 	struct request *rq;
 
@@ -3826,72 +3826,18 @@ static bool blk_mq_poll_hybrid(struct request_queue *q,
 	return blk_mq_poll_hybrid_sleep(q, rq);
 }
 
-/**
- * blk_poll - poll for IO completions
- * @q:  the queue
- * @cookie: cookie passed back at IO submission time
- * @spin: whether to spin for completions
- *
- * Description:
- *    Poll for completions on the passed in queue. Returns number of
- *    completed entries found. If @spin is true, then blk_poll will continue
- *    looping until at least one completion is found, unless the task is
- *    otherwise marked running (or we need to reschedule).
- */
-int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
+int blk_mq_poll(struct request_queue *q, struct blk_mq_hw_ctx *hctx)
 {
-	struct blk_mq_hw_ctx *hctx;
-	long state;
-
-	if (!blk_qc_t_valid(cookie) ||
-	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
-		return 0;
-
-	if (current->plug)
-		blk_flush_plug_list(current->plug, false);
-
-	hctx = q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
-
-	/*
-	 * If we sleep, have the caller restart the poll loop to reset
-	 * the state. Like for the other success return cases, the
-	 * caller is responsible for checking if the IO completed. If
-	 * the IO isn't complete, we'll get called again and will go
-	 * straight to the busy poll loop. If specified not to spin,
-	 * we also should not sleep.
-	 */
-	if (spin && blk_mq_poll_hybrid(q, hctx, cookie))
-		return 1;
-
-	hctx->poll_considered++;
-
-	state = current->state;
-	do {
-		int ret;
-
-		hctx->poll_invoked++;
-
-		ret = q->mq_ops->poll(hctx);
-		if (ret > 0) {
-			hctx->poll_success++;
-			__set_current_state(TASK_RUNNING);
-			return ret;
-		}
-
-		if (signal_pending_state(state, current))
-			__set_current_state(TASK_RUNNING);
+	int ret;
 
-		if (current->state == TASK_RUNNING)
-			return 1;
-		if (ret < 0 || !spin)
-			break;
-		cpu_relax();
-	} while (!need_resched());
+	hctx->poll_invoked++;
+	ret = q->mq_ops->poll(hctx);
+	if (ret > 0)
+		hctx->poll_success++;
 
-	__set_current_state(TASK_RUNNING);
-	return 0;
+	return ret;
 }
-EXPORT_SYMBOL_GPL(blk_poll);
+EXPORT_SYMBOL(blk_mq_poll);
 
 unsigned int blk_mq_rq_cpu(struct request *rq)
 {
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index d705b174d346..8062a2d046a9 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -607,6 +607,9 @@ static inline void blk_rq_bio_prep(struct request *rq, struct bio *bio,
 }
 
 blk_qc_t blk_mq_submit_bio(struct bio *bio);
+int blk_mq_poll(struct request_queue *q, struct blk_mq_hw_ctx *hctx);
+bool blk_mq_poll_hybrid(struct request_queue *q,
+		struct blk_mq_hw_ctx *hctx, blk_qc_t cookie);
 void blk_mq_hctx_set_fq_lock_class(struct blk_mq_hw_ctx *hctx,
 		struct lock_class_key *key);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 2a802e011a95..bc540df197cb 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1853,6 +1853,7 @@ static inline void blk_ksm_unregister(struct request_queue *q) { }
 
 struct block_device_operations {
 	blk_qc_t (*submit_bio) (struct bio *bio);
+	int (*iopoll)(struct request_queue *q, blk_qc_t cookie);
 	int (*open) (struct block_device *, fmode_t);
 	void (*release) (struct gendisk *, fmode_t);
 	int (*rw_page)(struct block_device *, sector_t, struct page *, unsigned int);
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

