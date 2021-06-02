Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 456343981DF
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 08:55:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-O30gRYI7OVKAJzLZm5dfkQ-1; Wed, 02 Jun 2021 02:55:44 -0400
X-MC-Unique: O30gRYI7OVKAJzLZm5dfkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BED6A8030A0;
	Wed,  2 Jun 2021 06:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9981F5D9DE;
	Wed,  2 Jun 2021 06:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AC5D44A59;
	Wed,  2 Jun 2021 06:55:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1526tEZU016712 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 02:55:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF9042084828; Wed,  2 Jun 2021 06:55:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB016208744D
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:55:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD9B185828E
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-314-dfBcr9COPQiCOCc23vA3LA-1; Wed, 02 Jun 2021 02:55:09 -0400
X-MC-Unique: dfBcr9COPQiCOCc23vA3LA-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKmI-0025hI-AR; Wed, 02 Jun 2021 06:54:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:29 +0300
Message-Id: <20210602065345.355274-15-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: [dm-devel] [PATCH 14/30] gdrom: use blk_mq_alloc_disk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 drivers/cdrom/gdrom.c | 45 ++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index c6d8c0f59722..8e1fe75af93f 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -772,53 +772,50 @@ static int probe_gdrom(struct platform_device *devptr)
 		goto probe_fail_no_mem;
 	}
 	probe_gdrom_setupcd();
-	gd.disk = alloc_disk(1);
-	if (!gd.disk) {
-		err = -ENODEV;
-		goto probe_fail_no_disk;
+
+	err = blk_mq_alloc_sq_tag_set(&gd.tag_set, &gdrom_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (err)
+		goto probe_fail_free_cd_info;
+
+	gd.disk = blk_mq_alloc_disk(&gd.tag_set, NULL);
+	if (IS_ERR(gd.disk)) {
+		err = PTR_ERR(gd.disk);
+		goto probe_fail_free_tag_set;
 	}
+	gd.gdrom_rq = gd.disk->queue;
 	probe_gdrom_setupdisk();
 	if (register_cdrom(gd.disk, gd.cd_info)) {
 		err = -ENODEV;
-		goto probe_fail_cdrom_register;
+		goto probe_fail_cleanup_disk;
 	}
 	gd.disk->fops = &gdrom_bdops;
 	gd.disk->events = DISK_EVENT_MEDIA_CHANGE;
 	/* latch on to the interrupt */
 	err = gdrom_set_interrupt_handlers();
 	if (err)
-		goto probe_fail_cmdirq_register;
-
-	gd.gdrom_rq = blk_mq_init_sq_queue(&gd.tag_set, &gdrom_mq_ops, 1,
-				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
-	if (IS_ERR(gd.gdrom_rq)) {
-		err = PTR_ERR(gd.gdrom_rq);
-		gd.gdrom_rq = NULL;
-		goto probe_fail_requestq;
-	}
+		goto probe_fail_cleanup_disk;
 
 	err = probe_gdrom_setupqueue();
 	if (err)
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 
 	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
 	if (!gd.toc) {
 		err = -ENOMEM;
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 	}
 	add_disk(gd.disk);
 	return 0;
 
-probe_fail_toc:
-	blk_cleanup_queue(gd.gdrom_rq);
-	blk_mq_free_tag_set(&gd.tag_set);
-probe_fail_requestq:
+probe_fail_free_irqs:
 	free_irq(HW_EVENT_GDROM_DMA, &gd);
 	free_irq(HW_EVENT_GDROM_CMD, &gd);
-probe_fail_cmdirq_register:
-probe_fail_cdrom_register:
-	del_gendisk(gd.disk);
-probe_fail_no_disk:
+probe_fail_cleanup_disk:
+	blk_cleanup_disk(gd.disk);
+probe_fail_free_tag_set:
+	blk_mq_free_tag_set(&gd.tag_set);
+probe_fail_free_cd_info:
 	kfree(gd.cd_info);
 probe_fail_no_mem:
 	unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

