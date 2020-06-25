Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2F820AE48
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1IgJ5ZGgoKfv14PgqqH1MUxnCfjxw2k2vV60DY3uyLA=;
	b=NWMGC5NECtBtHGivh0QHaMt4OtX/SNHx1tqHSuZSjdM9duvpNaxTSgHclhk92Yw8HtRT/U
	08qt7Gf5Hx87jHPDbpW3NsjX4yE0G2eQtfThXNZ5/2Gs7Tq6WQKw8wpCOPN6VcWgpybIWI
	UTXCqnTc+Oujd71P1SxZJuVevDzC8uI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-br_nGSw8ORmWqJNETYOc7A-1; Fri, 26 Jun 2020 04:14:24 -0400
X-MC-Unique: br_nGSw8ORmWqJNETYOc7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D4E8064B0;
	Fri, 26 Jun 2020 08:14:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A5C610F3;
	Fri, 26 Jun 2020 08:14:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 938081809543;
	Fri, 26 Jun 2020 08:14:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PBmVUc022079 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 07:48:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBF2F11921AA; Thu, 25 Jun 2020 11:48:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7B7711921A7
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80698007AC
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 11:48:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-r-ACViR8MrG5wgGeNfd8pA-1; Thu, 25 Jun 2020 07:48:24 -0400
X-MC-Unique: r-ACViR8MrG5wgGeNfd8pA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1joQ6X-0001zW-0b; Thu, 25 Jun 2020 11:31:41 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Thu, 25 Jun 2020 12:31:19 +0100
Message-Id: <20200625113122.7540-4-willy@infradead.org>
In-Reply-To: <20200625113122.7540-1-willy@infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/6] xfs: Convert to memalloc_nofs_save
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of using custom macros to set/restore PF_MEMALLOC_NOFS, use
memalloc_nofs_save() like the rest of the kernel.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/xfs/kmem.c      |  2 +-
 fs/xfs/xfs_aops.c  |  4 ++--
 fs/xfs/xfs_buf.c   |  2 +-
 fs/xfs/xfs_linux.h |  6 ------
 fs/xfs/xfs_trans.c | 14 +++++++-------
 fs/xfs/xfs_trans.h |  2 +-
 6 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/fs/xfs/kmem.c b/fs/xfs/kmem.c
index f1366475c389..c2d237159bfc 100644
--- a/fs/xfs/kmem.c
+++ b/fs/xfs/kmem.c
@@ -35,7 +35,7 @@ kmem_alloc(size_t size, xfs_km_flags_t flags)
  * __vmalloc() will allocate data pages and auxiliary structures (e.g.
  * pagetables) with GFP_KERNEL, yet we may be under GFP_NOFS context here. Hence
  * we need to tell memory reclaim that we are in such a context via
- * PF_MEMALLOC_NOFS to prevent memory reclaim re-entering the filesystem here
+ * memalloc_nofs to prevent memory reclaim re-entering the filesystem here
  * and potentially deadlocking.
  */
 static void *
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index b35611882ff9..e3a4806e519d 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -62,7 +62,7 @@ xfs_setfilesize_trans_alloc(
 	 * We hand off the transaction to the completion thread now, so
 	 * clear the flag here.
 	 */
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	memalloc_nofs_restore(tp->t_memalloc);
 	return 0;
 }
 
@@ -125,7 +125,7 @@ xfs_setfilesize_ioend(
 	 * thus we need to mark ourselves as being in a transaction manually.
 	 * Similarly for freeze protection.
 	 */
-	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	tp->t_memalloc = memalloc_nofs_save();
 	__sb_writers_acquired(VFS_I(ip)->i_sb, SB_FREEZE_FS);
 
 	/* we abort the update if there was an IO error */
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 20b748f7e186..b2c3d01c690b 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -470,7 +470,7 @@ _xfs_buf_map_pages(
 		 * vm_map_ram() will allocate auxiliary structures (e.g.
 		 * pagetables) with GFP_KERNEL, yet we are likely to be under
 		 * GFP_NOFS context here. Hence we need to tell memory reclaim
-		 * that we are in such a context via PF_MEMALLOC_NOFS to prevent
+		 * that we are in such a context via memalloc_nofs to prevent
 		 * memory reclaim re-entering the filesystem here and
 		 * potentially deadlocking.
 		 */
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index 9f70d2f68e05..e1daf242a53b 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -104,12 +104,6 @@ typedef __u32			xfs_nlink_t;
 #define current_cpu()		(raw_smp_processor_id())
 #define current_pid()		(current->pid)
 #define current_test_flags(f)	(current->flags & (f))
-#define current_set_flags_nested(sp, f)		\
-		(*(sp) = current->flags, current->flags |= (f))
-#define current_clear_flags_nested(sp, f)	\
-		(*(sp) = current->flags, current->flags &= ~(f))
-#define current_restore_flags_nested(sp, f)	\
-		(current->flags = ((current->flags & ~(f)) | (*(sp) & (f))))
 
 #define NBBY		8		/* number of bits per byte */
 
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 3c94e5ff4316..4ef1a0ff0a11 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -118,7 +118,7 @@ xfs_trans_dup(
 
 	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
 	tp->t_rtx_res = tp->t_rtx_res_used;
-	ntp->t_pflags = tp->t_pflags;
+	ntp->t_memalloc = tp->t_memalloc;
 
 	/* move deferred ops over to the new tp */
 	xfs_defer_move(ntp, tp);
@@ -153,7 +153,7 @@ xfs_trans_reserve(
 	bool			rsvd = (tp->t_flags & XFS_TRANS_RESERVE) != 0;
 
 	/* Mark this thread as being in a transaction */
-	current_set_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	tp->t_memalloc = memalloc_nofs_save();
 
 	/*
 	 * Attempt to reserve the needed disk blocks by decrementing
@@ -163,7 +163,7 @@ xfs_trans_reserve(
 	if (blocks > 0) {
 		error = xfs_mod_fdblocks(mp, -((int64_t)blocks), rsvd);
 		if (error != 0) {
-			current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+			memalloc_nofs_restore(tp->t_memalloc);
 			return -ENOSPC;
 		}
 		tp->t_blk_res += blocks;
@@ -240,7 +240,7 @@ xfs_trans_reserve(
 		tp->t_blk_res = 0;
 	}
 
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	memalloc_nofs_restore(tp->t_memalloc);
 
 	return error;
 }
@@ -861,7 +861,7 @@ __xfs_trans_commit(
 
 	xfs_log_commit_cil(mp, tp, &commit_lsn, regrant);
 
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	memalloc_nofs_restore(tp->t_memalloc);
 	xfs_trans_free(tp);
 
 	/*
@@ -893,7 +893,7 @@ __xfs_trans_commit(
 			xfs_log_ticket_ungrant(mp->m_log, tp->t_ticket);
 		tp->t_ticket = NULL;
 	}
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	memalloc_nofs_restore(tp->t_memalloc);
 	xfs_trans_free_items(tp, !!error);
 	xfs_trans_free(tp);
 
@@ -954,7 +954,7 @@ xfs_trans_cancel(
 	}
 
 	/* mark this thread as no longer being in a transaction */
-	current_restore_flags_nested(&tp->t_pflags, PF_MEMALLOC_NOFS);
+	memalloc_nofs_restore(tp->t_memalloc);
 
 	xfs_trans_free_items(tp, dirty);
 	xfs_trans_free(tp);
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 8308bf6d7e40..7aa2d5ff9245 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -118,6 +118,7 @@ typedef struct xfs_trans {
 	unsigned int		t_rtx_res;	/* # of rt extents resvd */
 	unsigned int		t_rtx_res_used;	/* # of resvd rt extents used */
 	unsigned int		t_flags;	/* misc flags */
+	unsigned int		t_memalloc;	/* saved memalloc state */
 	xfs_fsblock_t		t_firstblock;	/* first block allocated */
 	struct xlog_ticket	*t_ticket;	/* log mgr ticket */
 	struct xfs_mount	*t_mountp;	/* ptr to fs mount struct */
@@ -144,7 +145,6 @@ typedef struct xfs_trans {
 	struct list_head	t_items;	/* log item descriptors */
 	struct list_head	t_busy;		/* list of busy extents */
 	struct list_head	t_dfops;	/* deferred operations */
-	unsigned long		t_pflags;	/* saved process flags state */
 } xfs_trans_t;
 
 /*
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

