Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 524C03981F5
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 08:56:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-jY6fl-yhNfe-naGU0DVWEA-1; Wed, 02 Jun 2021 02:56:23 -0400
X-MC-Unique: jY6fl-yhNfe-naGU0DVWEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CE65501E1;
	Wed,  2 Jun 2021 06:56:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4AF687FD;
	Wed,  2 Jun 2021 06:56:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F112018095C4;
	Wed,  2 Jun 2021 06:56:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1526uCd0017099 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 02:56:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB7EEF41DA; Wed,  2 Jun 2021 06:56:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1631F41D7
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45BF785CBC6
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-321-4mR2NhsMPyqkM4sI9MuwyQ-1; Wed, 02 Jun 2021 02:56:02 -0400
X-MC-Unique: 4mR2NhsMPyqkM4sI9MuwyQ-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKn5-0026La-Sd; Wed, 02 Jun 2021 06:55:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:40 +0300
Message-Id: <20210602065345.355274-26-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [dm-devel] [PATCH 25/30] xen-blkfront: use blk_mq_alloc_disk and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 drivers/block/xen-blkfront.c | 96 +++++++++++++++---------------------
 1 file changed, 39 insertions(+), 57 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index f2c1aedcdf5a..8d49f8fa98bb 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -968,48 +968,6 @@ static void blkif_set_queue_limits(struct blkfront_info *info)
 	blk_queue_dma_alignment(rq, 511);
 }
 
-static int xlvbd_init_blk_queue(struct gendisk *gd, u16 sector_size,
-				unsigned int physical_sector_size)
-{
-	struct request_queue *rq;
-	struct blkfront_info *info = gd->private_data;
-
-	memset(&info->tag_set, 0, sizeof(info->tag_set));
-	info->tag_set.ops = &blkfront_mq_ops;
-	info->tag_set.nr_hw_queues = info->nr_rings;
-	if (HAS_EXTRA_REQ && info->max_indirect_segments == 0) {
-		/*
-		 * When indirect descriptior is not supported, the I/O request
-		 * will be split between multiple request in the ring.
-		 * To avoid problems when sending the request, divide by
-		 * 2 the depth of the queue.
-		 */
-		info->tag_set.queue_depth =  BLK_RING_SIZE(info) / 2;
-	} else
-		info->tag_set.queue_depth = BLK_RING_SIZE(info);
-	info->tag_set.numa_node = NUMA_NO_NODE;
-	info->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
-	info->tag_set.cmd_size = sizeof(struct blkif_req);
-	info->tag_set.driver_data = info;
-
-	if (blk_mq_alloc_tag_set(&info->tag_set))
-		return -EINVAL;
-	rq = blk_mq_init_queue(&info->tag_set);
-	if (IS_ERR(rq)) {
-		blk_mq_free_tag_set(&info->tag_set);
-		return PTR_ERR(rq);
-	}
-
-	rq->queuedata = info;
-	info->rq = gd->queue = rq;
-	info->gd = gd;
-	info->sector_size = sector_size;
-	info->physical_sector_size = physical_sector_size;
-	blkif_set_queue_limits(info);
-
-	return 0;
-}
-
 static const char *flush_info(struct blkfront_info *info)
 {
 	if (info->feature_flush && info->feature_fua)
@@ -1146,12 +1104,36 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 
 	err = xlbd_reserve_minors(minor, nr_minors);
 	if (err)
-		goto out;
+		return err;
 	err = -ENODEV;
 
-	gd = alloc_disk(nr_minors);
-	if (gd == NULL)
-		goto release;
+	memset(&info->tag_set, 0, sizeof(info->tag_set));
+	info->tag_set.ops = &blkfront_mq_ops;
+	info->tag_set.nr_hw_queues = info->nr_rings;
+	if (HAS_EXTRA_REQ && info->max_indirect_segments == 0) {
+		/*
+		 * When indirect descriptior is not supported, the I/O request
+		 * will be split between multiple request in the ring.
+		 * To avoid problems when sending the request, divide by
+		 * 2 the depth of the queue.
+		 */
+		info->tag_set.queue_depth =  BLK_RING_SIZE(info) / 2;
+	} else
+		info->tag_set.queue_depth = BLK_RING_SIZE(info);
+	info->tag_set.numa_node = NUMA_NO_NODE;
+	info->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	info->tag_set.cmd_size = sizeof(struct blkif_req);
+	info->tag_set.driver_data = info;
+
+	err = blk_mq_alloc_tag_set(&info->tag_set);
+	if (err)
+		goto out_release_minors;
+
+	gd = blk_mq_alloc_disk(&info->tag_set, info);
+	if (IS_ERR(gd)) {
+		err = PTR_ERR(gd);
+		goto out_free_tag_set;
+	}
 
 	strcpy(gd->disk_name, DEV_NAME);
 	ptr = encode_disk_name(gd->disk_name + sizeof(DEV_NAME) - 1, offset);
@@ -1164,14 +1146,16 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 
 	gd->major = XENVBD_MAJOR;
 	gd->first_minor = minor;
+	gd->minors = nr_minors;
 	gd->fops = &xlvbd_block_fops;
 	gd->private_data = info;
 	set_capacity(gd, capacity);
 
-	if (xlvbd_init_blk_queue(gd, sector_size, physical_sector_size)) {
-		del_gendisk(gd);
-		goto release;
-	}
+	info->rq = gd->queue;
+	info->gd = gd;
+	info->sector_size = sector_size;
+	info->physical_sector_size = physical_sector_size;
+	blkif_set_queue_limits(info);
 
 	xlvbd_flush(info);
 
@@ -1186,9 +1170,10 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 
 	return 0;
 
- release:
+out_free_tag_set:
+	blk_mq_free_tag_set(&info->tag_set);
+out_release_minors:
 	xlbd_release_minors(minor, nr_minors);
- out:
 	return err;
 }
 
@@ -1217,12 +1202,9 @@ static void xlvbd_release_gendisk(struct blkfront_info *info)
 	nr_minors = info->gd->minors;
 	xlbd_release_minors(minor, nr_minors);
 
-	blk_cleanup_queue(info->rq);
-	blk_mq_free_tag_set(&info->tag_set);
-	info->rq = NULL;
-
-	put_disk(info->gd);
+	blk_cleanup_disk(info->gd);
 	info->gd = NULL;
+	blk_mq_free_tag_set(&info->tag_set);
 }
 
 /* Already hold rinfo->ring_lock. */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

