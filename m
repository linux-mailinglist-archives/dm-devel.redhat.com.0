Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4824A173D16
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 17:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582907740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pWLXc1U+yX6YT1d7lyYvqZXIA0IAq/muh8atV5EtGQ8=;
	b=Hb9XLn9ISH/ub4qCEafaiG+m2KOZvJlQLPHlkGmCKvKsgiSCQ7nkLQ0icr42eEt3dSCd4o
	XplcZbIfv9SiqsqVOAQIwETWdcVB6/AbdAsyG0ucQmhqNK2m3RG6AqXBCFvJ8HG7QJeQAW
	el0rJkmUpW58WHJxk3967ka9g+GE8Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-XCWJPsbzOuOlBi2C7WlwGw-1; Fri, 28 Feb 2020 11:35:36 -0500
X-MC-Unique: XCWJPsbzOuOlBi2C7WlwGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714131034B21;
	Fri, 28 Feb 2020 16:35:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EB58AC39;
	Fri, 28 Feb 2020 16:35:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C674218089CE;
	Fri, 28 Feb 2020 16:35:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SGZELT005234 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 11:35:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A66092995; Fri, 28 Feb 2020 16:35:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC5E90F5B;
	Fri, 28 Feb 2020 16:35:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id D486E2257D7; Fri, 28 Feb 2020 11:35:10 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri, 28 Feb 2020 11:34:55 -0500
Message-Id: <20200228163456.1587-6-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-1-vgoyal@redhat.com>
References: <20200228163456.1587-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: jmoyer@redhat.com, david@fromorbit.com, dm-devel@redhat.com,
	vgoyal@redhat.com
Subject: [dm-devel] [PATCH v6 5/6] dax: Use new dax zero page method for
	zeroing a page
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use new dax native zero page method for zeroing page if I/O is page
aligned. Otherwise fall back to direct_access() + memcpy().

This gets rid of one of the depenendency on block device in dax path.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/dax.c | 53 +++++++++++++++++++++++------------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 35da144375a0..98ba3756163a 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1038,47 +1038,40 @@ static vm_fault_t dax_load_hole(struct xa_state *xas,
 	return ret;
 }
 
-static bool dax_range_is_aligned(struct block_device *bdev,
-				 unsigned int offset, unsigned int length)
-{
-	unsigned short sector_size = bdev_logical_block_size(bdev);
-
-	if (!IS_ALIGNED(offset, sector_size))
-		return false;
-	if (!IS_ALIGNED(length, sector_size))
-		return false;
-
-	return true;
-}
-
 int __dax_zero_page_range(struct block_device *bdev,
 		struct dax_device *dax_dev, sector_t sector,
 		unsigned int offset, unsigned int size)
 {
-	if (dax_range_is_aligned(bdev, offset, size)) {
-		sector_t start_sector = sector + (offset >> 9);
+	pgoff_t pgoff;
+	long rc, id;
+	void *kaddr;
+	bool page_aligned = false;
 
-		return blkdev_issue_zeroout(bdev, start_sector,
-				size >> 9, GFP_NOFS, 0);
-	} else {
-		pgoff_t pgoff;
-		long rc, id;
-		void *kaddr;
 
-		rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
-		if (rc)
-			return rc;
+	if (IS_ALIGNED(sector << SECTOR_SHIFT, PAGE_SIZE) &&
+	    IS_ALIGNED(size, PAGE_SIZE))
+		page_aligned = true;
+
+	rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
+	if (rc)
+		return rc;
 
-		id = dax_read_lock();
+	id = dax_read_lock();
+
+	if (page_aligned)
+		rc = dax_zero_page_range(dax_dev, pgoff, size >> PAGE_SHIFT);
+	else
 		rc = dax_direct_access(dax_dev, pgoff, 1, &kaddr, NULL);
-		if (rc < 0) {
-			dax_read_unlock(id);
-			return rc;
-		}
+	if (rc < 0) {
+		dax_read_unlock(id);
+		return rc;
+	}
+
+	if (!page_aligned) {
 		memset(kaddr + offset, 0, size);
 		dax_flush(dax_dev, kaddr + offset, size);
-		dax_read_unlock(id);
 	}
+	dax_read_unlock(id);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__dax_zero_page_range);
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

