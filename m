Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A350819FB7D
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2ucc4bLwj9ex4lZAem0Eid9IAlSaMvARuI7cA3K6LOs=;
	b=OjxrlRpYwYjeDWqFejEkWrgprZs5VSrvUiKEPR1T/keXFpBpmAVyerPytFeOZu6DPNmZgg
	usRn/+xxT4wuvPUAAZXopkH5BwCsih3uI6Y2ufdOQRi+SEuZt9FGn3WvOq7crG4P7+QoLb
	v+RuVc87z+x5VW51qKUTtaxVtRhf0IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-K2mjcCyJMfC8BLqmlc7YtQ-1; Mon, 06 Apr 2020 13:27:58 -0400
X-MC-Unique: K2mjcCyJMfC8BLqmlc7YtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316A08017FE;
	Mon,  6 Apr 2020 17:27:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D8C1001DF0;
	Mon,  6 Apr 2020 17:27:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9339A93A6D;
	Mon,  6 Apr 2020 17:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HRmNf000460 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:27:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26FA011701C3; Mon,  6 Apr 2020 17:27:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A0B11701C2
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7B658F3B98
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-79-pMqPIvz9MliQNJhEq6ncAQ-1;
	Mon, 06 Apr 2020 13:27:41 -0400
X-MC-Unique: pMqPIvz9MliQNJhEq6ncAQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CAC70BDCA;
	Mon,  6 Apr 2020 17:27:38 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:35:03 +0200
Message-Id: <20200406143505.133271-10-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HRmNf000460
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 09/11] dm-zoned: add metadata logging functions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the metadata label for logging and not the underlying
device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 89 +++++++++++++++++++++-------------
 drivers/md/dm-zoned-target.c   |  3 +-
 2 files changed, 56 insertions(+), 36 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 08707c886ca2..6c52cbf290d5 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -194,6 +194,17 @@ struct dmz_metadata {
 	wait_queue_head_t	free_wq;
 };
 
+#define dmz_zmd_info(zmd, format, args...)	\
+	DMINFO("(%s): " format, (zmd)->devname, ## args)
+
+#define dmz_zmd_err(zmd, format, args...)	\
+	DMERR("(%s): " format, (zmd)->devname, ## args)
+
+#define dmz_zmd_warn(zmd, format, args...)	\
+	DMWARN("(%s): " format, (zmd)->devname, ## args)
+
+#define dmz_zmd_debug(zmd, format, args...)	\
+	DMDEBUG("(%s): " format, (zmd)->devname, ## args)
 /*
  * Various accessors
  */
@@ -1098,7 +1109,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 	int ret;
 
 	if (!zmd->sb[0].zone) {
-		dmz_dev_err(zmd->dev, "Primary super block zone not set");
+		dmz_zmd_err(zmd, "Primary super block zone not set");
 		return -ENXIO;
 	}
 
@@ -1135,7 +1146,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 
 	/* Use highest generation sb first */
 	if (!sb_good[0] && !sb_good[1]) {
-		dmz_dev_err(zmd->dev, "No valid super block found");
+		dmz_zmd_err(zmd, "No valid super block found");
 		return -EIO;
 	}
 
@@ -1248,7 +1259,7 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
  */
 static int dmz_init_zones(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = zmd->dev;
+	struct dmz_dev *dev = &zmd->dev[0];
 	int ret;
 
 	/* Init */
@@ -1268,8 +1279,8 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	if (!zmd->zones)
 		return -ENOMEM;
 
-	dmz_dev_info(dev, "Using %zu B for zone information",
-		     sizeof(struct dm_zone) * zmd->nr_zones);
+	DMINFO("(%s): Using %zu B for zone information",
+	       zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
 
 	/*
 	 * Get zone information and initialize zone descriptors.  At the same
@@ -1412,7 +1423,6 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone);
  */
 static int dmz_load_mapping(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = zmd->dev;
 	struct dm_zone *dzone, *bzone;
 	struct dmz_mblock *dmap_mblk = NULL;
 	struct dmz_map *dmap;
@@ -1445,7 +1455,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 			goto next;
 
 		if (dzone_id >= zmd->nr_zones) {
-			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
+			dmz_zmd_err(zmd, "Chunk %u mapping: invalid data zone ID %u",
 				    chunk, dzone_id);
 			return -EIO;
 		}
@@ -1466,14 +1476,14 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 			goto next;
 
 		if (bzone_id >= zmd->nr_zones) {
-			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
+			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone ID %u",
 				    chunk, bzone_id);
 			return -EIO;
 		}
 
 		bzone = dmz_get(zmd, bzone_id);
 		if (!dmz_is_rnd(bzone)) {
-			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone %u",
+			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
 				    chunk, bzone_id);
 			return -EIO;
 		}
@@ -1894,7 +1904,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		atomic_dec(&zmd->unmap_nr_seq);
 
 	if (dmz_is_offline(zone)) {
-		dmz_dev_warn(zmd->dev, "Zone %u is offline", dmz_id(zmd, zone));
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
+
+		dmz_dev_warn(dev, "Zone %u is offline", dmz_id(zmd, zone));
 		zone = NULL;
 		goto again;
 	}
@@ -2427,7 +2439,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 	while (!list_empty(&zmd->mblk_dirty_list)) {
 		mblk = list_first_entry(&zmd->mblk_dirty_list,
 					struct dmz_mblock, link);
-		dmz_dev_warn(zmd->dev, "mblock %llu still in dirty list (ref %u)",
+		dmz_zmd_warn(zmd, "mblock %llu still in dirty list (ref %u)",
 			     (u64)mblk->no, mblk->ref);
 		list_del_init(&mblk->link);
 		rb_erase(&mblk->node, &zmd->mblk_rbtree);
@@ -2445,7 +2457,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 	/* Sanity checks: the mblock rbtree should now be empty */
 	root = &zmd->mblk_rbtree;
 	rbtree_postorder_for_each_entry_safe(mblk, next, root, node) {
-		dmz_dev_warn(zmd->dev, "mblock %llu ref %u still in rbtree",
+		dmz_zmd_warn(zmd, "mblock %llu ref %u still in rbtree",
 			     (u64)mblk->no, mblk->ref);
 		mblk->ref = 0;
 		dmz_free_mblock(zmd, mblk);
@@ -2458,6 +2470,18 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 	mutex_destroy(&zmd->map_lock);
 }
 
+void dmz_print_dev(struct dmz_metadata *zmd, int num)
+{
+	struct dmz_dev *dev = &zmd->dev[num];
+
+	dmz_dev_info(dev, "Host-%s zoned block device",
+		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
+		     "aware" : "managed");
+	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
+		     (u64)dev->capacity);
+	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
+		     dev->nr_zones, (u64)zmd->zone_nr_sectors);
+}
 /*
  * Initialize the zoned metadata.
  */
@@ -2535,34 +2559,31 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
 	/* Metadata cache shrinker */
 	ret = register_shrinker(&zmd->mblk_shrinker);
 	if (ret) {
-		dmz_dev_err(dev, "Register metadata cache shrinker failed");
+		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
 		goto err;
 	}
 
-	dmz_dev_info(dev, "Host-%s zoned block device",
-		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
-		     "aware" : "managed");
-	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
-		     (u64)dev->capacity);
-	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
+	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", DMZ_META_VER);
+	dmz_print_dev(zmd, 0);
+
+	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
 		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
-	dmz_dev_info(dev, "  %u metadata zones",
+	dmz_zmd_info(zmd, "  %u metadata zones",
 		     zmd->nr_meta_zones * 2);
-	dmz_dev_info(dev, "  %u data zones for %u chunks",
+	dmz_zmd_info(zmd, "  %u data zones for %u chunks",
 		     zmd->nr_data_zones, zmd->nr_chunks);
-	dmz_dev_info(dev, "    %u random zones (%u unmapped)",
+	dmz_zmd_info(zmd, "    %u random zones (%u unmapped)",
 		     zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
-	dmz_dev_info(dev, "    %u sequential zones (%u unmapped)",
+	dmz_zmd_info(zmd, "    %u sequential zones (%u unmapped)",
 		     zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
-	dmz_dev_info(dev, "  %u reserved sequential data zones",
+	dmz_zmd_info(zmd, "  %u reserved sequential data zones",
 		     zmd->nr_reserved_seq);
-
-	dmz_dev_debug(dev, "Format:");
-	dmz_dev_debug(dev, "%u metadata blocks per set (%u max cache)",
+	dmz_zmd_debug(zmd, "Format:");
+	dmz_zmd_debug(zmd, "%u metadata blocks per set (%u max cache)",
 		      zmd->nr_meta_blocks, zmd->max_nr_mblks);
-	dmz_dev_debug(dev, "  %u data zone mapping blocks",
+	dmz_zmd_debug(zmd, "  %u data zone mapping blocks",
 		      zmd->nr_map_blocks);
-	dmz_dev_debug(dev, "  %u bitmap blocks",
+	dmz_zmd_debug(zmd, "  %u bitmap blocks",
 		      zmd->nr_bitmap_blocks);
 
 	*metadata = zmd;
@@ -2591,7 +2612,6 @@ void dmz_dtr_metadata(struct dmz_metadata *zmd)
  */
 int dmz_resume_metadata(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = zmd->dev;
 	struct dm_zone *zone;
 	sector_t wp_block;
 	unsigned int i;
@@ -2601,20 +2621,19 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
 	for (i = 0; i < zmd->nr_zones; i++) {
 		zone = dmz_get(zmd, i);
 		if (!zone) {
-			dmz_dev_err(dev, "Unable to get zone %u", i);
+			dmz_zmd_err(zmd, "Unable to get zone %u", i);
 			return -EIO;
 		}
-
 		wp_block = zone->wp_block;
 
 		ret = dmz_update_zone(zmd, zone);
 		if (ret) {
-			dmz_dev_err(dev, "Broken zone %u", i);
+			dmz_zmd_err(zmd, "Broken zone %u", i);
 			return ret;
 		}
 
 		if (dmz_is_offline(zone)) {
-			dmz_dev_warn(dev, "Zone %u is offline", i);
+			dmz_zmd_warn(zmd, "Zone %u is offline", i);
 			continue;
 		}
 
@@ -2622,7 +2641,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
 		if (!dmz_is_seq(zone))
 			zone->wp_block = 0;
 		else if (zone->wp_block != wp_block) {
-			dmz_dev_err(dev, "Zone %u: Invalid wp (%llu / %llu)",
+			dmz_zmd_err(zmd, "Zone %u: Invalid wp (%llu / %llu)",
 				    i, (u64)zone->wp_block, (u64)wp_block);
 			zone->wp_block = wp_block;
 			dmz_invalidate_blocks(zmd, zone, zone->wp_block,
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 8ed6d9f2df25..ccf90608f434 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -519,7 +519,8 @@ static void dmz_flush_work(struct work_struct *work)
 	/* Flush dirty metadata blocks */
 	ret = dmz_flush_metadata(dmz->metadata);
 	if (ret)
-		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
+		DMDEBUG("(%s): Metadata flush failed, rc=%d\n",
+			dmz_metadata_label(dmz->metadata), ret);
 
 	/* Process queued flush requests */
 	while (1) {
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

