Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E04364F4
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 17:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634828514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3yp2XHN5mBs/u2stqKURDdoKJaQKjJXRz5E3VXRgyTQ=;
	b=iwJ5Q/X+/g/Sz7/6BfwzCYwhoXSILfvJIoCmzj4q48EGE60UpeFYvoB0kSJdrz7dECXl4x
	eK0+nvavXZSfqKJaTHK8k+KduIv+QpC3/FQp2Xd1sT9L3EeNfiMS01ZygzoN5KcW3TA+k+
	ynniYOpX7T1e8f7BeO9k0iEbTyv0Fkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-i4-Dsry9Mzu6wTcSOwgO4Q-1; Thu, 21 Oct 2021 11:01:47 -0400
X-MC-Unique: i4-Dsry9Mzu6wTcSOwgO4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E9A8C22F9;
	Thu, 21 Oct 2021 15:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 263855F4F5;
	Thu, 21 Oct 2021 15:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D30F4A702;
	Thu, 21 Oct 2021 15:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LF0cDr031627 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 11:00:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 532257833C; Thu, 21 Oct 2021 15:00:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 086147DA13;
	Thu, 21 Oct 2021 15:00:36 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 21 Oct 2021 22:59:17 +0800
Message-Id: <20211021145918.2691762-3-ming.lei@redhat.com>
In-Reply-To: <20211021145918.2691762-1-ming.lei@redhat.com>
References: <20211021145918.2691762-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Yi Zhang <yi.zhang@redhat.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [dm-devel] [PATCH 2/3] scsi: make sure that request queue queiesce
	and unquiesce balanced
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For fixing queue quiesce race between driver and block layer(elevator
switch, update nr_requests, ...), we need to support concurrent quiesce
and unquiesce, which requires the two call balanced.

It isn't easy to audit that in all scsi drivers, especially the two may
be called from different contexts, so do it in scsi core with one per-device
bit flag & global spinlock, basically zero cost since request queue quiesce
is seldom triggered.

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Fixes: e70feb8b3e68 ("blk-mq: support concurrent queue quiesce/unquiesce")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/scsi/scsi_lib.c    | 45 ++++++++++++++++++++++++++++++--------
 include/scsi/scsi_device.h |  1 +
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 51fcd46be265..414f4daf8005 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2638,6 +2638,40 @@ static int __scsi_internal_device_block_nowait(struct scsi_device *sdev)
 	return 0;
 }
 
+static DEFINE_SPINLOCK(sdev_queue_stop_lock);
+
+void scsi_start_queue(struct scsi_device *sdev)
+{
+	bool need_start;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sdev_queue_stop_lock, flags);
+	need_start = sdev->queue_stopped;
+	sdev->queue_stopped = 0;
+	spin_unlock_irqrestore(&sdev_queue_stop_lock, flags);
+
+	if (need_start)
+		blk_mq_unquiesce_queue(sdev->request_queue);
+}
+
+static void scsi_stop_queue(struct scsi_device *sdev, bool nowait)
+{
+	bool need_stop;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sdev_queue_stop_lock, flags);
+	need_stop = !sdev->queue_stopped;
+	sdev->queue_stopped = 1;
+	spin_unlock_irqrestore(&sdev_queue_stop_lock, flags);
+
+	if (need_stop) {
+		if (nowait)
+			blk_mq_quiesce_queue_nowait(sdev->request_queue);
+		else
+			blk_mq_quiesce_queue(sdev->request_queue);
+	}
+}
+
 /**
  * scsi_internal_device_block_nowait - try to transition to the SDEV_BLOCK state
  * @sdev: device to block
@@ -2662,7 +2696,7 @@ int scsi_internal_device_block_nowait(struct scsi_device *sdev)
 	 * request queue.
 	 */
 	if (!ret)
-		blk_mq_quiesce_queue_nowait(sdev->request_queue);
+		scsi_stop_queue(sdev, true);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(scsi_internal_device_block_nowait);
@@ -2689,19 +2723,12 @@ static int scsi_internal_device_block(struct scsi_device *sdev)
 	mutex_lock(&sdev->state_mutex);
 	err = __scsi_internal_device_block_nowait(sdev);
 	if (err == 0)
-		blk_mq_quiesce_queue(sdev->request_queue);
+		scsi_stop_queue(sdev, false);
 	mutex_unlock(&sdev->state_mutex);
 
 	return err;
 }
 
-void scsi_start_queue(struct scsi_device *sdev)
-{
-	struct request_queue *q = sdev->request_queue;
-
-	blk_mq_unquiesce_queue(q);
-}
-
 /**
  * scsi_internal_device_unblock_nowait - resume a device after a block request
  * @sdev:	device to resume
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 430b73bd02ac..ac74beccffa2 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -206,6 +206,7 @@ struct scsi_device {
 	unsigned rpm_autosuspend:1;	/* Enable runtime autosuspend at device
 					 * creation time */
 	unsigned ignore_media_change:1; /* Ignore MEDIA CHANGE on resume */
+	unsigned queue_stopped:1;	/* request queue is quiesced */
 
 	bool offline_already;		/* Device offline message logged */
 
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

