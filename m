Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AC4C41E0DEC
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 13:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590407685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/eyKwbidBe+OcPNqZ5z9EKUxoqUVdW0EWHTo1U+EJFk=;
	b=UY2oI+54YE5+NtzvLw4n+l9w5ZfwsOXmg7e9YKWpchJpbcBcyMOyTsTzNnh2eEzy/LABom
	JV8MmY4/JfIbcWQHZ5Chektqxv9rljB3D+UkFYkSi1XFHMXY3oVfGz8Pi7TcRBG9Sg2Cda
	APTfnoDxEns1y/e2Ubwi2hy9kVRd/4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-bbh4w_vWPLeUq-GL8FaG0A-1; Mon, 25 May 2020 07:54:43 -0400
X-MC-Unique: bbh4w_vWPLeUq-GL8FaG0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A1F107B26F;
	Mon, 25 May 2020 11:54:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B3F66062D;
	Mon, 25 May 2020 11:54:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E4E31809547;
	Mon, 25 May 2020 11:54:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PBsVZv007404 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 07:54:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C51842AAA; Mon, 25 May 2020 11:54:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 985DF42AB0
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:54:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA98108C267
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-tEo7DRb3NQqplWcK4jo5jA-1; Mon, 25 May 2020 07:54:26 -0400
X-MC-Unique: tEo7DRb3NQqplWcK4jo5jA-1
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJY-0002SD-Gd; Mon, 25 May 2020 11:30:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:06 +0200
Message-Id: <20200525113014.345997-9-hch@lst.de>
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 08/16] zram: nvdimm: use bio_{start,
	end}_io_acct and disk_{start, end}_io_acct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch zram to use the nicer bio accounting helpers, and as part of that
ensure each bio is counted as a single I/O request.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index ebb234f36909c..6e2ad90b17a37 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1510,13 +1510,8 @@ static void zram_bio_discard(struct zram *zram, u32 index,
 static int zram_bvec_rw(struct zram *zram, struct bio_vec *bvec, u32 index,
 			int offset, unsigned int op, struct bio *bio)
 {
-	unsigned long start_time = jiffies;
-	struct request_queue *q = zram->disk->queue;
 	int ret;
 
-	generic_start_io_acct(q, op, bvec->bv_len >> SECTOR_SHIFT,
-			&zram->disk->part0);
-
 	if (!op_is_write(op)) {
 		atomic64_inc(&zram->stats.num_reads);
 		ret = zram_bvec_read(zram, bvec, index, offset, bio);
@@ -1526,8 +1521,6 @@ static int zram_bvec_rw(struct zram *zram, struct bio_vec *bvec, u32 index,
 		ret = zram_bvec_write(zram, bvec, index, offset, bio);
 	}
 
-	generic_end_io_acct(q, op, &zram->disk->part0, start_time);
-
 	zram_slot_lock(zram, index);
 	zram_accessed(zram, index);
 	zram_slot_unlock(zram, index);
@@ -1548,6 +1541,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 	u32 index;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
+	unsigned long start_time;
 
 	index = bio->bi_iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
 	offset = (bio->bi_iter.bi_sector &
@@ -1563,6 +1557,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 		break;
 	}
 
+	start_time = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		struct bio_vec bv = bvec;
 		unsigned int unwritten = bvec.bv_len;
@@ -1571,8 +1566,10 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 			bv.bv_len = min_t(unsigned int, PAGE_SIZE - offset,
 							unwritten);
 			if (zram_bvec_rw(zram, &bv, index, offset,
-					 bio_op(bio), bio) < 0)
-				goto out;
+					 bio_op(bio), bio) < 0) {
+				bio->bi_status = BLK_STS_IOERR;
+				break;
+			}
 
 			bv.bv_offset += bv.bv_len;
 			unwritten -= bv.bv_len;
@@ -1580,12 +1577,8 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 			update_position(&index, &offset, &bv);
 		} while (unwritten);
 	}
-
+	bio_end_io_acct(bio, start_time);
 	bio_endio(bio);
-	return;
-
-out:
-	bio_io_error(bio);
 }
 
 /*
@@ -1633,6 +1626,7 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 	u32 index;
 	struct zram *zram;
 	struct bio_vec bv;
+	unsigned long start_time;
 
 	if (PageTransHuge(page))
 		return -ENOTSUPP;
@@ -1651,7 +1645,9 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 	bv.bv_len = PAGE_SIZE;
 	bv.bv_offset = 0;
 
+	start_time = disk_start_io_acct(bdev->bd_disk, SECTORS_PER_PAGE, op);
 	ret = zram_bvec_rw(zram, &bv, index, offset, op, NULL);
+	disk_end_io_acct(bdev->bd_disk, op, start_time);
 out:
 	/*
 	 * If I/O fails, just return error(ie, non-zero) without
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

