Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1E4754D8
	for <lists+dm-devel@lfdr.de>; Wed, 15 Dec 2021 10:09:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-rhWDBMoOOoGqaDE59o3LRg-1; Wed, 15 Dec 2021 04:09:47 -0500
X-MC-Unique: rhWDBMoOOoGqaDE59o3LRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5361934103;
	Wed, 15 Dec 2021 09:09:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A8C2ED9C;
	Wed, 15 Dec 2021 09:09:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1AEB1809CBF;
	Wed, 15 Dec 2021 09:09:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BF99QdC019859 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 04:09:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B3C82166B4A; Wed, 15 Dec 2021 09:09:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7569B2166B44
	for <dm-devel@redhat.com>; Wed, 15 Dec 2021 09:09:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9AD41C1CD6A
	for <dm-devel@redhat.com>; Wed, 15 Dec 2021 09:09:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-584-E5r2ugkhMh2NMPbGsgkVGA-1; Wed, 15 Dec 2021 04:09:19 -0500
X-MC-Unique: E5r2ugkhMh2NMPbGsgkVGA-1
Received: from [2001:4bb8:184:5c65:c56:ed89:c020:6100] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxPuU-00ETz3-G9; Wed, 15 Dec 2021 08:45:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>
Date: Wed, 15 Dec 2021 09:45:08 +0100
Message-Id: <20211215084508.435401-5-hch@lst.de>
In-Reply-To: <20211215084508.435401-1-hch@lst.de>
References: <20211215084508.435401-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-s390@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com, Vivek Goyal <vgoyal@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-fsdevel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 4/4] dax: remove the copy_from_iter and
	copy_to_iter methods
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These methods indirect the actual DAX read/write path.  In the end pmem
uses magic flush and mc safe variants and fuse and dcssblk use plain ones
while device mapper picks redirects to the underlying device.

Add set_dax_nocache() and set_dax_nomc() APIs to control which copy
routines are used to remove indirect call from the read/write fast path
as well as a lot of boilerplate code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com> [virtiofs]
---
 drivers/dax/bus.c             |  2 +
 drivers/dax/super.c           | 36 ++++++++++++++--
 drivers/md/dm-linear.c        | 20 ---------
 drivers/md/dm-log-writes.c    | 80 -----------------------------------
 drivers/md/dm-stripe.c        | 20 ---------
 drivers/md/dm.c               | 52 +----------------------
 drivers/nvdimm/pmem.c         | 20 +--------
 drivers/s390/block/dcssblk.c  | 14 ------
 fs/dax.c                      |  5 ---
 fs/fuse/virtio_fs.c           | 16 -------
 include/linux/dax.h           |  9 ++--
 include/linux/device-mapper.h |  4 --
 12 files changed, 41 insertions(+), 237 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index da2a14d096d29..ee4568ef757c6 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1330,6 +1330,8 @@ struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data)
 		goto err_alloc_dax;
 	}
 	set_dax_synchronous(dax_dev);
+	set_dax_nocache(dax_dev);
+	set_dax_nomc(dax_dev);
 
 	/* a device_dax instance is dead while the driver is not attached */
 	kill_dax(dax_dev);
diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index e81d5ee57390f..e3029389d8097 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -105,6 +105,10 @@ enum dax_device_flags {
 	DAXDEV_WRITE_CACHE,
 	/* flag to check if device supports synchronous flush */
 	DAXDEV_SYNC,
+	/* do not leave the caches dirty after writes */
+	DAXDEV_NOCACHE,
+	/* handle CPU fetch exceptions during reads */
+	DAXDEV_NOMC,
 };
 
 /**
@@ -146,9 +150,15 @@ size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 	if (!dax_alive(dax_dev))
 		return 0;
 
-	return dax_dev->ops->copy_from_iter(dax_dev, pgoff, addr, bytes, i);
+	/*
+	 * The userspace address for the memory copy has already been validated
+	 * via access_ok() in vfs_write, so use the 'no check' version to bypass
+	 * the HARDENED_USERCOPY overhead.
+	 */
+	if (test_bit(DAXDEV_NOCACHE, &dax_dev->flags))
+		return _copy_from_iter_flushcache(addr, bytes, i);
+	return _copy_from_iter(addr, bytes, i);
 }
-EXPORT_SYMBOL_GPL(dax_copy_from_iter);
 
 size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 		size_t bytes, struct iov_iter *i)
@@ -156,9 +166,15 @@ size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 	if (!dax_alive(dax_dev))
 		return 0;
 
-	return dax_dev->ops->copy_to_iter(dax_dev, pgoff, addr, bytes, i);
+	/*
+	 * The userspace address for the memory copy has already been validated
+	 * via access_ok() in vfs_red, so use the 'no check' version to bypass
+	 * the HARDENED_USERCOPY overhead.
+	 */
+	if (test_bit(DAXDEV_NOMC, &dax_dev->flags))
+		return _copy_mc_to_iter(addr, bytes, i);
+	return _copy_to_iter(addr, bytes, i);
 }
-EXPORT_SYMBOL_GPL(dax_copy_to_iter);
 
 int dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 			size_t nr_pages)
@@ -220,6 +236,18 @@ void set_dax_synchronous(struct dax_device *dax_dev)
 }
 EXPORT_SYMBOL_GPL(set_dax_synchronous);
 
+void set_dax_nocache(struct dax_device *dax_dev)
+{
+	set_bit(DAXDEV_NOCACHE, &dax_dev->flags);
+}
+EXPORT_SYMBOL_GPL(set_dax_nocache);
+
+void set_dax_nomc(struct dax_device *dax_dev)
+{
+	set_bit(DAXDEV_NOMC, &dax_dev->flags);
+}
+EXPORT_SYMBOL_GPL(set_dax_nomc);
+
 bool dax_alive(struct dax_device *dax_dev)
 {
 	lockdep_assert_held(&dax_srcu);
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 90de42f6743ac..1b97a11d71517 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -180,22 +180,6 @@ static long linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
 }
 
-static size_t linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
-
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
-static size_t linear_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
-
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
 static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 				      size_t nr_pages)
 {
@@ -206,8 +190,6 @@ static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 
 #else
 #define linear_dax_direct_access NULL
-#define linear_dax_copy_from_iter NULL
-#define linear_dax_copy_to_iter NULL
 #define linear_dax_zero_page_range NULL
 #endif
 
@@ -225,8 +207,6 @@ static struct target_type linear_target = {
 	.prepare_ioctl = linear_prepare_ioctl,
 	.iterate_devices = linear_iterate_devices,
 	.direct_access = linear_dax_direct_access,
-	.dax_copy_from_iter = linear_dax_copy_from_iter,
-	.dax_copy_to_iter = linear_dax_copy_to_iter,
 	.dax_zero_page_range = linear_dax_zero_page_range,
 };
 
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index cdb22e7a1d0da..139b09b06eda9 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -902,51 +902,6 @@ static void log_writes_io_hints(struct dm_target *ti, struct queue_limits *limit
 }
 
 #if IS_ENABLED(CONFIG_FS_DAX)
-static int log_dax(struct log_writes_c *lc, sector_t sector, size_t bytes,
-		   struct iov_iter *i)
-{
-	struct pending_block *block;
-
-	if (!bytes)
-		return 0;
-
-	block = kzalloc(sizeof(struct pending_block), GFP_KERNEL);
-	if (!block) {
-		DMERR("Error allocating dax pending block");
-		return -ENOMEM;
-	}
-
-	block->data = kzalloc(bytes, GFP_KERNEL);
-	if (!block->data) {
-		DMERR("Error allocating dax data space");
-		kfree(block);
-		return -ENOMEM;
-	}
-
-	/* write data provided via the iterator */
-	if (!copy_from_iter(block->data, bytes, i)) {
-		DMERR("Error copying dax data");
-		kfree(block->data);
-		kfree(block);
-		return -EIO;
-	}
-
-	/* rewind the iterator so that the block driver can use it */
-	iov_iter_revert(i, bytes);
-
-	block->datalen = bytes;
-	block->sector = bio_to_dev_sectors(lc, sector);
-	block->nr_sectors = ALIGN(bytes, lc->sectorsize) >> lc->sectorshift;
-
-	atomic_inc(&lc->pending_blocks);
-	spin_lock_irq(&lc->blocks_lock);
-	list_add_tail(&block->list, &lc->unflushed_blocks);
-	spin_unlock_irq(&lc->blocks_lock);
-	wake_up_process(lc->log_kthread);
-
-	return 0;
-}
-
 static struct dax_device *log_writes_dax_pgoff(struct dm_target *ti,
 		pgoff_t *pgoff)
 {
@@ -964,37 +919,6 @@ static long log_writes_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
 }
 
-static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
-					    pgoff_t pgoff, void *addr, size_t bytes,
-					    struct iov_iter *i)
-{
-	struct log_writes_c *lc = ti->private;
-	sector_t sector = pgoff * PAGE_SECTORS;
-	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
-	int err;
-
-	/* Don't bother doing anything if logging has been disabled */
-	if (!lc->logging_enabled)
-		goto dax_copy;
-
-	err = log_dax(lc, sector, bytes, i);
-	if (err) {
-		DMWARN("Error %d logging DAX write", err);
-		return 0;
-	}
-dax_copy:
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
-static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
-					  pgoff_t pgoff, void *addr, size_t bytes,
-					  struct iov_iter *i)
-{
-	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
-
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
 static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 					  size_t nr_pages)
 {
@@ -1005,8 +929,6 @@ static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 
 #else
 #define log_writes_dax_direct_access NULL
-#define log_writes_dax_copy_from_iter NULL
-#define log_writes_dax_copy_to_iter NULL
 #define log_writes_dax_zero_page_range NULL
 #endif
 
@@ -1024,8 +946,6 @@ static struct target_type log_writes_target = {
 	.iterate_devices = log_writes_iterate_devices,
 	.io_hints = log_writes_io_hints,
 	.direct_access = log_writes_dax_direct_access,
-	.dax_copy_from_iter = log_writes_dax_copy_from_iter,
-	.dax_copy_to_iter = log_writes_dax_copy_to_iter,
 	.dax_zero_page_range = log_writes_dax_zero_page_range,
 };
 
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 50dba3f39274c..e566115ec0bb8 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -324,22 +324,6 @@ static long stripe_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
 }
 
-static size_t stripe_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
-
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
-static size_t stripe_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
-
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
-}
-
 static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 				      size_t nr_pages)
 {
@@ -350,8 +334,6 @@ static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 
 #else
 #define stripe_dax_direct_access NULL
-#define stripe_dax_copy_from_iter NULL
-#define stripe_dax_copy_to_iter NULL
 #define stripe_dax_zero_page_range NULL
 #endif
 
@@ -488,8 +470,6 @@ static struct target_type stripe_target = {
 	.iterate_devices = stripe_iterate_devices,
 	.io_hints = stripe_io_hints,
 	.direct_access = stripe_dax_direct_access,
-	.dax_copy_from_iter = stripe_dax_copy_from_iter,
-	.dax_copy_to_iter = stripe_dax_copy_to_iter,
 	.dax_zero_page_range = stripe_dax_zero_page_range,
 };
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index f4b972af10928..ce250bd274f31 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1027,54 +1027,6 @@ static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 	return ret;
 }
 
-static size_t dm_dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-				    void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct mapped_device *md = dax_get_private(dax_dev);
-	sector_t sector = pgoff * PAGE_SECTORS;
-	struct dm_target *ti;
-	long ret = 0;
-	int srcu_idx;
-
-	ti = dm_dax_get_live_target(md, sector, &srcu_idx);
-
-	if (!ti)
-		goto out;
-	if (!ti->type->dax_copy_from_iter) {
-		ret = copy_from_iter(addr, bytes, i);
-		goto out;
-	}
-	ret = ti->type->dax_copy_from_iter(ti, pgoff, addr, bytes, i);
- out:
-	dm_put_live_table(md, srcu_idx);
-
-	return ret;
-}
-
-static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	struct mapped_device *md = dax_get_private(dax_dev);
-	sector_t sector = pgoff * PAGE_SECTORS;
-	struct dm_target *ti;
-	long ret = 0;
-	int srcu_idx;
-
-	ti = dm_dax_get_live_target(md, sector, &srcu_idx);
-
-	if (!ti)
-		goto out;
-	if (!ti->type->dax_copy_to_iter) {
-		ret = copy_to_iter(addr, bytes, i);
-		goto out;
-	}
-	ret = ti->type->dax_copy_to_iter(ti, pgoff, addr, bytes, i);
- out:
-	dm_put_live_table(md, srcu_idx);
-
-	return ret;
-}
-
 static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 				  size_t nr_pages)
 {
@@ -1770,6 +1722,8 @@ static struct mapped_device *alloc_dev(int minor)
 			md->dax_dev = NULL;
 			goto bad;
 		}
+		set_dax_nocache(md->dax_dev);
+		set_dax_nomc(md->dax_dev);
 		if (dax_add_host(md->dax_dev, md->disk))
 			goto bad;
 	}
@@ -3024,8 +2978,6 @@ static const struct block_device_operations dm_rq_blk_dops = {
 
 static const struct dax_operations dm_dax_ops = {
 	.direct_access = dm_dax_direct_access,
-	.copy_from_iter = dm_dax_copy_from_iter,
-	.copy_to_iter = dm_dax_copy_to_iter,
 	.zero_page_range = dm_dax_zero_page_range,
 };
 
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 18b1d9c558313..58d95242a836b 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -301,26 +301,8 @@ static long pmem_dax_direct_access(struct dax_device *dax_dev,
 	return __pmem_direct_access(pmem, pgoff, nr_pages, kaddr, pfn);
 }
 
-/*
- * Bounds checking, both file offset and device offset, is handled by
- * dax_iomap_actor()
- */
-static size_t pmem_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	return _copy_from_iter_flushcache(addr, bytes, i);
-}
-
-static size_t pmem_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
-{
-	return _copy_mc_to_iter(addr, bytes, i);
-}
-
 static const struct dax_operations pmem_dax_ops = {
 	.direct_access = pmem_dax_direct_access,
-	.copy_from_iter = pmem_copy_from_iter,
-	.copy_to_iter = pmem_copy_to_iter,
 	.zero_page_range = pmem_dax_zero_page_range,
 };
 
@@ -497,6 +479,8 @@ static int pmem_attach_disk(struct device *dev,
 		rc = PTR_ERR(dax_dev);
 		goto out;
 	}
+	set_dax_nocache(dax_dev);
+	set_dax_nomc(dax_dev);
 	if (is_nvdimm_sync(nd_region))
 		set_dax_synchronous(dax_dev);
 	rc = dax_add_host(dax_dev, disk);
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 10823debc09bd..d614843caf6cc 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -44,18 +44,6 @@ static const struct block_device_operations dcssblk_devops = {
 	.release 	= dcssblk_release,
 };
 
-static size_t dcssblk_dax_copy_from_iter(struct dax_device *dax_dev,
-		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
-{
-	return copy_from_iter(addr, bytes, i);
-}
-
-static size_t dcssblk_dax_copy_to_iter(struct dax_device *dax_dev,
-		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
-{
-	return copy_to_iter(addr, bytes, i);
-}
-
 static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,
 				       pgoff_t pgoff, size_t nr_pages)
 {
@@ -72,8 +60,6 @@ static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,
 
 static const struct dax_operations dcssblk_dax_ops = {
 	.direct_access = dcssblk_dax_direct_access,
-	.copy_from_iter = dcssblk_dax_copy_from_iter,
-	.copy_to_iter = dcssblk_dax_copy_to_iter,
 	.zero_page_range = dcssblk_dax_zero_page_range,
 };
 
diff --git a/fs/dax.c b/fs/dax.c
index e0eecd8e3a8f8..cd03485867a74 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1260,11 +1260,6 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 		if (map_len > end - pos)
 			map_len = end - pos;
 
-		/*
-		 * The userspace address for the memory copy has already been
-		 * validated via access_ok() in either vfs_read() or
-		 * vfs_write(), depending on which operation we are doing.
-		 */
 		if (iov_iter_rw(iter) == WRITE)
 			xfer = dax_copy_from_iter(dax_dev, pgoff, kaddr,
 					map_len, iter);
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 5c03a0364a9bb..3928cd8ceba63 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -753,20 +753,6 @@ static long virtio_fs_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 	return nr_pages > max_nr_pages ? max_nr_pages : nr_pages;
 }
 
-static size_t virtio_fs_copy_from_iter(struct dax_device *dax_dev,
-				       pgoff_t pgoff, void *addr,
-				       size_t bytes, struct iov_iter *i)
-{
-	return copy_from_iter(addr, bytes, i);
-}
-
-static size_t virtio_fs_copy_to_iter(struct dax_device *dax_dev,
-				       pgoff_t pgoff, void *addr,
-				       size_t bytes, struct iov_iter *i)
-{
-	return copy_to_iter(addr, bytes, i);
-}
-
 static int virtio_fs_zero_page_range(struct dax_device *dax_dev,
 				     pgoff_t pgoff, size_t nr_pages)
 {
@@ -783,8 +769,6 @@ static int virtio_fs_zero_page_range(struct dax_device *dax_dev,
 
 static const struct dax_operations virtio_fs_dax_ops = {
 	.direct_access = virtio_fs_direct_access,
-	.copy_from_iter = virtio_fs_copy_from_iter,
-	.copy_to_iter = virtio_fs_copy_to_iter,
 	.zero_page_range = virtio_fs_zero_page_range,
 };
 
diff --git a/include/linux/dax.h b/include/linux/dax.h
index c04f46478e3b5..9fc5f99a0ae2c 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -28,12 +28,6 @@ struct dax_operations {
 	 */
 	bool (*dax_supported)(struct dax_device *, struct block_device *, int,
 			sector_t, sector_t);
-	/* copy_from_iter: required operation for fs-dax direct-i/o */
-	size_t (*copy_from_iter)(struct dax_device *, pgoff_t, void *, size_t,
-			struct iov_iter *);
-	/* copy_to_iter: required operation for fs-dax direct-i/o */
-	size_t (*copy_to_iter)(struct dax_device *, pgoff_t, void *, size_t,
-			struct iov_iter *);
 	/* zero_page_range: required operation. Zero page range   */
 	int (*zero_page_range)(struct dax_device *, pgoff_t, size_t);
 };
@@ -95,6 +89,9 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 }
 #endif
 
+void set_dax_nocache(struct dax_device *dax_dev);
+void set_dax_nomc(struct dax_device *dax_dev);
+
 struct writeback_control;
 #if defined(CONFIG_BLOCK) && defined(CONFIG_FS_DAX)
 int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk);
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index a7df155ea49b8..b26fecf6c8e87 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -147,8 +147,6 @@ typedef int (*dm_busy_fn) (struct dm_target *ti);
  */
 typedef long (*dm_dax_direct_access_fn) (struct dm_target *ti, pgoff_t pgoff,
 		long nr_pages, void **kaddr, pfn_t *pfn);
-typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i);
 typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
 		size_t nr_pages);
 
@@ -200,8 +198,6 @@ struct target_type {
 	dm_iterate_devices_fn iterate_devices;
 	dm_io_hints_fn io_hints;
 	dm_dax_direct_access_fn direct_access;
-	dm_dax_copy_iter_fn dax_copy_from_iter;
-	dm_dax_copy_iter_fn dax_copy_to_iter;
 	dm_dax_zero_page_range_fn dax_zero_page_range;
 
 	/* For internal device-mapper use. */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

