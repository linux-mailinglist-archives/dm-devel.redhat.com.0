Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA2649202C
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jan 2022 08:24:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-1qka8vCtOuKl0V2iEs8Ksw-1; Tue, 18 Jan 2022 02:24:45 -0500
X-MC-Unique: 1qka8vCtOuKl0V2iEs8Ksw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4ED19253F5;
	Tue, 18 Jan 2022 07:24:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF5E4DC2C;
	Tue, 18 Jan 2022 07:24:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 970191806D1C;
	Tue, 18 Jan 2022 07:24:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I7Kued013106 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 02:20:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83A4DC080AF; Tue, 18 Jan 2022 07:20:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC0CC080A8
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62339811E78
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-648-1XMFRvoQMiWFZjzA3oWZYA-1; Tue, 18 Jan 2022 02:20:54 -0500
X-MC-Unique: 1XMFRvoQMiWFZjzA3oWZYA-1
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9inN-000ZkP-C4; Tue, 18 Jan 2022 07:20:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:51 +0100
Message-Id: <20220118071952.1243143-19-hch@lst.de>
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
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
Subject: [dm-devel] [PATCH 18/19] block: pass a block_device and opf to
	bio_init
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass the block_device that we plan to use this bio for and the
operation to bio_init to optimize the assigment.  A NULL block_device
can be passed, both for the passthrough case on a raw request_queue and
to temporarily avoid refactoring some nasty code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c                       | 26 +++++++++++++-------------
 block/blk-flush.c                 |  4 +---
 block/blk-zoned.c                 |  5 +----
 block/fops.c                      | 18 +++++++++---------
 drivers/block/floppy.c            |  4 +---
 drivers/block/zram/zram_drv.c     |  5 ++---
 drivers/md/bcache/io.c            |  3 ++-
 drivers/md/bcache/journal.c       |  4 +---
 drivers/md/bcache/movinggc.c      |  4 ++--
 drivers/md/bcache/request.c       |  2 +-
 drivers/md/bcache/super.c         |  8 +++-----
 drivers/md/bcache/writeback.c     |  4 ++--
 drivers/md/dm.c                   |  5 ++---
 drivers/md/md-multipath.c         |  2 +-
 drivers/md/md.c                   |  8 +++-----
 drivers/md/raid5-cache.c          |  2 +-
 drivers/md/raid5-ppl.c            |  2 +-
 drivers/md/raid5.c                |  4 ++--
 drivers/nvme/target/io-cmd-bdev.c | 10 ++++------
 drivers/nvme/target/passthru.c    |  4 ++--
 drivers/nvme/target/zns.c         |  4 ++--
 fs/iomap/buffered-io.c            |  4 +---
 fs/xfs/xfs_bio_io.c               |  4 +---
 fs/xfs/xfs_log.c                  | 14 +++++++-------
 fs/zonefs/super.c                 |  4 +---
 include/linux/bio.h               |  4 ++--
 26 files changed, 68 insertions(+), 90 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 5c97f56c1ee50..2480f80296eac 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -249,12 +249,14 @@ static void bio_free(struct bio *bio)
  * they must remember to pair any call to bio_init() with bio_uninit()
  * when IO has completed, or when the bio is released.
  */
-void bio_init(struct bio *bio, struct bio_vec *table,
-	      unsigned short max_vecs)
+void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
+	      unsigned short max_vecs, unsigned int opf)
 {
 	bio->bi_next = NULL;
-	bio->bi_bdev = NULL;
-	bio->bi_opf = 0;
+	bio->bi_bdev = bdev;
+	if (bdev)
+		bio_associate_blkg(bio);
+	bio->bi_opf = opf;
 	bio->bi_flags = 0;
 	bio->bi_ioprio = 0;
 	bio->bi_write_hint = 0;
@@ -504,16 +506,14 @@ struct bio *bio_alloc_bioset(struct block_device *bdev, unsigned short nr_vecs,
 		if (unlikely(!bvl))
 			goto err_free;
 
-		bio_init(bio, bvl, nr_vecs);
+		bio_init(bio, bdev, bvl, nr_vecs, opf);
 	} else if (nr_vecs) {
-		bio_init(bio, bio->bi_inline_vecs, BIO_INLINE_VECS);
+		bio_init(bio, bdev, bio->bi_inline_vecs, BIO_INLINE_VECS, opf);
 	} else {
-		bio_init(bio, NULL, 0);
+		bio_init(bio, bdev, NULL, 0, opf);
 	}
 
 	bio->bi_pool = bs;
-	bio_set_dev(bio, bdev);
-	bio->bi_opf = opf;
 	return bio;
 
 err_free:
@@ -541,7 +541,8 @@ struct bio *bio_kmalloc(gfp_t gfp_mask, unsigned short nr_iovecs)
 	bio = kmalloc(struct_size(bio, bi_inline_vecs, nr_iovecs), gfp_mask);
 	if (unlikely(!bio))
 		return NULL;
-	bio_init(bio, nr_iovecs ? bio->bi_inline_vecs : NULL, nr_iovecs);
+	bio_init(bio, NULL, nr_iovecs ? bio->bi_inline_vecs : NULL, nr_iovecs,
+		 0);
 	bio->bi_pool = NULL;
 	return bio;
 }
@@ -1754,9 +1755,8 @@ struct bio *bio_alloc_kiocb(struct kiocb *kiocb, struct block_device *bdev,
 		cache->free_list = bio->bi_next;
 		cache->nr--;
 		put_cpu();
-		bio_init(bio, nr_vecs ? bio->bi_inline_vecs : NULL, nr_vecs);
-		bio_set_dev(bio, bdev);
-		bio->bi_opf = opf;
+		bio_init(bio, bdev, nr_vecs ? bio->bi_inline_vecs : NULL,
+			 nr_vecs, opf);
 		bio->bi_pool = bs;
 		bio_set_flag(bio, BIO_PERCPU_CACHE);
 		return bio;
diff --git a/block/blk-flush.c b/block/blk-flush.c
index e4df894189ced..c689687248706 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -460,9 +460,7 @@ int blkdev_issue_flush(struct block_device *bdev)
 {
 	struct bio bio;
 
-	bio_init(&bio, NULL, 0);
-	bio_set_dev(&bio, bdev);
-	bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+	bio_init(&bio, bdev, NULL, 0, REQ_OP_WRITE | REQ_PREFLUSH);
 	return submit_bio_wait(&bio);
 }
 EXPORT_SYMBOL(blkdev_issue_flush);
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 5ab755d792c81..602bef54c8134 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -238,10 +238,7 @@ static int blkdev_zone_reset_all(struct block_device *bdev, gfp_t gfp_mask)
 {
 	struct bio bio;
 
-	bio_init(&bio, NULL, 0);
-	bio_set_dev(&bio, bdev);
-	bio.bi_opf = REQ_OP_ZONE_RESET_ALL | REQ_SYNC;
-
+	bio_init(&bio, bdev, NULL, 0, REQ_OP_ZONE_RESET_ALL | REQ_SYNC);
 	return submit_bio_wait(&bio);
 }
 
diff --git a/block/fops.c b/block/fops.c
index c683596847731..3696665e586a8 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -75,8 +75,13 @@ static ssize_t __blkdev_direct_IO_simple(struct kiocb *iocb,
 			return -ENOMEM;
 	}
 
-	bio_init(&bio, vecs, nr_pages);
-	bio_set_dev(&bio, bdev);
+	if (iov_iter_rw(iter) == READ) {
+		bio_init(&bio, bdev, vecs, nr_pages, REQ_OP_READ);
+		if (iter_is_iovec(iter))
+			should_dirty = true;
+	} else {
+		bio_init(&bio, bdev, vecs, nr_pages, dio_bio_write_op(iocb));
+	}
 	bio.bi_iter.bi_sector = pos >> SECTOR_SHIFT;
 	bio.bi_write_hint = iocb->ki_hint;
 	bio.bi_private = current;
@@ -88,14 +93,9 @@ static ssize_t __blkdev_direct_IO_simple(struct kiocb *iocb,
 		goto out;
 	ret = bio.bi_iter.bi_size;
 
-	if (iov_iter_rw(iter) == READ) {
-		bio.bi_opf = REQ_OP_READ;
-		if (iter_is_iovec(iter))
-			should_dirty = true;
-	} else {
-		bio.bi_opf = dio_bio_write_op(iocb);
+	if (iov_iter_rw(iter) == WRITE)
 		task_io_account_write(ret);
-	}
+
 	if (iocb->ki_flags & IOCB_NOWAIT)
 		bio.bi_opf |= REQ_NOWAIT;
 	if (iocb->ki_flags & IOCB_HIPRI)
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index e611411a934ce..19c2d0327e157 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4129,15 +4129,13 @@ static int __floppy_read_block_0(struct block_device *bdev, int drive)
 
 	cbdata.drive = drive;
 
-	bio_init(&bio, &bio_vec, 1);
-	bio_set_dev(&bio, bdev);
+	bio_init(&bio, bdev, &bio_vec, 1, REQ_OP_READ);
 	bio_add_page(&bio, page, block_size(bdev), 0);
 
 	bio.bi_iter.bi_sector = 0;
 	bio.bi_flags |= (1 << BIO_QUIET);
 	bio.bi_private = &cbdata;
 	bio.bi_end_io = floppy_rb0_cb;
-	bio_set_op_attrs(&bio, REQ_OP_READ, 0);
 
 	init_completion(&cbdata.complete);
 
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index d8dc7ed1c78fc..47c966cffe690 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -744,10 +744,9 @@ static ssize_t writeback_store(struct device *dev,
 			continue;
 		}
 
-		bio_init(&bio, &bio_vec, 1);
-		bio_set_dev(&bio, zram->bdev);
+		bio_init(&bio, zram->bdev, &bio_vec, 1,
+			 REQ_OP_WRITE | REQ_SYNC);
 		bio.bi_iter.bi_sector = blk_idx * (PAGE_SIZE >> 9);
-		bio.bi_opf = REQ_OP_WRITE | REQ_SYNC;
 
 		bio_add_page(&bio, bvec.bv_page, bvec.bv_len,
 				bvec.bv_offset);
diff --git a/drivers/md/bcache/io.c b/drivers/md/bcache/io.c
index 9c6f9ec55b724..020712c5203fd 100644
--- a/drivers/md/bcache/io.c
+++ b/drivers/md/bcache/io.c
@@ -26,7 +26,8 @@ struct bio *bch_bbio_alloc(struct cache_set *c)
 	struct bbio *b = mempool_alloc(&c->bio_meta, GFP_NOIO);
 	struct bio *bio = &b->bio;
 
-	bio_init(bio, bio->bi_inline_vecs, meta_bucket_pages(&c->cache->sb));
+	bio_init(bio, NULL, bio->bi_inline_vecs,
+		 meta_bucket_pages(&c->cache->sb), 0);
 
 	return bio;
 }
diff --git a/drivers/md/bcache/journal.c b/drivers/md/bcache/journal.c
index 61bd79babf7ae..6d26c5b06e2b6 100644
--- a/drivers/md/bcache/journal.c
+++ b/drivers/md/bcache/journal.c
@@ -611,11 +611,9 @@ static void do_journal_discard(struct cache *ca)
 
 		atomic_set(&ja->discard_in_flight, DISCARD_IN_FLIGHT);
 
-		bio_init(bio, bio->bi_inline_vecs, 1);
-		bio_set_op_attrs(bio, REQ_OP_DISCARD, 0);
+		bio_init(bio, ca->bdev, bio->bi_inline_vecs, 1, REQ_OP_DISCARD);
 		bio->bi_iter.bi_sector	= bucket_to_sector(ca->set,
 						ca->sb.d[ja->discard_idx]);
-		bio_set_dev(bio, ca->bdev);
 		bio->bi_iter.bi_size	= bucket_bytes(ca);
 		bio->bi_end_io		= journal_discard_endio;
 
diff --git a/drivers/md/bcache/movinggc.c b/drivers/md/bcache/movinggc.c
index b9c3d27ec093a..99499d1f6e666 100644
--- a/drivers/md/bcache/movinggc.c
+++ b/drivers/md/bcache/movinggc.c
@@ -79,8 +79,8 @@ static void moving_init(struct moving_io *io)
 {
 	struct bio *bio = &io->bio.bio;
 
-	bio_init(bio, bio->bi_inline_vecs,
-		 DIV_ROUND_UP(KEY_SIZE(&io->w->key), PAGE_SECTORS));
+	bio_init(bio, NULL, bio->bi_inline_vecs,
+		 DIV_ROUND_UP(KEY_SIZE(&io->w->key), PAGE_SECTORS), 0);
 	bio_get(bio);
 	bio_set_prio(bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0));
 
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index c4b7e434de8ac..d4b98ebffd948 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -685,7 +685,7 @@ static void do_bio_hook(struct search *s,
 {
 	struct bio *bio = &s->bio.bio;
 
-	bio_init(bio, NULL, 0);
+	bio_init(bio, NULL, NULL, 0, 0);
 	__bio_clone_fast(bio, orig_bio);
 	/*
 	 * bi_end_io can be set separately somewhere else, e.g. the
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 140f35dc0c457..85577c9f971d2 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -343,8 +343,7 @@ void bch_write_bdev_super(struct cached_dev *dc, struct closure *parent)
 	down(&dc->sb_write_mutex);
 	closure_init(cl, parent);
 
-	bio_init(bio, dc->sb_bv, 1);
-	bio_set_dev(bio, dc->bdev);
+	bio_init(bio, dc->bdev, dc->sb_bv, 1, 0);
 	bio->bi_end_io	= write_bdev_super_endio;
 	bio->bi_private = dc;
 
@@ -387,8 +386,7 @@ void bcache_write_super(struct cache_set *c)
 	if (ca->sb.version < version)
 		ca->sb.version = version;
 
-	bio_init(bio, ca->sb_bv, 1);
-	bio_set_dev(bio, ca->bdev);
+	bio_init(bio, ca->bdev, ca->sb_bv, 1, 0);
 	bio->bi_end_io	= write_super_endio;
 	bio->bi_private = ca;
 
@@ -2240,7 +2238,7 @@ static int cache_alloc(struct cache *ca)
 	__module_get(THIS_MODULE);
 	kobject_init(&ca->kobj, &bch_cache_ktype);
 
-	bio_init(&ca->journal.bio, ca->journal.bio.bi_inline_vecs, 8);
+	bio_init(&ca->journal.bio, NULL, ca->journal.bio.bi_inline_vecs, 8, 0);
 
 	/*
 	 * when ca->sb.njournal_buckets is not zero, journal exists,
diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
index c7560f66dca88..d42301e6309d4 100644
--- a/drivers/md/bcache/writeback.c
+++ b/drivers/md/bcache/writeback.c
@@ -292,8 +292,8 @@ static void dirty_init(struct keybuf_key *w)
 	struct dirty_io *io = w->private;
 	struct bio *bio = &io->bio;
 
-	bio_init(bio, bio->bi_inline_vecs,
-		 DIV_ROUND_UP(KEY_SIZE(&w->key), PAGE_SECTORS));
+	bio_init(bio, NULL, bio->bi_inline_vecs,
+		 DIV_ROUND_UP(KEY_SIZE(&w->key), PAGE_SECTORS), 0);
 	if (!io->dc->writeback_percent)
 		bio_set_prio(bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0));
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 84f3dd58d1a16..09d9b674bd851 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1303,9 +1303,8 @@ static int __send_empty_flush(struct clone_info *ci)
 	 * need to reference it after submit. It's just used as
 	 * the basis for the clone(s).
 	 */
-	bio_init(&flush_bio, NULL, 0);
-	flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
-	bio_set_dev(&flush_bio, ci->io->md->disk->part0);
+	bio_init(&flush_bio, ci->io->md->disk->part0, NULL, 0,
+		 REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC);
 
 	ci->bio = &flush_bio;
 	ci->sector_count = 0;
diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index e7d6486f090ff..5e15940634d85 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -121,7 +121,7 @@ static bool multipath_make_request(struct mddev *mddev, struct bio * bio)
 	}
 	multipath = conf->multipaths + mp_bh->path;
 
-	bio_init(&mp_bh->bio, NULL, 0);
+	bio_init(&mp_bh->bio, NULL, NULL, 0, 0);
 	__bio_clone_fast(&mp_bh->bio, bio);
 
 	mp_bh->bio.bi_iter.bi_sector += multipath->rdev->data_offset;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 40fc1f7e65c5d..0a89f072dae0d 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -998,13 +998,11 @@ int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
 	struct bio bio;
 	struct bio_vec bvec;
 
-	bio_init(&bio, &bvec, 1);
-
 	if (metadata_op && rdev->meta_bdev)
-		bio_set_dev(&bio, rdev->meta_bdev);
+		bio_init(&bio, rdev->meta_bdev, &bvec, 1, op | op_flags);
 	else
-		bio_set_dev(&bio, rdev->bdev);
-	bio.bi_opf = op | op_flags;
+		bio_init(&bio, rdev->bdev, &bvec, 1, op | op_flags);
+
 	if (metadata_op)
 		bio.bi_iter.bi_sector = sector + rdev->sb_start;
 	else if (rdev->mddev->reshape_position != MaxSector &&
diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 66313adf99875..98b9ca11c28d8 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -3108,7 +3108,7 @@ int r5l_init_log(struct r5conf *conf, struct md_rdev *rdev)
 	INIT_LIST_HEAD(&log->io_end_ios);
 	INIT_LIST_HEAD(&log->flushing_ios);
 	INIT_LIST_HEAD(&log->finished_ios);
-	bio_init(&log->flush_bio, NULL, 0);
+	bio_init(&log->flush_bio, NULL, NULL, 0, 0);
 
 	log->io_kc = KMEM_CACHE(r5l_io_unit, 0);
 	if (!log->io_kc)
diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index 054d3bb252d48..3446797fa0aca 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -250,7 +250,7 @@ static struct ppl_io_unit *ppl_new_iounit(struct ppl_log *log,
 	INIT_LIST_HEAD(&io->stripe_list);
 	atomic_set(&io->pending_stripes, 0);
 	atomic_set(&io->pending_flushes, 0);
-	bio_init(&io->bio, io->biovec, PPL_IO_INLINE_BVECS);
+	bio_init(&io->bio, NULL, io->biovec, PPL_IO_INLINE_BVECS, 0);
 
 	pplhdr = page_address(io->header_page);
 	clear_page(pplhdr);
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index ffe720c73b0a5..a9dcc5bc9c329 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -2310,8 +2310,8 @@ static struct stripe_head *alloc_stripe(struct kmem_cache *sc, gfp_t gfp,
 		for (i = 0; i < disks; i++) {
 			struct r5dev *dev = &sh->dev[i];
 
-			bio_init(&dev->req, &dev->vec, 1);
-			bio_init(&dev->rreq, &dev->rvec, 1);
+			bio_init(&dev->req, NULL, &dev->vec, 1, 0);
+			bio_init(&dev->rreq, NULL, &dev->rvec, 1, 0);
 		}
 
 		if (raid5_has_ppl(conf)) {
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index e092af3abc710..95c2bbb0b2f5f 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -267,9 +267,8 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 
 	if (nvmet_use_inline_bvec(req)) {
 		bio = &req->b.inline_bio;
-		bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-		bio_set_dev(bio, req->ns->bdev);
-		bio->bi_opf = op;
+		bio_init(bio, req->ns->bdev, req->inline_bvec,
+			 ARRAY_SIZE(req->inline_bvec), op);
 	} else {
 		bio = bio_alloc(req->ns->bdev, bio_max_segs(sg_cnt), op,
 				GFP_KERNEL);
@@ -328,11 +327,10 @@ static void nvmet_bdev_execute_flush(struct nvmet_req *req)
 	if (!nvmet_check_transfer_len(req, 0))
 		return;
 
-	bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-	bio_set_dev(bio, req->ns->bdev);
+	bio_init(bio, req->ns->bdev, req->inline_bvec,
+		 ARRAY_SIZE(req->inline_bvec), REQ_OP_WRITE | REQ_PREFLUSH);
 	bio->bi_private = req;
 	bio->bi_end_io = nvmet_bio_done;
-	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 
 	submit_bio(bio);
 }
diff --git a/drivers/nvme/target/passthru.c b/drivers/nvme/target/passthru.c
index 38f72968c3fde..a810bf569fff8 100644
--- a/drivers/nvme/target/passthru.c
+++ b/drivers/nvme/target/passthru.c
@@ -206,8 +206,8 @@ static int nvmet_passthru_map_sg(struct nvmet_req *req, struct request *rq)
 
 	if (nvmet_use_inline_bvec(req)) {
 		bio = &req->p.inline_bio;
-		bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-		bio->bi_opf = req_op(rq);
+		bio_init(bio, NULL, req->inline_bvec,
+			 ARRAY_SIZE(req->inline_bvec), req_op(rq));
 	} else {
 		bio = bio_alloc(NULL, bio_max_segs(req->sg_cnt), req_op(rq),
 				GFP_KERNEL);
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 62c53e8f26d35..3e421217a7ade 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -552,8 +552,8 @@ void nvmet_bdev_execute_zone_append(struct nvmet_req *req)
 
 	if (nvmet_use_inline_bvec(req)) {
 		bio = &req->z.inline_bio;
-		bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-		bio->bi_opf = op;
+		bio_init(bio, req->ns->bdev, req->inline_bvec,
+			 ARRAY_SIZE(req->inline_bvec), op);
 	} else {
 		bio = bio_alloc(req->ns->bdev, req->sg_cnt, op, GFP_KERNEL);
 	}
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 70f3657a6ec06..491534e908615 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -549,10 +549,8 @@ static int iomap_read_folio_sync(loff_t block_start, struct folio *folio,
 	struct bio_vec bvec;
 	struct bio bio;
 
-	bio_init(&bio, &bvec, 1);
-	bio.bi_opf = REQ_OP_READ;
+	bio_init(&bio, iomap->bdev, &bvec, 1, REQ_OP_READ);
 	bio.bi_iter.bi_sector = iomap_sector(iomap, block_start);
-	bio_set_dev(&bio, iomap->bdev);
 	bio_add_folio(&bio, folio, plen, poff);
 	return submit_bio_wait(&bio);
 }
diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
index eff4a9f21dcff..32fa02945f739 100644
--- a/fs/xfs/xfs_bio_io.c
+++ b/fs/xfs/xfs_bio_io.c
@@ -36,9 +36,7 @@ xfs_flush_bdev_async(
 		return;
 	}
 
-	bio_init(bio, NULL, 0);
-	bio_set_dev(bio, bdev);
-	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
+	bio_init(bio, bdev, NULL, 0, REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC);
 	bio->bi_private = done;
 	bio->bi_end_io = xfs_flush_bdev_async_endio;
 
diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 89fec9a18c349..16f9edbda4eb3 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1883,19 +1883,19 @@ xlog_write_iclog(
 		return;
 	}
 
-	bio_init(&iclog->ic_bio, iclog->ic_bvec, howmany(count, PAGE_SIZE));
-	bio_set_dev(&iclog->ic_bio, log->l_targ->bt_bdev);
-	iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart + bno;
-	iclog->ic_bio.bi_end_io = xlog_bio_end_io;
-	iclog->ic_bio.bi_private = iclog;
-
 	/*
 	 * We use REQ_SYNC | REQ_IDLE here to tell the block layer the are more
 	 * IOs coming immediately after this one. This prevents the block layer
 	 * writeback throttle from throttling log writes behind background
 	 * metadata writeback and causing priority inversions.
 	 */
-	iclog->ic_bio.bi_opf = REQ_OP_WRITE | REQ_META | REQ_SYNC | REQ_IDLE;
+	bio_init(&iclog->ic_bio, log->l_targ->bt_bdev, iclog->ic_bvec,
+		 howmany(count, PAGE_SIZE),
+		 REQ_OP_WRITE | REQ_META | REQ_SYNC | REQ_IDLE);
+	iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart + bno;
+	iclog->ic_bio.bi_end_io = xlog_bio_end_io;
+	iclog->ic_bio.bi_private = iclog;
+
 	if (iclog->ic_flags & XLOG_ICL_NEED_FLUSH) {
 		iclog->ic_bio.bi_opf |= REQ_PREFLUSH;
 		/*
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index c0fc2c326dcee..d331b52592a0a 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -1540,10 +1540,8 @@ static int zonefs_read_super(struct super_block *sb)
 	if (!page)
 		return -ENOMEM;
 
-	bio_init(&bio, &bio_vec, 1);
+	bio_init(&bio, sb->s_bdev, &bio_vec, 1, REQ_OP_READ);
 	bio.bi_iter.bi_sector = 0;
-	bio.bi_opf = REQ_OP_READ;
-	bio_set_dev(&bio, sb->s_bdev);
 	bio_add_page(&bio, page, PAGE_SIZE, 0);
 
 	ret = submit_bio_wait(&bio);
diff --git a/include/linux/bio.h b/include/linux/bio.h
index be6ac92913d48..41bedf727f59c 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -456,8 +456,8 @@ static inline int bio_iov_vecs_to_alloc(struct iov_iter *iter, int max_segs)
 struct request_queue;
 
 extern int submit_bio_wait(struct bio *bio);
-extern void bio_init(struct bio *bio, struct bio_vec *table,
-		     unsigned short max_vecs);
+void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
+	      unsigned short max_vecs, unsigned int opf);
 extern void bio_uninit(struct bio *);
 extern void bio_reset(struct bio *);
 void bio_chain(struct bio *, struct bio *);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

