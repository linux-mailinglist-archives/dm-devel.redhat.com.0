Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 740BA20AE49
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1C7zzMH7wuwhZR/FdNLcWpkv6YDX1F3kC2a74UQsrIo=;
	b=afPjPXWnyjgQgbX5XlHkPXxhh+tXLXo+Xo1bOp9TQsNBb6+Xum7LstocNQwr7w3GX/bod5
	4uMzdcYaDcdinNK/ACRIdDHPwbQKk4sVoO414xoowRiU7mf70tyg3m2u+99juaV1R6XgMM
	HGxuGEDP57vQ5VNgqOWgGG9J10uwozs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-FVKO4WOpMb6728QW09cjOg-1; Fri, 26 Jun 2020 04:14:26 -0400
X-MC-Unique: FVKO4WOpMb6728QW09cjOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20B718A823A;
	Fri, 26 Jun 2020 08:14:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C430A80889;
	Fri, 26 Jun 2020 08:14:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88475875B0;
	Fri, 26 Jun 2020 08:14:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmMJ3022046 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ED9CF6CCB; Thu, 25 Jun 2020 11:48:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AAADF6CC5
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 595B68007A4
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:22 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-zfME3Rh4PPyiIAKR93MFuA-1; Thu, 25 Jun 2020 07:48:20 -0400
X-MC-Unique: zfME3Rh4PPyiIAKR93MFuA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6X-0001zi-Ea; Thu, 25 Jun 2020 11:31:41 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:22 +0100
Message-Id: <20200625113122.7540-7-willy@infradead.org>
In-Reply-To: <20200625113122.7540-1-willy@infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
guarantees we will not sleep to reclaim memory.  Use it to simplify
dm-bufio's allocations.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/md/dm-bufio.c    | 30 ++++++++----------------------
 include/linux/sched.h    |  1 +
 include/linux/sched/mm.h | 12 ++++++++----
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 6d1565021d74..140ada9a2c8f 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -412,23 +412,6 @@ static void *alloc_buffer_data(struct dm_bufio_client *c, gfp_t gfp_mask,
 
 	*data_mode = DATA_MODE_VMALLOC;
 
-	/*
-	 * __vmalloc allocates the data pages and auxiliary structures with
-	 * gfp_flags that were specified, but pagetables are always allocated
-	 * with GFP_KERNEL, no matter what was specified as gfp_mask.
-	 *
-	 * Consequently, we must set per-process flag PF_MEMALLOC_NOIO so that
-	 * all allocations done by this process (including pagetables) are done
-	 * as if GFP_NOIO was specified.
-	 */
-	if (gfp_mask & __GFP_NORETRY) {
-		unsigned noio_flag = memalloc_noio_save();
-		void *ptr = __vmalloc(c->block_size, gfp_mask);
-
-		memalloc_noio_restore(noio_flag);
-		return ptr;
-	}
-
 	return __vmalloc(c->block_size, gfp_mask);
 }
 
@@ -866,9 +849,6 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
 	 * dm-bufio is resistant to allocation failures (it just keeps
 	 * one buffer reserved in cases all the allocations fail).
 	 * So set flags to not try too hard:
-	 *	GFP_NOWAIT: don't wait; if we need to sleep we'll release our
-	 *		    mutex and wait ourselves.
-	 *	__GFP_NORETRY: don't retry and rather return failure
 	 *	__GFP_NOMEMALLOC: don't use emergency reserves
 	 *	__GFP_NOWARN: don't print a warning in case of failure
 	 *
@@ -877,7 +857,9 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
 	 */
 	while (1) {
 		if (dm_bufio_cache_size_latch != 1) {
-			b = alloc_buffer(c, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
+			unsigned nowait_flag = memalloc_nowait_save();
+			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
+			memalloc_nowait_restore(nowait_flag);
 			if (b)
 				return b;
 		}
@@ -886,8 +868,12 @@ static struct dm_buffer *__alloc_buffer_wait_no_callback(struct dm_bufio_client
 			return NULL;
 
 		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
+			unsigned noio_flag;
+
 			dm_bufio_unlock(c);
-			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
+			noio_flag = memalloc_noio_save();
+			b = alloc_buffer(c, GFP_KERNEL | __GFP_NOMEMALLOC | __GFP_NOWARN);
+			memalloc_noio_restore(noio_flag);
 			dm_bufio_lock(c);
 			if (b)
 				return b;
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 90336850e940..b1c2cddd366c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -803,6 +803,7 @@ struct task_struct {
 #endif
 	unsigned			memalloc_noio:1;
 	unsigned			memalloc_nofs:1;
+	unsigned			memalloc_nowait:1;
 	unsigned			memalloc_nocma:1;
 
 	unsigned long			atomic_flags; /* Flags requiring atomic access. */
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 6f7b59a848a6..6484569f50df 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -179,12 +179,16 @@ static inline bool in_vfork(struct task_struct *tsk)
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
 	if (unlikely(current->memalloc_noio || current->memalloc_nofs ||
-		     current->memalloc_nocma)) {
+		     current->memalloc_nocma) || current->memalloc_nowait) {
 		/*
-		 * NOIO implies both NOIO and NOFS and it is a weaker context
-		 * so always make sure it makes precedence
+		 * Clearing DIRECT_RECLAIM means we won't get to the point
+		 * of testing IO or FS, so we don't need to bother clearing
+		 * them.  noio implies neither IO nor FS and it is a weaker
+		 * context so always make sure it takes precedence.
 		 */
-		if (current->memalloc_noio)
+		if (current->memalloc_nowait)
+			flags &= ~__GFP_DIRECT_RECLAIM;
+		else if (current->memalloc_noio)
 			flags &= ~(__GFP_IO | __GFP_FS);
 		else if (current->memalloc_nofs)
 			flags &= ~__GFP_FS;
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

