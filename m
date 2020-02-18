Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC1E16357B
	for <lists+dm-devel@lfdr.de>; Tue, 18 Feb 2020 22:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582062630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NVTQSDJo5Aj97Ff7BAYngGa81k5/LINL/yO3JvMqiX4=;
	b=JJNpZmqVAcHUrB8X+j7VfvzQAtkYMMsWMWaNkLwqn1qaxwc27HWBjluMzry59wRHeoCZmZ
	49jf/GJjBP6/oafS34R09E9kCq/grsqK8/OLR47yW84Sqws611P5zY5idMmOmav8KvSaEt
	6bCenB3/9aKslxLkYlWh4iuaVSqIxwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-nZvzthUdPTmuY9XLlKgI7g-1; Tue, 18 Feb 2020 16:49:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A74F1005513;
	Tue, 18 Feb 2020 21:49:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C89511001B05;
	Tue, 18 Feb 2020 21:49:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A9C63F5CF;
	Tue, 18 Feb 2020 21:49:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ILmtIl020602 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:48:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C49F5101D486; Tue, 18 Feb 2020 21:48:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B8891001B05;
	Tue, 18 Feb 2020 21:48:53 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 9BF7D2257D5; Tue, 18 Feb 2020 16:48:52 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Tue, 18 Feb 2020 16:48:36 -0500
Message-Id: <20200218214841.10076-4-vgoyal@redhat.com>
In-Reply-To: <20200218214841.10076-1-vgoyal@redhat.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v5 3/8] pmem: Enable pmem_do_write() to deal with
	arbitrary ranges
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
X-MC-Unique: nZvzthUdPTmuY9XLlKgI7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently pmem_do_write() is written with assumption that all I/O is
sector aligned. Soon I want to use this function in zero_page_range()
where range passed in does not have to be sector aligned.

Modify this function to be able to deal with an arbitrary range. Which
is specified by pmem_off and len.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/nvdimm/pmem.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index e72959203253..3c46e9e6d04c 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -168,15 +168,23 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
 
 static blk_status_t pmem_do_write(struct pmem_device *pmem,
 			struct page *page, unsigned int page_off,
-			sector_t sector, unsigned int len)
+			u64 pmem_off, unsigned int len)
 {
 	blk_status_t rc = BLK_STS_OK;
 	bool bad_pmem = false;
-	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
-	void *pmem_addr = pmem->virt_addr + pmem_off;
-
-	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
-		bad_pmem = true;
+	phys_addr_t pmem_real_off = pmem_off + pmem->data_offset;
+	void *pmem_addr = pmem->virt_addr + pmem_real_off;
+	sector_t sector_start, sector_end;
+	unsigned nr_sectors;
+
+	sector_start = DIV_ROUND_UP(pmem_off, SECTOR_SIZE);
+	sector_end = (pmem_off + len) >> SECTOR_SHIFT;
+	if (sector_end > sector_start) {
+		nr_sectors = sector_end - sector_start;
+		if (is_bad_pmem(&pmem->bb, sector_start,
+				nr_sectors << SECTOR_SHIFT))
+			bad_pmem = true;
+	}
 
 	/*
 	 * Note that we write the data both before and after
@@ -195,7 +203,7 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
 	flush_dcache_page(page);
 	write_pmem(pmem_addr, page, page_off, len);
 	if (unlikely(bad_pmem)) {
-		rc = pmem_clear_poison(pmem, pmem_off, len);
+		rc = pmem_clear_poison(pmem, pmem_real_off, len);
 		write_pmem(pmem_addr, page, page_off, len);
 	}
 
@@ -220,7 +228,7 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 	bio_for_each_segment(bvec, bio, iter) {
 		if (op_is_write(bio_op(bio)))
 			rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
-				iter.bi_sector, bvec.bv_len);
+				iter.bi_sector << SECTOR_SHIFT, bvec.bv_len);
 		else
 			rc = pmem_do_read(pmem, bvec.bv_page, bvec.bv_offset,
 				iter.bi_sector, bvec.bv_len);
@@ -249,7 +257,7 @@ static int pmem_rw_page(struct block_device *bdev, sector_t sector,
 	blk_status_t rc;
 
 	if (op_is_write(op))
-		rc = pmem_do_write(pmem, page, 0, sector,
+		rc = pmem_do_write(pmem, page, 0, sector << SECTOR_SHIFT,
 				   hpage_nr_pages(page) * PAGE_SIZE);
 	else
 		rc = pmem_do_read(pmem, page, 0, sector,
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

