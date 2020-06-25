Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8346E20AE46
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S2x6e5EkF58q0ZRlFFessYH8Vkoy1gnK34RO4yEovWo=;
	b=Yk8iTtgg5FnTSe/Ixj0ZnlycceR5EmeeZfZRebC/tbvdwtLqD2XOpNOQdLwfTbJS5SBNAh
	iATfVTpx4zQGT8tJznnbJJqdVq2To/uHIzBFKICb9fWSh30N6UroRUkzng68/W5In/MBq0
	8VIBgvWOhMGmNop/a+q2eSi/TILcgdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-qTCUbx8INMmao5iq89jGFA-1; Fri, 26 Jun 2020 04:14:22 -0400
X-MC-Unique: qTCUbx8INMmao5iq89jGFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37661107ACCD;
	Fri, 26 Jun 2020 08:14:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 169E65C578;
	Fri, 26 Jun 2020 08:14:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57429875AE;
	Fri, 26 Jun 2020 08:14:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmRrG022070 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1202202A97F; Thu, 25 Jun 2020 11:48:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECC4D2023282
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAE46858EE2
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:26 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-399-ZLPRK8jKOeGVkMbal7vuow-1; Thu, 25 Jun 2020 07:48:22 -0400
X-MC-Unique: ZLPRK8jKOeGVkMbal7vuow-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6X-0001za-5V; Thu, 25 Jun 2020 11:31:41 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:20 +0100
Message-Id: <20200625113122.7540-5-willy@infradead.org>
In-Reply-To: <20200625113122.7540-1-willy@infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 4/6] mm: Replace PF_MEMALLOC_NOFS with
	memalloc_nofs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We're short on PF_* flags, so make memalloc_nofs its own bit where we
have plenty of space.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c   |  2 +-
 include/linux/sched.h    |  2 +-
 include/linux/sched/mm.h | 13 ++++++-------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index bcfc288dba3f..87d66c13bf5c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1502,7 +1502,7 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
 	 * Given that we do not allow direct reclaim to call us, we should
 	 * never be called in a recursive filesystem reclaim context.
 	 */
-	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
+	if (WARN_ON_ONCE(current->memalloc_nofs))
 		goto redirty;
 
 	/*
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cf18a3d2bc4c..eaf36ae1fde2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -802,6 +802,7 @@ struct task_struct {
 	unsigned			in_memstall:1;
 #endif
 	unsigned			memalloc_noio:1;
+	unsigned			memalloc_nofs:1;
 
 	unsigned long			atomic_flags; /* Flags requiring atomic access. */
 
@@ -1505,7 +1506,6 @@ extern struct pid *cad_pid;
 #define PF_NOFREEZE		0x00008000	/* This thread should not be frozen */
 #define PF_FROZEN		0x00010000	/* Frozen for system suspend */
 #define PF_KSWAPD		0x00020000	/* I am kswapd */
-#define PF_MEMALLOC_NOFS	0x00040000	/* All allocation requests will inherit GFP_NOFS */
 #define PF_LOCAL_THROTTLE	0x00100000	/* Throttle writes only against the bdi I write to,
 						 * I am cleaning dirty pages from some other bdi. */
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index b0089eadc367..08bc9d0606a8 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -175,20 +175,19 @@ static inline bool in_vfork(struct task_struct *tsk)
 
 /*
  * Applies per-task gfp context to the given allocation flags.
- * PF_MEMALLOC_NOFS implies GFP_NOFS
  * PF_MEMALLOC_NOCMA implies no allocation from CMA region.
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
-	if (unlikely(current->flags & (PF_MEMALLOC_NOFS | PF_MEMALLOC_NOCMA) ||
-		     current->memalloc_noio)) {
+	if (unlikely((current->flags & PF_MEMALLOC_NOCMA) ||
+		     current->memalloc_noio || current->memalloc_nofs)) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
 		 */
 		if (current->memalloc_noio)
 			flags &= ~(__GFP_IO | __GFP_FS);
-		else if (current->flags & PF_MEMALLOC_NOFS)
+		else if (current->memalloc_nofs)
 			flags &= ~__GFP_FS;
 #ifdef CONFIG_CMA
 		if (current->flags & PF_MEMALLOC_NOCMA)
@@ -254,8 +253,8 @@ static inline void memalloc_noio_restore(unsigned int flags)
  */
 static inline unsigned int memalloc_nofs_save(void)
 {
-	unsigned int flags = current->flags & PF_MEMALLOC_NOFS;
-	current->flags |= PF_MEMALLOC_NOFS;
+	unsigned int flags = current->memalloc_nofs;
+	current->memalloc_nofs = 1;
 	return flags;
 }
 
@@ -269,7 +268,7 @@ static inline unsigned int memalloc_nofs_save(void)
  */
 static inline void memalloc_nofs_restore(unsigned int flags)
 {
-	current->flags = (current->flags & ~PF_MEMALLOC_NOFS) | flags;
+	current->memalloc_nofs = flags ? 1 : 0;
 }
 
 static inline unsigned int memalloc_noreclaim_save(void)
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

