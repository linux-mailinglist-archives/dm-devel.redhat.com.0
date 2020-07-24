Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0A93A22C01F
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 09:45:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-MdGFv-cIOc29pVE8q7cNzQ-1; Fri, 24 Jul 2020 03:45:42 -0400
X-MC-Unique: MdGFv-cIOc29pVE8q7cNzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D08D100CCC8;
	Fri, 24 Jul 2020 07:45:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D43F5C1D3;
	Fri, 24 Jul 2020 07:45:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA0A21809561;
	Fri, 24 Jul 2020 07:45:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06O7jRhW001349 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 03:45:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CECDB2157F24; Fri, 24 Jul 2020 07:45:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9422166B27
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 07:45:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 884388007B3
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 07:45:27 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-K4hIBvgJNzGFKJO-X2byXA-1; Fri, 24 Jul 2020 03:45:23 -0400
X-MC-Unique: K4hIBvgJNzGFKJO-X2byXA-1
Received: from [2001:4bb8:18c:2acc:8dfe:be3c:592c:efc5] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysDD-0006Gv-K6; Fri, 24 Jul 2020 07:33:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 24 Jul 2020 09:33:13 +0200
Message-Id: <20200724073313.138789-15-hch@lst.de>
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [dm-devel] [PATCH 14/14] bdi: replace BDI_CAP_NO_{WRITEBACK,
	ACCT_DIRTY} with a single flag
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace the two negative flags that are always used together with a
single positive flag that indicates the writeback capability instead
of two related non-capabilities.  Also remove the pointless wrappers
to just check the flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/9p/vfs_file.c            |  2 +-
 fs/fs-writeback.c           |  7 +++---
 include/linux/backing-dev.h | 48 ++++++++-----------------------------
 mm/backing-dev.c            |  6 ++---
 mm/filemap.c                |  4 ++--
 mm/memcontrol.c             |  2 +-
 mm/memory-failure.c         |  2 +-
 mm/migrate.c                |  2 +-
 mm/mmap.c                   |  2 +-
 mm/page-writeback.c         | 12 +++++-----
 10 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 92cd1d80218d70..5479d894a10696 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -625,7 +625,7 @@ static void v9fs_mmap_vm_close(struct vm_area_struct *vma)
 
 	inode = file_inode(vma->vm_file);
 
-	if (!mapping_cap_writeback_dirty(inode->i_mapping))
+	if (!mapping_can_writeback(inode->i_mapping))
 		wbc.nr_to_write = 0;
 
 	might_sleep();
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index a605c3dddabc76..e62e48fecff4f9 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2318,7 +2318,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 
 			wb = locked_inode_to_wb_and_lock_list(inode);
 
-			WARN(bdi_cap_writeback_dirty(wb->bdi) &&
+			WARN((wb->bdi->capabilities & BDI_CAP_WRITEBACK) &&
 			     !test_bit(WB_registered, &wb->state),
 			     "bdi-%s not registered\n", bdi_dev_name(wb->bdi));
 
@@ -2343,7 +2343,8 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 			 * to make sure background write-back happens
 			 * later.
 			 */
-			if (bdi_cap_writeback_dirty(wb->bdi) && wakeup_bdi)
+			if (wakeup_bdi &&
+			    (wb->bdi->capabilities & BDI_CAP_WRITEBACK))
 				wb_wakeup_delayed(wb);
 			return;
 		}
@@ -2578,7 +2579,7 @@ int write_inode_now(struct inode *inode, int sync)
 		.range_end = LLONG_MAX,
 	};
 
-	if (!mapping_cap_writeback_dirty(inode->i_mapping))
+	if (!mapping_can_writeback(inode->i_mapping))
 		wbc.nr_to_write = 0;
 
 	might_sleep();
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index b217344a2c63be..44df4fcef65c1e 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -110,27 +110,14 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
 /*
  * Flags in backing_dev_info::capability
  *
- * The first three flags control whether dirty pages will contribute to the
- * VM's accounting and whether writepages() should be called for dirty pages
- * (something that would not, for example, be appropriate for ramfs)
- *
- * WARNING: these flags are closely related and should not normally be
- * used separately.  The BDI_CAP_NO_ACCT_AND_WRITEBACK combines these
- * three flags into a single convenience macro.
- *
- * BDI_CAP_NO_ACCT_DIRTY:  Dirty pages shouldn't contribute to accounting
- * BDI_CAP_NO_WRITEBACK:   Don't write pages back
- * BDI_CAP_WRITEBACK_ACCT: Automatically account writeback pages
- * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
+ * BDI_CAP_WRITEBACK:		Supports dirty page writeback, and dirty pages
+ *				should contribute to accounting
+ * BDI_CAP_WRITEBACK_ACCT:	Automatically account writeback pages
+ * BDI_CAP_STRICTLIMIT:		Keep number of dirty pages below bdi threshold
  */
-#define BDI_CAP_NO_ACCT_DIRTY	0x00000001
-#define BDI_CAP_NO_WRITEBACK	0x00000002
-#define BDI_CAP_WRITEBACK_ACCT	0x00000004
-#define BDI_CAP_STRICTLIMIT	0x00000010
-#define BDI_CAP_CGROUP_WRITEBACK 0x00000020
-
-#define BDI_CAP_NO_ACCT_AND_WRITEBACK \
-	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY)
+#define BDI_CAP_WRITEBACK		(1 << 0)
+#define BDI_CAP_WRITEBACK_ACCT		(1 << 1)
+#define BDI_CAP_STRICTLIMIT		(1 << 2)
 
 extern struct backing_dev_info noop_backing_dev_info;
 
@@ -169,24 +156,9 @@ static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
 long congestion_wait(int sync, long timeout);
 long wait_iff_congested(int sync, long timeout);
 
-static inline bool bdi_cap_writeback_dirty(struct backing_dev_info *bdi)
-{
-	return !(bdi->capabilities & BDI_CAP_NO_WRITEBACK);
-}
-
-static inline bool bdi_cap_account_dirty(struct backing_dev_info *bdi)
-{
-	return !(bdi->capabilities & BDI_CAP_NO_ACCT_DIRTY);
-}
-
-static inline bool mapping_cap_writeback_dirty(struct address_space *mapping)
-{
-	return bdi_cap_writeback_dirty(inode_to_bdi(mapping->host));
-}
-
-static inline bool mapping_cap_account_dirty(struct address_space *mapping)
+static inline bool mapping_can_writeback(struct address_space *mapping)
 {
-	return bdi_cap_account_dirty(inode_to_bdi(mapping->host));
+	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
 static inline int bdi_sched_wait(void *word)
@@ -223,7 +195,7 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
 
 	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
 		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
-		bdi_cap_account_dirty(bdi) &&
+		(bdi->capabilities & BDI_CAP_WRITEBACK) &&
 		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
 }
 
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 5f5958e1d39060..01bd0a4f16096a 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -14,9 +14,7 @@
 #include <linux/device.h>
 #include <trace/events/writeback.h>
 
-struct backing_dev_info noop_backing_dev_info = {
-	.capabilities	= BDI_CAP_NO_ACCT_AND_WRITEBACK,
-};
+struct backing_dev_info noop_backing_dev_info;
 EXPORT_SYMBOL_GPL(noop_backing_dev_info);
 
 static struct class *bdi_class;
@@ -744,7 +742,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
-	bdi->capabilities = BDI_CAP_WRITEBACK_ACCT;
+	bdi->capabilities = BDI_CAP_WRITEBACK | BDI_CAP_WRITEBACK_ACCT;
 	bdi->ra_pages = VM_READAHEAD_PAGES;
 	return bdi;
 }
diff --git a/mm/filemap.c b/mm/filemap.c
index 385759c4ce4be6..89ebadcfecf8e5 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -413,7 +413,7 @@ int __filemap_fdatawrite_range(struct address_space *mapping, loff_t start,
 		.range_end = end,
 	};
 
-	if (!mapping_cap_writeback_dirty(mapping) ||
+	if (!mapping_can_writeback(mapping) ||
 	    !mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		return 0;
 
@@ -1634,7 +1634,7 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
 no_page:
 	if (!page && (fgp_flags & FGP_CREAT)) {
 		int err;
-		if ((fgp_flags & FGP_WRITE) && mapping_cap_account_dirty(mapping))
+		if ((fgp_flags & FGP_WRITE) && mapping_can_writeback(mapping))
 			gfp_mask |= __GFP_WRITE;
 		if (fgp_flags & FGP_NOFS)
 			gfp_mask &= ~__GFP_FS;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 19622328e4b5ac..cb2f1840481f57 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5419,7 +5419,7 @@ static int mem_cgroup_move_account(struct page *page,
 		if (PageDirty(page)) {
 			struct address_space *mapping = page_mapping(page);
 
-			if (mapping_cap_account_dirty(mapping)) {
+			if (mapping_can_writeback(mapping)) {
 				__mod_lruvec_state(from_vec, NR_FILE_DIRTY,
 						   -nr_pages);
 				__mod_lruvec_state(to_vec, NR_FILE_DIRTY,
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 47b8ccb1fb9b85..012e0d315b1f90 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1006,7 +1006,7 @@ static bool hwpoison_user_mappings(struct page *p, unsigned long pfn,
 	 */
 	mapping = page_mapping(hpage);
 	if (!(flags & MF_MUST_KILL) && !PageDirty(hpage) && mapping &&
-	    mapping_cap_writeback_dirty(mapping)) {
+	    mapping_can_writeback(mapping)) {
 		if (page_mkclean(hpage)) {
 			SetPageDirty(hpage);
 		} else {
diff --git a/mm/migrate.c b/mm/migrate.c
index 40cd7016ae6fc6..7e2cafa06428f3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -503,7 +503,7 @@ int migrate_page_move_mapping(struct address_space *mapping,
 			__dec_lruvec_state(old_lruvec, NR_SHMEM);
 			__inc_lruvec_state(new_lruvec, NR_SHMEM);
 		}
-		if (dirty && mapping_cap_account_dirty(mapping)) {
+		if (dirty && mapping_can_writeback(mapping)) {
 			__dec_node_state(oldzone->zone_pgdat, NR_FILE_DIRTY);
 			__dec_zone_state(oldzone, NR_ZONE_WRITE_PENDING);
 			__inc_node_state(newzone->zone_pgdat, NR_FILE_DIRTY);
diff --git a/mm/mmap.c b/mm/mmap.c
index 59a4682ebf3fae..3efb7ae6447fd9 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1665,7 +1665,7 @@ int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
 
 	/* Can the mapping track the dirty pages? */
 	return vma->vm_file && vma->vm_file->f_mapping &&
-		mapping_cap_account_dirty(vma->vm_file->f_mapping);
+		mapping_can_writeback(vma->vm_file->f_mapping);
 }
 
 /*
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 44c4a588f48df5..ad288f1b3052fe 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -1882,7 +1882,7 @@ void balance_dirty_pages_ratelimited(struct address_space *mapping)
 	int ratelimit;
 	int *p;
 
-	if (!bdi_cap_account_dirty(bdi))
+	if (!(bdi->capabilities & BDI_CAP_WRITEBACK))
 		return;
 
 	if (inode_cgwb_enabled(inode))
@@ -2425,7 +2425,7 @@ void account_page_dirtied(struct page *page, struct address_space *mapping)
 
 	trace_writeback_dirty_page(page, mapping);
 
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		struct bdi_writeback *wb;
 
 		inode_attach_wb(inode, page);
@@ -2452,7 +2452,7 @@ void account_page_dirtied(struct page *page, struct address_space *mapping)
 void account_page_cleaned(struct page *page, struct address_space *mapping,
 			  struct bdi_writeback *wb)
 {
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		dec_lruvec_page_state(page, NR_FILE_DIRTY);
 		dec_zone_page_state(page, NR_ZONE_WRITE_PENDING);
 		dec_wb_stat(wb, WB_RECLAIMABLE);
@@ -2515,7 +2515,7 @@ void account_page_redirty(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
 
-	if (mapping && mapping_cap_account_dirty(mapping)) {
+	if (mapping && mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
@@ -2627,7 +2627,7 @@ void __cancel_dirty_page(struct page *page)
 {
 	struct address_space *mapping = page_mapping(page);
 
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
@@ -2667,7 +2667,7 @@ int clear_page_dirty_for_io(struct page *page)
 
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 
-	if (mapping && mapping_cap_account_dirty(mapping)) {
+	if (mapping && mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

