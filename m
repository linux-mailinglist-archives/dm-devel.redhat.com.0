Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6717173D15
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 17:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582907737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IuDgcgmkxXWrpxk4FBdz/X6mSCS/kovIUuDjcx79PsY=;
	b=ZuQpmZqfy/w4+upzkKEXxYL89SxzIr+VDXAR9KudMf+rau6wBme6u8lvLNvIRitCjKhNvV
	7Xf7wvvY7XjX8BUxN70rpKF4SgVrqmnr09g/GlsjKLDSJl1vsr94ftYUwf+Gg9X13XAD53
	/zW6AyP+qrdhE8D5aFIOytYNJa6bi2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-jpeqfrEbPVWzvwudjNELyQ-1; Fri, 28 Feb 2020 11:35:34 -0500
X-MC-Unique: jpeqfrEbPVWzvwudjNELyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB1D801E74;
	Fri, 28 Feb 2020 16:35:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC09E8681F;
	Fri, 28 Feb 2020 16:35:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56A648448D;
	Fri, 28 Feb 2020 16:35:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SGZEA0005208 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 11:35:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 118D1101D493; Fri, 28 Feb 2020 16:35:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EC95101D48E;
	Fri, 28 Feb 2020 16:35:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id C21ED2257D3; Fri, 28 Feb 2020 11:35:10 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri, 28 Feb 2020 11:34:51 -0500
Message-Id: <20200228163456.1587-2-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-1-vgoyal@redhat.com>
References: <20200228163456.1587-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: jmoyer@redhat.com, david@fromorbit.com, dm-devel@redhat.com,
	vgoyal@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH v6 1/6] pmem: Add functions for reading/writing
	page to/from pmem
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This splits pmem_do_bvec() into pmem_do_read() and pmem_do_write().
pmem_do_write() will be used by pmem zero_page_range() as well. Hence
sharing the same code.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/nvdimm/pmem.c | 86 +++++++++++++++++++++++++------------------
 1 file changed, 50 insertions(+), 36 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 4eae441f86c9..075b11682192 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -136,9 +136,25 @@ static blk_status_t read_pmem(struct page *page, unsigned int off,
 	return BLK_STS_OK;
 }
 
-static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
-			unsigned int len, unsigned int off, unsigned int op,
-			sector_t sector)
+static blk_status_t pmem_do_read(struct pmem_device *pmem,
+			struct page *page, unsigned int page_off,
+			sector_t sector, unsigned int len)
+{
+	blk_status_t rc;
+	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
+	void *pmem_addr = pmem->virt_addr + pmem_off;
+
+	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
+		return BLK_STS_IOERR;
+
+	rc = read_pmem(page, page_off, pmem_addr, len);
+	flush_dcache_page(page);
+	return rc;
+}
+
+static blk_status_t pmem_do_write(struct pmem_device *pmem,
+			struct page *page, unsigned int page_off,
+			sector_t sector, unsigned int len)
 {
 	blk_status_t rc = BLK_STS_OK;
 	bool bad_pmem = false;
@@ -148,34 +164,25 @@ static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
 	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
 		bad_pmem = true;
 
-	if (!op_is_write(op)) {
-		if (unlikely(bad_pmem))
-			rc = BLK_STS_IOERR;
-		else {
-			rc = read_pmem(page, off, pmem_addr, len);
-			flush_dcache_page(page);
-		}
-	} else {
-		/*
-		 * Note that we write the data both before and after
-		 * clearing poison.  The write before clear poison
-		 * handles situations where the latest written data is
-		 * preserved and the clear poison operation simply marks
-		 * the address range as valid without changing the data.
-		 * In this case application software can assume that an
-		 * interrupted write will either return the new good
-		 * data or an error.
-		 *
-		 * However, if pmem_clear_poison() leaves the data in an
-		 * indeterminate state we need to perform the write
-		 * after clear poison.
-		 */
-		flush_dcache_page(page);
-		write_pmem(pmem_addr, page, off, len);
-		if (unlikely(bad_pmem)) {
-			rc = pmem_clear_poison(pmem, pmem_off, len);
-			write_pmem(pmem_addr, page, off, len);
-		}
+	/*
+	 * Note that we write the data both before and after
+	 * clearing poison.  The write before clear poison
+	 * handles situations where the latest written data is
+	 * preserved and the clear poison operation simply marks
+	 * the address range as valid without changing the data.
+	 * In this case application software can assume that an
+	 * interrupted write will either return the new good
+	 * data or an error.
+	 *
+	 * However, if pmem_clear_poison() leaves the data in an
+	 * indeterminate state we need to perform the write
+	 * after clear poison.
+	 */
+	flush_dcache_page(page);
+	write_pmem(pmem_addr, page, page_off, len);
+	if (unlikely(bad_pmem)) {
+		rc = pmem_clear_poison(pmem, pmem_off, len);
+		write_pmem(pmem_addr, page, page_off, len);
 	}
 
 	return rc;
@@ -197,8 +204,12 @@ static blk_qc_t pmem_make_request(struct request_queue *q, struct bio *bio)
 
 	do_acct = nd_iostat_start(bio, &start);
 	bio_for_each_segment(bvec, bio, iter) {
-		rc = pmem_do_bvec(pmem, bvec.bv_page, bvec.bv_len,
-				bvec.bv_offset, bio_op(bio), iter.bi_sector);
+		if (op_is_write(bio_op(bio)))
+			rc = pmem_do_write(pmem, bvec.bv_page, bvec.bv_offset,
+				iter.bi_sector, bvec.bv_len);
+		else
+			rc = pmem_do_read(pmem, bvec.bv_page, bvec.bv_offset,
+				iter.bi_sector, bvec.bv_len);
 		if (rc) {
 			bio->bi_status = rc;
 			break;
@@ -223,9 +234,12 @@ static int pmem_rw_page(struct block_device *bdev, sector_t sector,
 	struct pmem_device *pmem = bdev->bd_queue->queuedata;
 	blk_status_t rc;
 
-	rc = pmem_do_bvec(pmem, page, hpage_nr_pages(page) * PAGE_SIZE,
-			  0, op, sector);
-
+	if (op_is_write(op))
+		rc = pmem_do_write(pmem, page, 0, sector,
+				   hpage_nr_pages(page) * PAGE_SIZE);
+	else
+		rc = pmem_do_read(pmem, page, 0, sector,
+				   hpage_nr_pages(page) * PAGE_SIZE);
 	/*
 	 * The ->rw_page interface is subtle and tricky.  The core
 	 * retries on any error, so we can only invoke page_endio() in
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

