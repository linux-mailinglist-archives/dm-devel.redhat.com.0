Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E69DB20D5BF
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 21:43:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ifDrhKPiPWWHfofurBiy_w-1; Mon, 29 Jun 2020 15:43:53 -0400
X-MC-Unique: ifDrhKPiPWWHfofurBiy_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C50BFC5;
	Mon, 29 Jun 2020 19:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1B1B3A62;
	Mon, 29 Jun 2020 19:43:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79F38104903;
	Mon, 29 Jun 2020 19:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TJhd8F024133 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 15:43:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8A4910A874B; Mon, 29 Jun 2020 19:43:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E44CD10A279F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C90A8108C268
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:38 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-487-K1Q774y8NMKndYIr8_kwHA-1; Mon, 29 Jun 2020 15:43:32 -0400
X-MC-Unique: K1Q774y8NMKndYIr8_kwHA-1
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzdi-0004Ou-F4; Mon, 29 Jun 2020 19:40:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:45 +0200
Message-Id: <20200629193947.2705954-19-hch@lst.de>
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
Subject: [dm-devel] [PATCH 18/20] block: refator submit_bio_noacct
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

Split out a __submit_bio_noacct helper for the actual de-recursion
algorithm, and simplify the loop by using a continue when we can't
enter the queue for a bio.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 131 +++++++++++++++++++++++++----------------------
 1 file changed, 71 insertions(+), 60 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1caeb01e127768..b82f48c86e6f7a 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1085,6 +1085,74 @@ static blk_qc_t do_make_request(struct bio *bio)
 	return ret;
 }
 
+/*
+ * The loop in this function may be a bit non-obvious, and so deserves some
+ * explanation:
+ *
+ *  - Before entering the loop, bio->bi_next is NULL (as all callers ensure
+ *    that), so we have a list with a single bio.
+ *  - We pretend that we have just taken it off a longer list, so we assign
+ *    bio_list to a pointer to the bio_list_on_stack, thus initialising the
+ *    bio_list of new bios to be added.  ->submit_bio() may indeed add some more
+ *    bios through a recursive call to submit_bio_noacct.  If it did, we find a
+ *    non-NULL value in bio_list and re-enter the loop from the top.
+ *  - In this case we really did just take the bio of the top of the list (no
+ *    pretending) and so remove it from bio_list, and call into ->submit_bio()
+ *    again.
+ *
+ * bio_list_on_stack[0] contains bios submitted by the current ->submit_bio.
+ * bio_list_on_stack[1] contains bios that were submitted before the current
+ *	->submit_bio_bio, but that haven't been processed yet.
+ */
+static blk_qc_t __submit_bio_noacct(struct bio *bio)
+{
+	struct bio_list bio_list_on_stack[2];
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	BUG_ON(bio->bi_next);
+
+	bio_list_init(&bio_list_on_stack[0]);
+	current->bio_list = bio_list_on_stack;
+
+	do {
+		struct request_queue *q = bio->bi_disk->queue;
+		struct bio_list lower, same;
+
+		if (unlikely(bio_queue_enter(bio) != 0))
+			continue;
+
+		/*
+		 * Create a fresh bio_list for all subordinate requests.
+		 */
+		bio_list_on_stack[1] = bio_list_on_stack[0];
+		bio_list_init(&bio_list_on_stack[0]);
+
+		ret = do_make_request(bio);
+
+		/*
+		 * Sort new bios into those for a lower level and those for the
+		 * same level.
+		 */
+		bio_list_init(&lower);
+		bio_list_init(&same);
+		while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
+			if (q == bio->bi_disk->queue)
+				bio_list_add(&same, bio);
+			else
+				bio_list_add(&lower, bio);
+
+		/*
+		 * Now assemble so we handle the lowest level first.
+		 */
+		bio_list_merge(&bio_list_on_stack[0], &lower);
+		bio_list_merge(&bio_list_on_stack[0], &same);
+		bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
+	} while ((bio = bio_list_pop(&bio_list_on_stack[0])));
+
+	current->bio_list = NULL;
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1096,17 +1164,8 @@ static blk_qc_t do_make_request(struct bio *bio)
  */
 blk_qc_t submit_bio_noacct(struct bio *bio)
 {
-	/*
-	 * bio_list_on_stack[0] contains bios submitted by the current
-	 * ->submit_bio.
-	 * bio_list_on_stack[1] contains bios that were submitted before the
-	 * current ->submit_bio_bio, but that haven't been processed yet.
-	 */
-	struct bio_list bio_list_on_stack[2];
-	blk_qc_t ret = BLK_QC_T_NONE;
-
 	if (!submit_bio_checks(bio))
-		goto out;
+		return BLK_QC_T_NONE;
 
 	/*
 	 * We only want one ->submit_bio to be active at a time, else
@@ -1120,58 +1179,10 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 	 */
 	if (current->bio_list) {
 		bio_list_add(&current->bio_list[0], bio);
-		goto out;
+		return BLK_QC_T_NONE;
 	}
 
-	/* following loop may be a bit non-obvious, and so deserves some
-	 * explanation.
-	 * Before entering the loop, bio->bi_next is NULL (as all callers
-	 * ensure that) so we have a list with a single bio.
-	 * We pretend that we have just taken it off a longer list, so
-	 * we assign bio_list to a pointer to the bio_list_on_stack,
-	 * thus initialising the bio_list of new bios to be
-	 * added.  ->submit_bio() may indeed add some more bios
-	 * through a recursive call to submit_bio_noacct.  If it
-	 * did, we find a non-NULL value in bio_list and re-enter the loop
-	 * from the top.  In this case we really did just take the bio
-	 * of the top of the list (no pretending) and so remove it from
-	 * bio_list, and call into ->submit_bio() again.
-	 */
-	BUG_ON(bio->bi_next);
-	bio_list_init(&bio_list_on_stack[0]);
-	current->bio_list = bio_list_on_stack;
-	do {
-		struct request_queue *q = bio->bi_disk->queue;
-
-		if (likely(bio_queue_enter(bio) == 0)) {
-			struct bio_list lower, same;
-
-			/* Create a fresh bio_list for all subordinate requests */
-			bio_list_on_stack[1] = bio_list_on_stack[0];
-			bio_list_init(&bio_list_on_stack[0]);
-			ret = do_make_request(bio);
-
-			/* sort new bios into those for a lower level
-			 * and those for the same level
-			 */
-			bio_list_init(&lower);
-			bio_list_init(&same);
-			while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
-				if (q == bio->bi_disk->queue)
-					bio_list_add(&same, bio);
-				else
-					bio_list_add(&lower, bio);
-			/* now assemble so we handle the lowest level first */
-			bio_list_merge(&bio_list_on_stack[0], &lower);
-			bio_list_merge(&bio_list_on_stack[0], &same);
-			bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
-		}
-		bio = bio_list_pop(&bio_list_on_stack[0]);
-	} while (bio);
-	current->bio_list = NULL; /* deactivate */
-
-out:
-	return ret;
+	return __submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio_noacct);
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

