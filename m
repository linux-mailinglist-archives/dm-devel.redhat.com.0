Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7DF157200
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 10:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581327930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rv2TitHN+E6HmOONB9yAcQFWv6Vd6FeTtJaSEMGzViY=;
	b=bfKwUKvM4jGVVyHGTFs4wvO7KXHb0s2ZNG4R92JJJfQEQPpQJjPTVUr7slk3sZvbKbtyYy
	AXhf/roeevBfFtzHq8Tc/zqgKK9+Mo7sg3FJdB21j9nlif0NScZ7shxBsmc6ypJ1GXTXoh
	NRGflY52KxmfCy6Lnnx0XaSTX0N2HV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-e46EGA-NP3uzw_MwCQBMHQ-1; Mon, 10 Feb 2020 04:45:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EFF8DBA7;
	Mon, 10 Feb 2020 09:45:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA985C1D6;
	Mon, 10 Feb 2020 09:45:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FDDB18089D0;
	Mon, 10 Feb 2020 09:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01A9YMiA000862 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 04:34:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF1E1206320B; Mon, 10 Feb 2020 09:34:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9F452049CA4
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4008A900835
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:20 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-197-keDWdRzJMf-niTXc8qGLIQ-1;
	Mon, 10 Feb 2020 04:34:15 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j15Rx-0000Jj-9e; Mon, 10 Feb 2020 12:33:53 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk
Date: Mon, 10 Feb 2020 12:33:53 +0300
Message-ID: <158132723311.239613.5269033996109738831.stgit@localhost.localdomain>
In-Reply-To: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: keDWdRzJMf-niTXc8qGLIQ-1
X-MC-Unique: e46EGA-NP3uzw_MwCQBMHQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01A9YMiA000862
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Feb 2020 04:44:34 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, darrick.wong@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	chaitanya.kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, ktkhai@virtuozzo.com,
	dsterba@suse.com, sagi@grimberg.me, damien.lemoal@wdc.com,
	tytso@mit.edu, linux-kernel@vger.kernel.org, tj@kernel.org,
	asml.silence@gmail.com
Subject: [dm-devel] [PATCH v6 4/6] block: Add support for REQ_ALLOCATE flag
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds support for REQ_ALLOCATE extension of REQ_OP_WRITE_ZEROES
operation, which encourages a block device driver to just allocate
blocks (or mark them allocated) instead of actual blocks zeroing.
REQ_ALLOCATE is aimed to be used for network filesystems providing
a block device interface. Also, block devices, which map a file
on other filesystem (like loop), may use this for less fragmentation
and batching fallocate() requests. Hypervisors like QEMU may
introduce optimizations of clusters allocations based on this.

BLKDEV_ZERO_ALLOCATE is a new corresponding flag for
blkdev_issue_zeroout().

Stacking devices start from zero max_allocate_sectors limit for now,
and the support is going to be implemented separate for each device
in the future.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 block/blk-lib.c           |   17 ++++++++++-------
 block/blk-settings.c      |    4 ++++
 fs/block_dev.c            |    4 ++++
 include/linux/blk_types.h |    5 ++++-
 include/linux/blkdev.h    |   13 ++++++++++---
 5 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 3e38c93cfc53..9cd6f86523ba 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -214,7 +214,7 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		struct bio **biop, unsigned flags)
 {
 	struct bio *bio = *biop;
-	unsigned int max_write_zeroes_sectors;
+	unsigned int max_write_zeroes_sectors, req_flags = 0;
 	struct request_queue *q = bdev_get_queue(bdev);
 
 	if (!q)
@@ -224,18 +224,21 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EPERM;
 
 	/* Ensure that max_write_zeroes_sectors doesn't overflow bi_size */
-	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev, 0);
+	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev, flags);
 
 	if (max_write_zeroes_sectors == 0)
 		return -EOPNOTSUPP;
 
+	if (flags & BLKDEV_ZERO_NOUNMAP)
+		req_flags |= REQ_NOUNMAP;
+	if (flags & BLKDEV_ZERO_ALLOCATE)
+		req_flags |= REQ_ALLOCATE|REQ_NOUNMAP;
+
 	while (nr_sects) {
 		bio = blk_next_bio(bio, 0, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
 		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_WRITE_ZEROES;
-		if (flags & BLKDEV_ZERO_NOUNMAP)
-			bio->bi_opf |= REQ_NOUNMAP;
+		bio->bi_opf = REQ_OP_WRITE_ZEROES | req_flags;
 
 		if (nr_sects > max_write_zeroes_sectors) {
 			bio->bi_iter.bi_size = max_write_zeroes_sectors << 9;
@@ -362,7 +365,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
 	sector_t bs_mask;
 	struct bio *bio;
 	struct blk_plug plug;
-	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev, 0);
+	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev, flags);
 
 	bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
 	if ((sector | nr_sects) & bs_mask)
@@ -391,7 +394,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
 			try_write_zeroes = false;
 			goto retry;
 		}
-		if (!bdev_write_zeroes_sectors(bdev, 0)) {
+		if (!bdev_write_zeroes_sectors(bdev, flags)) {
 			/*
 			 * Zeroing offload support was indicated, but the
 			 * device reported ILLEGAL REQUEST (for some devices
diff --git a/block/blk-settings.c b/block/blk-settings.c
index c8eda2e7b91e..8d5df9d37239 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -48,6 +48,7 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->chunk_sectors = 0;
 	lim->max_write_same_sectors = 0;
 	lim->max_write_zeroes_sectors = 0;
+	lim->max_allocate_sectors = 0;
 	lim->max_discard_sectors = 0;
 	lim->max_hw_discard_sectors = 0;
 	lim->discard_granularity = 0;
@@ -83,6 +84,7 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_dev_sectors = UINT_MAX;
 	lim->max_write_same_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
+	lim->max_allocate_sectors = 0;
 }
 EXPORT_SYMBOL(blk_set_stacking_limits);
 
@@ -506,6 +508,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 					b->max_write_same_sectors);
 	t->max_write_zeroes_sectors = min(t->max_write_zeroes_sectors,
 					b->max_write_zeroes_sectors);
+	t->max_allocate_sectors = min(t->max_allocate_sectors,
+					b->max_allocate_sectors);
 	t->bounce_pfn = min_not_zero(t->bounce_pfn, b->bounce_pfn);
 
 	t->seg_boundary_mask = min_not_zero(t->seg_boundary_mask,
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 69bf2fb6f7cd..1ffef894b3bd 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -2122,6 +2122,10 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
 		error = blkdev_issue_zeroout(bdev, start >> 9, len >> 9,
 					     GFP_KERNEL, BLKDEV_ZERO_NOFALLBACK);
 		break;
+	case FALLOC_FL_KEEP_SIZE:
+		error = blkdev_issue_zeroout(bdev, start >> 9, len >> 9,
+			GFP_KERNEL, BLKDEV_ZERO_ALLOCATE | BLKDEV_ZERO_NOFALLBACK);
+		break;
 	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE | FALLOC_FL_NO_HIDE_STALE:
 		error = blkdev_issue_discard(bdev, start >> 9, len >> 9,
 					     GFP_KERNEL, 0);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 70254ae11769..86accd2caa4e 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -335,7 +335,9 @@ enum req_flag_bits {
 
 	/* command specific flags for REQ_OP_WRITE_ZEROES: */
 	__REQ_NOUNMAP,		/* do not free blocks when zeroing */
-
+	__REQ_ALLOCATE,		/* only notify about allocated blocks,
+				 * and do not actually zero them
+				 */
 	__REQ_HIPRI,
 
 	/* for driver use */
@@ -362,6 +364,7 @@ enum req_flag_bits {
 #define REQ_CGROUP_PUNT		(1ULL << __REQ_CGROUP_PUNT)
 
 #define REQ_NOUNMAP		(1ULL << __REQ_NOUNMAP)
+#define REQ_ALLOCATE		(1ULL << __REQ_ALLOCATE)
 #define REQ_HIPRI		(1ULL << __REQ_HIPRI)
 
 #define REQ_DRV			(1ULL << __REQ_DRV)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 55a714161684..40707f980a2e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -336,6 +336,7 @@ struct queue_limits {
 	unsigned int		max_hw_discard_sectors;
 	unsigned int		max_write_same_sectors;
 	unsigned int		max_write_zeroes_sectors;
+	unsigned int		max_allocate_sectors;
 	unsigned int		discard_granularity;
 	unsigned int		discard_alignment;
 
@@ -990,6 +991,8 @@ static inline struct bio_vec req_bvec(struct request *rq)
 static inline unsigned int blk_queue_get_max_write_zeroes_sectors(
 		struct request_queue *q, unsigned int op_flags)
 {
+	if (op_flags & REQ_ALLOCATE)
+		return q->limits.max_allocate_sectors;
 	return q->limits.max_write_zeroes_sectors;
 }
 
@@ -1226,6 +1229,7 @@ extern int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
 #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
+#define BLKDEV_ZERO_ALLOCATE	(1 << 2)  /* allocate range of blocks */
 
 extern int __blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop,
@@ -1430,10 +1434,13 @@ static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev,
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 
-	if (q)
-		return q->limits.max_write_zeroes_sectors;
+	if (!q)
+		return 0;
 
-	return 0;
+	if (flags & BLKDEV_ZERO_ALLOCATE)
+		return q->limits.max_allocate_sectors;
+	else
+		return q->limits.max_write_zeroes_sectors;
 }
 
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

