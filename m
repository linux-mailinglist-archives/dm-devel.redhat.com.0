Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1674D1EBA17
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3OOVDNKsjITWgo9syXrXg5R+MjWRz//d57leBi835HM=;
	b=VCT+Mcjh2Z1Xkfb9/oa7lhCSlJzKE9Fo6YvTeybEAva9t02S+ESI12Doe4IpZSXsALIoZY
	iaBH3s8h/SmDv1wcChqc3QpKho8sSxaTaEVA4tJ6LDdv1AElP8x46leJZUGeqzMuBsfaMV
	BPvc8Wxu/mixyug95YtRUV4hHIVru6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-ERckrZATN0CtQnHPdBdplg-1; Tue, 02 Jun 2020 07:10:37 -0400
X-MC-Unique: ERckrZATN0CtQnHPdBdplg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF426BFD1;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9AF1972B;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87ED81809543;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BAAdR027419 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D46D12156A2D; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A5F2166B28
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6523800294
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-290-cvmamMvMN5Kf8lJUvpU_OA-1;
	Tue, 02 Jun 2020 07:10:06 -0400
X-MC-Unique: cvmamMvMN5Kf8lJUvpU_OA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6CABFAEAC;
	Tue,  2 Jun 2020 11:10:05 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:46 +0200
Message-Id: <20200602110956.121170-6-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 05/15] dm-zoned: convert to xarray
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The zones array is getting really large, and large arrays
tend to wreak havoc with the CPU caches.
So convert it to xarray to become more cache friendly.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 120 ++++++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 32 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 0982ab1758a6..839f9078806d 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -172,7 +172,7 @@ struct dmz_metadata {
 	unsigned int		nr_chunks;
 
 	/* Zone information array */
-	struct dm_zone		*zones;
+	struct xarray		zones;
 
 	struct dmz_sb		sb[3];
 	unsigned int		mblk_primary;
@@ -327,6 +327,30 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_seq);
 }
 
+static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
+{
+	return xa_load(&zmd->zones, zone_id);
+}
+
+static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
+				  unsigned int zone_id)
+{
+	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
+
+	if (!zone)
+		return ERR_PTR(-ENOMEM);
+
+	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL))
+		return ERR_PTR(-EBUSY);
+
+	INIT_LIST_HEAD(&zone->link);
+	atomic_set(&zone->refcount, 0);
+	zone->id = zone_id;
+	zone->chunk = DMZ_MAP_UNMAPPED;
+
+	return zone;
+}
+
 const char *dmz_metadata_label(struct dmz_metadata *zmd)
 {
 	return (const char *)zmd->label;
@@ -1122,6 +1146,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 {
 	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
 	struct dmz_mblock *mblk;
+	unsigned int zone_id = zmd->sb[0].zone->id;
 	int i;
 
 	/* Allocate a block */
@@ -1134,16 +1159,15 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 
 	/* Bad first super block: search for the second one */
 	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
-	zmd->sb[1].zone = zmd->sb[0].zone + 1;
+	zmd->sb[1].zone = dmz_get(zmd, zone_id + 1);
 	zmd->sb[1].dev = zmd->sb[0].dev;
-	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
+	for (i = 1; i < zmd->nr_rnd_zones; i++) {
 		if (dmz_read_sb(zmd, 1) != 0)
 			break;
-		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC) {
-			zmd->sb[1].zone += i;
+		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
 			return 0;
-		}
 		zmd->sb[1].block += zone_nr_blocks;
+		zmd->sb[1].zone = dmz_get(zmd, zone_id + i);
 	}
 
 	dmz_free_mblock(zmd, mblk);
@@ -1259,8 +1283,12 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 	/* Read and check secondary super block */
 	if (ret == 0) {
 		sb_good[0] = true;
-		if (!zmd->sb[1].zone)
-			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
+		if (!zmd->sb[1].zone) {
+			unsigned int zone_id =
+				zmd->sb[0].zone->id + zmd->nr_meta_zones;
+
+			zmd->sb[1].zone = dmz_get(zmd, zone_id);
+		}
 		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
 		zmd->sb[1].dev = zmd->sb[0].dev;
 		ret = dmz_get_sb(zmd, 1);
@@ -1341,7 +1369,11 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 	struct dmz_metadata *zmd = data;
 	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
 	int idx = num + dev->zone_offset;
-	struct dm_zone *zone = &zmd->zones[idx];
+	struct dm_zone *zone;
+
+	zone = dmz_insert(zmd, idx);
+	if (IS_ERR(zone))
+		return PTR_ERR(zone);
 
 	if (blkz->len != zmd->zone_nr_sectors) {
 		if (zmd->sb_version > 1) {
@@ -1353,11 +1385,6 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 		return -ENXIO;
 	}
 
-	INIT_LIST_HEAD(&zone->link);
-	atomic_set(&zone->refcount, 0);
-	zone->id = idx;
-	zone->chunk = DMZ_MAP_UNMAPPED;
-
 	switch (blkz->type) {
 	case BLK_ZONE_TYPE_CONVENTIONAL:
 		set_bit(DMZ_RND, &zone->flags);
@@ -1397,18 +1424,17 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 	return 0;
 }
 
-static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
+static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
 {
 	int idx;
 	sector_t zone_offset = 0;
 
 	for(idx = 0; idx < dev->nr_zones; idx++) {
-		struct dm_zone *zone = &zmd->zones[idx];
+		struct dm_zone *zone;
 
-		INIT_LIST_HEAD(&zone->link);
-		atomic_set(&zone->refcount, 0);
-		zone->id = idx;
-		zone->chunk = DMZ_MAP_UNMAPPED;
+		zone = dmz_insert(zmd, idx);
+		if (IS_ERR(zone))
+			return PTR_ERR(zone);
 		set_bit(DMZ_CACHE, &zone->flags);
 		zone->wp_block = 0;
 		zmd->nr_cache_zones++;
@@ -1420,6 +1446,7 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
 		}
 		zone_offset += zmd->zone_nr_sectors;
 	}
+	return 0;
 }
 
 /*
@@ -1427,8 +1454,15 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
  */
 static void dmz_drop_zones(struct dmz_metadata *zmd)
 {
-	kfree(zmd->zones);
-	zmd->zones = NULL;
+	int idx;
+
+	for(idx = 0; idx < zmd->nr_zones; idx++) {
+		struct dm_zone *zone = xa_load(&zmd->zones, idx);
+
+		kfree(zone);
+		xa_erase(&zmd->zones, idx);
+	}
+	xa_destroy(&zmd->zones);
 }
 
 /*
@@ -1460,20 +1494,25 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 		DMERR("(%s): No zones found", zmd->devname);
 		return -ENXIO;
 	}
-	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
-	if (!zmd->zones)
-		return -ENOMEM;
+	xa_init(&zmd->zones);
 
 	DMDEBUG("(%s): Using %zu B for zone information",
 		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
 
 	if (zmd->nr_devs > 1) {
-		dmz_emulate_zones(zmd, &zmd->dev[0]);
+		ret = dmz_emulate_zones(zmd, &zmd->dev[0]);
+		if (ret < 0) {
+			DMDEBUG("(%s): Failed to emulate zones, error %d",
+				zmd->devname, ret);
+			dmz_drop_zones(zmd);
+			return ret;
+		}
+
 		/*
 		 * Primary superblock zone is always at zone 0 when multiple
 		 * drives are present.
 		 */
-		zmd->sb[0].zone = &zmd->zones[0];
+		zmd->sb[0].zone = dmz_get(zmd, 0);
 
 		zoned_dev = &zmd->dev[1];
 	}
@@ -1576,11 +1615,6 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 	return 0;
 }
 
-static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
-{
-	return &zmd->zones[zone_id];
-}
-
 /*
  * Reset a zone write pointer.
  */
@@ -1662,6 +1696,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		}
 
 		dzone = dmz_get(zmd, dzone_id);
+		if (!dzone) {
+			dmz_zmd_err(zmd, "Chunk %u mapping: data zone %u not present",
+				    chunk, dzone_id);
+			return -EIO;
+		}
 		set_bit(DMZ_DATA, &dzone->flags);
 		dzone->chunk = chunk;
 		dmz_get_zone_weight(zmd, dzone);
@@ -1685,6 +1724,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		}
 
 		bzone = dmz_get(zmd, bzone_id);
+		if (!bzone) {
+			dmz_zmd_err(zmd, "Chunk %u mapping: buffer zone %u not present",
+				    chunk, bzone_id);
+			return -EIO;
+		}
 		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
 			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
 				    chunk, bzone_id);
@@ -1715,6 +1759,8 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 	 */
 	for (i = 0; i < zmd->nr_zones; i++) {
 		dzone = dmz_get(zmd, i);
+		if (!dzone)
+			continue;
 		if (dmz_is_meta(dzone))
 			continue;
 		if (dmz_is_offline(dzone))
@@ -1978,6 +2024,10 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 	} else {
 		/* The chunk is already mapped: get the mapping zone */
 		dzone = dmz_get(zmd, dzone_id);
+		if (!dzone) {
+			dzone = ERR_PTR(-EIO);
+			goto out;
+		}
 		if (dzone->chunk != chunk) {
 			dzone = ERR_PTR(-EIO);
 			goto out;
@@ -2794,6 +2844,12 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	/* Set metadata zones starting from sb_zone */
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
 		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
+		if (!zone) {
+			dmz_zmd_err(zmd,
+				    "metadata zone %u not present", i);
+			ret = -ENXIO;
+			goto err;
+		}
 		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
 			dmz_zmd_err(zmd,
 				    "metadata zone %d is not random", i);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

