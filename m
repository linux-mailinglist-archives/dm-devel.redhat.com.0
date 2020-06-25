Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D57EC20AE47
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ED2Gh1+oQ2Vw253TIXYlKaqt9yYhm5Mo+37axrGNAck=;
	b=Cx0Sfa/UN9FmJHLZM8QVjQI/PUq37dtzWXOOa141at77ucha4PXl2NiE8DABXdXYQT6RFp
	rwMYzv+HHRjrinACLAAKFdMpy8Qvdvql0vqIG/n9uEnIQ8ki4yzyp7mTCrpVQ1tSvd1gAQ
	+1Mw9TqoILdBTM+UfJdLLKaHpy5zHTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-2tFZl3qoPFWEmmOfCGBZqw-1; Fri, 26 Jun 2020 04:14:23 -0400
X-MC-Unique: 2tFZl3qoPFWEmmOfCGBZqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46430107ACCA;
	Fri, 26 Jun 2020 08:14:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22AD11A927;
	Fri, 26 Jun 2020 08:14:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5EB91809543;
	Fri, 26 Jun 2020 08:14:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmKbX022038 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F856202A97F; Thu, 25 Jun 2020 11:48:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0862023282
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30F878007CD
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-l9mG51-gMuqNf990r8wIaA-1; Thu, 25 Jun 2020 07:48:18 -0400
X-MC-Unique: l9mG51-gMuqNf990r8wIaA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6X-0001ze-A5; Thu, 25 Jun 2020 11:31:41 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:21 +0100
Message-Id: <20200625113122.7540-6-willy@infradead.org>
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
Subject: [dm-devel] [PATCH 5/6] mm: Replace PF_MEMALLOC_NOIO with
	memalloc_nocma
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We're short on PF_* flags, so make memalloc_nocma its own bit where we
have plenty of space.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/sched.h    |  2 +-
 include/linux/sched/mm.h | 15 +++++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index eaf36ae1fde2..90336850e940 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -803,6 +803,7 @@ struct task_struct {
 #endif
 	unsigned			memalloc_noio:1;
 	unsigned			memalloc_nofs:1;
+	unsigned			memalloc_nocma:1;
 
 	unsigned long			atomic_flags; /* Flags requiring atomic access. */
 
@@ -1514,7 +1515,6 @@ extern struct pid *cad_pid;
 #define PF_UMH			0x02000000	/* I'm an Usermodehelper process */
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to meddle with cpus_mask */
 #define PF_MCE_EARLY		0x08000000      /* Early kill for mce process policy */
-#define PF_MEMALLOC_NOCMA	0x10000000	/* All allocation request will have _GFP_MOVABLE cleared */
 #define PF_IO_WORKER		0x20000000	/* Task is an IO worker */
 #define PF_FREEZER_SKIP		0x40000000	/* Freezer should not count it as freezable */
 #define PF_SUSPEND_TASK		0x80000000      /* This thread called freeze_processes() and should not be frozen */
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 08bc9d0606a8..6f7b59a848a6 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -175,12 +175,11 @@ static inline bool in_vfork(struct task_struct *tsk)
 
 /*
  * Applies per-task gfp context to the given allocation flags.
- * PF_MEMALLOC_NOCMA implies no allocation from CMA region.
  */
 static inline gfp_t current_gfp_context(gfp_t flags)
 {
-	if (unlikely((current->flags & PF_MEMALLOC_NOCMA) ||
-		     current->memalloc_noio || current->memalloc_nofs)) {
+	if (unlikely(current->memalloc_noio || current->memalloc_nofs ||
+		     current->memalloc_nocma)) {
 		/*
 		 * NOIO implies both NOIO and NOFS and it is a weaker context
 		 * so always make sure it makes precedence
@@ -190,7 +189,8 @@ static inline gfp_t current_gfp_context(gfp_t flags)
 		else if (current->memalloc_nofs)
 			flags &= ~__GFP_FS;
 #ifdef CONFIG_CMA
-		if (current->flags & PF_MEMALLOC_NOCMA)
+		/* memalloc_nocma implies no allocation from movable region */
+		if (current->memalloc_nocma)
 			flags &= ~__GFP_MOVABLE;
 #endif
 	}
@@ -286,15 +286,14 @@ static inline void memalloc_noreclaim_restore(unsigned int flags)
 #ifdef CONFIG_CMA
 static inline unsigned int memalloc_nocma_save(void)
 {
-	unsigned int flags = current->flags & PF_MEMALLOC_NOCMA;
-
-	current->flags |= PF_MEMALLOC_NOCMA;
+	unsigned int flags = current->memalloc_nocma;
+	current->memalloc_nocma = 1;
 	return flags;
 }
 
 static inline void memalloc_nocma_restore(unsigned int flags)
 {
-	current->flags = (current->flags & ~PF_MEMALLOC_NOCMA) | flags;
+	current->memalloc_nocma = flags ? 1 : 0;
 }
 #else
 static inline unsigned int memalloc_nocma_save(void)
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

