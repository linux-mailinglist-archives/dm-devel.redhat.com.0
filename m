Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6C49DB36
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jan 2022 08:10:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-5u2XCbXvPziMF52RZWIiHw-1; Thu, 27 Jan 2022 02:10:11 -0500
X-MC-Unique: 5u2XCbXvPziMF52RZWIiHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B621B18BCD;
	Thu, 27 Jan 2022 07:10:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5008778DEB;
	Thu, 27 Jan 2022 07:10:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65CC81809CB9;
	Thu, 27 Jan 2022 07:10:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20R79orP002630 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 02:09:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01A70C19149; Thu, 27 Jan 2022 07:09:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1C83C080B3
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 07:09:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D270E10F97CF
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 07:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-461-n9BweJODOriqqzydqrlvZQ-1; Thu, 27 Jan 2022 02:09:47 -0500
X-MC-Unique: n9BweJODOriqqzydqrlvZQ-1
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyOd-00EYIe-GZ; Thu, 27 Jan 2022 06:36:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:46 +0100
Message-Id: <20220127063546.1314111-15-hch@lst.de>
In-Reply-To: <20220127063546.1314111-1-hch@lst.de>
References: <20220127063546.1314111-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [dm-devel] [PATCH 14/14] block: pass a block_device to
	bio_clone_fast
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass a block_device to bio_clone_fast and __bio_clone_fast and give
the functions more suitable names.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/block/biodoc.rst   |  5 -----
 block/bio.c                      | 31 +++++++++++++++++------------
 block/blk-mq.c                   |  4 ++--
 block/bounce.c                   |  3 +--
 drivers/block/drbd/drbd_req.c    |  4 ++--
 drivers/block/drbd/drbd_worker.c |  4 ++--
 drivers/block/pktcdvd.c          |  4 ++--
 drivers/md/bcache/request.c      |  5 +++--
 drivers/md/dm-cache-target.c     |  4 ++--
 drivers/md/dm-crypt.c            | 11 +++++------
 drivers/md/dm-zoned-target.c     |  3 +--
 drivers/md/dm.c                  |  5 +++--
 drivers/md/md-faulty.c           |  4 ++--
 drivers/md/md-multipath.c        |  3 +--
 drivers/md/md.c                  |  5 +++--
 drivers/md/raid1.c               | 34 ++++++++++++++++----------------
 drivers/md/raid10.c              | 16 +++++++--------
 drivers/md/raid5.c               |  4 ++--
 fs/btrfs/extent_io.c             |  4 ++--
 include/linux/bio.h              |  6 ++++--
 20 files changed, 80 insertions(+), 79 deletions(-)

diff --git a/Documentation/block/biodoc.rst b/Documentation/block/biodoc.rst
index 2098477851a4b..4fbc367e62f95 100644
--- a/Documentation/block/biodoc.rst
+++ b/Documentation/block/biodoc.rst
@@ -663,11 +663,6 @@ to i/o submission, if the bio fields are likely to be accessed after the
 i/o is issued (since the bio may otherwise get freed in case i/o completion
 happens in the meantime).
 
-The bio_clone_fast() routine may be used to duplicate a bio, where the clone
-shares the bio_vec_list with the original bio (i.e. both point to the
-same bio_vec_list). This would typically be used for splitting i/o requests
-in lvm or md.
-
 3.2 Generic bio helper Routines
 -------------------------------
 
diff --git a/block/bio.c b/block/bio.c
index eae1deba18962..73cc0fa98dd4a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -731,7 +731,8 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 	bio_set_flag(bio, BIO_CLONED);
 	if (bio_flagged(bio_src, BIO_THROTTLED))
 		bio_set_flag(bio, BIO_THROTTLED);
-	if (bio_flagged(bio_src, BIO_REMAPPED))
+	if (bio->bi_bdev == bio_src->bi_bdev &&
+	    bio_flagged(bio_src, BIO_REMAPPED))
 		bio_set_flag(bio, BIO_REMAPPED);
 	bio->bi_ioprio = bio_src->bi_ioprio;
 	bio->bi_write_hint = bio_src->bi_write_hint;
@@ -749,7 +750,8 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 }
 
 /**
- * bio_clone_fast - clone a bio that shares the original bio's biovec
+ * bio_alloc_clone - clone a bio that shares the original bio's biovec
+ * @bdev: block_device to clone onto
  * @bio_src: bio to clone from
  * @gfp: allocation priority
  * @bs: bio_set to allocate from
@@ -759,11 +761,12 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
  *
  * The caller must ensure that the return bio is not freed before @bio_src.
  */
-struct bio *bio_clone_fast(struct bio *bio_src, gfp_t gfp, struct bio_set *bs)
+struct bio *bio_alloc_clone(struct block_device *bdev, struct bio *bio_src,
+		gfp_t gfp, struct bio_set *bs)
 {
 	struct bio *bio;
 
-	bio = bio_alloc_bioset(bio_src->bi_bdev, 0, bio_src->bi_opf, gfp, bs);
+	bio = bio_alloc_bioset(bdev, 0, bio_src->bi_opf, gfp, bs);
 	if (!bio)
 		return NULL;
 
@@ -775,10 +778,11 @@ struct bio *bio_clone_fast(struct bio *bio_src, gfp_t gfp, struct bio_set *bs)
 
 	return bio;
 }
-EXPORT_SYMBOL(bio_clone_fast);
+EXPORT_SYMBOL(bio_alloc_clone);
 
 /**
- * __bio_clone_fast - clone a bio that shares the original bio's biovec
+ * bio_init_clone - clone a bio that shares the original bio's biovec
+ * @bdev: block_device to clone onto
  * @bio: bio to clone into
  * @bio_src: bio to clone from
  * @gfp: allocation priority
@@ -788,17 +792,18 @@ EXPORT_SYMBOL(bio_clone_fast);
  *
  * The caller must ensure that @bio_src is not freed before @bio.
  */
-int __bio_clone_fast(struct bio *bio, struct bio *bio_src, gfp_t gfp)
+int bio_init_clone(struct block_device *bdev, struct bio *bio,
+		struct bio *bio_src, gfp_t gfp)
 {
 	int ret;
 
-	bio_init(bio, bio_src->bi_bdev, bio_src->bi_io_vec, 0, bio_src->bi_opf);
+	bio_init(bio, bdev, bio_src->bi_io_vec, 0, bio_src->bi_opf);
 	ret = __bio_clone(bio, bio_src, gfp);
 	if (ret)
 		bio_uninit(bio);
 	return ret;
 }
-EXPORT_SYMBOL(__bio_clone_fast);
+EXPORT_SYMBOL(bio_init_clone);
 
 const char *bio_devname(struct bio *bio, char *buf)
 {
@@ -1570,7 +1575,7 @@ struct bio *bio_split(struct bio *bio, int sectors,
 	if (WARN_ON_ONCE(bio_op(bio) == REQ_OP_ZONE_APPEND))
 		return NULL;
 
-	split = bio_clone_fast(bio, gfp, bs);
+	split = bio_alloc_clone(bio->bi_bdev, bio, gfp, bs);
 	if (!split)
 		return NULL;
 
@@ -1665,9 +1670,9 @@ EXPORT_SYMBOL(bioset_exit);
  *    Note that the bio must be embedded at the END of that structure always,
  *    or things will break badly.
  *    If %BIOSET_NEED_BVECS is set in @flags, a separate pool will be allocated
- *    for allocating iovecs.  This pool is not needed e.g. for bio_clone_fast().
- *    If %BIOSET_NEED_RESCUER is set, a workqueue is created which can be used to
- *    dispatch queued requests when the mempool runs out of space.
+ *    for allocating iovecs.  This pool is not needed e.g. for bio_init_clone().
+ *    If %BIOSET_NEED_RESCUER is set, a workqueue is created which can be used
+ *    to dispatch queued requests when the mempool runs out of space.
  *
  */
 int bioset_init(struct bio_set *bs,
diff --git a/block/blk-mq.c b/block/blk-mq.c
index f3bf3358a3bb2..772e7e276808a 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2973,10 +2973,10 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 		bs = &fs_bio_set;
 
 	__rq_for_each_bio(bio_src, rq_src) {
-		bio = bio_clone_fast(bio_src, gfp_mask, bs);
+		bio = bio_alloc_clone(rq->q->disk->part0, bio_src, gfp_mask,
+				      bs);
 		if (!bio)
 			goto free_and_out;
-		bio->bi_bdev = rq->q->disk->part0;
 
 		if (bio_ctr && bio_ctr(bio, bio_src, data))
 			goto free_and_out;
diff --git a/block/bounce.c b/block/bounce.c
index 330ddde25b460..3fd3bc6fd5dbb 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -162,8 +162,7 @@ static struct bio *bounce_clone_bio(struct bio *bio_src)
 	 *    that does not own the bio - reason being drivers don't use it for
 	 *    iterating over the biovec anymore, so expecting it to be kept up
 	 *    to date (i.e. for clones that share the parent biovec) is just
-	 *    asking for trouble and would force extra work on
-	 *    __bio_clone_fast() anyways.
+	 *    asking for trouble and would force extra work.
 	 */
 	bio = bio_alloc_bioset(bio_src->bi_bdev, bio_segments(bio_src),
 			       bio_src->bi_opf, GFP_NOIO, &bounce_bio_set);
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 8d44e96c4c4ef..c00ae8619519e 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -30,8 +30,8 @@ static struct drbd_request *drbd_req_new(struct drbd_device *device, struct bio
 		return NULL;
 	memset(req, 0, sizeof(*req));
 
-	req->private_bio = bio_clone_fast(bio_src, GFP_NOIO, &drbd_io_bio_set);
-	bio_set_dev(req->private_bio, device->ldev->backing_bdev);
+	req->private_bio = bio_alloc_clone(device->ldev->backing_bdev, bio_src,
+					   GFP_NOIO, &drbd_io_bio_set);
 	req->private_bio->bi_private = req;
 	req->private_bio->bi_end_io = drbd_request_endio;
 
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 64563bfdf0da0..a5e04b38006b6 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1523,9 +1523,9 @@ int w_restart_disk_io(struct drbd_work *w, int cancel)
 	if (bio_data_dir(req->master_bio) == WRITE && req->rq_state & RQ_IN_ACT_LOG)
 		drbd_al_begin_io(device, &req->i);
 
-	req->private_bio = bio_clone_fast(req->master_bio, GFP_NOIO,
+	req->private_bio = bio_alloc_clone(device->ldev->backing_bdev,
+					   req->master_bio, GFP_NOIO,
 					  &drbd_io_bio_set);
-	bio_set_dev(req->private_bio, device->ldev->backing_bdev);
 	req->private_bio->bi_private = req;
 	req->private_bio->bi_end_io = drbd_request_endio;
 	submit_bio_noacct(req->private_bio);
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 3aa5954429462..be749c686feb7 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2294,12 +2294,12 @@ static void pkt_end_io_read_cloned(struct bio *bio)
 
 static void pkt_make_request_read(struct pktcdvd_device *pd, struct bio *bio)
 {
-	struct bio *cloned_bio = bio_clone_fast(bio, GFP_NOIO, &pkt_bio_set);
+	struct bio *cloned_bio =
+		bio_alloc_clone(pd->bdev, bio, GFP_NOIO, &pkt_bio_set);
 	struct packet_stacked_data *psd = mempool_alloc(&psd_pool, GFP_NOIO);
 
 	psd->pd = pd;
 	psd->bio = bio;
-	bio_set_dev(cloned_bio, pd->bdev);
 	cloned_bio->bi_private = psd;
 	cloned_bio->bi_end_io = pkt_end_io_read_cloned;
 	pd->stats.secs_r += bio_sectors(bio);
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index d2cb853bf9173..6869e010475a3 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -685,7 +685,7 @@ static void do_bio_hook(struct search *s,
 {
 	struct bio *bio = &s->bio.bio;
 
-	__bio_clone_fast(bio, orig_bio, GFP_NOIO);
+	bio_init_clone(bio->bi_bdev, bio, orig_bio, GFP_NOIO);
 	/*
 	 * bi_end_io can be set separately somewhere else, e.g. the
 	 * variants in,
@@ -1036,7 +1036,8 @@ static void cached_dev_write(struct cached_dev *dc, struct search *s)
 			closure_bio_submit(s->iop.c, flush, cl);
 		}
 	} else {
-		s->iop.bio = bio_clone_fast(bio, GFP_NOIO, &dc->disk.bio_split);
+		s->iop.bio = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOIO,
+					     &dc->disk.bio_split);
 		/* I/O request sent to backing device */
 		bio->bi_end_io = backing_request_endio;
 		closure_bio_submit(s->iop.c, bio, cl);
diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1c37fe028e531..89fdfb49d564e 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -819,13 +819,13 @@ static void issue_op(struct bio *bio, void *context)
 static void remap_to_origin_and_cache(struct cache *cache, struct bio *bio,
 				      dm_oblock_t oblock, dm_cblock_t cblock)
 {
-	struct bio *origin_bio = bio_clone_fast(bio, GFP_NOIO, &cache->bs);
+	struct bio *origin_bio = bio_alloc_clone(cache->origin_dev->bdev, bio,
+						 GFP_NOIO, &cache->bs);
 
 	BUG_ON(!origin_bio);
 
 	bio_chain(origin_bio, bio);
 
-	remap_to_origin(cache, origin_bio);
 	if (bio_data_dir(origin_bio) == WRITE)
 		clear_discard(cache, oblock_to_dblock(cache, oblock));
 	submit_bio(origin_bio);
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index f7e4435b7439a..a5006cb6ee8ad 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1834,17 +1834,16 @@ static int kcryptd_io_read(struct dm_crypt_io *io, gfp_t gfp)
 	struct bio *clone;
 
 	/*
-	 * We need the original biovec array in order to decrypt
-	 * the whole bio data *afterwards* -- thanks to immutable
-	 * biovecs we don't need to worry about the block layer
-	 * modifying the biovec array; so leverage bio_clone_fast().
+	 * We need the original biovec array in order to decrypt the whole bio
+	 * data *afterwards* -- thanks to immutable biovecs we don't need to
+	 * worry about the block layer modifying the biovec array; so leverage
+	 * bio_alloc_clone().
 	 */
-	clone = bio_clone_fast(io->base_bio, gfp, &cc->bs);
+	clone = bio_alloc_clone(cc->dev->bdev, io->base_bio, gfp, &cc->bs);
 	if (!clone)
 		return 1;
 	clone->bi_private = io;
 	clone->bi_end_io = crypt_endio;
-	bio_set_dev(clone, cc->dev->bdev);
 
 	crypt_inc_pending(io);
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 166c4e9d99c97..a3f6d3ef38174 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -125,11 +125,10 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
 	if (dev->flags & DMZ_BDEV_DYING)
 		return -EIO;
 
-	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
+	clone = bio_alloc_clone(dev->bdev, bio, GFP_NOIO, &dmz->bio_set);
 	if (!clone)
 		return -ENOMEM;
 
-	bio_set_dev(clone, dev->bdev);
 	bioctx->dev = dev;
 	clone->bi_iter.bi_sector =
 		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b08e0732f71d7..d3a6c25c85b18 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -547,15 +547,16 @@ static void free_io(struct mapped_device *md, struct dm_io *io)
 static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 		unsigned target_bio_nr, unsigned *len, gfp_t gfp_mask)
 {
+	struct block_device *bdev = ci->bio->bi_bdev;
 	struct dm_target_io *tio;
 
 	if (!ci->io->tio.io) {
 		/* the dm_target_io embedded in ci->io is available */
 		tio = &ci->io->tio;
-		if (__bio_clone_fast(&tio->clone, ci->bio, gfp_mask) < 0)
+		if (bio_init_clone(bdev, &tio->clone, ci->bio, gfp_mask) < 0)
 			return NULL;
 	} else {
-		struct bio *clone = bio_clone_fast(ci->bio, gfp_mask,
+		struct bio *clone = bio_alloc_clone(bdev, ci->bio, gfp_mask,
 						   &ci->io->md->bs);
 		if (!clone)
 			return NULL;
diff --git a/drivers/md/md-faulty.c b/drivers/md/md-faulty.c
index c0dc6f2ef4a3d..50ad818978a43 100644
--- a/drivers/md/md-faulty.c
+++ b/drivers/md/md-faulty.c
@@ -205,9 +205,9 @@ static bool faulty_make_request(struct mddev *mddev, struct bio *bio)
 		}
 	}
 	if (failit) {
-		struct bio *b = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
+		struct bio *b = bio_alloc_clone(conf->rdev->bdev, bio, GFP_NOIO,
+						&mddev->bio_set);
 
-		bio_set_dev(b, conf->rdev->bdev);
 		b->bi_private = bio;
 		b->bi_end_io = faulty_fail;
 		bio = b;
diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index 483a5500f83cd..97fb948e3e741 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -121,10 +121,9 @@ static bool multipath_make_request(struct mddev *mddev, struct bio * bio)
 	}
 	multipath = conf->multipaths + mp_bh->path;
 
-	__bio_clone_fast(&mp_bh->bio, bio, GFP_NOIO);
+	bio_init_clone(multipath->rdev->bdev, &mp_bh->bio, bio, GFP_NOIO);
 
 	mp_bh->bio.bi_iter.bi_sector += multipath->rdev->data_offset;
-	bio_set_dev(&mp_bh->bio, multipath->rdev->bdev);
 	mp_bh->bio.bi_opf |= REQ_FAILFAST_TRANSPORT;
 	mp_bh->bio.bi_end_io = multipath_end_request;
 	mp_bh->bio.bi_private = mp_bh;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 0a89f072dae0d..f88a9e948f3eb 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -8634,13 +8634,14 @@ static void md_end_io_acct(struct bio *bio)
  */
 void md_account_bio(struct mddev *mddev, struct bio **bio)
 {
+	struct block_device *bdev = (*bio)->bi_bdev;
 	struct md_io_acct *md_io_acct;
 	struct bio *clone;
 
-	if (!blk_queue_io_stat((*bio)->bi_bdev->bd_disk->queue))
+	if (!blk_queue_io_stat(bdev->bd_disk->queue))
 		return;
 
-	clone = bio_clone_fast(*bio, GFP_NOIO, &mddev->io_acct_set);
+	clone = bio_alloc_clone(bdev, *bio, GFP_NOIO, &mddev->io_acct_set);
 	md_io_acct = container_of(clone, struct md_io_acct, bio_clone);
 	md_io_acct->orig_bio = *bio;
 	md_io_acct->start_time = bio_start_io_acct(*bio);
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index e7710fb5befb4..c3288d46948de 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1320,13 +1320,13 @@ static void raid1_read_request(struct mddev *mddev, struct bio *bio,
 	if (!r1bio_existed && blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
 		r1_bio->start_time = bio_start_io_acct(bio);
 
-	read_bio = bio_clone_fast(bio, gfp, &mddev->bio_set);
+	read_bio = bio_alloc_clone(mirror->rdev->bdev, bio, gfp,
+				   &mddev->bio_set);
 
 	r1_bio->bios[rdisk] = read_bio;
 
 	read_bio->bi_iter.bi_sector = r1_bio->sector +
 		mirror->rdev->data_offset;
-	bio_set_dev(read_bio, mirror->rdev->bdev);
 	read_bio->bi_end_io = raid1_end_read_request;
 	bio_set_op_attrs(read_bio, op, do_sync);
 	if (test_bit(FailFast, &mirror->rdev->flags) &&
@@ -1546,24 +1546,25 @@ static void raid1_write_request(struct mddev *mddev, struct bio *bio,
 			first_clone = 0;
 		}
 
-		if (r1_bio->behind_master_bio)
-			mbio = bio_clone_fast(r1_bio->behind_master_bio,
-					      GFP_NOIO, &mddev->bio_set);
-		else
-			mbio = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
-
 		if (r1_bio->behind_master_bio) {
+			mbio = bio_alloc_clone(rdev->bdev,
+					       r1_bio->behind_master_bio,
+					       GFP_NOIO, &mddev->bio_set);
 			if (test_bit(CollisionCheck, &rdev->flags))
 				wait_for_serialization(rdev, r1_bio);
 			if (test_bit(WriteMostly, &rdev->flags))
 				atomic_inc(&r1_bio->behind_remaining);
-		} else if (mddev->serialize_policy)
-			wait_for_serialization(rdev, r1_bio);
+		} else {
+			mbio = bio_alloc_clone(rdev->bdev, bio, GFP_NOIO,
+					       &mddev->bio_set);
+
+			if (mddev->serialize_policy)
+				wait_for_serialization(rdev, r1_bio);
+		}
 
 		r1_bio->bios[i] = mbio;
 
 		mbio->bi_iter.bi_sector	= (r1_bio->sector + rdev->data_offset);
-		bio_set_dev(mbio, rdev->bdev);
 		mbio->bi_end_io	= raid1_end_write_request;
 		mbio->bi_opf = bio_op(bio) | (bio->bi_opf & (REQ_SYNC | REQ_FUA));
 		if (test_bit(FailFast, &rdev->flags) &&
@@ -2416,12 +2417,12 @@ static int narrow_write_error(struct r1bio *r1_bio, int i)
 		/* Write at 'sector' for 'sectors'*/
 
 		if (test_bit(R1BIO_BehindIO, &r1_bio->state)) {
-			wbio = bio_clone_fast(r1_bio->behind_master_bio,
-					      GFP_NOIO,
-					      &mddev->bio_set);
+			wbio = bio_alloc_clone(rdev->bdev,
+					       r1_bio->behind_master_bio,
+					       GFP_NOIO, &mddev->bio_set);
 		} else {
-			wbio = bio_clone_fast(r1_bio->master_bio, GFP_NOIO,
-					      &mddev->bio_set);
+			wbio = bio_alloc_clone(rdev->bdev, r1_bio->master_bio,
+					       GFP_NOIO, &mddev->bio_set);
 		}
 
 		bio_set_op_attrs(wbio, REQ_OP_WRITE, 0);
@@ -2430,7 +2431,6 @@ static int narrow_write_error(struct r1bio *r1_bio, int i)
 
 		bio_trim(wbio, sector - r1_bio->sector, sectors);
 		wbio->bi_iter.bi_sector += rdev->data_offset;
-		bio_set_dev(wbio, rdev->bdev);
 
 		if (submit_bio_wait(wbio) < 0)
 			/* failure! */
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index da07bcbc06d08..5dd2e17e1d0ea 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -1208,14 +1208,13 @@ static void raid10_read_request(struct mddev *mddev, struct bio *bio,
 
 	if (blk_queue_io_stat(bio->bi_bdev->bd_disk->queue))
 		r10_bio->start_time = bio_start_io_acct(bio);
-	read_bio = bio_clone_fast(bio, gfp, &mddev->bio_set);
+	read_bio = bio_alloc_clone(rdev->bdev, bio, gfp, &mddev->bio_set);
 
 	r10_bio->devs[slot].bio = read_bio;
 	r10_bio->devs[slot].rdev = rdev;
 
 	read_bio->bi_iter.bi_sector = r10_bio->devs[slot].addr +
 		choose_data_offset(r10_bio, rdev);
-	bio_set_dev(read_bio, rdev->bdev);
 	read_bio->bi_end_io = raid10_end_read_request;
 	bio_set_op_attrs(read_bio, op, do_sync);
 	if (test_bit(FailFast, &rdev->flags) &&
@@ -1255,7 +1254,7 @@ static void raid10_write_one_disk(struct mddev *mddev, struct r10bio *r10_bio,
 	} else
 		rdev = conf->mirrors[devnum].rdev;
 
-	mbio = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
+	mbio = bio_alloc_clone(rdev->bdev, bio, GFP_NOIO, &mddev->bio_set);
 	if (replacement)
 		r10_bio->devs[n_copy].repl_bio = mbio;
 	else
@@ -1263,7 +1262,6 @@ static void raid10_write_one_disk(struct mddev *mddev, struct r10bio *r10_bio,
 
 	mbio->bi_iter.bi_sector	= (r10_bio->devs[n_copy].addr +
 				   choose_data_offset(r10_bio, rdev));
-	bio_set_dev(mbio, rdev->bdev);
 	mbio->bi_end_io	= raid10_end_write_request;
 	bio_set_op_attrs(mbio, op, do_sync | do_fua);
 	if (!replacement && test_bit(FailFast,
@@ -1812,7 +1810,8 @@ static int raid10_handle_discard(struct mddev *mddev, struct bio *bio)
 		 */
 		if (r10_bio->devs[disk].bio) {
 			struct md_rdev *rdev = conf->mirrors[disk].rdev;
-			mbio = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
+			mbio = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOIO,
+					       &mddev->bio_set);
 			mbio->bi_end_io = raid10_end_discard_request;
 			mbio->bi_private = r10_bio;
 			r10_bio->devs[disk].bio = mbio;
@@ -1825,7 +1824,8 @@ static int raid10_handle_discard(struct mddev *mddev, struct bio *bio)
 		}
 		if (r10_bio->devs[disk].repl_bio) {
 			struct md_rdev *rrdev = conf->mirrors[disk].replacement;
-			rbio = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
+			rbio = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOIO,
+					       &mddev->bio_set);
 			rbio->bi_end_io = raid10_end_discard_request;
 			rbio->bi_private = r10_bio;
 			r10_bio->devs[disk].repl_bio = rbio;
@@ -2892,12 +2892,12 @@ static int narrow_write_error(struct r10bio *r10_bio, int i)
 		if (sectors > sect_to_write)
 			sectors = sect_to_write;
 		/* Write at 'sector' for 'sectors' */
-		wbio = bio_clone_fast(bio, GFP_NOIO, &mddev->bio_set);
+		wbio = bio_alloc_clone(rdev->bdev, bio, GFP_NOIO,
+				       &mddev->bio_set);
 		bio_trim(wbio, sector - bio->bi_iter.bi_sector, sectors);
 		wsector = r10_bio->devs[i].addr + (sector - r10_bio->sector);
 		wbio->bi_iter.bi_sector = wsector +
 				   choose_data_offset(r10_bio, rdev);
-		bio_set_dev(wbio, rdev->bdev);
 		bio_set_op_attrs(wbio, REQ_OP_WRITE, 0);
 
 		if (submit_bio_wait(wbio) < 0)
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 7c119208a2143..8891aaba65964 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -5438,14 +5438,14 @@ static int raid5_read_one_chunk(struct mddev *mddev, struct bio *raid_bio)
 		return 0;
 	}
 
-	align_bio = bio_clone_fast(raid_bio, GFP_NOIO, &mddev->io_acct_set);
+	align_bio = bio_alloc_clone(rdev->bdev, raid_bio, GFP_NOIO,
+				    &mddev->io_acct_set);
 	md_io_acct = container_of(align_bio, struct md_io_acct, bio_clone);
 	raid_bio->bi_next = (void *)rdev;
 	if (blk_queue_io_stat(raid_bio->bi_bdev->bd_disk->queue))
 		md_io_acct->start_time = bio_start_io_acct(raid_bio);
 	md_io_acct->orig_bio = raid_bio;
 
-	bio_set_dev(align_bio, rdev->bdev);
 	align_bio->bi_end_io = raid5_align_endio;
 	align_bio->bi_private = md_io_acct;
 	align_bio->bi_iter.bi_sector = sector;
diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 421d921a05716..dee86911a4bef 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -3154,7 +3154,7 @@ struct bio *btrfs_bio_clone(struct bio *bio)
 	struct bio *new;
 
 	/* Bio allocation backed by a bioset does not fail */
-	new = bio_clone_fast(bio, GFP_NOFS, &btrfs_bioset);
+	new = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOFS, &btrfs_bioset);
 	bbio = btrfs_bio(new);
 	btrfs_bio_init(bbio);
 	bbio->iter = bio->bi_iter;
@@ -3169,7 +3169,7 @@ struct bio *btrfs_bio_clone_partial(struct bio *orig, u64 offset, u64 size)
 	ASSERT(offset <= UINT_MAX && size <= UINT_MAX);
 
 	/* this will never fail when it's backed by a bioset */
-	bio = bio_clone_fast(orig, GFP_NOFS, &btrfs_bioset);
+	bio = bio_alloc_clone(orig->bi_bdev, orig, GFP_NOFS, &btrfs_bioset);
 	ASSERT(bio);
 
 	bbio = btrfs_bio(bio);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index b814361c957b0..7523aba4ddf7c 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -413,8 +413,10 @@ struct bio *bio_alloc_kiocb(struct kiocb *kiocb, struct block_device *bdev,
 struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned short nr_iovecs);
 extern void bio_put(struct bio *);
 
-int __bio_clone_fast(struct bio *bio, struct bio *bio_src, gfp_t gfp);
-extern struct bio *bio_clone_fast(struct bio *, gfp_t, struct bio_set *);
+struct bio *bio_alloc_clone(struct block_device *bdev, struct bio *bio_src,
+		gfp_t gfp, struct bio_set *bs);
+int bio_init_clone(struct block_device *bdev, struct bio *bio,
+		struct bio *bio_src, gfp_t gfp);
 
 extern struct bio_set fs_bio_set;
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

