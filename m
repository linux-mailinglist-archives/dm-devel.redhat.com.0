Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 842CF3982AE
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 09:07:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-B-nSZIrYPzq4FsaL250F7w-1; Wed, 02 Jun 2021 03:07:48 -0400
X-MC-Unique: B-nSZIrYPzq4FsaL250F7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640E76D586;
	Wed,  2 Jun 2021 07:07:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3185F1001281;
	Wed,  2 Jun 2021 07:07:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0185D44A5A;
	Wed,  2 Jun 2021 07:07:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15275lu5018368 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 03:05:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C52D112CA38; Wed,  2 Jun 2021 07:05:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 080D3112CA34
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 07:05:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EA33182508B
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 07:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-WeLmDvzXOKaWuJERpMYcTw-1; Wed, 02 Jun 2021 03:05:41 -0400
X-MC-Unique: WeLmDvzXOKaWuJERpMYcTw-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlW-0025KS-9M; Wed, 02 Jun 2021 06:54:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:19 +0300
Message-Id: <20210602065345.355274-5-hch@lst.de>
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
Subject: [dm-devel] [PATCH 04/30] virtio-blk: use blk_mq_alloc_disk
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index b9fa3ef5b57c..e4bd3b1fc3c2 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -749,13 +749,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vblk;
 
-	/* FIXME: How many partitions?  How long is a piece of string? */
-	vblk->disk = alloc_disk(1 << PART_BITS);
-	if (!vblk->disk) {
-		err = -ENOMEM;
-		goto out_free_vq;
-	}
-
 	/* Default queue sizing is to fill the ring. */
 	if (likely(!virtblk_queue_depth)) {
 		queue_depth = vblk->vqs[0].vq->num_free;
@@ -779,21 +772,20 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 	err = blk_mq_alloc_tag_set(&vblk->tag_set);
 	if (err)
-		goto out_put_disk;
+		goto out_free_vq;
 
-	q = blk_mq_init_queue(&vblk->tag_set);
-	if (IS_ERR(q)) {
-		err = -ENOMEM;
+	vblk->disk = blk_mq_alloc_disk(&vblk->tag_set, vblk);
+	if (IS_ERR(vblk->disk)) {
+		err = PTR_ERR(vblk->disk);
 		goto out_free_tags;
 	}
-	vblk->disk->queue = q;
-
-	q->queuedata = vblk;
+	q = vblk->disk->queue;
 
 	virtblk_name_format("vd", index, vblk->disk->disk_name, DISK_NAME_LEN);
 
 	vblk->disk->major = major;
 	vblk->disk->first_minor = index_to_minor(index);
+	vblk->disk->minors = 1 << PART_BITS;
 	vblk->disk->private_data = vblk;
 	vblk->disk->fops = &virtblk_fops;
 	vblk->disk->flags |= GENHD_FL_EXT_DEVT;
@@ -892,8 +884,6 @@ static int virtblk_probe(struct virtio_device *vdev)
 
 out_free_tags:
 	blk_mq_free_tag_set(&vblk->tag_set);
-out_put_disk:
-	put_disk(vblk->disk);
 out_free_vq:
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
@@ -913,8 +903,7 @@ static void virtblk_remove(struct virtio_device *vdev)
 	flush_work(&vblk->config_work);
 
 	del_gendisk(vblk->disk);
-	blk_cleanup_queue(vblk->disk->queue);
-
+	blk_cleanup_disk(vblk->disk);
 	blk_mq_free_tag_set(&vblk->tag_set);
 
 	mutex_lock(&vblk->vdev_mutex);
@@ -925,7 +914,6 @@ static void virtblk_remove(struct virtio_device *vdev)
 	/* Virtqueues are stopped, nothing can use vblk->vdev anymore. */
 	vblk->vdev = NULL;
 
-	put_disk(vblk->disk);
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

