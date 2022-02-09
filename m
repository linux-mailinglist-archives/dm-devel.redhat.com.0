Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4F4AED55
	for <lists+dm-devel@lfdr.de>; Wed,  9 Feb 2022 09:56:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-6WHflpt5P9e5w49KmzE7bg-1; Wed, 09 Feb 2022 03:56:00 -0500
X-MC-Unique: 6WHflpt5P9e5w49KmzE7bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA14383DD20;
	Wed,  9 Feb 2022 08:55:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B63F4F86E;
	Wed,  9 Feb 2022 08:55:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1330E4CA93;
	Wed,  9 Feb 2022 08:55:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2198tUZ5020243 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 03:55:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB54540CFD27; Wed,  9 Feb 2022 08:55:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62C140CFD14
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 08:55:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9D6F38025E1
	for <dm-devel@redhat.com>; Wed,  9 Feb 2022 08:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-386-5dwXP-eoO3-vphgd5hWISQ-1; Wed, 09 Feb 2022 03:55:28 -0500
X-MC-Unique: 5dwXP-eoO3-vphgd5hWISQ-1
Received: from [2001:4bb8:188:3efc:ea2:7599:7eeb:4b5a] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiLQ-00GcLQ-OJ; Wed, 09 Feb 2022 08:28:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk, martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
Date: Wed,  9 Feb 2022 09:28:28 +0100
Message-Id: <20220209082828.2629273-8-hch@lst.de>
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [dm-devel] [PATCH 7/7] block: remove REQ_OP_WRITE_SAME support
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

No more users of REQ_OP_WRITE_SAME or drivers implementing it are left,
so remove the infrastructure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 13 +-----
 block/blk-lib.c           | 91 ---------------------------------------
 block/blk-merge.c         | 40 -----------------
 block/blk-settings.c      | 16 -------
 block/blk-sysfs.c         |  8 ----
 block/blk-zoned.c         |  1 -
 block/blk.h               |  1 -
 block/bounce.c            |  3 --
 include/linux/bio.h       |  3 --
 include/linux/blk_types.h |  2 -
 include/linux/blkdev.h    | 19 --------
 kernel/trace/blktrace.c   |  1 -
 12 files changed, 1 insertion(+), 197 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index be8812f5489d4..dabc771538db8 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -122,7 +122,6 @@ static const char *const blk_op_name[] = {
 	REQ_OP_NAME(ZONE_CLOSE),
 	REQ_OP_NAME(ZONE_FINISH),
 	REQ_OP_NAME(ZONE_APPEND),
-	REQ_OP_NAME(WRITE_SAME),
 	REQ_OP_NAME(WRITE_ZEROES),
 	REQ_OP_NAME(DRV_IN),
 	REQ_OP_NAME(DRV_OUT),
@@ -735,10 +734,6 @@ noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		if (!blk_queue_secure_erase(q))
 			goto not_supported;
 		break;
-	case REQ_OP_WRITE_SAME:
-		if (!q->limits.max_write_same_sectors)
-			goto not_supported;
-		break;
 	case REQ_OP_ZONE_APPEND:
 		status = blk_check_zone_append(q, bio);
 		if (status != BLK_STS_OK)
@@ -934,13 +929,7 @@ void submit_bio(struct bio *bio)
 	 * go through the normal accounting stuff before submission.
 	 */
 	if (bio_has_data(bio)) {
-		unsigned int count;
-
-		if (unlikely(bio_op(bio) == REQ_OP_WRITE_SAME))
-			count = queue_logical_block_size(
-					bdev_get_queue(bio->bi_bdev)) >> 9;
-		else
-			count = bio_sectors(bio);
+		unsigned int count = bio_sectors(bio);
 
 		if (op_is_write(bio_op(bio))) {
 			count_vm_events(PGPGOUT, count);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 1b8ced45e4e55..05d3dbfe24eaa 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -135,97 +135,6 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 }
 EXPORT_SYMBOL(blkdev_issue_discard);
 
-/**
- * __blkdev_issue_write_same - generate number of bios with same page
- * @bdev:	target blockdev
- * @sector:	start sector
- * @nr_sects:	number of sectors to write
- * @gfp_mask:	memory allocation flags (for bio_alloc)
- * @page:	page containing data to write
- * @biop:	pointer to anchor bio
- *
- * Description:
- *  Generate and issue number of bios(REQ_OP_WRITE_SAME) with same page.
- */
-static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-		sector_t nr_sects, gfp_t gfp_mask, struct page *page,
-		struct bio **biop)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-	unsigned int max_write_same_sectors;
-	struct bio *bio = *biop;
-	sector_t bs_mask;
-
-	if (!q)
-		return -ENXIO;
-
-	if (bdev_read_only(bdev))
-		return -EPERM;
-
-	bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
-	if ((sector | nr_sects) & bs_mask)
-		return -EINVAL;
-
-	if (!bdev_write_same(bdev))
-		return -EOPNOTSUPP;
-
-	/* Ensure that max_write_same_sectors doesn't overflow bi_size */
-	max_write_same_sectors = bio_allowed_max_sectors(q);
-
-	while (nr_sects) {
-		bio = blk_next_bio(bio, bdev, 1, REQ_OP_WRITE_SAME, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
-		bio->bi_vcnt = 1;
-		bio->bi_io_vec->bv_page = page;
-		bio->bi_io_vec->bv_offset = 0;
-		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-
-		if (nr_sects > max_write_same_sectors) {
-			bio->bi_iter.bi_size = max_write_same_sectors << 9;
-			nr_sects -= max_write_same_sectors;
-			sector += max_write_same_sectors;
-		} else {
-			bio->bi_iter.bi_size = nr_sects << 9;
-			nr_sects = 0;
-		}
-		cond_resched();
-	}
-
-	*biop = bio;
-	return 0;
-}
-
-/**
- * blkdev_issue_write_same - queue a write same operation
- * @bdev:	target blockdev
- * @sector:	start sector
- * @nr_sects:	number of sectors to write
- * @gfp_mask:	memory allocation flags (for bio_alloc)
- * @page:	page containing data
- *
- * Description:
- *    Issue a write same request for the sectors in question.
- */
-int blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-				sector_t nr_sects, gfp_t gfp_mask,
-				struct page *page)
-{
-	struct bio *bio = NULL;
-	struct blk_plug plug;
-	int ret;
-
-	blk_start_plug(&plug);
-	ret = __blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask, page,
-			&bio);
-	if (ret == 0 && bio) {
-		ret = submit_bio_wait(bio);
-		bio_put(bio);
-	}
-	blk_finish_plug(&plug);
-	return ret;
-}
-EXPORT_SYMBOL(blkdev_issue_write_same);
-
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 4de34a332c9fd..87cee7e82ae15 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -152,22 +152,6 @@ static struct bio *blk_bio_write_zeroes_split(struct request_queue *q,
 	return bio_split(bio, q->limits.max_write_zeroes_sectors, GFP_NOIO, bs);
 }
 
-static struct bio *blk_bio_write_same_split(struct request_queue *q,
-					    struct bio *bio,
-					    struct bio_set *bs,
-					    unsigned *nsegs)
-{
-	*nsegs = 1;
-
-	if (!q->limits.max_write_same_sectors)
-		return NULL;
-
-	if (bio_sectors(bio) <= q->limits.max_write_same_sectors)
-		return NULL;
-
-	return bio_split(bio, q->limits.max_write_same_sectors, GFP_NOIO, bs);
-}
-
 /*
  * Return the maximum number of sectors from the start of a bio that may be
  * submitted as a single request to a block device. If enough sectors remain,
@@ -351,10 +335,6 @@ void __blk_queue_split(struct request_queue *q, struct bio **bio,
 		split = blk_bio_write_zeroes_split(q, *bio, &q->bio_split,
 				nr_segs);
 		break;
-	case REQ_OP_WRITE_SAME:
-		split = blk_bio_write_same_split(q, *bio, &q->bio_split,
-				nr_segs);
-		break;
 	default:
 		split = blk_bio_segment_split(q, *bio, &q->bio_split, nr_segs);
 		break;
@@ -416,8 +396,6 @@ unsigned int blk_recalc_rq_segments(struct request *rq)
 		return 1;
 	case REQ_OP_WRITE_ZEROES:
 		return 0;
-	case REQ_OP_WRITE_SAME:
-		return 1;
 	}
 
 	rq_for_each_bvec(bv, rq, iter)
@@ -555,8 +533,6 @@ int __blk_rq_map_sg(struct request_queue *q, struct request *rq,
 
 	if (rq->rq_flags & RQF_SPECIAL_PAYLOAD)
 		nsegs = __blk_bvec_map_sg(rq->special_vec, sglist, last_sg);
-	else if (rq->bio && bio_op(rq->bio) == REQ_OP_WRITE_SAME)
-		nsegs = __blk_bvec_map_sg(bio_iovec(rq->bio), sglist, last_sg);
 	else if (rq->bio)
 		nsegs = __blk_bios_map_sg(q, rq->bio, sglist, last_sg);
 
@@ -757,13 +733,6 @@ static enum elv_merge blk_try_req_merge(struct request *req,
 	return ELEVATOR_NO_MERGE;
 }
 
-static inline bool blk_write_same_mergeable(struct bio *a, struct bio *b)
-{
-	if (bio_page(a) == bio_page(b) && bio_offset(a) == bio_offset(b))
-		return true;
-	return false;
-}
-
 /*
  * For non-mq, this has to be called with the request spinlock acquired.
  * For mq with scheduling, the appropriate queue wide lock should be held.
@@ -780,10 +749,6 @@ static struct request *attempt_merge(struct request_queue *q,
 	if (rq_data_dir(req) != rq_data_dir(next))
 		return NULL;
 
-	if (req_op(req) == REQ_OP_WRITE_SAME &&
-	    !blk_write_same_mergeable(req->bio, next->bio))
-		return NULL;
-
 	/*
 	 * Don't allow merge of different write hints, or for a hint with
 	 * non-hint IO.
@@ -912,11 +877,6 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (!bio_crypt_rq_ctx_compatible(rq, bio))
 		return false;
 
-	/* must be using the same buffer */
-	if (req_op(rq) == REQ_OP_WRITE_SAME &&
-	    !blk_write_same_mergeable(rq->bio, bio))
-		return false;
-
 	/*
 	 * Don't allow merge of different write hints, or for a hint with
 	 * non-hint IO.
diff --git a/block/blk-settings.c b/block/blk-settings.c
index b880c70e22e4e..b83df3d2eebca 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -42,7 +42,6 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->max_sectors = lim->max_hw_sectors = BLK_SAFE_MAX_SECTORS;
 	lim->max_dev_sectors = 0;
 	lim->chunk_sectors = 0;
-	lim->max_write_same_sectors = 0;
 	lim->max_write_zeroes_sectors = 0;
 	lim->max_zone_append_sectors = 0;
 	lim->max_discard_sectors = 0;
@@ -79,7 +78,6 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_segment_size = UINT_MAX;
 	lim->max_sectors = UINT_MAX;
 	lim->max_dev_sectors = UINT_MAX;
-	lim->max_write_same_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
 }
@@ -178,18 +176,6 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
-/**
- * blk_queue_max_write_same_sectors - set max sectors for a single write same
- * @q:  the request queue for the device
- * @max_write_same_sectors: maximum number of sectors to write per command
- **/
-void blk_queue_max_write_same_sectors(struct request_queue *q,
-				      unsigned int max_write_same_sectors)
-{
-	q->limits.max_write_same_sectors = max_write_same_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_write_same_sectors);
-
 /**
  * blk_queue_max_write_zeroes_sectors - set max sectors for a single
  *                                      write zeroes
@@ -519,8 +505,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_sectors = min_not_zero(t->max_sectors, b->max_sectors);
 	t->max_hw_sectors = min_not_zero(t->max_hw_sectors, b->max_hw_sectors);
 	t->max_dev_sectors = min_not_zero(t->max_dev_sectors, b->max_dev_sectors);
-	t->max_write_same_sectors = min(t->max_write_same_sectors,
-					b->max_write_same_sectors);
 	t->max_write_zeroes_sectors = min(t->max_write_zeroes_sectors,
 					b->max_write_zeroes_sectors);
 	t->max_zone_append_sectors = min(t->max_zone_append_sectors,
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 9f32882ceb2f6..4a5bb47bee3ce 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -212,12 +212,6 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
 	return queue_var_show(0, page);
 }
 
-static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
-{
-	return sprintf(page, "%llu\n",
-		(unsigned long long)q->limits.max_write_same_sectors << 9);
-}
-
 static ssize_t queue_write_zeroes_max_show(struct request_queue *q, char *page)
 {
 	return sprintf(page, "%llu\n",
@@ -587,7 +581,6 @@ QUEUE_RO_ENTRY(queue_discard_max_hw, "discard_max_hw_bytes");
 QUEUE_RW_ENTRY(queue_discard_max, "discard_max_bytes");
 QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
 
-QUEUE_RO_ENTRY(queue_write_same_max, "write_same_max_bytes");
 QUEUE_RO_ENTRY(queue_write_zeroes_max, "write_zeroes_max_bytes");
 QUEUE_RO_ENTRY(queue_zone_append_max, "zone_append_max_bytes");
 QUEUE_RO_ENTRY(queue_zone_write_granularity, "zone_write_granularity");
@@ -643,7 +636,6 @@ static struct attribute *queue_attrs[] = {
 	&queue_discard_max_entry.attr,
 	&queue_discard_max_hw_entry.attr,
 	&queue_discard_zeroes_data_entry.attr,
-	&queue_write_same_max_entry.attr,
 	&queue_write_zeroes_max_entry.attr,
 	&queue_zone_append_max_entry.attr,
 	&queue_zone_write_granularity_entry.attr,
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 602bef54c8134..38cd840d88387 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -65,7 +65,6 @@ bool blk_req_needs_zone_write_lock(struct request *rq)
 
 	switch (req_op(rq)) {
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 	case REQ_OP_WRITE:
 		return blk_rq_zone_is_seq(rq);
 	default:
diff --git a/block/blk.h b/block/blk.h
index abb663a2a147b..2fe483bcc6d38 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -286,7 +286,6 @@ static inline bool blk_may_split(struct request_queue *q, struct bio *bio)
 	case REQ_OP_DISCARD:
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
 		return true; /* non-trivial splitting decisions */
 	default:
 		break;
diff --git a/block/bounce.c b/block/bounce.c
index 3fd3bc6fd5dbb..d9df1788c440c 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -178,9 +178,6 @@ static struct bio *bounce_clone_bio(struct bio *bio_src)
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
 		break;
-	case REQ_OP_WRITE_SAME:
-		bio->bi_io_vec[bio->bi_vcnt++] = bio_src->bi_io_vec[0];
-		break;
 	default:
 		bio_for_each_segment(bv, bio_src, iter)
 			bio->bi_io_vec[bio->bi_vcnt++] = bv;
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 7523aba4ddf7c..74bf16558ef4b 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -65,7 +65,6 @@ static inline bool bio_no_advance_iter(const struct bio *bio)
 {
 	return bio_op(bio) == REQ_OP_DISCARD ||
 	       bio_op(bio) == REQ_OP_SECURE_ERASE ||
-	       bio_op(bio) == REQ_OP_WRITE_SAME ||
 	       bio_op(bio) == REQ_OP_WRITE_ZEROES;
 }
 
@@ -186,8 +185,6 @@ static inline unsigned bio_segments(struct bio *bio)
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
 		return 0;
-	case REQ_OP_WRITE_SAME:
-		return 1;
 	default:
 		break;
 	}
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 5561e58d158ac..e72cb45593fbe 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -361,8 +361,6 @@ enum req_opf {
 	REQ_OP_DISCARD		= 3,
 	/* securely erase sectors */
 	REQ_OP_SECURE_ERASE	= 5,
-	/* write the same sector many times */
-	REQ_OP_WRITE_SAME	= 7,
 	/* write the zero filled sector many times */
 	REQ_OP_WRITE_ZEROES	= 9,
 	/* Open a zone */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3bfc75a2a4509..b92345c044991 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -247,7 +247,6 @@ struct queue_limits {
 	unsigned int		io_opt;
 	unsigned int		max_discard_sectors;
 	unsigned int		max_hw_discard_sectors;
-	unsigned int		max_write_same_sectors;
 	unsigned int		max_write_zeroes_sectors;
 	unsigned int		max_zone_append_sectors;
 	unsigned int		discard_granularity;
@@ -913,9 +912,6 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 		return min(q->limits.max_discard_sectors,
 			   UINT_MAX >> SECTOR_SHIFT);
 
-	if (unlikely(op == REQ_OP_WRITE_SAME))
-		return q->limits.max_write_same_sectors;
-
 	if (unlikely(op == REQ_OP_WRITE_ZEROES))
 		return q->limits.max_write_zeroes_sectors;
 
@@ -958,8 +954,6 @@ extern void blk_queue_max_discard_segments(struct request_queue *,
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
 extern void blk_queue_max_discard_sectors(struct request_queue *q,
 		unsigned int max_discard_sectors);
-extern void blk_queue_max_write_same_sectors(struct request_queue *q,
-		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
 extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
@@ -1096,9 +1090,6 @@ static inline long nr_blockdev_pages(void)
 
 extern void blk_io_schedule(void);
 
-extern int blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
-		sector_t nr_sects, gfp_t gfp_mask, struct page *page);
-
 #define BLKDEV_DISCARD_SECURE	(1 << 0)	/* issue a secure erase */
 
 extern int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
@@ -1325,16 +1316,6 @@ static inline int bdev_discard_alignment(struct block_device *bdev)
 	return q->limits.discard_alignment;
 }
 
-static inline unsigned int bdev_write_same(struct block_device *bdev)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-
-	if (q)
-		return q->limits.max_write_same_sectors;
-
-	return 0;
-}
-
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index af68a67179b48..19514edc44f71 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -1892,7 +1892,6 @@ void blk_fill_rwbs(char *rwbs, unsigned int op)
 
 	switch (op & REQ_OP_MASK) {
 	case REQ_OP_WRITE:
-	case REQ_OP_WRITE_SAME:
 		rwbs[i++] = 'W';
 		break;
 	case REQ_OP_DISCARD:
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

