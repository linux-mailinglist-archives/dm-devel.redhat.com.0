Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 30E84F3DD0
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Um6j+B9nvtIe6pcP3LWc9ri2/20iYKa8PgGuWXfhrWk=;
	b=hXIbTbqdRw61QFCK51JvGWPOcG2WEkCQMouNqWLuTIp3ZNDds5uD8npTiyi72rBej0ijHy
	2KSXAOpFORSGreQZybAgRy/WSTBFTJtrkc25ZljnBAdtNPKvrLLJSjQHII+wGxi6CAeSpL
	3TbyGz4i4Uvze5K2bB+NYBVubhzf5K4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-ybS42WSfMs-cJXqeTtQTyg-1; Thu, 07 Nov 2019 21:00:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5192F1005509;
	Fri,  8 Nov 2019 02:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21888608B7;
	Fri,  8 Nov 2019 02:00:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6BAD18089C8;
	Fri,  8 Nov 2019 02:00:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81wGpL000655 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4A6260C18; Fri,  8 Nov 2019 01:58:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B49D60BE1;
	Fri,  8 Nov 2019 01:58:11 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E16BC3082D6B;
	Fri,  8 Nov 2019 01:57:46 +0000 (UTC)
IronPort-SDR: RloyY5KPWinguZeNPJ6CeKAurohkoz/69krElk9XVY4IUtLuTzqCVqS3tZ8F1/pibvz9XrKWiA
	LlwKYEH9LebSs8hPXDzTbOf+DxzabIuJ9Bb8YanQo/4tqQkIhAHg8wQ1ri8a2QEnolOD2Baujk
	M8c43ODCON671GComXgQE5A8R3b7RK4YpOxLkLB+Z9488IrJmxjduIzNZjxIu6JNRRgcSqe2S4
	3mvUG0sVVWVvw1xmkn0qJZ/TK9YxjhGANI2oq90aS1lBCQeKMjt76JaQzryE2Nz1+uJOiBU661
	qQg=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636905"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:46 +0800
IronPort-SDR: o4i2Ny9ut725az76AsvKCqopM0a7aU0k6z+LV3XlZqpEWzqeeJ1HqzbdOLiglprlcd9Iw99ceq
	fuVfQp/B2pvsa4XdNmhFxTJbAbZc6zuvohf3mqBzfGi043jo9U9XjErryxm+uSSAtJyx8gUZ3d
	4JyJMhPd47QvyyEQre10ZGARtHIcXvtNgWzRFI2LWRM/ui4NE1rsAaOWGMRhzPXnrbKfocIqXT
	r0tDDqNsVfLFaiOokbzVna9CVg7W1BFrxNmC9IdsdW3eNPxQ8XnPpJWKh/rrqDC8SnD/kKJ/Lt
	llYwTNGVc4whJ6FKz4GAgrus
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:21 -0800
IronPort-SDR: Ox1zP9yk0sKpZCmB3u6Su1a56RPdwvwjztqjpqOnXifRqNJCg/V4vAyTdV0Ws6lUMfSvvnYF4g
	pMef0imx/w6H0U0v2i9oJvNKhSOdXf6D0bnuc2VsfQuQFOuY8U21XBYlPGBDIY7UPBiwJ1ChQN
	KAEA/gNuUkr4cZvPmiy+4Rno45+d/HynRkWKvfhbaJd0e47hJrQhSHpouCPT7M/BYXtTihbS/C
	9TwqT07gGhSjy5uR+KUMaDRseJ2DGuZh3TLDmS6FEmZY+Sz0HZsFRxgu2sCKjnUj1zwuBB5k6J
	j38=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:10 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:57 +0900
Message-Id: <20191108015702.233102-5-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Fri, 08 Nov 2019 01:58:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 08 Nov 2019 01:58:03 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 4/9] block: Remove partition support for zoned
	block devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ybS42WSfMs-cJXqeTtQTyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No known partitioning tool supports zoned block devices, especially the
host managed flavor with strong sequential write constraints.
Furthermore, there are also no known user nor use cases for partitioned
zoned block devices.

This patch removes partition device creation for zoned block devices,
which allows simplifying the processing of zone commands for zoned
block devices. A warning is added if a partition table is found on the
device.

For report zones operations no zone sector information remapping is
necessary anymore, simplifying the code. Of note is that remapping of
zone reports for DM targets is still necessary as done by
dm_remap_zone_report().

Similarly, remaping of a zone reset bio is not necessary anymore.
Testing for the applicability of the zone reset all request also becomes
simpler and only needs to check that the number of sectors of the
requested zone range is equal to the disk capacity.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-core.c          |  6 +---
 block/blk-zoned.c         | 62 ++++++--------------------------
 block/partition-generic.c | 74 +++++----------------------------------
 drivers/md/dm.c           |  3 --
 4 files changed, 21 insertions(+), 124 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 3306a3c5bed6..df6b70476187 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -851,11 +851,7 @@ static inline int blk_partition_remap(struct bio *bio)
 	if (unlikely(bio_check_ro(bio, p)))
 		goto out;
 
-	/*
-	 * Zone management bios do not have a sector count but they do have
-	 * a start sector filled out and need to be remapped.
-	 */
-	if (bio_sectors(bio) || op_is_zone_mgmt(bio_op(bio))) {
+	if (bio_sectors(bio)) {
 		if (bio_check_eod(bio, part_nr_sects_read(p)))
 			goto out;
 		bio->bi_iter.bi_sector += p->start_sect;
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index ea4e086ba00e..ae665e490858 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -93,32 +93,10 @@ unsigned int blkdev_nr_zones(struct block_device *bdev)
 	if (!blk_queue_is_zoned(q))
 		return 0;
 
-	return __blkdev_nr_zones(q, bdev->bd_part->nr_sects);
+	return __blkdev_nr_zones(q, get_capacity(bdev->bd_disk));
 }
 EXPORT_SYMBOL_GPL(blkdev_nr_zones);
 
-/*
- * Check that a zone report belongs to this partition, and if yes, fix its start
- * sector and write pointer and return true. Return false otherwise.
- */
-static bool blkdev_report_zone(struct block_device *bdev, struct blk_zone *rep)
-{
-	sector_t offset = get_start_sect(bdev);
-
-	if (rep->start < offset)
-		return false;
-
-	rep->start -= offset;
-	if (rep->start + rep->len > bdev->bd_part->nr_sects)
-		return false;
-
-	if (rep->type == BLK_ZONE_TYPE_CONVENTIONAL)
-		rep->wp = rep->start + rep->len;
-	else
-		rep->wp -= offset;
-	return true;
-}
-
 /**
  * blkdev_report_zones - Get zones information
  * @bdev:	Target block device
@@ -140,8 +118,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	struct gendisk *disk = bdev->bd_disk;
-	unsigned int i, nrz;
-	int ret;
+	sector_t capacity = get_capacity(disk);
 
 	if (!blk_queue_is_zoned(q))
 		return -EOPNOTSUPP;
@@ -154,27 +131,14 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 	if (WARN_ON_ONCE(!disk->fops->report_zones))
 		return -EOPNOTSUPP;
 
-	if (!*nr_zones || sector >= bdev->bd_part->nr_sects) {
+	if (!*nr_zones || sector >= capacity) {
 		*nr_zones = 0;
 		return 0;
 	}
 
-	nrz = min(*nr_zones,
-		  __blkdev_nr_zones(q, bdev->bd_part->nr_sects - sector));
-	ret = disk->fops->report_zones(disk, get_start_sect(bdev) + sector,
-				       zones, &nrz);
-	if (ret)
-		return ret;
+	*nr_zones = min(*nr_zones, __blkdev_nr_zones(q, capacity - sector));
 
-	for (i = 0; i < nrz; i++) {
-		if (!blkdev_report_zone(bdev, zones))
-			break;
-		zones++;
-	}
-
-	*nr_zones = i;
-
-	return 0;
+	return disk->fops->report_zones(disk, sector, zones, nr_zones);
 }
 EXPORT_SYMBOL_GPL(blkdev_report_zones);
 
@@ -185,15 +149,11 @@ static inline bool blkdev_allow_reset_all_zones(struct block_device *bdev,
 	if (!blk_queue_zone_resetall(bdev_get_queue(bdev)))
 		return false;
 
-	if (sector || nr_sectors != part_nr_sects_read(bdev->bd_part))
-		return false;
 	/*
-	 * REQ_OP_ZONE_RESET_ALL can be executed only if the block device is
-	 * the entire disk, that is, if the blocks device start offset is 0 and
-	 * its capacity is the same as the entire disk.
+	 * REQ_OP_ZONE_RESET_ALL can be executed only if the number of sectors
+	 * of the applicable zone range is the entire disk.
 	 */
-	return get_start_sect(bdev) == 0 &&
-	       part_nr_sects_read(bdev->bd_part) == get_capacity(bdev->bd_disk);
+	return !sector && nr_sectors == get_capacity(bdev->bd_disk);
 }
 
 /**
@@ -218,6 +178,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	sector_t capacity = get_capacity(bdev->bd_disk);
 	sector_t end_sector = sector + nr_sectors;
 	struct bio *bio = NULL;
 	int ret;
@@ -231,7 +192,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 	if (!op_is_zone_mgmt(op))
 		return -EOPNOTSUPP;
 
-	if (!nr_sectors || end_sector > bdev->bd_part->nr_sects)
+	if (!nr_sectors || end_sector > capacity)
 		/* Out of range */
 		return -EINVAL;
 
@@ -239,8 +200,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 	if (sector & (zone_sectors - 1))
 		return -EINVAL;
 
-	if ((nr_sectors & (zone_sectors - 1)) &&
-	    end_sector != bdev->bd_part->nr_sects)
+	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
 		return -EINVAL;
 
 	while (sector < end_sector) {
diff --git a/block/partition-generic.c b/block/partition-generic.c
index aee643ce13d1..31bff3fb28af 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -459,56 +459,6 @@ static int drop_partitions(struct gendisk *disk, struct block_device *bdev)
 	return 0;
 }
 
-static bool part_zone_aligned(struct gendisk *disk,
-			      struct block_device *bdev,
-			      sector_t from, sector_t size)
-{
-	unsigned int zone_sectors = bdev_zone_sectors(bdev);
-
-	/*
-	 * If this function is called, then the disk is a zoned block device
-	 * (host-aware or host-managed). This can be detected even if the
-	 * zoned block device support is disabled (CONFIG_BLK_DEV_ZONED not
-	 * set). In this case, however, only host-aware devices will be seen
-	 * as a block device is not created for host-managed devices. Without
-	 * zoned block device support, host-aware drives can still be used as
-	 * regular block devices (no zone operation) and their zone size will
-	 * be reported as 0. Allow this case.
-	 */
-	if (!zone_sectors)
-		return true;
-
-	/*
-	 * Check partition start and size alignement. If the drive has a
-	 * smaller last runt zone, ignore it and allow the partition to
-	 * use it. Check the zone size too: it should be a power of 2 number
-	 * of sectors.
-	 */
-	if (WARN_ON_ONCE(!is_power_of_2(zone_sectors))) {
-		u32 rem;
-
-		div_u64_rem(from, zone_sectors, &rem);
-		if (rem)
-			return false;
-		if ((from + size) < get_capacity(disk)) {
-			div_u64_rem(size, zone_sectors, &rem);
-			if (rem)
-				return false;
-		}
-
-	} else {
-
-		if (from & (zone_sectors - 1))
-			return false;
-		if ((from + size) < get_capacity(disk) &&
-		    (size & (zone_sectors - 1)))
-			return false;
-
-	}
-
-	return true;
-}
-
 int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
 {
 	struct parsed_partitions *state = NULL;
@@ -544,6 +494,14 @@ int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
 		}
 		return -EIO;
 	}
+
+	/* Partitions are not supported on zoned block devices */
+	if (bdev_is_zoned(bdev)) {
+		pr_warn("%s: ignoring partition table on zoned block device\n",
+			disk->disk_name);
+		goto out;
+	}
+
 	/*
 	 * If any partition code tried to read beyond EOD, try
 	 * unlocking native capacity even if partition table is
@@ -607,21 +565,6 @@ int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
 			}
 		}
 
-		/*
-		 * On a zoned block device, partitions should be aligned on the
-		 * device zone size (i.e. zone boundary crossing not allowed).
-		 * Otherwise, resetting the write pointer of the last zone of
-		 * one partition may impact the following partition.
-		 */
-		if (bdev_is_zoned(bdev) &&
-		    !part_zone_aligned(disk, bdev, from, size)) {
-			printk(KERN_WARNING
-			       "%s: p%d start %llu+%llu is not zone aligned\n",
-			       disk->disk_name, p, (unsigned long long) from,
-			       (unsigned long long) size);
-			continue;
-		}
-
 		part = add_partition(disk, p, from, size,
 				     state->parts[p].flags,
 				     &state->parts[p].info);
@@ -635,6 +578,7 @@ int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
 			md_autodetect_dev(part_to_dev(part)->devt);
 #endif
 	}
+out:
 	free_partitions(state);
 	return 0;
 }
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 89189c29438f..76f4cfdd6b41 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1211,9 +1211,6 @@ EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
  * The zone descriptors obtained with a zone report indicate
  * zone positions within the underlying device of the target. The zone
  * descriptors must be remapped to match their position within the dm device.
- * The caller target should obtain the zones information using
- * blkdev_report_zones() to ensure that remapping for partition offset is
- * already handled.
  */
 void dm_remap_zone_report(struct dm_target *ti, sector_t start,
 			  struct blk_zone *zones, unsigned int *nr_zones)
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

