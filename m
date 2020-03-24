Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9A2192236
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m5LMmN9tB472K5vR2Myys7J3uSDzKIuTUoQ6E/s2Cv8=;
	b=C1RqVkPYNwNufVPZ+9qopu21UovYB0mp7bR3ItVu95Ml0f4X3ysc19F0Dff4Vqe2cINNui
	simra/gEiDPl4IPX+TvRJIr0/AmZNMTDhTCK4rTXOgH1VzQRhN+P30sIdXiNxbi9jsS3q2
	JhNH+Y0G6D1ICk9JCUgsI2t0ytGr5Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-S4OMNxoQOeeaok6LxLRE8g-1; Wed, 25 Mar 2020 04:13:29 -0400
X-MC-Unique: S4OMNxoQOeeaok6LxLRE8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4DC0801E6C;
	Wed, 25 Mar 2020 08:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B783FA7F3;
	Wed, 25 Mar 2020 08:13:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4391F86396;
	Wed, 25 Mar 2020 08:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OB3tQG008824 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 07:03:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E783D10ABC88; Tue, 24 Mar 2020 11:03:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E37D310ABC87
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C69F28007D2
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:54 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-210-PgFkKpQxP92R65zeFYAyng-1; Tue, 24 Mar 2020 07:03:52 -0400
X-MC-Unique: PgFkKpQxP92R65zeFYAyng-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OArOSt146740; Tue, 24 Mar 2020 11:03:51 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2ywabr3mqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OAq6Kr095186; Tue, 24 Mar 2020 11:03:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2yyd9vtjq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:50 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02OB3nhH026014;
	Tue, 24 Mar 2020 11:03:49 GMT
Received: from localhost.localdomain (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 24 Mar 2020 04:03:48 -0700
From: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
Date: Tue, 24 Mar 2020 19:02:55 +0800
Message-Id: <20200324110255.8385-4-bob.liu@oracle.com>
In-Reply-To: <20200324110255.8385-1-bob.liu@oracle.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0 suspectscore=1
	mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
	clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
	impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02OB3tQG008824
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com,
	Bob Liu <bob.liu@oracle.com>
Subject: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info to
	metadata
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

This patch implemented metadata support for regular device by:
 - Emulated zone information for regular device.
 - Store metadata at the beginning of regular device.

     | --- zoned device --- | -- regular device ||
     ^                      ^
     |                      |Metadata
zone 0

Signed-off-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++++++----------
 drivers/md/dm-zoned-target.c   |   6 +-
 drivers/md/dm-zoned.h          |   3 +-
 3 files changed, 108 insertions(+), 36 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index e0e8be0..a96158a 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -131,6 +131,7 @@ struct dmz_sb {
  */
 struct dmz_metadata {
 	struct dmz_dev		*zoned_dev;
+	struct dmz_dev		*regu_dmz_dev;
 
 	sector_t		zone_bitmap_size;
 	unsigned int		zone_nr_bitmap_blocks;
@@ -187,6 +188,15 @@ struct dmz_metadata {
 /*
  * Various accessors
  */
+static inline struct dmz_dev *zmd_mdev(struct dmz_metadata *zmd)
+{
+	/* Metadata always stores in regular device if there is. */
+	if (zmd->regu_dmz_dev)
+		return zmd->regu_dmz_dev;
+	else
+		return zmd->zoned_dev;
+}
+
 unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
 	return ((unsigned int)(zone - zmd->zones));
@@ -194,12 +204,33 @@ unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
 
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_sectors_shift;
+	int dmz_real_id;
+
+	dmz_real_id = dmz_id(zmd, zone);
+	if (dmz_real_id >= zmd->zoned_dev->nr_zones) {
+		/* Regular dev. */
+		dmz_real_id -= zmd->zoned_dev->nr_zones;
+		WARN_ON(!zmd->regu_dmz_dev);
+
+		return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_sectors_shift;
+	}
+	return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_sectors_shift;
 }
 
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_blocks_shift;
+	int dmz_real_id;
+
+	dmz_real_id = dmz_id(zmd, zone);
+	if (dmz_real_id >= zmd->zoned_dev->nr_zones) {
+		/* Regular dev. */
+		dmz_real_id -= zmd->zoned_dev->nr_zones;
+		WARN_ON(!zmd->regu_dmz_dev);
+
+		return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_blocks_shift;
+	}
+
+	return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_blocks_shift;
 }
 
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
@@ -403,8 +434,10 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	struct dmz_mblock *mblk, *m;
 	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
 	struct bio *bio;
+	struct dmz_dev *mdev;
 
-	if (dmz_bdev_is_dying(zmd->zoned_dev))
+	mdev = zmd_mdev(zmd);
+	if (dmz_bdev_is_dying(mdev))
 		return ERR_PTR(-EIO);
 
 	/* Get a new block and a BIO to read it */
@@ -440,7 +473,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 
 	/* Submit read BIO */
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->zoned_dev->bdev);
+	bio_set_dev(bio, mdev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
@@ -555,7 +588,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
 		       TASK_UNINTERRUPTIBLE);
 	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 		dmz_release_mblock(zmd, mblk);
-		dmz_check_bdev(zmd->zoned_dev);
+		dmz_check_bdev(zmd_mdev(zmd));
 		return ERR_PTR(-EIO);
 	}
 
@@ -581,8 +614,10 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 {
 	sector_t block = zmd->sb[set].block + mblk->no;
 	struct bio *bio;
+	struct dmz_dev *mdev;
 
-	if (dmz_bdev_is_dying(zmd->zoned_dev))
+	mdev = zmd_mdev(zmd);
+	if (dmz_bdev_is_dying(mdev))
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
@@ -594,7 +629,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->zoned_dev->bdev);
+	bio_set_dev(bio, mdev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
 	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
@@ -612,8 +647,10 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
 {
 	struct bio *bio;
 	int ret;
+	struct dmz_dev *mdev;
 
-	if (dmz_bdev_is_dying(zmd->zoned_dev))
+	mdev = zmd_mdev(zmd);
+	if (dmz_bdev_is_dying(mdev))
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
@@ -621,14 +658,14 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
 		return -ENOMEM;
 
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->zoned_dev->bdev);
+	bio_set_dev(bio, mdev->bdev);
 	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
 
 	if (ret)
-		dmz_check_bdev(zmd->zoned_dev);
+		dmz_check_bdev(mdev);
 	return ret;
 }
 
@@ -661,7 +698,7 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 
 	ret = dmz_rdwr_block(zmd, REQ_OP_WRITE, block, mblk->page);
 	if (ret == 0)
-		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
+		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
 
 	return ret;
 }
@@ -695,15 +732,20 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 			       TASK_UNINTERRUPTIBLE);
 		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 			clear_bit(DMZ_META_ERROR, &mblk->state);
-			dmz_check_bdev(zmd->zoned_dev);
+			dmz_check_bdev(zmd_mdev(zmd));
 			ret = -EIO;
 		}
 		nr_mblks_submitted--;
 	}
 
 	/* Flush drive cache (this will also sync data) */
-	if (ret == 0)
-		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
+	if (ret == 0) {
+		/* Flush metadata device */
+		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
+		if ((ret == 0) && zmd->regu_dmz_dev)
+			/* Flush data device. */
+			ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
+	}
 
 	return ret;
 }
@@ -760,7 +802,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 */
 	dmz_lock_flush(zmd);
 
-	if (dmz_bdev_is_dying(zmd->zoned_dev)) {
+	if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
 		ret = -EIO;
 		goto out;
 	}
@@ -772,7 +814,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 
 	/* If there are no dirty metadata blocks, just flush the device cache */
 	if (list_empty(&write_list)) {
-		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
+		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
 		goto err;
 	}
 
@@ -821,7 +863,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 		list_splice(&write_list, &zmd->mblk_dirty_list);
 		spin_unlock(&zmd->mblk_lock);
 	}
-	if (!dmz_check_bdev(zmd->zoned_dev))
+	if (!dmz_check_bdev(zmd_mdev(zmd)))
 		ret = -EIO;
 	goto out;
 }
@@ -832,10 +874,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
 {
 	unsigned int nr_meta_zones, nr_data_zones;
-	struct dmz_dev *dev = zmd->zoned_dev;
+	struct dmz_dev *dev;
 	u32 crc, stored_crc;
 	u64 gen;
 
+	dev = zmd_mdev(zmd);
 	gen = le64_to_cpu(sb->gen);
 	stored_crc = le32_to_cpu(sb->crc);
 	sb->crc = 0;
@@ -1131,8 +1174,11 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 		zmd->nr_useable_zones++;
 		if (dmz_is_rnd(zone)) {
 			zmd->nr_rnd_zones++;
-			if (!zmd->sb_zone) {
-				/* Super block zone */
+			if (!zmd->sb_zone && !zmd->regu_dmz_dev) {
+				/*
+				 * Super block zone goes to regular
+				 * device by default.
+				 */
 				zmd->sb_zone = zone;
 			}
 		}
@@ -1157,7 +1203,8 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
 static int dmz_init_zones(struct dmz_metadata *zmd)
 {
 	struct dmz_dev *dev = zmd->zoned_dev;
-	int ret;
+	int ret, i;
+	unsigned int total_nr_zones;
 
 	/* Init */
 	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
@@ -1167,7 +1214,10 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 					DMZ_BLOCK_SIZE_BITS);
 
 	/* Allocate zone array */
-	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
+	total_nr_zones = dev->nr_zones;
+	if (zmd->regu_dmz_dev)
+		total_nr_zones += zmd->regu_dmz_dev->nr_zones;
+	zmd->zones = kcalloc(total_nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
 	if (!zmd->zones)
 		return -ENOMEM;
 
@@ -1186,6 +1236,25 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 		return ret;
 	}
 
+	if (zmd->regu_dmz_dev) {
+		/* Emulate zone information for regular device zone. */
+		for (i = 0; i < zmd->regu_dmz_dev->nr_zones; i++) {
+			struct dm_zone *zone = &zmd->zones[i + dev->nr_zones];
+
+			INIT_LIST_HEAD(&zone->link);
+			atomic_set(&zone->refcount, 0);
+			zone->chunk = DMZ_MAP_UNMAPPED;
+
+			set_bit(DMZ_RND, &zone->flags);
+			zmd->nr_rnd_zones++;
+			zmd->nr_useable_zones++;
+			zone->wp_block = 0;
+			if (!zmd->sb_zone)
+				/* Super block zone */
+				zmd->sb_zone = zone;
+		}
+	}
+
 	return 0;
 }
 
@@ -1313,13 +1382,13 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone);
  */
 static int dmz_load_mapping(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = zmd->zoned_dev;
 	struct dm_zone *dzone, *bzone;
 	struct dmz_mblock *dmap_mblk = NULL;
 	struct dmz_map *dmap;
 	unsigned int i = 0, e = 0, chunk = 0;
 	unsigned int dzone_id;
 	unsigned int bzone_id;
+	struct dmz_dev *dev = zmd_mdev(zmd);
 
 	/* Metadata block array for the chunk mapping table */
 	zmd->map_mblk = kcalloc(zmd->nr_map_blocks,
@@ -1345,7 +1414,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dzone_id == DMZ_MAP_UNMAPPED)
 			goto next;
 
-		if (dzone_id >= dev->nr_zones) {
+		if (dzone_id >= dev->target->nr_zones) {
 			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
 				    chunk, dzone_id);
 			return -EIO;
@@ -1366,7 +1435,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (bzone_id == DMZ_MAP_UNMAPPED)
 			goto next;
 
-		if (bzone_id >= dev->nr_zones) {
+		if (bzone_id >= dev->target->nr_zones) {
 			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
 				    chunk, bzone_id);
 			return -EIO;
@@ -1398,7 +1467,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 	 * fully initialized. All remaining zones are unmapped data
 	 * zones. Finish initializing those here.
 	 */
-	for (i = 0; i < dev->nr_zones; i++) {
+	for (i = 0; i < dev->target->nr_zones; i++) {
 		dzone = dmz_get(zmd, i);
 		if (dmz_is_meta(dzone))
 			continue;
@@ -1632,7 +1701,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 		/* Allocate a random zone */
 		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 		if (!dzone) {
-			if (dmz_bdev_is_dying(zmd->zoned_dev)) {
+			if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
 				dzone = ERR_PTR(-EIO);
 				goto out;
 			}
@@ -1733,7 +1802,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	/* Allocate a random zone */
 	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 	if (!bzone) {
-		if (dmz_bdev_is_dying(zmd->zoned_dev)) {
+		if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
 			bzone = ERR_PTR(-EIO);
 			goto out;
 		}
@@ -2360,7 +2429,8 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 /*
  * Initialize the zoned metadata.
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
+int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_dev *regu_dmz_dev,
+		struct dmz_metadata **metadata)
 {
 	struct dmz_metadata *zmd;
 	unsigned int i, zid;
@@ -2372,6 +2442,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		return -ENOMEM;
 
 	zmd->zoned_dev = dev;
+	zmd->regu_dmz_dev = regu_dmz_dev;
 	zmd->mblk_rbtree = RB_ROOT;
 	init_rwsem(&zmd->mblk_sem);
 	mutex_init(&zmd->mblk_flush_lock);
@@ -2440,9 +2511,9 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
 		     "aware" : "managed");
 	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
-		     (u64)dev->capacity);
+		     (u64)dev->capacity  + (u64)regu_dmz_dev->capacity);
 	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
-		     dev->nr_zones, (u64)dev->zone_nr_sectors);
+		     dev->nr_zones + regu_dmz_dev->nr_zones, (u64)dev->zone_nr_sectors);
 	dmz_dev_info(dev, "  %u metadata zones",
 		     zmd->nr_meta_zones * 2);
 	dmz_dev_info(dev, "  %u data zones for %u chunks",
@@ -2488,7 +2559,7 @@ void dmz_dtr_metadata(struct dmz_metadata *zmd)
  */
 int dmz_resume_metadata(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = zmd->zoned_dev;
+	struct dmz_dev *dev = zmd_mdev(zmd);
 	struct dm_zone *zone;
 	sector_t wp_block;
 	unsigned int i;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index cae4bfe..41dbb9d 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -803,7 +803,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	/* Initialize metadata */
 	dev = dmz->zoned_dev;
-	ret = dmz_ctr_metadata(dev, &dmz->metadata);
+	ret = dmz_ctr_metadata(dev, dmz->regu_dmz_dev, &dmz->metadata);
 	if (ret) {
 		ti->error = "Metadata initialization failed";
 		goto err_dev;
@@ -852,8 +852,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
 
-	/* Initialize reclaim */
-	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
+	/* Initialize reclaim, only reclaim from regular device. */
+	ret = dmz_ctr_reclaim(dmz->regu_dmz_dev, dmz->metadata, &dmz->reclaim);
 	if (ret) {
 		ti->error = "Zone reclaim initialization failed";
 		goto err_fwq;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index a3535bc..7aa1a30 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -206,7 +206,8 @@ struct dmz_reclaim;
 /*
  * Functions defined in dm-zoned-metadata.c
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd);
+int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_dev *regu_dmz_dev,
+		struct dmz_metadata **zmd);
 void dmz_dtr_metadata(struct dmz_metadata *zmd);
 int dmz_resume_metadata(struct dmz_metadata *zmd);
 
-- 
2.9.5


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

