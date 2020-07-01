Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9930E21076C
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 11:05:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vlQla8zBP8SANqvGGI0NWw-1; Wed, 01 Jul 2020 05:05:04 -0400
X-MC-Unique: vlQla8zBP8SANqvGGI0NWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F09879513;
	Wed,  1 Jul 2020 09:04:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0324E1025EB0;
	Wed,  1 Jul 2020 09:04:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B34476C9CB;
	Wed,  1 Jul 2020 09:04:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06194Cx1012986 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 05:04:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17D29200ACC4; Wed,  1 Jul 2020 09:04:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1390E2144B38
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:04:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E01F48007CB
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:04:10 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-u5dBHA6CM-q7UXDvg9cm5w-1; Wed, 01 Jul 2020 05:04:09 -0400
X-MC-Unique: u5dBHA6CM-q7UXDvg9cm5w-1
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYb8-0008Dd-Pl; Wed, 01 Jul 2020 09:00:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 10:59:39 +0200
Message-Id: <20200701085947.3354405-13-hch@lst.de>
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [dm-devel] [PATCH 12/20] block: remove the request_queue argument
	from blk_queue_split
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

The queue can be trivially derived from the bio, so pass one less
argument.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c             | 21 ++++++++++-----------
 block/blk-mq.c                |  2 +-
 block/blk.h                   |  3 +--
 drivers/block/drbd/drbd_req.c |  2 +-
 drivers/block/pktcdvd.c       |  2 +-
 drivers/block/ps3vram.c       |  2 +-
 drivers/block/rsxx/dev.c      |  2 +-
 drivers/block/umem.c          |  2 +-
 drivers/lightnvm/pblk-init.c  |  4 ++--
 drivers/md/dm.c               |  2 +-
 drivers/md/md.c               |  2 +-
 drivers/nvme/host/multipath.c |  9 ++++-----
 drivers/s390/block/dcssblk.c  |  2 +-
 drivers/s390/block/xpram.c    |  2 +-
 include/linux/blkdev.h        |  2 +-
 15 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 9c9fb21584b64e..20fa2290604105 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -283,20 +283,20 @@ static struct bio *blk_bio_segment_split(struct request_queue *q,
 
 /**
  * __blk_queue_split - split a bio and submit the second half
- * @q:       [in] request queue pointer
  * @bio:     [in, out] bio to be split
  * @nr_segs: [out] number of segments in the first bio
  *
  * Split a bio into two bios, chain the two bios, submit the second half and
  * store a pointer to the first half in *@bio. If the second bio is still too
  * big it will be split by a recursive call to this function. Since this
- * function may allocate a new bio from @q->bio_split, it is the responsibility
- * of the caller to ensure that @q is only released after processing of the
+ * function may allocate a new bio from @bio->bi_disk->queue->bio_split, it is
+ * the responsibility of the caller to ensure that
+ * @bio->bi_disk->queue->bio_split is only released after processing of the
  * split bio has finished.
  */
-void __blk_queue_split(struct request_queue *q, struct bio **bio,
-		unsigned int *nr_segs)
+void __blk_queue_split(struct bio **bio, unsigned int *nr_segs)
 {
+	struct request_queue *q = (*bio)->bi_disk->queue;
 	struct bio *split = NULL;
 
 	switch (bio_op(*bio)) {
@@ -345,20 +345,19 @@ void __blk_queue_split(struct request_queue *q, struct bio **bio,
 
 /**
  * blk_queue_split - split a bio and submit the second half
- * @q:   [in] request queue pointer
  * @bio: [in, out] bio to be split
  *
  * Split a bio into two bios, chains the two bios, submit the second half and
  * store a pointer to the first half in *@bio. Since this function may allocate
- * a new bio from @q->bio_split, it is the responsibility of the caller to
- * ensure that @q is only released after processing of the split bio has
- * finished.
+ * a new bio from @bio->bi_disk->queue->bio_split, it is the responsibility of
+ * the caller to ensure that @bio->bi_disk->queue->bio_split is only released
+ * after processing of the split bio has finished.
  */
-void blk_queue_split(struct request_queue *q, struct bio **bio)
+void blk_queue_split(struct bio **bio)
 {
 	unsigned int nr_segs;
 
-	__blk_queue_split(q, bio, &nr_segs);
+	__blk_queue_split(bio, &nr_segs);
 }
 EXPORT_SYMBOL(blk_queue_split);
 
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 65e0846fd06519..dbadb7defd618a 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2166,7 +2166,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 	blk_status_t ret;
 
 	blk_queue_bounce(q, &bio);
-	__blk_queue_split(q, &bio, &nr_segs);
+	__blk_queue_split(&bio, &nr_segs);
 
 	if (!bio_integrity_prep(bio))
 		goto queue_exit;
diff --git a/block/blk.h b/block/blk.h
index 0184a31fe4dfaf..0114fd92c8a05b 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -220,8 +220,7 @@ ssize_t part_timeout_show(struct device *, struct device_attribute *, char *);
 ssize_t part_timeout_store(struct device *, struct device_attribute *,
 				const char *, size_t);
 
-void __blk_queue_split(struct request_queue *q, struct bio **bio,
-		unsigned int *nr_segs);
+void __blk_queue_split(struct bio **bio, unsigned int *nr_segs);
 int ll_back_merge_fn(struct request *req, struct bio *bio,
 		unsigned int nr_segs);
 int ll_front_merge_fn(struct request *req,  struct bio *bio,
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 3f09b2ab977822..9368680474223a 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1598,7 +1598,7 @@ blk_qc_t drbd_make_request(struct request_queue *q, struct bio *bio)
 	struct drbd_device *device = bio->bi_disk->private_data;
 	unsigned long start_jif;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	start_jif = jiffies;
 
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 27a33adc41e487..29b0c62dc86c1f 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2434,7 +2434,7 @@ static blk_qc_t pkt_make_request(struct request_queue *q, struct bio *bio)
 	char b[BDEVNAME_SIZE];
 	struct bio *split;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	pd = q->queuedata;
 	if (!pd) {
diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 5a1d1d137c7248..76cc584aa76346 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -593,7 +593,7 @@ static blk_qc_t ps3vram_make_request(struct request_queue *q, struct bio *bio)
 
 	dev_dbg(&dev->core, "%s\n", __func__);
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	spin_lock_irq(&priv->lock);
 	busy = !bio_list_empty(&priv->list);
diff --git a/drivers/block/rsxx/dev.c b/drivers/block/rsxx/dev.c
index 6a4d8d26e32cbd..1d52bc73dd0f82 100644
--- a/drivers/block/rsxx/dev.c
+++ b/drivers/block/rsxx/dev.c
@@ -123,7 +123,7 @@ static blk_qc_t rsxx_make_request(struct request_queue *q, struct bio *bio)
 	struct rsxx_bio_meta *bio_meta;
 	blk_status_t st = BLK_STS_IOERR;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	might_sleep();
 
diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 5498f1cf36b3fe..3b89c07f9e9d6e 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -527,7 +527,7 @@ static blk_qc_t mm_make_request(struct request_queue *q, struct bio *bio)
 		 (unsigned long long)bio->bi_iter.bi_sector,
 		 bio->bi_iter.bi_size);
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	spin_lock_irq(&card->lock);
 	*card->biotail = bio;
diff --git a/drivers/lightnvm/pblk-init.c b/drivers/lightnvm/pblk-init.c
index 6e677ff62cc969..7a4a1b7a941d2c 100644
--- a/drivers/lightnvm/pblk-init.c
+++ b/drivers/lightnvm/pblk-init.c
@@ -63,7 +63,7 @@ static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
 	 * constraint. Writes can be of arbitrary size.
 	 */
 	if (bio_data_dir(bio) == READ) {
-		blk_queue_split(q, &bio);
+		blk_queue_split(&bio);
 		pblk_submit_read(pblk, bio);
 	} else {
 		/* Prevent deadlock in the case of a modest LUN configuration
@@ -71,7 +71,7 @@ static blk_qc_t pblk_make_rq(struct request_queue *q, struct bio *bio)
 		 * leaves at least 256KB available for user I/O.
 		 */
 		if (pblk_get_secs(bio) > pblk_rl_max_io(&pblk->rl))
-			blk_queue_split(q, &bio);
+			blk_queue_split(&bio);
 
 		pblk_write_to_cache(pblk, bio, PBLK_IOTYPE_USER);
 	}
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c8d91f271c272e..5aa7a604f4cbc5 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1776,7 +1776,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	 */
 	if (current->bio_list) {
 		if (is_abnormal_io(bio))
-			blk_queue_split(md->queue, &bio);
+			blk_queue_split(&bio);
 		else
 			dm_queue_split(md, ti, &bio);
 	}
diff --git a/drivers/md/md.c b/drivers/md/md.c
index f567f536b529bd..ff20868e5e1b98 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -475,7 +475,7 @@ static blk_qc_t md_make_request(struct request_queue *q, struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	if (mddev == NULL || mddev->pers == NULL) {
 		bio_io_error(bio);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index da78e499947a9f..5a5205ea570a77 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -301,12 +301,11 @@ static blk_qc_t nvme_ns_head_make_request(struct request_queue *q,
 	int srcu_idx;
 
 	/*
-	 * The namespace might be going away and the bio might
-	 * be moved to a different queue via blk_steal_bios(),
-	 * so we need to use the bio_split pool from the original
-	 * queue to allocate the bvecs from.
+	 * The namespace might be going away and the bio might be moved to a
+	 * different queue via blk_steal_bios(), so we need to use the bio_split
+	 * pool from the original queue to allocate the bvecs from.
 	 */
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	srcu_idx = srcu_read_lock(&head->srcu);
 	ns = nvme_find_path(head);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 384edffe5cb4ae..dfe21eb7276021 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -878,7 +878,7 @@ dcssblk_make_request(struct request_queue *q, struct bio *bio)
 	unsigned long source_addr;
 	unsigned long bytes_done;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	bytes_done = 0;
 	dev_info = bio->bi_disk->private_data;
diff --git a/drivers/s390/block/xpram.c b/drivers/s390/block/xpram.c
index 45a04daec89ed9..5456f0ad5a40a4 100644
--- a/drivers/s390/block/xpram.c
+++ b/drivers/s390/block/xpram.c
@@ -191,7 +191,7 @@ static blk_qc_t xpram_make_request(struct request_queue *q, struct bio *bio)
 	unsigned long page_addr;
 	unsigned long bytes;
 
-	blk_queue_split(q, &bio);
+	blk_queue_split(&bio);
 
 	if ((bio->bi_iter.bi_sector & 7) != 0 ||
 	    (bio->bi_iter.bi_size & 4095) != 0)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 15497782c17656..d002defc178934 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -871,7 +871,7 @@ extern void blk_rq_unprep_clone(struct request *rq);
 extern blk_status_t blk_insert_cloned_request(struct request_queue *q,
 				     struct request *rq);
 extern int blk_rq_append_bio(struct request *rq, struct bio **bio);
-extern void blk_queue_split(struct request_queue *, struct bio **);
+extern void blk_queue_split(struct bio **);
 extern int scsi_verify_blk_ioctl(struct block_device *, unsigned int);
 extern int scsi_cmd_blk_ioctl(struct block_device *, fmode_t,
 			      unsigned int, void __user *);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

