Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E7B6315AE25
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581527287;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JLMjw/35JB8QyMUG6l91OamzqgGlEOH8lAcIAZYMZrw=;
	b=FyI69SO7SMAcD5rKY+wPMGp9NIuw4fW5Uqeba61q7Px+Mwmfk2Y/QX2aTWO879rY2V6l3V
	CgJR3Kd2Kh3oQb/t8wg1v6fS67lhpeDcQKufqlolcdZM7ds15h0547L9SPqcbXgAb4X43m
	ZP/83nn2b9mbi5WNkRdQ5qXyrFZCcEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-X95ZawATNZWBm4HObv3MjQ-1; Wed, 12 Feb 2020 12:08:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9F9D800D41;
	Wed, 12 Feb 2020 17:07:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C8185C1B2;
	Wed, 12 Feb 2020 17:07:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE9CA8B2A3;
	Wed, 12 Feb 2020 17:07:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH7nXx001108 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:07:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9CF05C1BB; Wed, 12 Feb 2020 17:07:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26F8F5C1B2;
	Wed, 12 Feb 2020 17:07:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id B766D2257D5; Wed, 12 Feb 2020 12:07:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Wed, 12 Feb 2020 12:07:30 -0500
Message-Id: <20200212170733.8092-4-vgoyal@redhat.com>
In-Reply-To: <20200212170733.8092-1-vgoyal@redhat.com>
References: <20200212170733.8092-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, jack@suse.cz, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 3/6] fs/dax.c: Start using dax_pgoff() instead of
	bdev_dax_pgoff()
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
X-MC-Unique: X95ZawATNZWBm4HObv3MjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace usage of bdev_dax_pgoff() with dax_pgoff() in fs/dax.c

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 fs/dax.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 35da144375a0..921042a81538 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -680,7 +680,7 @@ int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
 	return __dax_invalidate_entry(mapping, index, false);
 }
 
-static int copy_user_dax(struct block_device *bdev, struct dax_device *dax_dev,
+static int copy_user_dax(struct dax_device *dax_dev, sector_t dax_offset,
 		sector_t sector, size_t size, struct page *to,
 		unsigned long vaddr)
 {
@@ -689,7 +689,7 @@ static int copy_user_dax(struct block_device *bdev, struct dax_device *dax_dev,
 	long rc;
 	int id;
 
-	rc = bdev_dax_pgoff(bdev, sector, size, &pgoff);
+	rc = dax_pgoff(dax_offset, sector, size, &pgoff);
 	if (rc)
 		return rc;
 
@@ -990,7 +990,7 @@ static int dax_iomap_pfn(struct iomap *iomap, loff_t pos, size_t size,
 	int id, rc;
 	long length;
 
-	rc = bdev_dax_pgoff(iomap->bdev, sector, size, &pgoff);
+	rc = dax_pgoff(iomap->dax_offset, sector, size, &pgoff);
 	if (rc)
 		return rc;
 	id = dax_read_lock();
@@ -1065,7 +1065,7 @@ int __dax_zero_page_range(struct block_device *bdev,
 		long rc, id;
 		void *kaddr;
 
-		rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
+		rc = dax_pgoff(get_start_sect(bdev), sector, PAGE_SIZE, &pgoff);
 		if (rc)
 			return rc;
 
@@ -1087,7 +1087,6 @@ static loff_t
 dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 		struct iomap *iomap, struct iomap *srcmap)
 {
-	struct block_device *bdev = iomap->bdev;
 	struct dax_device *dax_dev = iomap->dax_dev;
 	struct iov_iter *iter = data;
 	loff_t end = pos + length, done = 0;
@@ -1132,7 +1131,7 @@ dax_iomap_actor(struct inode *inode, loff_t pos, loff_t length, void *data,
 			break;
 		}
 
-		ret = bdev_dax_pgoff(bdev, sector, size, &pgoff);
+		ret = dax_pgoff(iomap->dax_offset, sector, size, &pgoff);
 		if (ret)
 			break;
 
@@ -1312,7 +1311,7 @@ static vm_fault_t dax_iomap_pte_fault(struct vm_fault *vmf, pfn_t *pfnp,
 			clear_user_highpage(vmf->cow_page, vaddr);
 			break;
 		case IOMAP_MAPPED:
-			error = copy_user_dax(iomap.bdev, iomap.dax_dev,
+			error = copy_user_dax(iomap.dax_dev, iomap.dax_offset,
 					sector, PAGE_SIZE, vmf->cow_page, vaddr);
 			break;
 		default:
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

