Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1540C2597DC
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 18:20:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-uCJzpUqrO6iy0UYeSKyFaA-1; Tue, 01 Sep 2020 12:20:15 -0400
X-MC-Unique: uCJzpUqrO6iy0UYeSKyFaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6037C80F054;
	Tue,  1 Sep 2020 16:20:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9DFE1002D5A;
	Tue,  1 Sep 2020 16:20:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE934183D023;
	Tue,  1 Sep 2020 16:20:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081GJxSO029086 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 12:19:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35E441112853; Tue,  1 Sep 2020 16:19:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FDBB1112863
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:19:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28BBB101A53F
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:19:56 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-7LqWRcI5Pva67FPkaAFi6g-1; Tue, 01 Sep 2020 12:19:54 -0400
X-MC-Unique: 7LqWRcI5Pva67FPkaAFi6g-1
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fS-0004Ov-PT; Tue, 01 Sep 2020 15:57:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  1 Sep 2020 17:57:42 +0200
Message-Id: <20200901155748.2884-4-hch@lst.de>
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 3/9] block: rename bd_invalidated
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace bd_invalidate with a new BDEV_NEED_PART_SCAN flag in a bd_flags
variable to better describe the condition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             |  2 +-
 drivers/block/nbd.c       |  8 ++++----
 fs/block_dev.c            | 10 +++++-----
 include/linux/blk_types.h |  4 +++-
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 99c64641c3148c..a2c0ec694918e5 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -734,7 +734,7 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 	if (!bdev)
 		goto exit;
 
-	bdev->bd_invalidated = 1;
+	set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 	err = blkdev_get(bdev, FMODE_READ, NULL);
 	if (err < 0)
 		goto exit;
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a54f2d155a31a5..15eed210feeff4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -315,7 +315,7 @@ static void nbd_size_update(struct nbd_device *nbd)
 			bd_set_nr_sectors(bdev, nr_sectors);
 			set_blocksize(bdev, config->blksize);
 		} else
-			bdev->bd_invalidated = 1;
+			set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 		bdput(bdev);
 	}
 	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
@@ -1322,7 +1322,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 		return ret;
 
 	if (max_part)
-		bdev->bd_invalidated = 1;
+		set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 	mutex_unlock(&nbd->config_lock);
 	ret = wait_event_interruptible(config->recv_wq,
 					 atomic_read(&config->recv_threads) == 0);
@@ -1500,9 +1500,9 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 		refcount_set(&nbd->config_refs, 1);
 		refcount_inc(&nbd->refs);
 		mutex_unlock(&nbd->config_lock);
-		bdev->bd_invalidated = 1;
+		set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 	} else if (nbd_disconnected(nbd->config)) {
-		bdev->bd_invalidated = 1;
+		set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 	}
 out:
 	mutex_unlock(&nbd_index_mutex);
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 2760292045c082..0207623769715d 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -881,7 +881,7 @@ struct block_device *bdget(dev_t dev)
 		bdev->bd_super = NULL;
 		bdev->bd_inode = inode;
 		bdev->bd_part_count = 0;
-		bdev->bd_invalidated = 0;
+		bdev->bd_flags = 0;
 		inode->i_mode = S_IFBLK;
 		inode->i_rdev = dev;
 		inode->i_bdev = bdev;
@@ -1365,7 +1365,7 @@ int check_disk_change(struct block_device *bdev)
 	if (__invalidate_device(bdev, true))
 		pr_warn("VFS: busy inodes on changed media %s\n",
 			disk->disk_name);
-	bdev->bd_invalidated = 1;
+	set_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 	if (bdops->revalidate_disk)
 		bdops->revalidate_disk(bdev->bd_disk);
 	return 1;
@@ -1390,7 +1390,7 @@ int bdev_disk_changed(struct block_device *bdev, bool invalidate)
 
 	lockdep_assert_held(&bdev->bd_mutex);
 
-	bdev->bd_invalidated = 0;
+	clear_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags);
 
 rescan:
 	ret = blk_drop_partitions(bdev);
@@ -1528,7 +1528,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 			 * The latter is necessary to prevent ghost
 			 * partitions on a removed medium.
 			 */
-			if (bdev->bd_invalidated &&
+			if (test_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags) &&
 			    (!ret || ret == -ENOMEDIUM))
 				bdev_disk_changed(bdev, ret == -ENOMEDIUM);
 
@@ -1558,7 +1558,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 			if (bdev->bd_disk->fops->open)
 				ret = bdev->bd_disk->fops->open(bdev, mode);
 			/* the same as first opener case, read comment there */
-			if (bdev->bd_invalidated &&
+			if (test_bit(BDEV_NEED_PART_SCAN, &bdev->bd_flags) &&
 			    (!ret || ret == -ENOMEDIUM))
 				bdev_disk_changed(bdev, ret == -ENOMEDIUM);
 			if (ret)
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 63a39e47fc6047..c21eff7efda237 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -19,6 +19,8 @@ struct cgroup_subsys_state;
 typedef void (bio_end_io_t) (struct bio *);
 struct bio_crypt_ctx;
 
+#define BDEV_NEED_PART_SCAN		0
+
 struct block_device {
 	dev_t			bd_dev;  /* not a kdev_t - it's a search key */
 	int			bd_openers;
@@ -37,7 +39,7 @@ struct block_device {
 	struct hd_struct *	bd_part;
 	/* number of times partitions within this device have been opened. */
 	unsigned		bd_part_count;
-	int			bd_invalidated;
+	unsigned long		bd_flags;
 	spinlock_t		bd_size_lock; /* for bd_inode->i_size updates */
 	struct gendisk *	bd_disk;
 	struct backing_dev_info *bd_bdi;
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

