Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9879D1CA6C1
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588928672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fzszb6H+5z7sFiLuD/49PtYeIUdUr5GnJNUOAR96R1Y=;
	b=DgukKEOABswkuxZzwvMcinOJphe/ImdHw1M1HgsPu8QmCwrOGtktlNyH5qxhKoIMpbKR74
	JWf2Ph65+oMprVCrrVzkR+AwBrF7Fg04peiMnSxSOeGByYMhqi6ttu4dKf5pzz2dr7wy0/
	SE0+hWhWg2RWekllDDQj0ut1lQJmsLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-d0zo7oA8PZmPsIF2RYPIKw-1; Fri, 08 May 2020 05:04:27 -0400
X-MC-Unique: d0zo7oA8PZmPsIF2RYPIKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 167581899527;
	Fri,  8 May 2020 09:04:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC928707CA;
	Fri,  8 May 2020 09:04:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72B0E4CAAE;
	Fri,  8 May 2020 09:04:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0489436G000748 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:04:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EA5911F4B2; Fri,  8 May 2020 09:04:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3882811F4A8
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECD808995CC
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-429-S5_dKSm2Oii8ft__ZQ9WzQ-1;
	Fri, 08 May 2020 05:03:58 -0400
X-MC-Unique: S5_dKSm2Oii8ft__ZQ9WzQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9407CAE6F;
	Fri,  8 May 2020 09:03:57 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri,  8 May 2020 11:03:26 +0200
Message-Id: <20200508090332.40716-9-hare@suse.de>
In-Reply-To: <20200508090332.40716-1-hare@suse.de>
References: <20200508090332.40716-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0489436G000748
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/14] dm-zoned: remove 'dev' argument from
	reclaim
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

Use the dmz_zone_to_dev() mapping function to remove the
'dev' argument from reclaim.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-reclaim.c | 58 +++++++++++++++++++++++--------------------
 drivers/md/dm-zoned-target.c  |  2 +-
 drivers/md/dm-zoned.h         |  4 +--
 3 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 5daede0daf92..39ea0d5d4706 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -13,7 +13,6 @@
 
 struct dmz_reclaim {
 	struct dmz_metadata     *metadata;
-	struct dmz_dev		*dev;
 
 	struct delayed_work	work;
 	struct workqueue_struct *wq;
@@ -59,6 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 				sector_t block)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	sector_t wp_block = zone->wp_block;
 	unsigned int nr_blocks;
 	int ret;
@@ -74,15 +74,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 	 * pointer and the requested position.
 	 */
 	nr_blocks = block - wp_block;
-	ret = blkdev_issue_zeroout(zrc->dev->bdev,
+	ret = blkdev_issue_zeroout(dev->bdev,
 				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
 				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
 	if (ret) {
-		dmz_dev_err(zrc->dev,
+		dmz_dev_err(dev,
 			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
 			    zone->id, (unsigned long long)wp_block,
 			    (unsigned long long)block, nr_blocks, ret);
-		dmz_check_bdev(zrc->dev);
+		dmz_check_bdev(dev);
 		return ret;
 	}
 
@@ -116,7 +116,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
-	struct dmz_dev *dev = zrc->dev;
+	struct dmz_dev *src_dev, *dst_dev;
 	struct dm_io_region src, dst;
 	sector_t block = 0, end_block;
 	sector_t nr_blocks;
@@ -130,13 +130,17 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 	else
 		end_block = dmz_zone_nr_blocks(zmd);
 	src_zone_block = dmz_start_block(zmd, src_zone);
+	src_dev = dmz_zone_to_dev(zmd, src_zone);
 	dst_zone_block = dmz_start_block(zmd, dst_zone);
+	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
 
 	if (dmz_is_seq(dst_zone))
 		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
 
 	while (block < end_block) {
-		if (dev->flags & DMZ_BDEV_DYING)
+		if (src_dev->flags & DMZ_BDEV_DYING)
+			return -EIO;
+		if (dst_dev->flags & DMZ_BDEV_DYING)
 			return -EIO;
 
 		/* Get a valid region from the source zone */
@@ -156,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 				return ret;
 		}
 
-		src.bdev = dev->bdev;
+		src.bdev = src_dev->bdev;
 		src.sector = dmz_blk2sect(src_zone_block + block);
 		src.count = dmz_blk2sect(nr_blocks);
 
-		dst.bdev = dev->bdev;
+		dst.bdev = dst_dev->bdev;
 		dst.sector = dmz_blk2sect(dst_zone_block + block);
 		dst.count = src.count;
 
@@ -194,10 +198,10 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret;
 
-	dmz_dev_debug(zrc->dev,
-		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
-		      dzone->chunk, bzone->id, dmz_weight(bzone),
-		      dzone->id, dmz_weight(dzone));
+	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
+		dmz_metadata_label(zmd),
+		dzone->chunk, bzone->id, dmz_weight(bzone),
+		dzone->id, dmz_weight(dzone));
 
 	/* Flush data zone into the buffer zone */
 	ret = dmz_reclaim_copy(zrc, bzone, dzone);
@@ -233,10 +237,10 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret = 0;
 
-	dmz_dev_debug(zrc->dev,
-		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
-		      chunk, dzone->id, dmz_weight(dzone),
-		      bzone->id, dmz_weight(bzone));
+	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
+		dmz_metadata_label(zmd),
+		chunk, dzone->id, dmz_weight(dzone),
+		bzone->id, dmz_weight(bzone));
 
 	/* Flush data zone into the buffer zone */
 	ret = dmz_reclaim_copy(zrc, dzone, bzone);
@@ -285,9 +289,9 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	if (!szone)
 		return -ENOSPC;
 
-	dmz_dev_debug(zrc->dev,
-		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
-		      chunk, dzone->id, dmz_weight(dzone), szone->id);
+	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
+		dmz_metadata_label(zmd),
+		chunk, dzone->id, dmz_weight(dzone), szone->id);
 
 	/* Flush the random data zone into the sequential zone */
 	ret = dmz_reclaim_copy(zrc, dzone, szone);
@@ -343,6 +347,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	struct dmz_metadata *zmd = zrc->metadata;
 	struct dm_zone *dzone;
 	struct dm_zone *rzone;
+	struct dmz_dev *dev;
 	unsigned long start;
 	int ret;
 
@@ -352,7 +357,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 		return PTR_ERR(dzone);
 
 	start = jiffies;
-
+	dev = dmz_zone_to_dev(zmd, dzone);
 	if (dmz_is_rnd(dzone)) {
 		if (!dmz_weight(dzone)) {
 			/* Empty zone */
@@ -400,14 +405,14 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
 	ret = dmz_flush_metadata(zrc->metadata);
 	if (ret) {
-		dmz_dev_debug(zrc->dev,
-			      "Metadata flush for zone %u failed, err %d\n",
-			      rzone->id, ret);
+		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
+			dmz_metadata_label(zmd), rzone->id, ret);
 		return ret;
 	}
 
-	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
-		      rzone->id, jiffies_to_msecs(jiffies - start));
+	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
+		dmz_metadata_label(zmd),
+		rzone->id, jiffies_to_msecs(jiffies - start));
 	return 0;
 }
 
@@ -500,7 +505,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 /*
  * Initialize reclaim.
  */
-int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
+int dmz_ctr_reclaim(struct dmz_metadata *zmd,
 		    struct dmz_reclaim **reclaim)
 {
 	struct dmz_reclaim *zrc;
@@ -510,7 +515,6 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
 	if (!zrc)
 		return -ENOMEM;
 
-	zrc->dev = dev;
 	zrc->metadata = zmd;
 	zrc->atime = jiffies;
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index b32e791b8a5c..520e55df627b 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -840,7 +840,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
 
 	/* Initialize reclaim */
-	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
+	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
 	if (ret) {
 		ti->error = "Zone reclaim initialization failed";
 		goto err_fwq;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index e0883df8a903..2629bd51fa26 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -180,6 +180,7 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd);
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
+struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
 
 bool dmz_check_dev(struct dmz_metadata *zmd);
 bool dmz_dev_is_dying(struct dmz_metadata *zmd);
@@ -254,8 +255,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 /*
  * Functions defined in dm-zoned-reclaim.c
  */
-int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
-		    struct dmz_reclaim **zrc);
+int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc);
 void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
 void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
 void dmz_resume_reclaim(struct dmz_reclaim *zrc);
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

