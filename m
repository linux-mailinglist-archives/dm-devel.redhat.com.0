Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA0518EC00
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=klFCjADTx8hFJ7IuUE8FaNNuuWxdA/03vipa02Y1yNg=;
	b=RM9RONHXr6ROp0K4Gfwpu2zaHsQtqe/IjTzFPYCmw6BWduQ1GnyiSV9nyYFaxDD3JbYxce
	OcUYjoCzeuTC7OqgtssNSIaRHtnU6/XQ4DyFyJx5x24ukqGEZqcr1fmAdvCXwB+U8LueWZ
	RntlhODwHKy726sUoNeif6ylnKHyWlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-cloiwUdcP-eong2R_7FIZg-1; Sun, 22 Mar 2020 15:45:18 -0400
X-MC-Unique: cloiwUdcP-eong2R_7FIZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27EF3801E67;
	Sun, 22 Mar 2020 19:45:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB5C9B928;
	Sun, 22 Mar 2020 19:45:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2824018089CE;
	Sun, 22 Mar 2020 19:45:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiYS0025856 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68F4160C05; Sun, 22 Mar 2020 19:44:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E81660BE2;
	Sun, 22 Mar 2020 19:44:31 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WK-0005y3-2B; Sun, 22 Mar 2020 20:44:29 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:27 +0100
Message-Id: <20200322194427.785921240@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:27 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 7/7] dm integrity: improve discard in journal mode
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
Content-Disposition: inline; filename=dm-integrity-discard-journal.patch

When we discard something that is present in the journal, we flush the
journal first, so that discarded blocks are not overwritten by the journal
content.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-20 17:41:22.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-22 17:30:24.000000000 +0100
@@ -1941,6 +1941,7 @@ static void dm_integrity_map_continue(st
 	unsigned journal_section, journal_entry;
 	unsigned journal_read_pos;
 	struct completion read_comp;
+	bool discard_retried = false;
 	bool need_sync_io = ic->internal_hash && dio->op == REQ_OP_READ;
 	if (unlikely(dio->op == REQ_OP_DISCARD) && ic->mode != 'D')
 		need_sync_io = true;
@@ -2057,6 +2058,20 @@ offload_to_thread:
 			}
 		}
 	}
+	if (ic->mode == 'J' && likely(dio->op == REQ_OP_DISCARD) && !discard_retried) {
+		sector_t next_sector;
+		unsigned new_pos = find_journal_node(ic, dio->range.logical_sector, &next_sector);
+		if (unlikely(new_pos != NOT_FOUND) || unlikely(next_sector < dio->range.logical_sector - dio->range.n_sectors)) {
+			remove_range_unlocked(ic, &dio->range);
+			spin_unlock_irq(&ic->endio_wait.lock);
+			queue_work(ic->commit_wq, &ic->commit_work);
+			flush_workqueue(ic->commit_wq);
+			queue_work(ic->writer_wq, &ic->writer_work);
+			flush_workqueue(ic->writer_wq);
+			discard_retried = true;
+			goto lock_retry;
+		}
+	}
 	spin_unlock_irq(&ic->endio_wait.lock);
 
 	if (unlikely(journal_read_pos != NOT_FOUND)) {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

