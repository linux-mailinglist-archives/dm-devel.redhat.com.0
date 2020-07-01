Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73A9E210754
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 11:04:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-lC0G_9A7OAu0Q4fdCxxqAA-1; Wed, 01 Jul 2020 05:04:05 -0400
X-MC-Unique: lC0G_9A7OAu0Q4fdCxxqAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC3CE107B7E1;
	Wed,  1 Jul 2020 09:03:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 128C0104B4FA;
	Wed,  1 Jul 2020 09:03:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A4AF6C9C3;
	Wed,  1 Jul 2020 09:03:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06193ZSj011719 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 05:03:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 501D2200ACC4; Wed,  1 Jul 2020 09:03:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C3942156720
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:03:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33DD918A6668
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:03:35 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-302-FVVPa9JFPv63GGyvMDEmUw-1; Wed, 01 Jul 2020 05:03:33 -0400
X-MC-Unique: FVVPa9JFPv63GGyvMDEmUw-1
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYay-000882-6q; Wed, 01 Jul 2020 08:59:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 10:59:32 +0200
Message-Id: <20200701085947.3354405-6-hch@lst.de>
In-Reply-To: <20200701085947.3354405-1-hch@lst.de>
References: <20200701085947.3354405-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [dm-devel] [PATCH 05/20] ps3vram: stop using ->queuedata
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of setting up the queuedata as well just use one private data
field.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3vram.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 821d4d8b1d763e..5a1d1d137c7248 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -587,7 +587,7 @@ static struct bio *ps3vram_do_bio(struct ps3_system_bus_device *dev,
 
 static blk_qc_t ps3vram_make_request(struct request_queue *q, struct bio *bio)
 {
-	struct ps3_system_bus_device *dev = q->queuedata;
+	struct ps3_system_bus_device *dev = bio->bi_disk->private_data;
 	struct ps3vram_priv *priv = ps3_system_bus_get_drvdata(dev);
 	int busy;
 
@@ -745,7 +745,6 @@ static int ps3vram_probe(struct ps3_system_bus_device *dev)
 	}
 
 	priv->queue = queue;
-	queue->queuedata = dev;
 	blk_queue_max_segments(queue, BLK_MAX_SEGMENTS);
 	blk_queue_max_segment_size(queue, BLK_MAX_SEGMENT_SIZE);
 	blk_queue_max_hw_sectors(queue, BLK_SAFE_MAX_SECTORS);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

