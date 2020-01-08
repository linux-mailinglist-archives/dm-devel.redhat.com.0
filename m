Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5E213469D
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jan 2020 16:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578498400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OU2/wQX+3+6iJfzuUfzERv1pgP2yATvx32NYaHVJhd0=;
	b=Qz3f3010iCUfijgWvmX0HtWY70maPTRG6u+ylQ1GAlLXxh/ZENhcy72PU7VcXKcX0j6/eC
	7u0MxX36vx4B5UP/x1D2Ey1lHNsVkinTUePMXuWz7kVrQv6FEyIo/KGsb7IVaepZExwJ0Y
	UcjeCyl/bzAzKs41Leq2GqtmhOyh62E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-urBbY9XDOGiyROs9cK6MmA-1; Wed, 08 Jan 2020 10:46:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BFD1005502;
	Wed,  8 Jan 2020 15:46:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FC1E86C55;
	Wed,  8 Jan 2020 15:46:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE8A718218AA;
	Wed,  8 Jan 2020 15:46:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008Fk8Gi008448 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 10:46:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE7805C3F8; Wed,  8 Jan 2020 15:46:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 302CB5C296;
	Wed,  8 Jan 2020 15:46:06 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 008Fk5L2000885; Wed, 8 Jan 2020 10:46:05 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 008Fk5Cg000881; Wed, 8 Jan 2020 10:46:05 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 8 Jan 2020 10:46:05 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2001081043420.682@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Maged Mokhtar <mmokhtar@petasan.org>
Subject: [dm-devel] [PATCH] dm-writecache: fix incorrect flush sequence when
 doing commit
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
X-MC-Unique: urBbY9XDOGiyROs9cK6MmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When commiting state, the function writecache_flush does the following:
1. write metadata (writecache_commit_flushed)
2. flush disk cache (writecache_commit_flushed)
3. wait for data writes to complete (writecache_wait_for_ios)
4. increase superblock seq_count
5. write the superblock
6. flush disk cache

It may happen that at step 3, when we wait for some write to finish, the 
disk may report the write as finished, but the write only hit the disk 
cache and it is not yet stored in persistent storage. At step 5 we write 
the superblock - it may happen that the superblock is written before the 
write that we waited for in step 3. If the machine crashes, it may result 
in incorect data being returned after reboot.

In order to fix the bug, we must swap steps 2 and 3 in the above sequence,
so that we first wait for writes to complete and then flush the disk
cache.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# 4.18+
Fixes: 48debafe4f2f ("dm: add writecache target")

---
 drivers/md/dm-writecache.c |   42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-01-08 15:14:51.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-01-08 16:15:43.000000000 +0100
@@ -442,7 +442,13 @@ static void writecache_notify_io(unsigne
 		complete(&endio->c);
 }
 
-static void ssd_commit_flushed(struct dm_writecache *wc)
+static void writecache_wait_for_ios(struct dm_writecache *wc, int direction)
+{
+	wait_event(wc->bio_in_progress_wait[direction],
+		   !atomic_read(&wc->bio_in_progress[direction]));
+}
+
+static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
 {
 	struct dm_io_region region;
 	struct dm_io_request req;
@@ -488,17 +494,20 @@ static void ssd_commit_flushed(struct dm
 	writecache_notify_io(0, &endio);
 	wait_for_completion_io(&endio.c);
 
+	if (wait_for_ios)
+		writecache_wait_for_ios(wc, WRITE);
+
 	writecache_disk_flush(wc, wc->ssd_dev);
 
 	memset(wc->dirty_bitmap, 0, wc->dirty_bitmap_size);
 }
 
-static void writecache_commit_flushed(struct dm_writecache *wc)
+static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
 {
 	if (WC_MODE_PMEM(wc))
 		wmb();
 	else
-		ssd_commit_flushed(wc);
+		ssd_commit_flushed(wc, wait_for_ios);
 }
 
 static void writecache_disk_flush(struct dm_writecache *wc, struct dm_dev *dev)
@@ -522,12 +531,6 @@ static void writecache_disk_flush(struct
 		writecache_error(wc, r, "error flushing metadata: %d", r);
 }
 
-static void writecache_wait_for_ios(struct dm_writecache *wc, int direction)
-{
-	wait_event(wc->bio_in_progress_wait[direction],
-		   !atomic_read(&wc->bio_in_progress[direction]));
-}
-
 #define WFE_RETURN_FOLLOWING	1
 #define WFE_LOWEST_SEQ		2
 
@@ -724,15 +727,12 @@ static void writecache_flush(struct dm_w
 		e = e2;
 		cond_resched();
 	}
-	writecache_commit_flushed(wc);
-
-	if (!WC_MODE_PMEM(wc))
-		writecache_wait_for_ios(wc, WRITE);
+	writecache_commit_flushed(wc, true);
 
 	wc->seq_count++;
 	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
 	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
-	writecache_commit_flushed(wc);
+	writecache_commit_flushed(wc, false);
 
 	wc->overwrote_committed = false;
 
@@ -756,7 +756,7 @@ static void writecache_flush(struct dm_w
 	}
 
 	if (need_flush_after_free)
-		writecache_commit_flushed(wc);
+		writecache_commit_flushed(wc, false);
 }
 
 static void writecache_flush_work(struct work_struct *work)
@@ -809,7 +809,7 @@ static void writecache_discard(struct dm
 	}
 
 	if (discarded_something)
-		writecache_commit_flushed(wc);
+		writecache_commit_flushed(wc, false);
 }
 
 static bool writecache_wait_for_writeback(struct dm_writecache *wc)
@@ -958,7 +958,7 @@ erase_this:
 
 	if (need_flush) {
 		writecache_flush_all_metadata(wc);
-		writecache_commit_flushed(wc);
+		writecache_commit_flushed(wc, false);
 	}
 
 	wc_unlock(wc);
@@ -1342,7 +1342,7 @@ static void __writecache_endio_pmem(stru
 			wc->writeback_size--;
 			n_walked++;
 			if (unlikely(n_walked >= ENDIO_LATENCY)) {
-				writecache_commit_flushed(wc);
+				writecache_commit_flushed(wc, false);
 				wc_unlock(wc);
 				wc_lock(wc);
 				n_walked = 0;
@@ -1423,7 +1423,7 @@ pop_from_list:
 			writecache_wait_for_ios(wc, READ);
 		}
 
-		writecache_commit_flushed(wc);
+		writecache_commit_flushed(wc, false);
 
 		wc_unlock(wc);
 	}
@@ -1766,10 +1766,10 @@ static int init_memory(struct dm_writeca
 		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
 
 	writecache_flush_all_metadata(wc);
-	writecache_commit_flushed(wc);
+	writecache_commit_flushed(wc, false);
 	pmem_assign(sb(wc)->magic, cpu_to_le32(MEMORY_SUPERBLOCK_MAGIC));
 	writecache_flush_region(wc, &sb(wc)->magic, sizeof sb(wc)->magic);
-	writecache_commit_flushed(wc);
+	writecache_commit_flushed(wc, false);
 
 	return 0;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

