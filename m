Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC377301B30
	for <lists+dm-devel@lfdr.de>; Sun, 24 Jan 2021 11:13:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4Nut4WM1MTakjyVtSF_jsQ-1; Sun, 24 Jan 2021 05:13:18 -0500
X-MC-Unique: 4Nut4WM1MTakjyVtSF_jsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7A0E80A5C6;
	Sun, 24 Jan 2021 10:13:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8784C10023B8;
	Sun, 24 Jan 2021 10:13:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7BB3180954D;
	Sun, 24 Jan 2021 10:13:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10OAD1pr005554 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 05:13:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 728B82166B2F; Sun, 24 Jan 2021 10:13:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D1302166B28
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:12:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09915858EEC
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:12:59 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-32-5lGobbfEN6Sp9RYK95bBng-1; Sun, 24 Jan 2021 05:12:57 -0500
X-MC-Unique: 5lGobbfEN6Sp9RYK95bBng-1
Received: from [2001:4bb8:188:1954:a3b3:627f:702b:2136] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l3cGz-002q9c-LX; Sun, 24 Jan 2021 10:05:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 24 Jan 2021 11:02:35 +0100
Message-Id: <20210124100241.1167849-5-hch@lst.de>
In-Reply-To: <20210124100241.1167849-1-hch@lst.de>
References: <20210124100241.1167849-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 04/10] block: simplify submit_bio_checks a bit
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Merge a few checks for whole devices vs partitions to streamline the
sanity checks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 block/blk-core.c | 39 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index a3a54cd86c9c00..64f69022de9627 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -692,9 +692,9 @@ static inline bool should_fail_request(struct block_device *part,
 
 #endif /* CONFIG_FAIL_MAKE_REQUEST */
 
-static inline bool bio_check_ro(struct bio *bio, struct block_device *part)
+static inline bool bio_check_ro(struct bio *bio)
 {
-	if (op_is_write(bio_op(bio)) && bdev_read_only(part)) {
+	if (op_is_write(bio_op(bio)) && bdev_read_only(bio->bi_bdev)) {
 		char b[BDEVNAME_SIZE];
 
 		if (op_is_flush(bio->bi_opf) && !bio_sectors(bio))
@@ -702,7 +702,7 @@ static inline bool bio_check_ro(struct bio *bio, struct block_device *part)
 
 		WARN_ONCE(1,
 		       "Trying to write to read-only block-device %s (partno %d)\n",
-			bio_devname(bio, b), part->bd_partno);
+			bio_devname(bio, b), bio->bi_bdev->bd_partno);
 		/* Older lvm-tools actually trigger this */
 		return false;
 	}
@@ -723,8 +723,9 @@ ALLOW_ERROR_INJECTION(should_fail_bio, ERRNO);
  * This may well happen - the kernel calls bread() without checking the size of
  * the device, e.g., when mounting a file system.
  */
-static inline int bio_check_eod(struct bio *bio, sector_t maxsector)
+static inline int bio_check_eod(struct bio *bio)
 {
+	sector_t maxsector = bdev_nr_sectors(bio->bi_bdev);
 	unsigned int nr_sectors = bio_sectors(bio);
 
 	if (nr_sectors && maxsector &&
@@ -739,28 +740,20 @@ static inline int bio_check_eod(struct bio *bio, sector_t maxsector)
 /*
  * Remap block n of partition p to block n+start(p) of the disk.
  */
-static inline int blk_partition_remap(struct bio *bio)
+static int blk_partition_remap(struct bio *bio)
 {
 	struct block_device *p = bio->bi_bdev;
-	int ret = -EIO;
 
 	if (unlikely(should_fail_request(p, bio->bi_iter.bi_size)))
-		goto out;
-	if (unlikely(bio_check_ro(bio, p)))
-		goto out;
-
+		return -EIO;
 	if (bio_sectors(bio)) {
-		if (bio_check_eod(bio, bdev_nr_sectors(p)))
-			goto out;
 		bio->bi_iter.bi_sector += p->bd_start_sect;
 		trace_block_bio_remap(bio, p->bd_dev,
 				      bio->bi_iter.bi_sector -
 				      p->bd_start_sect);
 	}
 	bio->bi_bdev = bdev_whole(p);
-	ret = 0;
-out:
-	return ret;
+	return 0;
 }
 
 /*
@@ -820,16 +813,12 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 
 	if (should_fail_bio(bio))
 		goto end_io;
-
-	if (bio->bi_bdev->bd_partno) {
-		if (unlikely(blk_partition_remap(bio)))
-			goto end_io;
-	} else {
-		if (unlikely(bio_check_ro(bio, bdev_whole(bdev))))
-			goto end_io;
-		if (unlikely(bio_check_eod(bio, get_capacity(bdev->bd_disk))))
-			goto end_io;
-	}
+	if (unlikely(bio_check_ro(bio)))
+		goto end_io;
+	if (unlikely(bio_check_eod(bio)))
+		goto end_io;
+	if (bio->bi_bdev->bd_partno && unlikely(blk_partition_remap(bio)))
+		goto end_io;
 
 	/*
 	 * Filter flush bio's early so that bio based drivers without flush
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

