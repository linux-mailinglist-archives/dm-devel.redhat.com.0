Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6E232B4732
	for <lists+dm-devel@lfdr.de>; Mon, 16 Nov 2020 16:01:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-2aqQFH01Otya40eezxBcXg-1; Mon, 16 Nov 2020 10:00:18 -0500
X-MC-Unique: 2aqQFH01Otya40eezxBcXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6889AF097;
	Mon, 16 Nov 2020 14:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2A05C63A;
	Mon, 16 Nov 2020 14:59:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3566B58118;
	Mon, 16 Nov 2020 14:59:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGExPh5015459 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 09:59:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 49EEE2157F5E; Mon, 16 Nov 2020 14:59:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 452EC2157F4F
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3BDB811E9D
	for <dm-devel@redhat.com>; Mon, 16 Nov 2020 14:59:22 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-562-QNNph5hZNRysXWbHZGBylQ-1; Mon, 16 Nov 2020 09:59:18 -0500
X-MC-Unique: QNNph5hZNRysXWbHZGBylQ-1
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyL-0003zc-NO; Mon, 16 Nov 2020 14:59:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:36 +0100
Message-Id: <20201116145809.410558-46-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: [dm-devel] [PATCH 45/78] md: use __register_blkdev to allocate
	devices on demand
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the simpler mechanism attached to major_name to allocate a md device
when a currently unregistered minor is accessed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/md.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index fa31b71a72a35d..b2edf5e0f965b5 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5764,11 +5764,12 @@ static int md_alloc(dev_t dev, char *name)
 	return error;
 }
 
-static struct kobject *md_probe(dev_t dev, int *part, void *data)
+static void md_probe(dev_t dev)
 {
+	if (MAJOR(dev) == MD_MAJOR && MINOR(dev) >= 512)
+		return;
 	if (create_on_open)
 		md_alloc(dev, NULL);
-	return NULL;
 }
 
 static int add_named_array(const char *val, const struct kernel_param *kp)
@@ -6532,7 +6533,7 @@ static void autorun_devices(int part)
 			break;
 		}
 
-		md_probe(dev, NULL, NULL);
+		md_probe(dev);
 		mddev = mddev_find(dev);
 		if (!mddev || !mddev->gendisk) {
 			if (mddev)
@@ -9563,18 +9564,15 @@ static int __init md_init(void)
 	if (!md_rdev_misc_wq)
 		goto err_rdev_misc_wq;
 
-	if ((ret = register_blkdev(MD_MAJOR, "md")) < 0)
+	ret = __register_blkdev(MD_MAJOR, "md", md_probe);
+	if (ret < 0)
 		goto err_md;
 
-	if ((ret = register_blkdev(0, "mdp")) < 0)
+	ret = __register_blkdev(0, "mdp", md_probe);
+	if (ret < 0)
 		goto err_mdp;
 	mdp_major = ret;
 
-	blk_register_region(MKDEV(MD_MAJOR, 0), 512, THIS_MODULE,
-			    md_probe, NULL, NULL);
-	blk_register_region(MKDEV(mdp_major, 0), 1UL<<MINORBITS, THIS_MODULE,
-			    md_probe, NULL, NULL);
-
 	register_reboot_notifier(&md_notifier);
 	raid_table_header = register_sysctl_table(raid_root_table);
 
@@ -9841,9 +9839,6 @@ static __exit void md_exit(void)
 	struct list_head *tmp;
 	int delay = 1;
 
-	blk_unregister_region(MKDEV(MD_MAJOR,0), 512);
-	blk_unregister_region(MKDEV(mdp_major,0), 1U << MINORBITS);
-
 	unregister_blkdev(MD_MAJOR,"md");
 	unregister_blkdev(mdp_major, "mdp");
 	unregister_reboot_notifier(&md_notifier);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

