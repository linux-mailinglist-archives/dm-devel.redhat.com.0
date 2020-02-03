Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D18DC1510B0
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 21:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580760084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Kz2Qp92CCZzTSlGrB6CWEor651GSc8f2NL03+DevHnI=;
	b=NNlyrQixDUZYmz+VWnf1hj6WfPBpxFDXoUh5QpQW/aZ1HhhucfEL05fTz7zEUJqkXc6kDy
	ZpAi25F9erpl7h9CPfBnJLGM7l3tO+IgOrnnFOiRJKY41tW5dWtXTRNniJ2xpu3xhID/cm
	jXNAn9/NGKR6GiVoTYY6PVgg+jXU4KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-KIoxXOY8N7qKgm2EQdaFEw-1; Mon, 03 Feb 2020 15:01:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929E3800D5E;
	Mon,  3 Feb 2020 20:01:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50FF090F63;
	Mon,  3 Feb 2020 20:01:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A80388173E;
	Mon,  3 Feb 2020 20:01:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013K0nCk021376 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 15:00:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A130E5C3FA; Mon,  3 Feb 2020 20:00:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CB865C1B5;
	Mon,  3 Feb 2020 20:00:49 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 22CDD224750; Mon,  3 Feb 2020 15:00:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Mon,  3 Feb 2020 15:00:29 -0500
Message-Id: <20200203200029.4592-6-vgoyal@redhat.com>
In-Reply-To: <20200203200029.4592-1-vgoyal@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 5/5] dax,
	iomap: Add helper dax_iomap_zero() to zero a range
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
X-MC-Unique: KIoxXOY8N7qKgm2EQdaFEw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a helper dax_ioamp_zero() to zero a range. This patch basically
merges __dax_zero_page_range() and iomap_dax_zero().

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/dax.c               | 12 ++++++------
 fs/iomap/buffered-io.c |  9 +--------
 include/linux/dax.h    | 11 +++++------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 1b9ba6b59cdb..63303e274221 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1059,23 +1059,23 @@ int generic_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 }
 EXPORT_SYMBOL_GPL(generic_dax_zero_page_range);
 
-int __dax_zero_page_range(struct block_device *bdev,
-		struct dax_device *dax_dev, sector_t sector,
-		unsigned int offset, unsigned int size)
+int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
+			      struct iomap *iomap)
 {
 	pgoff_t pgoff;
 	long rc, id;
+	sector_t sector = iomap_sector(iomap, pos & PAGE_MASK);
 
-	rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
+	rc = bdev_dax_pgoff(iomap->bdev, sector, PAGE_SIZE, &pgoff);
 	if (rc)
 		return rc;
 
 	id = dax_read_lock();
-	rc = dax_zero_page_range(dax_dev, pgoff, offset, size);
+	rc = dax_zero_page_range(iomap->dax_dev, pgoff, offset, size);
 	dax_read_unlock(id);
 	return rc;
 }
-EXPORT_SYMBOL_GPL(__dax_zero_page_range);
+EXPORT_SYMBOL_GPL(dax_iomap_zero);
 
 static loff_t
 dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 828444e14d09..5a5d784a110e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -974,13 +974,6 @@ static int iomap_zero(struct inode *inode, loff_t pos, unsigned offset,
 	return iomap_write_end(inode, pos, bytes, bytes, page, iomap, srcmap);
 }
 
-static int iomap_dax_zero(loff_t pos, unsigned offset, unsigned bytes,
-		struct iomap *iomap)
-{
-	return __dax_zero_page_range(iomap->bdev, iomap->dax_dev,
-			iomap_sector(iomap, pos & PAGE_MASK), offset, bytes);
-}
-
 static loff_t
 iomap_zero_range_actor(struct inode *inode, loff_t pos, loff_t count,
 		void *data, struct iomap *iomap, struct iomap *srcmap)
@@ -1000,7 +993,7 @@ iomap_zero_range_actor(struct inode *inode, loff_t pos, loff_t count,
 		bytes = min_t(loff_t, PAGE_SIZE - offset, count);
 
 		if (IS_DAX(inode))
-			status = iomap_dax_zero(pos, offset, bytes, iomap);
+			status = dax_iomap_zero(pos, offset, bytes, iomap);
 		else
 			status = iomap_zero(inode, pos, offset, bytes, iomap,
 					srcmap);
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 3356b874c55d..ffaaa12f8ca9 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -13,6 +13,7 @@
 typedef unsigned long dax_entry_t;
 
 struct iomap_ops;
+struct iomap;
 struct dax_device;
 struct dax_operations {
 	/*
@@ -228,13 +229,11 @@ int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
 				      pgoff_t index);
 
 #ifdef CONFIG_FS_DAX
-int __dax_zero_page_range(struct block_device *bdev,
-		struct dax_device *dax_dev, sector_t sector,
-		unsigned int offset, unsigned int length);
+int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
+			      struct iomap *iomap);
 #else
-static inline int __dax_zero_page_range(struct block_device *bdev,
-		struct dax_device *dax_dev, sector_t sector,
-		unsigned int offset, unsigned int length)
+static inline int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
+				 struct iomap *iomap)
 {
 	return -ENXIO;
 }
-- 
2.18.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

