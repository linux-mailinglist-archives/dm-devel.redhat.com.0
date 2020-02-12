Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7959E15AE2C
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581527294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bd3rEXPUIAsIPUE+EWvAtvgwslLC0d4NDpJj77CRp5Q=;
	b=V+BlqZ8J8uZe1d3P3BVMa9nX7+m2+xY576Zt3Ol//MdZzd24IJGiWzCDSkiOjg2oxkpHDx
	nKKJ40pYWd4f9TI6FaDe9Cm0FVUIJ7sd/qhvw9qB3o090mmH3y6mSko2d5N8WJijcGp9Yd
	vzhbCMFGuERINT17MHYGaRMVmUNwE7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-OFnOs8v1Nw-ahvlz0meeDQ-1; Wed, 12 Feb 2020 12:08:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DED800EB2;
	Wed, 12 Feb 2020 17:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B23D1001B07;
	Wed, 12 Feb 2020 17:08:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF1A11803C32;
	Wed, 12 Feb 2020 17:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH7qTY001161 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C67E85DA83; Wed, 12 Feb 2020 17:07:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 200F15D9E2;
	Wed, 12 Feb 2020 17:07:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id CAEF32257D8; Wed, 12 Feb 2020 12:07:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Wed, 12 Feb 2020 12:07:33 -0500
Message-Id: <20200212170733.8092-7-vgoyal@redhat.com>
In-Reply-To: <20200212170733.8092-1-vgoyal@redhat.com>
References: <20200212170733.8092-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, jack@suse.cz, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 6/6] dax: Remove bdev_dax_pgoff() helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: OFnOs8v1Nw-ahvlz0meeDQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now there don't seem to be anyuser of bdev_dax_pgoff(). All users have been
moved to dax_pgoff(). So remove this helper.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/dax/super.c | 13 -------------
 include/linux/dax.h |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index ee35ecc61545..371e391e6b1e 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -43,19 +43,6 @@ EXPORT_SYMBOL_GPL(dax_read_unlock);
 #ifdef CONFIG_BLOCK
 #include <linux/blkdev.h>
 
-int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
-		pgoff_t *pgoff)
-{
-	phys_addr_t phys_off = (get_start_sect(bdev) + sector) * 512;
-
-	if (pgoff)
-		*pgoff = PHYS_PFN(phys_off);
-	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
-		return -EINVAL;
-	return 0;
-}
-EXPORT_SYMBOL(bdev_dax_pgoff);
-
 int dax_pgoff(sector_t dax_offset, sector_t sector, size_t size, pgoff_t *pgoff)
 {
 	phys_addr_t phys_off = (dax_offset + sector) * 512;
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 5101a4b5c1f9..84ed0e993190 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -110,7 +110,6 @@ static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
 #endif
 
 struct writeback_control;
-int bdev_dax_pgoff(struct block_device *, sector_t, size_t, pgoff_t *pgoff);
 int dax_pgoff(sector_t dax_offset, sector_t, size_t, pgoff_t *pgoff);
 #if IS_ENABLED(CONFIG_FS_DAX)
 bool __bdev_dax_supported(struct block_device *bdev, int blocksize);
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

