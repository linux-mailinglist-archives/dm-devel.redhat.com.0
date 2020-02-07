Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CE547155C04
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 17:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581093874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oQOLZwnlioxC30Eps6gCQm37ssVPE3pSg3xftVmOQks=;
	b=CvwcGukD+LgdVB7pEITvzuqTu7lcsWr9TP0N4eQq+O3sFy1qQ0AovNbAxh0TubAsJx7TNw
	Z8OfmBqdpICBz/fhL4P8PvcaLhg/G/Y5KUMGmh84gj96RuLhAWtZHvPArg5ry1FHGsg0vQ
	79XRpwidloGhd8nnnFd7oO3RazQ03X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-a-jNvQXxMHOyel_juS_aTw-1; Fri, 07 Feb 2020 11:44:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40751336562;
	Fri,  7 Feb 2020 16:44:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6817960BEC;
	Fri,  7 Feb 2020 16:44:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21B17866A5;
	Fri,  7 Feb 2020 16:44:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017GiDET009740 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 11:44:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE9298ECE8; Fri,  7 Feb 2020 16:44:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 224298EA1D;
	Fri,  7 Feb 2020 16:44:11 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017GiA5k001118; Fri, 7 Feb 2020 11:44:10 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017GiA20001115; Fri, 7 Feb 2020 11:44:10 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 11:44:10 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <alpine.LRH.2.02.2002071143390.32552@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-bufio: implement discard
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
X-MC-Unique: a-jNvQXxMHOyel_juS_aTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add functions dm_bufio_issue_discard and dm_bufio_discard_buffers.
dm_bufio_issue_discard sends discard request to the underlying device.
dm_bufio_discard_buffers frees buffers in the range and then calls
dm_bufio_issue_discard.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c    |   50 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/dm-bufio.h |   12 +++++++++++
 2 files changed, 62 insertions(+)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2020-02-07 17:14:08.000000000 +0100
+++ linux-2.6/drivers/md/dm-bufio.c	2020-02-07 17:29:42.000000000 +0100
@@ -1338,6 +1338,56 @@ int dm_bufio_issue_flush(struct dm_bufio
 EXPORT_SYMBOL_GPL(dm_bufio_issue_flush);
 
 /*
+ * Use dm-io to send a discard request to flush the device.
+ */
+int dm_bufio_issue_discard(struct dm_bufio_client *c, sector_t block, sector_t count)
+{
+	struct dm_io_request io_req = {
+		.bi_op = REQ_OP_DISCARD,
+		.bi_op_flags = REQ_SYNC,
+		.mem.type = DM_IO_KMEM,
+		.mem.ptr.addr = NULL,
+		.client = c->dm_io,
+	};
+	struct dm_io_region io_reg = {
+		.bdev = c->bdev,
+		.sector = block_to_sector(c, block),
+		.count = block_to_sector(c, count),
+	};
+
+	BUG_ON(dm_bufio_in_request());
+
+	return dm_io(&io_req, 1, &io_reg, NULL);
+}
+EXPORT_SYMBOL_GPL(dm_bufio_issue_discard);
+
+/*
+ * Free the specified range of buffers. If a buffer is held by other process, it
+ * is not freed. If a buffer is dirty, it is discarded without writeback.
+ * Finally, send the discard request to the device.
+ */
+int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count)
+{
+	sector_t i;
+
+	for (i = block; i < block + count; i++) {
+		struct dm_buffer *b;
+		dm_bufio_lock(c);
+		b = __find(c, i);
+		if (b && likely(!b->hold_count)) {
+			wait_on_bit_io(&b->state, B_READING, TASK_UNINTERRUPTIBLE);
+			wait_on_bit_io(&b->state, B_WRITING, TASK_UNINTERRUPTIBLE);
+			__unlink_buffer(b);
+			__free_buffer_wake(b);
+		}
+		dm_bufio_unlock(c);
+	}
+
+	return dm_bufio_issue_discard(c, block, count);
+}
+EXPORT_SYMBOL_GPL(dm_bufio_discard_buffers);
+
+/*
  * We first delete any other buffer that may be at that new location.
  *
  * Then, we write the buffer to the original location if it was dirty.
Index: linux-2.6/include/linux/dm-bufio.h
===================================================================
--- linux-2.6.orig/include/linux/dm-bufio.h	2020-02-07 17:14:08.000000000 +0100
+++ linux-2.6/include/linux/dm-bufio.h	2020-02-07 17:29:46.000000000 +0100
@@ -126,6 +126,18 @@ int dm_bufio_write_dirty_buffers(struct
 int dm_bufio_issue_flush(struct dm_bufio_client *c);
 
 /*
+ * Send a discard request to the underlying device.
+ */
+int dm_bufio_issue_discard(struct dm_bufio_client *c, sector_t block, sector_t count);
+
+/*
+ * Free the specified range of buffers. If a buffer is held by other process, it
+ * is not freed. If a buffer is dirty, it is discarded without writeback.
+ * Finally, send the discard request to the device.
+ */
+int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count);
+
+/*
  * Like dm_bufio_release but also move the buffer to the new
  * block. dm_bufio_write_dirty_buffers is needed to commit the new block.
  */

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

