Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5D6600595
	for <lists+dm-devel@lfdr.de>; Mon, 17 Oct 2022 05:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665976059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jWvvIyG4UTUZTJSpHd5BnLd2Ph7VNxgH6+rCxmOg/Nk=;
	b=bcSe6ivzoIxqWWv5j0kEw76sPpH2u2HunFJVHwJfjsZSuXh2os1v9xM3uAH6nWuxXtyFIV
	vWtVRJ0h0dGuFK+wBikPyZVxBURdaQGXss05YvH2arRPS39aPJINjartVGT9w67G9i46/Y
	SXwZRpn2LJhI4xCje/nMIwsnxSgB0pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-7sj5_BnBNvGagCUaOWZ0Ug-1; Sun, 16 Oct 2022 23:07:35 -0400
X-MC-Unique: 7sj5_BnBNvGagCUaOWZ0Ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 224CC3C0F431;
	Mon, 17 Oct 2022 03:07:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84876200C0DA;
	Mon, 17 Oct 2022 03:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA24019465A3;
	Mon, 17 Oct 2022 03:07:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA0AB194658C
 for <dm-devel@listman.corp.redhat.com>; Mon, 17 Oct 2022 03:07:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C59831111A4A; Mon, 17 Oct 2022 03:07:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA511111A45
 for <dm-devel@redhat.com>; Mon, 17 Oct 2022 03:07:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE63185A792
 for <dm-devel@redhat.com>; Mon, 17 Oct 2022 03:07:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-7-ca9K0fP6WEMhCGYTDkpg-1; Sun, 16 Oct 2022 23:07:23 -0400
X-MC-Unique: 7-ca9K0fP6WEMhCGYTDkpg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3BB3AB80E44;
 Mon, 17 Oct 2022 03:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E87C433C1;
 Mon, 17 Oct 2022 03:07:20 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	hch@lst.de
Date: Sun, 16 Oct 2022 23:07:18 -0400
Message-Id: <20221017030718.2430129-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] Patch "block: replace blk_queue_nowait with bdev_nowait"
 has been added to the 5.19-stable tree
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
 Shaohua Li <shli@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a note to let you know that I've just added the patch titled

    block: replace blk_queue_nowait with bdev_nowait

to the 5.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     block-replace-blk_queue_nowait-with-bdev_nowait.patch
and it can be found in the queue-5.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit f4d158f7c6ee4371a447a0c2c515a6b049c7fac0
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Sep 27 09:58:15 2022 +0200

    block: replace blk_queue_nowait with bdev_nowait
    
    [ Upstream commit 568ec936bf1384fc15873908c96a9aeb62536edb ]
    
    Replace blk_queue_nowait with a bdev_nowait helpers that takes the
    block_device given that the I/O submission path should not have to
    look into the request_queue.
    
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>
    Link: https://lore.kernel.org/r/20220927075815.269694-1-hch@lst.de
    Signed-off-by: Jens Axboe <axboe@kernel.dk>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/block/blk-core.c b/block/blk-core.c
index 7743c68177e8..5970c47ae86f 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -727,7 +727,7 @@ void submit_bio_noacct(struct bio *bio)
 	 * For a REQ_NOWAIT based request, return -EOPNOTSUPP
 	 * if queue does not support NOWAIT.
 	 */
-	if ((bio->bi_opf & REQ_NOWAIT) && !blk_queue_nowait(q))
+	if ((bio->bi_opf & REQ_NOWAIT) && !bdev_nowait(bdev))
 		goto not_supported;
 
 	if (should_fail_bio(bio))
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index bd539afbfe88..1f73ce6ac925 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1869,9 +1869,7 @@ static bool dm_table_supports_write_zeroes(struct dm_table *t)
 static int device_not_nowait_capable(struct dm_target *ti, struct dm_dev *dev,
 				     sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return !blk_queue_nowait(q);
+	return !bdev_nowait(dev->bdev);
 }
 
 static bool dm_table_supports_nowait(struct dm_table *t)
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 25d18b67a162..cb8eddcd018e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5852,7 +5852,7 @@ int md_run(struct mddev *mddev)
 			}
 		}
 		sysfs_notify_dirent_safe(rdev->sysfs_state);
-		nowait = nowait && blk_queue_nowait(bdev_get_queue(rdev->bdev));
+		nowait = nowait && bdev_nowait(rdev->bdev);
 	}
 
 	if (!bioset_initialized(&mddev->bio_set)) {
@@ -6989,7 +6989,7 @@ static int hot_add_disk(struct mddev *mddev, dev_t dev)
 	 * If the new disk does not support REQ_NOWAIT,
 	 * disable on the whole MD.
 	 */
-	if (!blk_queue_nowait(bdev_get_queue(rdev->bdev))) {
+	if (!bdev_nowait(rdev->bdev)) {
 		pr_info("%s: Disabling nowait because %pg does not support nowait\n",
 			mdname(mddev), rdev->bdev);
 		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, mddev->queue);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 83eb8869a8c9..a49ea5e19a9b 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -614,7 +614,6 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_quiesced(q)	test_bit(QUEUE_FLAG_QUIESCED, &(q)->queue_flags)
 #define blk_queue_pm_only(q)	atomic_read(&(q)->pm_only)
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
-#define blk_queue_nowait(q)	test_bit(QUEUE_FLAG_NOWAIT, &(q)->queue_flags)
 #define blk_queue_sq_sched(q)	test_bit(QUEUE_FLAG_SQ_SCHED, &(q)->queue_flags)
 
 extern void blk_set_pm_only(struct request_queue *q);
@@ -1314,6 +1313,11 @@ static inline bool bdev_fua(struct block_device *bdev)
 	return test_bit(QUEUE_FLAG_FUA, &bdev_get_queue(bdev)->queue_flags);
 }
 
+static inline bool bdev_nowait(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_NOWAIT, &bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 096b6d14f40d..81ca3e3ea8de 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3348,7 +3348,7 @@ static void io_iopoll_req_issued(struct io_kiocb *req, unsigned int issue_flags)
 
 static bool io_bdev_nowait(struct block_device *bdev)
 {
-	return !bdev || blk_queue_nowait(bdev_get_queue(bdev));
+	return !bdev || bdev_nowait(bdev);
 }
 
 /*

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

