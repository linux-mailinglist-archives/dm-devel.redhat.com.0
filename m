Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2614E1B0647
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587377370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cUKMeDHyU9A5BEP9AXWLXcww9Q9TZwjSRrCmiFqywR0=;
	b=Hvo4g6MceFWW5om319ri+4fPV2hNLpkOwEE4XrsIaL13suYT50V7DWZgDq1de9r0Znlj5/
	Z8dgGlF0angpFAkx9py5r+bNtcFiLpQf0JlFC0BJYGjoRdaju/YfDNkKxKWWAxu1+IOvn1
	TJREFOsiKd3ZODFxwPsKI2q2VicRIFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-x_jObSRhNqe-Ci56HCGTLA-1; Mon, 20 Apr 2020 06:09:23 -0400
X-MC-Unique: x_jObSRhNqe-Ci56HCGTLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37A2285EE73;
	Mon, 20 Apr 2020 10:09:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0034D11E7ED;
	Mon, 20 Apr 2020 10:09:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A34193907;
	Mon, 20 Apr 2020 10:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KA8n6b008187 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:08:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75D232166B28; Mon, 20 Apr 2020 10:08:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71C792166B27
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD422800298
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-173-UkOwaHLBOhW6tFBqMCkB8g-1;
	Mon, 20 Apr 2020 06:08:46 -0400
X-MC-Unique: UkOwaHLBOhW6tFBqMCkB8g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2489EAFC5;
	Mon, 20 Apr 2020 10:08:42 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 20 Apr 2020 12:08:16 +0200
Message-Id: <20200420100824.124618-6-hare@suse.de>
In-Reply-To: <20200420100824.124618-1-hare@suse.de>
References: <20200420100824.124618-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KA8n6b008187
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 05/13] dm-zoned: move fields from struct dmz_dev
	to dmz_metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move fields from the device structure into the metadata structure
and provide accessor functions.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 88 ++++++++++++++++++++++++++++--------------
 drivers/md/dm-zoned-reclaim.c  |  8 ++--
 drivers/md/dm-zoned-target.c   | 48 +++++++++++------------
 drivers/md/dm-zoned.h          | 14 +++----
 4 files changed, 95 insertions(+), 63 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index def836e12dd9..b844ff02ae7b 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -138,9 +138,16 @@ struct dmz_metadata {
 	unsigned int		zone_nr_bitmap_blocks;
 	unsigned int		zone_bits_per_mblk;
 
+	sector_t		zone_nr_blocks;
+	sector_t		zone_nr_blocks_shift;
+
+	sector_t		zone_nr_sectors;
+	sector_t		zone_nr_sectors_shift;
+
 	unsigned int		nr_bitmap_blocks;
 	unsigned int		nr_map_blocks;
 
+	unsigned int		nr_zones;
 	unsigned int		nr_useable_zones;
 	unsigned int		nr_meta_blocks;
 	unsigned int		nr_meta_zones;
@@ -190,12 +197,12 @@ struct dmz_metadata {
  */
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)zone->id << zmd->dev->zone_nr_sectors_shift;
+	return (sector_t)zone->id << zmd->zone_nr_sectors_shift;
 }
 
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)zone->id << zmd->dev->zone_nr_blocks_shift;
+	return (sector_t)zone->id << zmd->zone_nr_blocks_shift;
 }
 
 struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
@@ -203,9 +210,29 @@ struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
 	return &zmd->dev[0];
 }
 
+unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd)
+{
+	return zmd->zone_nr_blocks;
+}
+
+unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd)
+{
+	return zmd->zone_nr_blocks_shift;
+}
+
+unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd)
+{
+	return zmd->zone_nr_sectors;
+}
+
+unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd)
+{
+	return zmd->zone_nr_sectors_shift;
+}
+
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
 {
-	return zmd->dev->nr_zones;
+	return zmd->nr_zones;
 }
 
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
@@ -882,8 +909,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 		return -ENXIO;
 	}
 
-	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + dev->zone_nr_blocks - 1)
-		>> dev->zone_nr_blocks_shift;
+	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
+		>> zmd->zone_nr_blocks_shift;
 	if (!nr_meta_zones ||
 	    nr_meta_zones >= zmd->nr_rnd_zones) {
 		dmz_dev_err(dev, "Invalid number of metadata blocks");
@@ -932,7 +959,7 @@ static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
  */
 static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 {
-	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
+	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
 	struct dmz_mblock *mblk;
 	int i;
 
@@ -1143,7 +1170,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 	struct dmz_dev *dev = zmd->dev;
 
 	/* Ignore the eventual last runt (smaller) zone */
-	if (blkz->len != dev->zone_nr_sectors) {
+	if (blkz->len != zmd->zone_nr_sectors) {
 		if (blkz->start + blkz->len == dev->capacity)
 			return 0;
 		return -ENXIO;
@@ -1208,19 +1235,24 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	int ret;
 
 	/* Init */
-	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
+	zmd->zone_nr_sectors = dev->zone_nr_sectors;
+	zmd->zone_nr_sectors_shift = ilog2(zmd->zone_nr_sectors);
+	zmd->zone_nr_blocks = dmz_sect2blk(zmd->zone_nr_sectors);
+	zmd->zone_nr_blocks_shift = ilog2(zmd->zone_nr_blocks);
+	zmd->zone_bitmap_size = zmd->zone_nr_blocks >> 3;
 	zmd->zone_nr_bitmap_blocks =
 		max_t(sector_t, 1, zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT);
-	zmd->zone_bits_per_mblk = min_t(sector_t, dev->zone_nr_blocks,
+	zmd->zone_bits_per_mblk = min_t(sector_t, zmd->zone_nr_blocks,
 					DMZ_BLOCK_SIZE_BITS);
 
 	/* Allocate zone array */
-	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
+	zmd->nr_zones = dev->nr_zones;
+	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
 	if (!zmd->zones)
 		return -ENOMEM;
 
 	dmz_dev_info(dev, "Using %zu B for zone information",
-		     sizeof(struct dm_zone) * dev->nr_zones);
+		     sizeof(struct dm_zone) * zmd->nr_zones);
 
 	/*
 	 * Get zone information and initialize zone descriptors.  At the same
@@ -1339,7 +1371,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
-				       dev->zone_nr_sectors, GFP_NOIO);
+				       zmd->zone_nr_sectors, GFP_NOIO);
 		if (ret) {
 			dmz_dev_err(dev, "Reset zone %u failed %d",
 				    zone->id, ret);
@@ -1393,7 +1425,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dzone_id == DMZ_MAP_UNMAPPED)
 			goto next;
 
-		if (dzone_id >= dev->nr_zones) {
+		if (dzone_id >= zmd->nr_zones) {
 			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
 				    chunk, dzone_id);
 			return -EIO;
@@ -1414,7 +1446,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (bzone_id == DMZ_MAP_UNMAPPED)
 			goto next;
 
-		if (bzone_id >= dev->nr_zones) {
+		if (bzone_id >= zmd->nr_zones) {
 			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
 				    chunk, bzone_id);
 			return -EIO;
@@ -1446,7 +1478,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 	 * fully initialized. All remaining zones are unmapped data
 	 * zones. Finish initializing those here.
 	 */
-	for (i = 0; i < dev->nr_zones; i++) {
+	for (i = 0; i < zmd->nr_zones; i++) {
 		dzone = dmz_get(zmd, i);
 		if (dmz_is_meta(dzone))
 			continue;
@@ -1990,7 +2022,7 @@ int dmz_copy_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 	sector_t chunk_block = 0;
 
 	/* Get the zones bitmap blocks */
-	while (chunk_block < zmd->dev->zone_nr_blocks) {
+	while (chunk_block < zmd->zone_nr_blocks) {
 		from_mblk = dmz_get_bitmap(zmd, from_zone, chunk_block);
 		if (IS_ERR(from_mblk))
 			return PTR_ERR(from_mblk);
@@ -2025,7 +2057,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 	int ret;
 
 	/* Get the zones bitmap blocks */
-	while (chunk_block < zmd->dev->zone_nr_blocks) {
+	while (chunk_block < zmd->zone_nr_blocks) {
 		/* Get a valid region from the source zone */
 		ret = dmz_first_valid_block(zmd, from_zone, &chunk_block);
 		if (ret <= 0)
@@ -2049,7 +2081,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 			sector_t chunk_block, unsigned int nr_blocks)
 {
 	unsigned int count, bit, nr_bits;
-	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
+	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
 	struct dmz_mblock *mblk;
 	unsigned int n = 0;
 
@@ -2136,7 +2168,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
 		      zone->id, (u64)chunk_block, nr_blocks);
 
-	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
+	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
 
 	while (nr_blocks) {
 		/* Get bitmap block */
@@ -2180,7 +2212,7 @@ static int dmz_test_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 	struct dmz_mblock *mblk;
 	int ret;
 
-	WARN_ON(chunk_block >= zmd->dev->zone_nr_blocks);
+	WARN_ON(chunk_block >= zmd->zone_nr_blocks);
 
 	/* Get bitmap block */
 	mblk = dmz_get_bitmap(zmd, zone, chunk_block);
@@ -2210,7 +2242,7 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 	unsigned long *bitmap;
 	int n = 0;
 
-	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
+	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
 
 	while (nr_blocks) {
 		/* Get bitmap block */
@@ -2254,7 +2286,7 @@ int dmz_block_valid(struct dmz_metadata *zmd, struct dm_zone *zone,
 
 	/* The block is valid: get the number of valid blocks from block */
 	return dmz_to_next_set_block(zmd, zone, chunk_block,
-				     zmd->dev->zone_nr_blocks - chunk_block, 0);
+				     zmd->zone_nr_blocks - chunk_block, 0);
 }
 
 /*
@@ -2270,7 +2302,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 	int ret;
 
 	ret = dmz_to_next_set_block(zmd, zone, start_block,
-				    zmd->dev->zone_nr_blocks - start_block, 1);
+				    zmd->zone_nr_blocks - start_block, 1);
 	if (ret < 0)
 		return ret;
 
@@ -2278,7 +2310,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 	*chunk_block = start_block;
 
 	return dmz_to_next_set_block(zmd, zone, start_block,
-				     zmd->dev->zone_nr_blocks - start_block, 0);
+				     zmd->zone_nr_blocks - start_block, 0);
 }
 
 /*
@@ -2317,7 +2349,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone)
 	struct dmz_mblock *mblk;
 	sector_t chunk_block = 0;
 	unsigned int bit, nr_bits;
-	unsigned int nr_blocks = zmd->dev->zone_nr_blocks;
+	unsigned int nr_blocks = zmd->zone_nr_blocks;
 	void *bitmap;
 	int n = 0;
 
@@ -2488,7 +2520,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
 		     (u64)dev->capacity);
 	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
-		     dev->nr_zones, (u64)dev->zone_nr_sectors);
+		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
 	dmz_dev_info(dev, "  %u metadata zones",
 		     zmd->nr_meta_zones * 2);
 	dmz_dev_info(dev, "  %u data zones for %u chunks",
@@ -2541,7 +2573,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
 	int ret;
 
 	/* Check zones */
-	for (i = 0; i < dev->nr_zones; i++) {
+	for (i = 0; i < zmd->nr_zones; i++) {
 		zone = dmz_get(zmd, i);
 		if (!zone) {
 			dmz_dev_err(dev, "Unable to get zone %u", i);
@@ -2569,7 +2601,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
 				    i, (u64)zone->wp_block, (u64)wp_block);
 			zone->wp_block = wp_block;
 			dmz_invalidate_blocks(zmd, zone, zone->wp_block,
-					      dev->zone_nr_blocks - zone->wp_block);
+					      zmd->zone_nr_blocks - zone->wp_block);
 		}
 	}
 
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 7f57c4299a2f..5aa5e5130fe8 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -128,7 +128,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 	if (dmz_is_seq(src_zone))
 		end_block = src_zone->wp_block;
 	else
-		end_block = dev->zone_nr_blocks;
+		end_block = dmz_zone_nr_blocks(zmd);
 	src_zone_block = dmz_start_block(zmd, src_zone);
 	dst_zone_block = dmz_start_block(zmd, dst_zone);
 
@@ -210,7 +210,7 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	ret = dmz_merge_valid_blocks(zmd, bzone, dzone, chunk_block);
 	if (ret == 0) {
 		/* Free the buffer zone */
-		dmz_invalidate_blocks(zmd, bzone, 0, zrc->dev->zone_nr_blocks);
+		dmz_invalidate_blocks(zmd, bzone, 0, dmz_zone_nr_blocks(zmd));
 		dmz_lock_map(zmd);
 		dmz_unmap_zone(zmd, bzone);
 		dmz_unlock_zone_reclaim(dzone);
@@ -252,7 +252,7 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 		 * Free the data zone and remap the chunk to
 		 * the buffer zone.
 		 */
-		dmz_invalidate_blocks(zmd, dzone, 0, zrc->dev->zone_nr_blocks);
+		dmz_invalidate_blocks(zmd, dzone, 0, dmz_zone_nr_blocks(zmd));
 		dmz_lock_map(zmd);
 		dmz_unmap_zone(zmd, bzone);
 		dmz_unmap_zone(zmd, dzone);
@@ -305,7 +305,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 		dmz_unlock_map(zmd);
 	} else {
 		/* Free the data zone and remap the chunk */
-		dmz_invalidate_blocks(zmd, dzone, 0, zrc->dev->zone_nr_blocks);
+		dmz_invalidate_blocks(zmd, dzone, 0, dmz_zone_nr_blocks(zmd));
 		dmz_lock_map(zmd);
 		dmz_unmap_zone(zmd, dzone);
 		dmz_unlock_zone_reclaim(dzone);
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 7268e0af9e17..1e22da9d7b40 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -165,7 +165,8 @@ static void dmz_handle_read_zero(struct dmz_target *dmz, struct bio *bio,
 static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 			   struct bio *bio)
 {
-	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
+	struct dmz_metadata *zmd = dmz->metadata;
+	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
 	unsigned int nr_blocks = dmz_bio_blocks(bio);
 	sector_t end_block = chunk_block + nr_blocks;
 	struct dm_zone *rzone, *bzone;
@@ -178,7 +179,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 	}
 
 	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
+		      (unsigned long long)dmz_bio_chunk(zmd, bio),
 		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
 		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
@@ -189,7 +190,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 		nr_blocks = 0;
 		if (dmz_is_rnd(zone) || chunk_block < zone->wp_block) {
 			/* Test block validity in the data zone */
-			ret = dmz_block_valid(dmz->metadata, zone, chunk_block);
+			ret = dmz_block_valid(zmd, zone, chunk_block);
 			if (ret < 0)
 				return ret;
 			if (ret > 0) {
@@ -204,7 +205,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 		 * Check the buffer zone, if there is one.
 		 */
 		if (!nr_blocks && bzone) {
-			ret = dmz_block_valid(dmz->metadata, bzone, chunk_block);
+			ret = dmz_block_valid(zmd, bzone, chunk_block);
 			if (ret < 0)
 				return ret;
 			if (ret > 0) {
@@ -308,14 +309,15 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
 static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 			    struct bio *bio)
 {
-	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
+	struct dmz_metadata *zmd = dmz->metadata;
+	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
 	unsigned int nr_blocks = dmz_bio_blocks(bio);
 
 	if (!zone)
 		return -ENOSPC;
 
 	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
+		      (unsigned long long)dmz_bio_chunk(zmd, bio),
 		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
 		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
@@ -345,7 +347,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 	struct dmz_metadata *zmd = dmz->metadata;
 	sector_t block = dmz_bio_block(bio);
 	unsigned int nr_blocks = dmz_bio_blocks(bio);
-	sector_t chunk_block = dmz_chunk_block(dmz->dev, block);
+	sector_t chunk_block = dmz_chunk_block(zmd, block);
 	int ret = 0;
 
 	/* For unmapped chunks, there is nothing to do */
@@ -356,7 +358,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 		return -EROFS;
 
 	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
+		      (unsigned long long)dmz_bio_chunk(zmd, bio),
 		      zone->id,
 		      (unsigned long long)chunk_block, nr_blocks);
 
@@ -402,7 +404,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 	 * mapping for read and discard. If a mapping is obtained,
 	 + the zone returned will be set to active state.
 	 */
-	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(dmz->dev, bio),
+	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(zmd, bio),
 				     bio_op(bio));
 	if (IS_ERR(zone)) {
 		ret = PTR_ERR(zone);
@@ -525,7 +527,7 @@ static void dmz_flush_work(struct work_struct *work)
  */
 static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 {
-	unsigned int chunk = dmz_bio_chunk(dmz->dev, bio);
+	unsigned int chunk = dmz_bio_chunk(dmz->metadata, bio);
 	struct dm_chunk_work *cw;
 	int ret = 0;
 
@@ -618,6 +620,7 @@ bool dmz_check_bdev(struct dmz_dev *dmz_dev)
 static int dmz_map(struct dm_target *ti, struct bio *bio)
 {
 	struct dmz_target *dmz = ti->private;
+	struct dmz_metadata *zmd = dmz->metadata;
 	struct dmz_dev *dev = dmz->dev;
 	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	sector_t sector = bio->bi_iter.bi_sector;
@@ -630,8 +633,8 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 
 	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
 		      bio_op(bio), (unsigned long long)sector, nr_sectors,
-		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
-		      (unsigned long long)dmz_chunk_block(dmz->dev, dmz_bio_block(bio)),
+		      (unsigned long long)dmz_bio_chunk(zmd, bio),
+		      (unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
 		      (unsigned int)dmz_bio_blocks(bio));
 
 	bio_set_dev(bio, dev->bdev);
@@ -659,16 +662,16 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	}
 
 	/* Split zone BIOs to fit entirely into a zone */
-	chunk_sector = sector & (dev->zone_nr_sectors - 1);
-	if (chunk_sector + nr_sectors > dev->zone_nr_sectors)
-		dm_accept_partial_bio(bio, dev->zone_nr_sectors - chunk_sector);
+	chunk_sector = sector & (dmz_zone_nr_sectors(zmd) - 1);
+	if (chunk_sector + nr_sectors > dmz_zone_nr_sectors(zmd))
+		dm_accept_partial_bio(bio, dmz_zone_nr_sectors(zmd) - chunk_sector);
 
 	/* Now ready to handle this BIO */
 	ret = dmz_queue_chunk_work(dmz, bio);
 	if (ret) {
 		dmz_dev_debug(dmz->dev,
 			      "BIO op %d, can't process chunk %llu, err %i\n",
-			      bio_op(bio), (u64)dmz_bio_chunk(dmz->dev, bio),
+			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
 			      ret);
 		return DM_MAPIO_REQUEUE;
 	}
@@ -722,10 +725,6 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
 	}
 
 	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
-	dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
-
-	dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
-	dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
 
 	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
 
@@ -790,7 +789,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	/* Set target (no write same support) */
-	ti->max_io_len = dev->zone_nr_sectors << 9;
+	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata) << 9;
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_write_zeroes_bios = 1;
@@ -799,7 +798,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->discards_supported = true;
 
 	/* The exposed capacity is the number of chunks that can be mapped */
-	ti->len = (sector_t)dmz_nr_chunks(dmz->metadata) << dev->zone_nr_sectors_shift;
+	ti->len = (sector_t)dmz_nr_chunks(dmz->metadata) <<
+		dmz_zone_nr_sectors_shift(dmz->metadata);
 
 	/* Zone BIO */
 	ret = bioset_init(&dmz->bio_set, DMZ_MIN_BIOS, 0, 0);
@@ -895,7 +895,7 @@ static void dmz_dtr(struct dm_target *ti)
 static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 {
 	struct dmz_target *dmz = ti->private;
-	unsigned int chunk_sectors = dmz->dev->zone_nr_sectors;
+	unsigned int chunk_sectors = dmz_zone_nr_sectors(dmz->metadata);
 
 	limits->logical_block_size = DMZ_BLOCK_SIZE;
 	limits->physical_block_size = DMZ_BLOCK_SIZE;
@@ -960,7 +960,7 @@ static int dmz_iterate_devices(struct dm_target *ti,
 {
 	struct dmz_target *dmz = ti->private;
 	struct dmz_dev *dev = dmz->dev;
-	sector_t capacity = dev->capacity & ~(dev->zone_nr_sectors - 1);
+	sector_t capacity = dev->capacity & ~(dmz_zone_nr_sectors(dmz->metadata) - 1);
 
 	return fn(ti, dmz->ddev, 0, capacity, data);
 }
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 30781646741a..f997ad62c7b4 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -60,15 +60,11 @@ struct dmz_dev {
 	unsigned int		flags;
 
 	sector_t		zone_nr_sectors;
-	unsigned int		zone_nr_sectors_shift;
-
-	sector_t		zone_nr_blocks;
-	sector_t		zone_nr_blocks_shift;
 };
 
-#define dmz_bio_chunk(dev, bio)	((bio)->bi_iter.bi_sector >> \
-				 (dev)->zone_nr_sectors_shift)
-#define dmz_chunk_block(dev, b)	((b) & ((dev)->zone_nr_blocks - 1))
+#define dmz_bio_chunk(zmd, bio)	((bio)->bi_iter.bi_sector >> \
+				 dmz_zone_nr_sectors_shift(zmd))
+#define dmz_chunk_block(zmd, b)	((b) & (dmz_zone_nr_blocks(zmd) - 1))
 
 /* Device flags. */
 #define DMZ_BDEV_DYING		(1 << 0)
@@ -197,6 +193,10 @@ unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
+unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd);
+unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd);
+unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd);
+unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd);
 
 /*
  * Activate a zone (increment its reference count).
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

