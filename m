Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C927A156061
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 22:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581109219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wMghsXb7pUYJ0AmUcju0t4UdTkKpBHKjaevOFygpFow=;
	b=EOSbouBgADF+W9fxa6E88grGHEzY1yxy4FMiRMEyUFVd1rsgFFOz0LETO9krm7GV5BdD0P
	pbD1MITtN0Ebqej54Fp+deLAAvWrY07eDTn8WBk2hWAV1Ao+ozj/s7TJDWB+ALgHm8nYXQ
	daXPl3VDWUDyzcNtWYFnuv8H5BGOnOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-0ewvwCaqNGGlYzq6uKlk7g-1; Fri, 07 Feb 2020 16:00:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA94E1336572;
	Fri,  7 Feb 2020 21:00:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3BB77927;
	Fri,  7 Feb 2020 21:00:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE1F081739;
	Fri,  7 Feb 2020 21:00:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017L02Fu021444 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 16:00:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1035E790E5; Fri,  7 Feb 2020 21:00:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E53790D8;
	Fri,  7 Feb 2020 20:59:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017Kxw3E025035; Fri, 7 Feb 2020 15:59:58 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017KxwGJ025031; Fri, 7 Feb 2020 15:59:58 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 15:59:58 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2002071558040.24277@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2002071559350.24277@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2002071558040.24277@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/2] dm-bufio: introduce block_to_sector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0ewvwCaqNGGlYzq6uKlk7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-bufio: implement discard

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

