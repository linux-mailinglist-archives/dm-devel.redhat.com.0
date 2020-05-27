Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B35B31E3909
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EbYNFk7OBwC1DP22oh4DnV7+wfJm69uj+nO5enZ3zBw=;
	b=YTq1Q+SraNvMb7MiSJZdwLpZIpXIeXKeQu7KxLy54+/UXTAdP7/3Z0ccONmZCChbdhgobp
	K9u9pqxAQhZQsPDpFTcHgxu/0ZXEF7saW8Lf/QjKcd++OiwxNCsBrmqhRSJbuFTA6yKQ/U
	6BwjEcZ7t3FmuCiBJF7t3+gXlOB1PUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-bYRV4PezNyynpxhFyA6gpA-1; Wed, 27 May 2020 02:23:13 -0400
X-MC-Unique: bYRV4PezNyynpxhFyA6gpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E7CF1855A34;
	Wed, 27 May 2020 06:23:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDFED5D9EF;
	Wed, 27 May 2020 06:23:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CBDE6B4D5;
	Wed, 27 May 2020 06:23:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Mo6v015751 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3E052156A2D; Wed, 27 May 2020 06:22:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C774C2156A22
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A20F38007D9
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-em8kbKwKMIerDvSnHYVbyw-1;
	Wed, 27 May 2020 02:22:45 -0400
X-MC-Unique: em8kbKwKMIerDvSnHYVbyw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BBE64B306;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:22 +0200
Message-Id: <20200527062225.72849-13-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 12/15] dm-zoned: support arbitrary number of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 drivers/md/dm-zoned-metadata.c | 15 +++++++-
 drivers/md/dm-zoned-target.c   | 81 +++++++++++++++++++++++-------------------
 2 files changed, 59 insertions(+), 37 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index f309219a5457..689c1dd7ab20 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1520,7 +1520,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
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
index f6f00a363903..4a51738d4b0d 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -13,8 +13,6 @@
 
 #define DMZ_MIN_BIOS		8192
 
-#define DMZ_MAX_DEVS		2
-
 /*
  * Zone BIO context.
  */
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
@@ -852,22 +871,14 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
@@ -1090,9 +1101,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
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
@@ -1111,8 +1120,8 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 		dev = &dmz->dev[0];
 		format_dev_t(buf, dev->bdev->bd_dev);
 		DMEMIT("%s", buf);
-		if (dmz->nr_ddevs > 1) {
-			dev = &dmz->dev[1];
+		for (i = 1; i < dmz->nr_ddevs; i++) {
+			dev = &dmz->dev[i];
 			format_dev_t(buf, dev->bdev->bd_dev);
 			DMEMIT(" %s", buf);
 		}
@@ -1140,7 +1149,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 
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

