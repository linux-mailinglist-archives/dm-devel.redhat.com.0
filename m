Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDEE2B472B
	for <lists+dm-devel@lfdr.de>; Mon, 16 Nov 2020 16:00:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-cb-LtRE2N8ueetZRWyW_ow-1; Mon, 16 Nov 2020 10:00:31 -0500
X-MC-Unique: cb-LtRE2N8ueetZRWyW_ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB9511CC809;
	Mon, 16 Nov 2020 14:59:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 078941002D6B;
	Mon, 16 Nov 2020 14:59:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3FE2183D022;
	Mon, 16 Nov 2020 14:59:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGExkUM015654 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 09:59:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D65F7110F725; Mon, 16 Nov 2020 14:59:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D219C1003212
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC86690E432
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-462-GGy1XAMfMvGZ4IvODisOhQ-1; Mon, 16 Nov 2020 09:59:41 -0500
X-MC-Unique: GGy1XAMfMvGZ4IvODisOhQ-1
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyi-0004Ad-Px; Mon, 16 Nov 2020 14:59:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:51 +0100
Message-Id: <20201116145809.410558-61-hch@lst.de>
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
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
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [dm-devel] [PATCH 60/78] zram: remove the claim mechanism
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

The zram claim mechanism was added to ensure no new opens come in
during teardown.  But the proper way to archive that is to call
del_gendisk first, which takes care of all that.  Once del_gendisk
is called in the right place, the reset side can also be simplified
as no I/O can be outstanding on a block device that is not open.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 76 ++++++++++-------------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 6d15d51cee2b7e..3641434a9b154d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1756,64 +1756,33 @@ static ssize_t disksize_store(struct device *dev,
 static ssize_t reset_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
-	int ret;
-	unsigned short do_reset;
-	struct zram *zram;
+	struct zram *zram = dev_to_zram(dev);
 	struct block_device *bdev;
+	unsigned short do_reset;
+	int ret = 0;
 
 	ret = kstrtou16(buf, 10, &do_reset);
 	if (ret)
 		return ret;
-
 	if (!do_reset)
 		return -EINVAL;
 
-	zram = dev_to_zram(dev);
 	bdev = bdget_disk(zram->disk, 0);
 	if (!bdev)
 		return -ENOMEM;
 
 	mutex_lock(&bdev->bd_mutex);
-	/* Do not reset an active device or claimed device */
-	if (bdev->bd_openers || zram->claim) {
-		mutex_unlock(&bdev->bd_mutex);
-		bdput(bdev);
-		return -EBUSY;
-	}
-
-	/* From now on, anyone can't open /dev/zram[0-9] */
-	zram->claim = true;
+	if (bdev->bd_openers)
+		ret = -EBUSY;
+	else
+		zram_reset_device(zram);
 	mutex_unlock(&bdev->bd_mutex);
-
-	/* Make sure all the pending I/O are finished */
-	fsync_bdev(bdev);
-	zram_reset_device(zram);
 	bdput(bdev);
 
-	mutex_lock(&bdev->bd_mutex);
-	zram->claim = false;
-	mutex_unlock(&bdev->bd_mutex);
-
-	return len;
-}
-
-static int zram_open(struct block_device *bdev, fmode_t mode)
-{
-	int ret = 0;
-	struct zram *zram;
-
-	WARN_ON(!mutex_is_locked(&bdev->bd_mutex));
-
-	zram = bdev->bd_disk->private_data;
-	/* zram was claimed to reset so open request fails */
-	if (zram->claim)
-		ret = -EBUSY;
-
-	return ret;
+	return ret ? ret : len;
 }
 
 static const struct block_device_operations zram_devops = {
-	.open = zram_open,
 	.submit_bio = zram_submit_bio,
 	.swap_slot_free_notify = zram_slot_free_notify,
 	.rw_page = zram_rw_page,
@@ -1821,7 +1790,6 @@ static const struct block_device_operations zram_devops = {
 };
 
 static const struct block_device_operations zram_wb_devops = {
-	.open = zram_open,
 	.submit_bio = zram_submit_bio,
 	.swap_slot_free_notify = zram_slot_free_notify,
 	.owner = THIS_MODULE
@@ -1972,34 +1940,32 @@ static int zram_add(void)
 	return ret;
 }
 
-static int zram_remove(struct zram *zram)
+static bool zram_busy(struct zram *zram)
 {
 	struct block_device *bdev;
+	bool busy = false;
 
 	bdev = bdget_disk(zram->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
-
-	mutex_lock(&bdev->bd_mutex);
-	if (bdev->bd_openers || zram->claim) {
-		mutex_unlock(&bdev->bd_mutex);
+	if (bdev) {
+		if (bdev->bd_openers)
+			busy = true;
 		bdput(bdev);
-		return -EBUSY;
 	}
 
-	zram->claim = true;
-	mutex_unlock(&bdev->bd_mutex);
+	return busy;
+}
 
-	zram_debugfs_unregister(zram);
+static int zram_remove(struct zram *zram)
+{
+	if (zram_busy(zram))
+		return -EBUSY;
 
-	/* Make sure all the pending I/O are finished */
-	fsync_bdev(bdev);
+	del_gendisk(zram->disk);
+	zram_debugfs_unregister(zram);
 	zram_reset_device(zram);
-	bdput(bdev);
 
 	pr_info("Removed device: %s\n", zram->disk->disk_name);
 
-	del_gendisk(zram->disk);
 	blk_cleanup_queue(zram->disk->queue);
 	put_disk(zram->disk);
 	kfree(zram);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

