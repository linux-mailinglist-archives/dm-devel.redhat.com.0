Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 160BB1A2F77
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 08:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586414775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZQQwVqdAGHDa5Y+IRBFpd+jxuPBNcx3Qgf4CLQMFA2I=;
	b=B2YSfolAGgxbiTjdGoCRhHiT06FJAe+VNB2LrLcqWToLtJFgpdGKcGgOWDGjiA1e5ru5Pf
	TaIqEaO88E6GhuRsA0dbTa5g7NbKedzu61bMmw8XFS7HihRHBKn1dgwOsjDLoRJHbUOsbY
	EUkWXImv1JLoTrvFlmF28CmBROEv1vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-6BEn823MPo-f5agwI5aw5A-1; Thu, 09 Apr 2020 02:46:13 -0400
X-MC-Unique: 6BEn823MPo-f5agwI5aw5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C7E2107B117;
	Thu,  9 Apr 2020 06:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF8819DD75;
	Thu,  9 Apr 2020 06:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F02C18089D6;
	Thu,  9 Apr 2020 06:46:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0396jeQG004759 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 02:45:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ACA2114D1D; Thu,  9 Apr 2020 06:45:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27109114D1A
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D2498FF67E
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-311-LbI8_ZL1NiqsUO6VJte6ww-1;
	Thu, 09 Apr 2020 02:45:35 -0400
X-MC-Unique: LbI8_ZL1NiqsUO6VJte6ww-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B613BADDD;
	Thu,  9 Apr 2020 06:45:30 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu,  9 Apr 2020 08:45:23 +0200
Message-Id: <20200409064527.82992-8-hare@suse.de>
In-Reply-To: <20200409064527.82992-1-hare@suse.de>
References: <20200409064527.82992-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0396jeQG004759
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 07/11] dm-zoned: replace 'target' pointer in the
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the 'target' pointer in the bio context with the
device pointer as this is what's actually used.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-target.c | 54 +++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index fa297348f0bb..1ee10789f04d 100644
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
@@ -71,6 +71,11 @@ struct dmz_target {
  */
 #define DMZ_FLUSH_PERIOD	(10 * HZ)
 
+struct dmz_dev *dmz_sect_to_dev(struct dmz_target *dmz, sector_t sect)
+{
+	return &dmz->dev[0];
+}
+
 /*
  * Target BIO completion.
  */
@@ -81,7 +86,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
 	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
 		bio->bi_status = status;
 	if (bio->bi_status != BLK_STS_OK)
-		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
+		bioctx->dev->flags |= DMZ_CHECK_BDEV;
 
 	if (refcount_dec_and_test(&bioctx->ref)) {
 		struct dm_zone *zone = bioctx->zone;
@@ -118,14 +123,20 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 			  struct bio *bio, sector_t chunk_block,
 			  unsigned int nr_blocks)
 {
-	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
+	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
+	struct dmz_bioctx *bioctx =
+		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
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
@@ -218,8 +229,10 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 
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
@@ -330,14 +343,16 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 		 * and the BIO is aligned to the zone write pointer:
 		 * direct write the zone.
 		 */
-		return dmz_handle_direct_write(dmz, zone, bio, chunk_block, nr_blocks);
+		return dmz_handle_direct_write(dmz, zone, bio,
+					       chunk_block, nr_blocks);
 	}
 
 	/*
 	 * This is an unaligned write in a sequential zone:
 	 * use buffered write.
 	 */
-	return dmz_handle_buffered_write(dmz, zone, bio, chunk_block, nr_blocks);
+	return dmz_handle_buffered_write(dmz, zone, bio,
+					 chunk_block, nr_blocks);
 }
 
 /*
@@ -383,7 +398,6 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 			   struct bio *bio)
 {
-	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	struct dmz_metadata *zmd = dmz->metadata;
 	struct dm_zone *zone;
 	int ret;
@@ -397,11 +411,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 
 	dmz_lock_metadata(zmd);
 
-	if (dmz->dev->flags & DMZ_BDEV_DYING) {
-		ret = -EIO;
-		goto out;
-	}
-
 	/*
 	 * Get the data zone mapping the chunk. There may be no
 	 * mapping for read and discard. If a mapping is obtained,
@@ -415,10 +424,8 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 	}
 
 	/* Process the BIO */
-	if (zone) {
+	if (zone)
 		dmz_activate_zone(zone);
-		bioctx->zone = zone;
-	}
 
 	switch (bio_op(bio)) {
 	case REQ_OP_READ:
@@ -625,14 +632,14 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 {
 	struct dmz_target *dmz = ti->private;
 	struct dmz_metadata *zmd = dmz->metadata;
-	struct dmz_dev *dev = dmz->dev;
 	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	sector_t sector = bio->bi_iter.bi_sector;
 	unsigned int nr_sectors = bio_sectors(bio);
+	struct dmz_dev *dev = dmz_sect_to_dev(dmz, sector);
 	sector_t chunk_sector;
 	int ret;
 
-	if (dmz_bdev_is_dying(dmz->dev))
+	if (dmz_bdev_is_dying(dev))
 		return DM_MAPIO_KILL;
 
 	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
@@ -651,7 +658,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		return DM_MAPIO_KILL;
 
 	/* Initialize the BIO context */
-	bioctx->target = dmz;
+	bioctx->dev = NULL;
 	bioctx->zone = NULL;
 	bioctx->bio = bio;
 	refcount_set(&bioctx->ref, 1);
@@ -673,7 +680,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	/* Now ready to handle this BIO */
 	ret = dmz_queue_chunk_work(dmz, bio);
 	if (ret) {
-		dmz_dev_debug(dmz->dev,
+		dmz_dev_debug(dev,
 			      "BIO op %d, can't process chunk %llu, err %i\n",
 			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
 			      ret);
@@ -930,11 +937,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
 static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 {
 	struct dmz_target *dmz = ti->private;
+	struct dmz_dev *dev = dmz_sect_to_dev(dmz, 0);
 
-	if (!dmz_check_bdev(dmz->dev))
+	if (!dmz_check_bdev(dev))
 		return -EIO;
 
-	*bdev = dmz->dev->bdev;
+	*bdev = dev->bdev;
 
 	return 0;
 }
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

