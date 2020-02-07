Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 93F9815605F
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 22:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581109199;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z2SDx33cvCzwskr1E3697v/U5itcX3ZAybj5y2ocaI0=;
	b=cPjGzpP+gF5MkzILKW0p/Du/nyggqiiVxsClktP7sR7Ai+259E5yzyr0GgZ7h5wT0IDD+e
	ODQ2qx6GZi12vNi+h3+vvurRamJEyR5GaBpe79iFNhSMezUel5S3VtGhGAGdchPyWsOG2X
	8/pn6TxYseKiwOU9Ut1Td87U0a8XTWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-qCDS8n6EPxWryekaoALvcg-1; Fri, 07 Feb 2020 15:59:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAA48010E7;
	Fri,  7 Feb 2020 20:59:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 022C31FE07;
	Fri,  7 Feb 2020 20:59:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCFF78B2A2;
	Fri,  7 Feb 2020 20:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017KxT3G021379 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 15:59:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 255411FE07; Fri,  7 Feb 2020 20:59:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C7EA19C7F;
	Fri,  7 Feb 2020 20:59:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017KxQvW025005; Fri, 7 Feb 2020 15:59:26 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017KxQVs025002; Fri, 7 Feb 2020 15:59:26 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 15:59:25 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <alpine.LRH.2.02.2002071558040.24277@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/2] dm-bufio: introduce block_to_sector
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qCDS8n6EPxWryekaoALvcg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a function block_to_sector to avoid repetitive code in
the next patch.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2020-02-07 17:09:44.000000000 +0100
+++ linux-2.6/drivers/md/dm-bufio.c	2020-02-07 17:13:09.000000000 +0100
@@ -632,6 +632,21 @@ dmio:
 	submit_bio(bio);
 }
 
+static inline sector_t block_to_sector(struct dm_bufio_client *c, sector_t block)
+{
+	sector_t sector;
+
+	if (unlikely(c->raw_sectors))
+		sector = block;
+	else if (likely(c->sectors_per_block_bits >= 0))
+		sector = block << c->sectors_per_block_bits;
+	else
+		sector = block * (c->block_size >> SECTOR_SHIFT);
+	sector += c->start;
+
+	return sector;
+}
+
 static void submit_io(struct dm_buffer *b, int rw, void (*end_io)(struct dm_buffer *, blk_status_t))
 {
 	unsigned n_sectors;
@@ -640,13 +655,7 @@ static void submit_io(struct dm_buffer *
 
 	b->end_io = end_io;
 
-	if (unlikely(b->c->raw_sectors))
-		sector = b->block;
-	else if (likely(b->c->sectors_per_block_bits >= 0))
-		sector = b->block << b->c->sectors_per_block_bits;
-	else
-		sector = b->block * (b->c->block_size >> SECTOR_SHIFT);
-	sector += b->c->start;
+	sector = block_to_sector(b->c, b->block);
 
 	if (rw != REQ_OP_WRITE) {
 		n_sectors = b->c->block_size >> SECTOR_SHIFT;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

