Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F145B4612A9
	for <lists+dm-devel@lfdr.de>; Mon, 29 Nov 2021 11:40:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-239-EzIoouLrN2GLOWiDtmAsLg-1; Mon, 29 Nov 2021 05:40:26 -0500
X-MC-Unique: EzIoouLrN2GLOWiDtmAsLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0CFB1006ABB;
	Mon, 29 Nov 2021 10:40:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AA6196F4;
	Mon, 29 Nov 2021 10:40:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC8D91802FEA;
	Mon, 29 Nov 2021 10:40:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATAeC8i014544 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 05:40:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DFBD1121319; Mon, 29 Nov 2021 10:40:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 099721121315
	for <dm-devel@redhat.com>; Mon, 29 Nov 2021 10:40:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 020CA85A5AA
	for <dm-devel@redhat.com>; Mon, 29 Nov 2021 10:40:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-249-ikDokDiuN1GdcvT7liWntg-1; Mon, 29 Nov 2021 05:40:03 -0500
X-MC-Unique: ikDokDiuN1GdcvT7liWntg-1
Received: from [2001:4bb8:184:4a23:724a:c057:c7bf:4643] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdno-0073RZ-N9; Mon, 29 Nov 2021 10:22:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 29 Nov 2021 11:21:52 +0100
Message-Id: <20211129102203.2243509-19-hch@lst.de>
In-Reply-To: <20211129102203.2243509-1-hch@lst.de>
References: <20211129102203.2243509-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: [dm-devel] [PATCH 18/29] fsdax: decouple zeroing from the iomap
	buffered I/O code
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

Unshare the DAX and iomap buffered I/O page zeroing code.  This code
previously did a IS_DAX check deep inside the iomap code, which in
fact was the only DAX check in the code.  Instead move these checks
into the callers.  Most callers already have DAX special casing anyway
and XFS will need it for reflink support as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c               | 77 ++++++++++++++++++++++++++++++++++--------
 fs/ext2/inode.c        |  7 ++--
 fs/ext4/inode.c        |  5 +--
 fs/iomap/buffered-io.c | 35 +++++++------------
 fs/xfs/xfs_iomap.c     |  7 +++-
 include/linux/dax.h    |  7 +++-
 6 files changed, 94 insertions(+), 44 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index d5db1297a0bb6..43d58b4219fd0 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1135,24 +1135,73 @@ static int dax_memzero(struct dax_device *dax_dev, pgoff_t pgoff,
 	return ret;
 }
 
-s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
+static s64 dax_zero_iter(struct iomap_iter *iter, bool *did_zero)
 {
-	pgoff_t pgoff = dax_iomap_pgoff(iomap, pos);
-	long rc, id;
-	unsigned offset = offset_in_page(pos);
-	unsigned size = min_t(u64, PAGE_SIZE - offset, length);
+	const struct iomap *iomap = &iter->iomap;
+	const struct iomap *srcmap = iomap_iter_srcmap(iter);
+	loff_t pos = iter->pos;
+	u64 length = iomap_length(iter);
+	s64 written = 0;
+
+	/* already zeroed?  we're done. */
+	if (srcmap->type == IOMAP_HOLE || srcmap->type == IOMAP_UNWRITTEN)
+		return length;
+
+	do {
+		unsigned offset = offset_in_page(pos);
+		unsigned size = min_t(u64, PAGE_SIZE - offset, length);
+		pgoff_t pgoff = dax_iomap_pgoff(iomap, pos);
+		long rc;
+		int id;
 
-	id = dax_read_lock();
-	if (IS_ALIGNED(pos, PAGE_SIZE) && size == PAGE_SIZE)
-		rc = dax_zero_page_range(iomap->dax_dev, pgoff, 1);
-	else
-		rc = dax_memzero(iomap->dax_dev, pgoff, offset, size);
-	dax_read_unlock(id);
+		id = dax_read_lock();
+		if (IS_ALIGNED(pos, PAGE_SIZE) && size == PAGE_SIZE)
+			rc = dax_zero_page_range(iomap->dax_dev, pgoff, 1);
+		else
+			rc = dax_memzero(iomap->dax_dev, pgoff, offset, size);
+		dax_read_unlock(id);
 
-	if (rc < 0)
-		return rc;
-	return size;
+		if (rc < 0)
+			return rc;
+		pos += size;
+		length -= size;
+		written += size;
+		if (did_zero)
+			*did_zero = true;
+	} while (length > 0);
+
+	return written;
+}
+
+int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
+		const struct iomap_ops *ops)
+{
+	struct iomap_iter iter = {
+		.inode		= inode,
+		.pos		= pos,
+		.len		= len,
+		.flags		= IOMAP_ZERO,
+	};
+	int ret;
+
+	while ((ret = iomap_iter(&iter, ops)) > 0)
+		iter.processed = dax_zero_iter(&iter, did_zero);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dax_zero_range);
+
+int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
+		const struct iomap_ops *ops)
+{
+	unsigned int blocksize = i_blocksize(inode);
+	unsigned int off = pos & (blocksize - 1);
+
+	/* Block boundary? Nothing to do */
+	if (!off)
+		return 0;
+	return dax_zero_range(inode, pos, blocksize - off, did_zero, ops);
 }
+EXPORT_SYMBOL_GPL(dax_truncate_page);
 
 static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 		struct iov_iter *iter)
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 333fa62661d56..01d69618277de 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -36,6 +36,7 @@
 #include <linux/iomap.h>
 #include <linux/namei.h>
 #include <linux/uio.h>
+#include <linux/dax.h>
 #include "ext2.h"
 #include "acl.h"
 #include "xattr.h"
@@ -1297,9 +1298,9 @@ static int ext2_setsize(struct inode *inode, loff_t newsize)
 	inode_dio_wait(inode);
 
 	if (IS_DAX(inode)) {
-		error = iomap_zero_range(inode, newsize,
-					 PAGE_ALIGN(newsize) - newsize, NULL,
-					 &ext2_iomap_ops);
+		error = dax_zero_range(inode, newsize,
+				       PAGE_ALIGN(newsize) - newsize, NULL,
+				       &ext2_iomap_ops);
 	} else if (test_opt(inode->i_sb, NOBH))
 		error = nobh_truncate_page(inode->i_mapping,
 				newsize, ext2_get_block);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bfd3545f1e5d9..d316a2009489b 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -41,6 +41,7 @@
 #include <linux/bitops.h>
 #include <linux/iomap.h>
 #include <linux/iversion.h>
+#include <linux/dax.h>
 
 #include "ext4_jbd2.h"
 #include "xattr.h"
@@ -3780,8 +3781,8 @@ static int ext4_block_zero_page_range(handle_t *handle,
 		length = max;
 
 	if (IS_DAX(inode)) {
-		return iomap_zero_range(inode, from, length, NULL,
-					&ext4_iomap_ops);
+		return dax_zero_range(inode, from, length, NULL,
+				      &ext4_iomap_ops);
 	}
 	return __ext4_block_zero_page_range(handle, mapping, from, length);
 }
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 71a36ae120ee8..f3176cf90351f 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -876,26 +876,8 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
 }
 EXPORT_SYMBOL_GPL(iomap_file_unshare);
 
-static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
-{
-	struct page *page;
-	int status;
-	unsigned offset = offset_in_page(pos);
-	unsigned bytes = min_t(u64, PAGE_SIZE - offset, length);
-
-	status = iomap_write_begin(iter, pos, bytes, &page);
-	if (status)
-		return status;
-
-	zero_user(page, offset, bytes);
-	mark_page_accessed(page);
-
-	return iomap_write_end(iter, pos, bytes, bytes, page);
-}
-
 static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 {
-	struct iomap *iomap = &iter->iomap;
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
 	loff_t pos = iter->pos;
 	loff_t length = iomap_length(iter);
@@ -906,12 +888,19 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 		return length;
 
 	do {
-		s64 bytes;
+		unsigned offset = offset_in_page(pos);
+		size_t bytes = min_t(u64, PAGE_SIZE - offset, length);
+		struct page *page;
+		int status;
 
-		if (IS_DAX(iter->inode))
-			bytes = dax_iomap_zero(pos, length, iomap);
-		else
-			bytes = __iomap_zero_iter(iter, pos, length);
+		status = iomap_write_begin(iter, pos, bytes, &page);
+		if (status)
+			return status;
+
+		zero_user(page, offset, bytes);
+		mark_page_accessed(page);
+
+		bytes = iomap_write_end(iter, pos, bytes, bytes, page);
 		if (bytes < 0)
 			return bytes;
 
diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index d6d71ae9f2ae4..6a0c3b307bd73 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -28,7 +28,6 @@
 #include "xfs_dquot.h"
 #include "xfs_reflink.h"
 
-
 #define XFS_ALLOC_ALIGN(mp, off) \
 	(((off) >> mp->m_allocsize_log) << mp->m_allocsize_log)
 
@@ -1321,6 +1320,9 @@ xfs_zero_range(
 {
 	struct inode		*inode = VFS_I(ip);
 
+	if (IS_DAX(inode))
+		return dax_zero_range(inode, pos, len, did_zero,
+				      &xfs_buffered_write_iomap_ops);
 	return iomap_zero_range(inode, pos, len, did_zero,
 				&xfs_buffered_write_iomap_ops);
 }
@@ -1333,6 +1335,9 @@ xfs_truncate_page(
 {
 	struct inode		*inode = VFS_I(ip);
 
+	if (IS_DAX(inode))
+		return dax_truncate_page(inode, pos, did_zero,
+					&xfs_buffered_write_iomap_ops);
 	return iomap_truncate_page(inode, pos, did_zero,
 				   &xfs_buffered_write_iomap_ops);
 }
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 324363b798ecd..b79036743e7fa 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -14,6 +14,7 @@ typedef unsigned long dax_entry_t;
 struct dax_device;
 struct gendisk;
 struct iomap_ops;
+struct iomap_iter;
 struct iomap;
 
 struct dax_operations {
@@ -170,6 +171,11 @@ static inline void dax_unlock_page(struct page *page, dax_entry_t cookie)
 }
 #endif
 
+int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
+		const struct iomap_ops *ops);
+int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
+		const struct iomap_ops *ops);
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
@@ -204,7 +210,6 @@ vm_fault_t dax_finish_sync_fault(struct vm_fault *vmf,
 int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index);
 int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
 				      pgoff_t index);
-s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap);
 static inline bool dax_mapping(struct address_space *mapping)
 {
 	return mapping->host && IS_DAX(mapping->host);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

