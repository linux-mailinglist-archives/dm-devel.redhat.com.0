Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6602B4737
	for <lists+dm-devel@lfdr.de>; Mon, 16 Nov 2020 16:01:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-F80W7n6SOgW0nOXQ6PGfcA-1; Mon, 16 Nov 2020 10:00:45 -0500
X-MC-Unique: F80W7n6SOgW0nOXQ6PGfcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E673480362A;
	Mon, 16 Nov 2020 15:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFEA7666D;
	Mon, 16 Nov 2020 15:00:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50DD758128;
	Mon, 16 Nov 2020 15:00:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGF0AnW015843 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 10:00:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F059B2023598; Mon, 16 Nov 2020 15:00:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB8912011553
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 15:00:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9415B1823603
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 15:00:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-68n68FIWPSKJIxm8VHi5Jg-1; Mon, 16 Nov 2020 09:59:21 -0500
X-MC-Unique: 68n68FIWPSKJIxm8VHi5Jg-1
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyO-00040T-NC; Mon, 16 Nov 2020 14:59:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:38 +0100
Message-Id: <20201116145809.410558-48-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: [dm-devel] [PATCH 47/78] floppy: use a separate gendisk for each
	media format
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

The floppy driver usually autodetects the media when used with the
normal /dev/fd? devices, which also are the only nodes created by udev.
But it also supports various aliases that force a given media format.
That is currently supported using the blk_register_region framework
which finds the floppy gendisk even for a 'mismatched' dev_t.  The
problem with this (besides the code complexity) is that it creates
multiple struct block_device instances for the whole device of a
single gendisk, which can lead to interesting issues in code not
aware of that fact.

To fix this just create a separate gendisk for each of the aliases
if they are accessed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/floppy.c | 154 ++++++++++++++++++++++++++---------------
 1 file changed, 97 insertions(+), 57 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 7df79ae6b0a1e1..dfe1dfc901ccc2 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -402,7 +402,6 @@ static struct floppy_drive_params drive_params[N_DRIVE];
 static struct floppy_drive_struct drive_state[N_DRIVE];
 static struct floppy_write_errors write_errors[N_DRIVE];
 static struct timer_list motor_off_timer[N_DRIVE];
-static struct gendisk *disks[N_DRIVE];
 static struct blk_mq_tag_set tag_sets[N_DRIVE];
 static struct block_device *opened_bdev[N_DRIVE];
 static DEFINE_MUTEX(open_lock);
@@ -477,6 +476,8 @@ static struct floppy_struct floppy_type[32] = {
 	{ 3200,20,2,80,0,0x1C,0x00,0xCF,0x2C,"H1600" }, /* 31 1.6MB 3.5"    */
 };
 
+static struct gendisk *disks[N_DRIVE][ARRAY_SIZE(floppy_type)];
+
 #define SECTSIZE (_FD_SECTSIZE(*floppy))
 
 /* Auto-detection: Disk type used until the next media change occurs. */
@@ -4111,7 +4112,7 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 
 	new_dev = MINOR(bdev->bd_dev);
 	drive_state[drive].fd_device = new_dev;
-	set_capacity(disks[drive], floppy_sizes[new_dev]);
+	set_capacity(disks[drive][ITYPE(new_dev)], floppy_sizes[new_dev]);
 	if (old_dev != -1 && old_dev != new_dev) {
 		if (buffer_drive == drive)
 			buffer_track = -1;
@@ -4579,15 +4580,58 @@ static bool floppy_available(int drive)
 	return true;
 }
 
-static struct kobject *floppy_find(dev_t dev, int *part, void *data)
+static int floppy_alloc_disk(unsigned int drive, unsigned int type)
 {
-	int drive = (*part & 3) | ((*part & 0x80) >> 5);
-	if (drive >= N_DRIVE || !floppy_available(drive))
-		return NULL;
-	if (((*part >> 2) & 0x1f) >= ARRAY_SIZE(floppy_type))
-		return NULL;
-	*part = 0;
-	return get_disk_and_module(disks[drive]);
+	struct gendisk *disk;
+	int err;
+
+	disk = alloc_disk(1);
+	if (!disk)
+		return -ENOMEM;
+
+	disk->queue = blk_mq_init_queue(&tag_sets[drive]);
+	if (IS_ERR(disk->queue)) {
+		err = PTR_ERR(disk->queue);
+		disk->queue = NULL;
+		put_disk(disk);
+		return err;
+	}
+
+	blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
+	blk_queue_max_hw_sectors(disk->queue, 64);
+	disk->major = FLOPPY_MAJOR;
+	disk->first_minor = TOMINOR(drive) | (type << 2);
+	disk->fops = &floppy_fops;
+	disk->events = DISK_EVENT_MEDIA_CHANGE;
+	if (type)
+		sprintf(disk->disk_name, "fd%d_type%d", drive, type);
+	else
+		sprintf(disk->disk_name, "fd%d", drive);
+	/* to be cleaned up... */
+	disk->private_data = (void *)(long)drive;
+	disk->flags |= GENHD_FL_REMOVABLE;
+
+	disks[drive][type] = disk;
+	return 0;
+}
+
+static DEFINE_MUTEX(floppy_probe_lock);
+
+static void floppy_probe(dev_t dev)
+{
+	unsigned int drive = (MINOR(dev) & 3) | ((MINOR(dev) & 0x80) >> 5);
+	unsigned int type = (MINOR(dev) >> 2) & 0x1f;
+
+	if (drive >= N_DRIVE || !floppy_available(drive) ||
+	    type >= ARRAY_SIZE(floppy_type))
+		return;
+
+	mutex_lock(&floppy_probe_lock);
+	if (!disks[drive][type]) {
+		if (floppy_alloc_disk(drive, type) == 0)
+			add_disk(disks[drive][type]);
+	}
+	mutex_unlock(&floppy_probe_lock);
 }
 
 static int __init do_floppy_init(void)
@@ -4609,33 +4653,25 @@ static int __init do_floppy_init(void)
 		return -ENOMEM;
 
 	for (drive = 0; drive < N_DRIVE; drive++) {
-		disks[drive] = alloc_disk(1);
-		if (!disks[drive]) {
-			err = -ENOMEM;
+		memset(&tag_sets[drive], 0, sizeof(tag_sets[drive]));
+		tag_sets[drive].ops = &floppy_mq_ops;
+		tag_sets[drive].nr_hw_queues = 1;
+		tag_sets[drive].nr_maps = 1;
+		tag_sets[drive].queue_depth = 2;
+		tag_sets[drive].numa_node = NUMA_NO_NODE;
+		tag_sets[drive].flags = BLK_MQ_F_SHOULD_MERGE;
+		err = blk_mq_alloc_tag_set(&tag_sets[drive]);
+		if (err)
 			goto out_put_disk;
-		}
 
-		disks[drive]->queue = blk_mq_init_sq_queue(&tag_sets[drive],
-							   &floppy_mq_ops, 2,
-							   BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(disks[drive]->queue)) {
-			err = PTR_ERR(disks[drive]->queue);
-			disks[drive]->queue = NULL;
+		err = floppy_alloc_disk(drive, 0);
+		if (err)
 			goto out_put_disk;
-		}
-
-		blk_queue_bounce_limit(disks[drive]->queue, BLK_BOUNCE_HIGH);
-		blk_queue_max_hw_sectors(disks[drive]->queue, 64);
-		disks[drive]->major = FLOPPY_MAJOR;
-		disks[drive]->first_minor = TOMINOR(drive);
-		disks[drive]->fops = &floppy_fops;
-		disks[drive]->events = DISK_EVENT_MEDIA_CHANGE;
-		sprintf(disks[drive]->disk_name, "fd%d", drive);
 
 		timer_setup(&motor_off_timer[drive], motor_off_callback, 0);
 	}
 
-	err = register_blkdev(FLOPPY_MAJOR, "fd");
+	err = __register_blkdev(FLOPPY_MAJOR, "fd", floppy_probe);
 	if (err)
 		goto out_put_disk;
 
@@ -4643,9 +4679,6 @@ static int __init do_floppy_init(void)
 	if (err)
 		goto out_unreg_blkdev;
 
-	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
-			    floppy_find, NULL, NULL);
-
 	for (i = 0; i < 256; i++)
 		if (ITYPE(i))
 			floppy_sizes[i] = floppy_type[ITYPE(i)].size;
@@ -4673,7 +4706,7 @@ static int __init do_floppy_init(void)
 	if (fdc_state[0].address == -1) {
 		cancel_delayed_work(&fd_timeout);
 		err = -ENODEV;
-		goto out_unreg_region;
+		goto out_unreg_driver;
 	}
 #if N_FDC > 1
 	fdc_state[1].address = FDC2;
@@ -4684,7 +4717,7 @@ static int __init do_floppy_init(void)
 	if (err) {
 		cancel_delayed_work(&fd_timeout);
 		err = -EBUSY;
-		goto out_unreg_region;
+		goto out_unreg_driver;
 	}
 
 	/* initialise drive state */
@@ -4761,10 +4794,8 @@ static int __init do_floppy_init(void)
 		if (err)
 			goto out_remove_drives;
 
-		/* to be cleaned up... */
-		disks[drive]->private_data = (void *)(long)drive;
-		disks[drive]->flags |= GENHD_FL_REMOVABLE;
-		device_add_disk(&floppy_device[drive].dev, disks[drive], NULL);
+		device_add_disk(&floppy_device[drive].dev, disks[drive][0],
+				NULL);
 	}
 
 	return 0;
@@ -4772,30 +4803,27 @@ static int __init do_floppy_init(void)
 out_remove_drives:
 	while (drive--) {
 		if (floppy_available(drive)) {
-			del_gendisk(disks[drive]);
+			del_gendisk(disks[drive][0]);
 			platform_device_unregister(&floppy_device[drive]);
 		}
 	}
 out_release_dma:
 	if (atomic_read(&usage_count))
 		floppy_release_irq_and_dma();
-out_unreg_region:
-	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
+out_unreg_driver:
 	platform_driver_unregister(&floppy_driver);
 out_unreg_blkdev:
 	unregister_blkdev(FLOPPY_MAJOR, "fd");
 out_put_disk:
 	destroy_workqueue(floppy_wq);
 	for (drive = 0; drive < N_DRIVE; drive++) {
-		if (!disks[drive])
+		if (!disks[drive][0])
 			break;
-		if (disks[drive]->queue) {
-			del_timer_sync(&motor_off_timer[drive]);
-			blk_cleanup_queue(disks[drive]->queue);
-			disks[drive]->queue = NULL;
-			blk_mq_free_tag_set(&tag_sets[drive]);
-		}
-		put_disk(disks[drive]);
+		del_timer_sync(&motor_off_timer[drive]);
+		blk_cleanup_queue(disks[drive][0]->queue);
+		disks[drive][0]->queue = NULL;
+		blk_mq_free_tag_set(&tag_sets[drive]);
+		put_disk(disks[drive][0]);
 	}
 	return err;
 }
@@ -5006,9 +5034,8 @@ module_init(floppy_module_init);
 
 static void __exit floppy_module_exit(void)
 {
-	int drive;
+	int drive, i;
 
-	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
 	unregister_blkdev(FLOPPY_MAJOR, "fd");
 	platform_driver_unregister(&floppy_driver);
 
@@ -5018,10 +5045,16 @@ static void __exit floppy_module_exit(void)
 		del_timer_sync(&motor_off_timer[drive]);
 
 		if (floppy_available(drive)) {
-			del_gendisk(disks[drive]);
+			for (i = 0; i < ARRAY_SIZE(floppy_type); i++) {
+				if (disks[drive][i])
+					del_gendisk(disks[drive][i]);
+			}
 			platform_device_unregister(&floppy_device[drive]);
 		}
-		blk_cleanup_queue(disks[drive]->queue);
+		for (i = 0; i < ARRAY_SIZE(floppy_type); i++) {
+			if (disks[drive][i])
+				blk_cleanup_queue(disks[drive][i]->queue);
+		}
 		blk_mq_free_tag_set(&tag_sets[drive]);
 
 		/*
@@ -5029,10 +5062,17 @@ static void __exit floppy_module_exit(void)
 		 * queue reference in put_disk().
 		 */
 		if (!(allowed_drive_mask & (1 << drive)) ||
-		    fdc_state[FDC(drive)].version == FDC_NONE)
-			disks[drive]->queue = NULL;
+		    fdc_state[FDC(drive)].version == FDC_NONE) {
+			for (i = 0; i < ARRAY_SIZE(floppy_type); i++) {
+				if (disks[drive][i])
+					disks[drive][i]->queue = NULL;
+			}
+		}
 
-		put_disk(disks[drive]);
+		for (i = 0; i < ARRAY_SIZE(floppy_type); i++) {
+			if (disks[drive][i])
+				put_disk(disks[drive][i]);
+		}
 	}
 
 	cancel_delayed_work_sync(&fd_timeout);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

