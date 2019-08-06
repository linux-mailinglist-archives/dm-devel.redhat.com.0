Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAC82913
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 03:12:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC92D30B1B75;
	Tue,  6 Aug 2019 01:12:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BD85C1D8;
	Tue,  6 Aug 2019 01:12:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90DBC2551B;
	Tue,  6 Aug 2019 01:11:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7617ToB011271 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 21:07:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F23719C78; Tue,  6 Aug 2019 01:07:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA3619C5B;
	Tue,  6 Aug 2019 01:07:24 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30133821D8;
	Tue,  6 Aug 2019 01:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565053636; x=1596589636;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=3gHDqmHJ01xQoKIJvdRa/T+xRJt3OkzQNMA/zx1o8kU=;
	b=XLvSmiza2ozP9FdVd/fNTDGPE4Ug/vRUYAX8SttcStecaE8HPU3QhtQB
	s/GHuylw2MVdD1+z1ukGTiizRZ4GOr7aCQIqUzt5RZrlXUNi8+bk23Onw
	mdMMWS1MBN6rlUWk/XrveJu8TMxt6Ug7viqlYL/lrx30VOLpeqwNjhYgS
	2R6ueBvVmhciiGmhGWMECs8HVaExllKEoDMmWY5QBWzu8wCKWVj3AsZvj
	ZoCce8H2LcE9sVsgK63CyVMW+wXYgKVKwhZoYQyHCkEMGV4LBy2w0iuuh
	SGzdS0dwiWIHIk62YCy7vWWf6Wtnv4mZwoRA+tcfnwThHlwtMQAmmTUqk Q==;
IronPort-SDR: X31OU4uVJi0d5pv1laRAABPIW9SowMOvFD7/i0OYi6ZxTuowECuGLbASjXCZTnn+IrGLeTPs52
	50phpuTAAa/9HPODMmbcxVZhjN9WeJLaNdBP4UEnzAhZAtwbzK6SMAEQ/y2bMULpVb50wfRFN+
	rhAHkB6/vbEhJeq6SGpLMPV1IYf+8pBLnEC7Zape3ny728sJfRJwEFeadq7c8j8d4MHDs629P6
	X4CIAYa1sxttHk8HKYP+MLtFIA3nyxHweAAOycZFVYV13jpOCz/Q/QRDXki9AsSHyEgJaYwOA0
	f1A=
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="119702623"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2019 09:06:30 +0800
IronPort-SDR: EvhZ+NgwYdGHFfHcVFhheoTgH4PeMT9zC+Ckug+13pvabAByTam5kc75aDtCvGmU+JQfSKXXMC
	RmO+ha1XEOcm8xxIavvHDNyp1iESOJKa6TeTxjcMySs1IQVwmiGfDZpFfe6IDHhIDG9XlxG82l
	B5fA1/cU7Vg940fHnU+L1n9DOBd6dRztrwnCSpFvwXi9sCoilpCIyHVJ/dFz2Cv1+BbMxryOVC
	ylvDlZ/SS+EUnV/pYjShJRIQbfeytiMp/wKd3Ku5TNBfSUZGO3G27AHPPxLcTMuF/EZ8zx9WUc
	vkJU1pjqfKDLwMr1ARir8HJY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 18:04:19 -0700
IronPort-SDR: nW+Pxw4kIAHk2JKpXpJs9G5L8tZFdZXllkm/FvpsaAomCAAsBH5hLPtRdU5LUkX43PYCwVo7fk
	zP+hLnIXKl1eAhjmo/vREToVJirq5qEYt+bKeQkP5GCQZY21W0/wltGeSsh985icz/PTFWwtWD
	lSRmt1I9aBlNDPLJAD+Q397GjblC5o8X/mgc63sywFJ+83zNuceM8OdqoPTSsf0tvenOp4XSDL
	PApuGIKU8UuPoXhz6WnnTAPl1IqCAqADj7IttT+mGtjN5CZysI9KRln4K/cR4iXMubk4ec1tmL
	Z9Q=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2019 18:06:28 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  5 Aug 2019 18:06:25 -0700
Message-Id: <20190806010625.27503-4-dmitry.fomichev@wdc.com>
In-Reply-To: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 06 Aug 2019 01:07:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 06 Aug 2019 01:07:15 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com 216.71.153.141
	esa3.hgst.iphmx.com <prvs=11492cde3=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 3/3] dm-zoned: properly handle backing device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 06 Aug 2019 01:12:08 +0000 (UTC)

dm-zoned is observed to lock up or livelock in case of hardware
failure or some misconfiguration of the backing zoned device.

This patch adds a new function in the target code that checks the
status of the backing device request queue. If it goes to dying state,
the health check code marks dm-zoned DM target read-only and begins
to reject any further incoming I/O. In order to timely detect backing
device failure, this new function is called in the request mapping
path, at the beginning of every reclaim run and before performing any
metadata I/O.

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
 drivers/md/dm-zoned-target.c   | 50 +++++++++++++++++++++++++++++++--
 drivers/md/dm-zoned.h          | 10 +++++++
 4 files changed, 115 insertions(+), 14 deletions(-)

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
index c1992034c099..c40c18f7fd64 100644
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
@@ -557,6 +566,37 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
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
+	bool dying = dmz_dev->flags & DMZ_BDEV_DYING;
+
+	if (!dying) {
+		disk = dmz_dev->bdev->bd_disk;
+		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
+			dmz_dev_warn(dmz_dev, "Backing device queue dying");
+			dying = true;
+		} else if (disk->fops->check_events) {
+			if (disk->fops->check_events(disk, 0) &
+					DISK_EVENT_MEDIA_CHANGE) {
+				dmz_dev_warn(dmz_dev, "Backing device offline");
+				dying = true;
+			}
+		}
+		if (dying) {
+			dmz_dev->flags |= DMZ_BDEV_DYING;
+			set_disk_ro(dmz_dev->bdev->bd_disk, 1);
+		}
+	}
+
+	return dying;
+}
+
 /*
  * Process a new BIO.
  */
@@ -570,6 +610,9 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	sector_t chunk_sector;
 	int ret;
 
+	if (dmz_bdev_is_dying(dmz->dev))
+		return DM_MAPIO_KILL;
+
 	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
 		      bio_op(bio), (unsigned long long)sector, nr_sectors,
 		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
@@ -866,6 +909,9 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
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
