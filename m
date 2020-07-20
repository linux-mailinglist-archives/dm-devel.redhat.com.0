Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1B52257CB
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 08:35:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-3dIEBAxiMAa0WOCkCPDOHg-1; Mon, 20 Jul 2020 02:35:53 -0400
X-MC-Unique: 3dIEBAxiMAa0WOCkCPDOHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DFBA18A1DF8;
	Mon, 20 Jul 2020 06:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5389D2DE80;
	Mon, 20 Jul 2020 06:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECB7C9A14B;
	Mon, 20 Jul 2020 06:35:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K6ZSLY003895 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 02:35:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 626392026D67; Mon, 20 Jul 2020 06:35:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E6D72026D5D
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F32F58007AC
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:35:24 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-320--dzycoH0M02GpELjBvCh7g-1; Mon, 20 Jul 2020 02:35:22 -0400
X-MC-Unique: -dzycoH0M02GpELjBvCh7g-1
Received: from [2001:4bb8:105:4a81:b96b:120c:c0c5:74fd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxP2m-0006gd-GA; Mon, 20 Jul 2020 06:12:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk
Date: Mon, 20 Jul 2020 08:12:51 +0200
Message-Id: <20200720061251.652457-4-hch@lst.de>
In-Reply-To: <20200720061251.652457-1-hch@lst.de>
References: <20200720061251.652457-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien.LeMoal@wdc.com, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/3] block: remove blk_queue_stack_limits
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This function is just a tiny wrapper around blk_stack_limits.  Open code
it int the two callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c         | 11 -----------
 drivers/block/drbd/drbd_nl.c |  4 ++--
 drivers/nvme/host/core.c     |  3 ++-
 include/linux/blkdev.h       |  1 -
 4 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 8c63af7726850c..76a7e03bcd6cac 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -455,17 +455,6 @@ void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
 }
 EXPORT_SYMBOL(blk_queue_io_opt);
 
-/**
- * blk_queue_stack_limits - inherit underlying queue limits for stacked drivers
- * @t:	the stacking driver (top)
- * @b:  the underlying device (bottom)
- **/
-void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b)
-{
-	blk_stack_limits(&t->limits, &b->limits, 0);
-}
-EXPORT_SYMBOL(blk_queue_stack_limits);
-
 /**
  * blk_stack_limits - adjust queue_limits for stacked devices
  * @t:	the stacking driver limits (top device)
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index da4a3ebe04efa5..d0d9a549b58388 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1250,7 +1250,7 @@ static void fixup_discard_if_not_supported(struct request_queue *q)
 
 static void fixup_write_zeroes(struct drbd_device *device, struct request_queue *q)
 {
-	/* Fixup max_write_zeroes_sectors after blk_queue_stack_limits():
+	/* Fixup max_write_zeroes_sectors after blk_stack_limits():
 	 * if we can handle "zeroes" efficiently on the protocol,
 	 * we want to do that, even if our backend does not announce
 	 * max_write_zeroes_sectors itself. */
@@ -1361,7 +1361,7 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	decide_on_write_same_support(device, q, b, o, disable_write_same);
 
 	if (b) {
-		blk_queue_stack_limits(q, b);
+		blk_stack_limits(&q->limits, &b->limits, 0);
 
 		if (q->backing_dev_info->ra_pages !=
 		    b->backing_dev_info->ra_pages) {
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5192a024dc1b9c..45c4c408649080 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1973,7 +1973,8 @@ static int __nvme_revalidate_disk(struct gendisk *disk, struct nvme_id_ns *id)
 #ifdef CONFIG_NVME_MULTIPATH
 	if (ns->head->disk) {
 		nvme_update_disk_info(ns->head->disk, ns, id);
-		blk_queue_stack_limits(ns->head->disk->queue, ns->queue);
+		blk_stack_limits(&ns->head->disk->queue->limits,
+				 &ns->queue->limits, 0);
 		revalidate_disk(ns->head->disk);
 	}
 #endif
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 247b0e0a2901f0..484cd3c8447452 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1108,7 +1108,6 @@ extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			    sector_t offset);
 extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 			      sector_t offset);
-extern void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b);
 extern void blk_queue_update_dma_pad(struct request_queue *, unsigned int);
 extern void blk_queue_segment_boundary(struct request_queue *, unsigned long);
 extern void blk_queue_virt_boundary(struct request_queue *, unsigned long);
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

