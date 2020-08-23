Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7108424EC72
	for <lists+dm-devel@lfdr.de>; Sun, 23 Aug 2020 11:31:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-OsX22VfsPVyG6FgK6APh7A-1; Sun, 23 Aug 2020 05:31:05 -0400
X-MC-Unique: OsX22VfsPVyG6FgK6APh7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF4C880EFBF;
	Sun, 23 Aug 2020 09:30:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E105F9D6;
	Sun, 23 Aug 2020 09:30:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34E23180B65D;
	Sun, 23 Aug 2020 09:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07N9UiNj024617 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Aug 2020 05:30:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00E859C049; Sun, 23 Aug 2020 09:30:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F05F9A9E7C
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:30:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C104888BE0
	for <dm-devel@redhat.com>; Sun, 23 Aug 2020 09:30:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-481-FqF6j3qQPoqk_aHVuDncpA-1; Sun, 23 Aug 2020 05:30:37 -0400
X-MC-Unique: FqF6j3qQPoqk_aHVuDncpA-1
Received: from 171.168.43.195.cust.ip.kpnqwest.it ([195.43.168.171]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9m1a-0003LF-G4; Sun, 23 Aug 2020 09:10:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 23 Aug 2020 11:10:43 +0200
Message-Id: <20200823091043.2600261-4-hch@lst.de>
In-Reply-To: <20200823091043.2600261-1-hch@lst.de>
References: <20200823091043.2600261-1-hch@lst.de>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
	nbd@other.debian.org
Subject: [dm-devel] [PATCH 3/3] nvme: don't call revalidate_disk from
	nvme_set_queue_dying
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In nvme_set_queue_dying we really just want to ensure the disk and bdev
sizes are set to zero.  Going through revalidate_disk leads to a somewhat
arcance and complex callchain relying on special behavior in a few
places.  Instead just lift the set_capacity directly to
nvme_set_queue_dying, and rename and move the nvme_mpath_update_disk_size
helper so that we can use it in nvme_set_queue_dying to propagate the
size to the bdev without detours.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 33 +++++++++++++++++++++++----------
 drivers/nvme/host/nvme.h | 13 -------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 88cff309d8e4f0..12dea15527f61a 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -94,21 +94,34 @@ static void nvme_put_subsystem(struct nvme_subsystem *subsys);
 static void nvme_remove_invalid_namespaces(struct nvme_ctrl *ctrl,
 					   unsigned nsid);
 
+static void nvme_update_bdev_size(struct gendisk *disk)
+{
+	struct block_device *bdev = bdget_disk(disk, 0);
+
+	if (bdev) {
+		bd_set_nr_sectors(bdev, get_capacity(disk));
+		bdput(bdev);
+	}
+}
+
+/*
+ * Prepare a queue for teardown.
+ *
+ * This must forcibly unquiesce queues to avoid blocking dispatch, and only set
+ * the capacity to 0 after that to avoid blocking dispatchers that may be
+ * holding bd_butex.  This will end buffered writers dirtying pages that can't
+ * be synced.
+ */
 static void nvme_set_queue_dying(struct nvme_ns *ns)
 {
-	/*
-	 * Revalidating a dead namespace sets capacity to 0. This will end
-	 * buffered writers dirtying pages that can't be synced.
-	 */
 	if (test_and_set_bit(NVME_NS_DEAD, &ns->flags))
 		return;
+
 	blk_set_queue_dying(ns->queue);
-	/* Forcibly unquiesce queues to avoid blocking dispatch */
 	blk_mq_unquiesce_queue(ns->queue);
-	/*
-	 * Revalidate after unblocking dispatchers that may be holding bd_butex
-	 */
-	revalidate_disk(ns->disk);
+
+	set_capacity(ns->disk, 0);
+	nvme_update_bdev_size(ns->disk);
 }
 
 static void nvme_queue_scan(struct nvme_ctrl *ctrl)
@@ -2083,7 +2096,7 @@ static int __nvme_revalidate_disk(struct gendisk *disk, struct nvme_id_ns *id)
 		nvme_update_disk_info(ns->head->disk, ns, id);
 		blk_stack_limits(&ns->head->disk->queue->limits,
 				 &ns->queue->limits, 0);
-		nvme_mpath_update_disk_size(ns->head->disk);
+		nvme_update_bdev_size(ns->head->disk);
 	}
 #endif
 	return 0;
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index ae5cad5a08f411..4cadaea9034ae4 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -659,16 +659,6 @@ static inline void nvme_trace_bio_complete(struct request *req,
 		trace_block_bio_complete(ns->head->disk->queue, req->bio);
 }
 
-static inline void nvme_mpath_update_disk_size(struct gendisk *disk)
-{
-	struct block_device *bdev = bdget_disk(disk, 0);
-
-	if (bdev) {
-		bd_set_nr_sectors(bdev, get_capacity(disk));
-		bdput(bdev);
-	}
-}
-
 extern struct device_attribute dev_attr_ana_grpid;
 extern struct device_attribute dev_attr_ana_state;
 extern struct device_attribute subsys_attr_iopolicy;
@@ -744,9 +734,6 @@ static inline void nvme_mpath_wait_freeze(struct nvme_subsystem *subsys)
 static inline void nvme_mpath_start_freeze(struct nvme_subsystem *subsys)
 {
 }
-static inline void nvme_mpath_update_disk_size(struct gendisk *disk)
-{
-}
 #endif /* CONFIG_NVME_MULTIPATH */
 
 #ifdef CONFIG_BLK_DEV_ZONED
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

