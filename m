Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 03C521E3905
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LjXm7NZkGbZRuPWHiQRQMSe8IsNcfA5jBULgLdjU8ig=;
	b=hupz6s6xnHd1z6Gj/rn7fmYgwV9EOFkpJCVDmq2FLxhPTW9HottxUUlxJOOwV+lrYCrcDd
	/D3NJueQ0lYUBmDtN0XfKpMIjOJovt3D8ZOo9rbE67yI95vVoatmdAEhAjOZ6yRD3iOOSM
	x+rlgNMNqwCP7DwXt8vBXTSjZcBvgq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-Ne5I0DBQMXCg6xNaX2RIUw-1; Wed, 27 May 2020 02:23:12 -0400
X-MC-Unique: Ne5I0DBQMXCg6xNaX2RIUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628801855A1D;
	Wed, 27 May 2020 06:23:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40ACF9A243;
	Wed, 27 May 2020 06:23:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDD006B4A5;
	Wed, 27 May 2020 06:23:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Mnxc015726 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 319D62156A2D; Wed, 27 May 2020 06:22:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E07A2156A22
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1428818A6663
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-328-BssnNbZ8PKKEtCRDZVXm3g-1;
	Wed, 27 May 2020 02:22:44 -0400
X-MC-Unique: BssnNbZ8PKKEtCRDZVXm3g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B3A10B2EB;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:17 +0200
Message-Id: <20200527062225.72849-8-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 07/15] dm-zoned: add device pointer to struct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a pointer to the containing device to struct dm_zone and
kill dmz_zone_to_dev().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 39 ++++++++++-----------------------------
 drivers/md/dm-zoned-reclaim.c  | 13 +++++--------
 drivers/md/dm-zoned-target.c   |  2 +-
 drivers/md/dm-zoned.h          |  4 +++-
 4 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index bb9ce72bf18c..302443b2d885 100644
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
@@ -333,7 +315,7 @@ static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
 }
 
 static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
-				  unsigned int zone_id)
+				  unsigned int zone_id, struct dmz_dev *dev)
 {
 	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
 
@@ -347,6 +329,7 @@ static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
 	atomic_set(&zone->refcount, 0);
 	zone->id = zone_id;
 	zone->chunk = DMZ_MAP_UNMAPPED;
+	zone->dev = dev;
 
 	return zone;
 }
@@ -1271,7 +1254,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 
 	/* Read and check the primary super block */
 	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
-	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
+	zmd->sb[0].dev = zmd->sb[0].zone->dev;
 	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
 	if (ret) {
 		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
@@ -1388,7 +1371,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 	int idx = num + dev->zone_offset;
 	struct dm_zone *zone;
 
-	zone = dmz_insert(zmd, idx);
+	zone = dmz_insert(zmd, idx, dev);
 	if (IS_ERR(zone))
 		return PTR_ERR(zone);
 
@@ -1452,7 +1435,7 @@ static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
 	for(idx = 0; idx < dev->nr_zones; idx++) {
 		struct dm_zone *zone;
 
-		zone = dmz_insert(zmd, idx);
+		zone = dmz_insert(zmd, idx, dev);
 		if (IS_ERR(zone))
 			return PTR_ERR(zone);
 		set_bit(DMZ_CACHE, &zone->flags);
@@ -1578,7 +1561,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
+	struct dmz_dev *dev = zone->dev;
 	unsigned int noio_flag;
 	int ret;
 
@@ -1615,7 +1598,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 				    struct dm_zone *zone)
 {
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
+	struct dmz_dev *dev = zone->dev;
 	unsigned int wp = 0;
 	int ret;
 
@@ -1652,7 +1635,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
+		struct dmz_dev *dev = zone->dev;
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
@@ -2213,9 +2196,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
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
index fd4d47dfcea1..e9e3b730e258 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -58,7 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 				sector_t block)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
-	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
+	struct dmz_dev *dev = zone->dev;
 	sector_t wp_block = zone->wp_block;
 	unsigned int nr_blocks;
 	int ret;
@@ -116,7 +116,6 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
-	struct dmz_dev *src_dev, *dst_dev;
 	struct dm_io_region src, dst;
 	sector_t block = 0, end_block;
 	sector_t nr_blocks;
@@ -130,17 +129,15 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
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
@@ -163,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
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
index 2770e293a97b..087dd4801663 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -123,7 +123,7 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 {
 	struct dmz_bioctx *bioctx =
 		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
-	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
+	struct dmz_dev *dev = zone->dev;
 	struct bio *clone;
 
 	if (dev->flags & DMZ_BDEV_DYING)
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 3451b5a768b4..316344bf07bd 100644
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
 
@@ -190,7 +193,6 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd);
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

