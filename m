Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E57D61DEC36
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TnabDXYn5GrAxGtRTneOCmgI0/00WSL3aXFwIBU8VLk=;
	b=gNEYsMJRl6mto9mJOm7ANbqkapt2ewVMR+Lq7RF/oOdlPxF6clyltPWLEqS74XoGidyi/0
	KZ64AqMvQSNvmcUinbcFjIEvNRHNt9YQbOgEX3txVUHKPugQKiVI0X1Ed43m8KN04pfORc
	mFQR1NQfmgj4GN1O7r9Hhyf2v14I6qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-RWvhUaMhNAGkOwntBnBDxg-1; Fri, 22 May 2020 11:40:02 -0400
X-MC-Unique: RWvhUaMhNAGkOwntBnBDxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A4B10AFE68;
	Fri, 22 May 2020 15:39:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010F479C2D;
	Fri, 22 May 2020 15:39:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5817E1809543;
	Fri, 22 May 2020 15:39:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdIL9012606 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A7B6101F0A2; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5590D1000D80
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02CC4833B4A
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:16 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-323-yOMtHgm9MMOwTrIvXBM3Ow-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: yOMtHgm9MMOwTrIvXBM3Ow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C76A8B22D;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:54 +0200
Message-Id: <20200522153901.133375-6-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 05/12] dm-zoned: add device pointer to struct
	dm_zone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a pointer to the containing device to struct dm_zone and
kill dmz_zone_to_dev().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 47 ++++++++++++------------------------------
 drivers/md/dm-zoned-reclaim.c  | 18 +++++++---------
 drivers/md/dm-zoned-target.c   |  7 +++----
 drivers/md/dm-zoned.h          |  4 +++-
 4 files changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index fdae4e0228e7..7b6e7404f1e8 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -229,16 +229,10 @@ struct dmz_metadata {
  */
 static unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	unsigned int zone_id;
-
 	if (WARN_ON(!zone))
 		return 0;
 
-	zone_id = zone->id;
-	if (zmd->nr_devs > 1 &&
-	    (zone_id >= zmd->dev[1].zone_offset))
-		zone_id -= zmd->dev[1].zone_offset;
-	return zone_id;
+	return zone->id - zone->dev->zone_offset;
 }
 
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
@@ -255,18 +249,6 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 	return (sector_t)zone_id << zmd->zone_nr_blocks_shift;
 }
 
-struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
-{
-	if (WARN_ON(!zone))
-		return &zmd->dev[0];
-
-	if (zmd->nr_devs > 1 &&
-	    zone->id >= zmd->dev[1].zone_offset)
-		return &zmd->dev[1];
-
-	return &zmd->dev[0];
-}
-
 unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd)
 {
 	return zmd->zone_nr_blocks;
@@ -1252,7 +1234,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 
 	/* Read and check the primary super block */
 	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
-	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
+	zmd->sb[0].dev = zmd->sb[0].zone->dev;
 	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
 	if (ret) {
 		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
@@ -1383,6 +1365,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 
 	INIT_LIST_HEAD(&zone->link);
 	atomic_set(&zone->refcount, 0);
+	zone->dev = dev;
 	zone->id = idx;
 	zone->chunk = DMZ_MAP_UNMAPPED;
 
@@ -1442,6 +1425,7 @@ static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
 			return -EBUSY;
 		INIT_LIST_HEAD(&zone->link);
 		atomic_set(&zone->refcount, 0);
+		zone->dev = dev;
 		zone->id = idx;
 		zone->chunk = DMZ_MAP_UNMAPPED;
 		set_bit(DMZ_CACHE, &zone->flags);
@@ -1567,11 +1551,10 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int noio_flag;
 	int ret;
 
-	if (dev->flags & DMZ_BDEV_REGULAR)
+	if (zone->dev->flags & DMZ_BDEV_REGULAR)
 		return 0;
 
 	/*
@@ -1581,16 +1564,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	 * GFP_NOIO was specified.
 	 */
 	noio_flag = memalloc_noio_save();
-	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
+	ret = blkdev_report_zones(zone->dev->bdev, dmz_start_sect(zmd, zone), 1,
 				  dmz_update_zone_cb, zone);
 	memalloc_noio_restore(noio_flag);
 
 	if (ret == 0)
 		ret = -EIO;
 	if (ret < 0) {
-		dmz_dev_err(dev, "Get zone %u report failed",
+		dmz_dev_err(zone->dev, "Get zone %u report failed",
 			    zone->id);
-		dmz_check_bdev(dev);
+		dmz_check_bdev(zone->dev);
 		return ret;
 	}
 
@@ -1604,7 +1587,6 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 				    struct dm_zone *zone)
 {
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int wp = 0;
 	int ret;
 
@@ -1613,7 +1595,8 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 	if (ret)
 		return ret;
 
-	dmz_dev_warn(dev, "Processing zone %u write error (zone wp %u/%u)",
+	dmz_dev_warn(zone->dev,
+		     "Processing zone %u write error (zone wp %u/%u)",
 		     zone->id, zone->wp_block, wp);
 
 	if (zone->wp_block < wp) {
@@ -1641,13 +1624,11 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
-
-		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
+		ret = blkdev_zone_mgmt(zone->dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
 				       zmd->zone_nr_sectors, GFP_NOIO);
 		if (ret) {
-			dmz_dev_err(dev, "Reset zone %u failed %d",
+			dmz_dev_err(zone->dev, "Reset zone %u failed %d",
 				    zone->id, ret);
 			return ret;
 		}
@@ -2201,9 +2182,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		goto again;
 	}
 	if (dmz_is_meta(zone)) {
-		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
-
-		dmz_dev_warn(dev, "Zone %u has metadata", zone->id);
+		dmz_zmd_warn(zmd, "Zone %u has metadata", zone->id);
 		zone = NULL;
 		goto again;
 	}
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 571bc1d41bab..d1a72b42dea2 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -58,7 +58,6 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 				sector_t block)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	sector_t wp_block = zone->wp_block;
 	unsigned int nr_blocks;
 	int ret;
@@ -74,15 +73,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 	 * pointer and the requested position.
 	 */
 	nr_blocks = block - wp_block;
-	ret = blkdev_issue_zeroout(dev->bdev,
+	ret = blkdev_issue_zeroout(zone->dev->bdev,
 				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
 				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
 	if (ret) {
-		dmz_dev_err(dev,
+		dmz_dev_err(zone->dev,
 			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
 			    zone->id, (unsigned long long)wp_block,
 			    (unsigned long long)block, nr_blocks, ret);
-		dmz_check_bdev(dev);
+		dmz_check_bdev(zone->dev);
 		return ret;
 	}
 
@@ -116,7 +115,6 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
-	struct dmz_dev *src_dev, *dst_dev;
 	struct dm_io_region src, dst;
 	sector_t block = 0, end_block;
 	sector_t nr_blocks;
@@ -130,17 +128,15 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 	else
 		end_block = dmz_zone_nr_blocks(zmd);
 	src_zone_block = dmz_start_block(zmd, src_zone);
-	src_dev = dmz_zone_to_dev(zmd, src_zone);
 	dst_zone_block = dmz_start_block(zmd, dst_zone);
-	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
 
 	if (dmz_is_seq(dst_zone))
 		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
 
 	while (block < end_block) {
-		if (src_dev->flags & DMZ_BDEV_DYING)
+		if (src_zone->dev->flags & DMZ_BDEV_DYING)
 			return -EIO;
-		if (dst_dev->flags & DMZ_BDEV_DYING)
+		if (dst_zone->dev->flags & DMZ_BDEV_DYING)
 			return -EIO;
 
 		if (dmz_reclaim_should_terminate(src_zone))
@@ -163,11 +159,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 				return ret;
 		}
 
-		src.bdev = src_dev->bdev;
+		src.bdev = src_zone->dev->bdev;
 		src.sector = dmz_blk2sect(src_zone_block + block);
 		src.count = dmz_blk2sect(nr_blocks);
 
-		dst.bdev = dst_dev->bdev;
+		dst.bdev = dst_zone->dev->bdev;
 		dst.sector = dmz_blk2sect(dst_zone_block + block);
 		dst.count = src.count;
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 2770e293a97b..bca9a611b8dd 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -123,18 +123,17 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 {
 	struct dmz_bioctx *bioctx =
 		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
-	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
 	struct bio *clone;
 
-	if (dev->flags & DMZ_BDEV_DYING)
+	if (zone->dev->flags & DMZ_BDEV_DYING)
 		return -EIO;
 
 	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
 	if (!clone)
 		return -ENOMEM;
 
-	bio_set_dev(clone, dev->bdev);
-	bioctx->dev = dev;
+	bio_set_dev(clone, zone->dev->bdev);
+	bioctx->dev = zone->dev;
 	clone->bi_iter.bi_sector =
 		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
 	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 8083607b9535..356b436425e4 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -80,6 +80,9 @@ struct dm_zone {
 	/* For listing the zone depending on its state */
 	struct list_head	link;
 
+	/* Device containing this zone */
+	struct dmz_dev		*dev;
+
 	/* Zone type and state */
 	unsigned long		flags;
 
@@ -188,7 +191,6 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd);
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
-struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
 
 bool dmz_check_dev(struct dmz_metadata *zmd);
 bool dmz_dev_is_dying(struct dmz_metadata *zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

