Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB1B32C27F1
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 14:33:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-RLMyCX73Meiu_tI5daS3fQ-1; Tue, 24 Nov 2020 08:33:27 -0500
X-MC-Unique: RLMyCX73Meiu_tI5daS3fQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CC1F80F041;
	Tue, 24 Nov 2020 13:33:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B6A5D9CC;
	Tue, 24 Nov 2020 13:33:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDC191809CA3;
	Tue, 24 Nov 2020 13:33:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AODXIcf019216 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 08:33:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61318111286F; Tue, 24 Nov 2020 13:33:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D039111286D
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:33:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E9485829F
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:33:18 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383-h5uILqnnOGC6LQbw5J220g-1; Tue, 24 Nov 2020 08:33:14 -0500
X-MC-Unique: h5uILqnnOGC6LQbw5J220g-1
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMz-0006bW-Ik; Tue, 24 Nov 2020 13:28:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 24 Nov 2020 14:27:31 +0100
Message-Id: <20201124132751.3747337-26-hch@lst.de>
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [dm-devel] [PATCH 25/45] block: reference struct block_device from
	struct hd_struct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To simplify block device lookup and a few other upcoming areas, make sure
that we always have a struct block_device available for each disk and
each partition.  The only downside of this is that each device and
partition uses a little more memory.  The upside will be that a lot of
code can be simplified.

With that all we need to look up the block device is to lookup the inode
and do a few sanity checks on the gendisk, instead of the separate lookup
for the gendisk.  These checks are in a new RCU critical section and
the disk is now freed using kfree_rcu().

As part of the change switch bdget() to only find existing block devices,
given that we know that the block_device structure must be allocated at
probe / partition scan time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk.h             |   2 +-
 block/genhd.c           | 212 ++++------------------------------------
 block/partitions/core.c |  29 +++---
 fs/block_dev.c          | 171 ++++++++++++++++++--------------
 include/linux/blkdev.h  |   2 +
 include/linux/genhd.h   |   6 +-
 6 files changed, 140 insertions(+), 282 deletions(-)

diff --git a/block/blk.h b/block/blk.h
index dfab98465db9a5..c4839abcfa27eb 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -352,7 +352,6 @@ struct hd_struct *disk_map_sector_rcu(struct gendisk *disk, sector_t sector);
 
 int blk_alloc_devt(struct hd_struct *part, dev_t *devt);
 void blk_free_devt(dev_t devt);
-void blk_invalidate_devt(dev_t devt);
 char *disk_name(struct gendisk *hd, int partno, char *buf);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
@@ -384,6 +383,7 @@ static inline void hd_free_part(struct hd_struct *part)
 {
 	free_percpu(part->dkstats);
 	kfree(part->info);
+	bdput(part->bdev);
 	percpu_ref_exit(&part->ref);
 }
 
diff --git a/block/genhd.c b/block/genhd.c
index f46e89226fdf91..16c6b13242105b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -27,17 +27,9 @@
 
 static struct kobject *block_depr;
 
-static DEFINE_XARRAY(bdev_map);
-static DEFINE_MUTEX(bdev_map_lock);
-
 /* for extended dynamic devt allocation, currently only one major is used */
 #define NR_EXT_DEVT		(1 << MINORBITS)
-
-/* For extended devt allocation.  ext_devt_lock prevents look up
- * results from going away underneath its user.
- */
-static DEFINE_SPINLOCK(ext_devt_lock);
-static DEFINE_IDR(ext_devt_idr);
+static DEFINE_IDA(ext_devt_ida);
 
 static void disk_check_events(struct disk_events *ev,
 			      unsigned int *clearing_ptr);
@@ -580,14 +572,7 @@ int blk_alloc_devt(struct hd_struct *part, dev_t *devt)
 		return 0;
 	}
 
-	/* allocate ext devt */
-	idr_preload(GFP_KERNEL);
-
-	spin_lock_bh(&ext_devt_lock);
-	idx = idr_alloc(&ext_devt_idr, part, 0, NR_EXT_DEVT, GFP_NOWAIT);
-	spin_unlock_bh(&ext_devt_lock);
-
-	idr_preload_end();
+	idx = ida_alloc_range(&ext_devt_ida, 0, NR_EXT_DEVT, GFP_KERNEL);
 	if (idx < 0)
 		return idx == -ENOSPC ? -EBUSY : idx;
 
@@ -606,26 +591,8 @@ int blk_alloc_devt(struct hd_struct *part, dev_t *devt)
  */
 void blk_free_devt(dev_t devt)
 {
-	if (devt == MKDEV(0, 0))
-		return;
-
-	if (MAJOR(devt) == BLOCK_EXT_MAJOR) {
-		spin_lock_bh(&ext_devt_lock);
-		idr_remove(&ext_devt_idr, blk_mangle_minor(MINOR(devt)));
-		spin_unlock_bh(&ext_devt_lock);
-	}
-}
-
-/*
- * We invalidate devt by assigning NULL pointer for devt in idr.
- */
-void blk_invalidate_devt(dev_t devt)
-{
-	if (MAJOR(devt) == BLOCK_EXT_MAJOR) {
-		spin_lock_bh(&ext_devt_lock);
-		idr_replace(&ext_devt_idr, NULL, blk_mangle_minor(MINOR(devt)));
-		spin_unlock_bh(&ext_devt_lock);
-	}
+	if (MAJOR(devt) == BLOCK_EXT_MAJOR)
+		ida_free(&ext_devt_ida, blk_mangle_minor(MINOR(devt)));
 }
 
 static char *bdevt_str(dev_t devt, char *buf)
@@ -640,28 +607,6 @@ static char *bdevt_str(dev_t devt, char *buf)
 	return buf;
 }
 
-static void blk_register_region(struct gendisk *disk)
-{
-	int i;
-
-	mutex_lock(&bdev_map_lock);
-	for (i = 0; i < disk->minors; i++) {
-		if (xa_insert(&bdev_map, disk_devt(disk) + i, disk, GFP_KERNEL))
-			WARN_ON_ONCE(1);
-	}
-	mutex_unlock(&bdev_map_lock);
-}
-
-static void blk_unregister_region(struct gendisk *disk)
-{
-	int i;
-
-	mutex_lock(&bdev_map_lock);
-	for (i = 0; i < disk->minors; i++)
-		xa_erase(&bdev_map, disk_devt(disk) + i);
-	mutex_unlock(&bdev_map_lock);
-}
-
 static void disk_scan_partitions(struct gendisk *disk)
 {
 	struct block_device *bdev;
@@ -805,7 +750,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 		ret = bdi_register(bdi, "%u:%u", MAJOR(devt), MINOR(devt));
 		WARN_ON(ret);
 		bdi_set_owner(bdi, dev);
-		blk_register_region(disk);
+		bdev_add(disk->part0.bdev, devt);
 	}
 	register_disk(parent, disk, groups);
 	if (register_queue)
@@ -886,11 +831,8 @@ void del_gendisk(struct gendisk *disk)
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
-	/*
-	 * Block lookups of the disk until all bdevs are unhashed and the
-	 * disk is marked as dead (GENHD_FL_UP cleared).
-	 */
-	down_write(&disk->lookup_sem);
+	disk->flags &= ~GENHD_FL_UP;
+
 	/* invalidate stuff */
 	disk_part_iter_init(&piter, disk,
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
@@ -902,8 +844,6 @@ void del_gendisk(struct gendisk *disk)
 
 	invalidate_partition(disk, 0);
 	set_capacity(disk, 0);
-	disk->flags &= ~GENHD_FL_UP;
-	up_write(&disk->lookup_sem);
 
 	if (!(disk->flags & GENHD_FL_HIDDEN)) {
 		sysfs_remove_link(&disk_to_dev(disk)->kobj, "bdi");
@@ -916,16 +856,6 @@ void del_gendisk(struct gendisk *disk)
 	}
 
 	blk_unregister_queue(disk);
-	
-	if (!(disk->flags & GENHD_FL_HIDDEN))
-		blk_unregister_region(disk);
-	/*
-	 * Remove gendisk pointer from idr so that it cannot be looked up
-	 * while RCU period before freeing gendisk is running to prevent
-	 * use-after-free issues. Note that the device number stays
-	 * "in-use" until we really free the gendisk.
-	 */
-	blk_invalidate_devt(disk_devt(disk));
 
 	kobject_put(disk->part0.holder_dir);
 	kobject_put(disk->slave_dir);
@@ -964,7 +894,7 @@ static ssize_t disk_badblocks_store(struct device *dev,
 	return badblocks_store(disk->bb, page, len, 0);
 }
 
-static void request_gendisk_module(dev_t devt)
+void blk_request_module(dev_t devt)
 {
 	unsigned int major = MAJOR(devt);
 	struct blk_major_name **n;
@@ -984,84 +914,6 @@ static void request_gendisk_module(dev_t devt)
 		request_module("block-major-%d", MAJOR(devt));
 }
 
-static bool get_disk_and_module(struct gendisk *disk)
-{
-	struct module *owner;
-
-	if (!disk->fops)
-		return false;
-	owner = disk->fops->owner;
-	if (owner && !try_module_get(owner))
-		return false;
-	if (!kobject_get_unless_zero(&disk_to_dev(disk)->kobj)) {
-		module_put(owner);
-		return false;
-	}
-	return true;
-
-}
-
-/**
- * get_gendisk - get partitioning information for a given device
- * @devt: device to get partitioning information for
- * @partno: returned partition index
- *
- * This function gets the structure containing partitioning
- * information for the given device @devt.
- *
- * Context: can sleep
- */
-struct gendisk *get_gendisk(dev_t devt, int *partno)
-{
-	struct gendisk *disk = NULL;
-
-	might_sleep();
-
-	if (MAJOR(devt) != BLOCK_EXT_MAJOR) {
-		mutex_lock(&bdev_map_lock);
-		disk = xa_load(&bdev_map, devt);
-		if (!disk) {
-			mutex_unlock(&bdev_map_lock);
-			request_gendisk_module(devt);
-			mutex_lock(&bdev_map_lock);
-			disk = xa_load(&bdev_map, devt);
-		}
-		if (disk && !get_disk_and_module(disk))
-			disk = NULL;
-		if (disk)
-			*partno = devt - disk_devt(disk);
-		mutex_unlock(&bdev_map_lock);
-	} else {
-		struct hd_struct *part;
-
-		spin_lock_bh(&ext_devt_lock);
-		part = idr_find(&ext_devt_idr, blk_mangle_minor(MINOR(devt)));
-		if (part && get_disk_and_module(part_to_disk(part))) {
-			*partno = part->partno;
-			disk = part_to_disk(part);
-		}
-		spin_unlock_bh(&ext_devt_lock);
-	}
-
-	if (!disk)
-		return NULL;
-
-	/*
-	 * Synchronize with del_gendisk() to not return disk that is being
-	 * destroyed.
-	 */
-	down_read(&disk->lookup_sem);
-	if (unlikely((disk->flags & GENHD_FL_HIDDEN) ||
-		     !(disk->flags & GENHD_FL_UP))) {
-		up_read(&disk->lookup_sem);
-		put_disk_and_module(disk);
-		disk = NULL;
-	} else {
-		up_read(&disk->lookup_sem);
-	}
-	return disk;
-}
-
 /**
  * bdget_disk - do bdget() by gendisk and partition number
  * @disk: gendisk of interest
@@ -1559,11 +1411,6 @@ int disk_expand_part_tbl(struct gendisk *disk, int partno)
  *
  * This function releases all allocated resources of the gendisk.
  *
- * The struct gendisk refcount is incremented with get_gendisk() or
- * get_disk_and_module(), and its refcount is decremented with
- * put_disk_and_module() or put_disk(). Once the refcount reaches 0 this
- * function is called.
- *
  * Drivers which used __device_add_disk() have a gendisk with a request_queue
  * assigned. Since the request_queue sits on top of the gendisk for these
  * drivers we also call blk_put_queue() for them, and we expect the
@@ -1585,7 +1432,7 @@ static void disk_release(struct device *dev)
 	hd_free_part(&disk->part0);
 	if (disk->queue)
 		blk_put_queue(disk->queue);
-	kfree(disk);
+	kfree_rcu(disk, rcu);
 }
 struct class block_class = {
 	.name		= "block",
@@ -1748,16 +1595,17 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 	if (!disk)
 		return NULL;
 
+	disk->part0.bdev = bdev_alloc(disk, 0);
+	if (!disk->part0.bdev)
+		goto out_free_disk;
+
 	disk->part0.dkstats = alloc_percpu(struct disk_stats);
 	if (!disk->part0.dkstats)
-		goto out_free_disk;
+		goto out_bdput;
 
-	init_rwsem(&disk->lookup_sem);
 	disk->node_id = node_id;
-	if (disk_expand_part_tbl(disk, 0)) {
-		free_percpu(disk->part0.dkstats);
-		goto out_free_disk;
-	}
+	if (disk_expand_part_tbl(disk, 0))
+		goto out_free_bdstats;
 
 	ptbl = rcu_dereference_protected(disk->part_tbl, 1);
 	rcu_assign_pointer(ptbl->part[0], &disk->part0);
@@ -1773,7 +1621,7 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 	 */
 	hd_sects_seq_init(&disk->part0);
 	if (hd_ref_init(&disk->part0))
-		goto out_free_part0;
+		goto out_free_bdstats;
 
 	disk->minors = minors;
 	rand_initialize_disk(disk);
@@ -1782,8 +1630,10 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 	device_initialize(disk_to_dev(disk));
 	return disk;
 
-out_free_part0:
-	hd_free_part(&disk->part0);
+out_free_bdstats:
+	free_percpu(disk->part0.dkstats);
+out_bdput:
+	bdput(disk->part0.bdev);
 out_free_disk:
 	kfree(disk);
 	return NULL;
@@ -1807,26 +1657,6 @@ void put_disk(struct gendisk *disk)
 }
 EXPORT_SYMBOL(put_disk);
 
-/**
- * put_disk_and_module - decrements the module and gendisk refcount
- * @disk: the struct gendisk to decrement the refcount for
- *
- * This is a counterpart of get_disk_and_module() and thus also of
- * get_gendisk().
- *
- * Context: Any context, but the last reference must not be dropped from
- *          atomic context.
- */
-void put_disk_and_module(struct gendisk *disk)
-{
-	if (disk) {
-		struct module *owner = disk->fops->owner;
-
-		put_disk(disk);
-		module_put(owner);
-	}
-}
-
 static void set_disk_ro_uevent(struct gendisk *gd, int ro)
 {
 	char event[] = "DISK_RO=1";
diff --git a/block/partitions/core.c b/block/partitions/core.c
index a02e224115943d..508b46da53eee5 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -340,12 +340,11 @@ void delete_partition(struct hd_struct *part)
 	device_del(part_to_dev(part));
 
 	/*
-	 * Remove gendisk pointer from idr so that it cannot be looked up
-	 * while RCU period before freeing gendisk is running to prevent
-	 * use-after-free issues. Note that the device number stays
-	 * "in-use" until we really free the gendisk.
+	 * Remove the block device from the inode hash, so that it cannot be
+	 * looked up while waiting for the RCU grace period.
 	 */
-	blk_invalidate_devt(part_devt(part));
+	remove_inode_hash(part->bdev->bd_inode);
+
 	percpu_ref_kill(&part->ref);
 }
 
@@ -368,6 +367,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
 	struct device *pdev;
+	struct block_device *bdev;
 	struct disk_part_tbl *ptbl;
 	const char *dname;
 	int err;
@@ -402,11 +402,15 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	if (!p)
 		return ERR_PTR(-EBUSY);
 
+	err = -ENOMEM;
 	p->dkstats = alloc_percpu(struct disk_stats);
-	if (!p->dkstats) {
-		err = -ENOMEM;
+	if (!p->dkstats)
 		goto out_free;
-	}
+
+	bdev = bdev_alloc(disk, partno);
+	if (!bdev)
+		goto out_free_stats;
+	p->bdev = bdev;
 
 	hd_sects_seq_init(p);
 	pdev = part_to_dev(p);
@@ -420,10 +424,8 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 		struct partition_meta_info *pinfo;
 
 		pinfo = kzalloc_node(sizeof(*pinfo), GFP_KERNEL, disk->node_id);
-		if (!pinfo) {
-			err = -ENOMEM;
-			goto out_free_stats;
-		}
+		if (!pinfo)
+			goto out_bdput;
 		memcpy(pinfo, info, sizeof(*info));
 		p->info = pinfo;
 	}
@@ -470,6 +472,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	}
 
 	/* everything is up and running, commence */
+	bdev_add(bdev, devt);
 	rcu_assign_pointer(ptbl->part[partno], p);
 
 	/* suppress uevent if the disk suppresses it */
@@ -479,6 +482,8 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 
 out_free_info:
 	kfree(p->info);
+out_bdput:
+	bdput(bdev);
 out_free_stats:
 	free_percpu(p->dkstats);
 out_free:
diff --git a/fs/block_dev.c b/fs/block_dev.c
index c0d1e8248ffe23..b9ee8fe5acd570 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -863,31 +863,45 @@ void __init bdev_cache_init(void)
 	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
 }
 
-static struct block_device *bdget(dev_t dev)
+struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 {
 	struct block_device *bdev;
 	struct inode *inode;
 
-	inode = iget_locked(blockdev_superblock, dev);
+	inode = new_inode(blockdev_superblock);
 	if (!inode)
 		return NULL;
+	inode->i_mode = S_IFBLK;
+	inode->i_rdev = 0;
+	inode->i_data.a_ops = &def_blk_aops;
+
+	bdev = I_BDEV(inode);
+	spin_lock_init(&bdev->bd_size_lock);
+	bdev->bd_disk = disk;
+	bdev->bd_partno = partno;
+	bdev->bd_contains = NULL;
+	bdev->bd_super = NULL;
+	bdev->bd_inode = inode;
+	bdev->bd_part_count = 0;
+	return bdev;
+}
 
-	bdev = &BDEV_I(inode)->bdev;
+void bdev_add(struct block_device *bdev, dev_t dev)
+{
+	bdev->bd_dev = dev;
+	bdev->bd_inode->i_rdev = dev;
+	bdev->bd_inode->i_ino = dev;
+	insert_inode_hash(bdev->bd_inode);
+}
 
-	if (inode->i_state & I_NEW) {
-		spin_lock_init(&bdev->bd_size_lock);
-		bdev->bd_contains = NULL;
-		bdev->bd_super = NULL;
-		bdev->bd_inode = inode;
-		bdev->bd_part_count = 0;
-		bdev->bd_dev = dev;
-		inode->i_mode = S_IFBLK;
-		inode->i_rdev = dev;
-		inode->i_data.a_ops = &def_blk_aops;
-		mapping_set_gfp_mask(&inode->i_data, GFP_USER);
-		unlock_new_inode(inode);
-	}
-	return bdev;
+static struct block_device *bdget(dev_t dev)
+{
+	struct inode *inode;
+
+	inode = ilookup(blockdev_superblock, dev);
+	if (!inode)
+		return NULL;
+	return &BDEV_I(inode)->bdev;
 }
 
 /**
@@ -1000,27 +1014,6 @@ int bd_prepare_to_claim(struct block_device *bdev, struct block_device *whole,
 }
 EXPORT_SYMBOL_GPL(bd_prepare_to_claim); /* only for the loop driver */
 
-static struct gendisk *bdev_get_gendisk(struct block_device *bdev, int *partno)
-{
-	struct gendisk *disk = get_gendisk(bdev->bd_dev, partno);
-
-	if (!disk)
-		return NULL;
-	/*
-	 * Now that we hold gendisk reference we make sure bdev we looked up is
-	 * not stale. If it is, it means device got removed and created before
-	 * we looked up gendisk and we fail open in such case. Associating
-	 * unhashed bdev with newly created gendisk could lead to two bdevs
-	 * (and thus two independent caches) being associated with one device
-	 * which is bad.
-	 */
-	if (inode_unhashed(bdev->bd_inode)) {
-		put_disk_and_module(disk);
-		return NULL;
-	}
-	return disk;
-}
-
 static void bd_clear_claiming(struct block_device *whole, void *holder)
 {
 	lockdep_assert_held(&bdev_lock);
@@ -1343,19 +1336,17 @@ EXPORT_SYMBOL_GPL(bdev_disk_changed);
  *  mutex_lock(part->bd_mutex)
  *    mutex_lock_nested(whole->bd_mutex, 1)
  */
-static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
-		int partno, fmode_t mode)
+static int __blkdev_get(struct block_device *bdev, fmode_t mode)
 {
+	struct gendisk *disk = bdev->bd_disk;
 	int ret;
 
 	if (!bdev->bd_openers) {
-		bdev->bd_disk = disk;
 		bdev->bd_contains = bdev;
-		bdev->bd_partno = partno;
 
-		if (!partno) {
+		if (!bdev->bd_partno) {
 			ret = -ENXIO;
-			bdev->bd_part = disk_get_part(disk, partno);
+			bdev->bd_part = disk_get_part(disk, 0);
 			if (!bdev->bd_part)
 				goto out_clear;
 
@@ -1384,7 +1375,7 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
 			struct block_device *whole = bdget_disk(disk, 0);
 
 			mutex_lock_nested(&whole->bd_mutex, 1);
-			ret = __blkdev_get(whole, disk, 0, mode);
+			ret = __blkdev_get(whole, mode);
 			if (ret) {
 				mutex_unlock(&whole->bd_mutex);
 				bdput(whole);
@@ -1394,9 +1385,8 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
 			mutex_unlock(&whole->bd_mutex);
 
 			bdev->bd_contains = whole;
-			bdev->bd_part = disk_get_part(disk, partno);
-			if (!(disk->flags & GENHD_FL_UP) ||
-			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
+			bdev->bd_part = disk_get_part(disk, bdev->bd_partno);
+			if (!bdev->bd_part || !bdev->bd_part->nr_sects) {
 				__blkdev_put(whole, mode, 1);
 				ret = -ENXIO;
 				goto out_clear;
@@ -1425,12 +1415,46 @@ static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
 
  out_clear:
 	disk_put_part(bdev->bd_part);
-	bdev->bd_disk = NULL;
 	bdev->bd_part = NULL;
 	bdev->bd_contains = NULL;
 	return ret;
 }
 
+static struct block_device *get_bdev_disk_and_module(dev_t dev)
+{
+	struct block_device *bdev = NULL;
+	struct gendisk *disk = NULL;
+
+	rcu_read_lock();
+	bdev = bdget(dev);
+	if (!bdev) {
+		rcu_read_unlock();
+		blk_request_module(dev);
+		rcu_read_lock();
+
+		bdev = bdget(dev);
+	}
+	if (!bdev)
+		goto fail;
+
+	if (!kobject_get_unless_zero(&disk_to_dev(bdev->bd_disk)->kobj))
+		goto fail;
+	disk = bdev->bd_disk;
+	if ((disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
+		goto fail;
+	if (!try_module_get(bdev->bd_disk->fops->owner))
+		goto fail;
+	rcu_read_unlock();
+	return bdev;
+fail:
+	rcu_read_unlock();
+	if (disk)
+		put_disk(disk);
+	if (bdev)
+		bdput(bdev);
+	return NULL;
+}
+
 /**
  * blkdev_get_by_dev - open a block device by device number
  * @dev: device number of block device to open
@@ -1458,7 +1482,6 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	bool unblock_events = true;
 	struct block_device *bdev;
 	struct gendisk *disk;
-	int partno;
 	int ret;
 
 	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
@@ -1468,19 +1491,15 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	if (ret)
 		return ERR_PTR(ret);
 
-	bdev = bdget(dev);
-	if (!bdev)
-		return ERR_PTR(-ENOMEM);
-
 	/*
 	 * If we lost a race with 'disk' being deleted, try again.  See md.c.
 	 */
 retry:
-	ret = -ENXIO;
-	disk = bdev_get_gendisk(bdev, &partno);
-	if (!disk)
-		goto bdput;
-
+	bdev = get_bdev_disk_and_module(dev);
+	if (!bdev)
+		return ERR_PTR(-ENXIO);
+	disk = bdev->bd_disk;
+ 
 	if (mode & FMODE_EXCL) {
 		WARN_ON_ONCE(!holder);
 	
@@ -1496,12 +1515,10 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	disk_block_events(disk);
 
 	mutex_lock(&bdev->bd_mutex);
-	ret =__blkdev_get(bdev, disk, partno, mode);
-	if (!(mode & FMODE_EXCL)) {
-		; /* nothing to do here */
-	} else if (ret) {
-		bd_abort_claiming(bdev, claiming, holder);
-	} else {
+	ret =__blkdev_get(bdev, mode);
+	if (ret)
+		goto abort_claiming;
+	if (mode & FMODE_EXCL) {
 		bd_finish_claiming(bdev, claiming, holder);
 
 		/*
@@ -1521,21 +1538,25 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 
 	if (unblock_events)
 		disk_unblock_events(disk);
+	if (mode & FMODE_EXCL)
+		bdput(claiming);
+	return bdev;
 
+abort_claiming:
+	if (mode & FMODE_EXCL)
+		bd_abort_claiming(bdev, claiming, holder);
+	mutex_unlock(&bdev->bd_mutex);
+	disk_unblock_events(disk);
 put_claiming:
 	if (mode & FMODE_EXCL)
 		bdput(claiming);
 put_disk:
-	if (ret)
-		put_disk_and_module(disk);
+	module_put(disk->fops->owner);
+	put_disk(disk);
+	bdput(bdev);
 	if (ret == -ERESTARTSYS)
 		goto retry;
-bdput:
-	if (ret) {
-		bdput(bdev);
-		return ERR_PTR(ret);
-	}
-	return bdev;
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL(blkdev_get_by_dev);
 
@@ -1637,7 +1658,6 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 
 		disk_put_part(bdev->bd_part);
 		bdev->bd_part = NULL;
-		bdev->bd_disk = NULL;
 		if (bdev_is_partition(bdev))
 			victim = bdev->bd_contains;
 		bdev->bd_contains = NULL;
@@ -1698,7 +1718,8 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	mutex_unlock(&bdev->bd_mutex);
 
 	__blkdev_put(bdev, mode, 0);
-	put_disk_and_module(disk);
+	module_put(disk->fops->owner);
+	put_disk(disk);
 }
 EXPORT_SYMBOL(blkdev_put);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bdd7339bcda462..48e5a8393cd793 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1994,6 +1994,8 @@ void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
 		void *holder);
 void blkdev_put(struct block_device *bdev, fmode_t mode);
 
+struct block_device *bdev_alloc(struct gendisk *disk, u8 partno);
+void bdev_add(struct block_device *bdev, dev_t dev);
 struct block_device *I_BDEV(struct inode *inode);
 struct block_device *bdget_part(struct hd_struct *part);
 struct block_device *bdgrab(struct block_device *bdev);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index ca5e356084c353..d068e46f9086ae 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -65,6 +65,7 @@ struct hd_struct {
 	struct disk_stats __percpu *dkstats;
 	struct percpu_ref ref;
 
+	struct block_device *bdev;
 	struct device __dev;
 	struct kobject *holder_dir;
 	int policy, partno;
@@ -193,7 +194,6 @@ struct gendisk {
 	int flags;
 	unsigned long state;
 #define GD_NEED_PART_SCAN		0
-	struct rw_semaphore lookup_sem;
 	struct kobject *slave_dir;
 
 	struct timer_rand_state *random;
@@ -207,6 +207,7 @@ struct gendisk {
 #endif
 	int node_id;
 	struct badblocks *bb;
+	struct rcu_head rcu;
 	struct lockdep_map lockdep_map;
 };
 
@@ -300,7 +301,6 @@ static inline void add_disk_no_queue_reg(struct gendisk *disk)
 }
 
 extern void del_gendisk(struct gendisk *gp);
-extern struct gendisk *get_gendisk(dev_t dev, int *partno);
 extern struct block_device *bdget_disk(struct gendisk *disk, int partno);
 
 extern void set_disk_ro(struct gendisk *disk, int flag);
@@ -338,7 +338,6 @@ int blk_drop_partitions(struct block_device *bdev);
 
 extern struct gendisk *__alloc_disk_node(int minors, int node_id);
 extern void put_disk(struct gendisk *disk);
-extern void put_disk_and_module(struct gendisk *disk);
 
 #define alloc_disk_node(minors, node_id)				\
 ({									\
@@ -389,6 +388,7 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
 #endif /* CONFIG_SYSFS */
 
 dev_t blk_lookup_devt(const char *name, int partno);
+void blk_request_module(dev_t devt);
 #ifdef CONFIG_BLOCK
 void printk_all_partitions(void);
 #else /* CONFIG_BLOCK */
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

