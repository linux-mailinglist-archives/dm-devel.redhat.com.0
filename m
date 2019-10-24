Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DA5B9E2A9E
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 08:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571899905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=utb2hT/wxado02hLrNIW1iO5ggS2V1MDz0fZJsTzEb8=;
	b=eK41jMX/eF3rvvlediEXIcVHtMqgysE5wo25A/KiXkTr292VkkmZmtaLt2ItyCPJmPJRZ5
	Rwk3k/Yuz+9WF7/nGc0FLNe+5fwB12vR3R/rFinvyzyVReRWK05nqeR/peJN+Mv7GWLGTk
	BIQq+PEDviAR6jE4udZYok7xXTQPwFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-ezsYbX9mNSqeDtRuXSo4SA-1; Thu, 24 Oct 2019 02:51:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 069921005516;
	Thu, 24 Oct 2019 06:51:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF896600C4;
	Thu, 24 Oct 2019 06:51:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 700234E58C;
	Thu, 24 Oct 2019 06:51:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O6pZCZ013595 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 02:51:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 341373CC8; Thu, 24 Oct 2019 06:51:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4FAC52CD;
	Thu, 24 Oct 2019 06:51:30 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9942CA3CD7C;
	Thu, 24 Oct 2019 06:51:08 +0000 (UTC)
IronPort-SDR: zt2RcS/jWScjx4LuTST9hG97UneOEGhAzOc5DHOhDvgxJqNZtiYC+ovBp0IV6cxl6nR4Wr/1kN
	SXm19emTI5XWEN8ZP1mR6mw28l1VX3rCVkuelUijoilg8BgLW+ADNNy7jX4GSu0uP1G+5XfoaG
	TgI53P8Gw5MY9OPanr86u4JPsySIHW8IFM/stHoGDl5aLL6xZooNF54GzNFww2eIB5QyzmDeLu
	VfT5esaUPKE7Xi+GX2Oyw0nePQyA4acxAX5BWeuOicZeABZMOgD+Dw7Px7l8ueLS/juSdheYA3
	3jo=
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="121990238"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2019 14:50:13 +0800
IronPort-SDR: 3Xtxxbx1+OBtY4EaTmzot+s/6avFXipZS67rZ8ZYePiScO79WKhisRi82W7huj3EKdJCo7whE1
	IP3KU02CfDVTgmzk8dNmD33Q7gjYe9GFBYdABTumUF29EfjXPpYUD3F7zdxhVBQ0GT0RS+e49v
	TiVnDB8UZ8iC4wAD8n4owQazKBdqrNpN2Kbd49/VoAk1ddwRMihCXoqpy7PV8B2POH8zjPwHW0
	bBvrIYCFznRhh7e28aNwl0fiEYjVy1azTmfPS38u5PxgbXrCJcAXdt44msixnjtmlYDg/V2ZjQ
	iJ8in9dBX18LWtodNNpdLZyj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 23:45:48 -0700
IronPort-SDR: HTqiZCOeiYZCHPSRut58y3gFFtxto1dBrACGXxsFe12SKoGVKgzLbiXVi3WRC7+qXejK7jszpP
	m2RM2/Slv1siWHXFKbZYzWO3khY+nFFYsB6zOa+UxuZGL4MoxYOZkj5eSxvUFWOqhqL+cOQNKU
	u1HCov0hj/V2CXKLHYWNQQWLTLTxIVwN2PhNOO4+nQ5SiVgVYD+8E8KFgbdtKASJVSivm5XWRG
	23M1uCuLzWrOlfRHlmtY433ssSgXASGiq4CS/feCfoXhacAZLca/hqBMpzhD+tKBQRPqWR0WSJ
	ieQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2019 23:50:13 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 15:50:06 +0900
Message-Id: <20191024065006.8684-5-damien.lemoal@wdc.com>
In-Reply-To: <20191024065006.8684-1-damien.lemoal@wdc.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Thu, 24 Oct 2019 06:51:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Thu, 24 Oct 2019 06:51:18 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=193aaee55=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 4/4] block: Generically handle report zones buffer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ezsYbX9mNSqeDtRuXSo4SA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of relying on a zoned block device driver to allocate a buffer
for every execution of a report zones command execution, rely on the
block layer use of the device zone report queue limits to allocate a
buffer and keep it around when the device report_zones method is
executed in a loop, e.g.  as in blk_revalidate_disk_zones().

This simplifies the code in the scsi sd_zbc driver as well as simplify
the addition of zone supports for upcoming new zoned device drivers.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c              | 99 ++++++++++++++++++++--------------
 drivers/block/null_blk.h       |  6 ++-
 drivers/block/null_blk_zoned.c |  3 +-
 drivers/md/dm.c                |  3 +-
 drivers/scsi/sd.h              |  3 +-
 drivers/scsi/sd_zbc.c          | 61 ++++++---------------
 include/linux/blkdev.h         |  8 +--
 7 files changed, 88 insertions(+), 95 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 43bfd1be0985..6bddaa505df0 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -97,6 +97,29 @@ unsigned int blkdev_nr_zones(struct block_device *bdev)
 }
 EXPORT_SYMBOL_GPL(blkdev_nr_zones);
 
+/*
+ * Allocate a buffer to execute report zones.
+ */
+static void *blk_alloc_report_buffer(struct request_queue *q,
+				     unsigned int *nr_zones, size_t *buflen)
+{
+	unsigned int nrz = *nr_zones;
+	size_t bufsize = nrz * q->limits.zone_descriptor_size;
+	void *buf;
+
+	if (q->limits.zones_report_granularity)
+		bufsize = roundup(bufsize, q->limits.zones_report_granularity);
+	bufsize = min_t(size_t, bufsize, q->limits.max_zones_report_size);
+	buf = vzalloc(bufsize);
+	if (buf) {
+		*buflen = bufsize;
+		*nr_zones = min_t(unsigned int, nrz,
+				  bufsize / q->limits.zone_descriptor_size);
+	}
+
+	return buf;
+}
+
 /*
  * Check that a zone report belongs to this partition, and if yes, fix its start
  * sector and write pointer and return true. Return false otherwise.
@@ -140,7 +163,10 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 	struct gendisk *disk = bdev->bd_disk;
-	unsigned int i, nrz;
+	unsigned int i, nrz = *nr_zones;
+	sector_t capacity = bdev->bd_part->nr_sects;
+	size_t buflen = 0;
+	void *buf = NULL;
 	int ret;
 
 	if (!blk_queue_is_zoned(q))
@@ -154,27 +180,33 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 	if (WARN_ON_ONCE(!disk->fops->report_zones))
 		return -EOPNOTSUPP;
 
-	if (!*nr_zones || sector >= bdev->bd_part->nr_sects) {
+	if (!nrz || sector >= capacity) {
 		*nr_zones = 0;
 		return 0;
 	}
 
-	nrz = min(*nr_zones,
-		  __blkdev_nr_zones(q, bdev->bd_part->nr_sects - sector));
-	ret = disk->fops->report_zones(disk, get_start_sect(bdev) + sector,
-				       zones, &nrz);
+	nrz = min(nrz, __blkdev_nr_zones(q, capacity - sector));
+	if (q->limits.zone_descriptor_size) {
+		buf = blk_alloc_report_buffer(q, &nrz, &buflen);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	ret = disk->fops->report_zones(disk, sector, zones, &nrz, buf, buflen);
 	if (ret)
-		return ret;
+		goto out;
 
 	for (i = 0; i < nrz; i++) {
 		if (!blkdev_report_zone(bdev, zones))
 			break;
 		zones++;
 	}
-
 	*nr_zones = i;
 
-	return 0;
+out:
+	kvfree(buf);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(blkdev_report_zones);
 
@@ -384,31 +416,6 @@ static inline unsigned long *blk_alloc_zone_bitmap(int node,
 			    GFP_NOIO, node);
 }
 
-/*
- * Allocate an array of struct blk_zone to get nr_zones zone information.
- * The allocated array may be smaller than nr_zones.
- */
-static struct blk_zone *blk_alloc_zones(unsigned int *nr_zones)
-{
-	struct blk_zone *zones;
-	size_t nrz = min(*nr_zones, BLK_ZONED_REPORT_MAX_ZONES);
-
-	/*
-	 * GFP_KERNEL here is meaningless as the caller task context has
-	 * the PF_MEMALLOC_NOIO flag set in blk_revalidate_disk_zones()
-	 * with memalloc_noio_save().
-	 */
-	zones = kvcalloc(nrz, sizeof(struct blk_zone), GFP_KERNEL);
-	if (!zones) {
-		*nr_zones = 0;
-		return NULL;
-	}
-
-	*nr_zones = nrz;
-
-	return zones;
-}
-
 void blk_queue_free_zone_bitmaps(struct request_queue *q)
 {
 	kfree(q->seq_zones_bitmap);
@@ -482,10 +489,12 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	struct request_queue *q = disk->queue;
 	unsigned int nr_zones = __blkdev_nr_zones(q, get_capacity(disk));
 	unsigned long *seq_zones_wlock = NULL, *seq_zones_bitmap = NULL;
-	unsigned int i, rep_nr_zones = 0, z = 0, nrz;
+	unsigned int i, rep_nr_zones, z = 0, nrz;
 	struct blk_zone *zones = NULL;
 	unsigned int noio_flag;
 	sector_t sector = 0;
+	size_t buflen = 0;
+	void *buf = NULL;
 	int ret = 0;
 
 	/*
@@ -518,17 +527,28 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 		goto out;
 
 	/*
-	 * Get zone information to check the zones and initialize
-	 * seq_zones_bitmap.
+	 * Allocate a report buffer for the driver execution of report zones
+	 * and an array of zones to get the report back.
 	 */
 	rep_nr_zones = nr_zones;
-	zones = blk_alloc_zones(&rep_nr_zones);
+	if (q->limits.zone_descriptor_size) {
+		buf = blk_alloc_report_buffer(q, &rep_nr_zones, &buflen);
+		if (!buf)
+			goto out;
+	}
+
+	zones = kvcalloc(rep_nr_zones, sizeof(struct blk_zone), GFP_KERNEL);
 	if (!zones)
 		goto out;
 
+	/*
+	 * Get zone information to check the zones and initialize
+	 * seq_zones_bitmap.
+	 */
 	while (z < nr_zones) {
 		nrz = min(nr_zones - z, rep_nr_zones);
-		ret = disk->fops->report_zones(disk, sector, zones, &nrz);
+		ret = disk->fops->report_zones(disk, sector, zones, &nrz,
+					       buf, buflen);
 		if (ret)
 			goto out;
 		if (!nrz)
@@ -565,6 +585,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	memalloc_noio_restore(noio_flag);
 
 	kvfree(zones);
+	kvfree(buf);
 	kfree(seq_zones_wlock);
 	kfree(seq_zones_bitmap);
 
diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
index 93c2a3d403da..6bd0482ec683 100644
--- a/drivers/block/null_blk.h
+++ b/drivers/block/null_blk.h
@@ -92,7 +92,8 @@ struct nullb {
 int null_zone_init(struct nullb_device *dev);
 void null_zone_exit(struct nullb_device *dev);
 int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones);
+		     struct blk_zone *zones, unsigned int *nr_zones,
+		     void *buf, size_t buflen);
 blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 				enum req_opf op, sector_t sector,
 				sector_t nr_sectors);
@@ -107,7 +108,8 @@ static inline int null_zone_init(struct nullb_device *dev)
 static inline void null_zone_exit(struct nullb_device *dev) {}
 static inline int null_zone_report(struct gendisk *disk, sector_t sector,
 				   struct blk_zone *zones,
-				   unsigned int *nr_zones)
+				   unsigned int *nr_zones,
+				   void *buf, size_t buflen)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zoned.c
index 4e56b17ed3ef..446e083be240 100644
--- a/drivers/block/null_blk_zoned.c
+++ b/drivers/block/null_blk_zoned.c
@@ -67,7 +67,8 @@ void null_zone_exit(struct nullb_device *dev)
 }
 
 int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones)
+		     struct blk_zone *zones, unsigned int *nr_zones,
+		     void *buf, size_t buflen)
 {
 	struct nullb *nullb = disk->private_data;
 	struct nullb_device *dev = nullb->dev;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 647aa5b0233b..5d5a297ceeb1 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -441,7 +441,8 @@ static int dm_blk_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 }
 
 static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones)
+			       struct blk_zone *zones, unsigned int *nr_zones,
+			       void *buf, size_t buflen)
 {
 #ifdef CONFIG_BLK_DEV_ZONED
 	struct mapped_device *md = disk->private_data;
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 1eab779f812b..b948656b6882 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -213,7 +213,8 @@ extern blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd, bool all);
 extern void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 			    struct scsi_sense_hdr *sshdr);
 extern int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
-			       struct blk_zone *zones, unsigned int *nr_zones);
+			       struct blk_zone *zones, unsigned int *nr_zones,
+			       void *buf, size_t buflen);
 
 #else /* CONFIG_BLK_DEV_ZONED */
 
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 8dc96f4ea920..228522c4338f 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -104,35 +104,6 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	return 0;
 }
 
-/**
- * Allocate a buffer for report zones reply.
- * @sdkp: The target disk
- * @nr_zones: Maximum number of zones to report
- * @buflen: Size of the buffer allocated
- *
- * Try to allocate a reply buffer for the number of requested zones.
- * The size of the buffer allocated may be smaller than requested to
- * satify the device constraint (max_hw_sectors, max_segments, etc).
- *
- * Return the address of the allocated buffer and update @buflen with
- * the size of the allocated buffer.
- */
-static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
-					unsigned int nr_zones, size_t *buflen)
-{
-	struct request_queue *q = sdkp->disk->queue;
-	size_t bufsize;
-	void *buf;
-
-	bufsize = min_t(size_t, roundup(nr_zones * 64, SECTOR_SIZE),
-			q->limits.max_zones_report_size);
-	buf = vzalloc(bufsize);
-	if (buf)
-		*buflen = bufsize;
-
-	return buf;
-}
-
 /**
  * sd_zbc_report_zones - Disk report zones operation.
  * @disk: The target disk
@@ -143,40 +114,40 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
  * Execute a report zones command on the target disk.
  */
 int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
-			struct blk_zone *zones, unsigned int *nr_zones)
+			struct blk_zone *zones, unsigned int *nr_zones,
+			void *buf, size_t buflen)
 {
 	struct scsi_disk *sdkp = scsi_disk(disk);
 	unsigned int i, nrz = *nr_zones;
-	unsigned char *buf;
-	size_t buflen = 0, offset = 0;
-	int ret = 0;
+	unsigned char *rep_buf = buf;
+	size_t offset = 0;
+	int ret;
 
 	if (!sd_is_zoned(sdkp))
 		/* Not a zoned device */
 		return -EOPNOTSUPP;
 
-	buf = sd_zbc_alloc_report_buffer(sdkp, nrz, &buflen);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = sd_zbc_do_report_zones(sdkp, buf, buflen,
+	/*
+	 * The buffer prepared by the block layer may be too large for the
+	 * number of zones requested. Tune it here to avoid requesting too
+	 * many zones than necessary.
+	 */
+	buflen = min_t(size_t, roundup((nrz + 1) * 64, SECTOR_SIZE), buflen);
+	ret = sd_zbc_do_report_zones(sdkp, rep_buf, buflen,
 			sectors_to_logical(sdkp->device, sector), true);
 	if (ret)
-		goto out;
+		return ret;
 
-	nrz = min(nrz, get_unaligned_be32(&buf[0]) / 64);
+	nrz = min(nrz, get_unaligned_be32(&rep_buf[0]) / 64);
 	for (i = 0; i < nrz; i++) {
 		offset += 64;
-		sd_zbc_parse_report(sdkp, buf + offset, zones);
+		sd_zbc_parse_report(sdkp, rep_buf + offset, zones);
 		zones++;
 	}
 
 	*nr_zones = nrz;
 
-out:
-	kvfree(buf);
-
-	return ret;
+	return 0;
 }
 
 /**
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 1c76d71fc232..f04927a7fb40 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -355,11 +355,6 @@ struct queue_limits {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
-/*
- * Maximum number of zones to report with a single report zones command.
- */
-#define BLK_ZONED_REPORT_MAX_ZONES	8192U
-
 extern unsigned int blkdev_nr_zones(struct block_device *bdev);
 extern int blkdev_report_zones(struct block_device *bdev,
 			       sector_t sector, struct blk_zone *zones,
@@ -1713,7 +1708,8 @@ struct block_device_operations {
 	/* this callback is with swap_lock and sometimes page table lock held */
 	void (*swap_slot_free_notify) (struct block_device *, unsigned long);
 	int (*report_zones)(struct gendisk *, sector_t sector,
-			    struct blk_zone *zones, unsigned int *nr_zones);
+			    struct blk_zone *zones, unsigned int *nr_zones,
+			    void *buf, size_t buflen);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 };
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

