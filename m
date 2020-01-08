Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DD4C81348C8
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jan 2020 18:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578503119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LevawK1ydBLndL6eXTmF15NCS9nG2ihXt+Vfo44pa2U=;
	b=NC8zldZqv6UfgjwK1fLcJhtcFCMgDdxqjuW+UmbbwnfrPrWGABmqMeFekVG4ptdxI7SGMm
	KuYe7WHO5h7ozzAST2FetU6kbDSMYDm3o8PmBANJ9YSicbkcvxkE1JAU28SuBGjPVMdbZv
	T487xzxwpgGMq+VlPABr11X2UI+nCVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-od_iwUe8PW-hYK2PuGv0zQ-1; Wed, 08 Jan 2020 12:05:18 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B3E184B1E4;
	Wed,  8 Jan 2020 17:05:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E64685D9E5;
	Wed,  8 Jan 2020 17:05:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CD5118034EE;
	Wed,  8 Jan 2020 17:04:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008H4n9c014488 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 12:04:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7CFF272D1; Wed,  8 Jan 2020 17:04:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21440387;
	Wed,  8 Jan 2020 17:04:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 008H4ka5007945; Wed, 8 Jan 2020 12:04:46 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 008H4kRh007941; Wed, 8 Jan 2020 12:04:46 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 8 Jan 2020 12:04:46 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Maged Mokhtar <mmokhtar@petasan.org>
In-Reply-To: <alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2001081202001.7856@file01.intranet.prod.int.rdu2.redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: od_iwUe8PW-hYK2PuGv0zQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BTW. I would be interested if this patch improves performance for you. 
Could you test it?

(you also need my previous patch posted here 
https://www.redhat.com/archives/dm-devel/2020-January/msg00027.html )

Mikulas




dm-writecache: use REQ_FUA when writing the superblock

When writing the superblock, it may be better to submit just one I/O with
the FUA bit set instead of two I/Os.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-01-08 17:56:41.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-01-08 17:56:49.000000000 +0100
@@ -448,7 +448,7 @@ static void writecache_wait_for_ios(stru
 		   !atomic_read(&wc->bio_in_progress[direction]));
 }
 
-static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
+static void ssd_commit_flushed(struct dm_writecache *wc, bool wait_for_ios, bool use_fua)
 {
 	struct dm_io_region region;
 	struct dm_io_request req;
@@ -479,7 +479,7 @@ static void ssd_commit_flushed(struct dm
 		region.sector += wc->start_sector;
 		atomic_inc(&endio.count);
 		req.bi_op = REQ_OP_WRITE;
-		req.bi_op_flags = REQ_SYNC;
+		req.bi_op_flags = REQ_SYNC | (use_fua ? REQ_FUA : 0);
 		req.mem.type = DM_IO_VMA;
 		req.mem.ptr.vma = (char *)wc->memory_map + (size_t)i * BITMAP_GRANULARITY;
 		req.client = wc->dm_io;
@@ -497,17 +497,18 @@ static void ssd_commit_flushed(struct dm
 	if (wait_for_ios)
 		writecache_wait_for_ios(wc, WRITE);
 
-	writecache_disk_flush(wc, wc->ssd_dev);
+	if (!use_fua)
+		writecache_disk_flush(wc, wc->ssd_dev);
 
 	memset(wc->dirty_bitmap, 0, wc->dirty_bitmap_size);
 }
 
-static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
+static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios, bool use_fua)
 {
 	if (WC_MODE_PMEM(wc))
 		wmb();
 	else
-		ssd_commit_flushed(wc, wait_for_ios);
+		ssd_commit_flushed(wc, wait_for_ios, use_fua);
 }
 
 static void writecache_disk_flush(struct dm_writecache *wc, struct dm_dev *dev)
@@ -727,12 +728,12 @@ static void writecache_flush(struct dm_w
 		e = e2;
 		cond_resched();
 	}
-	writecache_commit_flushed(wc, true);
+	writecache_commit_flushed(wc, true, false);
 
 	wc->seq_count++;
 	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
 	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
-	writecache_commit_flushed(wc, false);
+	writecache_commit_flushed(wc, false, true);
 
 	wc->overwrote_committed = false;
 
@@ -756,7 +757,7 @@ static void writecache_flush(struct dm_w
 	}
 
 	if (need_flush_after_free)
-		writecache_commit_flushed(wc, false);
+		writecache_commit_flushed(wc, false, false);
 }
 
 static void writecache_flush_work(struct work_struct *work)
@@ -809,7 +810,7 @@ static void writecache_discard(struct dm
 	}
 
 	if (discarded_something)
-		writecache_commit_flushed(wc, false);
+		writecache_commit_flushed(wc, false, false);
 }
 
 static bool writecache_wait_for_writeback(struct dm_writecache *wc)
@@ -958,7 +959,7 @@ erase_this:
 
 	if (need_flush) {
 		writecache_flush_all_metadata(wc);
-		writecache_commit_flushed(wc, false);
+		writecache_commit_flushed(wc, false, false);
 	}
 
 	wc_unlock(wc);
@@ -1342,7 +1343,7 @@ static void __writecache_endio_pmem(stru
 			wc->writeback_size--;
 			n_walked++;
 			if (unlikely(n_walked >= ENDIO_LATENCY)) {
-				writecache_commit_flushed(wc, false);
+				writecache_commit_flushed(wc, false, false);
 				wc_unlock(wc);
 				wc_lock(wc);
 				n_walked = 0;
@@ -1423,7 +1424,7 @@ pop_from_list:
 			writecache_wait_for_ios(wc, READ);
 		}
 
-		writecache_commit_flushed(wc, false);
+		writecache_commit_flushed(wc, false, false);
 
 		wc_unlock(wc);
 	}
@@ -1766,10 +1767,10 @@ static int init_memory(struct dm_writeca
 		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
 
 	writecache_flush_all_metadata(wc);
-	writecache_commit_flushed(wc, false);
+	writecache_commit_flushed(wc, false, false);
 	pmem_assign(sb(wc)->magic, cpu_to_le32(MEMORY_SUPERBLOCK_MAGIC));
 	writecache_flush_region(wc, &sb(wc)->magic, sizeof sb(wc)->magic);
-	writecache_commit_flushed(wc, false);
+	writecache_commit_flushed(wc, false, false);
 
 	return 0;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

