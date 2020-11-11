Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D54D2AEC01
	for <lists+dm-devel@lfdr.de>; Wed, 11 Nov 2020 09:32:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-tWleALvaMoSgn7_Xonw_Ww-1; Wed, 11 Nov 2020 03:32:24 -0500
X-MC-Unique: tWleALvaMoSgn7_Xonw_Ww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925B4804741;
	Wed, 11 Nov 2020 08:32:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CE806115F;
	Wed, 11 Nov 2020 08:32:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26EC1181A06C;
	Wed, 11 Nov 2020 08:32:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AB8WFmE026559 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Nov 2020 03:32:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 757E7207A80F; Wed, 11 Nov 2020 08:32:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E677207A77B
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 08:32:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AE98185A7A2
	for <dm-devel@redhat.com>; Wed, 11 Nov 2020 08:32:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-rpcDlUGTPZ6ORJvS93K2Nw-1; Wed, 11 Nov 2020 03:32:09 -0500
X-MC-Unique: rpcDlUGTPZ6ORJvS93K2Nw-1
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTB-0007aj-13; Wed, 11 Nov 2020 08:27:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 11 Nov 2020 09:26:42 +0100
Message-Id: <20201111082658.3401686-9-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: [dm-devel] [PATCH 08/24] nbd: move the task_recv check into
	nbd_size_update
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

nbd_size_update is about to acquire a few more callers, so lift the check
into the function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index f618688a196654..58b7090dcbd832 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -299,8 +299,11 @@ static void nbd_size_clear(struct nbd_device *nbd)
 static void nbd_size_update(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
-	struct block_device *bdev = bdget_disk(nbd->disk, 0);
 	sector_t nr_sectors = config->bytesize >> 9;
+	struct block_device *bdev;
+
+	if (!nbd->task_recv)
+		return;
 
 	if (config->flags & NBD_FLAG_SEND_TRIM) {
 		nbd->disk->queue->limits.discard_granularity = config->blksize;
@@ -309,7 +312,9 @@ static void nbd_size_update(struct nbd_device *nbd)
 	}
 	blk_queue_logical_block_size(nbd->disk->queue, config->blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, config->blksize);
+
 	set_capacity(nbd->disk, nr_sectors);
+	bdev = bdget_disk(nbd->disk, 0);
 	if (bdev) {
 		if (bdev->bd_disk)
 			bd_set_nr_sectors(bdev, nr_sectors);
@@ -326,8 +331,7 @@ static void nbd_size_set(struct nbd_device *nbd, loff_t blocksize,
 	struct nbd_config *config = nbd->config;
 	config->blksize = blocksize;
 	config->bytesize = blocksize * nr_blocks;
-	if (nbd->task_recv != NULL)
-		nbd_size_update(nbd);
+	nbd_size_update(nbd);
 }
 
 static void nbd_complete_rq(struct request *req)
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

