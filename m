Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFF51CD3BD
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KyExXSXURn3vZvcGt1biDYbGbc3M4NAezpNrL+oMHJ4=;
	b=GWaMXmZcZbeOTJWdZvF3xXH7SHNy3o4ABmyZkeKF97Ien/OKHy2r8qkzpY6ZXG1Z3Wlez+
	zyASndGuzSaQRQp/IWUNXmle3xENQiFK/L1s9QDTRwW20TS7c4M+0UoO7O080NWzsD3e/4
	DAB+uMPELRpqciSpMElDC4wiINk8PKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-_cYiBVo0PmqZ9_igY6x3ag-1; Mon, 11 May 2020 04:25:17 -0400
X-MC-Unique: _cYiBVo0PmqZ9_igY6x3ag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A365835BE5;
	Mon, 11 May 2020 08:25:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F926C787;
	Mon, 11 May 2020 08:25:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90E964E561;
	Mon, 11 May 2020 08:25:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8OqbO031859 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23B24D0B5E; Mon, 11 May 2020 08:24:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F009D0B36
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E6F0811E7A
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-490-JfsXrT1sODigUFMzZ5DG2g-1;
	Mon, 11 May 2020 04:24:48 -0400
X-MC-Unique: JfsXrT1sODigUFMzZ5DG2g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 59D05AE96;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:25 +0200
Message-Id: <20200511082430.39455-11-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 10/15] dm-zoned: replace 'target' pointer in the
	bio context
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

Replace the 'target' pointer in the bio context with the
device pointer as this is what's actually used.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-target.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 520e55df627b..a09fb78ffe88 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -17,7 +17,7 @@
  * Zone BIO context.
  */
 struct dmz_bioctx {
-	struct dmz_target	*target;
+	struct dmz_dev		*dev;
 	struct dm_zone		*zone;
 	struct bio		*bio;
 	refcount_t		ref;
@@ -76,12 +76,13 @@ struct dmz_target {
  */
 static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
 {
-	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
+	struct dmz_bioctx *bioctx =
+		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 
 	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
 		bio->bi_status = status;
 	if (bio->bi_status != BLK_STS_OK)
-		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
+		bioctx->dev->flags |= DMZ_CHECK_BDEV;
 
 	if (refcount_dec_and_test(&bioctx->ref)) {
 		struct dm_zone *zone = bioctx->zone;
@@ -118,14 +119,20 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 			  struct bio *bio, sector_t chunk_block,
 			  unsigned int nr_blocks)
 {
-	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
+	struct dmz_bioctx *bioctx =
+		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
+	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
 	struct bio *clone;
 
+	if (dev->flags & DMZ_BDEV_DYING)
+		return -EIO;
+
 	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
 	if (!clone)
 		return -ENOMEM;
 
-	bio_set_dev(clone, dmz->dev->bdev);
+	bio_set_dev(clone, dev->bdev);
+	bioctx->dev = dev;
 	clone->bi_iter.bi_sector =
 		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
 	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
@@ -218,8 +225,10 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 
 		if (nr_blocks) {
 			/* Valid blocks found: read them */
-			nr_blocks = min_t(unsigned int, nr_blocks, end_block - chunk_block);
-			ret = dmz_submit_bio(dmz, rzone, bio, chunk_block, nr_blocks);
+			nr_blocks = min_t(unsigned int, nr_blocks,
+					  end_block - chunk_block);
+			ret = dmz_submit_bio(dmz, rzone, bio,
+					     chunk_block, nr_blocks);
 			if (ret)
 				return ret;
 			chunk_block += nr_blocks;
@@ -330,7 +339,8 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 		 * and the BIO is aligned to the zone write pointer:
 		 * direct write the zone.
 		 */
-		return dmz_handle_direct_write(dmz, zone, bio, chunk_block, nr_blocks);
+		return dmz_handle_direct_write(dmz, zone, bio,
+					       chunk_block, nr_blocks);
 	}
 
 	/*
@@ -383,7 +393,8 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 			   struct bio *bio)
 {
-	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
+	struct dmz_bioctx *bioctx =
+		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	struct dmz_metadata *zmd = dmz->metadata;
 	struct dm_zone *zone;
 	int ret;
@@ -397,11 +408,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 
 	dmz_lock_metadata(zmd);
 
-	if (dmz->dev->flags & DMZ_BDEV_DYING) {
-		ret = -EIO;
-		goto out;
-	}
-
 	/*
 	 * Get the data zone mapping the chunk. There may be no
 	 * mapping for read and discard. If a mapping is obtained,
@@ -625,7 +631,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 {
 	struct dmz_target *dmz = ti->private;
 	struct dmz_metadata *zmd = dmz->metadata;
-	struct dmz_dev *dev = dmz->dev;
 	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	sector_t sector = bio->bi_iter.bi_sector;
 	unsigned int nr_sectors = bio_sectors(bio);
@@ -642,8 +647,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		(unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
 		(unsigned int)dmz_bio_blocks(bio));
 
-	bio_set_dev(bio, dev->bdev);
-
 	if (!nr_sectors && bio_op(bio) != REQ_OP_WRITE)
 		return DM_MAPIO_REMAPPED;
 
@@ -652,7 +655,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		return DM_MAPIO_KILL;
 
 	/* Initialize the BIO context */
-	bioctx->target = dmz;
+	bioctx->dev = NULL;
 	bioctx->zone = NULL;
 	bioctx->bio = bio;
 	refcount_set(&bioctx->ref, 1);
@@ -931,11 +934,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 {
 	struct dmz_target *dmz = ti->private;
+	struct dmz_dev *dev = &dmz->dev[0];
 
-	if (!dmz_check_bdev(dmz->dev))
+	if (!dmz_check_bdev(dev))
 		return -EIO;
 
-	*bdev = dmz->dev->bdev;
+	*bdev = dev->bdev;
 
 	return 0;
 }
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

