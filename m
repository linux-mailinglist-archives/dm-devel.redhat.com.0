Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EFC663038C1
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 10:14:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-qvmzRMpbMVa4p6Clkwpl0g-1; Tue, 26 Jan 2021 04:14:41 -0500
X-MC-Unique: qvmzRMpbMVa4p6Clkwpl0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93FACB810D;
	Tue, 26 Jan 2021 09:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7313A5D9DB;
	Tue, 26 Jan 2021 09:14:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB56A180954D;
	Tue, 26 Jan 2021 09:14:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PCE1uu021927 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 07:14:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B1D72166B28; Mon, 25 Jan 2021 12:14:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6673B2166B2C
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D509E187504B
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:58 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-298-OaijrujMMnuMj5kcErnQWA-1;
	Mon, 25 Jan 2021 07:13:49 -0500
X-MC-Unique: OaijrujMMnuMj5kcErnQWA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R521e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UMqzTdK_1611576823
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UMqzTdK_1611576823) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 25 Jan 2021 20:13:43 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com
Date: Mon, 25 Jan 2021 20:13:40 +0800
Message-Id: <20210125121340.70459-7-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 26 Jan 2021 04:10:04 -0500
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: [dm-devel] [PATCH v2 6/6] dm: support IO polling for bio-based dm
	device
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DM will iterate and poll all polling hardware queues of all target mq
devices when polling IO for dm device. To mitigate the race introduced
by iterating all target hw queues, a per-hw-queue flag is maintained
to indicate whether this polling hw queue currently being polled on or
not. Every polling hw queue is exclusive to one polling instance, i.e.,
the polling instance will skip this polling hw queue if this hw queue
currently is being polled by another polling instance, and start
polling on the next hw queue.

IO polling is enabled when all underlying target devices are capable
of IO polling. The sanity check supports the stacked device model, in
which one dm device may be build upon another dm device. In this case,
the mapped device will check if the underlying dm target device
supports IO polling.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 block/blk-core.c      |   8 ++-
 drivers/md/dm-core.h  |  21 +++++++
 drivers/md/dm-table.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 drivers/md/dm.c       |  37 ++++++++++++
 4 files changed, 192 insertions(+), 1 deletion(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 3d93aaa9a49b..d81a5f0faa1d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1150,7 +1150,13 @@ int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
 	struct blk_mq_hw_ctx *hctx = NULL;
 	struct gendisk *disk = NULL;
 
-	if (!blk_qc_t_valid(cookie) ||
+	/*
+	 * In case of bio-base polling, the returned cookie is actually that of
+	 * the last split bio. Thus the returned cookie may be BLK_QC_T_NONE,
+	 * while the previous split bios have already been submitted and queued
+	 * into the polling hw queue.
+	 */
+	if ((queue_is_mq(q) && !blk_qc_t_valid(cookie)) ||
 	    !test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
 		return 0;
 
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 086d293c2b03..5a0391aa5cc7 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -127,6 +127,24 @@ static inline struct dm_stats *dm_get_stats(struct mapped_device *md)
 
 #define DM_TABLE_MAX_DEPTH 16
 
+enum target_ctx_type {
+	TARGET_TYPE_MQ,
+	TARGET_TYPE_DM,
+};
+
+struct target_ctx {
+	union {
+		struct {
+			struct blk_mq_hw_ctx *hctx;
+			struct request_queue *q;
+			atomic_t busy;
+		};
+		struct mapped_device *md;
+	};
+
+	int type;
+};
+
 struct dm_table {
 	struct mapped_device *md;
 	enum dm_queue_mode type;
@@ -162,6 +180,9 @@ struct dm_table {
 	void *event_context;
 
 	struct dm_md_mempools *mempools;
+
+	int num_ctx;
+	struct target_ctx *ctxs;
 };
 
 static inline struct completion *dm_get_completion_from_kobject(struct kobject *kobj)
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 188f41287f18..397bb5f57626 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -215,6 +215,8 @@ void dm_table_destroy(struct dm_table *t)
 
 	dm_free_md_mempools(t->mempools);
 
+	kfree(t->ctxs);
+
 	kfree(t);
 }
 
@@ -1194,6 +1196,114 @@ static int dm_table_register_integrity(struct dm_table *t)
 	return 0;
 }
 
+static int device_supports_poll(struct dm_target *ti, struct dm_dev *dev,
+				sector_t start, sector_t len, void *data)
+{
+	struct request_queue *q = bdev_get_queue(dev->bdev);
+
+	return q && test_bit(QUEUE_FLAG_POLL, &q->queue_flags);
+}
+
+static bool dm_table_supports_poll(struct dm_table *t)
+{
+	struct dm_target *ti;
+	unsigned int i;
+
+	/* Ensure that all targets support iopoll. */
+	for (i = 0; i < dm_table_get_num_targets(t); i++) {
+		ti = dm_table_get_target(t, i);
+
+		if (!ti->type->iterate_devices ||
+		    !ti->type->iterate_devices(ti, device_supports_poll, NULL))
+			return false;
+	}
+
+	return true;
+}
+
+static int dm_table_calc_target_ctxs(struct dm_target *ti,
+		struct dm_dev *dev,
+		sector_t start, sector_t len,
+		void *data)
+{
+	int *num = data;
+	struct request_queue *q = dev->bdev->bd_disk->queue;
+
+	if (queue_is_mq(q))
+		*num += q->tag_set->map[HCTX_TYPE_POLL].nr_queues;
+	else
+		*num += 1;
+
+	return 0;
+}
+
+static int dm_table_fill_target_ctxs(struct dm_target *ti,
+		struct dm_dev *dev,
+		sector_t start, sector_t len,
+		void *data)
+{
+	int *index = data;
+	struct target_ctx *ctx;
+	struct request_queue *q = dev->bdev->bd_disk->queue;
+
+	if (queue_is_mq(q)) {
+		int i;
+		int num = q->tag_set->map[HCTX_TYPE_POLL].nr_queues;
+		int offset = q->tag_set->map[HCTX_TYPE_POLL].queue_offset;
+
+		for (i = 0; i < num; i++) {
+			ctx = &ti->table->ctxs[(*index)++];
+			ctx->q = q;
+			ctx->hctx = q->queue_hw_ctx[offset + i];
+			ctx->type = TARGET_TYPE_MQ;
+			/* ctx->busy has been initialized to zero */
+		}
+	} else {
+		struct mapped_device *md = dev->bdev->bd_disk->private_data;
+
+		ctx = &ti->table->ctxs[(*index)++];
+		ctx->md = md;
+		ctx->type = TARGET_TYPE_DM;
+	}
+
+	return 0;
+}
+
+static int dm_table_build_target_ctxs(struct dm_table *t)
+{
+	int i, num = 0, index = 0;
+
+	if (!__table_type_bio_based(t->type) || !dm_table_supports_poll(t))
+		return 0;
+
+	for (i = 0; i < t->num_targets; i++) {
+		struct dm_target *ti = dm_table_get_target(t, i);
+
+		if (ti->type->iterate_devices)
+			ti->type->iterate_devices(ti, dm_table_calc_target_ctxs,
+					&num);
+	}
+
+	if (WARN_ON(!num))
+		return 0;
+
+	t->num_ctx = num;
+
+	t->ctxs = kcalloc(num, sizeof(struct target_ctx), GFP_KERNEL);
+	if (!t->ctxs)
+		return -ENOMEM;
+
+	for (i = 0; i < t->num_targets; i++) {
+		struct dm_target *ti = dm_table_get_target(t, i);
+
+		if (ti->type->iterate_devices)
+			ti->type->iterate_devices(ti, dm_table_fill_target_ctxs,
+					&index);
+	}
+
+	return 0;
+}
+
 /*
  * Prepares the table for use by building the indices,
  * setting the type, and allocating mempools.
@@ -1224,6 +1334,10 @@ int dm_table_complete(struct dm_table *t)
 	if (r)
 		DMERR("unable to allocate mempools");
 
+	r = dm_table_build_target_ctxs(t);
+	if (r)
+		DMERR("unable to build target hctxs");
+
 	return r;
 }
 
@@ -1883,6 +1997,19 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 #endif
 
 	blk_queue_update_readahead(q);
+
+	/*
+	 * Check for request-based device is remained to
+	 * dm_mq_init_request_queue()->blk_mq_init_allocated_queue().
+	 * Also clear previously set QUEUE_FLAG_POLL* if the new table doesn't
+	 * support iopoll while reloading table.
+	 */
+	if (__table_type_bio_based(t->type)) {
+		if (t->ctxs)
+			q->queue_flags |= QUEUE_FLAG_POLL_MASK;
+		else
+			q->queue_flags &= ~QUEUE_FLAG_POLL_MASK;
+	}
 }
 
 unsigned int dm_table_get_num_targets(struct dm_table *t)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 46ca3b739396..e2be1caa086a 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1657,6 +1657,42 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
 	return BLK_QC_T_NONE;
 }
 
+
+static int dm_poll_one_md(struct mapped_device *md)
+{
+	int i, num_ctx, srcu_idx, ret = 0;
+	struct dm_table *t;
+	struct target_ctx *ctxs;
+
+	t = dm_get_live_table(md, &srcu_idx);
+	num_ctx = t->num_ctx;
+	ctxs = t->ctxs;
+
+	for (i = 0; i < num_ctx; i++) {
+		struct target_ctx *ctx = &ctxs[i];
+
+		if (ctx->type == TARGET_TYPE_MQ) {
+			if (!atomic_cmpxchg(&ctx->busy, 0, 1)) {
+				ret += blk_mq_poll(ctx->q, ctx->hctx);
+				atomic_set(&ctx->busy, 0);
+			}
+		} else
+			ret += dm_poll_one_md(ctx->md);
+	}
+
+	dm_put_live_table(md, srcu_idx);
+
+	return ret;
+}
+
+static int dm_bio_poll(struct request_queue *q, blk_qc_t cookie)
+{
+	struct gendisk *disk = queue_to_disk(q);
+	struct mapped_device *md= disk->private_data;
+
+	return dm_poll_one_md(md);
+}
+
 /*-----------------------------------------------------------------
  * An IDR is used to keep track of allocated minor numbers.
  *---------------------------------------------------------------*/
@@ -3049,6 +3085,7 @@ static const struct pr_ops dm_pr_ops = {
 };
 
 static const struct block_device_operations dm_blk_dops = {
+	.iopoll = dm_bio_poll,
 	.submit_bio = dm_submit_bio,
 	.open = dm_blk_open,
 	.release = dm_blk_close,
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

