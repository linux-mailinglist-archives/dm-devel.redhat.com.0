Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D87D13DB9C0
	for <lists+dm-devel@lfdr.de>; Fri, 30 Jul 2021 15:55:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-3pknNBpnOOih-RogjKv_jw-1; Fri, 30 Jul 2021 09:55:08 -0400
X-MC-Unique: 3pknNBpnOOih-RogjKv_jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 104A3192CC4D;
	Fri, 30 Jul 2021 13:54:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5C2746;
	Fri, 30 Jul 2021 13:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DAF7180BAB3;
	Fri, 30 Jul 2021 13:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16U8rQIF013610 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 04:53:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A15ED20FE6BF; Fri, 30 Jul 2021 08:53:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CF9D20FE6C8
	for <dm-devel@redhat.com>; Fri, 30 Jul 2021 08:53:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE1D018A01AF
	for <dm-devel@redhat.com>; Fri, 30 Jul 2021 08:53:23 +0000 (UTC)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by relay.mimecast.com with ESMTP id us-mta-48-5XyBt7B-NYi5pD4InPKq6A-2; 
	Fri, 30 Jul 2021 04:53:19 -0400
X-MC-Unique: 5XyBt7B-NYi5pD4InPKq6A-2
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ao0+aGqEyNqzg/l7+pLqEDMeALOsnbusQ8zAX?=
	=?us-ascii?q?P0AYc3Jom6uj5qaTdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhI?=
	=?us-ascii?q?LAFugLhuGO/9SjIVybygc378ZdmsZFZ+EYdWIK7/oS/jPIbuoI8Z2W9ryyn+fC?=
	=?us-ascii?q?wzNIRQFuUatp6AB0EW+gYzZLbTgDFZwkD4Cd+8YCgzKhfE4cZsO9CmJAcPPEo7?=
	=?us-ascii?q?Tw5ejbSC9DFxg68xOPkD/tzLb7FiKT1hAYXygK4ZpKyxm8rzDE?=
X-IronPort-AV: E=Sophos;i="5.84,281,1620662400"; d="scan'208";a="112070621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2021 16:53:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A98A04D0D49B;
	Fri, 30 Jul 2021 16:53:12 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.23; Fri, 30 Jul 2021 16:53:13 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
	G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP
	Server
	id 15.0.1497.23 via Frontend Transport; Fri, 30 Jul 2021 16:53:11 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <linux-kernel@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-fsdevel@vger.kernel.org>, <dm-devel@redhat.com>
Date: Fri, 30 Jul 2021 16:52:43 +0800
Message-ID: <20210730085245.3069812-8-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210730085245.3069812-1-ruansy.fnst@fujitsu.com>
References: <20210730085245.3069812-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A98A04D0D49B.A2416
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No
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
X-Mailman-Approved-At: Fri, 30 Jul 2021 09:53:42 -0400
Cc: snitzer@redhat.com, david@fromorbit.com, djwong@kernel.com,
	dan.j.williams@intel.com, hch@lst.de, agk@redhat.com
Subject: [dm-devel] [PATCH v6 7/9] dm: Introduce ->rmap() to find bdev offset
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

Pmem device could be a target of mapped device.  In order to find out
the global location on a mapped device, we introduce this to translate
offset from target device to mapped device.

Currently, we implement it on linear target, which is easy to do the
translation.  Other targets will be supported in the future.  However,
some targets may not support it because of the non-linear mapping.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 block/genhd.c                 | 56 +++++++++++++++++++++++++++++++++++
 drivers/md/dm-linear.c        | 20 +++++++++++++
 include/linux/device-mapper.h |  5 ++++
 include/linux/genhd.h         |  1 +
 4 files changed, 82 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index af4d2ab4a633..7a595da0cbec 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -669,6 +669,62 @@ void blk_request_module(dev_t devt)
 		request_module("block-major-%d", MAJOR(devt));
 }
 
+/*
+ * bdget_disk - do bdget() by gendisk and partition number
+ * @disk: gendisk of interest
+ * @partno: partition number
+ *
+ * Find partition @partno from @disk, do bdget() on it.
+ *
+ * CONTEXT:
+ * Don't care.
+ *
+ * RETURNS:
+ * Resulting block_device on success, NULL on failure.
+ */
+static inline struct block_device *bdget_disk(struct gendisk *disk, int partno)
+{
+	struct block_device *bdev = NULL;
+
+	rcu_read_lock();
+	bdev = xa_load(&disk->part_tbl, partno);
+	if (bdev && !bdgrab(bdev))
+		bdev = NULL;
+	rcu_read_unlock();
+
+	return bdev;
+}
+
+/**
+ * bdget_disk_sector - get block device by given sector number
+ * @disk: gendisk of interest
+ * @sector: sector number
+ *
+ * RETURNS: the found block device where sector locates in
+ */
+struct block_device *bdget_disk_sector(struct gendisk *disk, sector_t sector)
+{
+	struct block_device *part = NULL, *p;
+	unsigned long idx;
+
+	rcu_read_lock();
+	xa_for_each(&disk->part_tbl, idx, p) {
+		if (p->bd_partno == 0)
+			continue;
+		if (p->bd_start_sect <= sector &&
+			sector < p->bd_start_sect + bdev_nr_sectors(p)) {
+			part = p;
+			break;
+		}
+	}
+	rcu_read_unlock();
+	if (!part)
+		part = disk->part0;
+
+	return bdget_disk(disk, part->bd_partno);
+}
+EXPORT_SYMBOL(bdget_disk_sector);
+
 /*
  * print a full list of all partitions - intended for places where the root
  * filesystem can't be mounted and thus to give the victim some idea of what
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index c91f1e2e2f65..d28577bd358b 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -5,6 +5,7 @@
  */
 
 #include "dm.h"
+#include "dm-core.h"
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/blkdev.h>
@@ -119,6 +120,24 @@ static void linear_status(struct dm_target *ti, status_type_t type,
 	}
 }
 
+static int linear_rmap(struct dm_target *ti, sector_t offset,
+		       rmap_callout_fn fn, void *data)
+{
+	struct linear_c *lc = (struct linear_c *) ti->private;
+	struct mapped_device *md = ti->table->md;
+	struct block_device *bdev;
+	sector_t disk_sect = offset - dm_target_offset(ti, lc->start);
+	int rc = -ENODEV;
+
+	bdev = bdget_disk_sector(md->disk, offset);
+	if (!bdev)
+		return rc;
+
+	rc = fn(ti, bdev, disk_sect, data);
+	bdput(bdev);
+	return rc;
+}
+
 static int linear_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 {
 	struct linear_c *lc = (struct linear_c *) ti->private;
@@ -235,6 +254,7 @@ static struct target_type linear_target = {
 	.ctr    = linear_ctr,
 	.dtr    = linear_dtr,
 	.map    = linear_map,
+	.rmap   = linear_rmap,
 	.status = linear_status,
 	.prepare_ioctl = linear_prepare_ioctl,
 	.iterate_devices = linear_iterate_devices,
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 7457d49acf9a..4069983c4618 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -58,6 +58,10 @@ typedef void (*dm_dtr_fn) (struct dm_target *ti);
  * = 2: The target wants to push back the io
  */
 typedef int (*dm_map_fn) (struct dm_target *ti, struct bio *bio);
+typedef int (*rmap_callout_fn) (struct dm_target *ti, struct block_device *bdev,
+				sector_t sect, void *data);
+typedef int (*dm_rmap_fn) (struct dm_target *ti, sector_t offset,
+			   rmap_callout_fn fn, void *data);
 typedef int (*dm_clone_and_map_request_fn) (struct dm_target *ti,
 					    struct request *rq,
 					    union map_info *map_context,
@@ -184,6 +188,7 @@ struct target_type {
 	dm_ctr_fn ctr;
 	dm_dtr_fn dtr;
 	dm_map_fn map;
+	dm_rmap_fn rmap;
 	dm_clone_and_map_request_fn clone_and_map_rq;
 	dm_release_clone_request_fn release_clone_rq;
 	dm_endio_fn end_io;
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 13b34177cc85..7de6fdc14de6 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -223,6 +223,7 @@ static inline void add_disk_no_queue_reg(struct gendisk *disk)
 }
 
 extern void del_gendisk(struct gendisk *gp);
+extern struct block_device *bdget_disk_sector(struct gendisk *disk, sector_t sector);
 
 void set_disk_ro(struct gendisk *disk, bool read_only);
 
-- 
2.32.0



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

