Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC85B3DB
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 07:11:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC0CA3082A8F;
	Mon,  1 Jul 2019 05:11:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4729A38E32;
	Mon,  1 Jul 2019 05:11:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9B321806B15;
	Mon,  1 Jul 2019 05:11:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x615BF0b004810 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 01:11:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D69D37A49A; Mon,  1 Jul 2019 05:11:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A650D7A4A9;
	Mon,  1 Jul 2019 05:11:11 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9839081F01;
	Mon,  1 Jul 2019 05:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561957858; x=1593493858;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=fiT0Q2RZAIaTc+o8PPq09fvwdcfYZE72CFvMQOosU9c=;
	b=mx/ZlK8XVf/WM14sZEXBc3z7zhzvUyhRRZMh5/FX+vDLKMfYiPxHpeAD
	8hQI2YiQBS9EJvX4Hr5wNpsxxvKviXXcHYYkVSlDZnRpFbg3K/vN5f580
	lw9AgMH5vl6pD75e0oDC8MouD3xeHjWRzf6dQFJ8qdCPeDh0+kwhli4i7
	KFtIEqwI/UNmxoiBdl68Ikg3jfHSkYBa1OUnG5hnENmuCkpC3vWTHQFyn
	z9YV/6+PqD20iCDNaDVyzDrxBo9QyXer1IbvTcl0stKD3TAbekwOck47j
	QzVafLW1qWP4e4P70UhBu5sJWP0LcSqBzkSkLQKVuvbu5SzELw7aaCp+h g==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="113544736"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:28 +0800
IronPort-SDR: elewWRdst7hsMed6UTiTowZAbBN5/Mp8X+haZk+q4OMFEukn9ltvJ9v7kfX8clr7wtsy9OO6K6
	bhLgYk25XTJk5674RG2qKxsv5XbG5uyqL+sjOAjaZqY8FySgtVfZF+qacoc/YUDIL+IeFW6mCE
	EhzEzFdu9axs2uKujZQ3pDR2SQOiTrHPHQeuhlWplso/0PUjzGmqAwjJ1d201/R84YleSGkhW5
	0O6swomj7+jwk0ZK0yKSvVefmlJTpxwbM8TYNsCY37WGHabT/iyWTqLbElG7mLFiYhitwr/3kB
	FnvNwUB+TESBBijzfL5FDkh3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:28 -0700
IronPort-SDR: nW2I57e363zZy8ypwNj+v+eT0Z8Wy9I3uEUEDqVyL2t8v0jXQ7XAx1XyWcfk1eFd9+9RFQB592
	QiA4zT7SbZeEzOcFj0coze4NDQZYsLK8U0dcJw/arh2P8QvIV05+/CsXSgN5psbs8ptf6Hom4w
	gHpgdM3tby0LsTxJqHtCvVG29jknMcWCH2j6Li8+n7TlrHApYGDYrbSG9WzBR4OqWV3AQRHUYq
	LoKfVoevMDObQmmSzKKWOeAgSb/r69E0xBFJjQdSIWlshpY0ySpNrz7BT7Vr35a4TskJUcsc0Z
	1Ww=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:26 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:18 +0900
Message-Id: <20190701050918.27511-5-damien.lemoal@wdc.com>
In-Reply-To: <20190701050918.27511-1-damien.lemoal@wdc.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 01 Jul 2019 05:10:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 01 Jul 2019 05:10:57 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=078492c59=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V6 4/4] block: Limit zone array allocation size
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 05:11:54 +0000 (UTC)

Limit the size of the struct blk_zone array used in
blk_revalidate_disk_zones() to avoid memory allocation failures leading
to disk revalidation failure. Also further reduce the likelyhood of
such failures by using kvcalloc() (that is vmalloc()) instead of
allocating contiguous pages with alloc_pages().

Fixes: 515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
Fixes: e76239a3748c ("block: add a report_zones method")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c      | 36 ++++++++++++++++++++----------------
 include/linux/blkdev.h |  5 +++++
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 60dfc3f22350..79ad269b545d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -14,6 +14,8 @@
 #include <linux/rbtree.h>
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
 #include <linux/sched/mm.h>
 
 #include "blk.h"
@@ -371,22 +373,25 @@ static inline unsigned long *blk_alloc_zone_bitmap(int node,
  * Allocate an array of struct blk_zone to get nr_zones zone information.
  * The allocated array may be smaller than nr_zones.
  */
-static struct blk_zone *blk_alloc_zones(int node, unsigned int *nr_zones)
+static struct blk_zone *blk_alloc_zones(unsigned int *nr_zones)
 {
-	size_t size = *nr_zones * sizeof(struct blk_zone);
-	struct page *page;
-	int order;
-
-	for (order = get_order(size); order >= 0; order--) {
-		page = alloc_pages_node(node, GFP_NOIO | __GFP_ZERO, order);
-		if (page) {
-			*nr_zones = min_t(unsigned int, *nr_zones,
-				(PAGE_SIZE << order) / sizeof(struct blk_zone));
-			return page_address(page);
-		}
+	struct blk_zone *zones;
+	size_t nrz = min(*nr_zones, BLK_ZONED_REPORT_MAX_ZONES);
+
+	/*
+	 * GFP_KERNEL here is meaningless as the caller task context has
+	 * the PF_MEMALLOC_NOIO flag set in blk_revalidate_disk_zones()
+	 * with memalloc_noio_save().
+	 */
+	zones = kvcalloc(nrz, sizeof(struct blk_zone), GFP_KERNEL);
+	if (!zones) {
+		*nr_zones = 0;
+		return NULL;
 	}
 
-	return NULL;
+	*nr_zones = nrz;
+
+	return zones;
 }
 
 void blk_queue_free_zone_bitmaps(struct request_queue *q)
@@ -448,7 +453,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 
 	/* Get zone information and initialize seq_zones_bitmap */
 	rep_nr_zones = nr_zones;
-	zones = blk_alloc_zones(q->node, &rep_nr_zones);
+	zones = blk_alloc_zones(&rep_nr_zones);
 	if (!zones)
 		goto out;
 
@@ -487,8 +492,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 out:
 	memalloc_noio_restore(noio_flag);
 
-	free_pages((unsigned long)zones,
-		   get_order(rep_nr_zones * sizeof(struct blk_zone)));
+	kvfree(zones);
 	kfree(seq_zones_wlock);
 	kfree(seq_zones_bitmap);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 472ba74ca968..5ace0bb77213 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -344,6 +344,11 @@ struct queue_limits {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
+/*
+ * Maximum number of zones to report with a single report zones command.
+ */
+#define BLK_ZONED_REPORT_MAX_ZONES	8192U
+
 extern unsigned int blkdev_nr_zones(struct block_device *bdev);
 extern int blkdev_report_zones(struct block_device *bdev,
 			       sector_t sector, struct blk_zone *zones,
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
