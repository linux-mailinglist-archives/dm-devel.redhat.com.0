Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1211BF21CC
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 23:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573079748;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RCWRHnxnZCJFLVxBAN/oPEjnljumwbhSntRtV0DlyDY=;
	b=E3bv00sVAbCxzM2G9hh8sSKhCk6tY8mMzNzUOAPzwvtYhjSRbv/FeGXfh4AVcYYw7bfogI
	EYf6f1RepTDuUaHn0z0QLd4KPWo8BqimcBGunLIXQiHXiugGJ9KnJOIuL/eHtiMNCpUuOf
	bX4dMuuooW8pvICHTNe6aTTqC9VArpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-srAsUBKQOOuU8Jgz5xgkgQ-1; Wed, 06 Nov 2019 17:35:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861658017DD;
	Wed,  6 Nov 2019 22:35:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DBB91001B35;
	Wed,  6 Nov 2019 22:35:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D338C4BB65;
	Wed,  6 Nov 2019 22:35:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA6MZFOA006394 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 17:35:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E902460872; Wed,  6 Nov 2019 22:35:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE6060870;
	Wed,  6 Nov 2019 22:35:10 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55EB383F3B;
	Wed,  6 Nov 2019 22:34:45 +0000 (UTC)
IronPort-SDR: ZSJkgLQK2SBVwgGsgZSP48Wo1scM29Gof1Mw5NouQFZebnah6ZsSvOVG2zKH8MqLG1bingtzp6
	Bf141Z0ga9fIe0zp46/VBOyCApSQLbtklztY4xfg17SyBqYPY/AE0FaADhDAjoRGvdYAwGcccn
	P6UilyzMlVX6ZymLV+Y5eTIzQuqBQrWGLl+HuRTTeeMMcYiIdMdVsTGGKP3XWEBp4HKbQuNf+m
	2ikq8JI7sXp4jN4L1+740nmMI373Bra/Cyx3YY5gH54VUHUDLYrQEJSsEDVaNLzE3RKHRT8SIv
	u1Q=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="122326625"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 06:34:36 +0800
IronPort-SDR: BGoR95umWKdkMfeo/LHL4VAgZ41KRaAFztCaim61mHaVqLoFQgjKNTl+qMK3KLPKoFNFvf7GAg
	lAFiI3VhLfDxlzqxxrZW6QUfvnbYeOapfnA1uZC38CGfO20Ebz7aBN3P5Lt1nEU4PlbO4we6QI
	s/HtPpbkfH1dCqB7WnEIN1cmynFRRGRPAyfJT+Yzcit2BsrHpaCX1FD3VVeW31tjYVyhZHv0uu
	Fs50uxjv7XZTz0u2fBqu6U2mPglqqhbIKOUg6ZQ/VX0woNu2IUUAiiAKZI1NTy6G9nkwLFcerV
	K9Tlxe7gx8dpB0rPjlaoHFfD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 14:29:48 -0800
IronPort-SDR: EqQoDJACbi64FHt3rGDeeAff57H7Gtm02Ok7TaPVEZ+3BZFl51vND/GvFzjlQlQ8zteCJxlf03
	6Rg/rPWBj8UTwUzCo+Dcjz+PpoSTzudeSIcF9XoNTcUWUO2fYF18RoVKc0pHYG5F4bOWld+f8J
	vylKwngS09rLeBUPUt+cpsy2EkYo0A87V1U5Td99k2ADRpgWtl0p76mfjWrwPKu3xvb3oq6Qfq
	lRA5WTOiF1uGFB0gYjII9D96ixUp1VoP7XE18JB3PBSo5J05GASnuYhXRUsA+G3opqlx+hWCfB
	vBI=
WDCIronportException: Internal
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Nov 2019 14:34:37 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	zhangxiaoxu <zhangxiaoxu5@huawei.com>
Date: Wed,  6 Nov 2019 14:34:35 -0800
Message-Id: <20191106223435.30840-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Wed, 06 Nov 2019 22:34:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 06 Nov 2019 22:34:58 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=206a29409=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: [dm-devel] [PATCH] dm-zoned: reduce overhead of backing device
	checks
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: srAsUBKQOOuU8Jgz5xgkgQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 75d66ffb48efb3 added backing device health checks and as a part
of these checks, check_events() block ops template call is invoked
in dm-zoned mapping path as well as in reclaim and flush path. Calling
check_events() with ATA or SCSI backing devices introduces a blocking
scsi_test_unit_ready() call being made in sd_check_events().
Even though the overhead of calling scsi_test_unit_ready() is small
for ATA zoned devices, it is much larger for SCSI and it affects
performance in a very negative way.

This commit fixes this performance regression by executing
check_events() only in case of any I/O errors. The function
dmz_bdev_is_dying() is modified to call only blk_queue_dying(),
while calls to check_events() are made in a new helper function,
dmz_check_bdev().

Cc: stable@vger.kernel.org
Fixes: 75d66ffb48efb3 ("dm zoned: properly handle backing device failure")
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 29 +++++++++++-------
 drivers/md/dm-zoned-reclaim.c  |  8 ++---
 drivers/md/dm-zoned-target.c   | 54 ++++++++++++++++++++++++----------
 drivers/md/dm-zoned.h          |  2 ++
 4 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 595a73110e17..ac1179ca80d9 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -554,6 +554,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
 		       TASK_UNINTERRUPTIBLE);
 	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 		dmz_release_mblock(zmd, mblk);
+		dmz_check_bdev(zmd->dev);
 		return ERR_PTR(-EIO);
 	}
 
@@ -625,6 +626,8 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
 
+	if (ret)
+		dmz_check_bdev(zmd->dev);
 	return ret;
 }
 
@@ -691,6 +694,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 			       TASK_UNINTERRUPTIBLE);
 		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
 			clear_bit(DMZ_META_ERROR, &mblk->state);
+			dmz_check_bdev(zmd->dev);
 			ret = -EIO;
 		}
 		nr_mblks_submitted--;
@@ -768,7 +772,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	/* If there are no dirty metadata blocks, just flush the device cache */
 	if (list_empty(&write_list)) {
 		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
-		goto out;
+		goto err;
 	}
 
 	/*
@@ -778,7 +782,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 */
 	ret = dmz_log_dirty_mblocks(zmd, &write_list);
 	if (ret)
-		goto out;
+		goto err;
 
 	/*
 	 * The log is on disk. It is now safe to update in place
@@ -786,11 +790,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 	 */
 	ret = dmz_write_dirty_mblocks(zmd, &write_list, zmd->mblk_primary);
 	if (ret)
-		goto out;
+		goto err;
 
 	ret = dmz_write_sb(zmd, zmd->mblk_primary);
 	if (ret)
-		goto out;
+		goto err;
 
 	while (!list_empty(&write_list)) {
 		mblk = list_first_entry(&write_list, struct dmz_mblock, link);
@@ -805,16 +809,20 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 
 	zmd->sb_gen++;
 out:
-	if (ret && !list_empty(&write_list)) {
-		spin_lock(&zmd->mblk_lock);
-		list_splice(&write_list, &zmd->mblk_dirty_list);
-		spin_unlock(&zmd->mblk_lock);
-	}
-
 	dmz_unlock_flush(zmd);
 	up_write(&zmd->mblk_sem);
 
 	return ret;
+
+err:
+	if (!list_empty(&write_list)) {
+		spin_lock(&zmd->mblk_lock);
+		list_splice(&write_list, &zmd->mblk_dirty_list);
+		spin_unlock(&zmd->mblk_lock);
+	}
+	if (!dmz_check_bdev(zmd->dev))
+		ret = -EIO;
+	goto out;
 }
 
 /*
@@ -1244,6 +1252,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	if (ret) {
 		dmz_dev_err(zmd->dev, "Get zone %u report failed",
 			    dmz_id(zmd, zone));
+		dmz_check_bdev(zmd->dev);
 		return ret;
 	}
 
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index d240d7ca8a8a..e7ace908a9b7 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -82,6 +82,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
 			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
 			    dmz_id(zmd, zone), (unsigned long long)wp_block,
 			    (unsigned long long)block, nr_blocks, ret);
+		dmz_check_bdev(zrc->dev);
 		return ret;
 	}
 
@@ -489,12 +490,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 	ret = dmz_do_reclaim(zrc);
 	if (ret) {
 		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
-		if (ret == -EIO)
-			/*
-			 * LLD might be performing some error handling sequence
-			 * at the underlying device. To not interfere, do not
-			 * attempt to schedule the next reclaim run immediately.
-			 */
+		if (!dmz_check_bdev(zrc->dev))
 			return;
 	}
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 09f5a63e0803..e0b809bb4885 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -85,6 +85,8 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
 
 	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
 		bio->bi_status = status;
+	if (bio->bi_status != BLK_STS_OK)
+		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
 
 	if (refcount_dec_and_test(&bioctx->ref)) {
 		struct dm_zone *zone = bioctx->zone;
@@ -570,31 +572,51 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 }
 
 /*
- * Check the backing device availability. If it's on the way out,
+ * Check if the backing device is being removed. If it's on the way out,
  * start failing I/O. Reclaim and metadata components also call this
  * function to cleanly abort operation in the event of such failure.
  */
 bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev)
 {
-	struct gendisk *disk;
+	if (dmz_dev->flags & DMZ_BDEV_DYING)
+		return true;
 
-	if (!(dmz_dev->flags & DMZ_BDEV_DYING)) {
-		disk = dmz_dev->bdev->bd_disk;
-		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
-			dmz_dev_warn(dmz_dev, "Backing device queue dying");
-			dmz_dev->flags |= DMZ_BDEV_DYING;
-		} else if (disk->fops->check_events) {
-			if (disk->fops->check_events(disk, 0) &
-					DISK_EVENT_MEDIA_CHANGE) {
-				dmz_dev_warn(dmz_dev, "Backing device offline");
-				dmz_dev->flags |= DMZ_BDEV_DYING;
-			}
-		}
+	if (dmz_dev->flags & DMZ_CHECK_BDEV)
+		return !dmz_check_bdev(dmz_dev);
+
+	if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
+		dmz_dev_warn(dmz_dev, "Backing device queue dying");
+		dmz_dev->flags |= DMZ_BDEV_DYING;
 	}
 
 	return dmz_dev->flags & DMZ_BDEV_DYING;
 }
 
+/*
+ * Check the backing device availability. This detects such events as
+ * backing device going offline due to errors, media removals, etc.
+ * This check is less efficient than dmz_bdev_is_dying() and should
+ * only be performed as a part of error handling.
+ */
+bool dmz_check_bdev(struct dmz_dev *dmz_dev)
+{
+	struct gendisk *disk;
+
+	dmz_dev->flags &= ~DMZ_CHECK_BDEV;
+
+	if (dmz_bdev_is_dying(dmz_dev))
+		return false;
+
+	disk = dmz_dev->bdev->bd_disk;
+	if (disk->fops->check_events &&
+	    disk->fops->check_events(disk, 0) & DISK_EVENT_MEDIA_CHANGE) {
+		dmz_dev_warn(dmz_dev, "Backing device offline");
+		dmz_dev->flags |= DMZ_BDEV_DYING;
+	}
+
+	return !(dmz_dev->flags & DMZ_BDEV_DYING);
+}
+
 /*
  * Process a new BIO.
  */
@@ -907,8 +929,8 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 {
 	struct dmz_target *dmz = ti->private;
 
-	if (dmz_bdev_is_dying(dmz->dev))
-		return -ENODEV;
+	if (!dmz_check_bdev(dmz->dev))
+		return -EIO;
 
 	*bdev = dmz->dev->bdev;
 
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index d8e70b0ade35..5b5e493d479c 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -72,6 +72,7 @@ struct dmz_dev {
 
 /* Device flags. */
 #define DMZ_BDEV_DYING		(1 << 0)
+#define DMZ_CHECK_BDEV		(2 << 0)
 
 /*
  * Zone descriptor.
@@ -255,5 +256,6 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
  * Functions defined in dm-zoned-target.c
  */
 bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
+bool dmz_check_bdev(struct dmz_dev *dmz_dev);
 
 #endif /* DM_ZONED_H */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

