Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 91226E2A9B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 08:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571899888;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HA3y8hH1SoEalTXbJdYlvVGBGhRpACfAc+x5PPbg80U=;
	b=EbJI22paFhnv8R56w63pEVqyZV467QXpNZxsTmvN6rvXc19awUJUGU8luVOwoEWG5e8MdF
	M+UTqiEl0rJMsStKfAjDaPWYzO2VILIhBZ7fNIYcfUjiTkNP7t1cKk09UWEk1ILjVta/Hz
	dx2N8Cczj6pSeAbc3425eDDVz2WqX0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-A8lp1GVKMbSsuPbeOVnSgQ-1; Thu, 24 Oct 2019 02:51:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11D15F0;
	Thu, 24 Oct 2019 06:51:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 244E01001B20;
	Thu, 24 Oct 2019 06:51:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADB7F4E58A;
	Thu, 24 Oct 2019 06:51:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O6pE3c013559 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 02:51:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC72D60624; Thu, 24 Oct 2019 06:51:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A70560A97;
	Thu, 24 Oct 2019 06:51:08 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BE5489F301;
	Thu, 24 Oct 2019 06:50:47 +0000 (UTC)
IronPort-SDR: 9utUP6SYx276LvLmy5rP5kf091nbkikMIOmzqrExgQhyZUdS3C/8+vgWt47QeXxABbDo3LM7BF
	YaeN0zsyKliE1uyjQOjtEt0x6juQNGRVEp9rvIOk3ZYVQi1jU6dBahLaXPXjrjhMi7sU5QNVVN
	f/5yFcqEOhE6z9e8+7DGR3wd5BKfnFT0FMjUc9cwJh8EK1wcmVPUQQhcG1M5HcQ4nI0l5SL3bl
	HdlsVQc68TfrZzRpyvC3A6UDXF96ORrhjhkMEPwLH04xyBX1hJYwKEDFFmZDCDFa5ZtD50pyXw
	3Dk=
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="121990231"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2019 14:50:11 +0800
IronPort-SDR: d3h0ql2jwU/bjg3e/D2xrO+TrdaDWRGdB2BJQcB+S5ks19aC6yTUyawnWba3B76IXSSZ3DzygK
	X6DhMCDqUfXAaqyyBRVc8eEcqfPdC4ghqfjJainMqN+yGDotqnNP6q8JoGsUbxRCjDcDsacLiH
	zEyMtphXp/0WbQSG/Y9mYoODs1mWBGPLDqLYwpTGaT8fqz9vo0O0ZUZKUtdOZtTLyhnzQ8SFg0
	9Svv5+b6g71M2LcbKw/F9Rcs9O0gP5VwV+2AA2cHtSuOgziuJh5cqICI5S0WWq2n4mjQJNctN1
	DRUq6utWt/GyJsegFY2582aN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 23:45:45 -0700
IronPort-SDR: 4AH0G2XIbt+AvAxtk3oEXk00PRFzqVbQCuknzEFj0EmBI3QgaUYBstAjsvfT84Up7SsyL0nkm3
	TiT63dkym69hGQsjh+UvwBccUUVwARmOgwuiDEO2dTYSyjwmf1Uygt2NPd5dPixweVA3s7w5Ji
	lTLBAcCCvUky7KOyqb2pARcTsG56Dp7sHB/FE+S69xLo6SNIenl9Wrxgxbk+U8Nm5fPPFTxFM7
	UaLc2j/6hwV9SSKpoboHLskEXb7nwn5Y8MHiVauzanZfTfZgfnnua6SbEgXKNn2o8gR3+fdgJU
	uw8=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2019 23:50:11 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 15:50:04 +0900
Message-Id: <20191024065006.8684-3-damien.lemoal@wdc.com>
In-Reply-To: <20191024065006.8684-1-damien.lemoal@wdc.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Thu, 24 Oct 2019 06:51:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Thu, 24 Oct 2019 06:51:00 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=193aaee55=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/4] block: Simplify report zones execution
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
X-MC-Unique: A8lp1GVKMbSsuPbeOVnSgQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All kernel users of blkdev_report_zones() as well as applications use
through ioctl(BLKZONEREPORT) expect to potentially get less zone
descriptors than requested. As such, the use of the internal report
zones command execution loop implemented by blk_report_zones() is
not necessary and can even be harmful to performance by causing the
execution of inefficient small zones report command to service the
reminder of a requested zone array.

This patch removes blk_report_zones(), simplifying the code. Also
remove a now incorrect comment in dm_blk_report_zones().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c | 34 +++++-----------------------------
 drivers/md/dm.c   |  6 ------
 2 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 293891b7068a..43bfd1be0985 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -119,31 +119,6 @@ static bool blkdev_report_zone(struct block_device *bdev, struct blk_zone *rep)
 	return true;
 }
 
-static int blk_report_zones(struct gendisk *disk, sector_t sector,
-			    struct blk_zone *zones, unsigned int *nr_zones)
-{
-	struct request_queue *q = disk->queue;
-	unsigned int z = 0, n, nrz = *nr_zones;
-	sector_t capacity = get_capacity(disk);
-	int ret;
-
-	while (z < nrz && sector < capacity) {
-		n = nrz - z;
-		ret = disk->fops->report_zones(disk, sector, &zones[z], &n);
-		if (ret)
-			return ret;
-		if (!n)
-			break;
-		sector += blk_queue_zone_sectors(q) * n;
-		z += n;
-	}
-
-	WARN_ON(z > *nr_zones);
-	*nr_zones = z;
-
-	return 0;
-}
-
 /**
  * blkdev_report_zones - Get zones information
  * @bdev:	Target block device
@@ -164,6 +139,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 			struct blk_zone *zones, unsigned int *nr_zones)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
+	struct gendisk *disk = bdev->bd_disk;
 	unsigned int i, nrz;
 	int ret;
 
@@ -175,7 +151,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 	 * report_zones method. If it does not have one defined, the device
 	 * driver has a bug. So warn about that.
 	 */
-	if (WARN_ON_ONCE(!bdev->bd_disk->fops->report_zones))
+	if (WARN_ON_ONCE(!disk->fops->report_zones))
 		return -EOPNOTSUPP;
 
 	if (!*nr_zones || sector >= bdev->bd_part->nr_sects) {
@@ -185,8 +161,8 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 
 	nrz = min(*nr_zones,
 		  __blkdev_nr_zones(q, bdev->bd_part->nr_sects - sector));
-	ret = blk_report_zones(bdev->bd_disk, get_start_sect(bdev) + sector,
-			       zones, &nrz);
+	ret = disk->fops->report_zones(disk, get_start_sect(bdev) + sector,
+				       zones, &nrz);
 	if (ret)
 		return ret;
 
@@ -552,7 +528,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 
 	while (z < nr_zones) {
 		nrz = min(nr_zones - z, rep_nr_zones);
-		ret = blk_report_zones(disk, sector, zones, &nrz);
+		ret = disk->fops->report_zones(disk, sector, zones, &nrz);
 		if (ret)
 			goto out;
 		if (!nrz)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1a5e328c443a..647aa5b0233b 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -473,12 +473,6 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 		goto out;
 	}
 
-	/*
-	 * blkdev_report_zones() will loop and call this again to cover all the
-	 * zones of the target, eventually moving on to the next target.
-	 * So there is no need to loop here trying to fill the entire array
-	 * of zones.
-	 */
 	ret = tgt->type->report_zones(tgt, sector, zones, nr_zones);
 
 out:
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

