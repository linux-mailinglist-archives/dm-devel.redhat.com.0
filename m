Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CE5657BD
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jul 2022 15:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656942484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uvf5cedCFugP43UFpYgvMUJENVrpVBiuqdVpP18q6VE=;
	b=H8Eg86NuK53ceOszCtkmFpeKttN6cmPYcyte/rMlZl52V9ZUcZB97dPKM4UQLkH7i4SLB9
	cIPZU2HXTz5PCWEWRfaAU0Jzq/sfD8E/shvLevg0g3i4RQv7fe3ZXmie5qfS3yHY6xBAWh
	akl9mK4jI88eJUp6ZhhfPiYRynFmNvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-hxmlcsbTN-W6tJzQDc91Nw-1; Mon, 04 Jul 2022 09:48:03 -0400
X-MC-Unique: hxmlcsbTN-W6tJzQDc91Nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CDF51C06EE9;
	Mon,  4 Jul 2022 13:48:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A386A1415130;
	Mon,  4 Jul 2022 13:47:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BF6F1947056;
	Mon,  4 Jul 2022 13:47:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE97119466DF
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Jul 2022 13:47:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B372E2166B29; Mon,  4 Jul 2022 13:47:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFA372166B26
 for <dm-devel@redhat.com>; Mon,  4 Jul 2022 13:47:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CF51035343
 for <dm-devel@redhat.com>; Mon,  4 Jul 2022 13:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-9VgjJh3KNgOST8YNJhQ2Rg-1; Mon, 04 Jul 2022 09:47:54 -0400
X-MC-Unique: 9VgjJh3KNgOST8YNJhQ2Rg-1
Received: from [2001:4bb8:189:3c4a:8758:74d9:4df6:6417] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8LS7-008sK7-St; Mon, 04 Jul 2022 12:45:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Date: Mon,  4 Jul 2022 14:44:51 +0200
Message-Id: <20220704124500.155247-9-hch@lst.de>
In-Reply-To: <20220704124500.155247-1-hch@lst.de>
References: <20220704124500.155247-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [PATCH 08/17] block: pass a gendisk to
 blk_queue_set_zoned
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Prepare for storing the zone related field in struct gendisk instead
of struct request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c           | 9 +++++----
 block/partitions/core.c        | 2 +-
 drivers/block/null_blk/zoned.c | 2 +-
 drivers/nvme/host/zns.c        | 2 +-
 drivers/scsi/sd.c              | 6 +++---
 drivers/scsi/sd_zbc.c          | 2 +-
 include/linux/blkdev.h         | 2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 6ccceb421ed2f..35b7bba306a83 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -893,18 +893,19 @@ static bool disk_has_partitions(struct gendisk *disk)
 }
 
 /**
- * blk_queue_set_zoned - configure a disk queue zoned model.
+ * disk_set_zoned - configure the zoned model for a disk
  * @disk:	the gendisk of the queue to configure
  * @model:	the zoned model to set
  *
- * Set the zoned model of the request queue of @disk according to @model.
+ * Set the zoned model of @disk to @model.
+ *
  * When @model is BLK_ZONED_HM (host managed), this should be called only
  * if zoned block device support is enabled (CONFIG_BLK_DEV_ZONED option).
  * If @model specifies BLK_ZONED_HA (host aware), the effective model used
  * depends on CONFIG_BLK_DEV_ZONED settings and on the existence of partitions
  * on the disk.
  */
-void blk_queue_set_zoned(struct gendisk *disk, enum blk_zoned_model model)
+void disk_set_zoned(struct gendisk *disk, enum blk_zoned_model model)
 {
 	struct request_queue *q = disk->queue;
 
@@ -948,7 +949,7 @@ void blk_queue_set_zoned(struct gendisk *disk, enum blk_zoned_model model)
 		blk_queue_clear_zone_settings(q);
 	}
 }
-EXPORT_SYMBOL_GPL(blk_queue_set_zoned);
+EXPORT_SYMBOL_GPL(disk_set_zoned);
 
 int bdev_alignment_offset(struct block_device *bdev)
 {
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 7dc487f5b03cd..1a45b1dd64918 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -330,7 +330,7 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 	case BLK_ZONED_HA:
 		pr_info("%s: disabling host aware zoned block device support due to partitions\n",
 			disk->disk_name);
-		blk_queue_set_zoned(disk, BLK_ZONED_NONE);
+		disk_set_zoned(disk, BLK_ZONED_NONE);
 		break;
 	case BLK_ZONED_NONE:
 		break;
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index 2fdd7b20c224e..b47bbd114058d 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -159,7 +159,7 @@ int null_register_zoned_dev(struct nullb *nullb)
 	struct nullb_device *dev = nullb->dev;
 	struct request_queue *q = nullb->q;
 
-	blk_queue_set_zoned(nullb->disk, BLK_ZONED_HM);
+	disk_set_zoned(nullb->disk, BLK_ZONED_HM);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	blk_queue_required_elevator_features(q, ELEVATOR_F_ZBD_SEQ_WRITE);
 
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 9f81beb4df4ef..0ed15c2fd56de 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -109,7 +109,7 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
 		goto free_data;
 	}
 
-	blk_queue_set_zoned(ns->disk, BLK_ZONED_HM);
+	disk_set_zoned(ns->disk, BLK_ZONED_HM);
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	blk_queue_max_open_zones(q, le32_to_cpu(id->mor) + 1);
 	blk_queue_max_active_zones(q, le32_to_cpu(id->mar) + 1);
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index cb587e488601c..eb02d939dd448 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -2934,15 +2934,15 @@ static void sd_read_block_characteristics(struct scsi_disk *sdkp)
 
 	if (sdkp->device->type == TYPE_ZBC) {
 		/* Host-managed */
-		blk_queue_set_zoned(sdkp->disk, BLK_ZONED_HM);
+		disk_set_zoned(sdkp->disk, BLK_ZONED_HM);
 	} else {
 		sdkp->zoned = zoned;
 		if (sdkp->zoned == 1) {
 			/* Host-aware */
-			blk_queue_set_zoned(sdkp->disk, BLK_ZONED_HA);
+			disk_set_zoned(sdkp->disk, BLK_ZONED_HA);
 		} else {
 			/* Regular disk or drive managed disk */
-			blk_queue_set_zoned(sdkp->disk, BLK_ZONED_NONE);
+			disk_set_zoned(sdkp->disk, BLK_ZONED_NONE);
 		}
 	}
 
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 6acc4f406eb8c..0f5823b674685 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -929,7 +929,7 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 		/*
 		 * This can happen for a host aware disk with partitions.
 		 * The block device zone model was already cleared by
-		 * blk_queue_set_zoned(). Only free the scsi disk zone
+		 * disk_set_zoned(). Only free the scsi disk zone
 		 * information and exit early.
 		 */
 		sd_zbc_free_zone_info(sdkp);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index b9baee910b825..ddf8353488fc8 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -291,7 +291,7 @@ struct queue_limits {
 typedef int (*report_zones_cb)(struct blk_zone *zone, unsigned int idx,
 			       void *data);
 
-void blk_queue_set_zoned(struct gendisk *disk, enum blk_zoned_model model);
+void disk_set_zoned(struct gendisk *disk, enum blk_zoned_model model);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

