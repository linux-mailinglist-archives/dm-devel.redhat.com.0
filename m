Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 262023981EE
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 08:56:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-NFlLCE3ONwWPIzQkSoAM2A-1; Wed, 02 Jun 2021 02:56:12 -0400
X-MC-Unique: NFlLCE3ONwWPIzQkSoAM2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6240801B16;
	Wed,  2 Jun 2021 06:56:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4892E2D9;
	Wed,  2 Jun 2021 06:56:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A83E1813CA6;
	Wed,  2 Jun 2021 06:56:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1526u3Mq016980 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 02:56:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF24121602AA; Wed,  2 Jun 2021 06:56:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9FBC21602A6
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:56:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADA918A0178
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 06:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-hOIm1mqlNaOtfJdyrREfeQ-1; Wed, 02 Jun 2021 02:55:59 -0400
X-MC-Unique: hOIm1mqlNaOtfJdyrREfeQ-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKn1-0026HM-J4; Wed, 02 Jun 2021 06:55:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:39 +0300
Message-Id: <20210602065345.355274-25-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: [dm-devel] [PATCH 24/30] sx8: use blk_mq_alloc_disk and
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 drivers/block/sx8.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 2cdf2771f8e8..f01f860b0e62 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1343,32 +1343,25 @@ static int carm_init_disk(struct carm_host *host, unsigned int port_no)
 {
 	struct carm_port *port = &host->port[port_no];
 	struct gendisk *disk;
-	struct request_queue *q;
 
 	port->host = host;
 	port->port_no = port_no;
 
-	disk = alloc_disk(CARM_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
+	disk = blk_mq_alloc_disk(&host->tag_set, port);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	port->disk = disk;
 	sprintf(disk->disk_name, DRV_NAME "/%u",
 		(unsigned int)host->id * CARM_MAX_PORTS + port_no);
 	disk->major = host->major;
 	disk->first_minor = port_no * CARM_MINORS_PER_MAJOR;
+	disk->minors = CARM_MINORS_PER_MAJOR;
 	disk->fops = &carm_bd_ops;
 	disk->private_data = port;
 
-	q = blk_mq_init_queue(&host->tag_set);
-	if (IS_ERR(q))
-		return PTR_ERR(q);
-
-	blk_queue_max_segments(q, CARM_MAX_REQ_SG);
-	blk_queue_segment_boundary(q, CARM_SG_BOUNDARY);
-
-	q->queuedata = port;
-	disk->queue = q;
+	blk_queue_max_segments(disk->queue, CARM_MAX_REQ_SG);
+	blk_queue_segment_boundary(disk->queue, CARM_SG_BOUNDARY);
 	return 0;
 }
 
@@ -1382,9 +1375,7 @@ static void carm_free_disk(struct carm_host *host, unsigned int port_no)
 
 	if (disk->flags & GENHD_FL_UP)
 		del_gendisk(disk);
-	if (disk->queue)
-		blk_cleanup_queue(disk->queue);
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 }
 
 static int carm_init_shm(struct carm_host *host)
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

