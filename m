Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C56C81E0DAC
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 13:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590407262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=77kvrdAd4nUWZxT/z9id7qdzDU+pS+BMNgwhC1+Qx9k=;
	b=jB7TMgr7fZukIlKlHc5qfwWv65K87/siODyrCl7vvdbZMx09dv1LSX5WG37AUShp+w26VC
	lKadTWrhNxaJc+wHuVqKiS8HF+JPF8RV8qH2AVS7ZpEvwO8tO/DU4VDoklWowlX80lX4Gk
	yFU4cymDURljJWnif4qaeRPRjoRMqx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-iK4fYiQ4MpSLLR6057tnEw-1; Mon, 25 May 2020 07:47:40 -0400
X-MC-Unique: iK4fYiQ4MpSLLR6057tnEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E88107ACCD;
	Mon, 25 May 2020 11:47:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 138FA83C06;
	Mon, 25 May 2020 11:47:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2A657CCCD;
	Mon, 25 May 2020 11:47:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PBlUuu006773 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 07:47:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E4D910F26E9; Mon, 25 May 2020 11:47:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E78410F26E6
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:47:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD25833B45
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-GiY8MdfEM6CcYHSzzaBZ5A-1; Mon, 25 May 2020 07:47:21 -0400
X-MC-Unique: GiY8MdfEM6CcYHSzzaBZ5A-1
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJn-0002X2-HH; Mon, 25 May 2020 11:30:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:11 +0200
Message-Id: <20200525113014.345997-14-hch@lst.de>
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 13/16] block: add a blk_account_io_merge_bio
	helper
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

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Move the non-"new_io" branch of blk_account_io_start() into separate
function.  Fix merge accounting for discards (they were counted as write
merges).

The new blk_account_io_merge_bio() doesn't call update_io_ticks() unlike
blk_account_io_start(), as there is no reason for that.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
[hch: rebased]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 25 ++++++++++++++++---------
 block/blk-exec.c |  2 +-
 block/blk-mq.c   |  2 +-
 block/blk.h      |  2 +-
 4 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index c1675d43c2da0..bf2f7d4bc0c1c 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -636,6 +636,16 @@ void blk_put_request(struct request *req)
 }
 EXPORT_SYMBOL(blk_put_request);
 
+static void blk_account_io_merge_bio(struct request *req)
+{
+	if (!blk_do_io_stat(req))
+		return;
+
+	part_stat_lock();
+	part_stat_inc(req->part, merges[op_stat_group(req_op(req))]);
+	part_stat_unlock();
+}
+
 bool bio_attempt_back_merge(struct request *req, struct bio *bio,
 		unsigned int nr_segs)
 {
@@ -656,7 +666,7 @@ bool bio_attempt_back_merge(struct request *req, struct bio *bio,
 
 	bio_crypt_free_ctx(bio);
 
-	blk_account_io_start(req, false);
+	blk_account_io_merge_bio(req);
 	return true;
 }
 
@@ -682,7 +692,7 @@ bool bio_attempt_front_merge(struct request *req, struct bio *bio,
 
 	bio_crypt_do_front_merge(req, bio);
 
-	blk_account_io_start(req, false);
+	blk_account_io_merge_bio(req);
 	return true;
 }
 
@@ -704,7 +714,7 @@ bool bio_attempt_discard_merge(struct request_queue *q, struct request *req,
 	req->__data_len += bio->bi_iter.bi_size;
 	req->nr_phys_segments = segments + 1;
 
-	blk_account_io_start(req, false);
+	blk_account_io_merge_bio(req);
 	return true;
 no_merge:
 	req_set_nomerge(q, req);
@@ -1329,7 +1339,7 @@ blk_status_t blk_insert_cloned_request(struct request_queue *q, struct request *
 		return BLK_STS_IOERR;
 
 	if (blk_queue_io_stat(q))
-		blk_account_io_start(rq, true);
+		blk_account_io_start(rq);
 
 	/*
 	 * Since we have a scheduler attached on the top device,
@@ -1433,16 +1443,13 @@ void blk_account_io_done(struct request *req, u64 now)
 	}
 }
 
-void blk_account_io_start(struct request *rq, bool new_io)
+void blk_account_io_start(struct request *rq)
 {
 	if (!blk_do_io_stat(rq))
 		return;
 
 	part_stat_lock();
-	if (!new_io)
-		part_stat_inc(rq->part, merges[rq_data_dir(rq)]);
-	else
-		rq->part = disk_map_sector_rcu(rq->rq_disk, blk_rq_pos(rq));
+	rq->part = disk_map_sector_rcu(rq->rq_disk, blk_rq_pos(rq));
 	update_io_ticks(rq->part, jiffies, false);
 	part_stat_unlock();
 }
diff --git a/block/blk-exec.c b/block/blk-exec.c
index e20a852ae432d..85324d53d072f 100644
--- a/block/blk-exec.c
+++ b/block/blk-exec.c
@@ -55,7 +55,7 @@ void blk_execute_rq_nowait(struct request_queue *q, struct gendisk *bd_disk,
 	rq->rq_disk = bd_disk;
 	rq->end_io = done;
 
-	blk_account_io_start(rq, true);
+	blk_account_io_start(rq);
 
 	/*
 	 * don't check dying flag for MQ because the request won't
diff --git a/block/blk-mq.c b/block/blk-mq.c
index cac11945f6023..c606c74463ccd 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1822,7 +1822,7 @@ static void blk_mq_bio_to_request(struct request *rq, struct bio *bio,
 	blk_rq_bio_prep(rq, bio, nr_segs);
 	blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
 
-	blk_account_io_start(rq, true);
+	blk_account_io_start(rq);
 }
 
 static blk_status_t __blk_mq_issue_directly(struct blk_mq_hw_ctx *hctx,
diff --git a/block/blk.h b/block/blk.h
index 0ecba2ab383d6..428f7e5d70a86 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -185,7 +185,7 @@ bool bio_attempt_discard_merge(struct request_queue *q, struct request *req,
 bool blk_attempt_plug_merge(struct request_queue *q, struct bio *bio,
 		unsigned int nr_segs, struct request **same_queue_rq);
 
-void blk_account_io_start(struct request *req, bool new_io);
+void blk_account_io_start(struct request *req);
 void blk_account_io_done(struct request *req, u64 now);
 
 /*
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

