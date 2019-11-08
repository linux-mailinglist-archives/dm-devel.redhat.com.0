Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 61EC9F3DC6
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=viGUQDqRW1VaRyLoJSB9tSaTKxL89zpqov0L1BkJqVI=;
	b=PB/mIxRZOX94CBkesWkIU1CBCfCMIzgBjf55ORqDtcq/Tf5eqamSlOlLKYZ2k3x4ZjHcGc
	zfTSQlYolEywBJGfe8TXK7YTozfQJdnIv0swaluNmBCUO8dMYlpAW4QDZQTXnkja6iNEAX
	AkdgSWLHQEE+nRApIskWBR/oSGaILbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-0bA8PuZSOwyj5N6YB_bO9w-1; Thu, 07 Nov 2019 21:00:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E81501800D99;
	Fri,  8 Nov 2019 02:00:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE21C165DB;
	Fri,  8 Nov 2019 02:00:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B413C18089CE;
	Fri,  8 Nov 2019 02:00:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81w57J000624 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B2131001DC0; Fri,  8 Nov 2019 01:58:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB8910016DA;
	Fri,  8 Nov 2019 01:58:00 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 125BB8AB253;
	Fri,  8 Nov 2019 01:57:35 +0000 (UTC)
IronPort-SDR: wliQ+uhUdpOYeLKxqRh4ahWpamFJnkJW94YVM7YD4/FY/YGnPi+o4nozUouQNB5OKJ+Mh+MYpQ
	Js5NtfmMo8WceId6bH0kyLlbpIA16C94qV1jI4ECsRk26mrUPZb8zG6Wyjmij6ZgIRjbIvPcyh
	sYg3ReMd2k82tnM0w1QZYKGyvn+oitnamf4DD8GGlopPueRwQiIAUgLAmlLe/XmzBEAgDICRDp
	tV9ysqItltmlnVRqcqaRMmLEB9Hlw6KQxS8RDNVy+dAw9BMLUxrAqLP6NxRAF17aCkUyNWLu9B
	LuY=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636903"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:44 +0800
IronPort-SDR: 5+F983oMwCLmOTrBf5kT7bnLr28SXpD/0NVp9F2u02EloDOrTDxqEVHdw43nnsfe90arQS7HUS
	tvvkVwNQvuDcDZYbuovGTpzHwb0e25bq9ZTAqw9V1l3A65eXoG179JeRtIwWKw+JvoMM0VbGPY
	6VpvBSLv24Rg+NNYDXRJx6BhO7eNDMtgqmtF+FAz/YUC+2oroL4MSSqpmM7Nj8yZSDtKhdNn7P
	43SI36kdPuHQ849Q3xnAUJMR1wymW+9DwMK3ElBxbbl0uTUO9bJTwkPXBy+CFltN+Gel2sxMi8
	WeLMoY2B2ABqLZYT8LeAZ63b
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:19 -0800
IronPort-SDR: yFxw+3zg+bWdVM0Egku9aB0+avk5K/U+jlSZuFcq5p8pgi+NK086WURpaQvdjC41VqBol0XJfF
	eOWWicAhbCgCgPjJAlEezKks83eHZd1GcNhyOkk6oyQey+NWwxMo+7OyhlDAgo+nwtDRYuu8/5
	0CMRf6E6Dapy5Nb/nR0rvlvfTaX74H1ZSHxAUqlAkNIXCImw/1kvmYL9cHClz1bL0a7sjyZh77
	O0mPWoIbknDb2a01N6G1u7Awsvu03sW3aFNGIcW87UO4xzQsfJY/3e7B2iPDwXmNjpBwIaZ5kX
	FlM=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:08 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:56 +0900
Message-Id: <20191108015702.233102-4-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 08 Nov 2019 01:57:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 08 Nov 2019 01:57:49 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/9] block: Simplify report zones execution
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0bA8PuZSOwyj5N6YB_bO9w-1
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Javier Gonzalez <javier@javigon.com>
---
 block/blk-zoned.c | 34 +++++-----------------------------
 drivers/md/dm.c   |  6 ------
 2 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 523a28d7a15c..ea4e086ba00e 100644
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
 
@@ -561,7 +537,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 
 	while (z < nr_zones) {
 		nrz = min(nr_zones - z, rep_nr_zones);
-		ret = blk_report_zones(disk, sector, zones, &nrz);
+		ret = disk->fops->report_zones(disk, sector, zones, &nrz);
 		if (ret)
 			goto out;
 		if (!nrz)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index bc143c1b2333..89189c29438f 100644
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
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

