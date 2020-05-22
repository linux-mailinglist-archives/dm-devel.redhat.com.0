Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C51DEC39
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GKYhtzfM3v4+poSAlKYS+G/nSg+rIafyhQqcYTBtfHY=;
	b=H2Qrj7K20OoE08WTouaieZR1hx7wt8oF9rSctLO0vJ7JqrKfg38Zg3SCflODgn/X8JmJBM
	T3HmVNTvE+XNVYzdPDA13kbn6ntzTK/PzsEq8aNgN/fhDXhMb4vlAdKDdR1I439zF7eMyB
	6O1p37wQpEixCyVft5HSGa98AhCN+Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-TYMlnVAGPHyh8LYE3w5ZxA-1; Fri, 22 May 2020 11:40:01 -0400
X-MC-Unique: TYMlnVAGPHyh8LYE3w5ZxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C8B1083E90;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F995798D;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30F951800431;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdLNj012659 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 621DE200AFA6; Fri, 22 May 2020 15:39:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E613200A798
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E6328E3893
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-465-3JS6a4t4OKW1KjUK-CsQ3A-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: 3JS6a4t4OKW1KjUK-CsQ3A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C77D1B22E;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:59 +0200
Message-Id: <20200522153901.133375-11-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 10/12] dm-zoned: support arbitrary number of
	devices
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove the hard-coded limit of two devices and support an unlimited
number of additional zoned devices.
With that we need to increase the device-mapper version number to
3.0.0 as we've modified the interface.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c |  68 +++++++++++-----------
 drivers/md/dm-zoned-reclaim.c  |  28 ++++++---
 drivers/md/dm-zoned-target.c   | 129 +++++++++++++++++++++++++----------------
 drivers/md/dm-zoned.h          |   9 +--
 4 files changed, 139 insertions(+), 95 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 5f44970a6187..87784e7785bc 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -260,6 +260,11 @@ unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd)
 	return zmd->zone_nr_sectors_shift;
 }
 
+unsigned int dmz_nr_devs(struct dmz_metadata *zmd)
+{
+	return zmd->nr_devs;
+}
+
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
 {
 	return zmd->nr_zones;
@@ -270,24 +275,14 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
 	return zmd->nr_chunks;
 }
 
-unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx)
 {
-	unsigned int nr_rnd_zones = 0;
-	int i;
-
-	for (i = 0; i < zmd->nr_devs; i++)
-		nr_rnd_zones += zmd->dev[i].nr_rnd;
-	return nr_rnd_zones;
+	return zmd->dev[idx].nr_rnd;
 }
 
-unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx)
 {
-	unsigned int nr_unmap_rnd_zones = 0;
-	int i;
-
-	for (i = 0; i < zmd->nr_devs; i++)
-		nr_unmap_rnd_zones += atomic_read(&zmd->dev[i].unmap_nr_rnd);
-	return nr_unmap_rnd_zones;
+	return atomic_read(&zmd->dev[idx].unmap_nr_rnd);
 }
 
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
@@ -300,24 +295,14 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_cache);
 }
 
-unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx)
 {
-	unsigned int nr_seq_zones = 0;
-	int i;
-
-	for (i = 0; i < zmd->nr_devs; i++)
-		nr_seq_zones += zmd->dev[i].nr_seq;
-	return nr_seq_zones;
+	return zmd->dev[idx].nr_seq;
 }
 
-unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx)
 {
-	unsigned int nr_unmap_seq_zones = 0;
-	int i;
-
-	for (i = 0; i < zmd->nr_devs; i++)
-		nr_unmap_seq_zones += atomic_read(&zmd->dev[i].unmap_nr_seq);
-	return nr_unmap_seq_zones;
+	return atomic_read(&zmd->dev[idx].unmap_nr_seq);
 }
 
 static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
@@ -1530,7 +1515,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 		 */
 		zmd->sb[0].zone = dmz_get(zmd, 0);
 
-		zoned_dev = &zmd->dev[1];
+		for (i = 1; i < zmd->nr_devs; i++) {
+			zoned_dev = &zmd->dev[i];
+
+			ret = blkdev_report_zones(zoned_dev->bdev, 0,
+						  BLK_ALL_ZONES,
+						  dmz_init_zone, zoned_dev);
+			if (ret < 0) {
+				DMDEBUG("(%s): Failed to report zones, error %d",
+					zmd->devname, ret);
+				dmz_drop_zones(zmd);
+				return ret;
+			}
+		}
+		return 0;
 	}
 
 	/*
@@ -2921,10 +2919,14 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 		      zmd->nr_data_zones, zmd->nr_chunks);
 	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
 		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
-	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
-		      dmz_nr_rnd_zones(zmd), dmz_nr_unmap_rnd_zones(zmd));
-	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
-		      dmz_nr_seq_zones(zmd), dmz_nr_unmap_seq_zones(zmd));
+	for (i = 0; i < zmd->nr_devs; i++) {
+		dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
+			      dmz_nr_rnd_zones(zmd, i),
+			      dmz_nr_unmap_rnd_zones(zmd, i));
+		dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
+			      dmz_nr_seq_zones(zmd, i),
+			      dmz_nr_unmap_seq_zones(zmd, i));
+	}
 	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
 		      zmd->nr_reserved_seq);
 	dmz_zmd_debug(zmd, "Format:");
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index fba0d48e38a7..f2e053b5f2db 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -442,15 +442,18 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
 	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
-	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
-	unsigned int nr_unmap, nr_zones;
+	unsigned int nr_unmap = 0, nr_zones = 0;
 
 	if (nr_cache) {
 		nr_zones = nr_cache;
 		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
 	} else {
-		nr_zones = nr_rnd;
-		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
+		int i;
+
+		for (i = 0; i < dmz_nr_devs(zmd); i++) {
+			nr_zones += dmz_nr_rnd_zones(zmd, i);
+			nr_unmap += dmz_nr_unmap_rnd_zones(zmd, i);
+		}
 	}
 	return nr_unmap * 100 / nr_zones;
 }
@@ -460,7 +463,11 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
  */
 static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 {
-	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
+	int i;
+	unsigned int nr_reclaim = 0;
+
+	for (i = 0; i < dmz_nr_devs(zrc->metadata); i++)
+		nr_reclaim += dmz_nr_rnd_zones(zrc->metadata, i);
 
 	if (dmz_nr_cache_zones(zrc->metadata))
 		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
@@ -487,8 +494,8 @@ static void dmz_reclaim_work(struct work_struct *work)
 {
 	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
 	struct dmz_metadata *zmd = zrc->metadata;
-	unsigned int p_unmap;
-	int ret;
+	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
+	int ret, i;
 
 	if (dmz_dev_is_dying(zmd))
 		return;
@@ -513,14 +520,17 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
+	for (i = 0; i < dmz_nr_devs(zmd); i++) {
+		nr_unmap_rnd += dmz_nr_unmap_rnd_zones(zmd, i);
+		nr_rnd += dmz_nr_rnd_zones(zmd, i);
+	}
 	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
 		dmz_metadata_label(zmd),
 		zrc->kc_throttle.throttle,
 		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
 		p_unmap, dmz_nr_unmap_cache_zones(zmd),
 		dmz_nr_cache_zones(zmd),
-		dmz_nr_unmap_rnd_zones(zmd),
-		dmz_nr_rnd_zones(zmd));
+		nr_unmap_rnd, nr_rnd);
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret && ret != -EINTR) {
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index bca9a611b8dd..f34fcc3f7cc6 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -13,8 +13,6 @@
 
 #define DMZ_MIN_BIOS		8192
 
-#define DMZ_MAX_DEVS		2
-
 /*
  * Zone BIO context.
  */
@@ -40,9 +38,10 @@ struct dm_chunk_work {
  * Target descriptor.
  */
 struct dmz_target {
-	struct dm_dev		*ddev[DMZ_MAX_DEVS];
+	struct dm_dev		**ddev;
+	unsigned int		nr_ddevs;
 
-	unsigned long		flags;
+	unsigned int		flags;
 
 	/* Zoned block device information */
 	struct dmz_dev		*dev;
@@ -764,7 +763,7 @@ static void dmz_put_zoned_device(struct dm_target *ti)
 	struct dmz_target *dmz = ti->private;
 	int i;
 
-	for (i = 0; i < DMZ_MAX_DEVS; i++) {
+	for (i = 0; i < dmz->nr_ddevs; i++) {
 		if (dmz->ddev[i]) {
 			dm_put_device(ti, dmz->ddev[i]);
 			dmz->ddev[i] = NULL;
@@ -777,21 +776,35 @@ static int dmz_fixup_devices(struct dm_target *ti)
 	struct dmz_target *dmz = ti->private;
 	struct dmz_dev *reg_dev, *zoned_dev;
 	struct request_queue *q;
+	sector_t zone_nr_sectors = 0;
+	int i;
 
 	/*
-	 * When we have two devices, the first one must be a regular block
-	 * device and the second a zoned block device.
+	 * When we have more than on devices, the first one must be a
+	 * regular block device and the others zoned block devices.
 	 */
-	if (dmz->ddev[0] && dmz->ddev[1]) {
+	if (dmz->nr_ddevs > 1) {
 		reg_dev = &dmz->dev[0];
 		if (!(reg_dev->flags & DMZ_BDEV_REGULAR)) {
 			ti->error = "Primary disk is not a regular device";
 			return -EINVAL;
 		}
-		zoned_dev = &dmz->dev[1];
-		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
-			ti->error = "Secondary disk is not a zoned device";
-			return -EINVAL;
+		for (i = 1; i < dmz->nr_ddevs; i++) {
+			zoned_dev = &dmz->dev[i];
+			if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
+				ti->error = "Secondary disk is not a zoned device";
+				return -EINVAL;
+			}
+			q = bdev_get_queue(zoned_dev->bdev);
+			if (zone_nr_sectors &&
+			    zone_nr_sectors != blk_queue_zone_sectors(q)) {
+				ti->error = "Zone nr sectors mismatch";
+				return -EINVAL;
+			}
+			zone_nr_sectors = blk_queue_zone_sectors(q);
+			zoned_dev->zone_nr_sectors = zone_nr_sectors;
+			zoned_dev->nr_zones =
+				blkdev_nr_zones(zoned_dev->bdev->bd_disk);
 		}
 	} else {
 		reg_dev = NULL;
@@ -800,17 +813,24 @@ static int dmz_fixup_devices(struct dm_target *ti)
 			ti->error = "Disk is not a zoned device";
 			return -EINVAL;
 		}
+		q = bdev_get_queue(zoned_dev->bdev);
+		zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
+		zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
 	}
-	q = bdev_get_queue(zoned_dev->bdev);
-	zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
-	zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
 
 	if (reg_dev) {
-		reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
+		sector_t zone_offset;
+
+		reg_dev->zone_nr_sectors = zone_nr_sectors;
 		reg_dev->nr_zones =
 			DIV_ROUND_UP_SECTOR_T(reg_dev->capacity,
 					      reg_dev->zone_nr_sectors);
-		zoned_dev->zone_offset = reg_dev->nr_zones;
+		reg_dev->zone_offset = 0;
+		zone_offset = reg_dev->nr_zones;
+		for (i = 1; i < dmz->nr_ddevs; i++) {
+			dmz->dev[i].zone_offset = zone_offset;
+			zone_offset += dmz->dev[i].nr_zones;
+		}
 	}
 	return 0;
 }
@@ -821,10 +841,10 @@ static int dmz_fixup_devices(struct dm_target *ti)
 static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	struct dmz_target *dmz;
-	int ret;
+	int ret, i;
 
 	/* Check arguments */
-	if (argc < 1 || argc > 2) {
+	if (argc < 1) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -835,31 +855,31 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Unable to allocate the zoned target descriptor";
 		return -ENOMEM;
 	}
-	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
+	dmz->dev = kcalloc(argc, sizeof(struct dmz_dev), GFP_KERNEL);
 	if (!dmz->dev) {
 		ti->error = "Unable to allocate the zoned device descriptors";
 		kfree(dmz);
 		return -ENOMEM;
 	}
+	dmz->ddev = kcalloc(argc, sizeof(struct dm_dev *), GFP_KERNEL);
+	if (!dmz->ddev) {
+		ti->error = "Unable to allocate the dm device descriptors";
+		ret = -ENOMEM;
+		goto err;
+	}
+	dmz->nr_ddevs = argc;
+
 	ti->private = dmz;
 
 	/* Get the target zoned block device */
-	ret = dmz_get_zoned_device(ti, argv[0], 0, argc);
-	if (ret)
-		goto err;
-
-	if (argc == 2) {
-		ret = dmz_get_zoned_device(ti, argv[1], 1, argc);
-		if (ret) {
-			dmz_put_zoned_device(ti);
-			goto err;
-		}
+	for (i = 0; i < argc; i++) {
+		ret = dmz_get_zoned_device(ti, argv[i], i, argc);
+		if (ret)
+			goto err_dev;
 	}
 	ret = dmz_fixup_devices(ti);
-	if (ret) {
-		dmz_put_zoned_device(ti);
-		goto err;
-	}
+	if (ret)
+		goto err_dev;
 
 	/* Initialize metadata */
 	ret = dmz_ctr_metadata(dmz->dev, argc, &dmz->metadata,
@@ -1047,13 +1067,13 @@ static int dmz_iterate_devices(struct dm_target *ti,
 	struct dmz_target *dmz = ti->private;
 	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
 	sector_t capacity;
-	int r;
+	int i, r;
 
-	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
-	r = fn(ti, dmz->ddev[0], 0, capacity, data);
-	if (!r && dmz->ddev[1]) {
-		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
-		r = fn(ti, dmz->ddev[1], 0, capacity, data);
+	for (i = 0; i < dmz->nr_ddevs; i++) {
+		capacity = dmz->dev[i].capacity & ~(zone_nr_sectors - 1);
+		r = fn(ti, dmz->ddev[i], 0, capacity, data);
+		if (r)
+			break;
 	}
 	return r;
 }
@@ -1066,24 +1086,35 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 	ssize_t sz = 0;
 	char buf[BDEVNAME_SIZE];
 	struct dmz_dev *dev;
+	int i;
 
 	switch (type) {
 	case STATUSTYPE_INFO:
-		DMEMIT("%u zones %u/%u cache %u/%u random %u/%u sequential",
+		DMEMIT("%u zones %u/%u cache",
 		       dmz_nr_zones(dmz->metadata),
 		       dmz_nr_unmap_cache_zones(dmz->metadata),
-		       dmz_nr_cache_zones(dmz->metadata),
-		       dmz_nr_unmap_rnd_zones(dmz->metadata),
-		       dmz_nr_rnd_zones(dmz->metadata),
-		       dmz_nr_unmap_seq_zones(dmz->metadata),
-		       dmz_nr_seq_zones(dmz->metadata));
+		       dmz_nr_cache_zones(dmz->metadata));
+		for (i = 0; i < dmz->nr_ddevs; i++) {
+			/*
+			 * For a multi-device setup the first device
+			 * contains only cache zones.
+			 */
+			if ((i == 0) &&
+			    (dmz_nr_cache_zones(dmz->metadata) > 0))
+				continue;
+			DMEMIT(" %u/%u random %u/%u sequential",
+			       dmz_nr_unmap_rnd_zones(dmz->metadata, i),
+			       dmz_nr_rnd_zones(dmz->metadata, i),
+			       dmz_nr_unmap_seq_zones(dmz->metadata, i),
+			       dmz_nr_seq_zones(dmz->metadata, i));
+		}
 		break;
 	case STATUSTYPE_TABLE:
 		dev = &dmz->dev[0];
 		format_dev_t(buf, dev->bdev->bd_dev);
 		DMEMIT("%s", buf);
-		if (dmz->dev[1].bdev) {
-			dev = &dmz->dev[1];
+		for (i = 1; i < dmz->nr_ddevs; i++) {
+			dev = &dmz->dev[i];
 			format_dev_t(buf, dev->bdev->bd_dev);
 			DMEMIT(" %s", buf);
 		}
@@ -1108,7 +1139,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 
 static struct target_type dmz_type = {
 	.name		 = "zoned",
-	.version	 = {2, 0, 0},
+	.version	 = {3, 0, 0},
 	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
 	.module		 = THIS_MODULE,
 	.ctr		 = dmz_ctr,
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 56e138586d9b..0052eee12299 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -219,13 +219,14 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
 		  unsigned int chunk);
 void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
+unsigned int dmz_nr_devs(struct dmz_metadata *zmd);
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx);
 unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd);
 unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd);
 unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

