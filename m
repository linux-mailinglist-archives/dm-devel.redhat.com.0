Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 265743981EB
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 08:56:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-xGJXPjcjOieSPEz-FjTy7Q-1; Wed, 02 Jun 2021 02:56:05 -0400
X-MC-Unique: xGJXPjcjOieSPEz-FjTy7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 054C68030A1;
	Wed,  2 Jun 2021 06:55:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D22F41001281;
	Wed,  2 Jun 2021 06:55:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88BAE180BAB6;
	Wed,  2 Jun 2021 06:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1526ttZL016852 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 02:55:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 060F21033C7C; Wed,  2 Jun 2021 06:55:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01AF1112CA38
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:55:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41CB7857AA4
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-239-LpKSq1lFNTCqrPkNQDYV6A-1; Wed, 02 Jun 2021 02:55:49 -0400
X-MC-Unique: LpKSq1lFNTCqrPkNQDYV6A-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKms-00269K-Qr; Wed, 02 Jun 2021 06:55:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:37 +0300
Message-Id: <20210602065345.355274-23-hch@lst.de>
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jack Wang <jinpu.wang@ionos.com>, Tim Waugh <tim@cyberelk.net>,
	linux-s390@vger.kernel.org, Alex Dubov <oakad@yahoo.com>,
	Richard Weinberger <richard@nod.at>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
	Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Geoff Levand <geoff@infradead.org>, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [dm-devel] [PATCH 22/30] rbd: use blk_mq_alloc_disk and
	blk_cleanup_disk
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

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 52 ++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index bbb88eb009e0..531d390902dd 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4750,9 +4750,8 @@ static blk_status_t rbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 
 static void rbd_free_disk(struct rbd_device *rbd_dev)
 {
-	blk_cleanup_queue(rbd_dev->disk->queue);
+	blk_cleanup_disk(rbd_dev->disk);
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-	put_disk(rbd_dev->disk);
 	rbd_dev->disk = NULL;
 }
 
@@ -4922,22 +4921,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
 	int err;
 
-	/* create gendisk info */
-	disk = alloc_disk(single_major ?
-			  (1 << RBD_SINGLE_MAJOR_PART_SHIFT) :
-			  RBD_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
-
-	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
-		 rbd_dev->dev_id);
-	disk->major = rbd_dev->major;
-	disk->first_minor = rbd_dev->minor;
-	if (single_major)
-		disk->flags |= GENHD_FL_EXT_DEVT;
-	disk->fops = &rbd_bd_ops;
-	disk->private_data = rbd_dev;
-
 	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
 	rbd_dev->tag_set.ops = &rbd_mq_ops;
 	rbd_dev->tag_set.queue_depth = rbd_dev->opts->queue_depth;
@@ -4948,13 +4931,26 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 
 	err = blk_mq_alloc_tag_set(&rbd_dev->tag_set);
 	if (err)
-		goto out_disk;
+		return err;
 
-	q = blk_mq_init_queue(&rbd_dev->tag_set);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
+	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, rbd_dev);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_tag_set;
 	}
+	q = disk->queue;
+
+	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
+		 rbd_dev->dev_id);
+	disk->major = rbd_dev->major;
+	disk->first_minor = rbd_dev->minor;
+	if (single_major) {
+		disk->minors = (1 << RBD_SINGLE_MAJOR_PART_SHIFT);
+		disk->flags |= GENHD_FL_EXT_DEVT;
+	} else {
+		disk->minors = RBD_MINORS_PER_MAJOR;
+	}
+	disk->fops = &rbd_bd_ops;
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
@@ -4976,21 +4972,11 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
 
-	/*
-	 * disk_release() expects a queue ref from add_disk() and will
-	 * put it.  Hold an extra ref until add_disk() is called.
-	 */
-	WARN_ON(!blk_get_queue(q));
-	disk->queue = q;
-	q->queuedata = rbd_dev;
-
 	rbd_dev->disk = disk;
 
 	return 0;
 out_tag_set:
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-out_disk:
-	put_disk(disk);
 	return err;
 }
 
@@ -7088,8 +7074,6 @@ static ssize_t do_rbd_add(struct bus_type *bus,
 		goto err_out_image_lock;
 
 	device_add_disk(&rbd_dev->dev, rbd_dev->disk, NULL);
-	/* see rbd_init_disk() */
-	blk_put_queue(rbd_dev->disk->queue);
 
 	spin_lock(&rbd_dev_list_lock);
 	list_add_tail(&rbd_dev->node, &rbd_dev_list);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

