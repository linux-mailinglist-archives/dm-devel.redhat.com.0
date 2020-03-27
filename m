Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id AADDC19563E
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 12:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585308208;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qlzUdThixtwqrzRT5uOdtKzeFelL0wndRnRzNzfnYP0=;
	b=T5W3mzdbWrkPMG9N0sstWutrc1qDmyriIE6WWRcJRiNuBuSWusKxkCCugh3mOxoSBnToUx
	g96/BpNDd+sILj6abLUgL2ZDSmJ92dF5j1+/Whn4SVJFlJ/aQ021FFI/f/wXl3toqHL3Bq
	pk8J2zFZSH8jKp8Mo/z5HnwMQfW1VBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ikNU067tNyaKRD9N-okwsg-1; Fri, 27 Mar 2020 07:23:26 -0400
X-MC-Unique: ikNU067tNyaKRD9N-okwsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F7119057A0;
	Fri, 27 Mar 2020 11:23:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E71E5C1BA;
	Fri, 27 Mar 2020 11:23:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFBA48A04B;
	Fri, 27 Mar 2020 11:22:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RBMduH001143 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 07:22:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E782B5E01D; Fri, 27 Mar 2020 11:22:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F985E016;
	Fri, 27 Mar 2020 11:22:37 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02RBMah6027934; Fri, 27 Mar 2020 07:22:36 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02RBMajm027931; Fri, 27 Mar 2020 07:22:36 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 27 Mar 2020 07:22:36 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2003270722100.27885@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: add cond_resched
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Initializing a dm-writecache device can take long time when the persistent
memory device is large. We need to add cond_resched() to the loops to
avoid warnings that the CPU is stuck.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.18+

---
 drivers/md/dm-writecache.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-03-24 18:05:34.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-03-27 09:27:02.000000000 +0100
@@ -923,6 +923,7 @@ static int writecache_alloc_entries(stru
 		struct wc_entry *e = &wc->entries[b];
 		e->index = b;
 		e->write_in_progress = false;
+		cond_resched();
 	}
 
 	return 0;
@@ -977,6 +978,7 @@ static void writecache_resume(struct dm_
 			e->original_sector = le64_to_cpu(wme.original_sector);
 			e->seq_count = le64_to_cpu(wme.seq_count);
 		}
+		cond_resched();
 	}
 #endif
 	for (b = 0; b < wc->n_blocks; b++) {
@@ -1883,8 +1885,10 @@ static int init_memory(struct dm_writeca
 	pmem_assign(sb(wc)->n_blocks, cpu_to_le64(wc->n_blocks));
 	pmem_assign(sb(wc)->seq_count, cpu_to_le64(0));
 
-	for (b = 0; b < wc->n_blocks; b++)
+	for (b = 0; b < wc->n_blocks; b++) {
 		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
+		cond_resched();
+	}
 
 	writecache_flush_all_metadata(wc);
 	writecache_commit_flushed(wc, false);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

