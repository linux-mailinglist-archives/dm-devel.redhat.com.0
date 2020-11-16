Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AF4902B4715
	for <lists+dm-devel@lfdr.de>; Mon, 16 Nov 2020 16:00:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-TJyWiWESMLKJFWY6NoU5HQ-1; Mon, 16 Nov 2020 10:00:20 -0500
X-MC-Unique: TJyWiWESMLKJFWY6NoU5HQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D82F18CBC53;
	Mon, 16 Nov 2020 14:59:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B955DE51;
	Mon, 16 Nov 2020 14:59:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B13B58118;
	Mon, 16 Nov 2020 14:59:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGExMXx015447 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 09:59:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D9AB1002976; Mon, 16 Nov 2020 14:59:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79764110F726
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17FDA8015A3
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-wdrvhld4NcOfVwksrQjUKw-1; Mon, 16 Nov 2020 09:59:17 -0500
X-MC-Unique: wdrvhld4NcOfVwksrQjUKw-1
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyH-0003yd-CW; Mon, 16 Nov 2020 14:59:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:33 +0100
Message-Id: <20201116145809.410558-43-hch@lst.de>
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
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
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [dm-devel] [PATCH 42/78] sd: use __register_blkdev to avoid a
	modprobe for an unregistered dev_t
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch from using blk_register_region to the probe callback passed to
__register_blkdev to disable the request_module call for an unclaimed
dev_t in the SD majors.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/scsi/sd.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a2a4f385833d6c..679c2c02504763 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -630,13 +630,11 @@ static struct scsi_driver sd_template = {
 };
 
 /*
- * Dummy kobj_map->probe function.
- * The default ->probe function will call modprobe, which is
- * pointless as this module is already loaded.
+ * Don't request a new module, as that could deadlock in multipath
+ * environment.
  */
-static struct kobject *sd_default_probe(dev_t devt, int *partno, void *data)
+static void sd_default_probe(dev_t devt)
 {
-	return NULL;
 }
 
 /*
@@ -3525,9 +3523,6 @@ static int sd_remove(struct device *dev)
 
 	free_opal_dev(sdkp->opal_dev);
 
-	blk_register_region(devt, SD_MINORS, NULL,
-			    sd_default_probe, NULL, NULL);
-
 	mutex_lock(&sd_ref_mutex);
 	dev_set_drvdata(dev, NULL);
 	put_device(&sdkp->dev);
@@ -3717,11 +3712,9 @@ static int __init init_sd(void)
 	SCSI_LOG_HLQUEUE(3, printk("init_sd: sd driver entry point\n"));
 
 	for (i = 0; i < SD_MAJORS; i++) {
-		if (register_blkdev(sd_major(i), "sd") != 0)
+		if (__register_blkdev(sd_major(i), "sd", sd_default_probe))
 			continue;
 		majors++;
-		blk_register_region(sd_major(i), SD_MINORS, NULL,
-				    sd_default_probe, NULL, NULL);
 	}
 
 	if (!majors)
@@ -3794,10 +3787,8 @@ static void __exit exit_sd(void)
 
 	class_unregister(&sd_disk_class);
 
-	for (i = 0; i < SD_MAJORS; i++) {
-		blk_unregister_region(sd_major(i), SD_MINORS);
+	for (i = 0; i < SD_MAJORS; i++)
 		unregister_blkdev(sd_major(i), "sd");
-	}
 }
 
 module_init(init_sd);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

