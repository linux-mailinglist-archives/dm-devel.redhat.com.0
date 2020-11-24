Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 168192C277C
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-7d3EX5JZNEi5JUh8o3DbsA-1; Tue, 24 Nov 2020 08:29:51 -0500
X-MC-Unique: 7d3EX5JZNEi5JUh8o3DbsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C93A887951F;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A17F1100164C;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59A0B50031;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AODTSJY018305 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 08:29:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 012A9111286C; Tue, 24 Nov 2020 13:29:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE36F1112870
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:29:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16D80800B3A
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:29:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-zdqy3Tg3OOSOcqPz3dI9bg-1; Tue, 24 Nov 2020 08:29:24 -0500
X-MC-Unique: zdqy3Tg3OOSOcqPz3dI9bg-1
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYNZ-0006jP-2n; Tue, 24 Nov 2020 13:29:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 24 Nov 2020 14:27:50 +0100
Message-Id: <20201124132751.3747337-45-hch@lst.de>
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
Subject: [dm-devel] [PATCH 44/45] block: merge struct block_device and
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having two structures that represent each block device with
different life time rules, merge them into a single one.  This also
greatly simplifies the reference counting rules, as we can use the inode
reference count as the main reference count for the new struct
block_device, with the device model reference front ending it for device
model interaction.  The percpu refcount in struct hd_struct is entirely
gone given that struct block_device must be opened and thus valid for
the duration of the I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c        |   9 ++-
 block/blk.h               |   2 +-
 block/genhd.c             |  86 +++++++++-------------------
 block/partitions/core.c   | 116 +++++++++++++++-----------------------
 fs/block_dev.c            |   9 ---
 include/linux/blk_types.h |   8 ++-
 include/linux/blkdev.h    |   1 -
 include/linux/genhd.h     |  40 +++----------
 init/do_mounts.c          |  21 ++++---
 kernel/trace/blktrace.c   |  43 +++-----------
 10 files changed, 109 insertions(+), 226 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index a598f86e014137..99e0e0b3e347de 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -820,9 +820,9 @@ static void blkcg_fill_root_iostats(void)
 
 	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
 	while ((dev = class_dev_iter_next(&iter))) {
-		struct gendisk *disk = dev_to_disk(dev);
-		struct hd_struct *part = disk_get_part(disk, 0);
-		struct blkcg_gq *blkg = blk_queue_root_blkg(disk->queue);
+		struct block_device *bdev = dev_to_bdev(dev);
+		struct blkcg_gq *blkg =
+			blk_queue_root_blkg(bdev->bd_disk->queue);
 		struct blkg_iostat tmp;
 		int cpu;
 
@@ -830,7 +830,7 @@ static void blkcg_fill_root_iostats(void)
 		for_each_possible_cpu(cpu) {
 			struct disk_stats *cpu_dkstats;
 
-			cpu_dkstats = per_cpu_ptr(part->bdev->bd_stats, cpu);
+			cpu_dkstats = per_cpu_ptr(bdev->bd_stats, cpu);
 			tmp.ios[BLKG_IOSTAT_READ] +=
 				cpu_dkstats->ios[STAT_READ];
 			tmp.ios[BLKG_IOSTAT_WRITE] +=
@@ -849,7 +849,6 @@ static void blkcg_fill_root_iostats(void)
 			blkg_iostat_set(&blkg->iostat.cur, &tmp);
 			u64_stats_update_end(&blkg->iostat.sync);
 		}
-		disk_put_part(part);
 	}
 }
 
diff --git a/block/blk.h b/block/blk.h
index 9657c6da7c770c..98f0b1ae264120 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -356,7 +356,7 @@ char *disk_name(struct gendisk *hd, int partno, char *buf);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
 #define ADDPART_FLAG_WHOLEDISK	2
-void delete_partition(struct hd_struct *part);
+void delete_partition(struct block_device *part);
 int bdev_add_partition(struct block_device *bdev, int partno,
 		sector_t start, sector_t length);
 int bdev_del_partition(struct block_device *bdev, int partno);
diff --git a/block/genhd.c b/block/genhd.c
index f0bf10192066ac..e1f67b9951f0ec 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -96,13 +96,14 @@ const char *bdevname(struct block_device *bdev, char *buf)
 }
 EXPORT_SYMBOL(bdevname);
 
-static void part_stat_read_all(struct hd_struct *part, struct disk_stats *stat)
+static void part_stat_read_all(struct block_device *part,
+		struct disk_stats *stat)
 {
 	int cpu;
 
 	memset(stat, 0, sizeof(struct disk_stats));
 	for_each_possible_cpu(cpu) {
-		struct disk_stats *ptr = per_cpu_ptr(part->bdev->bd_stats, cpu);
+		struct disk_stats *ptr = per_cpu_ptr(part->bd_stats, cpu);
 		int group;
 
 		for (group = 0; group < NR_STAT_GROUPS; group++) {
@@ -157,36 +158,6 @@ struct block_device *__disk_get_part(struct gendisk *disk, int partno)
 	return rcu_dereference(ptbl->part[partno]);
 }
 
-/**
- * disk_get_part - get partition
- * @disk: disk to look partition from
- * @partno: partition number
- *
- * Look for partition @partno from @disk.  If found, increment
- * reference count and return it.
- *
- * CONTEXT:
- * Don't care.
- *
- * RETURNS:
- * Pointer to the found partition on success, NULL if not found.
- */
-struct hd_struct *disk_get_part(struct gendisk *disk, int partno)
-{
-	struct block_device *part;
-
-	rcu_read_lock();
-	part = __disk_get_part(disk, partno);
-	if (!part) {
-		rcu_read_unlock();
-		return NULL;
-	}
-
-	get_device(part_to_dev(part->bd_part));
-	rcu_read_unlock();
-	return part->bd_part;
-}
-
 /**
  * disk_part_iter_init - initialize partition iterator
  * @piter: iterator to initialize
@@ -840,7 +811,7 @@ void del_gendisk(struct gendisk *disk)
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
 		invalidate_partition(part);
-		delete_partition(part->bd_part);
+		delete_partition(part);
 	}
 	disk_part_iter_exit(&piter);
 
@@ -931,13 +902,13 @@ void blk_request_module(dev_t devt)
  */
 struct block_device *bdget_disk(struct gendisk *disk, int partno)
 {
-	struct hd_struct *part;
 	struct block_device *bdev = NULL;
 
-	part = disk_get_part(disk, partno);
-	if (part)
-		bdev = bdget_part(part);
-	disk_put_part(part);
+	rcu_read_lock();
+	bdev = __disk_get_part(disk, partno);
+	if (bdev)
+		bdgrab(bdev);
+	rcu_read_unlock();
 
 	return bdev;
 }
@@ -1154,24 +1125,22 @@ static ssize_t disk_ro_show(struct device *dev,
 ssize_t part_size_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-
-	return sprintf(buf, "%llu\n", bdev_nr_sectors(p->bdev));
+	return sprintf(buf, "%llu\n", bdev_nr_sectors(dev_to_bdev(dev)));
 }
 
 ssize_t part_stat_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-	struct request_queue *q = part_to_disk(p)->queue;
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct request_queue *q = bdev->bd_disk->queue;
 	struct disk_stats stat;
 	unsigned int inflight;
 
-	part_stat_read_all(p, &stat);
+	part_stat_read_all(bdev, &stat);
 	if (queue_is_mq(q))
-		inflight = blk_mq_in_flight(q, p->bdev);
+		inflight = blk_mq_in_flight(q, bdev);
 	else
-		inflight = part_in_flight(p->bdev);
+		inflight = part_in_flight(bdev);
 
 	return sprintf(buf,
 		"%8lu %8lu %8llu %8u "
@@ -1206,14 +1175,14 @@ ssize_t part_stat_show(struct device *dev,
 ssize_t part_inflight_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-	struct request_queue *q = part_to_disk(p)->queue;
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct request_queue *q = bdev->bd_disk->queue;
 	unsigned int inflight[2];
 
 	if (queue_is_mq(q))
-		blk_mq_in_flight_rw(q, p->bdev, inflight);
+		blk_mq_in_flight_rw(q, bdev, inflight);
 	else
-		part_in_flight_rw(p->bdev, inflight);
+		part_in_flight_rw(bdev, inflight);
 
 	return sprintf(buf, "%8u %8u\n", inflight[0], inflight[1]);
 }
@@ -1261,16 +1230,14 @@ static DEVICE_ATTR(badblocks, 0644, disk_badblocks_show, disk_badblocks_store);
 ssize_t part_fail_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-
-	return sprintf(buf, "%d\n", p->bdev->bd_make_it_fail);
+	return sprintf(buf, "%d\n", dev_to_bdev(dev)->make_it_fail);
 }
 
 ssize_t part_fail_store(struct device *dev,
 			struct device_attribute *attr,
 			const char *buf, size_t count)
 {
-	struct hd_struct *p = dev_to_part(dev);
+	struct block_device *p = dev_to_bdev(dev);
 	int i;
 
 	if (count > 0 && sscanf(buf, "%d", &i) > 0)
@@ -1484,7 +1451,7 @@ static int diskstats_show(struct seq_file *seqf, void *v)
 
 	disk_part_iter_init(&piter, gp, DISK_PITER_INCL_EMPTY_PART0);
 	while ((hd = disk_part_iter_next(&piter))) {
-		part_stat_read_all(hd->bd_part, &stat);
+		part_stat_read_all(hd, &stat);
 		if (queue_is_mq(gp->queue))
 			inflight = blk_mq_in_flight(gp->queue, hd);
 		else
@@ -1556,7 +1523,7 @@ dev_t blk_lookup_devt(const char *name, int partno)
 	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
 	while ((dev = class_dev_iter_next(&iter))) {
 		struct gendisk *disk = dev_to_disk(dev);
-		struct hd_struct *part;
+		struct block_device *part;
 
 		if (strcmp(dev_name(dev), name))
 			continue;
@@ -1569,13 +1536,12 @@ dev_t blk_lookup_devt(const char *name, int partno)
 				     MINOR(dev->devt) + partno);
 			break;
 		}
-		part = disk_get_part(disk, partno);
+		part = bdget_disk(disk, partno);
 		if (part) {
-			devt = part_devt(part);
-			disk_put_part(part);
+			devt = part->bd_dev;
+			bdput(part);
 			break;
 		}
-		disk_put_part(part);
 	}
 	class_dev_iter_exit(&iter);
 	return devt;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index c189ebd4569812..8d774840b14047 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -182,44 +182,39 @@ static struct parsed_partitions *check_partition(struct gendisk *hd,
 static ssize_t part_partition_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-
-	return sprintf(buf, "%d\n", p->bdev->bd_partno);
+	return sprintf(buf, "%d\n", dev_to_bdev(dev)->bd_partno);
 }
 
 static ssize_t part_start_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-
-	return sprintf(buf, "%llu\n",(unsigned long long)p->bdev->bd_start_sect);
+	return sprintf(buf, "%llu\n", dev_to_bdev(dev)->bd_start_sect);
 }
 
 static ssize_t part_ro_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
-	return sprintf(buf, "%d\n", p->bdev->bd_read_only);
+	return sprintf(buf, "%d\n", dev_to_bdev(dev)->bd_read_only);
 }
 
 static ssize_t part_alignment_offset_show(struct device *dev,
 					  struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
+	struct block_device *bdev = dev_to_bdev(dev);
 
 	return sprintf(buf, "%u\n",
-		queue_limit_alignment_offset(&part_to_disk(p)->queue->limits,
-				p->bdev->bd_start_sect));
+		queue_limit_alignment_offset(&bdev->bd_disk->queue->limits,
+				bdev->bd_start_sect));
 }
 
 static ssize_t part_discard_alignment_show(struct device *dev,
 					   struct device_attribute *attr, char *buf)
 {
-	struct hd_struct *p = dev_to_part(dev);
+	struct block_device *bdev = dev_to_bdev(dev);
 
 	return sprintf(buf, "%u\n",
-		queue_limit_discard_alignment(&part_to_disk(p)->queue->limits,
-				p->bdev->bd_start_sect));
+		queue_limit_discard_alignment(&bdev->bd_disk->queue->limits,
+				bdev->bd_start_sect));
 }
 
 static DEVICE_ATTR(partition, 0444, part_partition_show, NULL);
@@ -264,20 +259,19 @@ static const struct attribute_group *part_attr_groups[] = {
 
 static void part_release(struct device *dev)
 {
-	struct hd_struct *p = dev_to_part(dev);
+	struct block_device *p = dev_to_bdev(dev);
 
 	blk_free_devt(dev->devt);
-	bdput(p->bdev);
+	bdput(p);
 }
 
 static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	struct hd_struct *part = dev_to_part(dev);
+	struct block_device *part = dev_to_bdev(dev);
 
-	add_uevent_var(env, "PARTN=%u", part->bdev->bd_partno);
-	if (part->bdev->bd_meta_info && part->bdev->bd_meta_info->volname[0])
-		add_uevent_var(env, "PARTNAME=%s",
-			       part->bdev->bd_meta_info->volname);
+	add_uevent_var(env, "PARTN=%u", part->bd_partno);
+	if (part->bd_meta_info && part->bd_meta_info->volname[0])
+		add_uevent_var(env, "PARTNAME=%s", part->bd_meta_info->volname);
 	return 0;
 }
 
@@ -292,25 +286,25 @@ struct device_type part_type = {
  * Must be called either with bd_mutex held, before a disk can be opened or
  * after all disk users are gone.
  */
-void delete_partition(struct hd_struct *part)
+void delete_partition(struct block_device *part)
 {
-	struct gendisk *disk = part_to_disk(part);
+	struct gendisk *disk = part->bd_disk;
 	struct disk_part_tbl *ptbl =
 		rcu_dereference_protected(disk->part_tbl, 1);
 
-	rcu_assign_pointer(ptbl->part[part->bdev->bd_partno], NULL);
+	rcu_assign_pointer(ptbl->part[part->bd_partno], NULL);
 	rcu_assign_pointer(ptbl->last_lookup, NULL);
 
-	kobject_put(part->bdev->bd_holder_dir);
-	device_del(part_to_dev(part));
+	kobject_put(part->bd_holder_dir);
+	device_del(&part->bd_device);
 
 	/*
 	 * Remove the block device from the inode hash, so that it cannot be
 	 * looked up while waiting for the RCU grace period.
 	 */
-	remove_inode_hash(part->bdev->bd_inode);
+	remove_inode_hash(part->bd_inode);
 
-	put_device(part_to_dev(part));
+	put_device(&part->bd_device);
 }
 
 static ssize_t whole_disk_show(struct device *dev,
@@ -324,11 +318,10 @@ static DEVICE_ATTR(whole_disk, 0444, whole_disk_show, NULL);
  * Must be called either with bd_mutex held, before a disk can be opened or
  * after all disk users are gone.
  */
-static struct hd_struct *add_partition(struct gendisk *disk, int partno,
+static struct block_device *add_partition(struct gendisk *disk, int partno,
 				sector_t start, sector_t len, int flags,
 				struct partition_meta_info *info)
 {
-	struct hd_struct *p;
 	dev_t devt = MKDEV(0, 0);
 	struct device *ddev = disk_to_dev(disk);
 	struct device *pdev;
@@ -367,9 +360,6 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	if (!bdev)
 		return ERR_PTR(-ENOMEM);
 
-	p = bdev->bd_part;
-	pdev = part_to_dev(p);
-
 	bdev->bd_start_sect = start;
 	bdev_set_nr_sectors(bdev, len);
 	bdev->bd_read_only = get_disk_ro(disk);
@@ -381,6 +371,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 			goto out_bdput;
 	}
 
+	pdev = &bdev->bd_device;
 	dname = dev_name(ddev);
 	if (isdigit(dname[strlen(dname) - 1]))
 		dev_set_name(pdev, "%sp%d", dname, partno);
@@ -422,7 +413,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	/* suppress uevent if the disk suppresses it */
 	if (!dev_get_uevent_suppress(ddev))
 		kobject_uevent(&pdev->kobj, KOBJ_ADD);
-	return p;
+	return bdev;
 
 out_bdput:
 	bdput(bdev);
@@ -459,7 +450,7 @@ static bool partition_overlaps(struct gendisk *disk, sector_t start,
 int bdev_add_partition(struct block_device *bdev, int partno,
 		sector_t start, sector_t length)
 {
-	struct hd_struct *part;
+	struct block_device *part;
 
 	mutex_lock(&bdev->bd_mutex);
 	if (partition_overlaps(bdev->bd_disk, start, length, -1)) {
@@ -475,76 +466,59 @@ int bdev_add_partition(struct block_device *bdev, int partno,
 
 int bdev_del_partition(struct block_device *bdev, int partno)
 {
-	struct block_device *bdevp;
-	struct hd_struct *part = NULL;
+	struct block_device *part;
 	int ret;
 
-	bdevp = bdget_disk(bdev->bd_disk, partno);
-	if (!bdevp)
+	part = bdget_disk(bdev->bd_disk, partno);
+	if (!part)
 		return -ENXIO;
 
-	mutex_lock(&bdevp->bd_mutex);
+	mutex_lock(&part->bd_mutex);
 	mutex_lock_nested(&bdev->bd_mutex, 1);
 
-	ret = -ENXIO;
-	part = disk_get_part(bdev->bd_disk, partno);
-	if (!part)
-		goto out_unlock;
-
 	ret = -EBUSY;
-	if (bdevp->bd_openers)
+	if (part->bd_openers)
 		goto out_unlock;
 
-	sync_blockdev(bdevp);
-	invalidate_bdev(bdevp);
+	sync_blockdev(part);
+	invalidate_bdev(part);
 
 	delete_partition(part);
 	ret = 0;
 out_unlock:
 	mutex_unlock(&bdev->bd_mutex);
-	mutex_unlock(&bdevp->bd_mutex);
-	bdput(bdevp);
-	if (part)
-		disk_put_part(part);
+	mutex_unlock(&part->bd_mutex);
+	bdput(part);
 	return ret;
 }
 
 int bdev_resize_partition(struct block_device *bdev, int partno,
 		sector_t start, sector_t length)
 {
-	struct block_device *bdevp;
-	struct hd_struct *part;
+	struct block_device *part;
 	int ret = 0;
 
-	part = disk_get_part(bdev->bd_disk, partno);
+	part = bdget_disk(bdev->bd_disk, partno);
 	if (!part)
 		return -ENXIO;
 
-	ret = -ENOMEM;
-	bdevp = bdget_part(part);
-	if (!bdevp)
-		goto out_put_part;
-
-	mutex_lock(&bdevp->bd_mutex);
+	mutex_lock(&part->bd_mutex);
 	mutex_lock_nested(&bdev->bd_mutex, 1);
-
 	ret = -EINVAL;
-	if (start != part->bdev->bd_start_sect)
+	if (start != part->bd_start_sect)
 		goto out_unlock;
 
 	ret = -EBUSY;
 	if (partition_overlaps(bdev->bd_disk, start, length, partno))
 		goto out_unlock;
 
-	bdev_set_nr_sectors(bdevp, length);
+	bdev_set_nr_sectors(part, length);
 
 	ret = 0;
 out_unlock:
-	mutex_unlock(&bdevp->bd_mutex);
+	mutex_unlock(&part->bd_mutex);
 	mutex_unlock(&bdev->bd_mutex);
-	bdput(bdevp);
-out_put_part:
-	disk_put_part(part);
+	bdput(part);
 	return ret;
 }
 
@@ -577,7 +551,7 @@ int blk_drop_partitions(struct block_device *bdev)
 
 	disk_part_iter_init(&piter, bdev->bd_disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter)))
-		delete_partition(part->bd_part);
+		delete_partition(part);
 	disk_part_iter_exit(&piter);
 
 	return 0;
@@ -592,7 +566,7 @@ static bool blk_add_partition(struct gendisk *disk, struct block_device *bdev,
 {
 	sector_t size = state->parts[p].size;
 	sector_t from = state->parts[p].from;
-	struct hd_struct *part;
+	struct block_device *part;
 
 	if (!size)
 		return true;
@@ -632,7 +606,7 @@ static bool blk_add_partition(struct gendisk *disk, struct block_device *bdev,
 
 	if (IS_BUILTIN(CONFIG_BLK_DEV_MD) &&
 	    (state->parts[p].flags & ADDPART_FLAG_RAID))
-		md_autodetect_dev(part_to_dev(part)->devt);
+		md_autodetect_dev(part->bd_dev);
 
 	return true;
 }
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 1538b20ca4bd43..08171478473ead 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -39,7 +39,6 @@
 
 struct bdev_inode {
 	struct block_device bdev;
-	struct hd_struct hd;
 	struct inode vfs_inode;
 };
 
@@ -886,9 +885,6 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 		iput(inode);
 		return NULL;
 	}
-	bdev->bd_part = &BDEV_I(inode)->hd;
-	memset(bdev->bd_part, 0, sizeof(*bdev->bd_part));
-	bdev->bd_part->bdev = bdev;
 	return bdev;
 }
 
@@ -921,11 +917,6 @@ struct block_device *bdgrab(struct block_device *bdev)
 }
 EXPORT_SYMBOL(bdgrab);
 
-struct block_device *bdget_part(struct hd_struct *part)
-{
-	return bdget(part_devt(part));
-}
-
 long nr_blockdev_pages(void)
 {
 	struct inode *inode;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 6edea5c1625909..866f74261b3ba8 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <linux/bvec.h>
+#include <linux/device.h>
 #include <linux/ktime.h>
 
 struct bio_set;
@@ -30,6 +31,7 @@ struct block_device {
 	struct super_block *	bd_super;
 	struct mutex		bd_mutex;	/* open/close mutex */
 	void *			bd_claiming;
+	struct device		bd_device;
 	void *			bd_holder;
 	int			bd_holders;
 	bool			bd_write_holder;
@@ -38,7 +40,6 @@ struct block_device {
 #endif
 	struct kobject		*bd_holder_dir;
 	u8			bd_partno;
-	struct hd_struct *	bd_part;
 	/* number of times partitions within this device have been opened. */
 	unsigned		bd_part_count;
 
@@ -61,8 +62,11 @@ struct block_device {
 #define bdev_whole(_bdev) \
 	((_bdev)->bd_disk->part0)
 
+#define dev_to_bdev(device) \
+	container_of((device), struct block_device, bd_device)
+
 #define bdev_kobj(_bdev) \
-	(&part_to_dev((_bdev)->bd_part)->kobj)
+	(&((_bdev)->bd_device.kobj))
 
 /*
  * Block error status values.  See block/blk-core:blk_errors for the details.
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 0e83989b9678c3..f390446919b745 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1995,7 +1995,6 @@ void blkdev_put(struct block_device *bdev, fmode_t mode);
 struct block_device *bdev_alloc(struct gendisk *disk, u8 partno);
 void bdev_add(struct block_device *bdev, dev_t dev);
 struct block_device *I_BDEV(struct inode *inode);
-struct block_device *bdget_part(struct hd_struct *part);
 struct block_device *bdgrab(struct block_device *bdev);
 void bdput(struct block_device *);
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index de2ee5ffeefe45..769dc22f574797 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -19,12 +19,6 @@
 #include <linux/blk_types.h>
 #include <asm/local.h>
 
-#define dev_to_part(device)	container_of((device), struct hd_struct, __dev)
-#define part_to_dev(part)	(&((part)->__dev))
-
-#define dev_to_disk(device)	(dev_to_part(device)->bdev->bd_disk)
-#define disk_to_dev(disk)	(part_to_dev((disk)->part0->bd_part))
-
 extern const struct device_type disk_type;
 extern struct device_type part_type;
 extern struct class block_class;
@@ -51,11 +45,6 @@ struct partition_meta_info {
 	u8 volname[PARTITION_META_INFO_VOLNAMELTH];
 };
 
-struct hd_struct {
-	struct block_device *bdev;
-	struct device __dev;
-};
-
 /**
  * DOC: genhd capability flags
  *
@@ -191,19 +180,21 @@ struct gendisk {
 	struct lockdep_map lockdep_map;
 };
 
+/*
+ * The gendisk is refcounted by the part0 block_device, and the bd_device
+ * therein is also used for device model presentation in sysfs.
+ */
+#define dev_to_disk(device) \
+	(dev_to_bdev(device)->bd_disk)
+#define disk_to_dev(disk) \
+	(&((disk)->part0->bd_device))
+
 #if IS_REACHABLE(CONFIG_CDROM)
 #define disk_to_cdi(disk)	((disk)->cdi)
 #else
 #define disk_to_cdi(disk)	NULL
 #endif
 
-static inline struct gendisk *part_to_disk(struct hd_struct *part)
-{
-	if (unlikely(!part))
-		return NULL;
-	return part->bdev->bd_disk;
-}
-
 static inline int disk_max_parts(struct gendisk *disk)
 {
 	if (disk->flags & GENHD_FL_EXT_DEVT)
@@ -222,19 +213,6 @@ static inline dev_t disk_devt(struct gendisk *disk)
 	return MKDEV(disk->major, disk->first_minor);
 }
 
-static inline dev_t part_devt(struct hd_struct *part)
-{
-	return part_to_dev(part)->devt;
-}
-
-extern struct hd_struct *disk_get_part(struct gendisk *disk, int partno);
-
-static inline void disk_put_part(struct hd_struct *part)
-{
-	if (likely(part))
-		put_device(part_to_dev(part));
-}
-
 /*
  * Smarter partition iterator without context limits.
  */
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 86bef93e72ebd6..a78e44ee6adb8d 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -76,11 +76,11 @@ struct uuidcmp {
  */
 static int match_dev_by_uuid(struct device *dev, const void *data)
 {
+	struct block_device *bdev = dev_to_bdev(dev);
 	const struct uuidcmp *cmp = data;
-	struct hd_struct *part = dev_to_part(dev);
 
-	if (!part->bdev->bd_meta_info ||
-	    strncasecmp(cmp->uuid, part->bdev->bd_meta_info->uuid, cmp->len))
+	if (!bdev->bd_meta_info ||
+	    strncasecmp(cmp->uuid, bdev->bd_meta_info->uuid, cmp->len))
 		return 0;
 	return 1;
 }
@@ -133,13 +133,13 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 		 * Attempt to find the requested partition by adding an offset
 		 * to the partition number found by UUID.
 		 */
-		struct hd_struct *part;
+		struct block_device *part;
 
-		part = disk_get_part(dev_to_disk(dev),
-				     dev_to_part(dev)->bdev->bd_partno + offset);
+		part = bdget_disk(dev_to_disk(dev),
+				  dev_to_bdev(dev)->bd_partno + offset);
 		if (part) {
-			devt = part_devt(part);
-			put_device(part_to_dev(part));
+			devt = part->bd_dev;
+			bdput(part);
 		}
 	} else {
 		devt = dev->devt;
@@ -166,11 +166,10 @@ static dev_t devt_from_partuuid(const char *uuid_str)
  */
 static int match_dev_by_label(struct device *dev, const void *data)
 {
+	struct block_device *bdev = dev_to_bdev(dev);
 	const char *label = data;
-	struct hd_struct *part = dev_to_part(dev);
 
-	if (!part->bdev->bd_meta_info ||
-	    strcmp(label, part->bdev->bd_meta_info->volname))
+	if (!bdev->bd_meta_info || strcmp(label, bdev->bd_meta_info->volname))
 		return 0;
 	return 1;
 }
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 8a723a91ec5a06..a482a37848bff7 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -1810,30 +1810,15 @@ static ssize_t blk_trace_mask2str(char *buf, int mask)
 	return p - buf;
 }
 
-static struct request_queue *blk_trace_get_queue(struct block_device *bdev)
-{
-	if (bdev->bd_disk == NULL)
-		return NULL;
-
-	return bdev_get_queue(bdev);
-}
-
 static ssize_t sysfs_blk_trace_attr_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
 {
-	struct block_device *bdev = bdget_part(dev_to_part(dev));
-	struct request_queue *q;
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct request_queue *q = bdev_get_queue(bdev);
 	struct blk_trace *bt;
 	ssize_t ret = -ENXIO;
 
-	if (bdev == NULL)
-		goto out;
-
-	q = blk_trace_get_queue(bdev);
-	if (q == NULL)
-		goto out_bdput;
-
 	mutex_lock(&q->debugfs_mutex);
 
 	bt = rcu_dereference_protected(q->blk_trace,
@@ -1856,9 +1841,6 @@ static ssize_t sysfs_blk_trace_attr_show(struct device *dev,
 
 out_unlock_bdev:
 	mutex_unlock(&q->debugfs_mutex);
-out_bdput:
-	bdput(bdev);
-out:
 	return ret;
 }
 
@@ -1866,8 +1848,8 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 					  struct device_attribute *attr,
 					  const char *buf, size_t count)
 {
-	struct block_device *bdev;
-	struct request_queue *q;
+	struct block_device *bdev = dev_to_bdev(dev);
+	struct request_queue *q = bdev_get_queue(bdev);
 	struct blk_trace *bt;
 	u64 value;
 	ssize_t ret = -EINVAL;
@@ -1883,17 +1865,10 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 				goto out;
 			value = ret;
 		}
-	} else if (kstrtoull(buf, 0, &value))
-		goto out;
-
-	ret = -ENXIO;
-	bdev = bdget_part(dev_to_part(dev));
-	if (bdev == NULL)
-		goto out;
-
-	q = blk_trace_get_queue(bdev);
-	if (q == NULL)
-		goto out_bdput;
+	} else {
+		if (kstrtoull(buf, 0, &value))
+			goto out;
+	}
 
 	mutex_lock(&q->debugfs_mutex);
 
@@ -1931,8 +1906,6 @@ static ssize_t sysfs_blk_trace_attr_store(struct device *dev,
 
 out_unlock_bdev:
 	mutex_unlock(&q->debugfs_mutex);
-out_bdput:
-	bdput(bdev);
 out:
 	return ret ? ret : count;
 }
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

