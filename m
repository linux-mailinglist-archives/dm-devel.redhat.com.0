Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACCA1EBD30
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 15:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591105077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TqYaLY30IfswNsCxEibtlIikmGRdy1r4vMKIW8P7dJA=;
	b=XVJA8dja4jJKxSGgnzS+1EUc/NkUXsQJqapl05BB4Y42EAjdPE5d1EeB7dIArui5d5MQ8w
	KbvyEAVxNZSSEU0U6CgJj7dgnkbRw8jTCAqDN36NtYGNn6yfXxpkKx4oFKpO0vobHoVmiI
	Bg45dzk62671Rj6xq4xSy/1fbvVBito=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-we6WxhCPO72kK6rzJjQwVQ-1; Tue, 02 Jun 2020 09:37:54 -0400
X-MC-Unique: we6WxhCPO72kK6rzJjQwVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D843719057AA;
	Tue,  2 Jun 2020 13:37:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B81A57F0AC;
	Tue,  2 Jun 2020 13:37:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1520393515;
	Tue,  2 Jun 2020 13:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052DZIQA007935 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 09:35:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C0217F4C5; Tue,  2 Jun 2020 13:35:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF00A7F0B6;
	Tue,  2 Jun 2020 13:35:14 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jg74S-0003XD-Eo; Tue, 02 Jun 2020 15:35:13 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Jun 2020 15:35:11 +0200
Message-Id: <20200602133511.805724040@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Jun 2020 15:34:40 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 2/3] dm-bufio: introduce forget_buffer_locked
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
Content-Disposition: inline; filename=dm-bufio-find_next.patch

Introduce a function forget_buffer_locked that forgets a range of buffers.
It is more efficient than calling forget_buffer in a loop.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c    |   60 +++++++++++++++++++++++++++++++++++++++++++----
 include/linux/dm-bufio.h |    7 +++++
 2 files changed, 63 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2020-06-02 14:26:32.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2020-06-02 15:09:11.000000000 +0200
@@ -262,6 +262,29 @@ static struct dm_buffer *__find(struct d
 	return NULL;
 }
 
+static struct dm_buffer *__find_next(struct dm_bufio_client *c, sector_t block)
+{
+	struct rb_node *n = c->buffer_tree.rb_node;
+	struct dm_buffer *b;
+	struct dm_buffer *best = NULL;
+
+	while (n) {
+		b = container_of(n, struct dm_buffer, node);
+
+		if (b->block == block)
+			return b;
+
+		if (block <= b->block) {
+			n = n->rb_left;
+			best = b;
+		} else {
+			n = n->rb_right;
+		}
+	}
+
+	return best;
+}
+
 static void __insert(struct dm_bufio_client *c, struct dm_buffer *b)
 {
 	struct rb_node **new = &c->buffer_tree.rb_node, *parent = NULL;
@@ -1460,6 +1483,14 @@ retry:
 }
 EXPORT_SYMBOL_GPL(dm_bufio_release_move);
 
+static void forget_buffer_locked(struct dm_buffer *b)
+{
+	if (likely(!b->hold_count) && likely(!b->state)) {
+		__unlink_buffer(b);
+		__free_buffer_wake(b);
+	}
+}
+
 /*
  * Free the given buffer.
  *
@@ -1473,15 +1504,36 @@ void dm_bufio_forget(struct dm_bufio_cli
 	dm_bufio_lock(c);
 
 	b = __find(c, block);
-	if (b && likely(!b->hold_count) && likely(!b->state)) {
-		__unlink_buffer(b);
-		__free_buffer_wake(b);
-	}
+	if (b)
+		forget_buffer_locked(b);
 
 	dm_bufio_unlock(c);
 }
 EXPORT_SYMBOL_GPL(dm_bufio_forget);
 
+void dm_bufio_forget_buffers(struct dm_bufio_client *c, sector_t block, sector_t n_blocks)
+{
+	struct dm_buffer *b;
+	sector_t end_block = block + n_blocks;
+
+	while (block < end_block) {
+		dm_bufio_lock(c);
+
+		b = __find_next(c, block);
+		if (b) {
+			block = b->block + 1;
+			forget_buffer_locked(b);
+		}
+
+		dm_bufio_unlock(c);
+
+		if (!b)
+			break;
+	}
+
+}
+EXPORT_SYMBOL_GPL(dm_bufio_forget_buffers);
+
 void dm_bufio_set_minimum_buffers(struct dm_bufio_client *c, unsigned n)
 {
 	c->minimum_buffers = n;
Index: linux-2.6/include/linux/dm-bufio.h
===================================================================
--- linux-2.6.orig/include/linux/dm-bufio.h	2020-06-02 13:27:14.000000000 +0200
+++ linux-2.6/include/linux/dm-bufio.h	2020-06-02 15:04:55.000000000 +0200
@@ -144,6 +144,13 @@ void dm_bufio_release_move(struct dm_buf
 void dm_bufio_forget(struct dm_bufio_client *c, sector_t block);
 
 /*
+ * Free the given range of buffers.
+ * This is just a hint, if the buffer is in use or dirty, this function
+ * does nothing.
+ */
+void dm_bufio_forget_buffers(struct dm_bufio_client *c, sector_t block, sector_t n_blocks);
+
+/*
  * Set the minimum number of buffers before cleanup happens.
  */
 void dm_bufio_set_minimum_buffers(struct dm_bufio_client *c, unsigned n);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

