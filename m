Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAB4364F1
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 17:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634828503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7QUSjW9ZGZ3TUlBxH97Cn5mrHC7HlplpaBNY+ktQMn8=;
	b=DabC4NeZP+vzQ0eH+ZHatoSlt73RFYMKW7o2rih1+/QS8DxWCSYvMp2oNppl7M3hXVC51m
	ukxO4JxgcoLeZZfDFPMq6buWtveM0T0h6SRd4A4ixGdkCXpiOli4xrMza4zWhdroXrkuUb
	2Oiub7knNYLLDU9qgUEswu03H/D3New=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-TlDcFLQuN7SyNXByKPj29A-1; Thu, 21 Oct 2021 11:01:41 -0400
X-MC-Unique: TlDcFLQuN7SyNXByKPj29A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDE0E8C4B1C;
	Thu, 21 Oct 2021 15:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADAC5794DB;
	Thu, 21 Oct 2021 15:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E871F1800FDD;
	Thu, 21 Oct 2021 15:00:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LF0Zna031617 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 11:00:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 935A178312; Thu, 21 Oct 2021 15:00:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA91D6C8F7;
	Thu, 21 Oct 2021 15:00:00 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 21 Oct 2021 22:59:16 +0800
Message-Id: <20211021145918.2691762-2-ming.lei@redhat.com>
In-Reply-To: <20211021145918.2691762-1-ming.lei@redhat.com>
References: <20211021145918.2691762-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Yi Zhang <yi.zhang@redhat.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [dm-devel] [PATCH 1/3] scsi: avoid to quiesce sdev->request_queue
	two times
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

For fixing queue quiesce race between driver and block layer(elevator
switch, update nr_requests, ...), we need to support concurrent quiesce
and unquiesce, which requires the two to be balanced.

blk_mq_quiesce_queue() calls blk_mq_quiesce_queue_nowait() for updating
quiesce depth and marking the flag, then scsi_internal_device_block() calls
blk_mq_quiesce_queue_nowait() two times actually.

Fix the double quiesce and keep quiesce and unquiesce balanced.

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Fixes: e70feb8b3e68 ("blk-mq: support concurrent queue quiesce/unquiesce")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/scsi/scsi_lib.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 30f7d0b4eb73..51fcd46be265 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2630,6 +2630,14 @@ scsi_target_resume(struct scsi_target *starget)
 }
 EXPORT_SYMBOL(scsi_target_resume);
 
+static int __scsi_internal_device_block_nowait(struct scsi_device *sdev)
+{
+	if (scsi_device_set_state(sdev, SDEV_BLOCK))
+		return scsi_device_set_state(sdev, SDEV_CREATED_BLOCK);
+
+	return 0;
+}
+
 /**
  * scsi_internal_device_block_nowait - try to transition to the SDEV_BLOCK state
  * @sdev: device to block
@@ -2646,24 +2654,16 @@ EXPORT_SYMBOL(scsi_target_resume);
  */
 int scsi_internal_device_block_nowait(struct scsi_device *sdev)
 {
-	struct request_queue *q = sdev->request_queue;
-	int err = 0;
-
-	err = scsi_device_set_state(sdev, SDEV_BLOCK);
-	if (err) {
-		err = scsi_device_set_state(sdev, SDEV_CREATED_BLOCK);
-
-		if (err)
-			return err;
-	}
+	int ret = __scsi_internal_device_block_nowait(sdev);
 
 	/*
 	 * The device has transitioned to SDEV_BLOCK.  Stop the
 	 * block layer from calling the midlayer with this device's
 	 * request queue.
 	 */
-	blk_mq_quiesce_queue_nowait(q);
-	return 0;
+	if (!ret)
+		blk_mq_quiesce_queue_nowait(sdev->request_queue);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(scsi_internal_device_block_nowait);
 
@@ -2684,13 +2684,12 @@ EXPORT_SYMBOL_GPL(scsi_internal_device_block_nowait);
  */
 static int scsi_internal_device_block(struct scsi_device *sdev)
 {
-	struct request_queue *q = sdev->request_queue;
 	int err;
 
 	mutex_lock(&sdev->state_mutex);
-	err = scsi_internal_device_block_nowait(sdev);
+	err = __scsi_internal_device_block_nowait(sdev);
 	if (err == 0)
-		blk_mq_quiesce_queue(q);
+		blk_mq_quiesce_queue(sdev->request_queue);
 	mutex_unlock(&sdev->state_mutex);
 
 	return err;
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

