Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 329F23DB9C3
	for <lists+dm-devel@lfdr.de>; Fri, 30 Jul 2021 15:55:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-DUnupsoYMUKVtYF-kob4Gw-1; Fri, 30 Jul 2021 09:55:09 -0400
X-MC-Unique: DUnupsoYMUKVtYF-kob4Gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E40C6363A5;
	Fri, 30 Jul 2021 13:55:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC146A8FD;
	Fri, 30 Jul 2021 13:55:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BC1E1819AC2;
	Fri, 30 Jul 2021 13:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16U8rZrK013625 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 04:53:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7A001054E49; Fri, 30 Jul 2021 08:53:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24421054E99
	for <dm-devel@redhat.com>; Fri, 30 Jul 2021 08:53:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E08C718A01A0
	for <dm-devel@redhat.com>; Fri, 30 Jul 2021 08:53:32 +0000 (UTC)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by relay.mimecast.com with ESMTP id us-mta-122-8YtB6RZTM2K5uAGkb8UsWA-1;
	Fri, 30 Jul 2021 04:53:27 -0400
X-MC-Unique: 8YtB6RZTM2K5uAGkb8UsWA-1
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AqVKn+qqoWrSMz3XMqEg+lXcaV5oXeYIsimQD?=
	=?us-ascii?q?101hICG9E/bo8/xG+c536faaslgssQ4b8+xoVJPgfZq+z+8R3WByB8bAYOCOgg?=
	=?us-ascii?q?LBQ72KhrGSoQEIdRefysdtkY9kc4VbTOb7FEVGi6/BizWQIpINx8am/cmT6dvj?=
	=?us-ascii?q?8w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,281,1620662400"; d="scan'208";a="112070648"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2021 16:53:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 324884D0D498;
	Fri, 30 Jul 2021 16:53:24 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.23; Fri, 30 Jul 2021 16:53:14 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
	G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP
	Server
	id 15.0.1497.23 via Frontend Transport; Fri, 30 Jul 2021 16:53:12 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <linux-kernel@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-fsdevel@vger.kernel.org>, <dm-devel@redhat.com>
Date: Fri, 30 Jul 2021 16:52:44 +0800
Message-ID: <20210730085245.3069812-9-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210730085245.3069812-1-ruansy.fnst@fujitsu.com>
References: <20210730085245.3069812-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 324884D0D498.AF56E
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 30 Jul 2021 09:53:42 -0400
Cc: snitzer@redhat.com, david@fromorbit.com, djwong@kernel.com,
	dan.j.williams@intel.com, hch@lst.de, agk@redhat.com
Subject: [dm-devel] [PATCH v6 8/9] md: Implement dax_holder_operations
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

This is the case where the holder represents a mapped device, or a list
of mapped devices more exactly(because it is possible to create more
than one mapped device on one pmem device).

Find out which mapped device the offset belongs to, and translate the
offset from target device to mapped device.  When it is done, call
dax_corrupted_range() for the holder of this mapped device.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 drivers/md/dm.c | 126 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 2c5f9e585211..a35b9a97a73f 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -626,7 +626,11 @@ static void dm_put_live_table_fast(struct mapped_device *md) __releases(RCU)
 }
 
 static char *_dm_claim_ptr = "I belong to device-mapper";
-
+static const struct dax_holder_operations dm_dax_holder_ops;
+struct dm_holder {
+	struct list_head list;
+	struct mapped_device *md;
+};
 /*
  * Open a table device so we can use it as a map destination.
  */
@@ -634,6 +638,8 @@ static int open_table_device(struct table_device *td, dev_t dev,
 			     struct mapped_device *md)
 {
 	struct block_device *bdev;
+	struct list_head *holders;
+	struct dm_holder *holder;
 
 	int r;
 
@@ -651,6 +657,19 @@ static int open_table_device(struct table_device *td, dev_t dev,
 
 	td->dm_dev.bdev = bdev;
 	td->dm_dev.dax_dev = dax_get_by_host(bdev->bd_disk->disk_name);
+	if (!td->dm_dev.dax_dev)
+		return 0;
+
+	holders = dax_get_holder(td->dm_dev.dax_dev);
+	if (!holders) {
+		holders = kmalloc(sizeof(*holders), GFP_KERNEL);
+		INIT_LIST_HEAD(holders);
+		dax_set_holder(td->dm_dev.dax_dev, holders, &dm_dax_holder_ops);
+	}
+	holder = kmalloc(sizeof(*holder), GFP_KERNEL);
+	holder->md = md;
+	list_add_tail(&holder->list, holders);
+
 	return 0;
 }
 
@@ -659,9 +678,27 @@ static int open_table_device(struct table_device *td, dev_t dev,
  */
 static void close_table_device(struct table_device *td, struct mapped_device *md)
 {
+	struct list_head *holders;
+	struct dm_holder *holder, *n;
+
 	if (!td->dm_dev.bdev)
 		return;
 
+	holders = dax_get_holder(td->dm_dev.dax_dev);
+	if (holders) {
+		list_for_each_entry_safe(holder, n, holders, list) {
+			if (holder->md == md) {
+				list_del(&holder->list);
+				kfree(holder);
+			}
+		}
+		if (list_empty(holders)) {
+			kfree(holders);
+			/* unset dax_device's holder_data */
+			dax_set_holder(td->dm_dev.dax_dev, NULL, NULL);
+		}
+	}
+
 	bd_unlink_disk_holder(td->dm_dev.bdev, dm_disk(md));
 	blkdev_put(td->dm_dev.bdev, td->dm_dev.mode | FMODE_EXCL);
 	put_dax(td->dm_dev.dax_dev);
@@ -1115,6 +1152,89 @@ static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_DAX_DRIVER)
+struct corrupted_hit_info {
+	struct dax_device *dax_dev;
+	sector_t offset;
+};
+
+static int dm_blk_corrupted_hit(struct dm_target *ti, struct dm_dev *dev,
+				sector_t start, sector_t count, void *data)
+{
+	struct corrupted_hit_info *bc = data;
+
+	return bc->dax_dev == (void *)dev->dax_dev &&
+			(start <= bc->offset && bc->offset < start + count);
+}
+
+struct corrupted_do_info {
+	size_t length;
+	void *data;
+};
+
+static int dm_blk_corrupted_do(struct dm_target *ti, struct block_device *bdev,
+			       sector_t sector, void *data)
+{
+	struct mapped_device *md = ti->table->md;
+	struct corrupted_do_info *bc = data;
+
+	return dax_holder_notify_failure(md->dax_dev, to_bytes(sector),
+					 bc->length, bc->data);
+}
+
+static int dm_dax_notify_failure_one(struct mapped_device *md,
+				     struct dax_device *dax_dev,
+				     loff_t offset, size_t length, void *data)
+{
+	struct dm_table *map;
+	struct dm_target *ti;
+	sector_t sect = to_sector(offset);
+	struct corrupted_hit_info hi = {dax_dev, sect};
+	struct corrupted_do_info di = {length, data};
+	int srcu_idx, i, rc = -ENODEV;
+
+	map = dm_get_live_table(md, &srcu_idx);
+	if (!map)
+		return rc;
+
+	/*
+	 * find the target device, and then translate the offset of this target
+	 * to the whole mapped device.
+	 */
+	for (i = 0; i < dm_table_get_num_targets(map); i++) {
+		ti = dm_table_get_target(map, i);
+		if (!(ti->type->iterate_devices && ti->type->rmap))
+			continue;
+		if (!ti->type->iterate_devices(ti, dm_blk_corrupted_hit, &hi))
+			continue;
+
+		rc = ti->type->rmap(ti, sect, dm_blk_corrupted_do, &di);
+		break;
+	}
+
+	dm_put_live_table(md, srcu_idx);
+	return rc;
+}
+
+static int dm_dax_notify_failure(struct dax_device *dax_dev,
+				 loff_t offset, size_t length, void *data)
+{
+	struct dm_holder *holder;
+	struct list_head *holders = dax_get_holder(dax_dev);
+	int rc = -ENODEV;
+
+	list_for_each_entry(holder, holders, list) {
+		rc = dm_dax_notify_failure_one(holder->md, dax_dev, offset,
+					       length, data);
+		if (rc != -ENODEV)
+			break;
+	}
+	return rc;
+}
+#else
+#define dm_dax_notify_failure NULL
+#endif
+
 /*
  * A target may call dm_accept_partial_bio only from the map routine.  It is
  * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_* zone management
@@ -3057,6 +3177,10 @@ static const struct dax_operations dm_dax_ops = {
 	.zero_page_range = dm_dax_zero_page_range,
 };
 
+static const struct dax_holder_operations dm_dax_holder_ops = {
+	.notify_failure = dm_dax_notify_failure,
+};
+
 /*
  * module hooks
  */
-- 
2.32.0



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

