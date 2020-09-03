Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 893C225BABF
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:02:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-Ghk3u7E-Ma2yrqJrlrT49A-1; Thu, 03 Sep 2020 02:02:26 -0400
X-MC-Unique: Ghk3u7E-Ma2yrqJrlrT49A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A328C100671C;
	Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8270D672CF;
	Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B7C618037C6;
	Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08362FfA004040 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 02:02:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 995F12023499; Thu,  3 Sep 2020 06:02:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 950FE202348A
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B95018AE948
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:15 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-XVeKKs6vNfmjThouyLeSiA-1; Thu, 03 Sep 2020 02:02:13 -0400
X-MC-Unique: XVeKKs6vNfmjThouyLeSiA-1
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzj-0007Op-VV; Thu, 03 Sep 2020 05:41:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:01 +0200
Message-Id: <20200903054104.228829-7-hch@lst.de>
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: [dm-devel] [PATCH 6/9] drbd: don't set ->bd_contains
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The ->bd_contains field is set by __blkdev_get and drivers have no
business manipulating it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 04b6bde9419d2a..bd8b129196d49a 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2766,8 +2766,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	disk->private_data = device;
 
 	device->this_bdev = bdget(MKDEV(DRBD_MAJOR, minor));
-	/* we have no partitions. we contain only ourselves. */
-	device->this_bdev->bd_contains = device->this_bdev;
 
 	blk_queue_write_cache(q, true, true);
 	/* Setting the max_hw_sectors to an odd value of 8kibyte here
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

