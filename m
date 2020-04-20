Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6571B0644
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587377366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R889LjJNd8gk7yfGFfAQHBZyXPyMn+OfWfEQNVe4uU4=;
	b=JRxquTDz1CdRJC4OBsqvaDEFIwTgIUabMvopIjYGFMxHi+P4IT/kV8fsMsXq2ujP+iQ5js
	jXajFmdzT3+1FjpyoLlaBYCwUOe/MXK8tOkzqiH9m1J5T59dPGm3W5cKjQlHVIlyedicDD
	NA6ZB2eDQP6UAke6XnDvDaIqByoUzXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-zYjKU8vjN-SKlrm21NObrQ-1; Mon, 20 Apr 2020 06:09:23 -0400
X-MC-Unique: zYjKU8vjN-SKlrm21NObrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E9D6801E5A;
	Mon, 20 Apr 2020 10:09:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E313A104A;
	Mon, 20 Apr 2020 10:09:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A790938F3;
	Mon, 20 Apr 2020 10:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KA8oRS008195 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:08:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7615B10EE6D7; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A0810EE6D6
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5796E185A78F
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-363-VAAONzFGN8Kaq8sDgqSmeg-1;
	Mon, 20 Apr 2020 06:08:46 -0400
X-MC-Unique: VAAONzFGN8Kaq8sDgqSmeg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2535DAFCA;
	Mon, 20 Apr 2020 10:08:42 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 20 Apr 2020 12:08:20 +0200
Message-Id: <20200420100824.124618-10-hare@suse.de>
In-Reply-To: <20200420100824.124618-1-hare@suse.de>
References: <20200420100824.124618-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KA8oRS008195
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 09/13] dm-zoned: replace 'target' pointer in the
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
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-target.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index a1f42af2877c..4897ffae96ca 100644
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
@@ -81,7 +81,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
 	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
 		bio->bi_status = status;
 	if (bio->bi_status != BLK_STS_OK)
-		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
+		bioctx->dev->flags |= DMZ_CHECK_BDEV;
 
 	if (refcount_dec_and_test(&bioctx->ref)) {
 		struct dm_zone *zone = bioctx->zone;
@@ -119,13 +119,18 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 			  unsigned int nr_blocks)
 {
 	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
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
@@ -397,11 +402,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 
 	dmz_lock_metadata(zmd);
 
-	if (dmz->dev->flags & DMZ_BDEV_DYING) {
-		ret = -EIO;
-		goto out;
-	}
-
 	/*
 	 * Get the data zone mapping the chunk. There may be no
 	 * mapping for read and discard. If a mapping is obtained,
@@ -625,7 +625,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 {
 	struct dmz_target *dmz = ti->private;
 	struct dmz_metadata *zmd = dmz->metadata;
-	struct dmz_dev *dev = dmz->dev;
 	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	sector_t sector = bio->bi_iter.bi_sector;
 	unsigned int nr_sectors = bio_sectors(bio);
@@ -642,8 +641,6 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		(unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
 		(unsigned int)dmz_bio_blocks(bio));
 
-	bio_set_dev(bio, dev->bdev);
-
 	if (!nr_sectors && bio_op(bio) != REQ_OP_WRITE)
 		return DM_MAPIO_REMAPPED;
 
@@ -652,7 +649,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		return DM_MAPIO_KILL;
 
 	/* Initialize the BIO context */
-	bioctx->target = dmz;
+	bioctx->dev = NULL;
 	bioctx->zone = NULL;
 	bioctx->bio = bio;
 	refcount_set(&bioctx->ref, 1);
@@ -931,11 +928,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
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

