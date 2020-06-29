Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BB75520D5B5
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 21:43:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-m64SD6C9PdCOe-q_5H8TrA-1; Mon, 29 Jun 2020 15:43:30 -0400
X-MC-Unique: m64SD6C9PdCOe-q_5H8TrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D6A107ACF2;
	Mon, 29 Jun 2020 19:43:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB75A74195;
	Mon, 29 Jun 2020 19:43:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38C4C1809547;
	Mon, 29 Jun 2020 19:43:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TJhF3R024007 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 15:43:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 883B210CB268; Mon, 29 Jun 2020 19:43:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8394710CB262
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DFFF90E3C4
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:13 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-vss6uRqGMkOYOC8sVsPKVw-1; Mon, 29 Jun 2020 15:43:11 -0400
X-MC-Unique: vss6uRqGMkOYOC8sVsPKVw-1
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdk-0004P4-3Q; Mon, 29 Jun 2020 19:40:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:46 +0200
Message-Id: <20200629193947.2705954-20-hch@lst.de>
In-Reply-To: <20200629193947.2705954-1-hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [dm-devel] [PATCH 19/20] block: shortcut __submit_bio_noacct for
	blk-mq drivers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For blk-mq drivers bios can only be inserted for the same queue.  So
bypass the complicated sorting logic in __submit_bio_noacct with
a blk-mq simpler submission helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 50 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index b82f48c86e6f7a..46e3c0a37cc377 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1071,20 +1071,6 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 	return false;
 }
 
-static blk_qc_t do_make_request(struct bio *bio)
-{
-	struct gendisk *disk = bio->bi_disk;
-	blk_qc_t ret = BLK_QC_T_NONE;
-
-	if (blk_crypto_bio_prep(&bio)) {
-		if (!disk->fops->submit_bio)
-			return blk_mq_submit_bio(bio);
-		ret = disk->fops->submit_bio(bio);
-	}
-	blk_queue_exit(disk->queue);
-	return ret;
-}
-
 /*
  * The loop in this function may be a bit non-obvious, and so deserves some
  * explanation:
@@ -1127,7 +1113,11 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 		bio_list_on_stack[1] = bio_list_on_stack[0];
 		bio_list_init(&bio_list_on_stack[0]);
 
-		ret = do_make_request(bio);
+		if (blk_crypto_bio_prep(&bio))
+			ret = bio->bi_disk->fops->submit_bio(bio);
+		else
+			ret = BLK_QC_T_NONE;
+		blk_queue_exit(q);
 
 		/*
 		 * Sort new bios into those for a lower level and those for the
@@ -1153,6 +1143,34 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 	return ret;
 }
 
+static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
+{
+	struct gendisk *disk = bio->bi_disk;
+	struct bio_list bio_list;
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	bio_list_init(&bio_list);
+	current->bio_list = &bio_list;
+
+	do {
+		WARN_ON_ONCE(bio->bi_disk != disk);
+
+		if (unlikely(bio_queue_enter(bio) != 0))
+			continue;
+
+		if (!blk_crypto_bio_prep(&bio)) {
+			blk_queue_exit(disk->queue);
+			ret = BLK_QC_T_NONE;
+			continue;
+		}
+
+		ret = blk_mq_submit_bio(bio);
+	} while ((bio = bio_list_pop(&bio_list)));
+
+	current->bio_list = NULL;
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1182,6 +1200,8 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
+	if (bio->bi_disk->queue->mq_ops)
+		return __submit_bio_noacct_mq(bio);
 	return __submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio_noacct);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

