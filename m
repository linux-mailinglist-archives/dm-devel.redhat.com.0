Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B71567FC0
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 09:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657092187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BWgbWO17tyVNf+ChT9kSkUfzwcP6CbR3HKRGDAS4VNA=;
	b=fwJJH82BZcjFdWUOCwYlkUh/yhsTQogaGZlEsUyD93YIkz7JRyE4Ea9ry6SMvB3NzDX12P
	uUM1NZk9ZJQl2UvNeKyN1eQnHD6z3Vd4aN8EJnGOEpCqxFoqGM2+tw+mlu0vmKkBgF9mvn
	4c7lQxydXu+KfwKnJOVc/6rGresQrRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-CbwmwvSbPqWCqXGWgXJkig-1; Wed, 06 Jul 2022 03:23:06 -0400
X-MC-Unique: CbwmwvSbPqWCqXGWgXJkig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19E0E101A58D;
	Wed,  6 Jul 2022 07:23:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AE4B40CFD0A;
	Wed,  6 Jul 2022 07:23:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0EF901947069;
	Wed,  6 Jul 2022 07:23:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5403D194704E
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Jul 2022 07:23:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41B74112131E; Wed,  6 Jul 2022 07:23:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D05B1121315
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 07:23:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 223B31C04B41
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 07:23:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-zZJRijqaMle0n0pjqPYZ5Q-1; Wed, 06 Jul 2022 03:22:48 -0400
X-MC-Unique: zZJRijqaMle0n0pjqPYZ5Q-1
Received: from [2001:4bb8:189:3c4a:f22c:c36a:4e84:c723] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8z5J-006vGt-S3; Wed, 06 Jul 2022 07:04:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Date: Wed,  6 Jul 2022 09:03:48 +0200
Message-Id: <20220706070350.1703384-15-hch@lst.de>
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
Subject: [dm-devel] [PATCH 14/16] dm-zoned: cleanup dmz_fixup_devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the bdev based helpers where applicable and move the zoned_dev
into the scope where it is actually used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm-zoned-target.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 6ba6ef44b00e2..95b132b52f332 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -764,8 +764,7 @@ static void dmz_put_zoned_device(struct dm_target *ti)
 static int dmz_fixup_devices(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
-	struct dmz_dev *reg_dev, *zoned_dev;
-	struct request_queue *q;
+	struct dmz_dev *reg_dev = NULL;
 	sector_t zone_nr_sectors = 0;
 	int i;
 
@@ -780,31 +779,32 @@ static int dmz_fixup_devices(struct dm_target *ti)
 			return -EINVAL;
 		}
 		for (i = 1; i < dmz->nr_ddevs; i++) {
-			zoned_dev = &dmz->dev[i];
+			struct dmz_dev *zoned_dev = &dmz->dev[i];
+			struct block_device *bdev = zoned_dev->bdev;
+
 			if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
 				ti->error = "Secondary disk is not a zoned device";
 				return -EINVAL;
 			}
-			q = bdev_get_queue(zoned_dev->bdev);
 			if (zone_nr_sectors &&
-			    zone_nr_sectors != blk_queue_zone_sectors(q)) {
+			    zone_nr_sectors != bdev_zone_sectors(bdev)) {
 				ti->error = "Zone nr sectors mismatch";
 				return -EINVAL;
 			}
-			zone_nr_sectors = blk_queue_zone_sectors(q);
+			zone_nr_sectors = bdev_zone_sectors(bdev);
 			zoned_dev->zone_nr_sectors = zone_nr_sectors;
-			zoned_dev->nr_zones = bdev_nr_zones(zoned_dev->bdev);
+			zoned_dev->nr_zones = bdev_nr_zones(bdev);
 		}
 	} else {
-		reg_dev = NULL;
-		zoned_dev = &dmz->dev[0];
+		struct dmz_dev *zoned_dev = &dmz->dev[0];
+		struct block_device *bdev = zoned_dev->bdev;
+
 		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
 			ti->error = "Disk is not a zoned device";
 			return -EINVAL;
 		}
-		q = bdev_get_queue(zoned_dev->bdev);
-		zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
-		zoned_dev->nr_zones = bdev_nr_zones(zoned_dev->bdev);
+		zoned_dev->zone_nr_sectors = bdev_zone_sectors(bdev);
+		zoned_dev->nr_zones = bdev_nr_zones(bdev);
 	}
 
 	if (reg_dev) {
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

