Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DB74022E0A1
	for <lists+dm-devel@lfdr.de>; Sun, 26 Jul 2020 17:26:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-8solhIr-OMS-XcPjp_ZY3Q-1; Sun, 26 Jul 2020 11:26:13 -0400
X-MC-Unique: 8solhIr-OMS-XcPjp_ZY3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3FD1106B245;
	Sun, 26 Jul 2020 15:26:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2A210002B5;
	Sun, 26 Jul 2020 15:26:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FBC795482;
	Sun, 26 Jul 2020 15:26:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06QFPYHL026852 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 Jul 2020 11:25:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 332D8207B2B8; Sun, 26 Jul 2020 15:25:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 245F9207B2B0
	for <dm-devel@redhat.com>; Sun, 26 Jul 2020 15:25:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054571012443
	for <dm-devel@redhat.com>; Sun, 26 Jul 2020 15:25:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-ieNy3cJpM9irrLXXqJCojg-1; Sun, 26 Jul 2020 11:25:32 -0400
X-MC-Unique: ieNy3cJpM9irrLXXqJCojg-1
Received: from [2001:4bb8:18c:2acc:2375:88ff:9f84:118d] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jziBl-0005ge-IL; Sun, 26 Jul 2020 15:03:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 26 Jul 2020 17:03:25 +0200
Message-Id: <20200726150333.305527-7-hch@lst.de>
In-Reply-To: <20200726150333.305527-1-hch@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [dm-devel] [PATCH 06/14] block: lift setting the readahead size
	into the block layer
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

Drivers shouldn't really mess with the readahead size, as that is a VM
concept.  Instead set it based on the optimal I/O size by lifting the
algorithm from the md driver when registering the disk.  Also set
bdi->io_pages there as well by applying the same scheme based on
max_sectors.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c         |  5 ++---
 block/blk-sysfs.c            |  1 -
 block/genhd.c                | 13 +++++++++++--
 drivers/block/aoe/aoeblk.c   |  2 --
 drivers/block/drbd/drbd_nl.c | 12 +-----------
 drivers/md/bcache/super.c    |  4 ----
 drivers/md/dm-table.c        |  3 ---
 drivers/md/raid0.c           | 16 ----------------
 drivers/md/raid10.c          | 24 +-----------------------
 drivers/md/raid5.c           | 13 +------------
 10 files changed, 16 insertions(+), 77 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 76a7e03bcd6cac..01049e9b998f1d 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -452,6 +452,8 @@ EXPORT_SYMBOL(blk_limits_io_opt);
 void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
 {
 	blk_limits_io_opt(&q->limits, opt);
+	q->backing_dev_info->ra_pages =
+		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
 }
 EXPORT_SYMBOL(blk_queue_io_opt);
 
@@ -628,9 +630,6 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 		printk(KERN_NOTICE "%s: Warning: Device %s is misaligned\n",
 		       top, bottom);
 	}
-
-	t->backing_dev_info->io_pages =
-		t->limits.max_sectors >> (PAGE_SHIFT - 9);
 }
 EXPORT_SYMBOL(disk_stack_limits);
 
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 7dda709f3ccb6f..ce418d9128a0b2 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -245,7 +245,6 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
 
 	spin_lock_irq(&q->queue_lock);
 	q->limits.max_sectors = max_sectors_kb << 1;
-	q->backing_dev_info->io_pages = max_sectors_kb >> (PAGE_SHIFT - 10);
 	spin_unlock_irq(&q->queue_lock);
 
 	return ret;
diff --git a/block/genhd.c b/block/genhd.c
index 8b1e9f48957cb5..097d4e4bc0b8a2 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -775,6 +775,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 			      const struct attribute_group **groups,
 			      bool register_queue)
 {
+	struct request_queue *q = disk->queue;
 	dev_t devt;
 	int retval;
 
@@ -785,7 +786,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	 * registration.
 	 */
 	if (register_queue)
-		elevator_init_mq(disk->queue);
+		elevator_init_mq(q);
 
 	/* minors == 0 indicates to use ext devt from part0 and should
 	 * be accompanied with EXT_DEVT flag.  Make sure all
@@ -815,10 +816,18 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 		disk->flags |= GENHD_FL_SUPPRESS_PARTITION_INFO;
 		disk->flags |= GENHD_FL_NO_PART_SCAN;
 	} else {
-		struct backing_dev_info *bdi = disk->queue->backing_dev_info;
+		struct backing_dev_info *bdi = q->backing_dev_info;
 		struct device *dev = disk_to_dev(disk);
 		int ret;
 
+		/*
+		 * For read-ahead of large files to be effective, we need to
+		 * readahead at least twice the optimal I/O size.
+		 */
+		bdi->ra_pages = max(queue_io_opt(q) * 2 / PAGE_SIZE,
+				    VM_READAHEAD_PAGES);
+		bdi->io_pages = queue_max_sectors(q) >> (PAGE_SHIFT - 9);
+
 		/* Register BDI before referencing it from bdev */
 		dev->devt = devt;
 		ret = bdi_register(bdi, "%u:%u", MAJOR(devt), MINOR(devt));
diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index 5ca7216e9e01f3..89b33b402b4e52 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -347,7 +347,6 @@ aoeblk_gdalloc(void *vp)
 	mempool_t *mp;
 	struct request_queue *q;
 	struct blk_mq_tag_set *set;
-	enum { KB = 1024, MB = KB * KB, READ_AHEAD = 2 * MB, };
 	ulong flags;
 	int late = 0;
 	int err;
@@ -407,7 +406,6 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
 	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
-	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
 	d->bufpool = mp;
 	d->blkq = gd->queue = q;
 	q->queuedata = d;
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 650372ee2c7822..212bf711fb6b41 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1360,18 +1360,8 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	decide_on_discard_support(device, q, b, discard_zeroes_if_aligned);
 	decide_on_write_same_support(device, q, b, o, disable_write_same);
 
-	if (b) {
+	if (b)
 		blk_stack_limits(&q->limits, &b->limits, 0);
-
-		if (q->backing_dev_info->ra_pages !=
-		    b->backing_dev_info->ra_pages) {
-			drbd_info(device, "Adjusting my ra_pages to backing device's (%lu -> %lu)\n",
-				 q->backing_dev_info->ra_pages,
-				 b->backing_dev_info->ra_pages);
-			q->backing_dev_info->ra_pages =
-						b->backing_dev_info->ra_pages;
-		}
-	}
 	fixup_discard_if_not_supported(q);
 	fixup_write_zeroes(device, q);
 }
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 9e45faa054b6f4..9d3f0711be030f 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1367,10 +1367,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 	if (ret)
 		return ret;
 
-	dc->disk.disk->queue->backing_dev_info->ra_pages =
-		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
-		    q->backing_dev_info->ra_pages);
-
 	atomic_set(&dc->io_errors, 0);
 	dc->io_disable = false;
 	dc->error_limit = DEFAULT_CACHED_DEV_ERROR_LIMIT;
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index aac4c31cfc8498..324a42ed2f8894 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1924,9 +1924,6 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		q->nr_zones = blkdev_nr_zones(t->md->disk);
 	}
 #endif
-
-	/* Allow reads to exceed readahead limits */
-	q->backing_dev_info->io_pages = limits->max_sectors >> (PAGE_SHIFT - 9);
 }
 
 unsigned int dm_table_get_num_targets(struct dm_table *t)
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index f54a449f97aa79..aa2d7279176880 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -410,22 +410,6 @@ static int raid0_run(struct mddev *mddev)
 		 mdname(mddev),
 		 (unsigned long long)mddev->array_sectors);
 
-	if (mddev->queue) {
-		/* calculate the max read-ahead size.
-		 * For read-ahead of large files to be effective, we need to
-		 * readahead at least twice a whole stripe. i.e. number of devices
-		 * multiplied by chunk size times 2.
-		 * If an individual device has an ra_pages greater than the
-		 * chunk size, then we will not drive that device as hard as it
-		 * wants.  We consider this a configuration error: a larger
-		 * chunksize should be used in that case.
-		 */
-		int stripe = mddev->raid_disks *
-			(mddev->chunk_sectors << 9) / PAGE_SIZE;
-		if (mddev->queue->backing_dev_info->ra_pages < 2* stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2* stripe;
-	}
-
 	dump_zones(mddev);
 
 	ret = md_integrity_register(mddev);
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 9f88ff9bdee437..23d15acbf457d4 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3865,19 +3865,6 @@ static int raid10_run(struct mddev *mddev)
 	mddev->resync_max_sectors = size;
 	set_bit(MD_FAILFAST_SUPPORTED, &mddev->flags);
 
-	if (mddev->queue) {
-		int stripe = conf->geo.raid_disks *
-			((mddev->chunk_sectors << 9) / PAGE_SIZE);
-
-		/* Calculate max read-ahead size.
-		 * We need to readahead at least twice a whole stripe....
-		 * maybe...
-		 */
-		stripe /= conf->geo.near_copies;
-		if (mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
-	}
-
 	if (md_integrity_register(mddev))
 		goto out_free_conf;
 
@@ -4715,17 +4702,8 @@ static void end_reshape(struct r10conf *conf)
 	conf->reshape_safe = MaxSector;
 	spin_unlock_irq(&conf->device_lock);
 
-	/* read-ahead size must cover two whole stripes, which is
-	 * 2 * (datadisks) * chunksize where 'n' is the number of raid devices
-	 */
-	if (conf->mddev->queue) {
-		int stripe = conf->geo.raid_disks *
-			((conf->mddev->chunk_sectors << 9) / PAGE_SIZE);
-		stripe /= conf->geo.near_copies;
-		if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+	if (conf->mddev->queue)
 		raid10_set_io_opt(conf);
-	}
 	conf->fullsync = 0;
 }
 
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 68e41ce3ca75cc..415ce3cc155698 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7413,8 +7413,6 @@ static int raid5_run(struct mddev *mddev)
 		int data_disks = conf->previous_raid_disks - conf->max_degraded;
 		int stripe = data_disks *
 			((mddev->chunk_sectors << 9) / PAGE_SIZE);
-		if (mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-			mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
 
 		chunk_size = mddev->chunk_sectors << 9;
 		blk_queue_io_min(mddev->queue, chunk_size);
@@ -8002,17 +8000,8 @@ static void end_reshape(struct r5conf *conf)
 		spin_unlock_irq(&conf->device_lock);
 		wake_up(&conf->wait_for_overlap);
 
-		/* read-ahead size must cover two whole stripes, which is
-		 * 2 * (datadisks) * chunksize where 'n' is the number of raid devices
-		 */
-		if (conf->mddev->queue) {
-			int data_disks = conf->raid_disks - conf->max_degraded;
-			int stripe = data_disks * ((conf->chunk_sectors << 9)
-						   / PAGE_SIZE);
-			if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
-				conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+		if (conf->mddev->queue)
 			raid5_set_io_opt(conf);
-		}
 	}
 }
 
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

