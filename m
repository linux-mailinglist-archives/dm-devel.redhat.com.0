Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89298568076
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 09:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657093894;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e9B+6ZjSYeMqtDy0txzIb8o+uycLhAkt4Kki/SdFDoI=;
	b=fFuWBlpdheflkx7RHdc8UhZTQYtCeh7RlhkwG6EdA29ZzWvDdKGVl3VKYWzZRgi65HXX7W
	2f5/C/Ueo7slbk2WZubgabDEbo9Ab1ovS9O2r6VScRfk7W1xm1HlhgJw5Sm4XMoWU8br7z
	qnn/d3YjdPvcOe2vDcM72RvcDGAasNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-n6p4m7zTOxOmPAz0QQg01g-1; Wed, 06 Jul 2022 03:51:31 -0400
X-MC-Unique: n6p4m7zTOxOmPAz0QQg01g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1B703810784;
	Wed,  6 Jul 2022 07:51:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C838C44AE3;
	Wed,  6 Jul 2022 07:51:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB2211947069;
	Wed,  6 Jul 2022 07:51:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 82A8C194704E
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Jul 2022 07:51:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 738441121320; Wed,  6 Jul 2022 07:51:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F63A112131E
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 07:51:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54DEF89C8B3
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 07:51:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-5N66_TqmNCG6K2rrxJ5bfA-1; Wed, 06 Jul 2022 03:51:16 -0400
X-MC-Unique: 5N66_TqmNCG6K2rrxJ5bfA-1
Received: from [2001:4bb8:189:3c4a:f22c:c36a:4e84:c723] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8z5E-006vBt-Gt; Wed, 06 Jul 2022 07:04:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Date: Wed,  6 Jul 2022 09:03:46 +0200
Message-Id: <20220706070350.1703384-13-hch@lst.de>
In-Reply-To: <20220706070350.1703384-1-hch@lst.de>
References: <20220706070350.1703384-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [dm-devel] [PATCH 12/16] block: use bdev based helpers in
 blkdev_zone_mgmt{, all}
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, linux-scsi@vger.kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the bdev based helpers instead of the queue based ones to clean up
the code a bit and prepare for storing all zone related fields in
struct gendisk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-zoned.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 2dec25d8aa3bd..c2d8a38f449aa 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -190,8 +190,8 @@ static int blkdev_zone_reset_all_emulated(struct block_device *bdev,
 					  gfp_t gfp_mask)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-	sector_t capacity = get_capacity(bdev->bd_disk);
-	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	sector_t capacity = bdev_nr_sectors(bdev);
+	sector_t zone_sectors = bdev_zone_sectors(bdev);
 	unsigned long *need_reset;
 	struct bio *bio = NULL;
 	sector_t sector = 0;
@@ -262,8 +262,8 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		     gfp_t gfp_mask)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-	sector_t zone_sectors = blk_queue_zone_sectors(q);
-	sector_t capacity = get_capacity(bdev->bd_disk);
+	sector_t zone_sectors = bdev_zone_sectors(bdev);
+	sector_t capacity = bdev_nr_sectors(bdev);
 	sector_t end_sector = sector + nr_sectors;
 	struct bio *bio = NULL;
 	int ret = 0;
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

