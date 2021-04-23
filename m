Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70D1E368B25
	for <lists+dm-devel@lfdr.de>; Fri, 23 Apr 2021 04:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619145528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4UBYcmiUmlWWQ4i7PxaMmi57c+dNkLx6wNZI4RvYyrA=;
	b=J8seD4zj3u9KeI5UI+/O8BpW1OnLxfzv5ak2Zrs39VTfTiXBR/upUid1xf0wDjqdNV0e1s
	DgzwtzlexaN9Ja7nSbbLZWaRcrN1TDQePZiiqJsyzFIZWq8yNSygmEC6tfd5ROHgQEcXqX
	YcxUfcCbqESLLsrezrD64dTLeUbm2Po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-LK4wXdd1N9-0gEFzgD56Vw-1; Thu, 22 Apr 2021 22:38:45 -0400
X-MC-Unique: LK4wXdd1N9-0gEFzgD56Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73CE887A826;
	Fri, 23 Apr 2021 02:38:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A0FD60C5A;
	Fri, 23 Apr 2021 02:38:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EE2B44A57;
	Fri, 23 Apr 2021 02:38:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13N2cNZ6029564 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 22:38:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B32AA1B5C2; Fri, 23 Apr 2021 02:38:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-78.pek2.redhat.com [10.72.13.78])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 969F960939;
	Fri, 23 Apr 2021 02:38:09 +0000 (UTC)
Date: Fri, 23 Apr 2021 10:38:10 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YIIzEmUV5GB5I13N@T590>
References: <20210422122038.2192933-1-ming.lei@redhat.com>
	<20210422122038.2192933-13-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422122038.2192933-13-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH V7 12/12] dm: support IO polling for bio-based dm
	device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>From 98a73d99c3c663a3cfaadfec2825d6d88289a102 Mon Sep 17 00:00:00 2001
From: Jeffle Xu <jefflexu@linux.alibaba.com>
Date: Mon, 8 Feb 2021 16:52:41 +0800
Subject: [PATCH V7 12/12] dm: support IO polling for bio-based dm device

IO polling is enabled when all underlying target devices are capable
of IO polling. The sanity check supports the stacked device model, in
which one dm device may be build upon another dm device. In this case,
the mapped device will check if the underlying dm target device
supports IO polling.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
V7:
	- don't export dm_table_supports_poll, as suggested by Jeffle

 drivers/md/dm-table.c | 24 ++++++++++++++++++++++++
 drivers/md/dm.c       |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 95391f78b8d5..0b3e34cbe241 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1509,6 +1509,12 @@ struct dm_target *dm_table_find_target(struct dm_table *t, sector_t sector)
 	return &t->targets[(KEYS_PER_NODE * n) + k];
 }
 
+static int device_not_poll_capable(struct dm_target *ti, struct dm_dev *dev,
+				   sector_t start, sector_t len, void *data)
+{
+	return !blk_queue_poll(bdev_get_queue(dev->bdev));
+}
+
 /*
  * type->iterate_devices() should be called when the sanity check needs to
  * iterate and check all underlying data devices. iterate_devices() will
@@ -1559,6 +1565,11 @@ static int count_device(struct dm_target *ti, struct dm_dev *dev,
 	return 0;
 }
 
+static int dm_table_supports_poll(struct dm_table *t)
+{
+	return !dm_table_any_dev_attr(t, device_not_poll_capable, NULL);
+}
+
 /*
  * Check whether a table has no data devices attached using each
  * target's iterate_devices method.
@@ -2079,6 +2090,19 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 
 	dm_update_keyslot_manager(q, t);
 	blk_queue_update_readahead(q);
+
+	/*
+	 * Check for request-based device is remained to
+	 * dm_mq_init_request_queue()->blk_mq_init_allocated_queue().
+	 * For bio-based device, only set QUEUE_FLAG_POLL when all underlying
+	 * devices supporting polling.
+	 */
+	if (__table_type_bio_based(t->type)) {
+		if (dm_table_supports_poll(t))
+			blk_queue_flag_set(QUEUE_FLAG_POLL, q);
+		else
+			blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
+	}
 }
 
 unsigned int dm_table_get_num_targets(struct dm_table *t)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 50b693d776d6..1b160e4e6446 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2175,6 +2175,8 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 		}
 		break;
 	case DM_TYPE_BIO_BASED:
+		/* tell block layer we are capable of bio polling */
+		md->disk->flags |= GENHD_FL_CAP_BIO_POLL;
 	case DM_TYPE_DAX_BIO_BASED:
 		break;
 	case DM_TYPE_NONE:
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

