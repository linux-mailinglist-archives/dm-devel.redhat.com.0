Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2C81CD3C1
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185524;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sZm6cyhCeBhFBJ82/C3ngC54dF8ukZ4I4O3KcoF3ESY=;
	b=R4NME4qNJDpgdy/VEjhsi733RGiIptIcQj71RzkOS7uR2lNVuMHqzinTpp31Fx6KG0Ts1X
	7ypZPBpqJT1YdS7BjkzRH4zr001h31/uiql1f+slaV7KJAFGYSAOQho64em7X/xWFaBrrS
	Rhk9J3oycWEoRzZNwAuXWmckgfRQe58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-ygcy7Pf9Of2bcrZ2Kr9H9Q-1; Mon, 11 May 2020 04:25:22 -0400
X-MC-Unique: ygcy7Pf9Of2bcrZ2Kr9H9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8351EC1B1;
	Mon, 11 May 2020 08:25:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 759B25D9DC;
	Mon, 11 May 2020 08:25:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4AD34E585;
	Mon, 11 May 2020 08:25:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8OxJ1031999 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6CA72156A22; Mon, 11 May 2020 08:24:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A34802166B28
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8596C101A526
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-382-FBLRTC9nP-mVyJPiK6spWA-1;
	Mon, 11 May 2020 04:24:46 -0400
X-MC-Unique: FBLRTC9nP-mVyJPiK6spWA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 17F26AE70;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:18 +0200
Message-Id: <20200511082430.39455-4-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 03/15] dm-zoned: store zone id within the zone
	structure and kill dmz_id()
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

Instead of calculating the zone index by the offset within the
zone array store the index within the structure itself. With that
the helper dmz_id() is pointless and can be replaced with accessing
the ->id value directly.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 40 +++++++++++++++++-----------------------
 drivers/md/dm-zoned-reclaim.c  | 17 ++++++++---------
 drivers/md/dm-zoned-target.c   |  6 +++---
 drivers/md/dm-zoned.h          |  4 +++-
 4 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index c8787560fa9f..1993eeb26bc1 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -187,19 +187,14 @@ struct dmz_metadata {
 /*
  * Various accessors
  */
-unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
-{
-	return ((unsigned int)(zone - zmd->zones));
-}
-
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_sectors_shift;
+	return (sector_t)zone->id << zmd->dev->zone_nr_sectors_shift;
 }
 
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
+	return (sector_t)zone->id << zmd->dev->zone_nr_blocks_shift;
 }
 
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
@@ -1119,6 +1114,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 
 	INIT_LIST_HEAD(&zone->link);
 	atomic_set(&zone->refcount, 0);
+	zone->id = idx;
 	zone->chunk = DMZ_MAP_UNMAPPED;
 
 	switch (blkz->type) {
@@ -1246,7 +1242,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		ret = -EIO;
 	if (ret < 0) {
 		dmz_dev_err(zmd->dev, "Get zone %u report failed",
-			    dmz_id(zmd, zone));
+			    zone->id);
 		dmz_check_bdev(zmd->dev);
 		return ret;
 	}
@@ -1270,7 +1266,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 		return ret;
 
 	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
-		     dmz_id(zmd, zone), zone->wp_block, wp);
+		     zone->id, zone->wp_block, wp);
 
 	if (zone->wp_block < wp) {
 		dmz_invalidate_blocks(zmd, zone, zone->wp_block,
@@ -1309,7 +1305,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 				       dev->zone_nr_sectors, GFP_NOIO);
 		if (ret) {
 			dmz_dev_err(dev, "Reset zone %u failed %d",
-				    dmz_id(zmd, zone), ret);
+				    zone->id, ret);
 			return ret;
 		}
 	}
@@ -1757,8 +1753,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	}
 
 	/* Update the chunk mapping */
-	dmz_set_chunk_mapping(zmd, dzone->chunk, dmz_id(zmd, dzone),
-			      dmz_id(zmd, bzone));
+	dmz_set_chunk_mapping(zmd, dzone->chunk, dzone->id, bzone->id);
 
 	set_bit(DMZ_BUF, &bzone->flags);
 	bzone->chunk = dzone->chunk;
@@ -1810,7 +1805,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		atomic_dec(&zmd->unmap_nr_seq);
 
 	if (dmz_is_offline(zone)) {
-		dmz_dev_warn(zmd->dev, "Zone %u is offline", dmz_id(zmd, zone));
+		dmz_dev_warn(zmd->dev, "Zone %u is offline", zone->id);
 		zone = NULL;
 		goto again;
 	}
@@ -1852,7 +1847,7 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
 		  unsigned int chunk)
 {
 	/* Set the chunk mapping */
-	dmz_set_chunk_mapping(zmd, chunk, dmz_id(zmd, dzone),
+	dmz_set_chunk_mapping(zmd, chunk, dzone->id,
 			      DMZ_MAP_UNMAPPED);
 	dzone->chunk = chunk;
 	if (dmz_is_rnd(dzone))
@@ -1880,7 +1875,7 @@ void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		 * Unmapping the chunk buffer zone: clear only
 		 * the chunk buffer mapping
 		 */
-		dzone_id = dmz_id(zmd, zone->bzone);
+		dzone_id = zone->bzone->id;
 		zone->bzone->bzone = NULL;
 		zone->bzone = NULL;
 
@@ -1942,7 +1937,7 @@ static struct dmz_mblock *dmz_get_bitmap(struct dmz_metadata *zmd,
 					 sector_t chunk_block)
 {
 	sector_t bitmap_block = 1 + zmd->nr_map_blocks +
-		(sector_t)(dmz_id(zmd, zone) * zmd->zone_nr_bitmap_blocks) +
+		(sector_t)(zone->id * zmd->zone_nr_bitmap_blocks) +
 		(chunk_block >> DMZ_BLOCK_SHIFT_BITS);
 
 	return dmz_get_mblock(zmd, bitmap_block);
@@ -2022,7 +2017,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 	unsigned int n = 0;
 
 	dmz_dev_debug(zmd->dev, "=> VALIDATE zone %u, block %llu, %u blocks",
-		      dmz_id(zmd, zone), (unsigned long long)chunk_block,
+		      zone->id, (unsigned long long)chunk_block,
 		      nr_blocks);
 
 	WARN_ON(chunk_block + nr_blocks > zone_nr_blocks);
@@ -2052,7 +2047,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 		zone->weight += n;
 	else {
 		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be <= %u",
-			     dmz_id(zmd, zone), zone->weight,
+			     zone->id, zone->weight,
 			     zone_nr_blocks - n);
 		zone->weight = zone_nr_blocks;
 	}
@@ -2102,7 +2097,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 	unsigned int n = 0;
 
 	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
-		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
+		      zone->id, (u64)chunk_block, nr_blocks);
 
 	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
 
@@ -2132,7 +2127,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 		zone->weight -= n;
 	else {
 		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be >= %u",
-			     dmz_id(zmd, zone), zone->weight, n);
+			     zone->id, zone->weight, n);
 		zone->weight = 0;
 	}
 
@@ -2378,7 +2373,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 {
 	struct dmz_metadata *zmd;
-	unsigned int i, zid;
+	unsigned int i;
 	struct dm_zone *zone;
 	int ret;
 
@@ -2419,9 +2414,8 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		goto err;
 
 	/* Set metadata zones starting from sb_zone */
-	zid = dmz_id(zmd, zmd->sb_zone);
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
-		zone = dmz_get(zmd, zid + i);
+		zone = dmz_get(zmd, zmd->sb_zone->id + i);
 		if (!dmz_is_rnd(zone))
 			goto err;
 		set_bit(DMZ_META, &zone->flags);
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index e7ace908a9b7..7f57c4299a2f 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -80,7 +80,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 	if (ret) {
 		dmz_dev_err(zrc->dev,
 			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
-			    dmz_id(zmd, zone), (unsigned long long)wp_block,
+			    zone->id, (unsigned long long)wp_block,
 			    (unsigned long long)block, nr_blocks, ret);
 		dmz_check_bdev(zrc->dev);
 		return ret;
@@ -196,8 +196,8 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_dev_debug(zrc->dev,
 		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
-		      dzone->chunk, dmz_id(zmd, bzone), dmz_weight(bzone),
-		      dmz_id(zmd, dzone), dmz_weight(dzone));
+		      dzone->chunk, bzone->id, dmz_weight(bzone),
+		      dzone->id, dmz_weight(dzone));
 
 	/* Flush data zone into the buffer zone */
 	ret = dmz_reclaim_copy(zrc, bzone, dzone);
@@ -235,8 +235,8 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_dev_debug(zrc->dev,
 		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
-		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
-		      dmz_id(zmd, bzone), dmz_weight(bzone));
+		      chunk, dzone->id, dmz_weight(dzone),
+		      bzone->id, dmz_weight(bzone));
 
 	/* Flush data zone into the buffer zone */
 	ret = dmz_reclaim_copy(zrc, dzone, bzone);
@@ -287,8 +287,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_dev_debug(zrc->dev,
 		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
-		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
-		      dmz_id(zmd, szone));
+		      chunk, dzone->id, dmz_weight(dzone), szone->id);
 
 	/* Flush the random data zone into the sequential zone */
 	ret = dmz_reclaim_copy(zrc, dzone, szone);
@@ -403,12 +402,12 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	if (ret) {
 		dmz_dev_debug(zrc->dev,
 			      "Metadata flush for zone %u failed, err %d\n",
-			      dmz_id(zmd, rzone), ret);
+			      rzone->id, ret);
 		return ret;
 	}
 
 	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
-		      dmz_id(zmd, rzone), jiffies_to_msecs(jiffies - start));
+		      rzone->id, jiffies_to_msecs(jiffies - start));
 	return 0;
 }
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 0bfe34162dbb..859ccc30ba7f 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -180,7 +180,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
 		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
 		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
-		      dmz_id(dmz->metadata, zone),
+		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
 
 	/* Check block validity to determine the read location */
@@ -317,7 +317,7 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
 		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
 		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
-		      dmz_id(dmz->metadata, zone),
+		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
 
 	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
@@ -357,7 +357,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 
 	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
 		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
-		      dmz_id(zmd, zone),
+		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
 
 	/*
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 884c0e586082..30781646741a 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -87,6 +87,9 @@ struct dm_zone {
 	/* Zone activation reference count */
 	atomic_t		refcount;
 
+	/* Zone id */
+	unsigned int		id;
+
 	/* Zone write pointer block (relative to the zone start block) */
 	unsigned int		wp_block;
 
@@ -176,7 +179,6 @@ void dmz_lock_flush(struct dmz_metadata *zmd);
 void dmz_unlock_flush(struct dmz_metadata *zmd);
 int dmz_flush_metadata(struct dmz_metadata *zmd);
 
-unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

