Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6F3B71F
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jun 2019 16:19:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39C58223875;
	Mon, 10 Jun 2019 14:18:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A354F5B684;
	Mon, 10 Jun 2019 14:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ED14E165;
	Mon, 10 Jun 2019 14:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5A9AWcp005317 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 05:10:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E4C160C61; Mon, 10 Jun 2019 09:10:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-103.sin2.redhat.com
	[10.67.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 751FC60BF1;
	Mon, 10 Jun 2019 09:09:49 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
	qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org
Date: Mon, 10 Jun 2019 14:37:26 +0530
Message-Id: <20190610090730.8589-4-pagupta@redhat.com>
In-Reply-To: <20190610090730.8589-1-pagupta@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Jun 2019 10:16:23 -0400
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, jasowang@redhat.com, david@fromorbit.com,
	lcapitulino@redhat.com, adilger.kernel@dilger.ca,
	zwisler@kernel.org, aarcange@redhat.com, dave.jiang@intel.com,
	jstaron@google.com, darrick.wong@oracle.com,
	vishal.l.verma@intel.com, david@redhat.com, willy@infradead.org,
	hch@infradead.org, jmoyer@redhat.com, nilal@redhat.com,
	lenb@kernel.org, kilobyte@angband.pl, riel@surriel.com,
	yuval.shaia@oracle.com, stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, kwolf@redhat.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
Subject: [dm-devel] [PATCH v11 3/7] libnvdimm: add dax_dev sync flag
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 10 Jun 2019 14:19:46 +0000 (UTC)

This patch adds 'DAXDEV_SYNC' flag which is set
for nd_region doing synchronous flush. This later
is used to disable MAP_SYNC functionality for
ext4 & xfs filesystem for devices don't support
synchronous flush.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 drivers/dax/bus.c            |  2 +-
 drivers/dax/super.c          | 19 ++++++++++++++++++-
 drivers/md/dm.c              |  3 ++-
 drivers/nvdimm/pmem.c        |  5 ++++-
 drivers/nvdimm/region_devs.c |  7 +++++++
 include/linux/dax.h          |  9 +++++++--
 include/linux/libnvdimm.h    |  1 +
 7 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 2109cfe80219..5f184e751c82 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -388,7 +388,7 @@ struct dev_dax *__devm_create_dev_dax(struct dax_region *dax_region, int id,
 	 * No 'host' or dax_operations since there is no access to this
 	 * device outside of mmap of the resulting character device.
 	 */
-	dax_dev = alloc_dax(dev_dax, NULL, NULL);
+	dax_dev = alloc_dax(dev_dax, NULL, NULL, DAXDEV_F_SYNC);
 	if (!dax_dev)
 		goto err;
 
diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index bbd57ca0634a..93b3718b5cfa 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -186,6 +186,8 @@ enum dax_device_flags {
 	DAXDEV_ALIVE,
 	/* gate whether dax_flush() calls the low level flush routine */
 	DAXDEV_WRITE_CACHE,
+	/* flag to check if device supports synchronous flush */
+	DAXDEV_SYNC,
 };
 
 /**
@@ -354,6 +356,18 @@ bool dax_write_cache_enabled(struct dax_device *dax_dev)
 }
 EXPORT_SYMBOL_GPL(dax_write_cache_enabled);
 
+bool dax_synchronous(struct dax_device *dax_dev)
+{
+	return test_bit(DAXDEV_SYNC, &dax_dev->flags);
+}
+EXPORT_SYMBOL_GPL(dax_synchronous);
+
+void set_dax_synchronous(struct dax_device *dax_dev)
+{
+	set_bit(DAXDEV_SYNC, &dax_dev->flags);
+}
+EXPORT_SYMBOL_GPL(set_dax_synchronous);
+
 bool dax_alive(struct dax_device *dax_dev)
 {
 	lockdep_assert_held(&dax_srcu);
@@ -508,7 +522,7 @@ static void dax_add_host(struct dax_device *dax_dev, const char *host)
 }
 
 struct dax_device *alloc_dax(void *private, const char *__host,
-		const struct dax_operations *ops)
+		const struct dax_operations *ops, unsigned long flags)
 {
 	struct dax_device *dax_dev;
 	const char *host;
@@ -531,6 +545,9 @@ struct dax_device *alloc_dax(void *private, const char *__host,
 	dax_add_host(dax_dev, host);
 	dax_dev->ops = ops;
 	dax_dev->private = private;
+	if (flags & DAXDEV_F_SYNC)
+		set_dax_synchronous(dax_dev);
+
 	return dax_dev;
 
  err_dev:
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1fb1333fefec..7eee7ddc73a8 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1970,7 +1970,8 @@ static struct mapped_device *alloc_dev(int minor)
 	sprintf(md->disk->disk_name, "dm-%d", minor);
 
 	if (IS_ENABLED(CONFIG_DAX_DRIVER)) {
-		md->dax_dev = alloc_dax(md, md->disk->disk_name, &dm_dax_ops);
+		md->dax_dev = alloc_dax(md, md->disk->disk_name,
+					&dm_dax_ops, 0);
 		if (!md->dax_dev)
 			goto bad;
 	}
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 0279eb1da3ef..bdbd2b414d3d 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -365,6 +365,7 @@ static int pmem_attach_disk(struct device *dev,
 	struct gendisk *disk;
 	void *addr;
 	int rc;
+	unsigned long flags = 0UL;
 
 	pmem = devm_kzalloc(dev, sizeof(*pmem), GFP_KERNEL);
 	if (!pmem)
@@ -462,7 +463,9 @@ static int pmem_attach_disk(struct device *dev,
 	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_res);
 	disk->bb = &pmem->bb;
 
-	dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops);
+	if (is_nvdimm_sync(nd_region))
+		flags = DAXDEV_F_SYNC;
+	dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops, flags);
 	if (!dax_dev) {
 		put_disk(disk);
 		return -ENOMEM;
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index b4ef7d9ff22e..f3ea5369d20a 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -1197,6 +1197,13 @@ int nvdimm_has_cache(struct nd_region *nd_region)
 }
 EXPORT_SYMBOL_GPL(nvdimm_has_cache);
 
+bool is_nvdimm_sync(struct nd_region *nd_region)
+{
+	return is_nd_pmem(&nd_region->dev) &&
+		!test_bit(ND_REGION_ASYNC, &nd_region->flags);
+}
+EXPORT_SYMBOL_GPL(is_nvdimm_sync);
+
 struct conflict_context {
 	struct nd_region *nd_region;
 	resource_size_t start, size;
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 0dd316a74a29..2b106752b1b8 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -7,6 +7,9 @@
 #include <linux/radix-tree.h>
 #include <asm/pgtable.h>
 
+/* Flag for synchronous flush */
+#define DAXDEV_F_SYNC (1UL << 0)
+
 typedef unsigned long dax_entry_t;
 
 struct iomap_ops;
@@ -32,18 +35,20 @@ extern struct attribute_group dax_attribute_group;
 #if IS_ENABLED(CONFIG_DAX)
 struct dax_device *dax_get_by_host(const char *host);
 struct dax_device *alloc_dax(void *private, const char *host,
-		const struct dax_operations *ops);
+		const struct dax_operations *ops, unsigned long flags);
 void put_dax(struct dax_device *dax_dev);
 void kill_dax(struct dax_device *dax_dev);
 void dax_write_cache(struct dax_device *dax_dev, bool wc);
 bool dax_write_cache_enabled(struct dax_device *dax_dev);
+bool dax_synchronous(struct dax_device *dax_dev);
+void set_dax_synchronous(struct dax_device *dax_dev);
 #else
 static inline struct dax_device *dax_get_by_host(const char *host)
 {
 	return NULL;
 }
 static inline struct dax_device *alloc_dax(void *private, const char *host,
-		const struct dax_operations *ops)
+		const struct dax_operations *ops, unsigned long flags)
 {
 	/*
 	 * Callers should check IS_ENABLED(CONFIG_DAX) to know if this
diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
index feb342d026f2..3238a206e563 100644
--- a/include/linux/libnvdimm.h
+++ b/include/linux/libnvdimm.h
@@ -264,6 +264,7 @@ void nvdimm_flush(struct nd_region *nd_region);
 int nvdimm_has_flush(struct nd_region *nd_region);
 int nvdimm_has_cache(struct nd_region *nd_region);
 int nvdimm_in_overwrite(struct nvdimm *nvdimm);
+bool is_nvdimm_sync(struct nd_region *nd_region);
 
 static inline int nvdimm_ctl(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 		unsigned int buf_len, int *cmd_rc)
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
