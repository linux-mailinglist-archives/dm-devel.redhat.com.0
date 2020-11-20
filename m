Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB6D2BA6A3
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 10:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605866149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9birelJXHpdHWkgaiqbh6Mzj7kLwmO5v2vUXCE4Ypqg=;
	b=QiFtffBwRE/dkDRc/QKuyJR1xaXzewm8yDkeFQWBVz1kDDQzy2sQwY/C9D75zZIGLgryra
	OYDm4PQbud9tc35iAWTKWs6t9lWpFFY/U6zGK0iZSCgdmZXeJ+0ghw16VdMg5eoZOaxYsb
	BvUzfstBVzlc7LXC323z3qYxvGWNa4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-EFnr4mJ6PXyhR0dm87yE8g-1; Fri, 20 Nov 2020 04:55:46 -0500
X-MC-Unique: EFnr4mJ6PXyhR0dm87yE8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EEF6879500;
	Fri, 20 Nov 2020 09:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0A160853;
	Fri, 20 Nov 2020 09:55:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B31F74EE7F;
	Fri, 20 Nov 2020 09:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AK9tMtf027302 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 04:55:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3466960C0F; Fri, 20 Nov 2020 09:55:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD7360BE2;
	Fri, 20 Nov 2020 09:55:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AK9tDcf001257; Fri, 20 Nov 2020 04:55:13 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AK9tDGq001253; Fri, 20 Nov 2020 04:55:13 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 20 Nov 2020 04:55:12 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>,
	John Dorminy <jdorminy@redhat.com>
Message-ID: <alpine.LRH.2.02.2011200451180.28876@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-settings: fix a possible integer overflow in
 blk_queue_max_hw_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix a possible overflow due to shift left.
Also, replace the constant "9" with SECTOR_SHIFT.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 block/blk-settings.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: linux-2.6/block/blk-settings.c
===================================================================
--- linux-2.6.orig/block/blk-settings.c	2020-11-19 21:20:18.000000000 +0100
+++ linux-2.6/block/blk-settings.c	2020-11-20 10:50:15.000000000 +0100
@@ -151,8 +151,8 @@ void blk_queue_max_hw_sectors(struct req
 	struct queue_limits *limits = &q->limits;
 	unsigned int max_sectors;
 
-	if ((max_hw_sectors << 9) < PAGE_SIZE) {
-		max_hw_sectors = 1 << (PAGE_SHIFT - 9);
+	if (max_hw_sectors < 1 << (PAGE_SHIFT - SECTOR_SHIFT)) {
+		max_hw_sectors = 1 << (PAGE_SHIFT - SECTOR_SHIFT);
 		printk(KERN_INFO "%s: set to minimum %d\n",
 		       __func__, max_hw_sectors);
 	}
@@ -161,7 +161,7 @@ void blk_queue_max_hw_sectors(struct req
 	max_sectors = min_not_zero(max_hw_sectors, limits->max_dev_sectors);
 	max_sectors = min_t(unsigned int, max_sectors, BLK_DEF_MAX_SECTORS);
 	limits->max_sectors = max_sectors;
-	q->backing_dev_info->io_pages = max_sectors >> (PAGE_SHIFT - 9);
+	q->backing_dev_info->io_pages = max_sectors >> (PAGE_SHIFT - SECTOR_SHIFT);
 }
 EXPORT_SYMBOL(blk_queue_max_hw_sectors);
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

