Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3742AEC05
	for <lists+dm-devel@lfdr.de>; Wed, 11 Nov 2020 09:32:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-mNa9yWtBNTW3hVwYYB0S9A-1; Wed, 11 Nov 2020 03:32:30 -0500
X-MC-Unique: mNa9yWtBNTW3hVwYYB0S9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77509802B72;
	Wed, 11 Nov 2020 08:32:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 557916115F;
	Wed, 11 Nov 2020 08:32:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F34658103;
	Wed, 11 Nov 2020 08:32:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB8WL0A026594 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 03:32:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F41DB350B; Wed, 11 Nov 2020 08:32:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07396B5531
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 08:32:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07B5E102F227
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 08:32:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-hbn78n4TPXGgDOOuuR0IAg-1; Wed, 11 Nov 2020 03:32:15 -0500
X-MC-Unique: hbn78n4TPXGgDOOuuR0IAg-1
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTD-0007b7-Eu; Wed, 11 Nov 2020 08:27:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 11 Nov 2020 09:26:44 +0100
Message-Id: <20201111082658.3401686-11-hch@lst.de>
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [dm-devel] [PATCH 10/24] nbd: validate the block size in
	nbd_set_size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the validation of the block from the callers into nbd_set_size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 47 +++++++++++++++------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index eb8a5da48ad75a..327060e01ad58e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -296,16 +296,21 @@ static void nbd_size_clear(struct nbd_device *nbd)
 	}
 }
 
-static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
 	struct block_device *bdev;
 
+	if (!blksize)
+		blksize = NBD_DEF_BLKSIZE;
+	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
+		return -EINVAL;
+
 	nbd->config->bytesize = bytesize;
 	nbd->config->blksize = blksize;
 
 	if (!nbd->task_recv)
-		return;
+		return 0;
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = blksize;
@@ -325,6 +330,7 @@ static void nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		bdput(bdev);
 	}
 	kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
+	return 0;
 }
 
 static void nbd_complete_rq(struct request *req)
@@ -1304,8 +1310,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	nbd_set_size(nbd, config->bytesize, config->blksize);
-	return error;
+	return nbd_set_size(nbd, config->bytesize, config->blksize);
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
@@ -1347,14 +1352,6 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 		nbd_config_put(nbd);
 }
 
-static bool nbd_is_valid_blksize(unsigned long blksize)
-{
-	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
-	    blksize > PAGE_SIZE)
-		return false;
-	return true;
-}
-
 static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 {
 	nbd->tag_set.timeout = timeout * HZ;
@@ -1379,19 +1376,12 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
-		if (!arg)
-			arg = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(arg))
-			return -EINVAL;
-		nbd_set_size(nbd, config->bytesize, arg);
-		return 0;
+		return nbd_set_size(nbd, config->bytesize, arg);
 	case NBD_SET_SIZE:
-		nbd_set_size(nbd, arg, config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg, config->blksize);
 	case NBD_SET_SIZE_BLOCKS:
-		nbd_set_size(nbd, arg * config->blksize,
-			     config->blksize);
-		return 0;
+		return nbd_set_size(nbd, arg * config->blksize,
+				    config->blksize);
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
 		return 0;
@@ -1808,18 +1798,11 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 	if (info->attrs[NBD_ATTR_SIZE_BYTES])
 		bytes = nla_get_u64(info->attrs[NBD_ATTR_SIZE_BYTES]);
 
-	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
+	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES])
 		bsize = nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
-		if (!bsize)
-			bsize = NBD_DEF_BLKSIZE;
-		if (!nbd_is_valid_blksize(bsize)) {
-			printk(KERN_ERR "Invalid block size %llu\n", bsize);
-			return -EINVAL;
-		}
-	}
 
 	if (bytes != config->bytesize || bsize != config->blksize)
-		nbd_set_size(nbd, bytes, bsize);
+		return nbd_set_size(nbd, bytes, bsize);
 	return 0;
 }
 
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

