Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAEBB321261
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 09:53:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-3I078yYlMI6foGnJP1nEBg-1; Mon, 22 Feb 2021 03:53:46 -0500
X-MC-Unique: 3I078yYlMI6foGnJP1nEBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F88180197A;
	Mon, 22 Feb 2021 08:53:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58EBA77714;
	Mon, 22 Feb 2021 08:53:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E53158075;
	Mon, 22 Feb 2021 08:53:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KB710B010524 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 06:07:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B95EA200BD73; Sat, 20 Feb 2021 11:07:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B415F200ACC4
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 11:07:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B276800962
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 11:07:01 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-203-GVpTsIscNPOjfVLgKBFk1w-1;
	Sat, 20 Feb 2021 06:06:56 -0500
X-MC-Unique: GVpTsIscNPOjfVLgKBFk1w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R961e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
	TI=SMTPD_---0UP1O7pq_1613819209
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UP1O7pq_1613819209) by smtp.aliyun-inc.com(127.0.0.1);
	Sat, 20 Feb 2021 19:06:49 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com, axboe@kernel.dk
Date: Sat, 20 Feb 2021 19:06:36 +0800
Message-Id: <20210220110637.50305-12-jefflexu@linux.alibaba.com>
In-Reply-To: <20210220110637.50305-1-jefflexu@linux.alibaba.com>
References: <20210220110637.50305-1-jefflexu@linux.alibaba.com>
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
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:49:50 -0500
Cc: caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, ming.lei@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH v4 11/12] block: sub-fastpath for bio-based
	polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Offer one sub-fastpath for bio-based polling when bio submitted to dm
device gets split and enqueued into multiple hw queues, while the IO
submission process has not been migrated to another CPU.

In this case, the IO submission routine will return the CPU number on
which the IO submission happened as the returned cookie, while the
polling routine will only iterate and poll on hw queues that this CPU
number maps, instead of iterating *all* hw queues.

This optimization can dramatically reduce cache ping-pong and thus
improve the polling performance, when multiple hw queues in polling mode
per device could be reserved when there are multiple polling processes.

It will fall back to iterating all hw queues in polling mode, once the
process has ever been migrated to another CPU during the IO submission
phase.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 block/blk-core.c          | 24 ++++++++++++++--
 include/linux/blk_types.h | 60 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 82349e3c2a24..e13219908ef8 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -959,7 +959,10 @@ static blk_qc_t __submit_bio(struct bio *bio)
  *
  * Return:
  *   - BLK_QC_T_NONE, no need for IO polling.
- *   - BLK_QC_T_BIO_POLL_ALL, @bio gets split and enqueued into multi hw queues.
+ *   - When @bio gets split and enqueued into multi hw queues, return the
+ *     corresponding CPU number with BLK_QC_T_BIO_POLL_CPU flag set when the
+ *     current process has not been migrated to another CPU,
+ *     BLK_QC_T_BIO_POLL_ALL otherwise.
  *   - Otherwise, @bio is not split, returning the pointer to the corresponding
  *     hw queue that the bio enqueued into as the returned cookie.
  */
@@ -968,13 +971,17 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 	struct bio_list bio_list_on_stack[2];
 	blk_qc_t ret = BLK_QC_T_NONE;
 	struct request_queue *top_q = bio->bi_disk->queue;
-	bool poll_on = test_bit(QUEUE_FLAG_POLL, &top_q->queue_flags);
+	bool orig_poll_on, poll_on;
+	u64 old_nr_migrations;
 
 	BUG_ON(bio->bi_next);
 
 	bio_list_init(&bio_list_on_stack[0]);
 	current->bio_list = bio_list_on_stack;
 
+	orig_poll_on = poll_on = test_bit(QUEUE_FLAG_POLL, &top_q->queue_flags);
+	old_nr_migrations = READ_ONCE(current->se.nr_migrations);
+
 	do {
 		blk_qc_t cookie;
 		struct request_queue *q = bio->bi_disk->queue;
@@ -1002,7 +1009,7 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 				ret = cookie;
 			} else if (ret != cookie) {
 				/* bio gets split and enqueued to multi hctxs */
-				ret = BLK_QC_T_BIO_POLL_ALL;
+				ret = blk_qc_t_get();
 				poll_on = false;
 			}
 		}
@@ -1029,6 +1036,17 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 
 	current->bio_list = NULL;
 
+	/*
+	 * For cases when bio gets split and enqueued into multi hctxs, return
+	 * the corresponding CPU number when current process has not been
+	 * migrated to another CPU. Return BLK_QC_T_BIO_POLL_ALL otherwise,
+	 * falling back to iterating and polling on all hw queues, since split
+	 * bios are submitted to different CPUs in this case.
+	 */
+	if (orig_poll_on != poll_on &&
+	    old_nr_migrations != READ_ONCE(current->se.nr_migrations))
+		ret = BLK_QC_T_BIO_POLL_ALL;
+
 	return ret;
 }
 
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 6f27446ebada..f8d34f02378d 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -557,12 +557,68 @@ static inline bool blk_qc_t_is_internal(blk_qc_t cookie)
 	return (cookie & BLK_QC_T_INTERNAL) != 0;
 }
 
-/* Macros for blk_qc_t used for bio-based polling */
+/*
+ * Macros for blk_qc_t used for bio-based polling.
+ *
+ * 1. When @bio is not split, the returned cookie is actually the pointer to the
+ *    corresponding hw queue that the bio is enqueued into, thus the low two
+ *    bits could be reused as other flags.
+ *    +-----------------------------------------+
+ *    |        struct blk_mq_hw_ctx*        |0|0|
+ *    +-----------------------------------------+
+ *
+ * 2. When @bio gets split and enqueued into multi hw queues, and current
+ *    process has not been migrated to another CPU, the returned cookie actually
+ *    stores the corresponding CPU number on which the IO submission happened,
+ *    Also with BLK_QC_T_BIO_POLL_CPU flag set.
+ *    In this case, bio-based polling could only iterate and poll on hw queues
+ *    that this CPU number maps.
+ *    +-----------------------------------------+
+ *    |         CPU         |               |1| |
+ *    +-----------------------------------------+
+ *                                           ^
+ *                                           BLK_QC_T_BIO_POLL_CPU
+ *
+ * 3. When @bio gets split and enqueued into multi hw queues, and current
+ *    process has ever been migrated to another CPU, the returned cookie is just
+ *    BLK_QC_T_BIO_POLL_ALL flag.
+ *    In this case, bio-based polling should iterate and poll on all hw queues
+ *    in polling mode.
+ *    +-----------------------------------------+
+ *    |                                     | |1|
+ *    +-----------------------------------------+
+ *                                             ^
+ *                                             BLK_QC_T_BIO_POLL_ALL
+ *
+ * 4. Otherwise, return BLK_QC_T_NONE as the cookie.
+ *    No need for IO polling in this case.
+ *    +-----------------------------------------+
+ *    |               BLK_QC_T_NONE             |
+ *    +-----------------------------------------+
+ */
+
+/* The low two bits of cookie for bio-based polling are reused for flags. */
 #define BLK_QC_T_BIO_POLL_ALL	1U
+#define BLK_QC_T_BIO_POLL_CPU	2U
 
 static inline bool blk_qc_t_is_poll_multi(blk_qc_t cookie)
 {
-	return cookie & BLK_QC_T_BIO_POLL_ALL;
+	return cookie & (BLK_QC_T_BIO_POLL_ALL | BLK_QC_T_BIO_POLL_CPU);
+}
+
+static inline bool blk_qc_t_is_poll_cpu(blk_qc_t cookie)
+{
+	return cookie & BLK_QC_T_BIO_POLL_CPU;
+}
+
+static inline blk_qc_t blk_qc_t_get(void)
+{
+	return (raw_smp_processor_id() << BLK_QC_T_SHIFT) | BLK_QC_T_BIO_POLL_CPU;
+}
+
+static inline int blk_qc_t_to_cpu(blk_qc_t cookie)
+{
+	return cookie >> BLK_QC_T_SHIFT;
 }
 
 struct blk_rq_stat {
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

