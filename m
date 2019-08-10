Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906188E93
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 23:44:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98967882F5;
	Sat, 10 Aug 2019 21:44:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DFE01001944;
	Sat, 10 Aug 2019 21:44:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AD1318005C7;
	Sat, 10 Aug 2019 21:44:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ALieZd025605 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 17:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8BDD6B908; Sat, 10 Aug 2019 21:44:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A02D86B8FF;
	Sat, 10 Aug 2019 21:44:36 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D9698E592;
	Sat, 10 Aug 2019 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565473464; x=1597009464;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GNlUc/KC3mhGjkWSm7BD3KzYNNSEnFFe77QR3XmP59Q=;
	b=LAmwAVkLyPeCY3HD8iRxZ9Pz6QS+bzCBFD1DASJgubpm50x8e1ZHESUL
	SJKbynzG30UydbYkU1/KKKthnzG3lG9Mvrhrinnojs0qTYmY0xGssFRKO
	nVbri+NXkG678j/O4c+jiufs4+6rkCs1VXghyBYCgBOXXzkwD/6TsZURk
	53oA/73+sfd9hNfN1qupaRLb9WCo8hYUiAOVxofLGrHAZSR/oJGXIMbts
	3zaBnFm/x4UrvbekkiFhtYxI+bH/NVbRLMMHR4uEyyS3RxjWBuGUmBP9c
	Nra62jabRNRdfy2FJ9AmCrP7JSSI2YRW+6RLhHbINihKDbFoLn/dwv2zK Q==;
IronPort-SDR: LjWeftgwQYBCO7T+/CthurWPPoqgRmqe5C3zOnKRpXyEVM0IQqyvJnf7nrbrwoBU1mGAt+UB2F
	LSpOYG7zjNu/lldqHg0Vidp7I7x2wIkdYsP87w+xnwn3bGsASNY+uUuYjihyGUVvCEjIkrIrsI
	qXRU8zVFXztLHNLhgHx3s0EpWuTlnZ7aN5G+4A0s3qI5oXn+SSjaAldVe0mWQZa5ijFpTYeoDs
	OifWUWdn72AnhCgEs7Ez7MeCEDJZZFfgcxYVoa3I/HzbPkKmBkE0yDQIUVNGw0K33ndnoCE1fL
	Buk=
X-IronPort-AV: E=Sophos;i="5.64,370,1559491200"; d="scan'208";a="115569226"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2019 05:43:14 +0800
IronPort-SDR: qXC2ZfiiglGeE3XgGgyH6QWDcMoNTFG73tlQKF8Hu9OeObgSgz2xainDC3QA7wnzvjBvK5LW0m
	4tATsxcMJKlz5GwHqnDczpxB9EzBjPgXD1UtcO5v8zOILa1cQqxb0HxkbVc1JjsYyKelWR+oP0
	gSiWH9rIM6BbdeP4ghsFQLJlgennRD7gUqZYyPDsABqHNtNFmTIUxgXYu4U/sfUy8AAEyfqaG/
	nshpfrgy3vcPkBJ1dsoITZd4o0YbQT3sEsJlUNFF8zojstRAP5ZP+ByUCnYgwHnwv+/nqX3F8f
	RPTDQ0j0a2E6g51a65FRTel8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Aug 2019 14:40:53 -0700
IronPort-SDR: sg5ztrlC43OJE+FuVcYRZGl/8xCVKmweh43SDEOASh1QCjNAoe05qvcd9HhzSlXF+zsnQSELFf
	1WsssrYLHUDgyPNC5vRiiMG6gUPZF8vPXnvUIClH1Z7CWf1SlfnIne/Rzi6sz5gRMr//IzJMwL
	GC55KyTOVDsjAobsrx2gL8yHvDUQQvCAt4hULlcgs/v9ACxPwKZBmcPfKnSUsn6eHJeajhCpch
	ztXjkvB56OnjEmDd8tqPucrrOx8rcEje7hr5MDCdGZpfSR2EhEyLn0RggJxPrFUcRryVRYHKeP
	Ttw=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Aug 2019 14:43:13 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sat, 10 Aug 2019 14:43:11 -0700
Message-Id: <20190810214311.9503-4-dmitry.fomichev@wdc.com>
In-Reply-To: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
References: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Sat, 10 Aug 2019 21:44:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 10 Aug 2019 21:44:24 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=1182bd66c=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH v2 3/3] dm-zoned: properly handle backing device
	failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sat, 10 Aug 2019 21:44:46 +0000 (UTC)

dm-zoned is observed to lock up or livelock in case of hardware
failure or some misconfiguration of the backing zoned device.

This patch adds a new dm-zoned target function that checks the status of
the backing device. If the request queue of the backing device is found
to be in dying state or the SCSI backing device enters offline state,
the health check code sets a dm-zoned target flag prompting all further
incoming I/O to be rejected. In order to detect backing device failures
timely, this new function is called in the request mapping path, at the
beginning of every reclaim run and before performing any metadata I/O.

The proper way out of this situation is to do

dmsetup remove <dm-zoned target>

and recreate the target when the problem with the backing device
is resolved.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 51 +++++++++++++++++++++++++++-------
 drivers/md/dm-zoned-reclaim.c  | 18 ++++++++++--
 drivers/md/dm-zoned-target.c   | 45 ++++++++++++++++++++++++++++--
 drivers/md/dm-zoned.h          | 10 +++++++
 4 files changed, 110 insertions(+), 14 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 6b7fbbd735ef..2a5bc51fd6d5 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -403,15 +403,18 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
 	struct bio *bio;
 
+	if (dmz_bdev_is_dying(zmd->dev))
+		return ERR_PTR(-EIO);
+
 	/* Get a new block and a BIO to read it */
 	mblk = dmz_alloc_mblock(zmd, mblk_no);
 	if (!mblk)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	bio = bio_alloc(GFP_NOIO, 1);
 	if (!bio) {
 		dmz_free_mblock(zmd, mblk);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	spin_lock(&zmd->mblk_lock);
@@ -542,8 +545,8 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
 	if (!mblk) {
 		/* Cache miss: read the block from disk */
 		mblk = dmz_get_mblock_slow(zmd, mblk_no);
-		if (!mblk)
-			return ERR_PTR(-ENOMEM);
+		if (IS_ERR(mblk))
+			return mblk;
 	}
 
 	/* Wait for on-going read I/O and check for error */
@@ -571,16 +574,19 @@ static void dmz_dirty_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk)
 /*
  * Issue a metadata block write BIO.
  */
-static void dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
-			     unsigned int set)
+static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
+			    unsigned int set)
 {
 	sector_t block = zmd->sb[set].block + mblk->no;
 	struct bio *bio;
 
+	if (dmz_bdev_is_dying(zmd->dev))
+		return -EIO;
+
 	bio = bio_alloc(GFP_NOIO, 1);
 	if (!bio) {
 		set_bit(DMZ_META_ERROR, &mblk->state);
-		return;
+		return -ENOMEM;
 	}
 
 	set_bit(DMZ_META_WRITING, &mblk->state);
@@ -592,6 +598,8 @@ static void dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
 	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
+
+	return 0;
 }
 
 /*
@@ -603,6 +611,9 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
 	struct bio *bio;
 	int ret;
 
+	if (dmz_bdev_is_dying(zmd->dev))
+		return -EIO;
+
 	bio = bio_alloc(GFP_NOIO, 1);
 	if (!bio)
 		return -ENOMEM;
@@ -660,22 +671,29 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 {
 	struct dmz_mblock *mblk;
 	struct blk_plug plug;
-	int ret = 0;
+	int ret = 0, nr_mblks_submitted = 0;
 
 	/* Issue writes */
 	blk_start_plug(&plug);
-	list_for_each_entry(mblk, write_list, link)
-		dmz_write_mblock(zmd, mblk, set);
+	list_for_each_entry(mblk, write_list, link) {
+		ret = dmz_write_mblock(zmd, mblk, set);
+		if (ret)
+			break;
+		nr_mblks_submitted++;
+	}
 	blk_finish_plug(&plug);
 
 	/* Wait for completion */
 	list_for_each_entry(mblk, write_list, link) {
+		if (!nr_mblks_submitted)
+			break;
 		wait_on_bit_io(&mblk->state, DMZ_META_WRITING,
 			       TASK_UNINTERRUPTIBLE);
 		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 			clear_bit(DMZ_META_ERROR, &mblk->state);
 			ret = -EIO;
 		}
+		nr_mblks_submitted--;
 	}
 
 	/* Flush drive cache (this will also sync data) */
@@ -737,6 +755,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 */
 	dmz_lock_flush(zmd);
 
+	if (dmz_bdev_is_dying(zmd->dev)) {
+		ret = -EIO;
+		goto out;
+	}
+
 	/* Get dirty blocks */
 	spin_lock(&zmd->mblk_lock);
 	list_splice_init(&zmd->mblk_dirty_list, &write_list);
@@ -1632,6 +1655,10 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 		/* Allocate a random zone */
 		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 		if (!dzone) {
+			if (dmz_bdev_is_dying(zmd->dev)) {
+				dzone = ERR_PTR(-EIO);
+				goto out;
+			}
 			dmz_wait_for_free_zones(zmd);
 			goto again;
 		}
@@ -1729,6 +1756,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	/* Allocate a random zone */
 	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 	if (!bzone) {
+		if (dmz_bdev_is_dying(zmd->dev)) {
+			bzone = ERR_PTR(-EIO);
+			goto out;
+		}
 		dmz_wait_for_free_zones(zmd);
 		goto again;
 	}
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 26e34493a2db..d240d7ca8a8a 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -38,7 +38,7 @@ enum {
 /*
  * Number of seconds of target BIO inactivity to consider the target idle.
  */
-#define DMZ_IDLE_PERIOD		(10UL * HZ)
+#define DMZ_IDLE_PERIOD			(10UL * HZ)
 
 /*
  * Percentage of unmapped (free) random zones below which reclaim starts
@@ -135,6 +135,9 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
 
 	while (block < end_block) {
+		if (dev->flags & DMZ_BDEV_DYING)
+			return -EIO;
+
 		/* Get a valid region from the source zone */
 		ret = dmz_first_valid_block(zmd, src_zone, &block);
 		if (ret <= 0)
@@ -452,6 +455,9 @@ static void dmz_reclaim_work(struct work_struct *work)
 	unsigned int p_unmap_rnd;
 	int ret;
 
+	if (dmz_bdev_is_dying(zrc->dev))
+		return;
+
 	if (!dmz_should_reclaim(zrc)) {
 		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
 		return;
@@ -481,8 +487,16 @@ static void dmz_reclaim_work(struct work_struct *work)
 		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
 
 	ret = dmz_do_reclaim(zrc);
-	if (ret)
+	if (ret) {
 		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
+		if (ret == -EIO)
+			/*
+			 * LLD might be performing some error handling sequence
+			 * at the underlying device. To not interfere, do not
+			 * attempt to schedule the next reclaim run immediately.
+			 */
+			return;
+	}
 
 	dmz_schedule_reclaim(zrc);
 }
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index c1992034c099..31478fef6032 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -134,6 +134,8 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 
 	refcount_inc(&bioctx->ref);
 	generic_make_request(clone);
+	if (clone->bi_status == BLK_STS_IOERR)
+		return -EIO;
 
 	if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
 		zone->wp_block += nr_blocks;
@@ -278,8 +280,8 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
 
 	/* Get the buffer zone. One will be allocated if needed */
 	bzone = dmz_get_chunk_buffer(zmd, zone);
-	if (!bzone)
-		return -ENOSPC;
+	if (IS_ERR(bzone))
+		return PTR_ERR(bzone);
 
 	if (dmz_is_readonly(bzone))
 		return -EROFS;
@@ -390,6 +392,11 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 
 	dmz_lock_metadata(zmd);
 
+	if (dmz->dev->flags & DMZ_BDEV_DYING) {
+		ret = -EIO;
+		goto out;
+	}
+
 	/*
 	 * Get the data zone mapping the chunk. There may be no
 	 * mapping for read and discard. If a mapping is obtained,
@@ -494,6 +501,8 @@ static void dmz_flush_work(struct work_struct *work)
 
 	/* Flush dirty metadata blocks */
 	ret = dmz_flush_metadata(dmz->metadata);
+	if (ret)
+		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
 
 	/* Process queued flush requests */
 	while (1) {
@@ -557,6 +566,32 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 	return ret;
 }
 
+/*
+ * Check the backing device availability. If it's on the way out,
+ * start failing I/O. Reclaim and metadata components also call this
+ * function to cleanly abort operation in the event of such failure.
+ */
+bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev)
+{
+	struct gendisk *disk;
+
+	if (!(dmz_dev->flags & DMZ_BDEV_DYING)) {
+		disk = dmz_dev->bdev->bd_disk;
+		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
+			dmz_dev_warn(dmz_dev, "Backing device queue dying");
+			dmz_dev->flags |= DMZ_BDEV_DYING;
+		} else if (disk->fops->check_events) {
+			if (disk->fops->check_events(disk, 0) &
+					DISK_EVENT_MEDIA_CHANGE) {
+				dmz_dev_warn(dmz_dev, "Backing device offline");
+				dmz_dev->flags |= DMZ_BDEV_DYING;
+			}
+		}
+	}
+
+	return dmz_dev->flags & DMZ_BDEV_DYING;
+}
+
 /*
  * Process a new BIO.
  */
@@ -570,6 +605,9 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	sector_t chunk_sector;
 	int ret;
 
+	if (dmz_bdev_is_dying(dmz->dev))
+		return DM_MAPIO_KILL;
+
 	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
 		      bio_op(bio), (unsigned long long)sector, nr_sectors,
 		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
@@ -866,6 +904,9 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 {
 	struct dmz_target *dmz = ti->private;
 
+	if (dmz_bdev_is_dying(dmz->dev))
+		return -ENODEV;
+
 	*bdev = dmz->dev->bdev;
 
 	return 0;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 1a3b06de2c00..d8e70b0ade35 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -57,6 +57,8 @@ struct dmz_dev {
 
 	unsigned int		nr_zones;
 
+	unsigned int		flags;
+
 	sector_t		zone_nr_sectors;
 	unsigned int		zone_nr_sectors_shift;
 
@@ -68,6 +70,9 @@ struct dmz_dev {
 				 (dev)->zone_nr_sectors_shift)
 #define dmz_chunk_block(dev, b)	((b) & ((dev)->zone_nr_blocks - 1))
 
+/* Device flags. */
+#define DMZ_BDEV_DYING		(1 << 0)
+
 /*
  * Zone descriptor.
  */
@@ -246,4 +251,9 @@ void dmz_resume_reclaim(struct dmz_reclaim *zrc);
 void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc);
 void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
 
+/*
+ * Functions defined in dm-zoned-target.c
+ */
+bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
+
 #endif /* DM_ZONED_H */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
