Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBB5F9EC6
	for <lists+dm-devel@lfdr.de>; Mon, 10 Oct 2022 14:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665405345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x2NG3BUzKNN5k/Uu7S61iUU+Z/0sfHiDa5KFY7TNEfk=;
	b=XDI+1v2vMhP59DTEFfEw3XpmzM2tE4Zb9qIKUFggbsEA1h+O6/HAQqDZ19gIdXhBJ1Au6p
	9LjGhDjawIVn3+o/Ga83osMHgvETihxvyz9RgIE0zmB7nNSYBOOurbthGm9s4BV9IlFNqm
	y2QGKZuO3zVzHKkhnBMNbBGAe1p0zZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-7xd7LEZqNmmsfCb_LgnNlg-1; Mon, 10 Oct 2022 08:35:44 -0400
X-MC-Unique: 7xd7LEZqNmmsfCb_LgnNlg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15AF395D6B8;
	Mon, 10 Oct 2022 12:35:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F414A53593C;
	Mon, 10 Oct 2022 12:35:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8CF31946A4C;
	Mon, 10 Oct 2022 12:35:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 559951946597
 for <dm-devel@listman.corp.redhat.com>; Mon, 10 Oct 2022 12:35:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 372192083A68; Mon, 10 Oct 2022 12:35:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 248F32083A6D;
 Mon, 10 Oct 2022 12:35:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 29ACZeqI026614; Mon, 10 Oct 2022 08:35:40 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 29ACZek8026608; Mon, 10 Oct 2022 08:35:40 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 10 Oct 2022 08:35:40 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Joe Thornber <thornber@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
 Heinz Mauelshagen <heinzm@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2210100811400.25650@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2210100835130.25650@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2210100811400.25650@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 1/4] dm-bufio: make it possible to query multiple
 blocks with just one lock
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to reduce locking overhead, we introduce a new API:
dm_bufio_lock_read, dm_bufio_unlock_read and dm_bufio_get_unlocked.

The user calls dm_bufio_lock_read, then he might call
dm_bufio_get_unlocked several times and finally calls
dm_bufio_unlock_read. This is intended to simplify btree walks in dm-thin.

The follow-up patch will change c->lock from mutex to rw-semaphore, so
that there could be multiple processes walking the btree concurently.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c    |   45 ++++++++++++++++++++++++++++++++++++++-------
 include/linux/dm-bufio.h |   15 +++++++++++++++
 2 files changed, 53 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2022-10-10 11:08:10.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2022-10-10 11:13:10.000000000 +0200
@@ -145,7 +145,7 @@ struct dm_buffer {
 	unsigned char list_mode;		/* LIST_* */
 	blk_status_t read_error;
 	blk_status_t write_error;
-	unsigned accessed;
+	volatile unsigned accessed;
 	unsigned hold_count;
 	unsigned long state;
 	unsigned long last_accessed;
@@ -193,6 +193,18 @@ static void dm_bufio_unlock(struct dm_bu
 		mutex_unlock(&c->lock);
 }
 
+void dm_bufio_lock_read(struct dm_bufio_client *c)
+{
+	mutex_lock(&c->lock);
+}
+EXPORT_SYMBOL_GPL(dm_bufio_lock_read);
+
+void dm_bufio_unlock_read(struct dm_bufio_client *c)
+{
+	mutex_unlock(&c->lock);
+}
+EXPORT_SYMBOL_GPL(dm_bufio_unlock_read);
+
 /*----------------------------------------------------------------*/
 
 /*
@@ -870,7 +882,8 @@ enum new_flag {
 	NF_FRESH = 0,
 	NF_READ = 1,
 	NF_GET = 2,
-	NF_PREFETCH = 3
+	NF_GET_UNLOCKED = 3,
+	NF_PREFETCH = 4
 };
 
 /*
@@ -1013,7 +1026,7 @@ static struct dm_buffer *__bufio_new(str
 	if (b)
 		goto found_buffer;
 
-	if (nf == NF_GET)
+	if (nf == NF_GET || nf == NF_GET_UNLOCKED)
 		return NULL;
 
 	new_b = __alloc_buffer_wait(c, nf);
@@ -1058,12 +1071,17 @@ found_buffer:
 	 * If the user called both dm_bufio_prefetch and dm_bufio_get on
 	 * the same buffer, it would deadlock if we waited.
 	 */
-	if (nf == NF_GET && unlikely(test_bit(B_READING, &b->state)))
+	if ((nf == NF_GET || nf == NF_GET_UNLOCKED) && unlikely(test_bit(B_READING, &b->state)))
 		return NULL;
 
-	b->hold_count++;
-	__relink_lru(b, test_bit(B_DIRTY, &b->state) ||
-		     test_bit(B_WRITING, &b->state));
+	if (nf == NF_GET_UNLOCKED) {
+		if (!b->accessed)
+			b->accessed = 1;
+	} else {
+		b->hold_count++;
+		__relink_lru(b, test_bit(B_DIRTY, &b->state) ||
+			     test_bit(B_WRITING, &b->state));
+	}
 	return b;
 }
 
@@ -1154,6 +1172,19 @@ void *dm_bufio_new(struct dm_bufio_clien
 }
 EXPORT_SYMBOL_GPL(dm_bufio_new);
 
+void *dm_bufio_get_unlocked(struct dm_bufio_client *c, sector_t block,
+			    struct dm_buffer **bp)
+{
+	int need_submit;
+	struct dm_buffer *b = __bufio_new(c, block, NF_GET_UNLOCKED, &need_submit, NULL);
+	if (b) {
+		*bp = b;
+		return b->data;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dm_bufio_get_unlocked);
+
 void dm_bufio_prefetch(struct dm_bufio_client *c,
 		       sector_t block, unsigned n_blocks)
 {
Index: linux-2.6/include/linux/dm-bufio.h
===================================================================
--- linux-2.6.orig/include/linux/dm-bufio.h	2022-10-10 11:13:10.000000000 +0200
+++ linux-2.6/include/linux/dm-bufio.h	2022-10-10 11:13:25.000000000 +0200
@@ -38,6 +38,13 @@ dm_bufio_client_create(struct block_devi
 void dm_bufio_client_destroy(struct dm_bufio_client *c);
 
 /*
+ * Lock and unlock the bufio client - this is needed if we want to call
+ * dm_bufio_get_unlocked.
+ */
+void dm_bufio_lock_read(struct dm_bufio_client *c);
+void dm_bufio_unlock_read(struct dm_bufio_client *c);
+
+/*
  * Set the sector range.
  * When this function is called, there must be no I/O in progress on the bufio
  * client.
@@ -76,6 +83,14 @@ void *dm_bufio_new(struct dm_bufio_clien
 		   struct dm_buffer **bp);
 
 /*
+ * Like dm_bufio_get, but assume that the client is already locked with
+ * dm_bufio_lock_read/dm_bufio_unlock_read. dm_bufio_release should not be
+ * called; the caller should call dm_bufio_unlock_read to release the buffer.
+ */
+void *dm_bufio_get_unlocked(struct dm_bufio_client *c, sector_t block,
+			    struct dm_buffer **bp);
+
+/*
  * Prefetch the specified blocks to the cache.
  * The function starts to read the blocks and returns without waiting for
  * I/O to finish.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

