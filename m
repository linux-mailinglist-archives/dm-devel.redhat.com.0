Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id ECEAC20AE44
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zU3WgPgZUJBQWWo4HKRGeL6qTbxZmaA35OpSq3XHCKo=;
	b=LLZkl2Iu92z09Jo39kCMBjbpFSp6kW81PqGrUiGM2qfEmwxim9SjaNcxbbFhuRoAgHG3E/
	S3dxBWF13hnSJspUmKpNXsvtH5UwzR5S3fsdG/4yYSCRZo6oHOAUC+DyPPjeREwMK5pGIB
	e5xeg5tz9fzeEzFHGPAt7LltUgM3Tlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-LQOBMKcYPbijE2WVUlY_GA-1; Fri, 26 Jun 2020 04:14:22 -0400
X-MC-Unique: LQOBMKcYPbijE2WVUlY_GA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5080F107ACF2;
	Fri, 26 Jun 2020 08:14:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF69B11CC2C;
	Fri, 26 Jun 2020 08:14:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F665875B0;
	Fri, 26 Jun 2020 08:14:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmGbo022028 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CDA6F6CC5; Thu, 25 Jun 2020 11:48:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E373DF6CC8
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5D441859164
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:13 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-gfFpfAcDPPyzMU_r3EeWag-1; Thu, 25 Jun 2020 07:48:11 -0400
X-MC-Unique: gfFpfAcDPPyzMU_r3EeWag-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6W-0001zO-Ks; Thu, 25 Jun 2020 11:31:40 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:17 +0100
Message-Id: <20200625113122.7540-2-willy@infradead.org>
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
Subject: [dm-devel] [PATCH 1/6] mm: Replace PF_MEMALLOC_NOIO with
	memalloc_noio
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

We're short on PF_* flags, so make memalloc_noio its own bit where we
have plenty of space.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/block/loop.c           |  3 ++-
 drivers/md/dm-zoned-metadata.c |  5 ++---
 include/linux/sched.h          |  2 +-
 include/linux/sched/mm.h       | 30 +++++++++++++++++++++++-------
 kernel/sys.c                   |  8 +++-----
 5 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 475e1a738560..c8742e25e58a 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -52,6 +52,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/stat.h>
@@ -929,7 +930,7 @@ static void loop_unprepare_queue(struct loop_device *lo)
 
 static int loop_kthread_worker_fn(void *worker_ptr)
 {
-	current->flags |= PF_LOCAL_THROTTLE | PF_MEMALLOC_NOIO;
+	set_current_io_flusher();
 	return kthread_worker_fn(worker_ptr);
 }
 
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 130b5a6d9f12..1c5ae674ba20 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1599,9 +1599,8 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 
 	/*
 	 * Get zone information from disk. Since blkdev_report_zones() uses
-	 * GFP_KERNEL by default for memory allocations, set the per-task
-	 * PF_MEMALLOC_NOIO flag so that all allocations are done as if
-	 * GFP_NOIO was specified.
+	 * GFP_KERNEL by default for memory allocations, use
+	 * memalloc_noio_save() to prevent recursion into the driver.
 	 */
 	noio_flag = memalloc_noio_save();
 	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
diff --git a/include/linux/sched.h b/include/linux/sched.h
index b62e6aaf28f0..cf18a3d2bc4c 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -801,6 +801,7 @@ struct task_struct {
 	/* Stalled due to lack of memory */
 	unsigned			in_memstall:1;
 #endif
+	unsigned			memalloc_noio:1;
 
 	unsigned long			atomic_flags; /* Flags requiring atomic access. */
 
@@ -1505,7 +1506,6 @@ extern struct pid *cad_pid;
 #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
 #define PF_KSWAPD		0x00020000	/* I am kswapd */
 #define PF_MEMALLOC_NOFS	0x00040000	/* All allocation requests will inherit GFP_NOFS */
-#define PF_MEMALLOC_NOIO	0x00080000	/* All allocation requests will inherit GFP_NOIO */
 #define PF_LOCAL_THROTTLE	0x00100000	/* Throttle writes only against the bdi I write to,
 						 * I am cleaning dirty pages from some other bdi. */
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 480a4d1b7dd8..1a7e1ab1be85 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -175,19 +175,18 @@ static inline bool in_vfork(struct task_struct *tsk)
 
 /*
  * Applies per-task gfp context to the given allocation flags.
- * PF_MEMALLOC_NOIO implies GFP_NOIO
  * PF_MEMALLOC_NOFS implies GFP_NOFS
  * PF_MEMALLOC_NOCMA implies no allocation from CMA region.
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
-	if (unlikely(current->flags &
-		     (PF_MEMALLOC_NOIO | PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA))) {
+	if (unlikely(current->flags & (PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA) ||
+		     current->memalloc_noio)) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
 		 */
-		if (current->flags & PF_MEMALLOC_NOIO)
+		if (current->memalloc_noio)
 			flags &= ~(__GFP_IO | __GFP_FS);
 		else if (current->flags & PF_MEMALLOC_NOFS)
 			flags &= ~__GFP_FS;
@@ -224,8 +223,8 @@ static inline void fs_reclaim_release(gfp_t gfp_mask) { }
  */
 static inline unsigned int memalloc_noio_save(void)
 {
-	unsigned int flags = current->flags & PF_MEMALLOC_NOIO;
-	current->flags |= PF_MEMALLOC_NOIO;
+	unsigned int flags = current->memalloc_noio;
+	current->memalloc_noio = 1;
 	return flags;
 }
 
@@ -239,7 +238,7 @@ static inline unsigned int memalloc_noio_save(void)
  */
 static inline void memalloc_noio_restore(unsigned int flags)
 {
-	current->flags = (current->flags & ~PF_MEMALLOC_NOIO) | flags;
+	current->memalloc_noio = flags ? 1 : 0;
 }
 
 /**
@@ -309,6 +308,23 @@ static inline void memalloc_nocma_restore(unsigned int flags)
 }
 #endif
 
+static inline void set_current_io_flusher(void)
+{
+	current->flags |= PF_LOCAL_THROTTLE;
+	current->memalloc_noio = 1;
+}
+
+static inline void clear_current_io_flusher(void)
+{
+	current->flags &= ~PF_LOCAL_THROTTLE;
+	current->memalloc_noio = 0;
+}
+
+static inline bool get_current_io_flusher(void)
+{
+	return current->flags & PF_LOCAL_THROTTLE;
+}
+
 #ifdef CONFIG_MEMCG
 /**
  * memalloc_use_memcg - Starts the remote memcg charging scope.
diff --git a/kernel/sys.c b/kernel/sys.c
index 00a96746e28a..78c90d1e92f4 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2275,8 +2275,6 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
-#define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
-
 SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		unsigned long, arg4, unsigned long, arg5)
 {
@@ -2512,9 +2510,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 
 		if (arg2 == 1)
-			current->flags |= PR_IO_FLUSHER;
+			set_current_io_flusher();
 		else if (!arg2)
-			current->flags &= ~PR_IO_FLUSHER;
+			clear_current_io_flusher();
 		else
 			return -EINVAL;
 		break;
@@ -2525,7 +2523,7 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		if (arg2 || arg3 || arg4 || arg5)
 			return -EINVAL;
 
-		error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
+		error = get_current_io_flusher();
 		break;
 	default:
 		error = -EINVAL;
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

