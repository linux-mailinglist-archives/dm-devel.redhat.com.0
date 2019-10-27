Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 189E5E62EF
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185281;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JbAqHhhdQ0H8hIYztD/7SDX1jaXM27mPLMI0yWEb2PQ=;
	b=aXmxu9nPIFupqrcYS8LmqjLHeNbJULWBeELLL46DJHWwNbir4sVC3iEfathJNSmOia8Ze7
	bxUZcWsEb792oqiD/GqBIf2E8XS4F8qcSkCYgAnaUaj73//r+kkN0BRkwM7ljC1ll/I0qM
	/84QPLUFuwlzNaQf8N9A+c55bnV+eJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-G7JEcIi-MTeQDBLo8RWRlA-1; Sun, 27 Oct 2019 10:07:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455C81005529;
	Sun, 27 Oct 2019 14:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D646100EA01;
	Sun, 27 Oct 2019 14:07:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B8E24EBC0;
	Sun, 27 Oct 2019 14:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE7BoL007665 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:07:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4B515B6A5; Sun, 27 Oct 2019 14:07:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E1A5B69A;
	Sun, 27 Oct 2019 14:07:07 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCEAD18C4269;
	Sun, 27 Oct 2019 14:06:42 +0000 (UTC)
IronPort-SDR: UVMH1zA//hlhloQlAXgWDWmC4aG1D6J50MB8pHB6s0nAb3BoSAOG6ugnTWTH12qM3F4LsOrq6X
	BJSozXWQn1u8sP3Z5dR+TL5pY4cXtGJiFQVtwNIii8oQhbr8xhXzxqtBezvHgMoFZUPFQrHW2u
	fLl5eVLxqnIfdkDLYed5Ci7I/2AlLQb5BuCrPRG82QzLeqG/Wp33Zeogeau29Yrh+KXyWOXZY8
	OjmI9qQwpeTDrIvXWLvpLJ67/iM3NCO9tItzNfKQI6TeU1DXF97JGB6KF9UUcexqQX98+iFTV5
	Vgw=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197765"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:06:02 +0800
IronPort-SDR: EW8Hs8t3diUzKm6qC7hOGdeqQoGW33YZBuxRWP/gANWN1qA18qWcELrgQsYqcTEANdRSU4JLtQ
	S9rNfygGWVowrNm0qaTRHHHU2fA+SN05JK2032aJxtFhDk5JUq+iotDnzQfKSp1IXo4UOL4Abf
	N5tuoGiW0Qc58badtO0Lh7HQVdR6yb5+o70yWHbwobwPcr3TusvaIhr+DUV8B9gdInHLtfljS0
	GyrIV9BLKPGhzG7DK6/y+00Z+OerrUa2xvcgkOJwte5CkuJe5sEL9se7iXyjAZpblySKD37Ime
	XBhR4dri5KtDugMrlMuTSTQH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:30 -0700
IronPort-SDR: VlrH5BzpXOv60hD7d74hyOtYP8I+naDylREX8iUfHJ4qqvNN1TorTsWgyRaYO2l6ArJp09VyG2
	9bqOl+kY3iixVs645yUz24CN1z82z2gt74Wi/2FIW06rD/CzTnrVMPqJaHBW6Wn+zgzskjL+6U
	bibOLG2q8I8k9naWFoAqlL3uFQT6NeNBhJJZRDqUyGzNWOwi0SWTXg2vVGU1Lr2A0eoROodZcZ
	OziFzm7XjpmnTPO7q89pg5dkaD2zVCSvxtcoFYALk6V8jQhH1athHyTvKOX+fCCg5VCG+O+3FV
	i1Q=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:59 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:46 +0900
Message-Id: <20191027140549.26272-6-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Sun, 27 Oct 2019 14:06:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Sun, 27 Oct 2019 14:06:57 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 5/8] block: add zone open,
	close and finish ioctl support
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
X-MC-Unique: G7JEcIi-MTeQDBLo8RWRlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ajay Joshi <ajay.joshi@wdc.com>

Introduce three new ioctl commands BLKOPENZONE, BLKCLOSEZONE and
BLKFINISHZONE to allow applications to control the condition of zones
on a zoned block device through the execution of the REQ_OP_ZONE_OPEN,
REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH operations.

Contains contributions from Matias Bjorling, Hans Holmberg,
Dmitry Fomichev, Keith Busch, Damien Le Moal and Christoph Hellwig.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
Signed-off-by: Matias Bjorling <matias.bjorling@wdc.com>
Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c             | 28 +++++++++++++++++++++++-----
 block/ioctl.c                 |  5 ++++-
 include/linux/blkdev.h        | 10 +++++-----
 include/uapi/linux/blkzoned.h | 17 ++++++++++++++---
 4 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index dab34dc48fb6..481eaf7d04d4 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -357,15 +357,16 @@ int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
 }
 
 /*
- * BLKRESETZONE ioctl processing.
+ * BLKRESETZONE, BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE ioctl processing.
  * Called from blkdev_ioctl.
  */
-int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t mode,
-			     unsigned int cmd, unsigned long arg)
+int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
+			   unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
 	struct request_queue *q;
 	struct blk_zone_range zrange;
+	enum req_opf op;
 
 	if (!argp)
 		return -EINVAL;
@@ -386,8 +387,25 @@ int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t mode,
 	if (copy_from_user(&zrange, argp, sizeof(struct blk_zone_range)))
 		return -EFAULT;
 
-	return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-				zrange.sector, zrange.nr_sectors, GFP_KERNEL);
+	switch (cmd) {
+	case BLKRESETZONE:
+		op = REQ_OP_ZONE_RESET;
+		break;
+	case BLKOPENZONE:
+		op = REQ_OP_ZONE_OPEN;
+		break;
+	case BLKCLOSEZONE:
+		op = REQ_OP_ZONE_CLOSE;
+		break;
+	case BLKFINISHZONE:
+		op = REQ_OP_ZONE_FINISH;
+		break;
+	default:
+		return -ENOTTY;
+	}
+
+	return blkdev_zone_mgmt(bdev, op, zrange.sector, zrange.nr_sectors,
+				GFP_KERNEL);
 }
 
 static inline unsigned long *blk_alloc_zone_bitmap(int node,
diff --git a/block/ioctl.c b/block/ioctl.c
index 15a0eb80ada9..8756efb1419e 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -532,7 +532,10 @@ int blkdev_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 	case BLKREPORTZONE:
 		return blkdev_report_zones_ioctl(bdev, mode, cmd, arg);
 	case BLKRESETZONE:
-		return blkdev_reset_zones_ioctl(bdev, mode, cmd, arg);
+	case BLKOPENZONE:
+	case BLKCLOSEZONE:
+	case BLKFINISHZONE:
+		return blkdev_zone_mgmt_ioctl(bdev, mode, cmd, arg);
 	case BLKGETZONESZ:
 		return put_uint(arg, bdev_zone_sectors(bdev));
 	case BLKGETNRZONES:
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bf797a63388c..dbef541c2530 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -367,8 +367,8 @@ extern int blk_revalidate_disk_zones(struct gendisk *disk);
 
 extern int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
 				     unsigned int cmd, unsigned long arg);
-extern int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t mode,
-				    unsigned int cmd, unsigned long arg);
+extern int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
+				  unsigned int cmd, unsigned long arg);
 
 #else /* CONFIG_BLK_DEV_ZONED */
 
@@ -389,9 +389,9 @@ static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
 	return -ENOTTY;
 }
 
-static inline int blkdev_reset_zones_ioctl(struct block_device *bdev,
-					   fmode_t mode, unsigned int cmd,
-					   unsigned long arg)
+static inline int blkdev_zone_mgmt_ioctl(struct block_device *bdev,
+					 fmode_t mode, unsigned int cmd,
+					 unsigned long arg)
 {
 	return -ENOTTY;
 }
diff --git a/include/uapi/linux/blkzoned.h b/include/uapi/linux/blkzoned.h
index 498eec813494..0cdef67135f0 100644
--- a/include/uapi/linux/blkzoned.h
+++ b/include/uapi/linux/blkzoned.h
@@ -120,9 +120,11 @@ struct blk_zone_report {
 };
 
 /**
- * struct blk_zone_range - BLKRESETZONE ioctl request
- * @sector: starting sector of the first zone to issue reset write pointer
- * @nr_sectors: Total number of sectors of 1 or more zones to reset
+ * struct blk_zone_range - BLKRESETZONE/BLKOPENZONE/
+ *                         BLKCLOSEZONE/BLKFINISHZONE ioctl
+ *                         requests
+ * @sector: Starting sector of the first zone to operate on.
+ * @nr_sectors: Total number of sectors of all zones to operate on.
  */
 struct blk_zone_range {
 	__u64		sector;
@@ -139,10 +141,19 @@ struct blk_zone_range {
  *                sector range. The sector range must be zone aligned.
  * @BLKGETZONESZ: Get the device zone size in number of 512 B sectors.
  * @BLKGETNRZONES: Get the total number of zones of the device.
+ * @BLKOPENZONE: Open the zones in the specified sector range.
+ *               The 512 B sector range must be zone aligned.
+ * @BLKCLOSEZONE: Close the zones in the specified sector range.
+ *                The 512 B sector range must be zone aligned.
+ * @BLKFINISHZONE: Mark the zones as full in the specified sector range.
+ *                 The 512 B sector range must be zone aligned.
  */
 #define BLKREPORTZONE	_IOWR(0x12, 130, struct blk_zone_report)
 #define BLKRESETZONE	_IOW(0x12, 131, struct blk_zone_range)
 #define BLKGETZONESZ	_IOR(0x12, 132, __u32)
 #define BLKGETNRZONES	_IOR(0x12, 133, __u32)
+#define BLKOPENZONE	_IOW(0x12, 134, struct blk_zone_range)
+#define BLKCLOSEZONE	_IOW(0x12, 135, struct blk_zone_range)
+#define BLKFINISHZONE	_IOW(0x12, 136, struct blk_zone_range)
 
 #endif /* _UAPI_BLKZONED_H */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

