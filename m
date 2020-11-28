Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1C272C700C
	for <lists+dm-devel@lfdr.de>; Sat, 28 Nov 2020 17:34:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-LtWQIaMMPL66t3j6bSq0qg-1; Sat, 28 Nov 2020 11:34:11 -0500
X-MC-Unique: LtWQIaMMPL66t3j6bSq0qg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AFF9107AD43;
	Sat, 28 Nov 2020 16:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0281B5D720;
	Sat, 28 Nov 2020 16:34:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E820C180954D;
	Sat, 28 Nov 2020 16:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ASGXxdQ024788 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 11:34:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D23062027EB5; Sat, 28 Nov 2020 16:33:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8432027EAC
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:33:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A52FA800969
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:33:56 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-449-paoKz3a5M6u2UNxkHOys-Q-1; Sat, 28 Nov 2020 11:33:50 -0500
X-MC-Unique: paoKz3a5M6u2UNxkHOys-Q-1
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3AQ-0001cm-LQ; Sat, 28 Nov 2020 16:33:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 28 Nov 2020 17:15:07 +0100
Message-Id: <20201128161510.347752-43-hch@lst.de>
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 42/45] block: switch disk_part_iter_* to use a
	struct block_device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch the partition iter infrastructure to iterate over block_device
references instead of hd_struct ones mostly used to get at the
block_device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             | 59 ++++++++++++++++++++-------------------
 block/partitions/core.c   | 13 ++++-----
 drivers/s390/block/dasd.c |  8 +++---
 include/linux/genhd.h     |  4 +--
 4 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 28ced566c07bb7..e83174818b543a 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -236,7 +236,7 @@ EXPORT_SYMBOL_GPL(disk_part_iter_init);
  * CONTEXT:
  * Don't care.
  */
-struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
+struct block_device *disk_part_iter_next(struct disk_part_iter *piter)
 {
 	struct disk_part_tbl *ptbl;
 	int inc, end;
@@ -274,8 +274,9 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
 		      piter->idx == 0))
 			continue;
 
-		get_device(part_to_dev(part->bd_part));
-		piter->part = part->bd_part;
+		piter->part = bdgrab(part);
+		if (!piter->part)
+			continue;
 		piter->idx += inc;
 		break;
 	}
@@ -297,7 +298,8 @@ EXPORT_SYMBOL_GPL(disk_part_iter_next);
  */
 void disk_part_iter_exit(struct disk_part_iter *piter)
 {
-	disk_put_part(piter->part);
+	if (piter->part)
+		bdput(piter->part);
 	piter->part = NULL;
 }
 EXPORT_SYMBOL_GPL(disk_part_iter_exit);
@@ -338,7 +340,6 @@ struct block_device *disk_map_sector_rcu(struct gendisk *disk, sector_t sector)
 
 	for (i = 1; i < ptbl->len; i++) {
 		part = rcu_dereference(ptbl->part[i]);
-
 		if (part && sector_in_part(part, sector)) {
 			rcu_assign_pointer(ptbl->last_lookup, part);
 			goto out_unlock;
@@ -639,7 +640,7 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 {
 	struct device *ddev = disk_to_dev(disk);
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 	int err;
 
 	ddev->parent = parent;
@@ -689,7 +690,7 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 	/* announce possible partitions */
 	disk_part_iter_init(&piter, disk, 0);
 	while ((part = disk_part_iter_next(&piter)))
-		kobject_uevent(&part_to_dev(part)->kobj, KOBJ_ADD);
+		kobject_uevent(bdev_kobj(part), KOBJ_ADD);
 	disk_part_iter_exit(&piter);
 
 	if (disk->queue->backing_dev_info->dev) {
@@ -829,7 +830,7 @@ static void invalidate_partition(struct block_device *bdev)
 void del_gendisk(struct gendisk *disk)
 {
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	might_sleep();
 
@@ -849,8 +850,8 @@ void del_gendisk(struct gendisk *disk)
 	disk_part_iter_init(&piter, disk,
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
-		invalidate_partition(part->bdev);
-		delete_partition(part);
+		invalidate_partition(part);
+		delete_partition(part->bd_part);
 	}
 	disk_part_iter_exit(&piter);
 
@@ -969,7 +970,7 @@ void __init printk_all_partitions(void)
 	while ((dev = class_dev_iter_next(&iter))) {
 		struct gendisk *disk = dev_to_disk(dev);
 		struct disk_part_iter piter;
-		struct hd_struct *part;
+		struct block_device *part;
 		char name_buf[BDEVNAME_SIZE];
 		char devt_buf[BDEVT_SIZE];
 
@@ -988,14 +989,14 @@ void __init printk_all_partitions(void)
 		 */
 		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
 		while ((part = disk_part_iter_next(&piter))) {
-			bool is_part0 = part == disk->part0->bd_part;
+			bool is_part0 = part == disk->part0;
 
 			printk("%s%s %10llu %s %s", is_part0 ? "" : "  ",
-			       bdevt_str(part_devt(part), devt_buf),
-			       bdev_nr_sectors(part->bdev) >> 1,
-			       disk_name(disk, part->bdev->bd_partno, name_buf),
-			       part->bdev->bd_meta_info ?
-					part->bdev->bd_meta_info->uuid : "");
+			       bdevt_str(part->bd_dev, devt_buf),
+			       bdev_nr_sectors(part) >> 1,
+			       disk_name(disk, part->bd_partno, name_buf),
+			       part->bd_meta_info ?
+					part->bd_meta_info->uuid : "");
 			if (is_part0) {
 				if (dev->parent && dev->parent->driver)
 					printk(" driver: %s\n",
@@ -1071,7 +1072,7 @@ static int show_partition(struct seq_file *seqf, void *v)
 {
 	struct gendisk *sgp = v;
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 	char buf[BDEVNAME_SIZE];
 
 	/* Don't show non-partitionable removeable devices or empty devices */
@@ -1085,9 +1086,9 @@ static int show_partition(struct seq_file *seqf, void *v)
 	disk_part_iter_init(&piter, sgp, DISK_PITER_INCL_PART0);
 	while ((part = disk_part_iter_next(&piter)))
 		seq_printf(seqf, "%4d  %7d %10llu %s\n",
-			   MAJOR(part_devt(part)), MINOR(part_devt(part)),
-			   bdev_nr_sectors(part->bdev) >> 1,
-			   disk_name(sgp, part->bdev->bd_partno, buf));
+			   MAJOR(part->bd_dev), MINOR(part->bd_dev),
+			   bdev_nr_sectors(part) >> 1,
+			   disk_name(sgp, part->bd_partno, buf));
 	disk_part_iter_exit(&piter);
 
 	return 0;
@@ -1481,7 +1482,7 @@ static int diskstats_show(struct seq_file *seqf, void *v)
 {
 	struct gendisk *gp = v;
 	struct disk_part_iter piter;
-	struct hd_struct *hd;
+	struct block_device *hd;
 	char buf[BDEVNAME_SIZE];
 	unsigned int inflight;
 	struct disk_stats stat;
@@ -1496,11 +1497,11 @@ static int diskstats_show(struct seq_file *seqf, void *v)
 
 	disk_part_iter_init(&piter, gp, DISK_PITER_INCL_EMPTY_PART0);
 	while ((hd = disk_part_iter_next(&piter))) {
-		part_stat_read_all(hd, &stat);
+		part_stat_read_all(hd->bd_part, &stat);
 		if (queue_is_mq(gp->queue))
-			inflight = blk_mq_in_flight(gp->queue, hd->bdev);
+			inflight = blk_mq_in_flight(gp->queue, hd);
 		else
-			inflight = part_in_flight(hd->bdev);
+			inflight = part_in_flight(hd);
 
 		seq_printf(seqf, "%4d %7d %s "
 			   "%lu %lu %lu %u "
@@ -1509,8 +1510,8 @@ static int diskstats_show(struct seq_file *seqf, void *v)
 			   "%lu %lu %lu %u "
 			   "%lu %u"
 			   "\n",
-			   MAJOR(part_devt(hd)), MINOR(part_devt(hd)),
-			   disk_name(gp, hd->bdev->bd_partno, buf),
+			   MAJOR(hd->bd_dev), MINOR(hd->bd_dev),
+			   disk_name(gp, hd->bd_partno, buf),
 			   stat.ios[STAT_READ],
 			   stat.merges[STAT_READ],
 			   stat.sectors[STAT_READ],
@@ -1665,7 +1666,7 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 void set_disk_ro(struct gendisk *disk, int flag)
 {
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	if (disk->part0->bd_read_only != flag) {
 		set_disk_ro_uevent(disk, flag);
@@ -1674,7 +1675,7 @@ void set_disk_ro(struct gendisk *disk, int flag)
 
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter)))
-		part->bdev->bd_read_only = flag;
+		part->bd_read_only = flag;
 	disk_part_iter_exit(&piter);
 }
 
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 3d8243334c7cb4..4cb6df175f9077 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -439,15 +439,14 @@ static bool partition_overlaps(struct gendisk *disk, sector_t start,
 		sector_t length, int skip_partno)
 {
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 	bool overlap = false;
 
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter))) {
-		if (part->bdev->bd_partno == skip_partno ||
-		    start >= part->bdev->bd_start_sect +
-			bdev_nr_sectors(part->bdev) ||
-		    start + length <= part->bdev->bd_start_sect)
+		if (part->bd_partno == skip_partno ||
+		    start >= part->bd_start_sect + bdev_nr_sectors(part) ||
+		    start + length <= part->bd_start_sect)
 			continue;
 		overlap = true;
 		break;
@@ -568,7 +567,7 @@ static bool disk_unlock_native_capacity(struct gendisk *disk)
 int blk_drop_partitions(struct block_device *bdev)
 {
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	if (bdev->bd_part_count)
 		return -EBUSY;
@@ -578,7 +577,7 @@ int blk_drop_partitions(struct block_device *bdev)
 
 	disk_part_iter_init(&piter, bdev->bd_disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter)))
-		delete_partition(part);
+		delete_partition(part->bd_part);
 	disk_part_iter_exit(&piter);
 
 	return 0;
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index db24e04ee9781e..1825fa8d05a780 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -432,7 +432,7 @@ dasd_state_ready_to_online(struct dasd_device * device)
 {
 	struct gendisk *disk;
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	device->state = DASD_STATE_ONLINE;
 	if (device->block) {
@@ -445,7 +445,7 @@ dasd_state_ready_to_online(struct dasd_device * device)
 		disk = device->block->bdev->bd_disk;
 		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
 		while ((part = disk_part_iter_next(&piter)))
-			kobject_uevent(&part_to_dev(part)->kobj, KOBJ_CHANGE);
+			kobject_uevent(bdev_kobj(part), KOBJ_CHANGE);
 		disk_part_iter_exit(&piter);
 	}
 	return 0;
@@ -459,7 +459,7 @@ static int dasd_state_online_to_ready(struct dasd_device *device)
 	int rc;
 	struct gendisk *disk;
 	struct disk_part_iter piter;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	if (device->discipline->online_to_ready) {
 		rc = device->discipline->online_to_ready(device);
@@ -472,7 +472,7 @@ static int dasd_state_online_to_ready(struct dasd_device *device)
 		disk = device->block->bdev->bd_disk;
 		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
 		while ((part = disk_part_iter_next(&piter)))
-			kobject_uevent(&part_to_dev(part)->kobj, KOBJ_CHANGE);
+			kobject_uevent(bdev_kobj(part), KOBJ_CHANGE);
 		disk_part_iter_exit(&piter);
 	}
 	return 0;
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 3c13d4708e3f9d..cd23c80265b2b2 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -244,14 +244,14 @@ static inline void disk_put_part(struct hd_struct *part)
 
 struct disk_part_iter {
 	struct gendisk		*disk;
-	struct hd_struct	*part;
+	struct block_device	*part;
 	int			idx;
 	unsigned int		flags;
 };
 
 extern void disk_part_iter_init(struct disk_part_iter *piter,
 				 struct gendisk *disk, unsigned int flags);
-extern struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter);
+struct block_device *disk_part_iter_next(struct disk_part_iter *piter);
 extern void disk_part_iter_exit(struct disk_part_iter *piter);
 extern bool disk_has_partitions(struct gendisk *disk);
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

