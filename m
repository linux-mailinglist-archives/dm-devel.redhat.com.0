Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84F551E8529
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 19:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590773989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AglHEGgtYIyloilETW7od/j+aitTFLqrCSVD0Rss0DQ=;
	b=Kgeqy7XiSx8xkR7ueJM01xVoRWCp9lBl73z6FvEsyFO3oJydaOcI/GAOy0wb7WL1k0wV1M
	1I+aeK6equPbcND8XZHNzAmaO7SaGnXYVsuVYhkGqdw+GVtcKZSYMoa/707iaBmWha4Ivy
	6JaPz2KochrhLeiHtBd2/V3GHDCINMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-H2IQHZEJNa2jmBsJhQfWww-1; Fri, 29 May 2020 13:39:47 -0400
X-MC-Unique: H2IQHZEJNa2jmBsJhQfWww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79F11855A0E;
	Fri, 29 May 2020 17:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91684707A0;
	Fri, 29 May 2020 17:39:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44E1A6EF5F;
	Fri, 29 May 2020 17:39:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04THdPA8004841 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 13:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DA31202696C; Fri, 29 May 2020 17:39:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BE82029F62
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C99EB8007DC
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-248-J8rnW_LmPI6e61yv40_rOg-1;
	Fri, 29 May 2020 13:39:19 -0400
X-MC-Unique: J8rnW_LmPI6e61yv40_rOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B1C22B1AB;
	Fri, 29 May 2020 17:39:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 29 May 2020 19:38:59 +0200
Message-Id: <20200529173907.40529-7-hare@suse.de>
In-Reply-To: <20200529173907.40529-1-hare@suse.de>
References: <20200529173907.40529-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 06/14] dm-zoned: temporary superblock for
	tertiary devices
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

Checking the tertiary superblock just consists of validating UUIDs,
crcs, and the generation number; it doesn't have contents which
would be required during the actual operation.
So we should be allocating a temporary superblock when checking
tertiary devices and avoid having to store it together with the
'real' superblocks.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 109 +++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 839f9078806d..d9f3ecc76eff 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -174,7 +174,7 @@ struct dmz_metadata {
 	/* Zone information array */
 	struct xarray		zones;
 
-	struct dmz_sb		sb[3];
+	struct dmz_sb		sb[2];
 	unsigned int		mblk_primary;
 	unsigned int		sb_version;
 	u64			sb_gen;
@@ -1014,10 +1014,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 /*
  * Check super block.
  */
-static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
+static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
+			bool tertiary)
 {
-	struct dmz_super *sb = zmd->sb[set].sb;
-	struct dmz_dev *dev = zmd->sb[set].dev;
+	struct dmz_super *sb = dsb->sb;
+	struct dmz_dev *dev = dsb->dev;
 	unsigned int nr_meta_zones, nr_data_zones;
 	u32 crc, stored_crc;
 	u64 gen;
@@ -1034,7 +1035,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 			    DMZ_META_VER, zmd->sb_version);
 		return -EINVAL;
 	}
-	if ((zmd->sb_version < 1) && (set == 2)) {
+	if (zmd->sb_version < 2 && tertiary) {
 		dmz_dev_err(dev, "Tertiary superblocks are not supported");
 		return -EINVAL;
 	}
@@ -1078,7 +1079,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 			return -ENXIO;
 		}
 
-		if (set == 2) {
+		if (tertiary) {
 			/*
 			 * Generation number should be 0, but it doesn't
 			 * really matter if it isn't.
@@ -1127,14 +1128,13 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 /*
  * Read the first or second super block from disk.
  */
-static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
+static int dmz_read_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
 {
 	dmz_zmd_debug(zmd, "read superblock set %d dev %s block %llu",
-		      set, zmd->sb[set].dev->name,
-		      zmd->sb[set].block);
+		      set, sb->dev->name, sb->block);
 
-	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
-			      zmd->sb[set].block, zmd->sb[set].mblk->page);
+	return dmz_rdwr_block(sb->dev, REQ_OP_READ,
+			      sb->block, sb->mblk->page);
 }
 
 /*
@@ -1162,7 +1162,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 	zmd->sb[1].zone = dmz_get(zmd, zone_id + 1);
 	zmd->sb[1].dev = zmd->sb[0].dev;
 	for (i = 1; i < zmd->nr_rnd_zones; i++) {
-		if (dmz_read_sb(zmd, 1) != 0)
+		if (dmz_read_sb(zmd, &zmd->sb[1], 1) != 0)
 			break;
 		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
 			return 0;
@@ -1179,9 +1179,9 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 }
 
 /*
- * Read the first or second super block from disk.
+ * Read a super block from disk.
  */
-static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
+static int dmz_get_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
 {
 	struct dmz_mblock *mblk;
 	int ret;
@@ -1191,14 +1191,14 @@ static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
 	if (!mblk)
 		return -ENOMEM;
 
-	zmd->sb[set].mblk = mblk;
-	zmd->sb[set].sb = mblk->data;
+	sb->mblk = mblk;
+	sb->sb = mblk->data;
 
 	/* Read super block */
-	ret = dmz_read_sb(zmd, set);
+	ret = dmz_read_sb(zmd, sb, set);
 	if (ret) {
 		dmz_free_mblock(zmd, mblk);
-		zmd->sb[set].mblk = NULL;
+		sb->mblk = NULL;
 		return ret;
 	}
 
@@ -1272,13 +1272,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 	/* Read and check the primary super block */
 	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
 	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
-	ret = dmz_get_sb(zmd, 0);
+	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
 	if (ret) {
 		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
 		return ret;
 	}
 
-	ret = dmz_check_sb(zmd, 0);
+	ret = dmz_check_sb(zmd, &zmd->sb[0], false);
 
 	/* Read and check secondary super block */
 	if (ret == 0) {
@@ -1291,7 +1291,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		}
 		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
 		zmd->sb[1].dev = zmd->sb[0].dev;
-		ret = dmz_get_sb(zmd, 1);
+		ret = dmz_get_sb(zmd, &zmd->sb[1], 1);
 	} else
 		ret = dmz_lookup_secondary_sb(zmd);
 
@@ -1300,7 +1300,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		return ret;
 	}
 
-	ret = dmz_check_sb(zmd, 1);
+	ret = dmz_check_sb(zmd, &zmd->sb[1], false);
 	if (ret == 0)
 		sb_good[1] = true;
 
@@ -1345,20 +1345,40 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		      "Using super block %u (gen %llu)",
 		      zmd->mblk_primary, zmd->sb_gen);
 
-	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
-		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
-		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
-		ret = dmz_get_sb(zmd, 2);
-		if (ret) {
-			dmz_dev_err(zmd->sb[2].dev,
-				    "Read tertiary super block failed");
-			return ret;
+	if (zmd->sb_version > 1) {
+		int i;
+		struct dmz_sb *sb;
+
+		sb = kzalloc(sizeof(struct dmz_sb), GFP_KERNEL);
+		if (!sb)
+			return -ENOMEM;
+		for (i = 1; i < zmd->nr_devs; i++) {
+			sb->block = 0;
+			sb->zone = dmz_get(zmd, zmd->dev[i].zone_offset);
+			sb->dev = &zmd->dev[i];
+			if (!dmz_is_meta(sb->zone)) {
+				dmz_dev_err(sb->dev,
+					    "Tertiary super block zone %u not marked as metadata zone",
+					    sb->zone->id);
+				ret = -EINVAL;
+				goto out_kfree;
+			}
+			ret = dmz_get_sb(zmd, sb, i + 1);
+			if (ret) {
+				dmz_dev_err(sb->dev,
+					    "Read tertiary super block failed");
+				dmz_free_mblock(zmd, sb->mblk);
+				goto out_kfree;
+			}
+			ret = dmz_check_sb(zmd, sb, true);
+			dmz_free_mblock(zmd, sb->mblk);
+			if (ret == -EINVAL)
+				goto out_kfree;
 		}
-		ret = dmz_check_sb(zmd, 2);
-		if (ret == -EINVAL)
-			return ret;
+	out_kfree:
+		kfree(sb);
 	}
-	return 0;
+	return ret;
 }
 
 /*
@@ -1415,12 +1435,15 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 				zmd->sb[0].zone = zone;
 			}
 		}
-		if (zmd->nr_devs > 1 && !zmd->sb[2].zone) {
-			/* Tertiary superblock zone */
-			zmd->sb[2].zone = zone;
+		if (zmd->nr_devs > 1 && num == 0) {
+			/*
+			 * Tertiary superblock zones are always at the
+			 * start of the zoned devices, so mark them
+			 * as metadata zone.
+			 */
+			set_bit(DMZ_META, &zone->flags);
 		}
 	}
-
 	return 0;
 }
 
@@ -2858,16 +2881,6 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 		}
 		set_bit(DMZ_META, &zone->flags);
 	}
-	if (zmd->sb[2].zone) {
-		zone = dmz_get(zmd, zmd->sb[2].zone->id);
-		if (!zone) {
-			dmz_zmd_err(zmd,
-				    "Tertiary metadata zone not present");
-			ret = -ENXIO;
-			goto err;
-		}
-		set_bit(DMZ_META, &zone->flags);
-	}
 	/* Load mapping table */
 	ret = dmz_load_mapping(zmd);
 	if (ret)
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

