Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 143A12257CD
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 08:35:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-MmOuPEfEPzuRE9DqcOyLaA-1; Mon, 20 Jul 2020 02:35:53 -0400
X-MC-Unique: MmOuPEfEPzuRE9DqcOyLaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D8978015F4;
	Mon, 20 Jul 2020 06:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5E42DE6F;
	Mon, 20 Jul 2020 06:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4A559A14A;
	Mon, 20 Jul 2020 06:35:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K6ZIM7003853 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 02:35:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCD8B1004C60; Mon, 20 Jul 2020 06:35:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D85F61003213
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B074B83B820
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-PKY78qYJMcG-DvNWb0ygdA-1; Mon, 20 Jul 2020 02:35:14 -0400
X-MC-Unique: PKY78qYJMcG-DvNWb0ygdA-1
Received: from [2001:4bb8:105:4a81:b96b:120c:c0c5:74fd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxP2j-0006g6-1O; Mon, 20 Jul 2020 06:12:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk
Date: Mon, 20 Jul 2020 08:12:49 +0200
Message-Id: <20200720061251.652457-2-hch@lst.de>
In-Reply-To: <20200720061251.652457-1-hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/3] block: inherit the zoned characteristics in
	blk_stack_limits
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Lift the code from device mapper into blk_stack_limits to inherity
the stacking limitations.  This ensures we do the right thing for
all stacked zoned block devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   |  1 +
 drivers/md/dm-table.c  | 19 -------------------
 include/linux/blkdev.h |  9 ++++++---
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 9a2c23cd970073..9cddbd73647405 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -609,6 +609,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 		t->chunk_sectors = min_not_zero(t->chunk_sectors,
 						b->chunk_sectors);
 
+	t->zoned = max(t->zoned, b->zoned);
 	return ret;
 }
 EXPORT_SYMBOL(blk_stack_limits);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0ea5b7367179ff..ec5364133cef7f 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -467,9 +467,6 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
 		       q->limits.logical_block_size,
 		       q->limits.alignment_offset,
 		       (unsigned long long) start << SECTOR_SHIFT);
-
-	limits->zoned = blk_queue_zoned_model(q);
-
 	return 0;
 }
 
@@ -1528,22 +1525,6 @@ int dm_calculate_queue_limits(struct dm_table *table,
 			       dm_device_name(table->md),
 			       (unsigned long long) ti->begin,
 			       (unsigned long long) ti->len);
-
-		/*
-		 * FIXME: this should likely be moved to blk_stack_limits(), would
-		 * also eliminate limits->zoned stacking hack in dm_set_device_limits()
-		 */
-		if (limits->zoned == BLK_ZONED_NONE && ti_limits.zoned != BLK_ZONED_NONE) {
-			/*
-			 * By default, the stacked limits zoned model is set to
-			 * BLK_ZONED_NONE in blk_set_stacking_limits(). Update
-			 * this model using the first target model reported
-			 * that is not BLK_ZONED_NONE. This will be either the
-			 * first target device zoned model or the model reported
-			 * by the target .io_hints.
-			 */
-			limits->zoned = ti_limits.zoned;
-		}
 	}
 
 	/*
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 06995b96e94679..67b9ccc1da3560 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -306,11 +306,14 @@ enum blk_queue_state {
 
 /*
  * Zoned block device models (zoned limit).
+ *
+ * Note: This needs to be ordered from the least to the most severe
+ * restrictions for the inheritance in blk_stack_limits() to work.
  */
 enum blk_zoned_model {
-	BLK_ZONED_NONE,	/* Regular block device */
-	BLK_ZONED_HA,	/* Host-aware zoned block device */
-	BLK_ZONED_HM,	/* Host-managed zoned block device */
+	BLK_ZONED_NONE = 0,	/* Regular block device */
+	BLK_ZONED_HA,		/* Host-aware zoned block device */
+	BLK_ZONED_HM,		/* Host-managed zoned block device */
 };
 
 struct queue_limits {
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

