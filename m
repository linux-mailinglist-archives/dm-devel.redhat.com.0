Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BB6991E3844
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EHAeIrWo+35Po2oQpRRfX62cnUr9YdaY3m7RcYQs8zU=;
	b=ZFEtVqqPQj9bRvHgtNzSldXT3bef52Lp3aVT3z17xd7AG/VzJpbcS76hmWPrvYhu3qkdEH
	Pw/kA9bN8B6j1zBl6FU3cMppq+zVWXzlo9dCXPT3AkQD2qaBTMGr/OjS9kIBufdQfw/w89
	V2ewghrwirfZCDO35/JhU0PNGTMKINE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-IqK_5SqTO7GwCSiLFL6c6Q-1; Wed, 27 May 2020 01:33:14 -0400
X-MC-Unique: IqK_5SqTO7GwCSiLFL6c6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DA6835B41;
	Wed, 27 May 2020 05:33:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8CD496FB1;
	Wed, 27 May 2020 05:33:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 654651809554;
	Wed, 27 May 2020 05:33:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5X5no012137 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:33:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D17E9A317E; Wed, 27 May 2020 05:33:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE076951D7
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B61FC8007B1
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-N0heYc8sOH2TgAfouUQbrw-1; Wed, 27 May 2020 01:33:01 -0400
X-MC-Unique: N0heYc8sOH2TgAfouUQbrw-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYT-0000pk-Is; Wed, 27 May 2020 05:24:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:10 +0200
Message-Id: <20200527052419.403583-8-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
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
Subject: [dm-devel] [PATCH 07/16] nvdimm: use bio_{start,end}_io_acct
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

Switch dm to use the nicer bio accounting helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 drivers/nvdimm/blk.c  |  6 ++++--
 drivers/nvdimm/btt.c  |  6 ++++--
 drivers/nvdimm/nd.h   | 19 -------------------
 drivers/nvdimm/pmem.c |  6 ++++--
 4 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 43751fab9d36a..036e23aef9b04 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -178,7 +178,9 @@ static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 	bip = bio_integrity(bio);
 	nsblk = q->queuedata;
 	rw = bio_data_dir(bio);
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		unsigned int len = bvec.bv_len;
 
@@ -195,7 +197,7 @@ static blk_qc_t nd_blk_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	bio_endio(bio);
 	return BLK_QC_T_NONE;
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 3b09419218d6f..90c0c4bbe77b9 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1452,7 +1452,9 @@ static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
 	if (!bio_integrity_prep(bio))
 		return BLK_QC_T_NONE;
 
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		unsigned int len = bvec.bv_len;
 
@@ -1477,7 +1479,7 @@ static blk_qc_t btt_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	bio_endio(bio);
 	return BLK_QC_T_NONE;
diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
index 85dbb2a322b9b..85c1ae813ea31 100644
--- a/drivers/nvdimm/nd.h
+++ b/drivers/nvdimm/nd.h
@@ -396,25 +396,6 @@ static inline int nvdimm_setup_pfn(struct nd_pfn *nd_pfn,
 #endif
 int nd_blk_region_init(struct nd_region *nd_region);
 int nd_region_activate(struct nd_region *nd_region);
-void __nd_iostat_start(struct bio *bio, unsigned long *start);
-static inline bool nd_iostat_start(struct bio *bio, unsigned long *start)
-{
-	struct gendisk *disk = bio->bi_disk;
-
-	if (!blk_queue_io_stat(disk->queue))
-		return false;
-
-	*start = jiffies;
-	generic_start_io_acct(disk->queue, bio_op(bio), bio_sectors(bio),
-			      &disk->part0);
-	return true;
-}
-static inline void nd_iostat_end(struct bio *bio, unsigned long start)
-{
-	struct gendisk *disk = bio->bi_disk;
-
-	generic_end_io_acct(disk->queue, bio_op(bio), &disk->part0, start);
-}
 static inline bool is_bad_pmem(struct badblocks *bb, sector_t sector,
 		unsigned int len)
 {
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 2df6994acf836..97f948f8f4e62 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -202,7 +202,9 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 	if (bio->bi_opf & REQ_PREFLUSH)
 		ret = nvdimm_flush(nd_region, bio);
 
-	do_acct = nd_iostat_start(bio, &start);
+	do_acct = blk_queue_io_stat(bio->bi_disk->queue);
+	if (do_acct)
+		start = bio_start_io_acct(bio);
 	bio_for_each_segment(bvec, bio, iter) {
 		if (op_is_write(bio_op(bio)))
 			rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
@@ -216,7 +218,7 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 		}
 	}
 	if (do_acct)
-		nd_iostat_end(bio, start);
+		bio_end_io_acct(bio, start);
 
 	if (bio->bi_opf & REQ_FUA)
 		ret = nvdimm_flush(nd_region, bio);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

