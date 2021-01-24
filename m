Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B575301B34
	for <lists+dm-devel@lfdr.de>; Sun, 24 Jan 2021 11:13:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Y6G15SzxOraYfKYHZXxNYg-1; Sun, 24 Jan 2021 05:13:26 -0500
X-MC-Unique: Y6G15SzxOraYfKYHZXxNYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5469E107ACF5;
	Sun, 24 Jan 2021 10:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34C347216C;
	Sun, 24 Jan 2021 10:13:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E70AE4E58F;
	Sun, 24 Jan 2021 10:13:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10OADHY8005617 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 05:13:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63D9347CD6; Sun, 24 Jan 2021 10:13:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E67147CD4
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:13:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B68F800BFF
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:13:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-232-yb7R1FNKP8qnHArBq6UyRg-1; Sun, 24 Jan 2021 05:13:15 -0500
X-MC-Unique: yb7R1FNKP8qnHArBq6UyRg-1
Received: from [2001:4bb8:188:1954:a3b3:627f:702b:2136] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l3cHI-002qAG-D5; Sun, 24 Jan 2021 10:05:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 24 Jan 2021 11:02:39 +0100
Message-Id: <20210124100241.1167849-9-hch@lst.de>
In-Reply-To: <20210124100241.1167849-1-hch@lst.de>
References: <20210124100241.1167849-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 08/10] block: add a disk_uevent helper
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

Add a helper to call kobject_uevent for the disk and all partitions, and
unexport the disk_part_iter_* helpers that are now only used in the core
block code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 block/genhd.c             | 27 ++++++++++++++-------------
 drivers/s390/block/dasd.c | 26 +++++---------------------
 include/linux/genhd.h     |  2 ++
 3 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index e46de616a19e59..7094612c7510a8 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -203,7 +203,6 @@ void disk_part_iter_init(struct disk_part_iter *piter, struct gendisk *disk,
 
 	rcu_read_unlock();
 }
-EXPORT_SYMBOL_GPL(disk_part_iter_init);
 
 /**
  * disk_part_iter_next - proceed iterator to the next partition and return it
@@ -266,7 +265,6 @@ struct block_device *disk_part_iter_next(struct disk_part_iter *piter)
 
 	return piter->part;
 }
-EXPORT_SYMBOL_GPL(disk_part_iter_next);
 
 /**
  * disk_part_iter_exit - finish up partition iteration
@@ -283,7 +281,6 @@ void disk_part_iter_exit(struct disk_part_iter *piter)
 		bdput(piter->part);
 	piter->part = NULL;
 }
-EXPORT_SYMBOL_GPL(disk_part_iter_exit);
 
 /**
  * disk_has_partitions
@@ -555,6 +552,18 @@ static char *bdevt_str(dev_t devt, char *buf)
 	return buf;
 }
 
+void disk_uevent(struct gendisk *disk, enum kobject_action action)
+{
+	struct disk_part_iter piter;
+	struct block_device *part;
+
+	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
+	while ((part = disk_part_iter_next(&piter)))
+		kobject_uevent(bdev_kobj(part), action);
+	disk_part_iter_exit(&piter);
+}
+EXPORT_SYMBOL_GPL(disk_uevent);
+
 static void disk_scan_partitions(struct gendisk *disk)
 {
 	struct block_device *bdev;
@@ -572,8 +581,6 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 			  const struct attribute_group **groups)
 {
 	struct device *ddev = disk_to_dev(disk);
-	struct disk_part_iter piter;
-	struct block_device *part;
 	int err;
 
 	ddev->parent = parent;
@@ -616,15 +623,9 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 
 	disk_scan_partitions(disk);
 
-	/* announce disk after possible partitions are created */
+	/* announce the disk and partitions after all partitions are created */
 	dev_set_uevent_suppress(ddev, 0);
-	kobject_uevent(&ddev->kobj, KOBJ_ADD);
-
-	/* announce possible partitions */
-	disk_part_iter_init(&piter, disk, 0);
-	while ((part = disk_part_iter_next(&piter)))
-		kobject_uevent(bdev_kobj(part), KOBJ_ADD);
-	disk_part_iter_exit(&piter);
+	disk_uevent(disk, KOBJ_ADD);
 
 	if (disk->queue->backing_dev_info->dev) {
 		err = sysfs_create_link(&ddev->kobj,
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index c7eb9a10c680d2..28c04a4efa66f2 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -428,23 +428,15 @@ static int dasd_state_unfmt_to_basic(struct dasd_device *device)
 static int
 dasd_state_ready_to_online(struct dasd_device * device)
 {
-	struct gendisk *disk;
-	struct disk_part_iter piter;
-	struct block_device *part;
-
 	device->state = DASD_STATE_ONLINE;
 	if (device->block) {
 		dasd_schedule_block_bh(device->block);
 		if ((device->features & DASD_FEATURE_USERAW)) {
-			disk = device->block->gdp;
-			kobject_uevent(&disk_to_dev(disk)->kobj, KOBJ_CHANGE);
+			kobject_uevent(&disk_to_dev(device->block->gdp)->kobj,
+					KOBJ_CHANGE);
 			return 0;
 		}
-		disk = device->block->bdev->bd_disk;
-		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
-		while ((part = disk_part_iter_next(&piter)))
-			kobject_uevent(bdev_kobj(part), KOBJ_CHANGE);
-		disk_part_iter_exit(&piter);
+		disk_uevent(device->block->bdev->bd_disk, KOBJ_CHANGE);
 	}
 	return 0;
 }
@@ -455,9 +447,6 @@ dasd_state_ready_to_online(struct dasd_device * device)
 static int dasd_state_online_to_ready(struct dasd_device *device)
 {
 	int rc;
-	struct gendisk *disk;
-	struct disk_part_iter piter;
-	struct block_device *part;
 
 	if (device->discipline->online_to_ready) {
 		rc = device->discipline->online_to_ready(device);
@@ -466,13 +455,8 @@ static int dasd_state_online_to_ready(struct dasd_device *device)
 	}
 
 	device->state = DASD_STATE_READY;
-	if (device->block && !(device->features & DASD_FEATURE_USERAW)) {
-		disk = device->block->bdev->bd_disk;
-		disk_part_iter_init(&piter, disk, DISK_PITER_INCL_PART0);
-		while ((part = disk_part_iter_next(&piter)))
-			kobject_uevent(bdev_kobj(part), KOBJ_CHANGE);
-		disk_part_iter_exit(&piter);
-	}
+	if (device->block && !(device->features & DASD_FEATURE_USERAW))
+		disk_uevent(device->block->bdev->bd_disk, KOBJ_CHANGE);
 	return 0;
 }
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index a62ccbfac54b48..670eaef0e87622 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -213,6 +213,8 @@ static inline dev_t disk_devt(struct gendisk *disk)
 	return MKDEV(disk->major, disk->first_minor);
 }
 
+void disk_uevent(struct gendisk *disk, enum kobject_action action);
+
 /*
  * Smarter partition iterator without context limits.
  */
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

