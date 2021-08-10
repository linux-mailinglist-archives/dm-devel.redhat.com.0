Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0CD83DFE58
	for <lists+dm-devel@lfdr.de>; Wed,  4 Aug 2021 11:47:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-bX2eZUiUMBuKK8YOlG7jWw-1; Wed, 04 Aug 2021 05:47:49 -0400
X-MC-Unique: bX2eZUiUMBuKK8YOlG7jWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25FE561191;
	Wed,  4 Aug 2021 09:47:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04724226E9;
	Wed,  4 Aug 2021 09:47:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83BFE181A3E9;
	Wed,  4 Aug 2021 09:47:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1749lNLj006335 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 05:47:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B70332077FD3; Wed,  4 Aug 2021 09:47:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B25692077FCB
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:47:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40E00101A529
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:47:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-583-Rj9yLhn-MHSu0vNqgesruQ-1; Wed, 04 Aug 2021 05:47:17 -0400
X-MC-Unique: Rj9yLhn-MHSu0vNqgesruQ-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBDPs-005dxi-Ni; Wed, 04 Aug 2021 09:42:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  4 Aug 2021 11:41:40 +0200
Message-Id: <20210804094147.459763-2-hch@lst.de>
In-Reply-To: <20210804094147.459763-1-hch@lst.de>
References: <20210804094147.459763-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/8] block: make the block holder code optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the block holder code into a separate file as it is not in any way
related to the other block_dev.c code, and add a new selectable config
option for it so that we don't have to build it without any remapped
drivers selected.

The Kconfig symbol contains a _DEPRECATED suffix to match the comments
added in commit 49731baa41df
("block: restore multiple bd_link_disk_holder() support").

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Mike Snitzer <snitzer@redhat.com>
---
 block/Kconfig             |   4 ++
 block/Makefile            |   1 +
 block/holder.c            | 139 ++++++++++++++++++++++++++++++++++++
 drivers/md/Kconfig        |   2 +
 drivers/md/bcache/Kconfig |   1 +
 fs/block_dev.c            | 144 +-------------------------------------
 include/linux/blk_types.h |   2 +-
 include/linux/genhd.h     |   4 +-
 8 files changed, 151 insertions(+), 146 deletions(-)
 create mode 100644 block/holder.c

diff --git a/block/Kconfig b/block/Kconfig
index 15dfb7660645..bac87d773c54 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -241,4 +241,8 @@ config BLK_MQ_RDMA
 config BLK_PM
 	def_bool BLOCK && PM
 
+# do not use in new code
+config BLOCK_HOLDER_DEPRECATED
+	bool
+
 source "block/Kconfig.iosched"
diff --git a/block/Makefile b/block/Makefile
index c72592b4cf31..0d951adce796 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
+obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
diff --git a/block/holder.c b/block/holder.c
new file mode 100644
index 000000000000..904a1dcd5c12
--- /dev/null
+++ b/block/holder.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/genhd.h>
+
+struct bd_holder_disk {
+	struct list_head	list;
+	struct gendisk		*disk;
+	int			refcnt;
+};
+
+static struct bd_holder_disk *bd_find_holder_disk(struct block_device *bdev,
+						  struct gendisk *disk)
+{
+	struct bd_holder_disk *holder;
+
+	list_for_each_entry(holder, &bdev->bd_holder_disks, list)
+		if (holder->disk == disk)
+			return holder;
+	return NULL;
+}
+
+static int add_symlink(struct kobject *from, struct kobject *to)
+{
+	return sysfs_create_link(from, to, kobject_name(to));
+}
+
+static void del_symlink(struct kobject *from, struct kobject *to)
+{
+	sysfs_remove_link(from, kobject_name(to));
+}
+
+/**
+ * bd_link_disk_holder - create symlinks between holding disk and slave bdev
+ * @bdev: the claimed slave bdev
+ * @disk: the holding disk
+ *
+ * DON'T USE THIS UNLESS YOU'RE ALREADY USING IT.
+ *
+ * This functions creates the following sysfs symlinks.
+ *
+ * - from "slaves" directory of the holder @disk to the claimed @bdev
+ * - from "holders" directory of the @bdev to the holder @disk
+ *
+ * For example, if /dev/dm-0 maps to /dev/sda and disk for dm-0 is
+ * passed to bd_link_disk_holder(), then:
+ *
+ *   /sys/block/dm-0/slaves/sda --> /sys/block/sda
+ *   /sys/block/sda/holders/dm-0 --> /sys/block/dm-0
+ *
+ * The caller must have claimed @bdev before calling this function and
+ * ensure that both @bdev and @disk are valid during the creation and
+ * lifetime of these symlinks.
+ *
+ * CONTEXT:
+ * Might sleep.
+ *
+ * RETURNS:
+ * 0 on success, -errno on failure.
+ */
+int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
+{
+	struct bd_holder_disk *holder;
+	int ret = 0;
+
+	mutex_lock(&bdev->bd_disk->open_mutex);
+
+	WARN_ON_ONCE(!bdev->bd_holder);
+
+	/* FIXME: remove the following once add_disk() handles errors */
+	if (WARN_ON(!disk->slave_dir || !bdev->bd_holder_dir))
+		goto out_unlock;
+
+	holder = bd_find_holder_disk(bdev, disk);
+	if (holder) {
+		holder->refcnt++;
+		goto out_unlock;
+	}
+
+	holder = kzalloc(sizeof(*holder), GFP_KERNEL);
+	if (!holder) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	INIT_LIST_HEAD(&holder->list);
+	holder->disk = disk;
+	holder->refcnt = 1;
+
+	ret = add_symlink(disk->slave_dir, bdev_kobj(bdev));
+	if (ret)
+		goto out_free;
+
+	ret = add_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
+	if (ret)
+		goto out_del;
+	/*
+	 * bdev could be deleted beneath us which would implicitly destroy
+	 * the holder directory.  Hold on to it.
+	 */
+	kobject_get(bdev->bd_holder_dir);
+
+	list_add(&holder->list, &bdev->bd_holder_disks);
+	goto out_unlock;
+
+out_del:
+	del_symlink(disk->slave_dir, bdev_kobj(bdev));
+out_free:
+	kfree(holder);
+out_unlock:
+	mutex_unlock(&bdev->bd_disk->open_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(bd_link_disk_holder);
+
+/**
+ * bd_unlink_disk_holder - destroy symlinks created by bd_link_disk_holder()
+ * @bdev: the calimed slave bdev
+ * @disk: the holding disk
+ *
+ * DON'T USE THIS UNLESS YOU'RE ALREADY USING IT.
+ *
+ * CONTEXT:
+ * Might sleep.
+ */
+void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
+{
+	struct bd_holder_disk *holder;
+
+	mutex_lock(&bdev->bd_disk->open_mutex);
+	holder = bd_find_holder_disk(bdev, disk);
+	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
+		del_symlink(disk->slave_dir, bdev_kobj(bdev));
+		del_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
+		kobject_put(bdev->bd_holder_dir);
+		list_del_init(&holder->list);
+		kfree(holder);
+	}
+	mutex_unlock(&bdev->bd_disk->open_mutex);
+}
+EXPORT_SYMBOL_GPL(bd_unlink_disk_holder);
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 0602e82a9516..f821dae101a9 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -15,6 +15,7 @@ if MD
 
 config BLK_DEV_MD
 	tristate "RAID support"
+	select BLOCK_HOLDER_DEPRECATED if SYSFS
 	help
 	  This driver lets you combine several hard disk partitions into one
 	  logical block device. This can be used to simply append one
@@ -201,6 +202,7 @@ config BLK_DEV_DM_BUILTIN
 
 config BLK_DEV_DM
 	tristate "Device mapper support"
+	select BLOCK_HOLDER_DEPRECATED if SYSFS
 	select BLK_DEV_DM_BUILTIN
 	depends on DAX || DAX=n
 	help
diff --git a/drivers/md/bcache/Kconfig b/drivers/md/bcache/Kconfig
index d1ca4d059c20..cf3e8096942a 100644
--- a/drivers/md/bcache/Kconfig
+++ b/drivers/md/bcache/Kconfig
@@ -2,6 +2,7 @@
 
 config BCACHE
 	tristate "Block device as cache"
+	select BLOCK_HOLDER_DEPRECATED if SYSFS
 	select CRC64
 	help
 	Allows a block device to be used as cache for other devices; uses
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 6658f40ae492..ae9651cad923 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -902,7 +902,7 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
 	bdev->bd_inode = inode;
-#ifdef CONFIG_SYSFS
+#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
 	INIT_LIST_HEAD(&bdev->bd_holder_disks);
 #endif
 	bdev->bd_stats = alloc_percpu(struct disk_stats);
@@ -1063,148 +1063,6 @@ void bd_abort_claiming(struct block_device *bdev, void *holder)
 }
 EXPORT_SYMBOL(bd_abort_claiming);
 
-#ifdef CONFIG_SYSFS
-struct bd_holder_disk {
-	struct list_head	list;
-	struct gendisk		*disk;
-	int			refcnt;
-};
-
-static struct bd_holder_disk *bd_find_holder_disk(struct block_device *bdev,
-						  struct gendisk *disk)
-{
-	struct bd_holder_disk *holder;
-
-	list_for_each_entry(holder, &bdev->bd_holder_disks, list)
-		if (holder->disk == disk)
-			return holder;
-	return NULL;
-}
-
-static int add_symlink(struct kobject *from, struct kobject *to)
-{
-	return sysfs_create_link(from, to, kobject_name(to));
-}
-
-static void del_symlink(struct kobject *from, struct kobject *to)
-{
-	sysfs_remove_link(from, kobject_name(to));
-}
-
-/**
- * bd_link_disk_holder - create symlinks between holding disk and slave bdev
- * @bdev: the claimed slave bdev
- * @disk: the holding disk
- *
- * DON'T USE THIS UNLESS YOU'RE ALREADY USING IT.
- *
- * This functions creates the following sysfs symlinks.
- *
- * - from "slaves" directory of the holder @disk to the claimed @bdev
- * - from "holders" directory of the @bdev to the holder @disk
- *
- * For example, if /dev/dm-0 maps to /dev/sda and disk for dm-0 is
- * passed to bd_link_disk_holder(), then:
- *
- *   /sys/block/dm-0/slaves/sda --> /sys/block/sda
- *   /sys/block/sda/holders/dm-0 --> /sys/block/dm-0
- *
- * The caller must have claimed @bdev before calling this function and
- * ensure that both @bdev and @disk are valid during the creation and
- * lifetime of these symlinks.
- *
- * CONTEXT:
- * Might sleep.
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
-{
-	struct bd_holder_disk *holder;
-	int ret = 0;
-
-	mutex_lock(&bdev->bd_disk->open_mutex);
-
-	WARN_ON_ONCE(!bdev->bd_holder);
-
-	/* FIXME: remove the following once add_disk() handles errors */
-	if (WARN_ON(!disk->slave_dir || !bdev->bd_holder_dir))
-		goto out_unlock;
-
-	holder = bd_find_holder_disk(bdev, disk);
-	if (holder) {
-		holder->refcnt++;
-		goto out_unlock;
-	}
-
-	holder = kzalloc(sizeof(*holder), GFP_KERNEL);
-	if (!holder) {
-		ret = -ENOMEM;
-		goto out_unlock;
-	}
-
-	INIT_LIST_HEAD(&holder->list);
-	holder->disk = disk;
-	holder->refcnt = 1;
-
-	ret = add_symlink(disk->slave_dir, bdev_kobj(bdev));
-	if (ret)
-		goto out_free;
-
-	ret = add_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
-	if (ret)
-		goto out_del;
-	/*
-	 * bdev could be deleted beneath us which would implicitly destroy
-	 * the holder directory.  Hold on to it.
-	 */
-	kobject_get(bdev->bd_holder_dir);
-
-	list_add(&holder->list, &bdev->bd_holder_disks);
-	goto out_unlock;
-
-out_del:
-	del_symlink(disk->slave_dir, bdev_kobj(bdev));
-out_free:
-	kfree(holder);
-out_unlock:
-	mutex_unlock(&bdev->bd_disk->open_mutex);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(bd_link_disk_holder);
-
-/**
- * bd_unlink_disk_holder - destroy symlinks created by bd_link_disk_holder()
- * @bdev: the calimed slave bdev
- * @disk: the holding disk
- *
- * DON'T USE THIS UNLESS YOU'RE ALREADY USING IT.
- *
- * CONTEXT:
- * Might sleep.
- */
-void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
-{
-	struct bd_holder_disk *holder;
-
-	mutex_lock(&bdev->bd_disk->open_mutex);
-
-	holder = bd_find_holder_disk(bdev, disk);
-
-	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
-		del_symlink(disk->slave_dir, bdev_kobj(bdev));
-		del_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
-		kobject_put(bdev->bd_holder_dir);
-		list_del_init(&holder->list);
-		kfree(holder);
-	}
-
-	mutex_unlock(&bdev->bd_disk->open_mutex);
-}
-EXPORT_SYMBOL_GPL(bd_unlink_disk_holder);
-#endif
-
 static void blkdev_flush_mapping(struct block_device *bdev)
 {
 	WARN_ON_ONCE(bdev->bd_holders);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 290f9061b29a..7a4e139d24ef 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -34,7 +34,7 @@ struct block_device {
 	void *			bd_holder;
 	int			bd_holders;
 	bool			bd_write_holder;
-#ifdef CONFIG_SYSFS
+#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
 	struct list_head	bd_holder_disks;
 #endif
 	struct kobject		*bd_holder_dir;
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 849486de81c6..e21a91c16a79 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -318,7 +318,7 @@ void set_capacity(struct gendisk *disk, sector_t size);
 int blkdev_ioctl(struct block_device *, fmode_t, unsigned, unsigned long);
 long compat_blkdev_ioctl(struct file *, unsigned, unsigned long);
 
-#ifdef CONFIG_SYSFS
+#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
 int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk);
 void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk);
 #else
@@ -331,7 +331,7 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
 					 struct gendisk *disk)
 {
 }
-#endif /* CONFIG_SYSFS */
+#endif /* CONFIG_BLOCK_HOLDER_DEPRECATED */
 
 dev_t part_devt(struct gendisk *disk, u8 partno);
 void inc_diskseq(struct gendisk *disk);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

