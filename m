Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6DA24D156
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 11:21:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-duCF5xprPimdbFOypSAdiA-1; Fri, 21 Aug 2020 05:21:23 -0400
X-MC-Unique: duCF5xprPimdbFOypSAdiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25925AE640;
	Fri, 21 Aug 2020 09:21:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8845F9C3;
	Fri, 21 Aug 2020 09:21:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BB3218184AE;
	Fri, 21 Aug 2020 09:21:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L9Kero000312 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 05:20:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31B022016F2C; Fri, 21 Aug 2020 09:20:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5DC2026F94
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:20:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED357811E94
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:20:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-258-wdUEEavXORaw1u1eAhC6vA-1; Fri, 21 Aug 2020 05:20:34 -0400
X-MC-Unique: wdUEEavXORaw1u1eAhC6vA-1
Received: from [2001:4bb8:198:f3b2:a2b:85ba:fb78:c253] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k92qM-0007g0-RC; Fri, 21 Aug 2020 08:56:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 21 Aug 2020 10:55:59 +0200
Message-Id: <20200821085600.2395666-2-hch@lst.de>
In-Reply-To: <20200821085600.2395666-1-hch@lst.de>
References: <20200821085600.2395666-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	nbd@other.debian.org
Subject: [dm-devel] [PATCH 1/2] block: replace bd_set_size with
	bd_set_nr_sectors
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

Replace bd_set_size with a version that takes the number of sectors
instead, as that fits most of the current and future callers much better.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c     |  4 ++--
 drivers/block/nbd.c      |  7 ++++---
 drivers/block/pktcdvd.c  |  2 +-
 drivers/nvme/host/nvme.h |  2 +-
 fs/block_dev.c           | 10 +++++-----
 include/linux/genhd.h    |  2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 2f137d6ce169d5..7069899a94903e 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -253,7 +253,7 @@ static void loop_set_size(struct loop_device *lo, loff_t size)
 {
 	struct block_device *bdev = lo->lo_device;
 
-	bd_set_size(bdev, size << SECTOR_SHIFT);
+	bd_set_nr_sectors(bdev, size);
 
 	set_capacity_revalidate_and_notify(lo->lo_disk, size, false);
 }
@@ -1248,7 +1248,7 @@ static int __loop_clr_fd(struct loop_device *lo, bool release)
 	set_capacity(lo->lo_disk, 0);
 	loop_sysfs_exit(lo);
 	if (bdev) {
-		bd_set_size(bdev, 0);
+		bd_set_nr_sectors(bdev, 0);
 		/* let user-space know about this change */
 		kobject_uevent(&disk_to_dev(bdev->bd_disk)->kobj, KOBJ_CHANGE);
 	}
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3ff4054d6834d2..f07243335472a4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -300,6 +300,7 @@ static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
 	struct block_device *bdev = bdget_disk(nbd->disk, 0);
+	sector_t nr_sectors = config->bytesize >> 9;
 
 	if (config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = config->blksize;
@@ -308,10 +309,10 @@ static void nbd_size_update(struct nbd_device *nbd)
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
-	set_capacity(nbd->disk, config->bytesize >> 9);
+	set_capacity(nbd->disk, nr_sectors);
 	if (bdev) {
 		if (bdev->bd_disk) {
-			bd_set_size(bdev, config->bytesize);
+			bd_set_nr_sectors(bdev, nr_sectors);
 			set_blocksize(bdev, config->blksize);
 		} else
 			bdev->bd_invalidated = 1;
@@ -1138,7 +1139,7 @@ static void nbd_bdev_reset(struct block_device *bdev)
 {
 	if (bdev->bd_openers > 1)
 		return;
-	bd_set_size(bdev, 0);
+	bd_set_nr_sectors(bdev, 0);
 }
 
 static void nbd_parse_flags(struct nbd_device *nbd)
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 4becc1efe775fc..015fe128fa8a35 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2192,7 +2192,7 @@ static int pkt_open_dev(struct pktcdvd_device *pd, fmode_t write)
 
 	set_capacity(pd->disk, lba << 2);
 	set_capacity(pd->bdev->bd_disk, lba << 2);
-	bd_set_size(pd->bdev, (loff_t)lba << 11);
+	bd_set_nr_sectors(pd->bdev, lba << 2);
 
 	q = bdev_get_queue(pd->bdev);
 	if (write) {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index ebb8c3ed388554..ae5cad5a08f411 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -664,7 +664,7 @@ static inline void nvme_mpath_update_disk_size(struct gendisk *disk)
 	struct block_device *bdev = bdget_disk(disk, 0);
 
 	if (bdev) {
-		bd_set_size(bdev, get_capacity(disk) << SECTOR_SHIFT);
+		bd_set_nr_sectors(bdev, get_capacity(disk));
 		bdput(bdev);
 	}
 }
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 8ae833e004439b..f52597172c8b79 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1371,13 +1371,13 @@ int check_disk_change(struct block_device *bdev)
 
 EXPORT_SYMBOL(check_disk_change);
 
-void bd_set_size(struct block_device *bdev, loff_t size)
+void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors)
 {
 	inode_lock(bdev->bd_inode);
-	i_size_write(bdev->bd_inode, size);
+	i_size_write(bdev->bd_inode, (loff_t)sectors << SECTOR_SHIFT);
 	inode_unlock(bdev->bd_inode);
 }
-EXPORT_SYMBOL(bd_set_size);
+EXPORT_SYMBOL(bd_set_nr_sectors);
 
 static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part);
 
@@ -1514,7 +1514,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 			}
 
 			if (!ret) {
-				bd_set_size(bdev,(loff_t)get_capacity(disk)<<9);
+				bd_set_nr_sectors(bdev, get_capacity(disk));
 				set_init_blocksize(bdev);
 			}
 
@@ -1542,7 +1542,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 				ret = -ENXIO;
 				goto out_clear;
 			}
-			bd_set_size(bdev, (loff_t)bdev->bd_part->nr_sects << 9);
+			bd_set_nr_sectors(bdev, bdev->bd_part->nr_sects);
 			set_init_blocksize(bdev);
 		}
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 4ab853461dff25..39025dc0397c04 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -375,7 +375,7 @@ void unregister_blkdev(unsigned int major, const char *name);
 int revalidate_disk(struct gendisk *disk);
 int check_disk_change(struct block_device *bdev);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
-void bd_set_size(struct block_device *bdev, loff_t size);
+void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors);
 
 /* for drivers/char/raw.c: */
 int blkdev_ioctl(struct block_device *, fmode_t, unsigned, unsigned long);
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

