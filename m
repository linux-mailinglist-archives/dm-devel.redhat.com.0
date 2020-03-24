Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id BD5E419222D
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585123998;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tz+X4RPq2N8Y2gq6rW9nysitKGkE772li9ucK3gwFts=;
	b=YCuZmphRwlFHYF/2c9V5rjrdOCv4g0r9DjgqFEcj7vEFS1gWdoqnKfZmgHiK4f5S+O2ObR
	G3vR6xdbXJKkZ++RSbwgrjSnLQ9HItJY/kS9Tga4NBGh4JKzofrWNgYHGNnf/tZdmnMIZx
	C15hJVmeZBDOPPU5L16rdP8dYzIwnHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-gSf40uZgNIS4Ifsre5Fp-A-1; Wed, 25 Mar 2020 04:13:16 -0400
X-MC-Unique: gSf40uZgNIS4Ifsre5Fp-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B227100DFD4;
	Wed, 25 Mar 2020 08:13:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E6AB9B934;
	Wed, 25 Mar 2020 08:13:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7E9C86386;
	Wed, 25 Mar 2020 08:13:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OB3ixq008810 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 07:03:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6891C2166B2B; Tue, 24 Mar 2020 11:03:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 646ED2166B2A
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4558B800296
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:44 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-k3iS5svoPAehcHGJEWa1Sw-1; Tue, 24 Mar 2020 07:03:42 -0400
X-MC-Unique: k3iS5svoPAehcHGJEWa1Sw-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OAsDo3039499; Tue, 24 Mar 2020 11:03:41 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2yx8ac0jwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OApjbL181986; Tue, 24 Mar 2020 11:03:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2yxw92f3ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:40 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02OB3cxO001832;
	Tue, 24 Mar 2020 11:03:38 GMT
Received: from localhost.localdomain (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 24 Mar 2020 04:03:38 -0700
From: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
Date: Tue, 24 Mar 2020 19:02:54 +0800
Message-Id: <20200324110255.8385-3-bob.liu@oracle.com>
In-Reply-To: <20200324110255.8385-1-bob.liu@oracle.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 bulkscore=0
	adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=1
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	clxscore=1015
	lowpriorityscore=0 suspectscore=1 priorityscore=1501 malwarescore=0
	mlxscore=0 adultscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02OB3ixq008810
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com,
	Bob Liu <bob.liu@oracle.com>
Subject: [dm-devel] [RFC PATCH v2 2/3] dm zoned: introduce regular device to
	dm-zoned-target
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a regular device for storing metadata and buffer write, zoned
device is used by default if no regular device was set by dmsetup.

The corresponding dmsetup cmd is:
echo "0 $size zoned $regular_device $zoned_device" | dmsetup create $dm-zoned-name

Signed-off-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-target.c | 141 +++++++++++++++++++++++++------------------
 drivers/md/dm-zoned.h        |  50 +++++++++++++--
 2 files changed, 127 insertions(+), 64 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 28f4d00..cae4bfe 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -35,38 +35,6 @@ struct dm_chunk_work {
 };
 
 /*
- * Target descriptor.
- */
-struct dmz_target {
-	struct dm_dev		*ddev;
-
-	unsigned long		flags;
-
-	/* Zoned block device information */
-	struct dmz_dev		*zoned_dev;
-
-	/* For metadata handling */
-	struct dmz_metadata     *metadata;
-
-	/* For reclaim */
-	struct dmz_reclaim	*reclaim;
-
-	/* For chunk work */
-	struct radix_tree_root	chunk_rxtree;
-	struct workqueue_struct *chunk_wq;
-	struct mutex		chunk_lock;
-
-	/* For cloned BIOs to zones */
-	struct bio_set		bio_set;
-
-	/* For flush */
-	spinlock_t		flush_lock;
-	struct bio_list		flush_list;
-	struct delayed_work	flush_work;
-	struct workqueue_struct *flush_wq;
-};
-
-/*
  * Flush intervals (seconds).
  */
 #define DMZ_FLUSH_PERIOD	(10 * HZ)
@@ -679,7 +647,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 /*
  * Get zoned device information.
  */
-static int dmz_get_zoned_device(struct dm_target *ti, char *path)
+static int dmz_get_device(struct dm_target *ti, char *path, bool zoned)
 {
 	struct dmz_target *dmz = ti->private;
 	struct request_queue *q;
@@ -688,11 +656,22 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
 	int ret;
 
 	/* Get the target device */
-	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table), &dmz->ddev);
-	if (ret) {
-		ti->error = "Get target device failed";
-		dmz->ddev = NULL;
-		return ret;
+	if (zoned) {
+		ret = dm_get_device(ti, path, dm_table_get_mode(ti->table),
+				&dmz->ddev);
+		if (ret) {
+			ti->error = "Get target device failed";
+			dmz->ddev = NULL;
+			return ret;
+		}
+	} else {
+		ret = dm_get_device(ti, path, dm_table_get_mode(ti->table),
+				&dmz->regu_dm_dev);
+		if (ret) {
+			ti->error = "Get target device failed";
+			dmz->regu_dm_dev = NULL;
+			return ret;
+		}
 	}
 
 	dev = kzalloc(sizeof(struct dmz_dev), GFP_KERNEL);
@@ -701,39 +680,61 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
 		goto err;
 	}
 
-	dev->bdev = dmz->ddev->bdev;
-	(void)bdevname(dev->bdev, dev->name);
-
-	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
-		ti->error = "Not a zoned block device";
-		ret = -EINVAL;
-		goto err;
+	if (zoned) {
+		dev->bdev = dmz->ddev->bdev;
+		if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
+			ti->error = "Not a zoned block device";
+			ret = -EINVAL;
+			goto err;
+		}
 	}
+	else
+		dev->bdev = dmz->regu_dm_dev->bdev;
+
+	(void)bdevname(dev->bdev, dev->name);
+	dev->target = dmz;
 
 	q = bdev_get_queue(dev->bdev);
 	dev->capacity = i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
 	aligned_capacity = dev->capacity &
 				~((sector_t)blk_queue_zone_sectors(q) - 1);
-	if (ti->begin ||
-	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
-		ti->error = "Partial mapping not supported";
-		ret = -EINVAL;
-		goto err;
-	}
 
-	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
-	dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
+	if (zoned) {
+		if (ti->begin || ((ti->len != dev->capacity) &&
+					(ti->len != aligned_capacity))) {
+			ti->error = "Partial mapping not supported";
+			ret = -EINVAL;
+			goto err;
+		}
+		dev->zone_nr_sectors = blk_queue_zone_sectors(q);
+		dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
+
+		dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
+		dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
 
-	dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
-	dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
+		dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
 
-	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
+		dmz->zoned_dev = dev;
+	} else {
+		/* Emulate regular device zone info by using the same zone size.*/
+		dev->zone_nr_sectors = dmz->zoned_dev->zone_nr_sectors;
+		dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
 
-	dmz->zoned_dev = dev;
+		dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
+		dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
+
+		dev->nr_zones = (get_capacity(dev->bdev->bd_disk) >>
+				ilog2(dev->zone_nr_sectors));
+
+		dmz->regu_dmz_dev = dev;
+	}
 
 	return 0;
 err:
-	dm_put_device(ti, dmz->ddev);
+	if (zoned)
+		dm_put_device(ti, dmz->ddev);
+	else
+		dm_put_device(ti, dmz->regu_dm_dev);
 	kfree(dev);
 
 	return ret;
@@ -746,6 +747,12 @@ static void dmz_put_zoned_device(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
 
+	if (dmz->regu_dm_dev)
+		dm_put_device(ti, dmz->regu_dm_dev);
+	if (dmz->regu_dmz_dev) {
+		kfree(dmz->regu_dmz_dev);
+		dmz->regu_dmz_dev = NULL;
+	}
 	dm_put_device(ti, dmz->ddev);
 	kfree(dmz->zoned_dev);
 	dmz->zoned_dev = NULL;
@@ -761,7 +768,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	int ret;
 
 	/* Check arguments */
-	if (argc != 1) {
+	if ((argc != 1) && (argc != 2)) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -775,12 +782,25 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->private = dmz;
 
 	/* Get the target zoned block device */
-	ret = dmz_get_zoned_device(ti, argv[0]);
+	ret = dmz_get_device(ti, argv[0], 1);
 	if (ret) {
 		dmz->ddev = NULL;
 		goto err;
 	}
 
+	snprintf(dmz->name, BDEVNAME_SIZE, "%s", dmz->zoned_dev->name);
+	dmz->nr_zones = dmz->zoned_dev->nr_zones;
+	if (argc == 2) {
+		ret = dmz_get_device(ti, argv[1], 0);
+		if (ret) {
+			dmz->regu_dm_dev = NULL;
+			goto err;
+		}
+		snprintf(dmz->name, BDEVNAME_SIZE * 2, "%s:%s",
+				dmz->zoned_dev->name, dmz->regu_dmz_dev->name);
+		dmz->nr_zones += dmz->regu_dmz_dev->nr_zones;
+	}
+
 	/* Initialize metadata */
 	dev = dmz->zoned_dev;
 	ret = dmz_ctr_metadata(dev, &dmz->metadata);
@@ -962,6 +982,7 @@ static int dmz_iterate_devices(struct dm_target *ti,
 	struct dmz_dev *dev = dmz->zoned_dev;
 	sector_t capacity = dev->capacity & ~(dev->zone_nr_sectors - 1);
 
+	/* Todo: fn(dmz->regu_dm_dev) */
 	return fn(ti, dmz->ddev, 0, capacity, data);
 }
 
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 5b5e493..a3535bc 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -46,9 +46,51 @@
 #define dmz_bio_blocks(bio)	dmz_sect2blk(bio_sectors(bio))
 
 /*
+ * Target descriptor.
+ */
+struct dmz_target {
+	struct dm_dev		*ddev;
+	/*
+	 * Regular device for store metdata and buffer write, use zoned device
+	 * by default if no regular device was set.
+	 */
+	struct dm_dev           *regu_dm_dev;
+	struct dmz_dev          *regu_dmz_dev;
+	/* Total nr_zones. */
+	unsigned int            nr_zones;
+	char                    name[BDEVNAME_SIZE * 2];
+
+	unsigned long		flags;
+
+	/* Zoned block device information */
+	struct dmz_dev		*zoned_dev;
+
+	/* For metadata handling */
+	struct dmz_metadata     *metadata;
+
+	/* For reclaim */
+	struct dmz_reclaim	*reclaim;
+
+	/* For chunk work */
+	struct radix_tree_root	chunk_rxtree;
+	struct workqueue_struct *chunk_wq;
+	struct mutex		chunk_lock;
+
+	/* For cloned BIOs to zones */
+	struct bio_set		bio_set;
+
+	/* For flush */
+	spinlock_t		flush_lock;
+	struct bio_list		flush_list;
+	struct delayed_work	flush_work;
+	struct workqueue_struct *flush_wq;
+};
+
+/*
  * Zoned block device information.
  */
 struct dmz_dev {
+	struct dmz_target       *target;
 	struct block_device	*bdev;
 
 	char			name[BDEVNAME_SIZE];
@@ -147,16 +189,16 @@ enum {
  * Message functions.
  */
 #define dmz_dev_info(dev, format, args...)	\
-	DMINFO("(%s): " format, (dev)->name, ## args)
+	DMINFO("(%s): " format, (dev)->target->name, ## args)
 
 #define dmz_dev_err(dev, format, args...)	\
-	DMERR("(%s): " format, (dev)->name, ## args)
+	DMERR("(%s): " format, (dev)->target->name, ## args)
 
 #define dmz_dev_warn(dev, format, args...)	\
-	DMWARN("(%s): " format, (dev)->name, ## args)
+	DMWARN("(%s): " format, (dev)->target->name, ## args)
 
 #define dmz_dev_debug(dev, format, args...)	\
-	DMDEBUG("(%s): " format, (dev)->name, ## args)
+	DMDEBUG("(%s): " format, (dev)->target->name, ## args)
 
 struct dmz_metadata;
 struct dmz_reclaim;
-- 
2.9.5


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

