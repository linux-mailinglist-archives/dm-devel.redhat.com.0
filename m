Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 419D4E2A9A
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 08:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571899886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PcL3B0ur0x8iSj8UhnYg/dcC6G+xZ9GFh1nFdHUVvLA=;
	b=L9Z6+gGgZKiXMJN/+Nfkkgs8HLK73yN87UwnSvzAEEuTn5WAQv5UB41cOPhMHxgNL+Hi5y
	Mv5W484xKTjfU5eIXYC9tjJQdgLgW/ANa53A42UoEtIKiw11+rKihm8niGphdDn7Q0O/oD
	3OQSpuBnKcdmZ6ZMVOags2ZMy7aBPqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-WGLSNLEENWaQg9jAGFeDfQ-1; Thu, 24 Oct 2019 02:51:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69DD8107AD34;
	Thu, 24 Oct 2019 06:51:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB9F60C63;
	Thu, 24 Oct 2019 06:51:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26ED81803B49;
	Thu, 24 Oct 2019 06:51:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O6p7F3013545 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 02:51:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D681E5DD73; Thu, 24 Oct 2019 06:51:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 282135D9D5;
	Thu, 24 Oct 2019 06:51:02 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDF1C3086208;
	Thu, 24 Oct 2019 06:50:38 +0000 (UTC)
IronPort-SDR: dJyGv0Aw6UsyO/v1phHweINA7JkU/dz0FQNfdyUV9eOHpgjw2sXtFRamAZOqwC07Y7ORfso7u2
	80zxdElLYPSDnnH57lmpxmcUnvG3earDRv61FcjOtRKC6c0BNZDDq5pzETgLbz+CSwR4K/2PV1
	H+twJBfsppKkrUp49hR0PjfuEa8IUmpvCknebNFXiXZe/Dw0zTf2GXB0ikaG3/QF6C1zzlgBTz
	QbxOYTAlUgagvvtSM86hMs2ap5vDZ1VSkOEJZawSksSduIJjfIV2bqGuatGdA7mt91JKAhlE6u
	of8=
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="121990226"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2019 14:50:10 +0800
IronPort-SDR: ivUp9UB/Cl2KbQWTDkOYB94zPjJYJdwbMztJcr4KsczUA2qefOffhPVlyz6Ot0jc4ORh5o6+6D
	bqdVkXKm0h+rcargVS5pMTrv7QqJOrGV4UZeIxVWk9duznWVB31hHTNSagMZgSt5OJSg6mxTpk
	QYG8RasNPiWA0XYdn7f7rsCPM1T1jHCbeRkOmest8bg5ak64OwLoo9NhxuFWC7qaEkfV/ItRTJ
	IROupg9cKnENOVXPXlsVDQmxhM76ujUEjLfSGo2VKjFEKbQfkCsdQq/qoIhui0vTbWHGhnd/jJ
	lHiyYRo0MO13zQtAbhJMeOvo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 23:45:44 -0700
IronPort-SDR: LHp3uDUqzFnLyMgJlsVKjJos8ZJrO6nC0vWLE3pP3X0fSWBU1zH1mRAeSudGT0DEEUi+qDBg+/
	0BhACu6+X9cjDdF/NFT5YdHbvxrbBjfcdsgwhDZow6pkLfL4XvMIMSOdwn8MMRYMyUaMh4KXdl
	MGc2KxH60jE5GcvW7FEChHtWSo7HKv7gRoqUwtoUZMQ5Maj+dvGur4ZTkk0jL92qfjaWiFS7r+
	1oPMNLfNOLpTI+QjMUhFCW7b/5M8b+qd0FH/u9ii5q5RWda1Ed5Q9ncdiUaDiD2JtnAsud4v2b
	Hw0=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2019 23:50:09 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 15:50:03 +0900
Message-Id: <20191024065006.8684-2-damien.lemoal@wdc.com>
In-Reply-To: <20191024065006.8684-1-damien.lemoal@wdc.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Thu, 24 Oct 2019 06:50:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 24 Oct 2019 06:50:55 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=193aaee55=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/4] block: Enhance blk_revalidate_disk_zones()
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
X-MC-Unique: WGLSNLEENWaQg9jAGFeDfQ-1
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
 block/blk-zoned.c     |  61 +++++++++++++++++++++++-
 drivers/scsi/sd_zbc.c | 107 ++++++++----------------------------------
 2 files changed, 79 insertions(+), 89 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 4bc5f260248a..293891b7068a 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -441,6 +441,57 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
 	q->seq_zones_wlock = NULL;
 }
 
+/**
+ * blk_check_zone - Check a zone information
+ * @q:		request queue
+ * @zone:	the zone to  check
+ * @sector:	start sector of the zone
+ *
+ * Helper function to check zones of a zoned block device. Returns true if the
+ * zone is correct and false if a problem is detected.
+ */
+static bool blk_check_zone(struct gendisk *disk, struct blk_zone *zone,
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
+		pr_warn("%s: Invalid zone device with non constant zone size\n",
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
@@ -490,7 +541,10 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
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
@@ -504,11 +558,14 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 		if (!nrz)
 			break;
 		for (i = 0; i < nrz; i++) {
+			if (!blk_check_zone(disk, &zones[i], &sector)) {
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
index de4019dc0f0b..fbec99db6124 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -344,32 +344,19 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
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
@@ -384,82 +371,28 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
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
@@ -485,7 +418,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 	 * Check zone size: only devices with a constant zone size (except
 	 * an eventual last runt zone) that is a power of 2 are supported.
 	 */
-	ret = sd_zbc_check_zones(sdkp, &zone_blocks);
+	ret = sd_zbc_check_zones(sdkp, buf, &zone_blocks);
 	if (ret != 0)
 		goto err;
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

