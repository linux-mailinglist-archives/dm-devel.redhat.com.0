Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D006A3DFE45
	for <lists+dm-devel@lfdr.de>; Wed,  4 Aug 2021 11:45:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-qJAtXdwVMYiKhncAkz4XAQ-1; Wed, 04 Aug 2021 05:44:59 -0400
X-MC-Unique: qJAtXdwVMYiKhncAkz4XAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0480185302D;
	Wed,  4 Aug 2021 09:44:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DABC10372C1;
	Wed,  4 Aug 2021 09:44:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E119181A3E9;
	Wed,  4 Aug 2021 09:44:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1749ij4q006114 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 05:44:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 218BB112D426; Wed,  4 Aug 2021 09:44:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D80B112D18E
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:44:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67EE989C7DB
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:44:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-i82jOxA6PlONGPBm5D6OFQ-1; Wed, 04 Aug 2021 05:44:40 -0400
X-MC-Unique: i82jOxA6PlONGPBm5D6OFQ-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBDR9-005e3D-Dy; Wed, 04 Aug 2021 09:43:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  4 Aug 2021 11:41:42 +0200
Message-Id: <20210804094147.459763-4-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/8] block: look up holders by bdev
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Invert they way the holder relations are tracked.  This very
slightly reduces the memory overhead for partitioned devices.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             |  4 +++-
 block/holder.c            | 18 +++++++++---------
 fs/block_dev.c            |  3 ---
 include/linux/blk_types.h |  3 ---
 include/linux/genhd.h     |  4 +++-
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index a4817e42f3a3..cd4eab744667 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1289,7 +1289,9 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 	disk_to_dev(disk)->type = &disk_type;
 	device_initialize(disk_to_dev(disk));
 	inc_diskseq(disk);
-
+#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
+	INIT_LIST_HEAD(&disk->slave_bdevs);
+#endif
 	return disk;
 
 out_destroy_part_tbl:
diff --git a/block/holder.c b/block/holder.c
index 960654a71342..11e65d99a9fb 100644
--- a/block/holder.c
+++ b/block/holder.c
@@ -3,7 +3,7 @@
 
 struct bd_holder_disk {
 	struct list_head	list;
-	struct gendisk		*disk;
+	struct block_device	*bdev;
 	int			refcnt;
 };
 
@@ -12,8 +12,8 @@ static struct bd_holder_disk *bd_find_holder_disk(struct block_device *bdev,
 {
 	struct bd_holder_disk *holder;
 
-	list_for_each_entry(holder, &bdev->bd_holder_disks, list)
-		if (holder->disk == disk)
+	list_for_each_entry(holder, &disk->slave_bdevs, list)
+		if (holder->bdev == bdev)
 			return holder;
 	return NULL;
 }
@@ -61,7 +61,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	struct bd_holder_disk *holder;
 	int ret = 0;
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
+	mutex_lock(&disk->open_mutex);
 
 	WARN_ON_ONCE(!bdev->bd_holder);
 
@@ -82,7 +82,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	}
 
 	INIT_LIST_HEAD(&holder->list);
-	holder->disk = disk;
+	holder->bdev = bdev;
 	holder->refcnt = 1;
 
 	ret = add_symlink(disk->slave_dir, bdev_kobj(bdev));
@@ -93,7 +93,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	if (ret)
 		goto out_del;
 
-	list_add(&holder->list, &bdev->bd_holder_disks);
+	list_add(&holder->list, &disk->slave_bdevs);
 	goto out_unlock;
 
 out_del:
@@ -101,7 +101,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 out_free:
 	kfree(holder);
 out_unlock:
-	mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_unlock(&disk->open_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(bd_link_disk_holder);
@@ -120,7 +120,7 @@ void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
 {
 	struct bd_holder_disk *holder;
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
+	mutex_lock(&disk->open_mutex);
 	holder = bd_find_holder_disk(bdev, disk);
 	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
 		del_symlink(disk->slave_dir, bdev_kobj(bdev));
@@ -128,6 +128,6 @@ void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
 		list_del_init(&holder->list);
 		kfree(holder);
 	}
-	mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_unlock(&disk->open_mutex);
 }
 EXPORT_SYMBOL_GPL(bd_unlink_disk_holder);
diff --git a/fs/block_dev.c b/fs/block_dev.c
index ae9651cad923..cc801767a377 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -902,9 +902,6 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
 	bdev->bd_inode = inode;
-#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
-	INIT_LIST_HEAD(&bdev->bd_holder_disks);
-#endif
 	bdev->bd_stats = alloc_percpu(struct disk_stats);
 	if (!bdev->bd_stats) {
 		iput(inode);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 7a4e139d24ef..e92735655684 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -34,9 +34,6 @@ struct block_device {
 	void *			bd_holder;
 	int			bd_holders;
 	bool			bd_write_holder;
-#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
-	struct list_head	bd_holder_disks;
-#endif
 	struct kobject		*bd_holder_dir;
 	u8			bd_partno;
 	spinlock_t		bd_size_lock; /* for bd_inode->i_size updates */
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index e21a91c16a79..0721807d76ee 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -159,7 +159,9 @@ struct gendisk {
 	unsigned open_partitions;	/* number of open partitions */
 
 	struct kobject *slave_dir;
-
+#ifdef CONFIG_BLOCK_HOLDER_DEPRECATED
+	struct list_head slave_bdevs;
+#endif
 	struct timer_rand_state *random;
 	atomic_t sync_io;		/* RAID */
 	struct disk_events *ev;
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

