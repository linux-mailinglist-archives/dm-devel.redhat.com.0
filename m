Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 47394E2A9D
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 08:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571899901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T2SJaciorLADupq6kZ8fvmGbUTaQsdKAUD3hOySyECQ=;
	b=I0jFpfVZwAQvlE9cTfWqqDkoMV12X1c8z+I0ZdyvjUBhZpFu4lXEhmGE9tyT5g8CAdIJkg
	O7dsklZsDI6vziccvSYKSAVQRRZD6EQmMcZOUIuFtF5I1HunLLBQ4tWkHm58OVBCXBfrBo
	1ViZKISV7VH8dtvDpBhNNggdTjj5RLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-25lz_On-PjSlGCQ5dwcPrA-1; Thu, 24 Oct 2019 02:51:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26960801E66;
	Thu, 24 Oct 2019 06:51:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E556F619C9;
	Thu, 24 Oct 2019 06:51:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 842AB4E58B;
	Thu, 24 Oct 2019 06:51:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O6pU4e013582 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 02:51:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15B7B5C22C; Thu, 24 Oct 2019 06:51:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF205C223;
	Thu, 24 Oct 2019 06:51:24 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 890A43086211;
	Thu, 24 Oct 2019 06:51:02 +0000 (UTC)
IronPort-SDR: AN5SnGE/s6N77g6KHRhbcinMSF8FuVmGoSw0+a/9IQFJXF4B/VGKXm4TlyQfopW+0LvxQOJAEC
	7tLneOBhaXFHVXllczfQNBRfUfIrYZxtYBFWjb8Dh7tvqWRjmcaUgKWhHJDsGx5YVKmr0CrKA3
	HSfchCi+CfBVRDFMapDtXywT+yKtaDqgxTG2NkMKdfGorQGf+ROFtmNQPtLikp/845B0z5hEyH
	+fmq8nTRDRK61lo7HLWWZpevTfKiJARtGFOVEDf+pK/aCC0fK45WBjG0PPtTPgemtdOZOB67rS
	b7c=
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="121990236"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2019 14:50:12 +0800
IronPort-SDR: Wl/7fSXfd9fxxTm+nOt3Rm8PIxkuL716QQKR2ntQMisvuKDg2x6j6I/hI8JUqr0rhgPjjFNJRA
	ChHn8AJ6JmwUVCvDiZxr4j1kK4rqYDD16egR/HmezvmmI7k1B4mESoewxazcGIccoVX5r4yoqQ
	dsJ98ZSpLbBAyZVLSjC+TYeeh/MiHsYA8MSPjuPzDNTp6abHT9jniDJTr9c6SM23r/EozbyhIt
	M9trKiM2FGdlNiyMP20456G+iPZxaGtcSNl1M7TsH35TfLsJ4V4kcrEDDYf6aTWToJ/Gzu0eOc
	2hTIX5SeHPS3s/+YQfOor52k
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 23:45:46 -0700
IronPort-SDR: 5azAjCD8cigXjOKs7Cl/rQN3Se/Js4dOohO58A9YRUR7oU2C34dRyIKoIkMLOwzMGv3OgccKdQ
	Ow05qDClyYr2irGim1KnasuuCnjpLX/gaWdseLr7ejPXUFotxh49/qZaQ+WU2xVP8BmNpDW2RM
	IMyFGkxZOH1wKMCW2zq2RNMGguAvEOeb+snjm0nMFI7+rvJnTgZ0PszBQAwAIJIzMEraoEEhO6
	9ZEwMEs+iUDeWtNNCHtv2F9ZA3nUreX1HvAYX9c4EUye+OjW4+VNes9knPmRRUFzgvODo1+KaG
	GzM=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2019 23:50:12 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 15:50:05 +0900
Message-Id: <20191024065006.8684-4-damien.lemoal@wdc.com>
In-Reply-To: <20191024065006.8684-1-damien.lemoal@wdc.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Thu, 24 Oct 2019 06:51:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 24 Oct 2019 06:51:14 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=193aaee55=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/4] block: Introduce report zones queue limits
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
X-MC-Unique: 25lz_On-PjSlGCQ5dwcPrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation for a generic report zones command buffer allocation to
the block layer, introduce three new request queue limits describing the
device zone descriptor size (zone_descriptor_size limit), the needed
granularity of the report zones command buffer size
(zones_report_granularity limit) and the maximum size of a report zone
command (max_zones_report_size limit).

For scsi, set these values respectively to 64 bytes, SECTOR_SIZE and
the maximum transfer size used for regular read/write commands limited
by the maximum number of pages (segments) that the hardware can map.
This removes the need for the "magic" limit implemented with the macro
SD_ZBC_REPORT_MAX_ZONES.

For the null_blk driver and dm targets, the default value of 0 is used
for these limits, indicating that these zoned devices do not need a
buffer for the execution of report zones.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-settings.c   |  3 +++
 drivers/scsi/sd_zbc.c  | 48 +++++++++++++++++++++---------------------
 include/linux/blkdev.h |  4 ++++
 3 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 5f6dcc7a47bd..674cfc428334 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -53,6 +53,9 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->discard_granularity = 0;
 	lim->discard_alignment = 0;
 	lim->discard_misaligned = 0;
+	lim->zone_descriptor_size = 0;
+	lim->zones_report_granularity = 0;
+	lim->max_zones_report_size = 0;
 	lim->logical_block_size = lim->physical_block_size = lim->io_min = 512;
 	lim->bounce_pfn = (unsigned long)(BLK_BOUNCE_ANY >> PAGE_SHIFT);
 	lim->alignment_offset = 0;
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index fbec99db6124..8dc96f4ea920 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -104,11 +104,6 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	return 0;
 }
 
-/*
- * Maximum number of zones to get with one report zones command.
- */
-#define SD_ZBC_REPORT_MAX_ZONES		8192U
-
 /**
  * Allocate a buffer for report zones reply.
  * @sdkp: The target disk
@@ -129,21 +124,8 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
 	size_t bufsize;
 	void *buf;
 
-	/*
-	 * Report zone buffer size should be at most 64B times the number of
-	 * zones requested plus the 64B reply header, but should be at least
-	 * SECTOR_SIZE for ATA devices.
-	 * Make sure that this size does not exceed the hardware capabilities.
-	 * Furthermore, since the report zone command cannot be split, make
-	 * sure that the allocated buffer can always be mapped by limiting the
-	 * number of pages allocated to the HBA max segments limit.
-	 */
-	nr_zones = min(nr_zones, SD_ZBC_REPORT_MAX_ZONES);
-	bufsize = roundup((nr_zones + 1) * 64, 512);
-	bufsize = min_t(size_t, bufsize,
-			queue_max_hw_sectors(q) << SECTOR_SHIFT);
-	bufsize = min_t(size_t, bufsize, queue_max_segments(q) << PAGE_SHIFT);
-
+	bufsize = min_t(size_t, roundup(nr_zones * 64, SECTOR_SIZE),
+			q->limits.max_zones_report_size);
 	buf = vzalloc(bufsize);
 	if (buf)
 		*buflen = bufsize;
@@ -398,6 +380,8 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
 int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 {
 	struct gendisk *disk = sdkp->disk;
+	struct request_queue *q = disk->queue;
+	unsigned int max_zones_report_size;
 	unsigned int nr_zones;
 	u32 zone_blocks = 0;
 	int ret;
@@ -423,13 +407,29 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 		goto err;
 
 	/* The drive satisfies the kernel restrictions: set it up */
-	blk_queue_chunk_sectors(sdkp->disk->queue,
+	blk_queue_chunk_sectors(q,
 			logical_to_sectors(sdkp->device, zone_blocks));
-	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, sdkp->disk->queue);
-	blk_queue_required_elevator_features(sdkp->disk->queue,
-					     ELEVATOR_F_ZBD_SEQ_WRITE);
+	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
+	blk_queue_required_elevator_features(q, ELEVATOR_F_ZBD_SEQ_WRITE);
 	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
 
+	/*
+	 * Zone descriptors are 64 bytes. A report zone buffer size should be
+	 * at most 64B times the number of zones of the device plus a 64B reply
+	 * header and should be at least be SECTOR_SIZE bytes for ATA devices.
+	 * Make sure that this maximum buffer size does not exceed the hardware
+	 * capabilities in terms of maximum data transfer size. Furthermore,
+	 * make sure that the allocated buffer can always be mapped by limiting
+	 * the number of pages of the buffer to the device max segments limit.
+	 */
+	q->limits.zone_descriptor_size = 64;
+	q->limits.zones_report_granularity = SECTOR_SIZE;
+	max_zones_report_size = min(roundup((nr_zones + 1) * 64, SECTOR_SIZE),
+				    queue_max_hw_sectors(q) << SECTOR_SHIFT);
+	q->limits.max_zones_report_size =
+		min(max_zones_report_size,
+		    (unsigned int)queue_max_segments(q) << PAGE_SHIFT);
+
 	/* READ16/WRITE16 is mandatory for ZBC disks */
 	sdkp->device->use_16_for_rw = 1;
 	sdkp->device->use_10_for_rw = 0;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f3ea78b0c91c..1c76d71fc232 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -338,6 +338,10 @@ struct queue_limits {
 	unsigned int		discard_granularity;
 	unsigned int		discard_alignment;
 
+	unsigned int		zone_descriptor_size;
+	unsigned int		zones_report_granularity;
+	unsigned int		max_zones_report_size;
+
 	unsigned short		logical_block_size;
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

