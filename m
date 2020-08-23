Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D740124EC73
	for <lists+dm-devel@lfdr.de>; Sun, 23 Aug 2020 11:31:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-S8NOeU4aNiytJejqCUVuEw-1; Sun, 23 Aug 2020 05:31:05 -0400
X-MC-Unique: S8NOeU4aNiytJejqCUVuEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B4E1084C8F;
	Sun, 23 Aug 2020 09:30:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 016845C1D7;
	Sun, 23 Aug 2020 09:30:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27271180B658;
	Sun, 23 Aug 2020 09:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07N9UlZ4024642 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Aug 2020 05:30:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3213E2166BA3; Sun, 23 Aug 2020 09:30:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC012166BA2
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:30:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E965D101A540
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:30:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-462-4fXTkE2DMiyPu-Bf5IZO1A-1; Sun, 23 Aug 2020 05:30:42 -0400
X-MC-Unique: 4fXTkE2DMiyPu-Bf5IZO1A-1
Received: from 171.168.43.195.cust.ip.kpnqwest.it ([195.43.168.171]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9m1Z-0003L8-Bx; Sun, 23 Aug 2020 09:10:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 23 Aug 2020 11:10:42 +0200
Message-Id: <20200823091043.2600261-3-hch@lst.de>
In-Reply-To: <20200823091043.2600261-1-hch@lst.de>
References: <20200823091043.2600261-1-hch@lst.de>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	nbd@other.debian.org
Subject: [dm-devel] [PATCH 2/3] block: fix locking for struct block_device
	size updates
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Two different callers use two different mutexes for updating the
block device size, which obviously doesn't help to actually protect
against concurrent updates from the different callers.  In addition
one of the locks, bd_mutex is rather prone to deadlocks with other
parts of the block stack that use it for high level synchronization.

Switch to using a new spinlock protecting just the size updates, as
that is all we need, and make sure everyone does the update through
the proper helper.

This fixes a bug reported with the nvme revalidating disks during a
hot removal operation, which can currently deadlock on bd_mutex.

Reported-by: Xianting Tian <xianting_tian@126.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/core.c         |  4 ++--
 drivers/block/aoe/aoecmd.c      |  4 +---
 drivers/md/dm.c                 | 15 ++-------------
 drivers/s390/block/dasd_ioctl.c |  9 ++-------
 fs/block_dev.c                  | 25 ++++++++++++++-----------
 include/linux/blk_types.h       |  1 +
 6 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/block/partitions/core.c b/block/partitions/core.c
index e62a98a8eeb750..328a2cb7875ba1 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -585,8 +585,8 @@ int bdev_resize_partition(struct block_device *bdev, int partno,
 	if (partition_overlaps(bdev->bd_disk, start, length, partno))
 		goto out_unlock;
 
-	part_nr_sects_write(part, (sector_t)length);
-	i_size_write(bdevp->bd_inode, length << SECTOR_SHIFT);
+	part_nr_sects_write(part, length);
+	bd_set_nr_sectors(bdevp, length);
 
 	ret = 0;
 out_unlock:
diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 3cf9bc5d8d9599..6ad73fe730bede 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -900,9 +900,7 @@ aoecmd_sleepwork(struct work_struct *work)
 		ssize = get_capacity(d->gd);
 		bd = bdget_disk(d->gd, 0);
 		if (bd) {
-			inode_lock(bd->bd_inode);
-			i_size_write(bd->bd_inode, (loff_t)ssize<<9);
-			inode_unlock(bd->bd_inode);
+			bd_set_nr_sectors(bd, ssize);
 			bdput(bd);
 		}
 		spin_lock_irq(&d->lock);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 32fa6499739fb9..6b21e5104e3e08 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2097,18 +2097,6 @@ static void event_callback(void *context)
 	dm_issue_global_event();
 }
 
-/*
- * Protected by md->suspend_lock obtained by dm_swap_table().
- */
-static void __set_size(struct mapped_device *md, sector_t size)
-{
-	lockdep_assert_held(&md->suspend_lock);
-
-	set_capacity(md->disk, size);
-
-	i_size_write(md->bdev->bd_inode, (loff_t)size << SECTOR_SHIFT);
-}
-
 /*
  * Returns old map, which caller must destroy.
  */
@@ -2131,7 +2119,8 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
 	if (size != dm_get_size(md))
 		memset(&md->geometry, 0, sizeof(md->geometry));
 
-	__set_size(md, size);
+	set_capacity(md->disk, size);
+	bd_set_nr_sectors(md->bdev, size);
 
 	dm_table_event_callback(t, event_callback, md);
 
diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
index 777734d1b4e58c..faaf5596e31c12 100644
--- a/drivers/s390/block/dasd_ioctl.c
+++ b/drivers/s390/block/dasd_ioctl.c
@@ -55,10 +55,7 @@ dasd_ioctl_enable(struct block_device *bdev)
 
 	dasd_enable_device(base);
 	/* Formatting the dasd device can change the capacity. */
-	mutex_lock(&bdev->bd_mutex);
-	i_size_write(bdev->bd_inode,
-		     (loff_t)get_capacity(base->block->gdp) << 9);
-	mutex_unlock(&bdev->bd_mutex);
+	bd_set_nr_sectors(bdev, get_capacity(base->block->gdp));
 	dasd_put_device(base);
 	return 0;
 }
@@ -91,9 +88,7 @@ dasd_ioctl_disable(struct block_device *bdev)
 	 * Set i_size to zero, since read, write, etc. check against this
 	 * value.
 	 */
-	mutex_lock(&bdev->bd_mutex);
-	i_size_write(bdev->bd_inode, 0);
-	mutex_unlock(&bdev->bd_mutex);
+	bd_set_nr_sectors(bdev, 0);
 	dasd_put_device(base);
 	return 0;
 }
diff --git a/fs/block_dev.c b/fs/block_dev.c
index f52597172c8b79..08158bb2e76c85 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -876,6 +876,7 @@ struct block_device *bdget(dev_t dev)
 	bdev = &BDEV_I(inode)->bdev;
 
 	if (inode->i_state & I_NEW) {
+		spin_lock_init(&bdev->bd_size_lock);
 		bdev->bd_contains = NULL;
 		bdev->bd_super = NULL;
 		bdev->bd_inode = inode;
@@ -1290,6 +1291,7 @@ static void check_disk_size_change(struct gendisk *disk,
 {
 	loff_t disk_size, bdev_size;
 
+	spin_lock(&bdev->bd_size_lock);
 	disk_size = (loff_t)get_capacity(disk) << 9;
 	bdev_size = i_size_read(bdev->bd_inode);
 	if (disk_size != bdev_size) {
@@ -1299,11 +1301,15 @@ static void check_disk_size_change(struct gendisk *disk,
 			       disk->disk_name, bdev_size, disk_size);
 		}
 		i_size_write(bdev->bd_inode, disk_size);
-		if (bdev_size > disk_size && __invalidate_device(bdev, false))
+	}
+	bdev->bd_invalidated = 0;
+	spin_unlock(&bdev->bd_size_lock);
+
+	if (bdev_size > disk_size) {
+		if (__invalidate_device(bdev, false))
 			pr_warn("VFS: busy inodes on resized disk %s\n",
 				disk->disk_name);
 	}
-	bdev->bd_invalidated = 0;
 }
 
 /**
@@ -1328,13 +1334,10 @@ int revalidate_disk(struct gendisk *disk)
 	if (!(disk->flags & GENHD_FL_HIDDEN)) {
 		struct block_device *bdev = bdget_disk(disk, 0);
 
-		if (!bdev)
-			return ret;
-
-		mutex_lock(&bdev->bd_mutex);
-		check_disk_size_change(disk, bdev, ret == 0);
-		mutex_unlock(&bdev->bd_mutex);
-		bdput(bdev);
+		if (bdev) {
+			check_disk_size_change(disk, bdev, ret == 0);
+			bdput(bdev);
+		}
 	}
 	return ret;
 }
@@ -1373,9 +1376,9 @@ EXPORT_SYMBOL(check_disk_change);
 
 void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors)
 {
-	inode_lock(bdev->bd_inode);
+	spin_lock(&bdev->bd_size_lock);
 	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
-	inode_unlock(bdev->bd_inode);
+	spin_unlock(&bdev->bd_size_lock);
 }
 EXPORT_SYMBOL(bd_set_nr_sectors);
 
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 4ecf4fed171f0d..5accc2549d2259 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -38,6 +38,7 @@ struct block_device {
 	/* number of times partitions within this device have been opened. */
 	unsigned		bd_part_count;
 	int			bd_invalidated;
+	spinlock_t		bd_size_lock; /* for bd_inode->i_size updates */
 	struct gendisk *	bd_disk;
 	struct backing_dev_info *bd_bdi;
 
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

