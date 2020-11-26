Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6D52C5567
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 14:32:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Xo3wxojRMeKekir-KFYAKw-1; Thu, 26 Nov 2020 08:32:07 -0500
X-MC-Unique: Xo3wxojRMeKekir-KFYAKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 739AD1E7E0;
	Thu, 26 Nov 2020 13:32:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 611EA5C1BD;
	Thu, 26 Nov 2020 13:32:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 214D5180954D;
	Thu, 26 Nov 2020 13:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQDVm4R005556 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 08:31:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B51F6C77F0; Thu, 26 Nov 2020 13:31:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF95CC77E4
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:31:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F29B858284
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:31:46 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-579-UdsRiD0OOouCbcJErYC3Xg-1; Thu, 26 Nov 2020 08:31:44 -0500
X-MC-Unique: UdsRiD0OOouCbcJErYC3Xg-1
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGzV-00045x-Gz; Thu, 26 Nov 2020 13:07:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 26 Nov 2020 14:04:09 +0100
Message-Id: <20201126130422.92945-32-hch@lst.de>
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 31/44] block: move the start_sect field to struct
	block_device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the start_sect field to struct block_device in preparation
of killing struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          |  5 +++--
 block/blk-lib.c           |  2 +-
 block/genhd.c             |  4 ++--
 block/partitions/core.c   | 17 +++++++++--------
 include/linux/blk_types.h |  1 +
 include/linux/blkdev.h    |  4 ++--
 include/linux/genhd.h     |  3 +--
 kernel/trace/blktrace.c   | 11 +++--------
 8 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index d2c9cb24e087f3..9a3793d5ce38d4 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -757,9 +757,10 @@ static inline int blk_partition_remap(struct bio *bio)
 	if (bio_sectors(bio)) {
 		if (bio_check_eod(bio, bdev_nr_sectors(p->bdev)))
 			goto out;
-		bio->bi_iter.bi_sector += p->start_sect;
+		bio->bi_iter.bi_sector += p->bdev->bd_start_sect;
 		trace_block_bio_remap(bio->bi_disk->queue, bio, part_devt(p),
-				      bio->bi_iter.bi_sector - p->start_sect);
+				      bio->bi_iter.bi_sector -
+				      p->bdev->bd_start_sect);
 	}
 	bio->bi_partno = 0;
 	ret = 0;
diff --git a/block/blk-lib.c b/block/blk-lib.c
index e90614fd8d6a42..752f9c7220622a 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -65,7 +65,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 	/* In case the discard request is in a partition */
 	if (bdev_is_partition(bdev))
-		part_offset = bdev->bd_part->start_sect;
+		part_offset = bdev->bd_start_sect;
 
 	while (nr_sects) {
 		sector_t granularity_aligned_lba, req_sects;
diff --git a/block/genhd.c b/block/genhd.c
index 9eead2970cb3d4..7bb45382658385 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -297,8 +297,8 @@ EXPORT_SYMBOL_GPL(disk_part_iter_exit);
 
 static inline int sector_in_part(struct hd_struct *part, sector_t sector)
 {
-	return part->start_sect <= sector &&
-		sector < part->start_sect + bdev_nr_sectors(part->bdev);
+	return part->bdev->bd_start_sect <= sector &&
+		sector < part->bdev->bd_start_sect + bdev_nr_sectors(part->bdev);
 }
 
 /**
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 8924e1ea8b2ad6..485777cea26bfa 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -192,7 +192,7 @@ static ssize_t part_start_show(struct device *dev,
 {
 	struct hd_struct *p = dev_to_part(dev);
 
-	return sprintf(buf, "%llu\n",(unsigned long long)p->start_sect);
+	return sprintf(buf, "%llu\n",(unsigned long long)p->bdev->bd_start_sect);
 }
 
 static ssize_t part_ro_show(struct device *dev,
@@ -209,7 +209,7 @@ static ssize_t part_alignment_offset_show(struct device *dev,
 
 	return sprintf(buf, "%u\n",
 		queue_limit_alignment_offset(&part_to_disk(p)->queue->limits,
-				p->start_sect));
+				p->bdev->bd_start_sect));
 }
 
 static ssize_t part_discard_alignment_show(struct device *dev,
@@ -219,7 +219,7 @@ static ssize_t part_discard_alignment_show(struct device *dev,
 
 	return sprintf(buf, "%u\n",
 		queue_limit_discard_alignment(&part_to_disk(p)->queue->limits,
-				p->start_sect));
+				p->bdev->bd_start_sect));
 }
 
 static DEVICE_ATTR(partition, 0444, part_partition_show, NULL);
@@ -301,7 +301,7 @@ static void hd_struct_free_work(struct work_struct *work)
 	 */
 	put_device(disk_to_dev(disk));
 
-	part->start_sect = 0;
+	part->bdev->bd_start_sect = 0;
 	bdev_set_nr_sectors(part->bdev, 0);
 	part_stat_set_all(part, 0);
 	put_device(part_to_dev(part));
@@ -416,7 +416,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 
 	pdev = part_to_dev(p);
 
-	p->start_sect = start;
+	bdev->bd_start_sect = start;
 	bdev_set_nr_sectors(bdev, len);
 	p->partno = partno;
 	p->policy = get_disk_ro(disk);
@@ -508,8 +508,9 @@ static bool partition_overlaps(struct gendisk *disk, sector_t start,
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter))) {
 		if (part->partno == skip_partno ||
-		    start >= part->start_sect + bdev_nr_sectors(part->bdev) ||
-		    start + length <= part->start_sect)
+		    start >= part->bdev->bd_start_sect +
+			bdev_nr_sectors(part->bdev) ||
+		    start + length <= part->bdev->bd_start_sect)
 			continue;
 		overlap = true;
 		break;
@@ -592,7 +593,7 @@ int bdev_resize_partition(struct block_device *bdev, int partno,
 	mutex_lock_nested(&bdev->bd_mutex, 1);
 
 	ret = -EINVAL;
-	if (start != part->start_sect)
+	if (start != part->bdev->bd_start_sect)
 		goto out_unlock;
 
 	ret = -EBUSY;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 520011b95276fb..a690008f60cd92 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -20,6 +20,7 @@ typedef void (bio_end_io_t) (struct bio *);
 struct bio_crypt_ctx;
 
 struct block_device {
+	sector_t		bd_start_sect;
 	struct disk_stats __percpu *bd_stats;
 	unsigned long		bd_stamp;
 	dev_t			bd_dev;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 43a25d855e049a..619adea5709853 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1488,7 +1488,7 @@ static inline int bdev_alignment_offset(struct block_device *bdev)
 		return -1;
 	if (bdev_is_partition(bdev))
 		return queue_limit_alignment_offset(&q->limits,
-				bdev->bd_part->start_sect);
+				bdev->bd_start_sect);
 	return q->limits.alignment_offset;
 }
 
@@ -1529,7 +1529,7 @@ static inline int bdev_discard_alignment(struct block_device *bdev)
 
 	if (bdev_is_partition(bdev))
 		return queue_limit_discard_alignment(&q->limits,
-				bdev->bd_part->start_sect);
+				bdev->bd_start_sect);
 	return q->limits.discard_alignment;
 }
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 804ac45fbfbc53..50d27f5d38e2af 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -51,7 +51,6 @@ struct partition_meta_info {
 };
 
 struct hd_struct {
-	sector_t start_sect;
 	struct percpu_ref ref;
 
 	struct block_device *bdev;
@@ -298,7 +297,7 @@ extern void rand_initialize_disk(struct gendisk *disk);
 
 static inline sector_t get_start_sect(struct block_device *bdev)
 {
-	return bdev->bd_part->start_sect;
+	return bdev->bd_start_sect;
 }
 
 static inline sector_t bdev_nr_sectors(struct block_device *bdev)
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 7076d588a50d69..8a723a91ec5a06 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -458,14 +458,9 @@ static struct rchan_callbacks blk_relay_callbacks = {
 static void blk_trace_setup_lba(struct blk_trace *bt,
 				struct block_device *bdev)
 {
-	struct hd_struct *part = NULL;
-
-	if (bdev)
-		part = bdev->bd_part;
-
-	if (part) {
-		bt->start_lba = part->start_sect;
-		bt->end_lba = part->start_sect + bdev_nr_sectors(bdev);
+	if (bdev) {
+		bt->start_lba = bdev->bd_start_sect;
+		bt->end_lba = bdev->bd_start_sect + bdev_nr_sectors(bdev);
 	} else {
 		bt->start_lba = 0;
 		bt->end_lba = -1ULL;
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

