Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C01DD16199F
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 19:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581963456;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3T/DjYR2+FWS4P/yItnslWvQgoJzyW+dbrBlKzRzuvA=;
	b=QRFaGYGABYMQ0gRBZEH6e0KnUoWUqLlXWsP1URj8PtwDuZ1QOgtThcEDR6LSYC0DogZmOP
	mtI7dnsVI+WodQh950wPp7JVvhjGvSpZ01Mn0MaDwSCgKewgvWQi8pXnJBRmaWB+zhgBBs
	taHY+1eXWPAXHRjKyEr5yLnnCbsk4iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-6s8zqHzKNuae3DdJhcxUfA-1; Mon, 17 Feb 2020 13:17:32 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E3610CE782;
	Mon, 17 Feb 2020 18:17:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C210760BE1;
	Mon, 17 Feb 2020 18:17:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3285B18089CF;
	Mon, 17 Feb 2020 18:17:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIHBvM022281 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:17:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E84B319756; Mon, 17 Feb 2020 18:17:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2FC219C69;
	Mon, 17 Feb 2020 18:17:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 1C2AB2257D8; Mon, 17 Feb 2020 13:17:08 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Mon, 17 Feb 2020 13:16:52 -0500
Message-Id: <20200217181653.4706-7-vgoyal@redhat.com>
In-Reply-To: <20200217181653.4706-1-vgoyal@redhat.com>
References: <20200217181653.4706-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v4 6/7] dax,
	iomap: Start using dax native zero_page_range()
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
X-MC-Unique: 6s8zqHzKNuae3DdJhcxUfA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get rid of calling block device interface for zeroing in iomap dax
zeroing path and use dax native zeroing interface instead.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/dax.c | 45 +++++++++------------------------------------
 1 file changed, 9 insertions(+), 36 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 1f1f0201cad1..6757e12b86b2 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1044,48 +1044,21 @@ static vm_fault_t dax_load_hole(struct xa_state *xas,
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
-
-		return blkdev_issue_zeroout(bdev, start_sector,
-				size >> 9, GFP_NOFS, 0);
-	} else {
-		pgoff_t pgoff;
-		long rc, id;
-		void *kaddr;
+	pgoff_t pgoff;
+	long rc, id;
 
-		rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
-		if (rc)
-			return rc;
+	rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
+	if (rc)
+		return rc;
 
-		id = dax_read_lock();
-		rc = dax_direct_access(dax_dev, pgoff, 1, &kaddr, NULL);
-		if (rc < 0) {
-			dax_read_unlock(id);
-			return rc;
-		}
-		memset(kaddr + offset, 0, size);
-		dax_flush(dax_dev, kaddr + offset, size);
-		dax_read_unlock(id);
-	}
-	return 0;
+	id = dax_read_lock();
+	rc = dax_zero_page_range(dax_dev, (pgoff << PAGE_SHIFT) + offset, size);
+	dax_read_unlock(id);
+	return rc;
 }
 EXPORT_SYMBOL_GPL(__dax_zero_page_range);
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

