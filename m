Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD081E8538
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 19:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590774003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D9vutgTGFwaf3LKXHZQmQchp1lbKu5iIO/36qHs+bu0=;
	b=Z42bAGpTY3n6iYJjfTPU4lSiEmeetBoJaIZw4kH6QktbOZOViOj0uL1fb8uRb175If43yA
	AeyqwWeG9VJ+v5h7ncnWor74G6hB3IhEsSD79Li9Z2rwo3LndzmMsUoRh3HEf8YxH/GEcB
	fvKBKDswnEfrhu6WPNprpD8chCDBueg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-4RpwovdZOoOLogVz-4xv2A-1; Fri, 29 May 2020 13:39:54 -0400
X-MC-Unique: 4RpwovdZOoOLogVz-4xv2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61C781855A26;
	Fri, 29 May 2020 17:39:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 411DDA1058;
	Fri, 29 May 2020 17:39:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDEFC1809554;
	Fri, 29 May 2020 17:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04THdPlU004822 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 13:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03D4EF7FA0; Fri, 29 May 2020 17:39:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF444F77B3
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9AB82885C
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-160-n4oLIubVP-ilxGP7pNReWw-1;
	Fri, 29 May 2020 13:39:19 -0400
X-MC-Unique: n4oLIubVP-ilxGP7pNReWw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B7C90B1C1;
	Fri, 29 May 2020 17:39:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 29 May 2020 19:39:04 +0200
Message-Id: <20200529173907.40529-12-hare@suse.de>
In-Reply-To: <20200529173907.40529-1-hare@suse.de>
References: <20200529173907.40529-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 11/14] dm-zoned: support arbitrary number of
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
 drivers/md/dm-zoned-metadata.c |  15 +++++-
 drivers/md/dm-zoned-target.c   | 106 ++++++++++++++++++++++++-----------------
 2 files changed, 75 insertions(+), 46 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 044c152eb756..221163ae5f68 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1523,7 +1523,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
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
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index aa3d26d16441..4a51738d4b0d 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -13,8 +13,6 @@
 
 #define DMZ_MIN_BIOS		8192
 
-#define DMZ_MAX_DEVS		2
-
 /*
  * Zone BIO context.
  */
@@ -40,10 +38,10 @@ struct dm_chunk_work {
  * Target descriptor.
  */
 struct dmz_target {
-	struct dm_dev		*ddev[DMZ_MAX_DEVS];
+	struct dm_dev		**ddev;
 	unsigned int		nr_ddevs;
 
-	unsigned long		flags;
+	unsigned int		flags;
 
 	/* Zoned block device information */
 	struct dmz_dev		*dev;
@@ -764,7 +762,7 @@ static void dmz_put_zoned_device(struct dm_target *ti)
 	struct dmz_target *dmz = ti->private;
 	int i;
 
-	for (i = 0; i < DMZ_MAX_DEVS; i++) {
+	for (i = 0; i < dmz->nr_ddevs; i++) {
 		if (dmz->ddev[i]) {
 			dm_put_device(ti, dmz->ddev[i]);
 			dmz->ddev[i] = NULL;
@@ -777,21 +775,35 @@ static int dmz_fixup_devices(struct dm_target *ti)
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
@@ -800,17 +812,24 @@ static int dmz_fixup_devices(struct dm_target *ti)
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
@@ -824,7 +843,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	int ret, i;
 
 	/* Check arguments */
-	if (argc < 1 || argc > 2) {
+	if (argc < 1) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -835,32 +854,31 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
 	dmz->nr_ddevs = argc;
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
@@ -1056,13 +1074,13 @@ static int dmz_iterate_devices(struct dm_target *ti,
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
@@ -1083,9 +1101,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 		       dmz_nr_zones(dmz->metadata),
 		       dmz_nr_unmap_cache_zones(dmz->metadata),
 		       dmz_nr_cache_zones(dmz->metadata));
-		for (i = 0; i < DMZ_MAX_DEVS; i++) {
-			if (!dmz->ddev[i])
-				continue;
+		for (i = 0; i < dmz->nr_ddevs; i++) {
 			/*
 			 * For a multi-device setup the first device
 			 * contains only cache zones.
@@ -1104,8 +1120,8 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
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
@@ -1133,7 +1149,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 
 static struct target_type dmz_type = {
 	.name		 = "zoned",
-	.version	 = {2, 0, 0},
+	.version	 = {3, 0, 0},
 	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
 	.module		 = THIS_MODULE,
 	.ctr		 = dmz_ctr,
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

