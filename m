Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6E13A20BFC7
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243474;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7bEow2l7ZUgd22TvKIP8oQlhiDupJKKn/CgMnmaMB9w=;
	b=iqFGjQ2yi9rNaJ85nBX+Q/fQ2hIA3lKgThYsEUelBwimaJmS216jHevGaOu2NwR9/SqAR2
	KryMwNySBL/8b9bzQDBDkS8/kqHHQihFkSSPmEvD5Jx/kLYckQ/tkvbKRBewDCo5x9jj1I
	2ZSLKwJRQOaAn7ZSUkr3LYsCyEa8A4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-GlOgzQuFMq6P9hbI-14OgA-1; Sat, 27 Jun 2020 03:37:51 -0400
X-MC-Unique: GlOgzQuFMq6P9hbI-14OgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826D810059A6;
	Sat, 27 Jun 2020 07:37:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F82612BA;
	Sat, 27 Jun 2020 07:37:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22F2B1809557;
	Sat, 27 Jun 2020 07:37:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bYpp004421 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F68A2156A4A; Sat, 27 Jun 2020 07:37:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8D02156A3A
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 565CC800260
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-174-YWH_pDfYMSmJxJFBn6Wsuw-1; Sat, 27 Jun 2020 03:37:28 -0400
X-MC-Unique: YWH_pDfYMSmJxJFBn6Wsuw-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5KS-0006q3-6c; Sat, 27 Jun 2020 07:32:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:58 +0200
Message-Id: <20200627073159.2447325-14-hch@lst.de>
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] [PATCH 13/14] blk-cgroup: remove blkcg_bio_issue_check
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

blkcg_bio_issue_check is a giant inline function that does three entirely
different things.  Factor out the blk-cgroup related bio initalization
into a new helper, and the open code the sequence in the only caller,
relying on the fact that all the actual functionality is stubbed out for
non-cgroup builds.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c         | 34 +++++++++++++++++++++++
 block/blk-core.c           |  7 ++++-
 block/blk-throttle.c       |  5 ++--
 block/blk.h                |  2 ++
 include/linux/blk-cgroup.h | 56 ++------------------------------------
 5 files changed, 47 insertions(+), 57 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index d21ec2acd716e7..1ce94afc03bcfd 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1813,6 +1813,40 @@ void bio_clone_blkg_association(struct bio *dst, struct bio *src)
 }
 EXPORT_SYMBOL_GPL(bio_clone_blkg_association);
 
+static int blk_cgroup_io_type(struct bio *bio)
+{
+	if (op_is_discard(bio->bi_opf))
+		return BLKG_IOSTAT_DISCARD;
+	if (op_is_write(bio->bi_opf))
+		return BLKG_IOSTAT_WRITE;
+	return BLKG_IOSTAT_READ;
+}
+
+void blk_cgroup_bio_start(struct bio *bio)
+{
+	int rwd = blk_cgroup_io_type(bio), cpu;
+	struct blkg_iostat_set *bis;
+
+	cpu = get_cpu();
+	bis = per_cpu_ptr(bio->bi_blkg->iostat_cpu, cpu);
+	u64_stats_update_begin(&bis->sync);
+
+	/*
+	 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
+	 * bio and we would have already accounted for the size of the bio.
+	 */
+	if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
+		bio_set_flag(bio, BIO_CGROUP_ACCT);
+			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
+	}
+	bis->cur.ios[rwd]++;
+
+	u64_stats_update_end(&bis->sync);
+	if (cgroup_subsys_on_dfl(io_cgrp_subsys))
+		cgroup_rstat_updated(bio->bi_blkg->blkcg->css.cgroup, cpu);
+	put_cpu();
+}
+
 static int __init blkcg_init(void)
 {
 	blkcg_punt_bio_wq = alloc_workqueue("blkcg_punt_bio",
diff --git a/block/blk-core.c b/block/blk-core.c
index a9769c1a287546..76cfd5709f66cd 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1073,8 +1073,13 @@ generic_make_request_checks(struct bio *bio)
 	if (unlikely(!current->io_context))
 		create_task_io_context(current, GFP_ATOMIC, q->node);
 
-	if (!blkcg_bio_issue_check(q, bio))
+	if (blk_throtl_bio(bio)) {
+		blkcg_bio_issue_init(bio);
 		return false;
+	}
+
+	blk_cgroup_bio_start(bio);
+	blkcg_bio_issue_init(bio);
 
 	if (!bio_flagged(bio, BIO_TRACE_COMPLETION)) {
 		trace_block_bio_queue(q, bio);
diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index ac008345050010..9d00f62c05ecdf 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -2158,9 +2158,10 @@ static inline void throtl_update_latency_buckets(struct throtl_data *td)
 }
 #endif
 
-bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
-		    struct bio *bio)
+bool blk_throtl_bio(struct bio *bio)
 {
+	struct request_queue *q = bio->bi_disk->queue;
+	struct blkcg_gq *blkg = bio->bi_blkg;
 	struct throtl_qnode *qn = NULL;
 	struct throtl_grp *tg = blkg_to_tg(blkg ?: q->root_blkg);
 	struct throtl_service_queue *sq;
diff --git a/block/blk.h b/block/blk.h
index 3a120a070dac82..41a50880c94e98 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -288,10 +288,12 @@ int create_task_io_context(struct task_struct *task, gfp_t gfp_mask, int node);
 extern int blk_throtl_init(struct request_queue *q);
 extern void blk_throtl_exit(struct request_queue *q);
 extern void blk_throtl_register_queue(struct request_queue *q);
+bool blk_throtl_bio(struct bio *bio);
 #else /* CONFIG_BLK_DEV_THROTTLING */
 static inline int blk_throtl_init(struct request_queue *q) { return 0; }
 static inline void blk_throtl_exit(struct request_queue *q) { }
 static inline void blk_throtl_register_queue(struct request_queue *q) { }
+static inline bool blk_throtl_bio(struct bio *bio) { return false; }
 #endif /* CONFIG_BLK_DEV_THROTTLING */
 #ifdef CONFIG_BLK_DEV_THROTTLING_LOW
 extern ssize_t blk_throtl_sample_time_show(struct request_queue *q, char *page);
diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index 8ab043c911f233..431b2d18bf4074 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -517,14 +517,6 @@ static inline void blkg_put(struct blkcg_gq *blkg)
 		if (((d_blkg) = __blkg_lookup(css_to_blkcg(pos_css),	\
 					      (p_blkg)->q, false)))
 
-#ifdef CONFIG_BLK_DEV_THROTTLING
-extern bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
-			   struct bio *bio);
-#else
-static inline bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
-				  struct bio *bio) { return false; }
-#endif
-
 bool __blkcg_punt_bio_submit(struct bio *bio);
 
 static inline bool blkcg_punt_bio_submit(struct bio *bio)
@@ -540,50 +532,6 @@ static inline void blkcg_bio_issue_init(struct bio *bio)
 	bio_issue_init(&bio->bi_issue, bio_sectors(bio));
 }
 
-static inline bool blkcg_bio_issue_check(struct request_queue *q,
-					 struct bio *bio)
-{
-	struct blkcg_gq *blkg = bio->bi_blkg;
-	bool throtl = false;
-
-	throtl = blk_throtl_bio(q, blkg, bio);
-	if (!throtl) {
-		struct blkg_iostat_set *bis;
-		int rwd, cpu;
-
-		if (op_is_discard(bio->bi_opf))
-			rwd = BLKG_IOSTAT_DISCARD;
-		else if (op_is_write(bio->bi_opf))
-			rwd = BLKG_IOSTAT_WRITE;
-		else
-			rwd = BLKG_IOSTAT_READ;
-
-		cpu = get_cpu();
-		bis = per_cpu_ptr(blkg->iostat_cpu, cpu);
-		u64_stats_update_begin(&bis->sync);
-
-		/*
-		 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a
-		 * split bio and we would have already accounted for the size of
-		 * the bio.
-		 */
-		if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
-			bio_set_flag(bio, BIO_CGROUP_ACCT);
-			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
-		}
-		bis->cur.ios[rwd]++;
-
-		u64_stats_update_end(&bis->sync);
-		if (cgroup_subsys_on_dfl(io_cgrp_subsys))
-			cgroup_rstat_updated(blkg->blkcg->css.cgroup, cpu);
-		put_cpu();
-	}
-
-	blkcg_bio_issue_init(bio);
-
-	return !throtl;
-}
-
 static inline void blkcg_use_delay(struct blkcg_gq *blkg)
 {
 	if (WARN_ON_ONCE(atomic_read(&blkg->use_delay) < 0))
@@ -657,6 +605,7 @@ static inline void blkcg_clear_delay(struct blkcg_gq *blkg)
 		atomic_dec(&blkg->blkcg->css.cgroup->congestion_count);
 }
 
+void blk_cgroup_bio_start(struct bio *bio);
 void blkcg_add_delay(struct blkcg_gq *blkg, u64 now, u64 delta);
 void blkcg_schedule_throttle(struct request_queue *q, bool use_memdelay);
 void blkcg_maybe_throttle_current(void);
@@ -710,8 +659,7 @@ static inline void blkg_put(struct blkcg_gq *blkg) { }
 
 static inline bool blkcg_punt_bio_submit(struct bio *bio) { return false; }
 static inline void blkcg_bio_issue_init(struct bio *bio) { }
-static inline bool blkcg_bio_issue_check(struct request_queue *q,
-					 struct bio *bio) { return true; }
+static inline void blk_cgroup_bio_start(struct bio *bio) { }
 
 #define blk_queue_for_each_rl(rl, q)	\
 	for ((rl) = &(q)->root_rl; (rl); (rl) = NULL)
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

