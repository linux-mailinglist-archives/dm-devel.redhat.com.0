Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C76777572
	for <lists+dm-devel@lfdr.de>; Thu, 10 Aug 2023 12:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691662181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KMirwyeruPLohlSc0wXd/mLOpnCMIIXvNiVsqS+/WYQ=;
	b=JWGcNyYQEsZUsVfIvZ+2dMO7tdhunAW6BZcHuVag/+tN9WQa0CGSd/lABV6UmzKf/0h4LZ
	ryIsL98+UbEpAmTRYwGS/U7/D42f0k6EAAhaSWBM1r7NLSgsRV9q5iuNi01D1tuUbiGuQx
	05qhQhZtgBOEUNAv+v4jiSm8ZCVylk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-xepBQS9yOz-8CHiFHd5STg-1; Thu, 10 Aug 2023 06:09:39 -0400
X-MC-Unique: xepBQS9yOz-8CHiFHd5STg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672FC8DC665;
	Thu, 10 Aug 2023 10:09:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B97A140E96E;
	Thu, 10 Aug 2023 10:09:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F324119465A4;
	Thu, 10 Aug 2023 10:09:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C91971946588
 for <dm-devel@listman.corp.redhat.com>; Thu, 10 Aug 2023 10:09:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8DF111121318; Thu, 10 Aug 2023 10:09:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D72E1121314;
 Thu, 10 Aug 2023 10:09:34 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 3D5D330B9C07; Thu, 10 Aug 2023 10:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 3C09B3F7CF; Thu, 10 Aug 2023 12:09:34 +0200 (CEST)
Date: Thu, 10 Aug 2023 12:09:33 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2dacc73-854-e71c-1746-99b017401c9a@redhat.com>
Message-ID: <10a61c-8c51-11f3-83b-dbffe688d68d@redhat.com>
References: <2dacc73-854-e71c-1746-99b017401c9a@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH v3 3/4] brd: enable discard
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements discard in the brd driver. We use RCU to free the
page, so that if there are any concurrent readers or writes, they won't
touch the page after it is freed.

Calling "call_rcu" for each page is inefficient, so we attempt to batch
multiple pages to a single "call_rcu" call.

Note that we replace "BUG_ON(!page);" with "if (page) ..." in copy_to_brd
- the page can't be NULL under normal circumstances, it can only be NULL
if REQ_OP_WRITE races with REQ_OP_DISCARD. If these two bios race with
each other on the same page, the result is undefined, so we can handle
this race condition just by skipping the copying.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/block/brd.c |  144 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 13 deletions(-)

Index: linux-2.6/drivers/block/brd.c
===================================================================
--- linux-2.6.orig/drivers/block/brd.c
+++ linux-2.6/drivers/block/brd.c
@@ -46,6 +46,8 @@ struct brd_device {
 	u64			brd_nr_pages;
 };
 
+static bool discard;
+
 /*
  * Look up and return a brd's page for a given sector.
  */
@@ -100,6 +102,54 @@ static int brd_insert_page(struct brd_de
 	return ret;
 }
 
+struct free_page_batch {
+	struct rcu_head rcu;
+	struct list_head list;
+};
+
+static void brd_free_page_rcu(struct rcu_head *head)
+{
+	__free_page(container_of(head, struct page, rcu_head));
+}
+
+static void brd_free_pages_rcu(struct rcu_head *head)
+{
+	struct free_page_batch *batch = container_of(head, struct free_page_batch, rcu);
+
+	while (!list_empty(&batch->list)) {
+		struct page *page = list_entry(batch->list.prev, struct page, lru);
+
+		list_del(&page->lru);
+
+		__free_page(page);
+	}
+
+	kfree(batch);
+}
+
+static void brd_free_page(struct brd_device *brd, sector_t sector,
+			  struct free_page_batch **batch)
+{
+	struct page *page;
+	pgoff_t idx;
+
+	idx = sector >> PAGE_SECTORS_SHIFT;
+	page = xa_erase(&brd->brd_pages, idx);
+
+	if (page) {
+		BUG_ON(page->index != idx);
+		if (!*batch) {
+			*batch = kmalloc(sizeof(struct free_page_batch), GFP_NOIO);
+			if (unlikely(!*batch)) {
+				call_rcu(&page->rcu_head, brd_free_page_rcu);
+				return;
+			}
+			INIT_LIST_HEAD(&(*batch)->list);
+		}
+		list_add(&page->lru, &(*batch)->list);
+	}
+}
+
 /*
  * Free all backing store pages and xarray. This must only be called when
  * there are no other users of the device.
@@ -152,11 +202,11 @@ static void copy_to_brd(struct brd_devic
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
 	rcu_read_lock();
 	page = brd_lookup_page(brd, sector);
-	BUG_ON(!page);
-
-	dst = kmap_atomic(page);
-	memcpy(dst + offset, src, copy);
-	kunmap_atomic(dst);
+	if (page) {
+		dst = kmap_atomic(page);
+		memcpy(dst + offset, src, copy);
+		kunmap_atomic(dst);
+	}
 	rcu_read_unlock();
 
 	if (copy < n) {
@@ -165,11 +215,11 @@ static void copy_to_brd(struct brd_devic
 		copy = n - copy;
 		rcu_read_lock();
 		page = brd_lookup_page(brd, sector);
-		BUG_ON(!page);
-
-		dst = kmap_atomic(page);
-		memcpy(dst, src, copy);
-		kunmap_atomic(dst);
+		if (page) {
+			dst = kmap_atomic(page);
+			memcpy(dst, src, copy);
+			kunmap_atomic(dst);
+		}
 		rcu_read_unlock();
 	}
 }
@@ -248,6 +298,34 @@ out:
 	return err;
 }
 
+void brd_do_discard(struct brd_device *brd, struct bio *bio)
+{
+	struct free_page_batch *batch = NULL;
+	sector_t sector, len, front_pad;
+
+	if (unlikely(!discard)) {
+		bio->bi_status = BLK_STS_NOTSUPP;
+		return;
+	}
+
+	sector = bio->bi_iter.bi_sector;
+	len = bio_sectors(bio);
+	front_pad = -sector & (PAGE_SECTORS - 1);
+	sector += front_pad;
+	if (unlikely(len <= front_pad))
+		return;
+	len -= front_pad;
+	len = round_down(len, PAGE_SECTORS);
+	while (len) {
+		brd_free_page(brd, sector, &batch);
+		sector += PAGE_SECTORS;
+		len -= PAGE_SECTORS;
+		cond_resched();
+	}
+	if (batch)
+		call_rcu(&batch->rcu, brd_free_pages_rcu);
+}
+
 static void brd_submit_bio(struct bio *bio)
 {
 	struct brd_device *brd = bio->bi_bdev->bd_disk->private_data;
@@ -280,6 +358,9 @@ static void brd_submit_bio(struct bio *b
 				sector += len >> SECTOR_SHIFT;
 			}
 			break;
+		case REQ_OP_DISCARD:
+			brd_do_discard(brd, bio);
+			break;
 		default:
 			bio->bi_status = BLK_STS_NOTSUPP;
 			break;
@@ -293,6 +374,40 @@ static const struct block_device_operati
 	.submit_bio =		brd_submit_bio,
 };
 
+static LIST_HEAD(brd_devices);
+static struct dentry *brd_debugfs_dir;
+
+static void brd_set_discard_limits(struct brd_device *brd)
+{
+	struct request_queue *queue = brd->brd_disk->queue;
+	if (discard) {
+		queue->limits.discard_granularity = PAGE_SIZE;
+		blk_queue_max_discard_sectors(queue, round_down(UINT_MAX, PAGE_SECTORS));
+	} else {
+		queue->limits.discard_granularity = 0;
+		blk_queue_max_discard_sectors(queue, 0);
+	}
+}
+
+static int discard_set_bool(const char *val, const struct kernel_param *kp)
+{
+	struct brd_device *brd;
+
+	int r = param_set_bool(val, kp);
+	if (r)
+		return r;
+
+	list_for_each_entry(brd, &brd_devices, brd_list)
+		brd_set_discard_limits(brd);
+
+	return 0;
+}
+
+static const struct kernel_param_ops discard_ops = {
+	.set = discard_set_bool,
+	.get = param_get_bool,
+};
+
 /*
  * And now the modules code and kernel interface.
  */
@@ -308,6 +423,10 @@ static int max_part = 1;
 module_param(max_part, int, 0444);
 MODULE_PARM_DESC(max_part, "Num Minors to reserve between devices");
 
+static bool discard = false;
+module_param_cb(discard, &discard_ops, &discard, 0644);
+MODULE_PARM_DESC(discard, "Support discard");
+
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_BLOCKDEV_MAJOR(RAMDISK_MAJOR);
 MODULE_ALIAS("rd");
@@ -326,9 +445,6 @@ __setup("ramdisk_size=", ramdisk_size);
  * The device scheme is derived from loop.c. Keep them in synch where possible
  * (should share code eventually).
  */
-static LIST_HEAD(brd_devices);
-static struct dentry *brd_debugfs_dir;
-
 static int brd_alloc(int i)
 {
 	struct brd_device *brd;
@@ -373,6 +489,8 @@ static int brd_alloc(int i)
 	 */
 	blk_queue_physical_block_size(disk->queue, PAGE_SIZE);
 
+	brd_set_discard_limits(brd);
+
 	/* Tell the block layer that this is not a rotational device */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
 	blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, disk->queue);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

