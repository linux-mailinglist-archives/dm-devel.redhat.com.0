Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 32F662257CA
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 08:35:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-73-CcvPXPe2hUQTSJZwZnA-1; Mon, 20 Jul 2020 02:35:52 -0400
X-MC-Unique: 73-CcvPXPe2hUQTSJZwZnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EAC080183C;
	Mon, 20 Jul 2020 06:35:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8E473058;
	Mon, 20 Jul 2020 06:35:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E81C9A14A;
	Mon, 20 Jul 2020 06:35:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K6ZPk0003877 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 02:35:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9EFE2166BA3; Mon, 20 Jul 2020 06:35:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E57902166BA0
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9BEE856A5A
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:22 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-tKNIN7GqNQGEElNsnaaQtQ-1; Mon, 20 Jul 2020 02:35:19 -0400
X-MC-Unique: tKNIN7GqNQGEElNsnaaQtQ-1
Received: from [2001:4bb8:105:4a81:b96b:120c:c0c5:74fd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxP2k-0006gG-Ik; Mon, 20 Jul 2020 06:12:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk
Date: Mon, 20 Jul 2020 08:12:50 +0200
Message-Id: <20200720061251.652457-3-hch@lst.de>
In-Reply-To: <20200720061251.652457-1-hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/3] block: remove bdev_stack_limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This function is just a tiny wrapper around blk_stack_limit and has
two callers.  Simplify the stack a bit by open coding it in the two
callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 25 ++-----------------------
 drivers/md/dm-table.c  |  3 ++-
 include/linux/blkdev.h |  2 --
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 9cddbd73647405..8c63af7726850c 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -614,28 +614,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 }
 EXPORT_SYMBOL(blk_stack_limits);
 
-/**
- * bdev_stack_limits - adjust queue limits for stacked drivers
- * @t:	the stacking driver limits (top device)
- * @bdev:  the component block_device (bottom)
- * @start:  first data sector within component device
- *
- * Description:
- *    Merges queue limits for a top device and a block_device.  Returns
- *    0 if alignment didn't change.  Returns -1 if adding the bottom
- *    device caused misalignment.
- */
-int bdev_stack_limits(struct queue_limits *t, struct block_device *bdev,
-		      sector_t start)
-{
-	struct request_queue *bq = bdev_get_queue(bdev);
-
-	start += get_start_sect(bdev);
-
-	return blk_stack_limits(t, &bq->limits, start);
-}
-EXPORT_SYMBOL(bdev_stack_limits);
-
 /**
  * disk_stack_limits - adjust queue limits for stacked drivers
  * @disk:  MD/DM gendisk (top)
@@ -651,7 +629,8 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 {
 	struct request_queue *t = disk->queue;
 
-	if (bdev_stack_limits(&t->limits, bdev, offset >> 9) < 0) {
+	if (blk_stack_limits(&t->limits, &bdev_get_queue(bdev)->limits,
+			get_start_sect(bdev) + (offset >> 9)) < 0) {
 		char top[BDEVNAME_SIZE], bottom[BDEVNAME_SIZE];
 
 		disk_name(disk, 0, top);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index ec5364133cef7f..aac4c31cfc8498 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -458,7 +458,8 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
 		return 0;
 	}
 
-	if (bdev_stack_limits(limits, bdev, start) < 0)
+	if (blk_stack_limits(limits, &q->limits,
+			get_start_sect(bdev) + start) < 0)
 		DMWARN("%s: adding target device %s caused an alignment inconsistency: "
 		       "physical_block_size=%u, logical_block_size=%u, "
 		       "alignment_offset=%u, start=%llu",
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 67b9ccc1da3560..247b0e0a2901f0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1106,8 +1106,6 @@ extern void blk_set_default_limits(struct queue_limits *lim);
 extern void blk_set_stacking_limits(struct queue_limits *lim);
 extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			    sector_t offset);
-extern int bdev_stack_limits(struct queue_limits *t, struct block_device *bdev,
-			    sector_t offset);
 extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 			      sector_t offset);
 extern void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b);
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

