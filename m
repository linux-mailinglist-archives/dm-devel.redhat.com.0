Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0495E19FB7B
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GO5kDOyrVWAozCecygXL3zyIFcODAsiXmvzgy/QSD1o=;
	b=NqpmnDyjzMaUzpnrySO5xy5yPqsqckoFSuLJJckqHrDR6xohc35Jv2eRF/RQCKF5hgCsas
	VS9MD9JuP3XbUAC0L+XVOZnSH6iboKewMuuXOQpzqTcDtz+HywAHhF9DNxSzVomezaM5gp
	3sZ1YQOnt9RtqnGOW7WJ/zeDkQjaZcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-3Jo2b3S3MUeH9CEvFa3AtA-1; Mon, 06 Apr 2020 13:27:54 -0400
X-MC-Unique: 3Jo2b3S3MUeH9CEvFa3AtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8045B107ACCC;
	Mon,  6 Apr 2020 17:27:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51EB9BEA65;
	Mon,  6 Apr 2020 17:27:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E420118089CD;
	Mon,  6 Apr 2020 17:27:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HRiKV000449 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:27:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A39CC612E; Mon,  6 Apr 2020 17:27:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 066FDC613F
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 425238FF67A
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-196-Fz6a3i-_Pgi4861gvY6HPw-1;
	Mon, 06 Apr 2020 13:27:36 -0400
X-MC-Unique: Fz6a3i-_Pgi4861gvY6HPw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 93260BD5E;
	Mon,  6 Apr 2020 17:27:33 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:34:57 +0200
Message-Id: <20200406143505.133271-4-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HRiKV000449
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 03/11] dm-zoned: store device in struct dmz_sb
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

Store the device together with the superblock so that
we don't have to recur to the metadata to find it.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 90 ++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 31 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b37d3faec518..731aa4c99373 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -122,6 +122,7 @@ enum {
  */
 struct dmz_sb {
 	sector_t		block;
+	struct dmz_dev		*dev;
 	struct dmz_mblock	*mblk;
 	struct dmz_super	*sb;
 	struct dm_zone		*zone;
@@ -202,6 +203,11 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
 }
 
+struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
+{
+	return &zmd->dev[0];
+}
+
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
 {
 	return zmd->dev->nr_zones;
@@ -417,9 +423,10 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 {
 	struct dmz_mblock *mblk, *m;
 	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
+	struct dmz_dev *dev = zmd->sb[zmd->mblk_primary].dev;
 	struct bio *bio;
 
-	if (dmz_bdev_is_dying(zmd->dev))
+	if (dmz_bdev_is_dying(dev))
 		return ERR_PTR(-EIO);
 
 	/* Get a new block and a BIO to read it */
@@ -455,7 +462,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 
 	/* Submit read BIO */
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->dev->bdev);
+	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
@@ -552,6 +559,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
 					 sector_t mblk_no)
 {
 	struct dmz_mblock *mblk;
+	struct dmz_dev *dev = zmd->sb[zmd->mblk_primary].dev;
 
 	/* Check rbtree */
 	spin_lock(&zmd->mblk_lock);
@@ -570,7 +578,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
 		       TASK_UNINTERRUPTIBLE);
 	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 		dmz_release_mblock(zmd, mblk);
-		dmz_check_bdev(zmd->dev);
+		dmz_check_bdev(dev);
 		return ERR_PTR(-EIO);
 	}
 
@@ -594,10 +602,11 @@ static void dmz_dirty_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk)
 static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 			    unsigned int set)
 {
+	struct dmz_dev *dev = zmd->sb[set].dev;
 	sector_t block = zmd->sb[set].block + mblk->no;
 	struct bio *bio;
 
-	if (dmz_bdev_is_dying(zmd->dev))
+	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
@@ -609,7 +618,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 	set_bit(DMZ_META_WRITING, &mblk->state);
 
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->dev->bdev);
+	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
 	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
@@ -622,13 +631,13 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 /*
  * Read/write a metadata block.
  */
-static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
-			  struct page *page)
+static int dmz_rdwr_block(struct dmz_dev *dev, int op,
+			  sector_t block, struct page *page)
 {
 	struct bio *bio;
 	int ret;
 
-	if (dmz_bdev_is_dying(zmd->dev))
+	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
 	bio = bio_alloc(GFP_NOIO, 1);
@@ -636,14 +645,14 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
 		return -ENOMEM;
 
 	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, zmd->dev->bdev);
+	bio_set_dev(bio, dev->bdev);
 	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
 
 	if (ret)
-		dmz_check_bdev(zmd->dev);
+		dmz_check_bdev(dev);
 	return ret;
 }
 
@@ -655,6 +664,7 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 	sector_t block = zmd->sb[set].block;
 	struct dmz_mblock *mblk = zmd->sb[set].mblk;
 	struct dmz_super *sb = zmd->sb[set].sb;
+	struct dmz_dev *dev = zmd->sb[set].dev;
 	u64 sb_gen = zmd->sb_gen + 1;
 	int ret;
 
@@ -674,9 +684,9 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 	sb->crc = 0;
 	sb->crc = cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb, DMZ_BLOCK_SIZE));
 
-	ret = dmz_rdwr_block(zmd, REQ_OP_WRITE, block, mblk->page);
+	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, block, mblk->page);
 	if (ret == 0)
-		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
+		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
 
 	return ret;
 }
@@ -689,6 +699,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 				   unsigned int set)
 {
 	struct dmz_mblock *mblk;
+	struct dmz_dev *dev = zmd->sb[set].dev;
 	struct blk_plug plug;
 	int ret = 0, nr_mblks_submitted = 0;
 
@@ -710,7 +721,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 			       TASK_UNINTERRUPTIBLE);
 		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 			clear_bit(DMZ_META_ERROR, &mblk->state);
-			dmz_check_bdev(zmd->dev);
+			dmz_check_bdev(dev);
 			ret = -EIO;
 		}
 		nr_mblks_submitted--;
@@ -718,7 +729,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 
 	/* Flush drive cache (this will also sync data) */
 	if (ret == 0)
-		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
+		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
 
 	return ret;
 }
@@ -755,6 +766,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 {
 	struct dmz_mblock *mblk;
 	struct list_head write_list;
+	struct dmz_dev *dev;
 	int ret;
 
 	if (WARN_ON(!zmd))
@@ -768,6 +780,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 * from modifying metadata.
 	 */
 	down_write(&zmd->mblk_sem);
+	dev = zmd->sb[zmd->mblk_primary].dev;
 
 	/*
 	 * This is called from the target flush work and reclaim work.
@@ -775,7 +788,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 */
 	dmz_lock_flush(zmd);
 
-	if (dmz_bdev_is_dying(zmd->dev)) {
+	if (dmz_bdev_is_dying(dev)) {
 		ret = -EIO;
 		goto out;
 	}
@@ -787,7 +800,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 
 	/* If there are no dirty metadata blocks, just flush the device cache */
 	if (list_empty(&write_list)) {
-		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
+		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
 		goto err;
 	}
 
@@ -836,7 +849,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 		list_splice(&write_list, &zmd->mblk_dirty_list);
 		spin_unlock(&zmd->mblk_lock);
 	}
-	if (!dmz_check_bdev(zmd->dev))
+	if (!dmz_check_bdev(dev))
 		ret = -EIO;
 	goto out;
 }
@@ -847,8 +860,8 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 {
 	struct dmz_super *sb = zmd->sb[set].sb;
+	struct dmz_dev *dev = zmd->sb[set].dev;
 	unsigned int nr_meta_zones, nr_data_zones;
-	struct dmz_dev *dev = zmd->dev;
 	u32 crc, stored_crc;
 	u64 gen;
 
@@ -913,8 +926,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
  */
 static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
 {
-	return dmz_rdwr_block(zmd, REQ_OP_READ, zmd->sb[set].block,
-			      zmd->sb[set].mblk->page);
+	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
+			      zmd->sb[set].block, zmd->sb[set].mblk->page);
 }
 
 /*
@@ -939,6 +952,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 	/* Bad first super block: search for the second one */
 	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
 	zmd->sb[1].zone = zmd->sb[0].zone + 1;
+	zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
 	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
 		if (dmz_read_sb(zmd, 1) != 0)
 			break;
@@ -947,11 +961,13 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 			return 0;
 		}
 		zmd->sb[1].block += zone_nr_blocks;
+		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone + i);
 	}
 
 	dmz_free_mblock(zmd, mblk);
 	zmd->sb[1].mblk = NULL;
 	zmd->sb[1].zone = NULL;
+	zmd->sb[1].dev = NULL;
 
 	return -EIO;
 }
@@ -992,7 +1008,8 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
 	struct page *page;
 	int i, ret;
 
-	dmz_dev_warn(zmd->dev, "Metadata set %u invalid: recovering", dst_set);
+	dmz_dev_warn(zmd->sb[dst_set].dev,
+		     "Metadata set %u invalid: recovering", dst_set);
 
 	if (dst_set == 0)
 		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
@@ -1005,11 +1022,11 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
 
 	/* Copy metadata blocks */
 	for (i = 1; i < zmd->nr_meta_blocks; i++) {
-		ret = dmz_rdwr_block(zmd, REQ_OP_READ,
+		ret = dmz_rdwr_block(zmd->sb[src_set].dev, REQ_OP_READ,
 				     zmd->sb[src_set].block + i, page);
 		if (ret)
 			goto out;
-		ret = dmz_rdwr_block(zmd, REQ_OP_WRITE,
+		ret = dmz_rdwr_block(zmd->sb[dst_set].dev, REQ_OP_WRITE,
 				     zmd->sb[dst_set].block + i, page);
 		if (ret)
 			goto out;
@@ -1048,9 +1065,10 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 
 	/* Read and check the primary super block */
 	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
+	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
 	ret = dmz_get_sb(zmd, 0);
 	if (ret) {
-		dmz_dev_err(zmd->dev, "Read primary super block failed");
+		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
 		return ret;
 	}
 
@@ -1062,12 +1080,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		if (!zmd->sb[1].zone)
 			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
 		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
+		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
 		ret = dmz_get_sb(zmd, 1);
 	} else
 		ret = dmz_lookup_secondary_sb(zmd);
 
 	if (ret) {
-		dmz_dev_err(zmd->dev, "Read secondary super block failed");
+		dmz_dev_err(zmd->sb[1].dev, "Read secondary super block failed");
 		return ret;
 	}
 
@@ -1083,17 +1102,25 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 
 	if (sb_good[0])
 		sb_gen[0] = le64_to_cpu(zmd->sb[0].sb->gen);
-	else
+	else {
 		ret = dmz_recover_mblocks(zmd, 0);
+		if (ret) {
+			dmz_dev_err(zmd->sb[0].dev,
+				    "Recovery of superblock 0 failed");
+			return -EIO;
+		}
+	}
 
 	if (sb_good[1])
 		sb_gen[1] = le64_to_cpu(zmd->sb[1].sb->gen);
-	else
+	else {
 		ret = dmz_recover_mblocks(zmd, 1);
 
-	if (ret) {
-		dmz_dev_err(zmd->dev, "Recovery failed");
-		return -EIO;
+		if (ret) {
+			dmz_dev_err(zmd->sb[1].dev,
+				    "Recovery of superblock 1 failed");
+			return -EIO;
+		}
 	}
 
 	if (sb_gen[0] >= sb_gen[1]) {
@@ -1104,7 +1131,8 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		zmd->mblk_primary = 1;
 	}
 
-	dmz_dev_debug(zmd->dev, "Using super block %u (gen %llu)",
+	dmz_dev_debug(zmd->sb[zmd->mblk_primary].dev,
+		      "Using super block %u (gen %llu)",
 		      zmd->mblk_primary, zmd->sb_gen);
 
 	return 0;
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

