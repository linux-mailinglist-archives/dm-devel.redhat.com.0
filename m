Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4B3315198
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 15:31:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-_IlE7pvWOaycSdAew691hQ-1; Tue, 09 Feb 2021 09:31:30 -0500
X-MC-Unique: _IlE7pvWOaycSdAew691hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E715801977;
	Tue,  9 Feb 2021 14:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B5860C4D;
	Tue,  9 Feb 2021 14:31:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF2E31809C90;
	Tue,  9 Feb 2021 14:31:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119EVJk7029109 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 09:31:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A44762026D49; Tue,  9 Feb 2021 14:31:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3CE2026D25
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:31:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB8191859172
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:31:16 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-569-fMVGt2yNOku_vIqy_F02dw-1;
	Tue, 09 Feb 2021 09:31:14 -0500
X-MC-Unique: fMVGt2yNOku_vIqy_F02dw-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id 2E8A141938;
	Tue,  9 Feb 2021 09:31:12 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Tue, 9 Feb 2021 15:30:52 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <Damien.LeMoal@wdc.com>, <snitzer@redhat.com>, <hare@suse.de>,
	<ming.lei@redhat.com>, <agk@redhat.com>, <corbet@lwn.net>,
	<axboe@kernel.dk>, <jack@suse.cz>, <johannes.thumshirn@wdc.com>,
	<gregkh@linuxfoundation.org>, <koct9i@gmail.com>, <steve@sk2.org>,
	<dm-devel@redhat.com>, <linux-block@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 9 Feb 2021 17:30:27 +0300
Message-ID: <1612881028-7878-6-git-send-email-sergei.shtepa@veeam.com>
In-Reply-To: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
References: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265617465
X-Veeam-MMEX: True
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
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH v5 5/6] dm: add 'noexcl' option for dm-linear
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The 'noexcl' option allow to open underlying block-device
without FMODE_EXCL.

Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 drivers/md/dm-linear.c        | 14 +++++++++++++-
 drivers/md/dm-table.c         | 14 ++++++++------
 drivers/md/dm.c               | 26 +++++++++++++++++++-------
 drivers/md/dm.h               |  2 +-
 include/linux/device-mapper.h |  7 +++++++
 5 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 00774b5d7668..b16d89802b9d 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -33,7 +33,7 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	char dummy;
 	int ret;
 
-	if (argc != 2) {
+	if ((argc < 2) || (argc > 3)) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -51,6 +51,18 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 	lc->start = tmp;
 
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
 	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &lc->dev);
 	if (ret) {
 		ti->error = "Device lookup failed";
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 4acf2342f7ad..f020459465bd 100644
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
@@ -330,8 +330,8 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 
 	old_dev = dd->dm_dev;
 
-	r = dm_get_table_device(md, dd->dm_dev->bdev->bd_dev,
-				dd->dm_dev->mode | new_mode, &new_dev);
+	r = dm_get_table_device(md, dd->dm_dev->bdev->bd_dev, dd->dm_dev->mode | new_mode,
+				non_exclusive, &new_dev);
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
index 00c41aa6d092..c25dcc2fdb89 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1117,33 +1117,44 @@ static void close_table_device(struct table_device *td, struct mapped_device *md
 	if (!td->dm_dev.bdev)
 		return;
 
-	bd_unlink_disk_holder(td->dm_dev.bdev, dm_disk(md));
-	blkdev_put(td->dm_dev.bdev, td->dm_dev.mode | FMODE_EXCL);
+	if (td->dm_dev.non_exclusive)
+		blkdev_put(td->dm_dev.bdev, td->dm_dev.mode);
+	else {
+		bd_unlink_disk_holder(td->dm_dev.bdev, dm_disk(md));
+		blkdev_put(td->dm_dev.bdev, td->dm_dev.mode | FMODE_EXCL);
+	}
+
+
+	blkdev_put(td->dm_dev.bdev, td->dm_dev.mode);
+
 	put_dax(td->dm_dev.dax_dev);
 	td->dm_dev.bdev = NULL;
 	td->dm_dev.dax_dev = NULL;
+	td->dm_dev.non_exclusive = false;
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
@@ -1154,7 +1165,8 @@ int dm_get_table_device(struct mapped_device *md, dev_t dev, fmode_t mode,
 		td->dm_dev.mode = mode;
 		td->dm_dev.bdev = NULL;
 
-		if ((r = open_table_device(td, dev, md))) {
+		r = open_table_device(td, dev, md, non_exclusive);
+		if (r) {
 			mutex_unlock(&md->table_devices_lock);
 			kfree(td);
 			return r;
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
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

