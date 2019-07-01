Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA05B3DE
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 07:12:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33DDD34CF;
	Mon,  1 Jul 2019 05:11:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0828A7A4A9;
	Mon,  1 Jul 2019 05:11:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9D3D1806B15;
	Mon,  1 Jul 2019 05:11:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x615B5Zn004692 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 01:11:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E6367A4A5; Mon,  1 Jul 2019 05:11:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A467A4A9;
	Mon,  1 Jul 2019 05:11:05 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D764D20260;
	Mon,  1 Jul 2019 05:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561957853; x=1593493853;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GC4T9TT8NwGf93moEo/W7t09dhf9qp/NOqiEgDqXqhs=;
	b=Ykm9e6TyQ0hWKKiVWvnu6004bzazBDYsfGXyyB2+KuK/Z0PnBwAgFuIM
	DqNVCIijQLW2uk1Ta+3Bai6yWYAhS9aJPHh0cliK923ygvUxEHQnfYTDw
	PJ+hAzosiNhvbWlyEruZMmyjwtaafTFDY9Y7JCifphYEgNCCCbb5lnsfI
	5HZSelRwzTteR8EC0PT6u42FOrBA5dPWiErDOVVKZZIQjv9wVUo13Zaxl
	r6q5/IdIfWNAFx2OLbRSQrrCT9rbBXqkDgy010py2FjQrnz3oH/bO6W0X
	wCziJbjhCxqzt+b+6ENTPCniSTqspU2uNI0/2tNgqYn5zXZ7Iqyxtj0dw A==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="113544735"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:26 +0800
IronPort-SDR: 30yVZKOwUSpeyRzfJGzAaWic1VgWw98CNIANnmKR49S06j7pK+L5UM5txQuQ2S23WRtvK0goOY
	37RSQuC0KSeqefzwE+Oc2r8dN47zyZPQ4mYiUaMZ5NSLk3mRRATPCCi6MbnOP1f6SKiYzqXos8
	CZ039JDJCzyZ1Rv9enNcOrPjWEHu8NpUFp0RYsGgE3cSWdwfKXZ+l1wVr9OLVgEepIhaD0k7Ep
	gVnsIdktjMgIOPKfqyP2apZkETwmlP3hmCCYKRxmOcwEQsdDqtoqn0NAPV/A3NniPmvgR3wCVf
	FSPqIPtBIkzu8yGVl7TiYqWG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:26 -0700
IronPort-SDR: +tfisdmqFeqa7VyIIE5AVfkptRM1Z3BEo9ccVM+fLXh64IvuinUYshS41rMcfri7aLZfAg6aAW
	ejAaW8hFpvQSHj+2koES2DhjTRGYlMrrD1Md7io3WlnlUEA7ZSAxGFKxhK0EH+hgbXG5HxS9Jj
	y6uLJqTDWXOKEqdIB0V00m3ip3rVaWtN2HrW++bWLVZcET5DtKs261Cf/U6ujXQCRKdwuxuR8D
	v31oGUaCKCIERz7rZ9ceiWUq51wWcznLzMgXkUUziPbE7xXTNzj3rnT3kesop3CHHFVogj/uOn
	V9w=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:24 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:17 +0900
Message-Id: <20190701050918.27511-4-damien.lemoal@wdc.com>
In-Reply-To: <20190701050918.27511-1-damien.lemoal@wdc.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 01 Jul 2019 05:10:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 01 Jul 2019 05:10:52 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=078492c59=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V6 3/4] sd_zbc: Fix report zones buffer allocation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 01 Jul 2019 05:12:03 +0000 (UTC)

During disk scan and revalidation done with sd_revalidate(), the zones
of a zoned disk are checked using the helper function
blk_revalidate_disk_zones() if a configuration change is detected
(change in the number of zones or zone size). The function
blk_revalidate_disk_zones() issues report_zones calls that are very
large, that is, to obtain zone information for all zones of the disk
with a single command. The size of the report zones command buffer
necessary for such large request generally is lower than the disk
max_hw_sectors and KMALLOC_MAX_SIZE (4MB) and succeeds on boot (no
memory fragmentation), but often fail at run time (e.g. hot-plug
event). This causes the disk revalidation to fail and the disk
capacity to be changed to 0.

This problem can be avoided by using vmalloc() instead of kmalloc() for
the buffer allocation. To limit the amount of memory to be allocated,
this patch also introduces the arbitrary SD_ZBC_REPORT_MAX_ZONES
maximum number of zones to report with a single report zones command.
This limit may be lowered further to satisfy the disk max_hw_sectors
limit. Finally, to ensure that the vmalloc-ed buffer can always be
mapped in a request, the buffer size is further limited to at most
queue_max_segments() pages, allowing successful mapping of the buffer
even in the worst case scenario where none of the buffer pages are
contiguous.

Fixes: 515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
Fixes: e76239a3748c ("block: add a report_zones method")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd_zbc.c | 104 ++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 29 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index ec3764c8f3f1..db16c19e05c4 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -9,6 +9,8 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/vmalloc.h>
+#include <linux/sched/mm.h>
 
 #include <asm/unaligned.h>
 
@@ -50,7 +52,7 @@ static void sd_zbc_parse_report(struct scsi_disk *sdkp, u8 *buf,
 /**
  * sd_zbc_do_report_zones - Issue a REPORT ZONES scsi command.
  * @sdkp: The target disk
- * @buf: Buffer to use for the reply
+ * @buf: vmalloc-ed buffer to use for the reply
  * @buflen: the buffer size
  * @lba: Start LBA of the report
  * @partial: Do partial report
@@ -79,7 +81,6 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	put_unaligned_be32(buflen, &cmd[10]);
 	if (partial)
 		cmd[14] = ZBC_REPORT_ZONE_PARTIAL;
-	memset(buf, 0, buflen);
 
 	result = scsi_execute_req(sdp, cmd, DMA_FROM_DEVICE,
 				  buf, buflen, &sshdr,
@@ -103,6 +104,53 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	return 0;
 }
 
+/*
+ * Maximum number of zones to get with one report zones command.
+ */
+#define SD_ZBC_REPORT_MAX_ZONES		8192U
+
+/**
+ * Allocate a buffer for report zones reply.
+ * @sdkp: The target disk
+ * @nr_zones: Maximum number of zones to report
+ * @buflen: Size of the buffer allocated
+ *
+ * Try to allocate a reply buffer for the number of requested zones.
+ * The size of the buffer allocated may be smaller than requested to
+ * satify the device constraint (max_hw_sectors, max_segments, etc).
+ *
+ * Return the address of the allocated buffer and update @buflen with
+ * the size of the allocated buffer.
+ */
+static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
+					unsigned int nr_zones, size_t *buflen)
+{
+	struct request_queue *q = sdkp->disk->queue;
+	size_t bufsize;
+	void *buf;
+
+	/*
+	 * Report zone buffer size should be at most 64B times the number of
+	 * zones requested plus the 64B reply header, but should be at least
+	 * SECTOR_SIZE for ATA devices.
+	 * Make sure that this size does not exceed the hardware capabilities.
+	 * Furthermore, since the report zone command cannot be split, make
+	 * sure that the allocated buffer can always be mapped by limiting the
+	 * number of pages allocated to the HBA max segments limit.
+	 */
+	nr_zones = min(nr_zones, SD_ZBC_REPORT_MAX_ZONES);
+	bufsize = roundup((nr_zones + 1) * 64, 512);
+	bufsize = min_t(size_t, bufsize,
+			queue_max_hw_sectors(q) << SECTOR_SHIFT);
+	bufsize = min_t(size_t, bufsize, queue_max_segments(q) << PAGE_SHIFT);
+
+	buf = vzalloc(bufsize);
+	if (buf)
+		*buflen = bufsize;
+
+	return buf;
+}
+
 /**
  * sd_zbc_report_zones - Disk report zones operation.
  * @disk: The target disk
@@ -116,30 +164,23 @@ int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
 			struct blk_zone *zones, unsigned int *nr_zones)
 {
 	struct scsi_disk *sdkp = scsi_disk(disk);
-	unsigned int i, buflen, nrz = *nr_zones;
+	unsigned int i, nrz = *nr_zones;
 	unsigned char *buf;
-	size_t offset = 0;
+	size_t buflen = 0, offset = 0;
 	int ret = 0;
 
 	if (!sd_is_zoned(sdkp))
 		/* Not a zoned device */
 		return -EOPNOTSUPP;
 
-	/*
-	 * Get a reply buffer for the number of requested zones plus a header,
-	 * without exceeding the device maximum command size. For ATA disks,
-	 * buffers must be aligned to 512B.
-	 */
-	buflen = min(queue_max_hw_sectors(disk->queue) << 9,
-		     roundup((nrz + 1) * 64, 512));
-	buf = kmalloc(buflen, GFP_KERNEL);
+	buf = sd_zbc_alloc_report_buffer(sdkp, nrz, &buflen);
 	if (!buf)
 		return -ENOMEM;
 
 	ret = sd_zbc_do_report_zones(sdkp, buf, buflen,
 			sectors_to_logical(sdkp->device, sector), true);
 	if (ret)
-		goto out_free_buf;
+		goto out;
 
 	nrz = min(nrz, get_unaligned_be32(&buf[0]) / 64);
 	for (i = 0; i < nrz; i++) {
@@ -150,8 +191,8 @@ int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
 
 	*nr_zones = nrz;
 
-out_free_buf:
-	kfree(buf);
+out:
+	kvfree(buf);
 
 	return ret;
 }
@@ -285,8 +326,6 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
 	return 0;
 }
 
-#define SD_ZBC_BUF_SIZE 131072U
-
 /**
  * sd_zbc_check_zones - Check the device capacity and zone sizes
  * @sdkp: Target disk
@@ -302,22 +341,28 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
  */
 static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 {
+	size_t bufsize, buflen;
+	unsigned int noio_flag;
 	u64 zone_blocks = 0;
 	sector_t max_lba, block = 0;
 	unsigned char *buf;
 	unsigned char *rec;
-	unsigned int buf_len;
-	unsigned int list_length;
 	int ret;
 	u8 same;
 
+	/* Do all memory allocations as if GFP_NOIO was specified */
+	noio_flag = memalloc_noio_save();
+
 	/* Get a buffer */
-	buf = kmalloc(SD_ZBC_BUF_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	buf = sd_zbc_alloc_report_buffer(sdkp, SD_ZBC_REPORT_MAX_ZONES,
+					 &bufsize);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	/* Do a report zone to get max_lba and the same field */
-	ret = sd_zbc_do_report_zones(sdkp, buf, SD_ZBC_BUF_SIZE, 0, false);
+	ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, 0, false);
 	if (ret)
 		goto out_free;
 
@@ -353,12 +398,12 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 	do {
 
 		/* Parse REPORT ZONES header */
-		list_length = get_unaligned_be32(&buf[0]) + 64;
+		buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64,
+			       bufsize);
 		rec = buf + 64;
-		buf_len = min(list_length, SD_ZBC_BUF_SIZE);
 
 		/* Parse zone descriptors */
-		while (rec < buf + buf_len) {
+		while (rec < buf + buflen) {
 			u64 this_zone_blocks = get_unaligned_be64(&rec[8]);
 
 			if (zone_blocks == 0) {
@@ -374,8 +419,8 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 		}
 
 		if (block < sdkp->capacity) {
-			ret = sd_zbc_do_report_zones(sdkp, buf, SD_ZBC_BUF_SIZE,
-						     block, true);
+			ret = sd_zbc_do_report_zones(sdkp, buf, bufsize, block,
+						     true);
 			if (ret)
 				goto out_free;
 		}
@@ -406,7 +451,8 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, u32 *zblocks)
 	}
 
 out_free:
-	kfree(buf);
+	memalloc_noio_restore(noio_flag);
+	kvfree(buf);
 
 	return ret;
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
