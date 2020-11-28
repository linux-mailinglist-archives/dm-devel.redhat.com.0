Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCAC2C7002
	for <lists+dm-devel@lfdr.de>; Sat, 28 Nov 2020 17:24:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-xUGzxcfyPX2ZpAHReY-7TA-1; Sat, 28 Nov 2020 11:24:21 -0500
X-MC-Unique: xUGzxcfyPX2ZpAHReY-7TA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90213107AD43;
	Sat, 28 Nov 2020 16:24:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF6D60BD9;
	Sat, 28 Nov 2020 16:24:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30A3250033;
	Sat, 28 Nov 2020 16:24:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ASGN9ui023701 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 11:23:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82202110FBEF; Sat, 28 Nov 2020 16:23:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC341004035
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:23:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434A380018D
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:23:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-223-EXT_uezOOAONb2AtHzXARw-1; Sat, 28 Nov 2020 11:23:05 -0500
X-MC-Unique: EXT_uezOOAONb2AtHzXARw-1
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2tB-0000LJ-HP; Sat, 28 Nov 2020 16:15:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 28 Nov 2020 17:14:52 +0100
Message-Id: <20201128161510.347752-28-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 27/45] block: simplify the block device claiming
	interface
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Stop passing the whole device as a separate argument given that it
can be trivially deducted and cleanup the !holder debug check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 drivers/block/loop.c   | 12 +++++-----
 fs/block_dev.c         | 51 +++++++++++++++---------------------------
 include/linux/blkdev.h |  6 ++---
 3 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c0df88b3300c41..d643c67be6acea 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1069,7 +1069,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	struct file	*file;
 	struct inode	*inode;
 	struct address_space *mapping;
-	struct block_device *claimed_bdev = NULL;
 	int		error;
 	loff_t		size;
 	bool		partscan;
@@ -1088,8 +1087,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	 * here to avoid changing device under exclusive owner.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev_whole(bdev);
-		error = bd_prepare_to_claim(bdev, claimed_bdev, loop_configure);
+		error = bd_prepare_to_claim(bdev, loop_configure);
 		if (error)
 			goto out_putf;
 	}
@@ -1176,15 +1174,15 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	mutex_unlock(&loop_ctl_mutex);
 	if (partscan)
 		loop_reread_partitions(lo, bdev);
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, loop_configure);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, loop_configure);
 	return 0;
 
 out_unlock:
 	mutex_unlock(&loop_ctl_mutex);
 out_bdev:
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, loop_configure);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, loop_configure);
 out_putf:
 	fput(file);
 out:
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 94baee369d26e5..0569f5ebeb6fd0 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -110,24 +110,20 @@ EXPORT_SYMBOL(invalidate_bdev);
 int truncate_bdev_range(struct block_device *bdev, fmode_t mode,
 			loff_t lstart, loff_t lend)
 {
-	struct block_device *claimed_bdev = NULL;
-	int err;
-
 	/*
 	 * If we don't hold exclusive handle for the device, upgrade to it
 	 * while we discard the buffer cache to avoid discarding buffers
 	 * under live filesystem.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev_whole(bdev);
-		err = bd_prepare_to_claim(bdev, claimed_bdev,
-					  truncate_bdev_range);
+		int err = bd_prepare_to_claim(bdev, truncate_bdev_range);
 		if (err)
 			return err;
 	}
+
 	truncate_inode_pages_range(bdev->bd_inode->i_mapping, lstart, lend);
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, truncate_bdev_range);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, truncate_bdev_range);
 	return 0;
 }
 EXPORT_SYMBOL(truncate_bdev_range);
@@ -978,7 +974,6 @@ static bool bd_may_claim(struct block_device *bdev, struct block_device *whole,
 /**
  * bd_prepare_to_claim - claim a block device
  * @bdev: block device of interest
- * @whole: the whole device containing @bdev, may equal @bdev
  * @holder: holder trying to claim @bdev
  *
  * Claim @bdev.  This function fails if @bdev is already claimed by another
@@ -988,9 +983,12 @@ static bool bd_may_claim(struct block_device *bdev, struct block_device *whole,
  * RETURNS:
  * 0 if @bdev can be claimed, -EBUSY otherwise.
  */
-int bd_prepare_to_claim(struct block_device *bdev, struct block_device *whole,
-		void *holder)
+int bd_prepare_to_claim(struct block_device *bdev, void *holder)
 {
+	struct block_device *whole = bdev_whole(bdev);
+
+	if (WARN_ON_ONCE(!holder))
+		return -EINVAL;
 retry:
 	spin_lock(&bdev_lock);
 	/* if someone else claimed, fail */
@@ -1030,15 +1028,15 @@ static void bd_clear_claiming(struct block_device *whole, void *holder)
 /**
  * bd_finish_claiming - finish claiming of a block device
  * @bdev: block device of interest
- * @whole: whole block device
  * @holder: holder that has claimed @bdev
  *
  * Finish exclusive open of a block device. Mark the device as exlusively
  * open by the holder and wake up all waiters for exclusive open to finish.
  */
-static void bd_finish_claiming(struct block_device *bdev,
-		struct block_device *whole, void *holder)
+static void bd_finish_claiming(struct block_device *bdev, void *holder)
 {
+	struct block_device *whole = bdev_whole(bdev);
+
 	spin_lock(&bdev_lock);
 	BUG_ON(!bd_may_claim(bdev, whole, holder));
 	/*
@@ -1063,11 +1061,10 @@ static void bd_finish_claiming(struct block_device *bdev,
  * also used when exclusive open is not actually desired and we just needed
  * to block other exclusive openers for a while.
  */
-void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
-		       void *holder)
+void bd_abort_claiming(struct block_device *bdev, void *holder)
 {
 	spin_lock(&bdev_lock);
-	bd_clear_claiming(whole, holder);
+	bd_clear_claiming(bdev_whole(bdev), holder);
 	spin_unlock(&bdev_lock);
 }
 EXPORT_SYMBOL(bd_abort_claiming);
@@ -1487,7 +1484,6 @@ void blkdev_put_no_open(struct block_device *bdev)
  */
 struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 {
-	struct block_device *claiming;
 	bool unblock_events = true;
 	struct block_device *bdev;
 	struct gendisk *disk;
@@ -1510,15 +1506,9 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	disk = bdev->bd_disk;
 
 	if (mode & FMODE_EXCL) {
-		WARN_ON_ONCE(!holder);
-	
-		ret = -ENOMEM;
-		claiming = bdget_disk(disk, 0);
-		if (!claiming)
-			goto put_blkdev;
-		ret = bd_prepare_to_claim(bdev, claiming, holder);
+		ret = bd_prepare_to_claim(bdev, holder);
 		if (ret)
-			goto put_claiming;
+			goto put_blkdev;
 	}
 
 	disk_block_events(disk);
@@ -1528,7 +1518,7 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	if (ret)
 		goto abort_claiming;
 	if (mode & FMODE_EXCL) {
-		bd_finish_claiming(bdev, claiming, holder);
+		bd_finish_claiming(bdev, holder);
 
 		/*
 		 * Block event polling for write claims if requested.  Any write
@@ -1547,18 +1537,13 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 
 	if (unblock_events)
 		disk_unblock_events(disk);
-	if (mode & FMODE_EXCL)
-		bdput(claiming);
 	return bdev;
 
 abort_claiming:
 	if (mode & FMODE_EXCL)
-		bd_abort_claiming(bdev, claiming, holder);
+		bd_abort_claiming(bdev, holder);
 	mutex_unlock(&bdev->bd_mutex);
 	disk_unblock_events(disk);
-put_claiming:
-	if (mode & FMODE_EXCL)
-		bdput(claiming);
 put_blkdev:
 	blkdev_put_no_open(bdev);
 	if (ret == -ERESTARTSYS)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5d48b92f5e4348..43a25d855e049a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1988,10 +1988,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset);
 struct block_device *blkdev_get_by_path(const char *path, fmode_t mode,
 		void *holder);
 struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder);
-int bd_prepare_to_claim(struct block_device *bdev, struct block_device *whole,
-		void *holder);
-void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
-		void *holder);
+int bd_prepare_to_claim(struct block_device *bdev, void *holder);
+void bd_abort_claiming(struct block_device *bdev, void *holder);
 void blkdev_put(struct block_device *bdev, fmode_t mode);
 
 /* just for blk-cgroup, don't use elsewhere */
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

