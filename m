Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6F4F55E1
	for <lists+dm-devel@lfdr.de>; Wed,  6 Apr 2022 08:13:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-MFH7Tt9RMm-jzQiPrk0ADQ-1; Wed, 06 Apr 2022 02:13:03 -0400
X-MC-Unique: MFH7Tt9RMm-jzQiPrk0ADQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8E1D811E7A;
	Wed,  6 Apr 2022 06:13:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEB8B7ADF;
	Wed,  6 Apr 2022 06:13:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A2DF193F6E4;
	Wed,  6 Apr 2022 06:13:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D92D19451F3
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Apr 2022 06:12:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CA4DC15E71; Wed,  6 Apr 2022 06:12:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 181FCC27DB8
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 06:12:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0154299E745
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 06:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-Y2vVfF8rMpKdmdCeD2dGuw-1; Wed, 06 Apr 2022 02:12:57 -0400
X-MC-Unique: Y2vVfF8rMpKdmdCeD2dGuw-1
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyuM-003zOY-1I; Wed, 06 Apr 2022 06:12:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:12:27 +0200
Message-Id: <20220406061228.410163-5-hch@lst.de>
In-Reply-To: <20220406061228.410163-1-hch@lst.de>
References: <20220406061228.410163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH 4/5] block: turn bio_kmalloc into a simple
 kmalloc wrapper
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
Cc: linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, target-devel@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove the magic autofree semantics and require the callers to explicitly
call bio_init to initialize the bio.

This allows bio_free to catch accidental bio_put calls on bio_init()ed
bios as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c                        | 47 ++++++++++++------------------
 block/blk-crypto-fallback.c        | 14 +++++----
 block/blk-map.c                    | 42 ++++++++++++++++----------
 drivers/block/pktcdvd.c            | 25 ++++++++--------
 drivers/md/bcache/debug.c          | 10 ++++---
 drivers/md/dm-bufio.c              |  9 +++---
 drivers/md/raid1.c                 | 12 +++++---
 drivers/md/raid10.c                | 21 ++++++++-----
 drivers/target/target_core_pscsi.c | 10 +++----
 fs/squashfs/block.c                | 15 +++++-----
 include/linux/bio.h                |  2 +-
 11 files changed, 112 insertions(+), 95 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index cdd7b2915c532..9d6366cec247e 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -224,24 +224,13 @@ EXPORT_SYMBOL(bio_uninit);
 static void bio_free(struct bio *bio)
 {
 	struct bio_set *bs = bio->bi_pool;
-	void *p;
-
-	bio_uninit(bio);
+	void *p = bio;
 
-	if (bs) {
-		bvec_free(&bs->bvec_pool, bio->bi_io_vec, bio->bi_max_vecs);
+	WARN_ON_ONCE(!bs);
 
-		/*
-		 * If we have front padding, adjust the bio pointer before freeing
-		 */
-		p = bio;
-		p -= bs->front_pad;
-
-		mempool_free(p, &bs->bio_pool);
-	} else {
-		/* Bio was allocated by bio_kmalloc() */
-		kfree(bio);
-	}
+	bio_uninit(bio);
+	bvec_free(&bs->bvec_pool, bio->bi_io_vec, bio->bi_max_vecs);
+	mempool_free(p - bs->front_pad, &bs->bio_pool);
 }
 
 /*
@@ -528,28 +517,28 @@ struct bio *bio_alloc_bioset(struct block_device *bdev, unsigned short nr_vecs,
 EXPORT_SYMBOL(bio_alloc_bioset);
 
 /**
- * bio_kmalloc - kmalloc a bio for I/O
+ * bio_kmalloc - kmalloc a bio
+ * @nr_vecs:	number of bio_vecs to allocate
  * @gfp_mask:   the GFP_* mask given to the slab allocator
- * @nr_iovecs:	number of iovecs to pre-allocate
  *
- * Use kmalloc to allocate and initialize a bio.
+ * Use kmalloc to allocate a bio (including bvecs).  The bio must be initialized
+ * using bio_init() before use.  To free a bio returned from this function use
+ * kfree() after calling bio_uninit().  A bio returned from this function can
+ * be reused by calling bio_uninit() before calling bio_init() again.
+ *
+ * Note that unlike bio_alloc() or bio_alloc_bioset() allocations from this
+ * function are not backed by a mempool can can fail.  Do not use this function
+ * for allocations in the file system I/O path.
  *
  * Returns: Pointer to new bio on success, NULL on failure.
  */
-struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned short nr_iovecs)
+struct bio *bio_kmalloc(unsigned short nr_vecs, gfp_t gfp_mask)
 {
 	struct bio *bio;
 
-	if (nr_iovecs > UIO_MAXIOV)
+	if (nr_vecs > UIO_MAXIOV)
 		return NULL;
-
-	bio = kmalloc(struct_size(bio, bi_inline_vecs, nr_iovecs), gfp_mask);
-	if (unlikely(!bio))
-		return NULL;
-	bio_init(bio, NULL, nr_iovecs ? bio->bi_inline_vecs : NULL, nr_iovecs,
-		 0);
-	bio->bi_pool = NULL;
-	return bio;
+	return kmalloc(struct_size(bio, bi_inline_vecs, nr_vecs), gfp_mask);
 }
 EXPORT_SYMBOL(bio_kmalloc);
 
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index 7c854584b52b5..5d1aa5b1d30a1 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -152,23 +152,25 @@ static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
 
 	src_bio->bi_status = enc_bio->bi_status;
 
-	bio_put(enc_bio);
+	bio_uninit(enc_bio);
+	kfree(enc_bio);
 	bio_endio(src_bio);
 }
 
 static struct bio *blk_crypto_fallback_clone_bio(struct bio *bio_src)
 {
+	unsigned int nr_segs = bio_segments(bio_src);
 	struct bvec_iter iter;
 	struct bio_vec bv;
 	struct bio *bio;
 
-	bio = bio_kmalloc(GFP_NOIO, bio_segments(bio_src));
+	bio = bio_kmalloc(nr_segs, GFP_NOIO);
 	if (!bio)
 		return NULL;
-	bio->bi_bdev		= bio_src->bi_bdev;
+	bio_init(bio, bio_src->bi_bdev, bio->bi_inline_vecs, nr_segs,
+		 bio_src->bi_opf);
 	if (bio_flagged(bio_src, BIO_REMAPPED))
 		bio_set_flag(bio, BIO_REMAPPED);
-	bio->bi_opf		= bio_src->bi_opf;
 	bio->bi_ioprio		= bio_src->bi_ioprio;
 	bio->bi_iter.bi_sector	= bio_src->bi_iter.bi_sector;
 	bio->bi_iter.bi_size	= bio_src->bi_iter.bi_size;
@@ -363,8 +365,8 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	blk_crypto_put_keyslot(slot);
 out_put_enc_bio:
 	if (enc_bio)
-		bio_put(enc_bio);
-
+		bio_uninit(enc_bio);
+	kfree(enc_bio);
 	return ret;
 }
 
diff --git a/block/blk-map.c b/block/blk-map.c
index c7f71d83eff18..7ffde64f90195 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -152,10 +152,10 @@ static int bio_copy_user_iov(struct request *rq, struct rq_map_data *map_data,
 	nr_pages = bio_max_segs(DIV_ROUND_UP(offset + len, PAGE_SIZE));
 
 	ret = -ENOMEM;
-	bio = bio_kmalloc(gfp_mask, nr_pages);
+	bio = bio_kmalloc(nr_pages, gfp_mask);
 	if (!bio)
 		goto out_bmd;
-	bio->bi_opf |= req_op(rq);
+	bio_init(bio, NULL, bio->bi_inline_vecs, nr_pages, req_op(rq));
 
 	if (map_data) {
 		nr_pages = 1 << map_data->page_order;
@@ -224,7 +224,8 @@ static int bio_copy_user_iov(struct request *rq, struct rq_map_data *map_data,
 cleanup:
 	if (!map_data)
 		bio_free_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 out_bmd:
 	kfree(bmd);
 	return ret;
@@ -234,6 +235,7 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 		gfp_t gfp_mask)
 {
 	unsigned int max_sectors = queue_max_hw_sectors(rq->q);
+	unsigned int nr_vecs = iov_iter_npages(iter, BIO_MAX_VECS);
 	struct bio *bio;
 	int ret;
 	int j;
@@ -241,10 +243,10 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 	if (!iov_iter_count(iter))
 		return -EINVAL;
 
-	bio = bio_kmalloc(gfp_mask, iov_iter_npages(iter, BIO_MAX_VECS));
+	bio = bio_kmalloc(nr_vecs, gfp_mask);
 	if (!bio)
 		return -ENOMEM;
-	bio->bi_opf |= req_op(rq);
+	bio_init(bio, NULL, bio->bi_inline_vecs, nr_vecs, req_op(rq));
 
 	while (iov_iter_count(iter)) {
 		struct page **pages;
@@ -303,7 +305,8 @@ static int bio_map_user_iov(struct request *rq, struct iov_iter *iter,
 
  out_unmap:
 	bio_release_pages(bio, false);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 	return ret;
 }
 
@@ -323,7 +326,8 @@ static void bio_invalidate_vmalloc_pages(struct bio *bio)
 static void bio_map_kern_endio(struct bio *bio)
 {
 	bio_invalidate_vmalloc_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 }
 
 /**
@@ -348,9 +352,10 @@ static struct bio *bio_map_kern(struct request_queue *q, void *data,
 	int offset, i;
 	struct bio *bio;
 
-	bio = bio_kmalloc(gfp_mask, nr_pages);
+	bio = bio_kmalloc(nr_pages, gfp_mask);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
+	bio_init(bio, NULL, bio->bi_inline_vecs, nr_pages, 0);
 
 	if (is_vmalloc) {
 		flush_kernel_vmap_range(data, len);
@@ -374,7 +379,8 @@ static struct bio *bio_map_kern(struct request_queue *q, void *data,
 		if (bio_add_pc_page(q, bio, page, bytes,
 				    offset) < bytes) {
 			/* we don't support partial mappings */
-			bio_put(bio);
+			bio_uninit(bio);
+			kfree(bio);
 			return ERR_PTR(-EINVAL);
 		}
 
@@ -390,7 +396,8 @@ static struct bio *bio_map_kern(struct request_queue *q, void *data,
 static void bio_copy_kern_endio(struct bio *bio)
 {
 	bio_free_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 }
 
 static void bio_copy_kern_endio_read(struct bio *bio)
@@ -435,9 +442,10 @@ static struct bio *bio_copy_kern(struct request_queue *q, void *data,
 		return ERR_PTR(-EINVAL);
 
 	nr_pages = end - start;
-	bio = bio_kmalloc(gfp_mask, nr_pages);
+	bio = bio_kmalloc(nr_pages, gfp_mask);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
+	bio_init(bio, NULL, bio->bi_inline_vecs, nr_pages, 0);
 
 	while (len) {
 		struct page *page;
@@ -471,7 +479,8 @@ static struct bio *bio_copy_kern(struct request_queue *q, void *data,
 
 cleanup:
 	bio_free_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 	return ERR_PTR(-ENOMEM);
 }
 
@@ -602,7 +611,8 @@ int blk_rq_unmap_user(struct bio *bio)
 
 		next_bio = bio;
 		bio = bio->bi_next;
-		bio_put(next_bio);
+		bio_uninit(next_bio);
+		kfree(next_bio);
 	}
 
 	return ret;
@@ -648,8 +658,10 @@ int blk_rq_map_kern(struct request_queue *q, struct request *rq, void *kbuf,
 	bio->bi_opf |= req_op(rq);
 
 	ret = blk_rq_append_bio(rq, bio);
-	if (unlikely(ret))
-		bio_put(bio);
+	if (unlikely(ret)) {
+		bio_uninit(bio);
+		kfree(bio);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(blk_rq_map_kern);
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 86c8794ede415..4a5b8730133c5 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -522,9 +522,10 @@ static struct packet_data *pkt_alloc_packet_data(int frames)
 		goto no_pkt;
 
 	pkt->frames = frames;
-	pkt->w_bio = bio_kmalloc(GFP_KERNEL, frames);
+	pkt->w_bio = bio_kmalloc(frames, GFP_KERNEL);
 	if (!pkt->w_bio)
 		goto no_bio;
+	bio_init(pkt->w_bio, NULL, pkt->w_bio->bi_inline_vecs, frames, 0);
 
 	for (i = 0; i < frames / FRAMES_PER_PAGE; i++) {
 		pkt->pages[i] = alloc_page(GFP_KERNEL|__GFP_ZERO);
@@ -536,10 +537,10 @@ static struct packet_data *pkt_alloc_packet_data(int frames)
 	bio_list_init(&pkt->orig_bios);
 
 	for (i = 0; i < frames; i++) {
-		struct bio *bio = bio_kmalloc(GFP_KERNEL, 1);
+		struct bio *bio = bio_kmalloc(1, GFP_KERNEL);
 		if (!bio)
 			goto no_rd_bio;
-
+		bio_init(bio, NULL, bio->bi_inline_vecs, 1, 0);
 		pkt->r_bios[i] = bio;
 	}
 
@@ -547,16 +548,16 @@ static struct packet_data *pkt_alloc_packet_data(int frames)
 
 no_rd_bio:
 	for (i = 0; i < frames; i++) {
-		struct bio *bio = pkt->r_bios[i];
-		if (bio)
-			bio_put(bio);
+		if (pkt->r_bios[i])
+			bio_uninit(pkt->r_bios[i]);
+		kfree(pkt->r_bios[i]);
 	}
-
 no_page:
 	for (i = 0; i < frames / FRAMES_PER_PAGE; i++)
 		if (pkt->pages[i])
 			__free_page(pkt->pages[i]);
-	bio_put(pkt->w_bio);
+	bio_uninit(pkt->w_bio);
+	kfree(pkt->w_bio);
 no_bio:
 	kfree(pkt);
 no_pkt:
@@ -571,13 +572,13 @@ static void pkt_free_packet_data(struct packet_data *pkt)
 	int i;
 
 	for (i = 0; i < pkt->frames; i++) {
-		struct bio *bio = pkt->r_bios[i];
-		if (bio)
-			bio_put(bio);
+		bio_uninit(pkt->r_bios[i]);
+		kfree(pkt->r_bios[i]);
 	}
 	for (i = 0; i < pkt->frames / FRAMES_PER_PAGE; i++)
 		__free_page(pkt->pages[i]);
-	bio_put(pkt->w_bio);
+	bio_uninit(pkt->w_bio);
+	kfree(pkt->w_bio);
 	kfree(pkt);
 }
 
diff --git a/drivers/md/bcache/debug.c b/drivers/md/bcache/debug.c
index 6230dfdd9286e..7510d1c983a5e 100644
--- a/drivers/md/bcache/debug.c
+++ b/drivers/md/bcache/debug.c
@@ -107,15 +107,16 @@ void bch_btree_verify(struct btree *b)
 
 void bch_data_verify(struct cached_dev *dc, struct bio *bio)
 {
+	unsigned int nr_segs = bio_segments(bio);
 	struct bio *check;
 	struct bio_vec bv, cbv;
 	struct bvec_iter iter, citer = { 0 };
 
-	check = bio_kmalloc(GFP_NOIO, bio_segments(bio));
+	check = bio_kmalloc(nr_segs, GFP_NOIO);
 	if (!check)
 		return;
-	bio_set_dev(check, bio->bi_bdev);
-	check->bi_opf = REQ_OP_READ;
+	bio_init(check, bio->bi_bdev, check->bi_inline_vecs, nr_segs,
+		 REQ_OP_READ);
 	check->bi_iter.bi_sector = bio->bi_iter.bi_sector;
 	check->bi_iter.bi_size = bio->bi_iter.bi_size;
 
@@ -146,7 +147,8 @@ void bch_data_verify(struct cached_dev *dc, struct bio *bio)
 
 	bio_free_pages(check);
 out_put:
-	bio_put(check);
+	bio_uninit(check);
+	kfree(check);
 }
 
 #endif
diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index e9cbc70d5a0ee..5ffa1dcf84cfc 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -611,7 +611,8 @@ static void bio_complete(struct bio *bio)
 {
 	struct dm_buffer *b = bio->bi_private;
 	blk_status_t status = bio->bi_status;
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 	b->end_io(b, status);
 }
 
@@ -626,16 +627,14 @@ static void use_bio(struct dm_buffer *b, int rw, sector_t sector,
 	if (unlikely(b->c->sectors_per_block_bits < PAGE_SHIFT - SECTOR_SHIFT))
 		vec_size += 2;
 
-	bio = bio_kmalloc(GFP_NOWAIT | __GFP_NORETRY | __GFP_NOWARN, vec_size);
+	bio = bio_kmalloc(vec_size, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOWARN);
 	if (!bio) {
 dmio:
 		use_dmio(b, rw, sector, n_sectors, offset);
 		return;
 	}
-
+	bio_init(bio, b->c->bdev, bio->bi_inline_vecs, vec_size, rw);
 	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, b->c->bdev);
-	bio_set_op_attrs(bio, rw, 0);
 	bio->bi_end_io = bio_complete;
 	bio->bi_private = b;
 
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 99d5464a51f81..d785c3169426d 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -165,9 +165,10 @@ static void * r1buf_pool_alloc(gfp_t gfp_flags, void *data)
 	 * Allocate bios : 1 for reading, n-1 for writing
 	 */
 	for (j = pi->raid_disks ; j-- ; ) {
-		bio = bio_kmalloc(gfp_flags, RESYNC_PAGES);
+		bio = bio_kmalloc(RESYNC_PAGES, gfp_flags);
 		if (!bio)
 			goto out_free_bio;
+		bio_init(bio, NULL, bio->bi_inline_vecs, RESYNC_PAGES, 0);
 		r1_bio->bios[j] = bio;
 	}
 	/*
@@ -206,8 +207,10 @@ static void * r1buf_pool_alloc(gfp_t gfp_flags, void *data)
 		resync_free_pages(&rps[j]);
 
 out_free_bio:
-	while (++j < pi->raid_disks)
-		bio_put(r1_bio->bios[j]);
+	while (++j < pi->raid_disks) {
+		bio_uninit(r1_bio->bios[j]);
+		kfree(r1_bio->bios[j]);
+	}
 	kfree(rps);
 
 out_free_r1bio:
@@ -225,7 +228,8 @@ static void r1buf_pool_free(void *__r1_bio, void *data)
 	for (i = pi->raid_disks; i--; ) {
 		rp = get_resync_pages(r1bio->bios[i]);
 		resync_free_pages(rp);
-		bio_put(r1bio->bios[i]);
+		bio_uninit(r1bio->bios[i]);
+		kfree(r1bio->bios[i]);
 	}
 
 	/* resync pages array stored in the 1st bio's .bi_private */
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index dfe7d62d3fbdd..ee2438c0e55ea 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -145,15 +145,17 @@ static void * r10buf_pool_alloc(gfp_t gfp_flags, void *data)
 	 * Allocate bios.
 	 */
 	for (j = nalloc ; j-- ; ) {
-		bio = bio_kmalloc(gfp_flags, RESYNC_PAGES);
+		bio = bio_kmalloc(RESYNC_PAGES, gfp_flags);
 		if (!bio)
 			goto out_free_bio;
+		bio_init(bio, NULL, bio->bi_inline_vecs, RESYNC_PAGES, 0);
 		r10_bio->devs[j].bio = bio;
 		if (!conf->have_replacement)
 			continue;
-		bio = bio_kmalloc(gfp_flags, RESYNC_PAGES);
+		bio = bio_kmalloc(RESYNC_PAGES, gfp_flags);
 		if (!bio)
 			goto out_free_bio;
+		bio_init(bio, NULL, bio->bi_inline_vecs, RESYNC_PAGES, 0);
 		r10_bio->devs[j].repl_bio = bio;
 	}
 	/*
@@ -197,9 +199,11 @@ static void * r10buf_pool_alloc(gfp_t gfp_flags, void *data)
 out_free_bio:
 	for ( ; j < nalloc; j++) {
 		if (r10_bio->devs[j].bio)
-			bio_put(r10_bio->devs[j].bio);
+			bio_uninit(r10_bio->devs[j].bio);
+		kfree(r10_bio->devs[j].bio);
 		if (r10_bio->devs[j].repl_bio)
-			bio_put(r10_bio->devs[j].repl_bio);
+			bio_uninit(r10_bio->devs[j].repl_bio);
+		kfree(r10_bio->devs[j].repl_bio);
 	}
 	kfree(rps);
 out_free_r10bio:
@@ -220,12 +224,15 @@ static void r10buf_pool_free(void *__r10_bio, void *data)
 		if (bio) {
 			rp = get_resync_pages(bio);
 			resync_free_pages(rp);
-			bio_put(bio);
+			bio_uninit(bio);
+			kfree(bio);
 		}
 
 		bio = r10bio->devs[j].repl_bio;
-		if (bio)
-			bio_put(bio);
+		if (bio) {
+			bio_uninit(bio);
+			kfree(bio);
+		}
 	}
 
 	/* resync pages array stored in the 1st bio's .bi_private */
diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index 77bd3af4b2bf8..dc3007a133571 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -818,7 +818,8 @@ static ssize_t pscsi_show_configfs_dev_params(struct se_device *dev, char *b)
 
 static void pscsi_bi_endio(struct bio *bio)
 {
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 }
 
 static sense_reason_t
@@ -861,14 +862,13 @@ pscsi_map_sg(struct se_cmd *cmd, struct scatterlist *sgl, u32 sgl_nents,
 			if (!bio) {
 new_bio:
 				nr_vecs = bio_max_segs(nr_pages);
-				bio = bio_kmalloc(GFP_KERNEL, nr_vecs);
+				bio = bio_kmalloc(nr_vecs, GFP_KERNEL);
 				if (!bio)
 					goto fail;
+				bio_init(bio, NULL, bio->bi_inline_vecs, nr_vecs,
+					 rw ? REQ_OP_WRITE : REQ_OP_READ);
 				bio->bi_end_io = pscsi_bi_endio;
 
-				if (rw)
-					bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
-
 				pr_debug("PSCSI: Allocated bio: %p,"
 					" dir: %s nr_vecs: %d\n", bio,
 					(rw) ? "rw" : "r", nr_vecs);
diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 4311a32218928..8879d052f96c6 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -86,12 +86,10 @@ static int squashfs_bio_read(struct super_block *sb, u64 index, int length,
 	int error, i;
 	struct bio *bio;
 
-	bio = bio_kmalloc(GFP_NOIO, page_count);
+	bio = bio_kmalloc(page_count, GFP_NOIO);
 	if (!bio)
 		return -ENOMEM;
-	bio_set_dev(bio, sb->s_bdev);
-	bio->bi_opf = REQ_OP_READ;
-
+	bio_init(bio, sb->s_bdev, bio->bi_inline_vecs, page_count, REQ_OP_READ);
 	bio->bi_iter.bi_sector = block * (msblk->devblksize >> SECTOR_SHIFT);
 
 	for (i = 0; i < page_count; ++i) {
@@ -121,7 +119,8 @@ static int squashfs_bio_read(struct super_block *sb, u64 index, int length,
 
 out_free_bio:
 	bio_free_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 	return error;
 }
 
@@ -185,7 +184,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 			length |= data[0] << 8;
 		}
 		bio_free_pages(bio);
-		bio_put(bio);
+		bio_uninit(bio);
+		kfree(bio);
 
 		compressed = SQUASHFS_COMPRESSED(length);
 		length = SQUASHFS_COMPRESSED_SIZE(length);
@@ -219,7 +219,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 
 out_free_bio:
 	bio_free_pages(bio);
-	bio_put(bio);
+	bio_uninit(bio);
+	kfree(bio);
 out:
 	if (res < 0) {
 		ERROR("Failed to read block 0x%llx: %d\n", index, res);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 278cc81cc1e7f..ab77473c855be 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -407,7 +407,7 @@ struct bio *bio_alloc_bioset(struct block_device *bdev, unsigned short nr_vecs,
 			     struct bio_set *bs);
 struct bio *bio_alloc_kiocb(struct kiocb *kiocb, struct block_device *bdev,
 		unsigned short nr_vecs, unsigned int opf, struct bio_set *bs);
-struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned short nr_iovecs);
+struct bio *bio_kmalloc(unsigned short nr_vecs, gfp_t gfp_mask);
 extern void bio_put(struct bio *);
 
 struct bio *bio_alloc_clone(struct block_device *bdev, struct bio *bio_src,
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

