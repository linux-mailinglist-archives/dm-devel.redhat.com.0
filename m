Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A3A7313C34E
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jan 2020 14:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579095376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8mVxoVeTCAlVPSq7p9FkCuu7gQ+UOcRVCUJ5m8kTe8Q=;
	b=Woi4uy6TItBFKjyMWPHiKn3O6VmnQ16+qTOyVW4pwK/FVAFxjkpa1YSfxn6lWjtUaVJuf8
	p0ouzCOVR/FbJUfkuFkz8wFEto7uIgELx1bLKkFh/7j8cRVibU9n2mqvcWVEuPqNAhh1M2
	y5E1GAEI7ER2t5H7FprJI3BLIXlA57E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-82pjGmE5O0C0SezKeyXU1Q-1; Wed, 15 Jan 2020 08:36:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D9518A6EE1;
	Wed, 15 Jan 2020 13:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DBD5C3F8;
	Wed, 15 Jan 2020 13:36:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55F5C824EC;
	Wed, 15 Jan 2020 13:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FDZTHZ003781 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 08:35:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 42B5B8248B; Wed, 15 Jan 2020 13:35:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA1D82486;
	Wed, 15 Jan 2020 13:35:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 00FDZQWD031608; Wed, 15 Jan 2020 08:35:26 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 00FDZPSf031604; Wed, 15 Jan 2020 08:35:26 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 15 Jan 2020 08:35:25 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <alpine.LRH.2.02.2001150833180.31494@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <msnitzer@redhat.com>
Subject: [dm-devel] [PATCH] block: fix an integer overflow in logical block
	size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 82pjGmE5O0C0SezKeyXU1Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Logical block size has type unsigned short. That means that it can be at
most 32768. However, there are architectures that can run with 64k pages
(for example arm64) and on these architectures, it may be possible to
create block devices with 64k block size.

For exmaple (run this on an architecture with 64k pages):
# modprobe brd rd_size=1048576
# dmsetup create cache --table "0 `blockdev --getsize /dev/ram0` writecache s /dev/ram0 /dev/ram1 65536 0"
# mkfs.ext4 -b 65536 /dev/mapper/cache
# mount -t ext4 /dev/mapper/cache /mnt/test

Mount will fail with this error because it tries to read the superblock using 2-sector
access:
  device-mapper: writecache: I/O is not aligned, sector 2, size 1024, block size 65536
  EXT4-fs (dm-0): unable to read superblock

This patch changes the logical block size from unsigned short to unsigned
int to avoid the overflow.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 block/blk-settings.c            |    2 +-
 drivers/md/dm-snap-persistent.c |    2 +-
 drivers/md/raid0.c              |    2 +-
 include/linux/blkdev.h          |    8 ++++----
 4 files changed, 7 insertions(+), 7 deletions(-)

Index: linux-2.6/block/blk-settings.c
===================================================================
--- linux-2.6.orig/block/blk-settings.c	2020-01-15 14:02:54.000000000 +0100
+++ linux-2.6/block/blk-settings.c	2020-01-15 14:02:54.000000000 +0100
@@ -328,7 +328,7 @@ EXPORT_SYMBOL(blk_queue_max_segment_size
  *   storage device can address.  The default of 512 covers most
  *   hardware.
  **/
-void blk_queue_logical_block_size(struct request_queue *q, unsigned short size)
+void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
 {
 	q->limits.logical_block_size = size;
 
Index: linux-2.6/include/linux/blkdev.h
===================================================================
--- linux-2.6.orig/include/linux/blkdev.h	2020-01-15 14:02:54.000000000 +0100
+++ linux-2.6/include/linux/blkdev.h	2020-01-15 14:11:07.000000000 +0100
@@ -328,6 +328,7 @@ struct queue_limits {
 	unsigned int		max_sectors;
 	unsigned int		max_segment_size;
 	unsigned int		physical_block_size;
+	unsigned int		logical_block_size;
 	unsigned int		alignment_offset;
 	unsigned int		io_min;
 	unsigned int		io_opt;
@@ -338,7 +339,6 @@ struct queue_limits {
 	unsigned int		discard_granularity;
 	unsigned int		discard_alignment;
 
-	unsigned short		logical_block_size;
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
 	unsigned short		max_discard_segments;
@@ -1077,7 +1077,7 @@ extern void blk_queue_max_write_same_sec
 		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
-extern void blk_queue_logical_block_size(struct request_queue *, unsigned short);
+extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
 extern void blk_queue_physical_block_size(struct request_queue *, unsigned int);
 extern void blk_queue_alignment_offset(struct request_queue *q,
 				       unsigned int alignment);
@@ -1291,7 +1291,7 @@ static inline unsigned int queue_max_seg
 	return q->limits.max_segment_size;
 }
 
-static inline unsigned short queue_logical_block_size(const struct request_queue *q)
+static inline unsigned queue_logical_block_size(const struct request_queue *q)
 {
 	int retval = 512;
 
@@ -1301,7 +1301,7 @@ static inline unsigned short queue_logic
 	return retval;
 }
 
-static inline unsigned short bdev_logical_block_size(struct block_device *bdev)
+static inline unsigned int bdev_logical_block_size(struct block_device *bdev)
 {
 	return queue_logical_block_size(bdev_get_queue(bdev));
 }
Index: linux-2.6/drivers/md/dm-snap-persistent.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-snap-persistent.c	2019-10-10 16:52:03.000000000 +0200
+++ linux-2.6/drivers/md/dm-snap-persistent.c	2020-01-15 14:14:11.000000000 +0100
@@ -17,7 +17,7 @@
 #include <linux/dm-bufio.h>
 
 #define DM_MSG_PREFIX "persistent snapshot"
-#define DM_CHUNK_SIZE_DEFAULT_SECTORS 32	/* 16KB */
+#define DM_CHUNK_SIZE_DEFAULT_SECTORS 32U	/* 16KB */
 
 #define DM_PREFETCH_CHUNKS		12
 
Index: linux-2.6/drivers/md/raid0.c
===================================================================
--- linux-2.6.orig/drivers/md/raid0.c	2019-12-11 09:31:25.000000000 +0100
+++ linux-2.6/drivers/md/raid0.c	2020-01-15 14:15:14.000000000 +0100
@@ -87,7 +87,7 @@ static int create_strip_zones(struct mdd
 	char b[BDEVNAME_SIZE];
 	char b2[BDEVNAME_SIZE];
 	struct r0conf *conf = kzalloc(sizeof(*conf), GFP_KERNEL);
-	unsigned short blksize = 512;
+	unsigned blksize = 512;
 
 	*private_conf = ERR_PTR(-ENOMEM);
 	if (!conf)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

