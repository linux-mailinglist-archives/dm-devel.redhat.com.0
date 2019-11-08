Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4B873F3DD1
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=veilJaq4Lynk0Wy4GvjFQFII5lD5duTL29gP51+PpCQ=;
	b=BcpktXw+eli4/E357TJBiFFYEaVbL18Su5rgxHHLhJ66kBOm0SBRYDja2xG4j4rbLGAbTg
	onWGJ/rvAtXy7dcF2of0xSJVsDYN4uAocNvrsrT9BpeQDQguQNNIk+gOULSrudO5kO2G8L
	vpFDDRbfBsYIoI5WWT+X+Bg7ps9kaCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-i7KVlqxnNr627SAeJVkxrA-1; Thu, 07 Nov 2019 21:00:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A95801FCB;
	Fri,  8 Nov 2019 02:00:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA60360CCC;
	Fri,  8 Nov 2019 02:00:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 661BB4E562;
	Fri,  8 Nov 2019 02:00:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81vlba000566 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:57:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2915360C18; Fri,  8 Nov 2019 01:57:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C55160BE1;
	Fri,  8 Nov 2019 01:57:47 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5A90C04959B;
	Fri,  8 Nov 2019 01:57:23 +0000 (UTC)
IronPort-SDR: FxfMbWJPAi5dEkwulgIR4gvHkovPsT/b6Exl2sreZLg8Rk6eY66Khq+UiwNBBFZBniGAUlWhhc
	IxSNR/PBpbehtsMy3N1IPZSgamHLgyy9jzk23zMGMGXTMh4BIyn+z65h+YPHqwN3fg37jfSzvn
	S7H/IwwjZR59Q6SQiqu0fAMh1hYOsahjqOx3nnLidts9h9mUfSh43tE5yiD6qir3KbVwmYhS+M
	3WhgnAAor0ViNrONC9pohtrVVxZv4NJHeTbI1Vy6YVtwMJZp7myfwt6AIFl1wquN4WHSsrzc2g
	WdM=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636899"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:39 +0800
IronPort-SDR: szsQAHmtp/ATxy4BrSkCZEs15zQysApnzHYFeQ++Y2o+mSGmgnWbfwiV8PP3wrGvzZXDvaAHyG
	gP0pfrA8cV3Sklz2W7ZwQNw/gkSAJ2tuGMvAbCp+wSvg3vN0wX6TpUzXykkhDrn6ARdqku5Ts8
	SSlnhE+L6tOXu+wpanJbv2FkYO1sjOMNU9xyArRu2siOv8ECbwvO2ArQQw3X2H6La8VjHo02+Y
	lMCYTyJ/PlALoZwI3KFZmdiJEzwdWXa1DMVogeD2u+mNGJRwBFE2npmenfeE0ZyOwqS0Awc0yJ
	V8JuWrBDSvzQ9MIXdREq/ULi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:16 -0800
IronPort-SDR: iiaszOVciPno9xnjy33lj7sH4PgaoQdB3jPpGiMgLenRCfImDU4YYX0adNq4qa/MasUS3AxMrG
	uNeUtRHfluKWCkZFZFCcX1EmFfh1AIP5URDztp45H8RZo8wrCl9lh0EFagxBCmZcc444TGKvxI
	p9GLCOEgh44Eof/YyehiZLLaHt/VVS1vfW8IqCfbjGyml25nMLcAFWWi4WOAdN1yBCBOhIXY2U
	QWWthrHDCP9OxZ/bdq+0HlwSllhipRT+xyo2RLTMqPl6Q3xrXzbV0v8mvlzYapZYyvGi6S6ap/
	7bY=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:05 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:54 +0900
Message-Id: <20191108015702.233102-2-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Fri, 08 Nov 2019 01:57:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 08 Nov 2019 01:57:38 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/9] block: Enhance blk_revalidate_disk_zones()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: i7KVlqxnNr627SAeJVkxrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For ZBC and ZAC zoned devices, the scsi driver revalidation processing
implemented by sd_revalidate_disk() includes a call to
sd_zbc_read_zones() which executes a full disk zone report used to
check that all zones of the disk are the same size. This processing is
followed by a call to blk_revalidate_disk_zones(), used to initialize
the device request queue zone bitmaps (zone type and zone write lock
bitmaps). To do so, blk_revalidate_disk_zones() also executes a full
device zone report to obtain zone types. As a result, the entire
zoned block device revalidation process includes two full device zone
report.

By moving the zone size checks into blk_revalidate_disk_zones(), this
process can be optimized to a single full device zone report, leading to
shorter device scan and revalidation times. This patch implements this
optimization, reducing the original full device zone report implemented
in sd_zbc_check_zones() to a single, small, report zones command
execution to obtain the size of the first zone of the device. Checks
whether all zones of the device are the same size as the first zone
size are moved to the generic blk_check_zone() function called from
blk_revalidate_disk_zones().

This optimization also has the following benefits:
1) fewer memory allocations in the scsi layer during disk revalidation
   as the potentailly large buffer for zone report execution is not
   needed.
2) Implement zone checks in a generic manner, reducing the burden on
   device driver which only need to obtain the zone size and check that
   this size is a power of 2 number of LBAs. Any new type of zoned
   block device will benefit from this.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c     |  62 +++++++++++++++++++++++-
 drivers/scsi/sd_zbc.c | 107 ++++++++----------------------------------
 2 files changed, 80 insertions(+), 89 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 481eaf7d04d4..dae787f67019 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -448,6 +448,58 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
 	q->seq_zones_wlock = NULL;
 }
 
+/*
+ * Helper function to check the validity of zones of a zoned block device.
+ */
+static bool blk_zone_valid(struct gendisk *disk, struct blk_zone *zone,
+			   sector_t *sector)
+{
+	struct request_queue *q = disk->queue;
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	sector_t capacity = get_capacity(disk);
+
+	/*
+	 * All zones must have the same size, with the exception on an eventual
+	 * smaller last zone.
+	 */
+	if (zone->start + zone_sectors < capacity &&
+	    zone->len != zone_sectors) {
+		pr_warn("%s: Invalid zoned device with non constant zone size\n",
+			disk->disk_name);
+		return false;
+	}
+
+	if (zone->start + zone->len >= capacity &&
+	    zone->len > zone_sectors) {
+		pr_warn("%s: Invalid zoned device with larger last zone size\n",
+			disk->disk_name);
+		return false;
+	}
+
+	/* Check for holes in the zone report */
+	if (zone->start != *sector) {
+		pr_warn("%s: Zone gap at sectors %llu..%llu\n",
+			disk->disk_name, *sector, zone->start);
+		return false;
+	}
+
+	/* Check zone type */
+	switch (zone->type) {
+	case BLK_ZONE_TYPE_CONVENTIONAL:
+	case BLK_ZONE_TYPE_SEQWRITE_REQ:
+	case BLK_ZONE_TYPE_SEQWRITE_PREF:
+		break;
+	default:
+		pr_warn("%s: Invalid zone type 0x%x at sectors %llu\n",
+			disk->disk_name, (int)zone->type, zone->start);
+		return false;
+	}
+
+	*sector += zone->len;
+
+	return true;
+}
+
 /**
  * blk_revalidate_disk_zones - (re)allocate and initialize zone bitmaps
  * @disk:	Target disk
@@ -497,7 +549,10 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	if (!seq_zones_bitmap)
 		goto out;
 
-	/* Get zone information and initialize seq_zones_bitmap */
+	/*
+	 * Get zone information to check the zones and initialize
+	 * seq_zones_bitmap.
+	 */
 	rep_nr_zones = nr_zones;
 	zones = blk_alloc_zones(&rep_nr_zones);
 	if (!zones)
@@ -511,11 +566,14 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 		if (!nrz)
 			break;
 		for (i = 0; i < nrz; i++) {
+			if (!blk_zone_valid(disk, &zones[i], &sector)) {
+				ret = -ENODEV;
+				goto out;
+			}
 			if (zones[i].type != BLK_ZONE_TYPE_CONVENTIONAL)
 				set_bit(z, seq_zones_bitmap);
 			z++;
 		}
-		sector += nrz * blk_queue_zone_sectors(q);
 	}
 
 	if (WARN_ON(z != nr_zones)) {
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 39f10ec0dfcf..7c4690f26698 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -339,32 +339,19 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
  * Returns the zone size in number of blocks upon success or an error code
  * upon failure.
  */
-static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
+static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
+			      u32 *zblocks)
 {
-	size_t bufsize, buflen;
-	unsigned int noio_flag;
+	size_t buflen;
 	u64 zone_blocks = 0;
-	sector_t max_lba, block = 0;
-	unsigned char *buf;
+	sector_t max_lba;
 	unsigned char *rec;
 	int ret;
-	u8 same;
-
-	/* Do all memory allocations as if GFP_NOIO was specified */
-	noio_flag = memalloc_noio_save();
 
-	/* Get a buffer */
-	buf = sd_zbc_alloc_report_buffer(sdkp, SD_ZBC_REPORT_MAX_ZONES,
-					 &bufsize);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	/* Do a report zone to get max_lba and the same field */
-	ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, 0, false);
+	/* Do a report zone to get max_lba and the size of the first zone */
+	ret = sd_zbc_do_report_zones(sdkp, buf, SD_BUF_SIZE, 0, false);
 	if (ret)
-		goto out_free;
+		return ret;
 
 	if (sdkp->rc_basis == 0) {
 		/* The max_lba field is the capacity of this device */
@@ -379,82 +366,28 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 		}
 	}
 
-	/*
-	 * Check same field: for any value other than 0, we know that all zones
-	 * have the same size.
-	 */
-	same = buf[4] & 0x0f;
-	if (same > 0) {
-		rec = &buf[64];
-		zone_blocks = get_unaligned_be64(&rec[8]);
-		goto out;
-	}
-
-	/*
-	 * Check the size of all zones: all zones must be of
-	 * equal size, except the last zone which can be smaller
-	 * than other zones.
-	 */
-	do {
-
-		/* Parse REPORT ZONES header */
-		buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64,
-			       bufsize);
-		rec = buf + 64;
-
-		/* Parse zone descriptors */
-		while (rec < buf + buflen) {
-			u64 this_zone_blocks = get_unaligned_be64(&rec[8]);
-
-			if (zone_blocks == 0) {
-				zone_blocks = this_zone_blocks;
-			} else if (this_zone_blocks != zone_blocks &&
-				   (block + this_zone_blocks < sdkp->capacity
-				    || this_zone_blocks > zone_blocks)) {
-				zone_blocks = 0;
-				goto out;
-			}
-			block += this_zone_blocks;
-			rec += 64;
-		}
-
-		if (block < sdkp->capacity) {
-			ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, block,
-						     true);
-			if (ret)
-				goto out_free;
-		}
-
-	} while (block < sdkp->capacity);
-
-out:
-	if (!zone_blocks) {
-		if (sdkp->first_scan)
-			sd_printk(KERN_NOTICE, sdkp,
-				  "Devices with non constant zone "
-				  "size are not supported\n");
-		ret = -ENODEV;
-	} else if (!is_power_of_2(zone_blocks)) {
+	/* Parse REPORT ZONES header */
+	buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64, SD_BUF_SIZE);
+	rec = buf + 64;
+	zone_blocks = get_unaligned_be64(&rec[8]);
+	if (!zone_blocks || !is_power_of_2(zone_blocks)) {
 		if (sdkp->first_scan)
 			sd_printk(KERN_NOTICE, sdkp,
 				  "Devices with non power of 2 zone "
 				  "size are not supported\n");
-		ret = -ENODEV;
-	} else if (logical_to_sectors(sdkp->device, zone_blocks) > UINT_MAX) {
+		return -ENODEV;
+	}
+
+	if (logical_to_sectors(sdkp->device, zone_blocks) > UINT_MAX) {
 		if (sdkp->first_scan)
 			sd_printk(KERN_NOTICE, sdkp,
 				  "Zone size too large\n");
-		ret = -EFBIG;
-	} else {
-		*zblocks = zone_blocks;
-		ret = 0;
+		return -EFBIG;
 	}
 
-out_free:
-	memalloc_noio_restore(noio_flag);
-	kvfree(buf);
+	*zblocks = zone_blocks;
 
-	return ret;
+	return 0;
 }
 
 int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
@@ -480,7 +413,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 	 * Check zone size: only devices with a constant zone size (except
 	 * an eventual last runt zone) that is a power of 2 are supported.
 	 */
-	ret = sd_zbc_check_zones(sdkp, &zone_blocks);
+	ret = sd_zbc_check_zones(sdkp, buf, &zone_blocks);
 	if (ret != 0)
 		goto err;
 
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

