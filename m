Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACD92C6FF9
	for <lists+dm-devel@lfdr.de>; Sat, 28 Nov 2020 17:23:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-2w3_4N5-OW6xFX-4n-IpQw-1; Sat, 28 Nov 2020 11:23:18 -0500
X-MC-Unique: 2w3_4N5-OW6xFX-4n-IpQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA841E7ED;
	Sat, 28 Nov 2020 16:23:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCB45D9D3;
	Sat, 28 Nov 2020 16:23:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D0CA1809CA2;
	Sat, 28 Nov 2020 16:23:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ASGN53h023652 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 11:23:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 064A52166B2D; Sat, 28 Nov 2020 16:23:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005892166B2A
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:23:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A8FF800969
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:23:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-461-L3FmfI4zPieVJIGKtYThIg-1; Sat, 28 Nov 2020 11:22:58 -0500
X-MC-Unique: L3FmfI4zPieVJIGKtYThIg-1
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2tA-0000L7-0P; Sat, 28 Nov 2020 16:15:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 28 Nov 2020 17:14:51 +0100
Message-Id: <20201128161510.347752-27-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 26/45] block: remove ->bd_contains
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

Now that each hd_struct has a reference to the corresponding
block_device, there is no need for the bd_contains pointer.  Add
a bdev_whole() helper to look up the whole device block_device
struture instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 drivers/block/loop.c      |  2 +-
 drivers/scsi/scsicam.c    |  2 +-
 fs/block_dev.c            | 22 ++++++++--------------
 include/linux/blk_types.h |  4 +++-
 4 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 26c7aafba7c5f8..c0df88b3300c41 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1088,7 +1088,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	 * here to avoid changing device under exclusive owner.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev->bd_contains;
+		claimed_bdev = bdev_whole(bdev);
 		error = bd_prepare_to_claim(bdev, claimed_bdev, loop_configure);
 		if (error)
 			goto out_putf;
diff --git a/drivers/scsi/scsicam.c b/drivers/scsi/scsicam.c
index 682cf08ab04153..f1553a453616fd 100644
--- a/drivers/scsi/scsicam.c
+++ b/drivers/scsi/scsicam.c
@@ -32,7 +32,7 @@
  */
 unsigned char *scsi_bios_ptable(struct block_device *dev)
 {
-	struct address_space *mapping = dev->bd_contains->bd_inode->i_mapping;
+	struct address_space *mapping = bdev_whole(dev)->bd_inode->i_mapping;
 	unsigned char *res = NULL;
 	struct page *page;
 
diff --git a/fs/block_dev.c b/fs/block_dev.c
index b350ed3af83bad..94baee369d26e5 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -119,7 +119,7 @@ int truncate_bdev_range(struct block_device *bdev, fmode_t mode,
 	 * under live filesystem.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev->bd_contains;
+		claimed_bdev = bdev_whole(bdev);
 		err = bd_prepare_to_claim(bdev, claimed_bdev,
 					  truncate_bdev_range);
 		if (err)
@@ -880,7 +880,6 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	spin_lock_init(&bdev->bd_size_lock);
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
-	bdev->bd_contains = NULL;
 	bdev->bd_super = NULL;
 	bdev->bd_inode = inode;
 	bdev->bd_part_count = 0;
@@ -1347,9 +1346,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode)
 	int ret;
 
 	if (!bdev->bd_openers) {
-		bdev->bd_contains = bdev;
-
-		if (!bdev->bd_partno) {
+		if (!bdev_is_partition(bdev)) {
 			ret = -ENXIO;
 			bdev->bd_part = disk_get_part(disk, 0);
 			if (!bdev->bd_part)
@@ -1389,7 +1386,6 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode)
 			whole->bd_part_count++;
 			mutex_unlock(&whole->bd_mutex);
 
-			bdev->bd_contains = whole;
 			bdev->bd_part = disk_get_part(disk, bdev->bd_partno);
 			if (!(disk->flags & GENHD_FL_UP) ||
 			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
@@ -1405,7 +1401,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode)
 		if (bdev->bd_bdi == &noop_backing_dev_info)
 			bdev->bd_bdi = bdi_get(disk->queue->backing_dev_info);
 	} else {
-		if (bdev->bd_contains == bdev) {
+		if (!bdev_is_partition(bdev)) {
 			ret = 0;
 			if (bdev->bd_disk->fops->open)
 				ret = bdev->bd_disk->fops->open(bdev, mode);
@@ -1423,7 +1419,6 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode)
  out_clear:
 	disk_put_part(bdev->bd_part);
 	bdev->bd_part = NULL;
-	bdev->bd_contains = NULL;
 	return ret;
 }
 
@@ -1670,8 +1665,7 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 		disk_put_part(bdev->bd_part);
 		bdev->bd_part = NULL;
 		if (bdev_is_partition(bdev))
-			victim = bdev->bd_contains;
-		bdev->bd_contains = NULL;
+			victim = bdev_whole(bdev);
 	} else {
 		if (!bdev_is_partition(bdev) && disk->fops->release)
 			disk->fops->release(disk, mode);
@@ -1690,6 +1684,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	mutex_lock(&bdev->bd_mutex);
 
 	if (mode & FMODE_EXCL) {
+		struct block_device *whole = bdev_whole(bdev);
 		bool bdev_free;
 
 		/*
@@ -1700,13 +1695,12 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 		spin_lock(&bdev_lock);
 
 		WARN_ON_ONCE(--bdev->bd_holders < 0);
-		WARN_ON_ONCE(--bdev->bd_contains->bd_holders < 0);
+		WARN_ON_ONCE(--whole->bd_holders < 0);
 
-		/* bd_contains might point to self, check in a separate step */
 		if ((bdev_free = !bdev->bd_holders))
 			bdev->bd_holder = NULL;
-		if (!bdev->bd_contains->bd_holders)
-			bdev->bd_contains->bd_holder = NULL;
+		if (!whole->bd_holders)
+			whole->bd_holder = NULL;
 
 		spin_unlock(&bdev_lock);
 
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 9698f459cc65c9..2e0a9bd9688d28 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -32,7 +32,6 @@ struct block_device {
 #ifdef CONFIG_SYSFS
 	struct list_head	bd_holder_disks;
 #endif
-	struct block_device *	bd_contains;
 	u8			bd_partno;
 	struct hd_struct *	bd_part;
 	/* number of times partitions within this device have been opened. */
@@ -49,6 +48,9 @@ struct block_device {
 	struct super_block	*bd_fsfreeze_sb;
 } __randomize_layout;
 
+#define bdev_whole(_bdev) \
+	((_bdev)->bd_disk->part0.bdev)
+
 #define bdev_kobj(_bdev) \
 	(&part_to_dev((_bdev)->bd_part)->kobj)
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

