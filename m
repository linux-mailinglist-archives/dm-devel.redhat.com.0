Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 00D64307C2A
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 18:23:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351--HWQWk8CPdGdAeqsbCqI2A-1; Thu, 28 Jan 2021 12:23:53 -0500
X-MC-Unique: -HWQWk8CPdGdAeqsbCqI2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBF3180A5C3;
	Thu, 28 Jan 2021 17:23:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F0E60875;
	Thu, 28 Jan 2021 17:23:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB1644E58E;
	Thu, 28 Jan 2021 17:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SHNQjI014666 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 12:23:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 081412166B2C; Thu, 28 Jan 2021 17:23:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 020652166B2E
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F086C811E84
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:22 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-348-Jyht8CD7ON205SfW9Y0M-w-1;
	Thu, 28 Jan 2021 12:23:20 -0500
X-MC-Unique: Jyht8CD7ON205SfW9Y0M-w-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id 3B03340110;
	Thu, 28 Jan 2021 12:13:14 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Thu, 28 Jan 2021 18:13:12 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <hare@suse.de>, <ming.lei@redhat.com>, <agk@redhat.com>,
	<snitzer@redhat.com>, <dm-devel@redhat.com>, <linux-block@vger.kernel.org>
Date: Thu, 28 Jan 2021 20:12:35 +0300
Message-ID: <1611853955-32167-3-git-send-email-sergei.shtepa@veeam.com>
In-Reply-To: <1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com>
References: <1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265677D6B
X-Veeam-MMEX: True
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
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH 2/2] [dm] blk_interposer for dm-linear
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement a block interposer for device-mapper to attach
to an existing block layer stack. Using the interposer,
we can connect the dm-linear to a device with a mounted
file system.

changes:
  * the new dm_interposer structure contains blk_interposer
    to intercept bio from the interposed disk and interval tree
    of block devices on this disk.
  * the new interval tree for device mapper.
  * the dm_submit_bio_interposer_fn() function implements
    the bio interception logic.
  * the functions dm_interposer_attach_dev() &
    dm_interposer_detach_dev() allow to attach and detach devices
    to dm_interposer.
  * the new parameter 'noexcl' allows to create dm-linear to device
    with an already mounted file system.
  * the non_exclusive parameter in dm_target structure - it`s a sign
    that target device should be opened without FMODE_EXCL mode.
  * the new ioctl IOCTL_DEV_REMAP allow to attach dm device to
    a regular block device.
Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 drivers/md/dm-core.h          |  46 +++-
 drivers/md/dm-ioctl.c         |  39 ++++
 drivers/md/dm-linear.c        |  17 +-
 drivers/md/dm-table.c         |  12 +-
 drivers/md/dm.c               | 383 ++++++++++++++++++++++++++++++++--
 drivers/md/dm.h               |   2 +-
 include/linux/device-mapper.h |   7 +
 include/uapi/linux/dm-ioctl.h |  15 +-
 8 files changed, 493 insertions(+), 28 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 086d293c2b03..0f870b1d4be4 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -13,7 +13,7 @@
 #include <linux/ktime.h>
 #include <linux/genhd.h>
 #include <linux/blk-mq.h>
-
+#include <linux/rbtree.h>
 #include <trace/events/block.h>
 
 #include "dm.h"
@@ -109,6 +109,9 @@ struct mapped_device {
 	bool init_tio_pdu:1;
 
 	struct srcu_struct io_barrier;
+
+	/* interposer device for remap */
+	struct dm_interposed_dev *ip_dev;
 };
 
 void disable_discard(struct mapped_device *md);
@@ -164,6 +167,47 @@ struct dm_table {
 	struct dm_md_mempools *mempools;
 };
 
+/*
+ * Interval tree for device mapper
+ */
+struct dm_rb_range {
+	struct rb_node node;
+	sector_t start;		/* start sector of rb node */
+	sector_t last;		/* end sector of rb node */
+	sector_t _subtree_last; /* highest sector in subtree of rb node */
+};
+
+void dm_rb_insert(struct dm_rb_range *node, struct rb_root_cached *root);
+void dm_rb_remove(struct dm_rb_range *node, struct rb_root_cached *root);
+
+struct dm_rb_range *dm_rb_iter_first(struct rb_root_cached *root, sector_t start, sector_t last);
+struct dm_rb_range *dm_rb_iter_next(struct dm_rb_range *node, sector_t start, sector_t last);
+
+/*
+ * For connecting blk_interposer and dm-targets devices.
+ */
+typedef void (*dm_interpose_bio_t) (void *context, struct dm_rb_range *node,  struct bio *bio);
+
+struct dm_interposed_dev {
+	struct gendisk *disk;
+	struct dm_rb_range node;
+	void *context;
+	dm_interpose_bio_t dm_interpose_bio;
+
+	atomic64_t ip_cnt; /*for debug purpose*/
+};
+
+struct dm_interposed_dev *dm_interposer_new_dev(struct gendisk *disk,
+						sector_t ofs, sector_t len,
+						void *context,
+						dm_interpose_bio_t dm_interpose_bio_t);
+void dm_interposer_free_dev(struct dm_interposed_dev *ip_dev);
+int dm_interposer_attach_dev(struct dm_interposed_dev *ip_dev);
+int dm_interposer_detach_dev(struct dm_interposed_dev *ip_dev);
+
+int dm_remap_install(struct mapped_device *md, const char *donor_device_name);
+int dm_remap_uninstall(struct mapped_device *md);
+
 static inline struct completion *dm_get_completion_from_kobject(struct kobject *kobj)
 {
 	return &container_of(kobj, struct dm_kobject_holder, kobj)->completion;
diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 5e306bba4375..2944d442c256 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1649,6 +1649,44 @@ static int target_message(struct file *filp, struct dm_ioctl *param, size_t para
 	return r;
 }
 
+static inline int dev_remap_start(struct mapped_device *md, uint8_t *params)
+{
+	char *donor_device_name = (char *)params;
+
+	return dm_remap_install(md, donor_device_name);
+}
+static int dev_remap_finish(struct mapped_device *md)
+{
+	return dm_remap_uninstall(md);
+}
+
+static int dev_remap(struct file *filp, struct dm_ioctl *param, size_t param_size)
+{
+	int ret = 0;
+	struct mapped_device *md;
+	void *bin_data;
+	struct dm_remap_param *remap_param;
+
+	md = find_device(param);
+	if (!md)
+		return -ENXIO;
+
+	bin_data = (void *)(param) + param->data_start;
+	remap_param = bin_data;
+
+	if (remap_param->cmd == REMAP_START_CMD)
+		ret = dev_remap_start(md, remap_param->params);
+	else if (remap_param->cmd == REMAP_FINISH_CMD)
+		ret = dev_remap_finish(md);
+	else {
+		DMWARN("Invalid remap command, %d", remap_param->cmd);
+		ret = -EINVAL;
+	}
+
+	dm_put(md);
+	return ret;
+}
+
 /*
  * The ioctl parameter block consists of two parts, a dm_ioctl struct
  * followed by a data buffer.  This flag is set if the second part,
@@ -1691,6 +1729,7 @@ static ioctl_fn lookup_ioctl(unsigned int cmd, int *ioctl_flags)
 		{DM_DEV_SET_GEOMETRY_CMD, 0, dev_set_geometry},
 		{DM_DEV_ARM_POLL, IOCTL_FLAGS_NO_PARAMS, dev_arm_poll},
 		{DM_GET_TARGET_VERSION, 0, get_target_version},
+		{DM_DEV_REMAP_CMD, 0, dev_remap},
 	};
 
 	if (unlikely(cmd >= ARRAY_SIZE(_ioctls)))
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 00774b5d7668..ffb8b5ca4d10 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -28,12 +28,13 @@ struct linear_c {
  */
 static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
+	fmode_t mode;
 	struct linear_c *lc;
 	unsigned long long tmp;
 	char dummy;
 	int ret;
 
-	if (argc != 2) {
+	if ((argc < 2) || (argc > 3)) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -51,7 +52,19 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 	lc->start = tmp;
 
-	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &lc->dev);
+	ti->non_exclusive = false;
+	if (argc > 2) {
+		if (strcmp("noexcl", argv[2]) == 0)
+			ti->non_exclusive = true;
+		else if (strcmp("excl", argv[2]) == 0)
+			ti->non_exclusive = false;
+		else {
+			ti->error = "Invalid exclusive option";
+			return -EINVAL;
+		}
+	}
+
+	ret = dm_get_device(ti, argv[0], mode, &lc->dev);
 	if (ret) {
 		ti->error = "Device lookup failed";
 		goto bad;
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 4acf2342f7ad..f15bc2171f25 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -322,7 +322,7 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
  * device and not to touch the existing bdev field in case
  * it is accessed concurrently.
  */
-static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
+static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode, bool non_exclusive,
 			struct mapped_device *md)
 {
 	int r;
@@ -330,7 +330,7 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 
 	old_dev = dd->dm_dev;
 
-	r = dm_get_table_device(md, dd->dm_dev->bdev->bd_dev,
+	r = dm_get_table_device(md, dd->dm_dev->bdev->bd_dev, non_exclusive,
 				dd->dm_dev->mode | new_mode, &new_dev);
 	if (r)
 		return r;
@@ -387,7 +387,8 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 		if (!dd)
 			return -ENOMEM;
 
-		if ((r = dm_get_table_device(t->md, dev, mode, &dd->dm_dev))) {
+		r = dm_get_table_device(t->md, dev, mode, ti->non_exclusive, &dd->dm_dev);
+		if (r) {
 			kfree(dd);
 			return r;
 		}
@@ -396,8 +397,9 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 		list_add(&dd->list, &t->devices);
 		goto out;
 
-	} else if (dd->dm_dev->mode != (mode | dd->dm_dev->mode)) {
-		r = upgrade_mode(dd, mode, t->md);
+	} else if ((dd->dm_dev->mode != (mode | dd->dm_dev->mode)) &&
+		   (dd->dm_dev->non_exclusive != ti->non_exclusive)) {
+		r = upgrade_mode(dd, mode, ti->non_exclusive, t->md);
 		if (r)
 			return r;
 	}
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 7bac564f3faa..3b871d98b7b6 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -28,6 +28,7 @@
 #include <linux/refcount.h>
 #include <linux/part_stat.h>
 #include <linux/blk-crypto.h>
+#include <linux/interval_tree_generic.h>
 
 #define DM_MSG_PREFIX "core"
 
@@ -56,6 +57,8 @@ static struct workqueue_struct *deferred_remove_workqueue;
 atomic_t dm_global_event_nr = ATOMIC_INIT(0);
 DECLARE_WAIT_QUEUE_HEAD(dm_global_eventq);
 
+static DEFINE_MUTEX(interposer_mutex); /* synchronizing access to blk_interposer */
+
 void dm_issue_global_event(void)
 {
 	atomic_inc(&dm_global_event_nr);
@@ -162,6 +165,26 @@ struct table_device {
 	struct dm_dev dm_dev;
 };
 
+/*
+ * Device mapper`s interposer.
+ */
+struct dm_interposer {
+	struct blk_interposer blk_ip;
+	struct mapped_device *md;
+
+	struct kref kref;
+	struct rw_semaphore ip_devs_lock;
+	struct rb_root_cached ip_devs_root; /* dm_interposed_dev tree */
+};
+
+/*
+ * Interval tree for device mapper
+ */
+#define START(node) ((node)->start)
+#define LAST(node) ((node)->last)
+INTERVAL_TREE_DEFINE(struct dm_rb_range, node, sector_t, _subtree_last,
+		     START, LAST,, dm_rb);
+
 /*
  * Bio-based DM's mempools' reserved IOs set by the user.
  */
@@ -733,28 +756,340 @@ static void dm_put_live_table_fast(struct mapped_device *md) __releases(RCU)
 	rcu_read_unlock();
 }
 
+static void dm_submit_bio_interposer_fn(struct bio *bio)
+{
+	struct dm_interposer *ip;
+	unsigned int noio_flag = 0;
+	sector_t start;
+	sector_t last;
+	struct dm_rb_range *node;
+
+	ip = container_of(bio->bi_disk->interposer, struct dm_interposer, blk_ip);
+	start = bio->bi_iter.bi_sector;
+	last = start + dm_sector_div_up(bio->bi_iter.bi_size, SECTOR_SIZE);
+
+	noio_flag = memalloc_noio_save();
+	down_read(&ip->ip_devs_lock);
+	node = dm_rb_iter_first(&ip->ip_devs_root, start, last);
+	while (node) {
+		struct dm_interposed_dev *ip_dev =
+			container_of(node, struct dm_interposed_dev, node);
+
+		atomic64_inc(&ip_dev->ip_cnt);
+		ip_dev->dm_interpose_bio(ip_dev->context, node, bio);
+
+		node = dm_rb_iter_next(node, start, last);
+	}
+	up_read(&ip->ip_devs_lock);
+	memalloc_noio_restore(noio_flag);
+}
+
+static void free_interposer(struct kref *kref)
+{
+	struct dm_interposer *ip = container_of(kref, struct dm_interposer, kref);
+
+	blk_interposer_detach(&ip->blk_ip, dm_submit_bio_interposer_fn);
+
+	kfree(ip);
+}
+
+static struct dm_interposer *new_interposer(struct gendisk *disk)
+{
+	int ret = 0;
+	struct dm_interposer *ip;
+
+	ip = kzalloc(sizeof(struct dm_interposer), GFP_NOIO);
+	if (!ip)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&ip->kref);
+	init_rwsem(&ip->ip_devs_lock);
+	ip->ip_devs_root = RB_ROOT_CACHED;
+
+	ret = blk_interposer_attach(disk, &ip->blk_ip, dm_submit_bio_interposer_fn);
+	if (ret) {
+		DMERR("Failed to attack blk_interposer");
+		kref_put(&ip->kref, free_interposer);
+		return ERR_PTR(ret);
+	}
+
+	return ip;
+}
+
+static struct dm_interposer *get_interposer(struct gendisk *disk)
+{
+	struct dm_interposer *ip;
+
+	if (!blk_has_interposer(disk))
+		return NULL;
+
+	if (disk->interposer->ip_submit_bio != dm_submit_bio_interposer_fn) {
+		DMERR("Disks interposer slot already occupied.");
+		return ERR_PTR(-EBUSY);
+	}
+
+	ip = container_of(disk->interposer, struct dm_interposer, blk_ip);
+
+	kref_get(&ip->kref);
+	return ip;
+}
+
+struct dm_interposed_dev *dm_interposer_new_dev(struct gendisk *disk, sector_t ofs, sector_t len,
+						void *context, dm_interpose_bio_t dm_interpose_bio)
+{
+	sector_t start = ofs;
+	sector_t last =  ofs + len - 1;
+	struct dm_interposed_dev *ip_dev = NULL;
+
+	/* Allocate new ip_dev */
+	ip_dev = kzalloc(sizeof(struct dm_interposed_dev), GFP_KERNEL);
+	if (!ip_dev)
+		return NULL;
+
+	ip_dev->disk = disk;
+	ip_dev->node.start = start;
+	ip_dev->node.last = last;
+
+	ip_dev->context = context;
+	ip_dev->dm_interpose_bio = dm_interpose_bio;
+
+	atomic64_set(&ip_dev->ip_cnt, 0);
+
+	return ip_dev;
+}
+
+void dm_interposer_free_dev(struct dm_interposed_dev *ip_dev)
+{
+	kfree(ip_dev);
+}
+
+static inline void dm_disk_freeze(struct gendisk *disk)
+{
+	blk_mq_freeze_queue(disk->queue);
+	blk_mq_quiesce_queue(disk->queue);
+}
+
+static inline void dm_disk_unfreeze(struct gendisk *disk)
+{
+	blk_mq_unquiesce_queue(disk->queue);
+	blk_mq_unfreeze_queue(disk->queue);
+}
+
+int dm_interposer_attach_dev(struct dm_interposed_dev *ip_dev)
+{
+	int ret = 0;
+	struct dm_interposer *ip = NULL;
+	unsigned int noio_flag = 0;
+
+	if (!ip_dev)
+		return -EINVAL;
+
+	dm_disk_freeze(ip_dev->disk);
+	mutex_lock(&interposer_mutex);
+	noio_flag = memalloc_noio_save();
+
+	ip = get_interposer(ip_dev->disk);
+	if (ip == NULL)
+		ip = new_interposer(ip_dev->disk);
+	if (IS_ERR(ip)) {
+		ret = PTR_ERR(ip);
+		goto out;
+	}
+
+	/* Attach dm_interposed_dev to dm_interposer */
+	down_write(&ip->ip_devs_lock);
+	do {
+		struct dm_rb_range *node;
+
+		/* checking that ip_dev already exists for this region */
+		node = dm_rb_iter_first(&ip->ip_devs_root, ip_dev->node.start, ip_dev->node.last);
+		if (node) {
+			DMERR("Disk part form [%llu] to [%llu] already have interposer",
+			      node->start, node->last);
+
+			ret = -EBUSY;
+			break;
+		}
+
+		/* insert ip_dev to ip tree */
+		dm_rb_insert(&ip_dev->node, &ip->ip_devs_root);
+		/* increment ip reference counter */
+		kref_get(&ip->kref);
+	} while (false);
+	up_write(&ip->ip_devs_lock);
+
+	kref_put(&ip->kref, free_interposer);
+
+out:
+	memalloc_noio_restore(noio_flag);
+	mutex_unlock(&interposer_mutex);
+	dm_disk_unfreeze(ip_dev->disk);
+
+	return ret;
+}
+
+int dm_interposer_detach_dev(struct dm_interposed_dev *ip_dev)
+{
+	int ret = 0;
+	struct dm_interposer *ip = NULL;
+	unsigned int noio_flag = 0;
+
+	if (!ip_dev)
+		return -EINVAL;
+
+	dm_disk_freeze(ip_dev->disk);
+	mutex_lock(&interposer_mutex);
+	noio_flag = memalloc_noio_save();
+
+	ip = get_interposer(ip_dev->disk);
+	if (IS_ERR(ip)) {
+		ret = PTR_ERR(ip);
+		DMERR("Interposer not found");
+		goto out;
+	}
+	if (unlikely(ip == NULL)) {
+		ret = -ENXIO;
+		DMERR("Interposer not found");
+		goto out;
+	}
+
+	down_write(&ip->ip_devs_lock);
+	do {
+		dm_rb_remove(&ip_dev->node, &ip->ip_devs_root);
+		/* the reference counter here cannot be zero */
+		kref_put(&ip->kref, free_interposer);
+
+	} while (false);
+	up_write(&ip->ip_devs_lock);
+
+	/* detach and free interposer if it`s not needed */
+	kref_put(&ip->kref, free_interposer);
+out:
+	memalloc_noio_restore(noio_flag);
+	mutex_unlock(&interposer_mutex);
+	dm_disk_unfreeze(ip_dev->disk);
+
+	return ret;
+}
+
+static void dm_remap_fn(void *context, struct dm_rb_range *node, struct bio *bio)
+{
+	struct mapped_device *md = context;
+
+	/* Set acceptor device. */
+	bio->bi_disk = md->disk;
+
+	/* Remap disks offset */
+	bio->bi_iter.bi_sector -= node->start;
+
+	/*
+	 * bio should be resubmitted.
+	 * We can just add bio to bio_list of the current process.
+	 * current->bio_list must be initialized when this function is called.
+	 * If call submit_bio_noacct(), the bio will be checked twice.
+	 */
+	BUG_ON(!current->bio_list);
+	bio_list_add(&current->bio_list[0], bio);
+}
+
+int dm_remap_install(struct mapped_device *md, const char *donor_device_name)
+{
+	int ret = 0;
+	struct block_device *donor_bdev;
+	fmode_t mode = FMODE_READ | FMODE_WRITE;
+
+	DMDEBUG("Dm remap install for mapped device %s and donor device %s",
+		md->name, donor_device_name);
+
+	donor_bdev = blkdev_get_by_path(donor_device_name, mode, "device-mapper remap");
+	if (IS_ERR(donor_bdev)) {
+		DMERR("Cannot open device [%s]", donor_device_name);
+		return PTR_ERR(donor_bdev);
+	}
+
+	do {
+		sector_t ofs = get_start_sect(donor_bdev);
+		sector_t len = bdev_nr_sectors(donor_bdev);
+
+		md->ip_dev = dm_interposer_new_dev(donor_bdev->bd_disk, ofs, len, md, dm_remap_fn);
+		if (!md->ip_dev) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		DMDEBUG("New interposed device 0x%p", md->ip_dev);
+		ret = dm_interposer_attach_dev(md->ip_dev);
+		if (ret) {
+			dm_interposer_free_dev(md->ip_dev);
+
+			md->ip_dev = NULL;
+			DMERR("Failed to attach dm interposer");
+			break;
+		}
+
+		DMDEBUG("Attached successfully.");
+	} while (false);
+
+	blkdev_put(donor_bdev, mode);
+
+	return ret;
+}
+
+int dm_remap_uninstall(struct mapped_device *md)
+{
+	int ret = 0;
+
+	DMDEBUG("Dm remap uninstall for mapped device %s ip_dev=0x%p", md->name, md->ip_dev);
+
+	if (!md->ip_dev) {
+		DMERR("Cannot detach dm interposer");
+		return -EINVAL;
+	}
+
+	ret = dm_interposer_detach_dev(md->ip_dev);
+	if (ret) {
+		DMERR("Failed to detach dm interposer");
+		return ret;
+	}
+
+	DMDEBUG("Detached successfully. %llu bios was interposed",
+		atomic64_read(&md->ip_dev->ip_cnt));
+	dm_interposer_free_dev(md->ip_dev);
+	md->ip_dev = NULL;
+
+	return 0;
+}
+
 static char *_dm_claim_ptr = "I belong to device-mapper";
 
 /*
  * Open a table device so we can use it as a map destination.
  */
 static int open_table_device(struct table_device *td, dev_t dev,
-			     struct mapped_device *md)
+			     struct mapped_device *md, bool non_exclusive)
 {
 	struct block_device *bdev;
-
-	int r;
+	int ret;
 
 	BUG_ON(td->dm_dev.bdev);
 
-	bdev = blkdev_get_by_dev(dev, td->dm_dev.mode | FMODE_EXCL, _dm_claim_ptr);
-	if (IS_ERR(bdev))
-		return PTR_ERR(bdev);
+	if (non_exclusive)
+		bdev = blkdev_get_by_dev(dev, td->dm_dev.mode, NULL);
+	else
+		bdev = blkdev_get_by_dev(dev, td->dm_dev.mode | FMODE_EXCL, _dm_claim_ptr);
 
-	r = bd_link_disk_holder(bdev, dm_disk(md));
-	if (r) {
-		blkdev_put(bdev, td->dm_dev.mode | FMODE_EXCL);
-		return r;
+	if (IS_ERR(bdev)) {
+		ret = PTR_ERR(bdev);
+		if (ret != -EBUSY)
+			return ret;
+	}
+
+	if (!non_exclusive) {
+		ret = bd_link_disk_holder(bdev, dm_disk(md));
+		if (ret) {
+			blkdev_put(bdev, td->dm_dev.mode);
+			return ret;
+		}
 	}
 
 	td->dm_dev.bdev = bdev;
@@ -770,33 +1105,38 @@ static void close_table_device(struct table_device *td, struct mapped_device *md
 	if (!td->dm_dev.bdev)
 		return;
 
-	bd_unlink_disk_holder(td->dm_dev.bdev, dm_disk(md));
-	blkdev_put(td->dm_dev.bdev, td->dm_dev.mode | FMODE_EXCL);
+	if (td->dm_dev.mode & FMODE_EXCL)
+		bd_unlink_disk_holder(td->dm_dev.bdev, dm_disk(md));
+
+	blkdev_put(td->dm_dev.bdev, td->dm_dev.mode);
+
 	put_dax(td->dm_dev.dax_dev);
 	td->dm_dev.bdev = NULL;
 	td->dm_dev.dax_dev = NULL;
 }
 
 static struct table_device *find_table_device(struct list_head *l, dev_t dev,
-					      fmode_t mode)
+					      fmode_t mode, bool non_exclusive)
 {
 	struct table_device *td;
 
 	list_for_each_entry(td, l, list)
-		if (td->dm_dev.bdev->bd_dev == dev && td->dm_dev.mode == mode)
+		if (td->dm_dev.bdev->bd_dev == dev &&
+		    td->dm_dev.mode == mode &&
+		    td->dm_dev.non_exclusive == non_exclusive)
 			return td;
 
 	return NULL;
 }
 
-int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode,
+int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode, bool non_exclusive,
 			struct dm_dev **result)
 {
 	int r;
 	struct table_device *td;
 
 	mutex_lock(&md->table_devices_lock);
-	td = find_table_device(&md->table_devices, dev, mode);
+	td = find_table_device(&md->table_devices, dev, mode, non_exclusive);
 	if (!td) {
 		td = kmalloc_node(sizeof(*td), GFP_KERNEL, md->numa_node_id);
 		if (!td) {
@@ -807,7 +1147,8 @@ int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode,
 		td->dm_dev.mode = mode;
 		td->dm_dev.bdev = NULL;
 
-		if ((r = open_table_device(td, dev, md))) {
+		r = open_table_device(td, dev, md, non_exclusive);
+		if (r) {
 			mutex_unlock(&md->table_devices_lock);
 			kfree(td);
 			return r;
@@ -2182,6 +2523,14 @@ static void __dm_destroy(struct mapped_device *md, bool wait)
 
 	might_sleep();
 
+	if (md->ip_dev) {
+		if (dm_interposer_detach_dev(md->ip_dev))
+			DMERR("Failed to detach dm interposer");
+
+		dm_interposer_free_dev(md->ip_dev);
+		md->ip_dev = NULL;
+	}
+
 	spin_lock(&_minor_lock);
 	idr_replace(&_minor_idr, MINOR_ALLOCED, MINOR(disk_devt(dm_disk(md))));
 	set_bit(DMF_FREEING, &md->flags);
diff --git a/drivers/md/dm.h b/drivers/md/dm.h
index fffe1e289c53..7bf20fb2de74 100644
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
@@ -179,7 +179,7 @@ int dm_open_count(struct mapped_device *md);
 int dm_lock_for_deletion(struct mapped_device *md, bool mark_deferred, bool only_deferred);
 int dm_cancel_deferred_remove(struct mapped_device *md);
 int dm_request_based(struct mapped_device *md);
-int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode,
+int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode, bool non_exclusive,
 			struct dm_dev **result);
 void dm_put_table_device(struct mapped_device *md, struct dm_dev *d);
 
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 61a66fb8ebb3..70002363bfc0 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -150,6 +150,7 @@ struct dm_dev {
 	struct block_device *bdev;
 	struct dax_device *dax_dev;
 	fmode_t mode;
+	bool non_exclusive;
 	char name[16];
 };
 
@@ -325,6 +326,12 @@ struct dm_target {
 	 * whether or not its underlying devices have support.
 	 */
 	bool discards_supported:1;
+
+	/*
+	 * Set if this target needs to open device without FMODE_EXCL
+	 * mode.
+	 */
+	bool non_exclusive:1;
 };
 
 void *dm_per_bio_data(struct bio *bio, size_t data_size);
diff --git a/include/uapi/linux/dm-ioctl.h b/include/uapi/linux/dm-ioctl.h
index 4933b6b67b85..08d7dbff80f4 100644
--- a/include/uapi/linux/dm-ioctl.h
+++ b/include/uapi/linux/dm-ioctl.h
@@ -214,6 +214,15 @@ struct dm_target_msg {
 	char message[0];
 };
 
+enum {
+	REMAP_START_CMD = 1,
+	REMAP_FINISH_CMD,
+};
+
+struct dm_remap_param {
+	uint8_t cmd;
+	uint8_t params[0];
+};
 /*
  * If you change this make sure you make the corresponding change
  * to dm-ioctl.c:lookup_ioctl()
@@ -244,6 +253,7 @@ enum {
 	DM_DEV_SET_GEOMETRY_CMD,
 	DM_DEV_ARM_POLL_CMD,
 	DM_GET_TARGET_VERSION_CMD,
+	DM_DEV_REMAP_CMD
 };
 
 #define DM_IOCTL 0xfd
@@ -259,6 +269,7 @@ enum {
 #define DM_DEV_STATUS    _IOWR(DM_IOCTL, DM_DEV_STATUS_CMD, struct dm_ioctl)
 #define DM_DEV_WAIT      _IOWR(DM_IOCTL, DM_DEV_WAIT_CMD, struct dm_ioctl)
 #define DM_DEV_ARM_POLL  _IOWR(DM_IOCTL, DM_DEV_ARM_POLL_CMD, struct dm_ioctl)
+#define DM_DEV_REMAP     _IOWR(DM_IOCTL, DM_DEV_REMAP_CMD, struct dm_ioctl)
 
 #define DM_TABLE_LOAD    _IOWR(DM_IOCTL, DM_TABLE_LOAD_CMD, struct dm_ioctl)
 #define DM_TABLE_CLEAR   _IOWR(DM_IOCTL, DM_TABLE_CLEAR_CMD, struct dm_ioctl)
@@ -272,9 +283,9 @@ enum {
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
 
 #define DM_VERSION_MAJOR	4
-#define DM_VERSION_MINOR	43
+#define DM_VERSION_MINOR	44
 #define DM_VERSION_PATCHLEVEL	0
-#define DM_VERSION_EXTRA	"-ioctl (2020-10-01)"
+#define DM_VERSION_EXTRA	"-ioctl (2020-12-25)"
 
 /* Status bits */
 #define DM_READONLY_FLAG	(1 << 0) /* In/Out */
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

