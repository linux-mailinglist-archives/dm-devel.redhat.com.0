Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE79E62F0
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GcwsmvVWZz5QJdjRI/XuRl6awEgrKurul6gjiESeTAo=;
	b=hgFsb7OS6gsN+Q3cTP6kmLy5ahdCYM3P4WRI8RrbiabKKUgv9ypvZksq9dZMTtR0lThndc
	DfL8MIjfi586fS7hNfFhW0Bj5CT+7bW9iuETg0jYoc4DEGc/t3PBc1Iv09ugVezybyI4sh
	/78ugmB76F0BJ7/a6j0+1/DnAlMTXLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168--VBdeI9VOlqg4I71VZ6IZw-1; Sun, 27 Oct 2019 10:07:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694F9801E6F;
	Sun, 27 Oct 2019 14:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F649100EA05;
	Sun, 27 Oct 2019 14:07:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF6794EDA5;
	Sun, 27 Oct 2019 14:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE7C6E007670 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43E6B6012E; Sun, 27 Oct 2019 14:07:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C340A60161;
	Sun, 27 Oct 2019 14:07:07 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A111308FBFC;
	Sun, 27 Oct 2019 14:06:42 +0000 (UTC)
IronPort-SDR: 6eG7mKyv3w7LVJiNYW9MhzVolsrnRi/FNkFLDu+cfg/sgqwolZgo/VstdZ1hpqeqb/ddPbos2E
	jE3g30B192m8MlfTEAuk5J7FURkY88aEAEOlnIzzgW3an16sXKkJJnStzfzr35eSiA2szjssiG
	YlKvEnNXHQXLSh91oGZu+C420CWd6HKaiNM+peNX0zlSMnBS71Bdl3LybNuD4tqQ8hmqHW2f/z
	Lx3se5SsN/pgQWusSuoul7bJy3zmqEEpPxvwo13jw9piM3+5Rw/zTsMGXpALhzH6vsgXnhYokY
	SjA=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197763"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:06:00 +0800
IronPort-SDR: YnqwG7bj+jNMDSN7qfhZ4CEhrDRLp5AusMOL1a4Ynbuix35DroW20Z+Ar9ulyMaRnYF5mn8dtq
	rfr9eXeY0kBNyim8f/KLuwJlKCiPV9/0fqG7tDCHHWlYmDPJsj8k2Y/Td/JGkjCaZRuZi6ZljB
	ykN/vTzdYjjU2sKAuS708SWepUiciatJI8EQPTshVkKIsVX8B/3Zn7iP9XGQWojq1BB7sEdxYS
	2q5L3afygW3fAYu2w4hlrjTMlZBMLcSdUYlh29zc4FVnetDoJXulprfU4SaSpIFGW+HpOX2m/2
	yzSDqaLwRW8VboMT/vHfnw6J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:28 -0700
IronPort-SDR: sW6iaumOMPmK2DZkrsYrq0KXXDURMUgtnTO0WutiX++L+LjXzv+NJEGwCqXaHJgkK9kfU51I1Q
	huHXErmaDp4YLd6YIX67cAuHFjX0QgXVFpIaK/bnCrQYJckMkABxoN1YIFoecbyRubp0bhk/3J
	ta+1kR8tPBLXqLvFTUTjAw+quW1zU8BzsMZ5EjX/O9bL9VSPZXJMhT/nYReGqlIC5xHw43v6Uz
	1GojsMlhW9RNbWKepivfuZPBgdMkZiOTK71YWXgutPcaoAWeGvfnEsQUCYkBxVRbq4/MQ/gff4
	TSw=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:58 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:45 +0900
Message-Id: <20191027140549.26272-5-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sun, 27 Oct 2019 14:06:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sun, 27 Oct 2019 14:06:57 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 4/8] block: add zone open,
	close and finish operations
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
X-MC-Unique: -VBdeI9VOlqg4I71VZ6IZw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ajay Joshi <ajay.joshi@wdc.com>

Zoned block devices (ZBC and ZAC devices) allow an explicit control
over the condition (state) of zones. The operations allowed are:
* Open a zone: Transition to open condition to indicate that a zone will
  actively be written
* Close a zone: Transition to closed condition to release the drive
  resources used for writing to a zone
* Finish a zone: Transition an open or closed zone to the full
  condition to prevent write operations

To enable this control for in-kernel zoned block device users, define
the new request operations REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE
and REQ_OP_ZONE_FINISH as well as the generic function
blkdev_zone_mgmt() for submitting these operations on a range of zones.
This results in blkdev_reset_zones() removal and replacement with this
new zone magement function. Users of blkdev_reset_zones() (f2fs and
dm-zoned) are updated accordingly.

Contains contributions from Matias Bjorling, Hans Holmberg,
Dmitry Fomichev, Keith Busch, Damien Le Moal and Christoph Hellwig.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
Signed-off-by: Matias Bjorling <matias.bjorling@wdc.com>
Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-core.c               | 12 +++++++++---
 block/blk-zoned.c              | 35 ++++++++++++++++++++--------------
 drivers/md/dm-zoned-metadata.c |  6 +++---
 fs/f2fs/segment.c              |  3 ++-
 include/linux/blk_types.h      | 25 ++++++++++++++++++++++++
 include/linux/blkdev.h         |  5 +++--
 6 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index d5e668ec751b..3306a3c5bed6 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -132,6 +132,9 @@ static const char *const blk_op_name[] = {
 	REQ_OP_NAME(SECURE_ERASE),
 	REQ_OP_NAME(ZONE_RESET),
 	REQ_OP_NAME(ZONE_RESET_ALL),
+	REQ_OP_NAME(ZONE_OPEN),
+	REQ_OP_NAME(ZONE_CLOSE),
+	REQ_OP_NAME(ZONE_FINISH),
 	REQ_OP_NAME(WRITE_SAME),
 	REQ_OP_NAME(WRITE_ZEROES),
 	REQ_OP_NAME(SCSI_IN),
@@ -849,10 +852,10 @@ static inline int blk_partition_remap(struct bio *bio)
 		goto out;
 
 	/*
-	 * Zone reset does not include bi_size so bio_sectors() is always 0.
-	 * Include a test for the reset op code and perform the remap if needed.
+	 * Zone management bios do not have a sector count but they do have
+	 * a start sector filled out and need to be remapped.
 	 */
-	if (bio_sectors(bio) || bio_op(bio) == REQ_OP_ZONE_RESET) {
+	if (bio_sectors(bio) || op_is_zone_mgmt(bio_op(bio))) {
 		if (bio_check_eod(bio, part_nr_sects_read(p)))
 			goto out;
 		bio->bi_iter.bi_sector += p->start_sect;
@@ -936,6 +939,9 @@ generic_make_request_checks(struct bio *bio)
 			goto not_supported;
 		break;
 	case REQ_OP_ZONE_RESET:
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
 		if (!blk_queue_is_zoned(q))
 			goto not_supported;
 		break;
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 14785011e798..dab34dc48fb6 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -221,23 +221,27 @@ static inline bool blkdev_allow_reset_all_zones(struct block_device *bdev,
 }
 
 /**
- * blkdev_reset_zones - Reset zones write pointer
+ * blkdev_zone_mgmt - Execute a zone management operation on a range of zones
  * @bdev:	Target block device
- * @sector:	Start sector of the first zone to reset
- * @nr_sectors:	Number of sectors, at least the length of one zone
+ * @op:		Operation to be performed on the zones
+ * @sector:	Start sector of the first zone to operate on
+ * @nr_sectors:	Number of sectors, should be at least the length of one zone and
+ *		must be zone size aligned.
  * @gfp_mask:	Memory allocation flags (for bio_alloc)
  *
  * Description:
- *    Reset the write pointer of the zones contained in the range
+ *    Perform the specified operation on the range of zones specified by
  *    @sector..@sector+@nr_sectors. Specifying the entire disk sector range
  *    is valid, but the specified range should not contain conventional zones.
+ *    The operation to execute on each zone can be a zone reset, open, close
+ *    or finish request.
  */
-int blkdev_reset_zones(struct block_device *bdev,
-		       sector_t sector, sector_t nr_sectors,
-		       gfp_t gfp_mask)
+int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
+		     sector_t sector, sector_t nr_sectors,
+		     gfp_t gfp_mask)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-	sector_t zone_sectors;
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
 	sector_t end_sector = sector + nr_sectors;
 	struct bio *bio = NULL;
 	int ret;
@@ -248,12 +252,14 @@ int blkdev_reset_zones(struct block_device *bdev,
 	if (bdev_read_only(bdev))
 		return -EPERM;
 
+	if (!op_is_zone_mgmt(op))
+		return -EOPNOTSUPP;
+
 	if (!nr_sectors || end_sector > bdev->bd_part->nr_sects)
 		/* Out of range */
 		return -EINVAL;
 
 	/* Check alignment (handle eventual smaller last zone) */
-	zone_sectors = blk_queue_zone_sectors(q);
 	if (sector & (zone_sectors - 1))
 		return -EINVAL;
 
@@ -269,12 +275,13 @@ int blkdev_reset_zones(struct block_device *bdev,
 		 * Special case for the zone reset operation that reset all
 		 * zones, this is useful for applications like mkfs.
 		 */
-		if (blkdev_allow_reset_all_zones(bdev, sector, nr_sectors)) {
+		if (op == REQ_OP_ZONE_RESET &&
+		    blkdev_allow_reset_all_zones(bdev, sector, nr_sectors)) {
 			bio->bi_opf = REQ_OP_ZONE_RESET_ALL;
 			break;
 		}
 
-		bio->bi_opf = REQ_OP_ZONE_RESET;
+		bio->bi_opf = op;
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
@@ -287,7 +294,7 @@ int blkdev_reset_zones(struct block_device *bdev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(blkdev_reset_zones);
+EXPORT_SYMBOL_GPL(blkdev_zone_mgmt);
 
 /*
  * BLKREPORTZONE ioctl processing.
@@ -379,8 +386,8 @@ int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t mode,
 	if (copy_from_user(&zrange, argp, sizeof(struct blk_zone_range)))
 		return -EFAULT;
 
-	return blkdev_reset_zones(bdev, zrange.sector, zrange.nr_sectors,
-				  GFP_KERNEL);
+	return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+				zrange.sector, zrange.nr_sectors, GFP_KERNEL);
 }
 
 static inline unsigned long *blk_alloc_zone_bitmap(int node,
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 595a73110e17..feb4718ce6a6 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1312,9 +1312,9 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
 		struct dmz_dev *dev = zmd->dev;
 
-		ret = blkdev_reset_zones(dev->bdev,
-					 dmz_start_sect(zmd, zone),
-					 dev->zone_nr_sectors, GFP_NOIO);
+		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
+				       dmz_start_sect(zmd, zone),
+				       dev->zone_nr_sectors, GFP_NOIO);
 		if (ret) {
 			dmz_dev_err(dev, "Reset zone %u failed %d",
 				    dmz_id(zmd, zone), ret);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 808709581481..2c997f94a3b2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1771,7 +1771,8 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 			return -EIO;
 		}
 		trace_f2fs_issue_reset_zone(bdev, blkstart);
-		return blkdev_reset_zones(bdev, sector, nr_sects, GFP_NOFS);
+		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+					sector, nr_sects, GFP_NOFS);
 	}
 
 	/* For conventional zones, use regular discard if supported */
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index d688b96d1d63..805d0efa2997 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -290,6 +290,12 @@ enum req_opf {
 	REQ_OP_ZONE_RESET_ALL	= 8,
 	/* write the zero filled sector many times */
 	REQ_OP_WRITE_ZEROES	= 9,
+	/* Open a zone */
+	REQ_OP_ZONE_OPEN	= 10,
+	/* Close a zone */
+	REQ_OP_ZONE_CLOSE	= 11,
+	/* Transition a zone to full */
+	REQ_OP_ZONE_FINISH	= 12,
 
 	/* SCSI passthrough using struct scsi_request */
 	REQ_OP_SCSI_IN		= 32,
@@ -417,6 +423,25 @@ static inline bool op_is_discard(unsigned int op)
 	return (op & REQ_OP_MASK) == REQ_OP_DISCARD;
 }
 
+/*
+ * Check if a bio or request operation is a zone management operation, with
+ * the exception of REQ_OP_ZONE_RESET_ALL which is treated as a special case
+ * due to its different handling in the block layer and device response in
+ * case of command failure.
+ */
+static inline bool op_is_zone_mgmt(enum req_opf op)
+{
+	switch (op & REQ_OP_MASK) {
+	case REQ_OP_ZONE_RESET:
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static inline int op_stat_group(unsigned int op)
 {
 	if (op_is_discard(op))
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f3ea78b0c91c..bf797a63388c 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -360,8 +360,9 @@ extern unsigned int blkdev_nr_zones(struct block_device *bdev);
 extern int blkdev_report_zones(struct block_device *bdev,
 			       sector_t sector, struct blk_zone *zones,
 			       unsigned int *nr_zones);
-extern int blkdev_reset_zones(struct block_device *bdev, sector_t sectors,
-			      sector_t nr_sectors, gfp_t gfp_mask);
+extern int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
+			    sector_t sectors, sector_t nr_sectors,
+			    gfp_t gfp_mask);
 extern int blk_revalidate_disk_zones(struct gendisk *disk);
 
 extern int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

