Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3B7E155FA0
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 21:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581107298;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eXMmNYx00C/Nbav+oNUsUSiRHo/ShC7tg90QXFtLJA4=;
	b=M3wqatE06n0oJ8BYIPuPvlFQdvsga+HdgKQktGcrKvWdxiv9eIyCZii4nzsernMF9KKNES
	4zr1UoPFhX9O/9mYhFiUMwlFbT9u3wb2n4PBCGGy7H27VHTXbh+7lasvxnxmbEj8H02Va/
	11ApsOy9xgSujAwmfZhkzbKyeXo83gY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-v5lll7ErPFy7UsylPygseQ-1; Fri, 07 Feb 2020 15:27:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928E1802703;
	Fri,  7 Feb 2020 20:27:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6313660BF7;
	Fri,  7 Feb 2020 20:27:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E785F866B3;
	Fri,  7 Feb 2020 20:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017KR5QK019036 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 15:27:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC0431FE07; Fri,  7 Feb 2020 20:27:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 097AD19C6A;
	Fri,  7 Feb 2020 20:27:03 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 9162C2257D4; Fri,  7 Feb 2020 15:27:02 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri,  7 Feb 2020 15:26:47 -0500
Message-Id: <20200207202652.1439-3-vgoyal@redhat.com>
In-Reply-To: <20200207202652.1439-1-vgoyal@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v3 2/7] pmem: Enable pmem_do_write() to deal with
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: v5lll7ErPFy7UsylPygseQ-1
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
 drivers/nvdimm/pmem.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 9ad07cb8c9fc..281fe04d25fd 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -154,15 +154,23 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
 
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
+		if (unlikely(is_bad_pmem(&pmem->bb, sector_start,
+					 nr_sectors << SECTOR_SHIFT)))
+			bad_pmem = true;
+	}
 
 	/*
 	 * Note that we write the data both before and after
@@ -181,7 +189,13 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
 	flush_dcache_page(page);
 	write_pmem(pmem_addr, page, page_off, len);
 	if (unlikely(bad_pmem)) {
-		rc = pmem_clear_poison(pmem, pmem_off, len);
+		/*
+		 * Pass sector aligned offset and length. That seems
+		 * to work as of now. Other finer grained alignment
+		 * cases can be addressed later if need be.
+		 */
+		rc = pmem_clear_poison(pmem, ALIGN(pmem_real_off, SECTOR_SIZE),
+				       nr_sectors << SECTOR_SHIFT);
 		write_pmem(pmem_addr, page, page_off, len);
 	}
 
@@ -195,7 +209,7 @@ static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
 	if (!op_is_write(op))
 		return pmem_do_read(pmem, page, off, sector, len);
 
-	return pmem_do_write(pmem, page, off, sector, len);
+	return pmem_do_write(pmem, page, off, sector << SECTOR_SHIFT, len);
 }
 
 static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

