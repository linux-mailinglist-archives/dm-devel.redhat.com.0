Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AA7F61A00EA
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 00:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586211347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4ianXz2Hsnz5vwzt3Z3J/Sr2yTF6OAO4P5ctl7AhWPA=;
	b=Y7hNUS6G/oLoVlQTTWvdxp9erCP1IVUxjiKDnUau86ChUdNVvGswdgqVfORNENYMdlXIOx
	tLQilO8jFLsneCSDQaCCnNFVMblvqXzf8iIeXfiIeFkrtaCcllzI+Zjuj215l+8VESLrKw
	qBHmou+FsXYYjYpgCmxX9t9Y5G16Jlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-3xPcSEnmNyiQr_Feb4oW9Q-1; Mon, 06 Apr 2020 18:15:44 -0400
X-MC-Unique: 3xPcSEnmNyiQr_Feb4oW9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E9913F7;
	Mon,  6 Apr 2020 22:15:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAF5D60BE1;
	Mon,  6 Apr 2020 22:15:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4154693A7C;
	Mon,  6 Apr 2020 22:15:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036MEwWK018731 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 18:14:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC2AE10BBCC3; Mon,  6 Apr 2020 22:14:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A805C10BBCC0
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 22:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B43800297
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 22:14:57 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-315-ZyDpoP-mP46tDhJ0XtX4iw-1;
	Mon, 06 Apr 2020 18:14:51 -0400
X-MC-Unique: ZyDpoP-mP46tDhJ0XtX4iw-1
Received: from dede-linux.corp.microsoft.com (unknown [131.107.147.242])
	by linux.microsoft.com (Postfix) with ESMTPSA id 157C22072956;
	Mon,  6 Apr 2020 15:14:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 157C22072956
From: deven.desai@linux.microsoft.com
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Mon,  6 Apr 2020 15:14:32 -0700
Message-Id: <20200406221439.1469862-6-deven.desai@linux.microsoft.com>
In-Reply-To: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036MEwWK018731
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@linux.microsoft.com,
	linux-kernel@vger.kernel.org, nramas@linux.microsoft.com,
	tyhicks@linux.microsoft.com, jaskarankhurana@linux.microsoft.com
Subject: [dm-devel] [RFC PATCH v2 05/12] fs: add security blob and hooks for
	block_device
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

From: Deven Bowers <deven.desai@linux.microsoft.com>

Add a security blob and associated allocation, deallocation and set hooks
for a block_device structure.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 fs/block_dev.c                |  8 +++++
 include/linux/fs.h            |  1 +
 include/linux/lsm_hook_defs.h |  5 +++
 include/linux/lsm_hooks.h     | 11 +++++++
 include/linux/security.h      | 22 +++++++++++++
 security/security.c           | 61 +++++++++++++++++++++++++++++++++++
 6 files changed, 108 insertions(+)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 52b6f646cdbd..5dfa25f03208 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -35,6 +35,7 @@
 #include <linux/falloc.h>
 #include <linux/uaccess.h>
 #include <linux/suspend.h>
+#include <linux/security.h>
 #include "internal.h"
 
 struct bdev_inode {
@@ -773,11 +774,18 @@ static struct inode *bdev_alloc_inode(struct super_block *sb)
 	struct bdev_inode *ei = kmem_cache_alloc(bdev_cachep, GFP_KERNEL);
 	if (!ei)
 		return NULL;
+
+	if (unlikely(security_bdev_alloc(&ei->bdev))) {
+		kmem_cache_free(bdev_cachep, ei);
+		return NULL;
+	}
+
 	return &ei->vfs_inode;
 }
 
 static void bdev_free_inode(struct inode *inode)
 {
+	security_bdev_free(&BDEV_I(inode)->bdev);
 	kmem_cache_free(bdev_cachep, BDEV_I(inode));
 }
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f81c822f4d89..03d089f4a511 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -506,6 +506,7 @@ struct block_device {
 	int			bd_fsfreeze_count;
 	/* Mutex for freeze */
 	struct mutex		bd_fsfreeze_mutex;
+	void			*security;
 } __randomize_layout;
 
 /* XArray tags, for tagging dirty and writeback pages in the pagecache. */
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 9cd4455528e5..4782fef7eaf9 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -379,3 +379,8 @@ LSM_HOOK(void, LSM_RET_VOID, perf_event_free, struct perf_event *event)
 LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
 LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
 #endif /* CONFIG_PERF_EVENTS */
+
+LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
+LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
+LSM_HOOK(int, 0, bdev_setsecurity, struct block_device *bdev, const char *name,
+	 const void *value, size_t size)
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 988ca0df7824..7bf0f82bc5d6 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1476,6 +1476,16 @@
  *
  *     @what: kernel feature being accessed
  *
+ * @bdev_alloc_security:
+ *	Initialize the security field inside a block_device structure.
+ *
+ * @bdev_free_security:
+ *	Cleanup the security information stored inside a block_device structure.
+ *
+ * @bdev_setsecurity:
+ *	Set the security property associated with @name for @bdev with
+ *	value @value. @size indicates the size of the @value in bytes.
+ *
  * Security hooks for perf events
  *
  * @perf_event_open:
@@ -1522,6 +1532,7 @@ struct lsm_blob_sizes {
 	int	lbs_ipc;
 	int	lbs_msg_msg;
 	int	lbs_task;
+	int	lbs_bdev;
 };
 
 /*
diff --git a/include/linux/security.h b/include/linux/security.h
index a8d9310472df..714eecc82e08 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -446,6 +446,11 @@ int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
 int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
 int security_locked_down(enum lockdown_reason what);
+int security_bdev_alloc(struct block_device *bdev);
+void security_bdev_free(struct block_device *bdev);
+int security_bdev_setsecurity(struct block_device *bdev,
+			      const char *name, const void *value,
+			      size_t size);
 #else /* CONFIG_SECURITY */
 
 static inline int call_blocking_lsm_notifier(enum lsm_event event, void *data)
@@ -1273,6 +1278,23 @@ static inline int security_locked_down(enum lockdown_reason what)
 {
 	return 0;
 }
+
+static inline int security_bdev_alloc(struct block_device *bdev)
+{
+	return 0;
+}
+
+static inline void security_bdev_free(struct block_device *bdev)
+{
+}
+
+static inline int security_bdev_setsecurity(struct block_device *bdev,
+					    const char *name,
+					    const void *value, size_t size)
+{
+	return 0;
+}
+
 #endif	/* CONFIG_SECURITY */
 
 #ifdef CONFIG_SECURITY_NETWORK
diff --git a/security/security.c b/security/security.c
index 7fed24b9d57e..0d1af27711c1 100644
--- a/security/security.c
+++ b/security/security.c
@@ -28,6 +28,7 @@
 #include <linux/string.h>
 #include <linux/msg.h>
 #include <net/flow.h>
+#include <linux/fs.h>
 
 #define MAX_LSM_EVM_XATTR	2
 
@@ -202,6 +203,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
 	lsm_set_blob_size(&needed->lbs_ipc, &blob_sizes.lbs_ipc);
 	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
 	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
+	lsm_set_blob_size(&needed->lbs_bdev, &blob_sizes.lbs_bdev);
 }
 
 /* Prepare LSM for initialization. */
@@ -337,6 +339,7 @@ static void __init ordered_lsm_init(void)
 	init_debug("ipc blob size      = %d\n", blob_sizes.lbs_ipc);
 	init_debug("msg_msg blob size  = %d\n", blob_sizes.lbs_msg_msg);
 	init_debug("task blob size     = %d\n", blob_sizes.lbs_task);
+	init_debug("bdev blob size     = %d\n", blob_sizes.lbs_bdev);
 
 	/*
 	 * Create any kmem_caches needed for blobs
@@ -654,6 +657,28 @@ static int lsm_msg_msg_alloc(struct msg_msg *mp)
 	return 0;
 }
 
+/**
+ * lsm_bdev_alloc - allocate a composite block_device blob
+ * @bdev: the block_device that needs a blob
+ *
+ * Allocate the block_device blob for all the modules
+ *
+ * Returns 0, or -ENOMEM if memory can't be allocated.
+ */
+static int lsm_bdev_alloc(struct block_device *bdev)
+{
+	if (blob_sizes.lbs_bdev == 0) {
+		bdev->security = NULL;
+		return 0;
+	}
+
+	bdev->security = kzalloc(blob_sizes.lbs_bdev, GFP_KERNEL);
+	if (!bdev->security)
+		return -ENOMEM;
+
+	return 0;
+}
+
 /**
  * lsm_early_task - during initialization allocate a composite task blob
  * @task: the task that needs a blob
@@ -2456,6 +2481,42 @@ int security_locked_down(enum lockdown_reason what)
 }
 EXPORT_SYMBOL(security_locked_down);
 
+int security_bdev_alloc(struct block_device *bdev)
+{
+	int rc = 0;
+
+	rc = lsm_bdev_alloc(bdev);
+	if (unlikely(rc))
+		return rc;
+
+	rc = call_int_hook(bdev_alloc_security, 0, bdev);
+	if (unlikely(rc))
+		security_bdev_free(bdev);
+
+	return 0;
+}
+EXPORT_SYMBOL(security_bdev_alloc);
+
+void security_bdev_free(struct block_device *bdev)
+{
+	if (!bdev->security)
+		return;
+
+	call_void_hook(bdev_free_security, bdev);
+
+	kfree(bdev->security);
+	bdev->security = NULL;
+}
+EXPORT_SYMBOL(security_bdev_free);
+
+int security_bdev_setsecurity(struct block_device *bdev,
+			      const char *name, const void *value,
+			      size_t size)
+{
+	return call_int_hook(bdev_setsecurity, 0, bdev, name, value, size);
+}
+EXPORT_SYMBOL(security_bdev_setsecurity);
+
 #ifdef CONFIG_PERF_EVENTS
 int security_perf_event_open(struct perf_event_attr *attr, int type)
 {
-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

