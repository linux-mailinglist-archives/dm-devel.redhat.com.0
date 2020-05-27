Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD51E3F88
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 13:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590577557;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vo+LGypBIVHYFpGyMZG0wCamgdgD+woS1nhoO4ZrSYY=;
	b=dkAX+x5rz4xDwddLjYC7r+Qk6szQ0xqTT/j1wOGN6cW6r2/w+sVbnaO8JLvbIPTE203fDL
	S/7o/p+ZM9eAJrOmmM6ZRctMxmD8eqTfuUnIDpGJwEra5L+zp41mDXIkrjUlB3MlF9v8Et
	arOySYPaZ6Dr67ojCFytKb+OUULGrMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-R63oZXTWOL-3HjnVdqfPog-1; Wed, 27 May 2020 07:05:52 -0400
X-MC-Unique: R63oZXTWOL-3HjnVdqfPog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4854018FF673;
	Wed, 27 May 2020 11:05:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468077A1ED;
	Wed, 27 May 2020 11:05:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FD261809541;
	Wed, 27 May 2020 11:05:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RB4oa9000796 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 07:04:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07B4F610AB; Wed, 27 May 2020 11:04:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F29760CC0;
	Wed, 27 May 2020 11:04:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 04RB4kgK006131; Wed, 27 May 2020 07:04:46 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 04RB4k5V006128; Wed, 27 May 2020 07:04:46 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 27 May 2020 07:04:46 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <alpine.LRH.2.02.2005270702460.6054@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] delete dm_bufio_discard_buffers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I suggest to delete dm_bufio_discard_buffers because no one is using it.

If you need it in the future, tell me - and I will optimize it, so that it 
walks the rb-tree of buffers instead of doing block-by-block lookups.

Mikulas



diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index bf289be1ee3a..993e624e506c 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1358,32 +1358,6 @@ int dm_bufio_issue_discard(struct dm_bufio_client *c, sector_t block, sector_t c
 }
 EXPORT_SYMBOL_GPL(dm_bufio_issue_discard);
 
-/*
- * Free the specified range of buffers. If a buffer is held by other process, it
- * is not freed. If a buffer is dirty, it is discarded without writeback.
- * Finally, send the discard request to the device.
- */
-int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count)
-{
-	sector_t i;
-
-	for (i = block; i < block + count; i++) {
-		struct dm_buffer *b;
-		dm_bufio_lock(c);
-		b = __find(c, i);
-		if (b && likely(!b->hold_count)) {
-			wait_on_bit_io(&b->state, B_READING, TASK_UNINTERRUPTIBLE);
-			wait_on_bit_io(&b->state, B_WRITING, TASK_UNINTERRUPTIBLE);
-			__unlink_buffer(b);
-			__free_buffer_wake(b);
-		}
-		dm_bufio_unlock(c);
-	}
-
-	return dm_bufio_issue_discard(c, block, count);
-}
-EXPORT_SYMBOL_GPL(dm_bufio_discard_buffers);
-
 /*
  * We first delete any other buffer that may be at that new location.
  *
diff --git a/include/linux/dm-bufio.h b/include/linux/dm-bufio.h
index 07e1f163e299..5ec6bfbde9ae 100644
--- a/include/linux/dm-bufio.h
+++ b/include/linux/dm-bufio.h
@@ -123,13 +123,6 @@ int dm_bufio_issue_flush(struct dm_bufio_client *c);
  */
 int dm_bufio_issue_discard(struct dm_bufio_client *c, sector_t block, sector_t count);
 
-/*
- * Free the specified range of buffers. If a buffer is held by other process, it
- * is not freed. If a buffer is dirty, it is discarded without writeback.
- * Finally, send the discard request to the device.
- */
-int dm_bufio_discard_buffers(struct dm_bufio_client *c, sector_t block, sector_t count);
-
 /*
  * Like dm_bufio_release but also move the buffer to the new
  * block. dm_bufio_write_dirty_buffers is needed to commit the new block.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

