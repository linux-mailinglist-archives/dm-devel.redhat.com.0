Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82910497B5D
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jan 2022 10:12:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-xWsFV9FKMD-xBjn0WfxTHA-1; Mon, 24 Jan 2022 04:12:04 -0500
X-MC-Unique: xWsFV9FKMD-xBjn0WfxTHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F328A1923B8A;
	Mon, 24 Jan 2022 09:11:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2CD360C2D;
	Mon, 24 Jan 2022 09:11:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F36B1806D1D;
	Mon, 24 Jan 2022 09:11:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20O9BrlW016985 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 04:11:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8EB48141DED6; Mon, 24 Jan 2022 09:11:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1BD141DED4
	for <dm-devel@redhat.com>; Mon, 24 Jan 2022 09:11:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7230285A5AA
	for <dm-devel@redhat.com>; Mon, 24 Jan 2022 09:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-91-plQ6trl6My22E2qf5NR6lw-1; Mon, 24 Jan 2022 04:11:51 -0500
X-MC-Unique: plQ6trl6My22E2qf5NR6lw-1
Received: from [2001:4bb8:184:72a4:a337:a75f:a24e:7e39] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvO8-002kKA-Ni; Mon, 24 Jan 2022 09:11:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Jan 2022 10:11:02 +0100
Message-Id: <20220124091107.642561-15-hch@lst.de>
In-Reply-To: <20220124091107.642561-1-hch@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [dm-devel] [PATCH 14/19] block: pass a block_device and opf to
	blk_next_bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chaitanya Kulkarni <kch@nvidia.com>

All callers need to set the block_device and operation, so lift that into
the common code.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c               |  6 +++++-
 block/blk-lib.c           | 19 +++++--------------
 block/blk-zoned.c         |  9 +++------
 block/blk.h               |  2 --
 drivers/nvme/target/zns.c |  6 +++---
 include/linux/bio.h       |  3 ++-
 6 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 1536579ed490a..a0166f29a05c3 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -344,10 +344,14 @@ void bio_chain(struct bio *bio, struct bio *parent)
 }
 EXPORT_SYMBOL(bio_chain);
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp)
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+		unsigned int nr_pages, unsigned int opf, gfp_t gfp)
 {
 	struct bio *new = bio_alloc(gfp, nr_pages);
 
+	bio_set_dev(new, bdev);
+	new->bi_opf = opf;
+
 	if (bio) {
 		bio_chain(bio, new);
 		submit_bio(bio);
diff --git a/block/blk-lib.c b/block/blk-lib.c
index 9245b300ef73e..1b8ced45e4e55 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -82,11 +82,8 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 		WARN_ON_ONCE((req_sects << 9) > UINT_MAX);
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 0, op, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, op, 0);
-
 		bio->bi_iter.bi_size = req_sects << 9;
 		sector += req_sects;
 		nr_sects -= req_sects;
@@ -176,14 +173,12 @@ static int __blkdev_issue_write_same(struct block_device *bdev, sector_t sector,
 	max_write_same_sectors = bio_allowed_max_sectors(q);
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 1, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 1, REQ_OP_WRITE_SAME, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
 		bio->bi_vcnt = 1;
 		bio->bi_io_vec->bv_page = page;
 		bio->bi_io_vec->bv_offset = 0;
 		bio->bi_io_vec->bv_len = bdev_logical_block_size(bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE_SAME, 0);
 
 		if (nr_sects > max_write_same_sectors) {
 			bio->bi_iter.bi_size = max_write_same_sectors << 9;
@@ -252,10 +247,8 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EOPNOTSUPP;
 
 	while (nr_sects) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
+		bio = blk_next_bio(bio, bdev, 0, REQ_OP_WRITE_ZEROES, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_WRITE_ZEROES;
 		if (flags & BLKDEV_ZERO_NOUNMAP)
 			bio->bi_opf |= REQ_NOUNMAP;
 
@@ -303,11 +296,9 @@ static int __blkdev_issue_zero_pages(struct block_device *bdev,
 		return -EPERM;
 
 	while (nr_sects != 0) {
-		bio = blk_next_bio(bio, __blkdev_sectors_to_bio_pages(nr_sects),
-				   gfp_mask);
+		bio = blk_next_bio(bio, bdev, __blkdev_sectors_to_bio_pages(nr_sects),
+				   REQ_OP_WRITE, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
-		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		while (nr_sects != 0) {
 			sz = min((sector_t) PAGE_SIZE, nr_sects << 9);
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 774ecc598bee2..5ab755d792c81 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -215,9 +215,8 @@ static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
 			continue;
 		}
 
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = REQ_OP_ZONE_RESET | REQ_SYNC;
+		bio = blk_next_bio(bio, bdev, 0, REQ_OP_ZONE_RESET | REQ_SYNC,
+				   gfp_mask);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
@@ -306,9 +305,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 	}
 
 	while (sector < end_sector) {
-		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = op | REQ_SYNC;
+		bio = blk_next_bio(bio, bdev, 0, op | REQ_SYNC, gfp_mask);
 		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
diff --git a/block/blk.h b/block/blk.h
index 8bd43b3ad33d5..6b93de33e8a43 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -406,8 +406,6 @@ extern int blk_iolatency_init(struct request_queue *q);
 static inline int blk_iolatency_init(struct request_queue *q) { return 0; }
 #endif
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
-
 #ifdef CONFIG_BLK_DEV_ZONED
 void blk_queue_free_zone_bitmaps(struct request_queue *q);
 void blk_queue_clear_zone_settings(struct request_queue *q);
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 46bc30fe85d2b..247de74247fab 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -412,10 +412,10 @@ static u16 nvmet_bdev_zone_mgmt_emulate_all(struct nvmet_req *req)
 
 	while (sector < get_capacity(bdev->bd_disk)) {
 		if (test_bit(blk_queue_zone_no(q, sector), d.zbitmap)) {
-			bio = blk_next_bio(bio, 0, GFP_KERNEL);
-			bio->bi_opf = zsa_req_op(req->cmd->zms.zsa) | REQ_SYNC;
+			bio = blk_next_bio(bio, bdev, 0,
+				zsa_req_op(req->cmd->zms.zsa) | REQ_SYNC,
+				GFP_KERNEL);
 			bio->bi_iter.bi_sector = sector;
-			bio_set_dev(bio, bdev);
 			/* This may take a while, so be nice to others */
 			cond_resched();
 		}
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 117d7f248ac96..edeae54074ede 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -790,6 +790,7 @@ static inline void bio_set_polled(struct bio *bio, struct kiocb *kiocb)
 		bio->bi_opf |= REQ_NOWAIT;
 }
 
-struct bio *blk_next_bio(struct bio *bio, unsigned int nr_pages, gfp_t gfp);
+struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
+		unsigned int nr_pages, unsigned int opf, gfp_t gfp);
 
 #endif /* __LINUX_BIO_H */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

