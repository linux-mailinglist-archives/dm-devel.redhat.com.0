Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15F9E304275
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 16:26:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-2hdE2T3KMYiF4_inM-RHFQ-1; Tue, 26 Jan 2021 10:26:29 -0500
X-MC-Unique: 2hdE2T3KMYiF4_inM-RHFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6F26100D67E;
	Tue, 26 Jan 2021 15:26:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9489160CCE;
	Tue, 26 Jan 2021 15:26:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0818D1809CA0;
	Tue, 26 Jan 2021 15:26:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QFOkVa015539 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:24:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 587822026D48; Tue, 26 Jan 2021 15:24:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53E182026D47
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:24:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BEA0100B164
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:24:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-z9-OONMFPHaNzGd_7-9Uqw-1; Tue, 26 Jan 2021 10:24:39 -0500
X-MC-Unique: z9-OONMFPHaNzGd_7-9Uqw-1
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4QAZ-005opo-7d; Tue, 26 Jan 2021 15:22:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:47 +0100
Message-Id: <20210126145247.1964410-18-hch@lst.de>
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 17/17] mm: remove get_swap_bio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just reuse the block_device and sector from the swap_info structure,
just as used by the SWP_SYNCHRONOUS path.  Also remove the checks for
NULL returns from bio_alloc as that can't happen for sleeping
allocations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swap.h |  1 -
 mm/page_io.c         | 45 +++++++++++++-------------------------------
 mm/swapfile.c        | 10 ----------
 3 files changed, 13 insertions(+), 43 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 596bc2f4d9b03e..3f1f7ae0fbe9e1 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -468,7 +468,6 @@ extern int free_swap_and_cache(swp_entry_t);
 int swap_type_of(dev_t device, sector_t offset);
 int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
-extern sector_t map_swap_page(struct page *, struct block_device **);
 extern sector_t swapdev_block(int, pgoff_t);
 extern int page_swapcount(struct page *);
 extern int __swap_count(swp_entry_t entry);
diff --git a/mm/page_io.c b/mm/page_io.c
index a75f35464a4e73..92f7941c6d018b 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -26,25 +26,6 @@
 #include <linux/uio.h>
 #include <linux/sched/task.h>
 
-static struct bio *get_swap_bio(gfp_t gfp_flags,
-				struct page *page, bio_end_io_t end_io)
-{
-	struct bio *bio;
-
-	bio = bio_alloc(gfp_flags, 1);
-	if (bio) {
-		struct block_device *bdev;
-
-		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
-		bio->bi_end_io = end_io;
-
-		bio_add_page(bio, page, thp_size(page), 0);
-	}
-	return bio;
-}
-
 void end_swap_bio_write(struct bio *bio)
 {
 	struct page *page = bio_first_page_all(bio);
@@ -361,13 +342,13 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = get_swap_bio(GFP_NOIO, page, end_write_func);
-	if (bio == NULL) {
-		set_page_dirty(page);
-		unlock_page(page);
-		return -ENOMEM;
-	}
+	bio = bio_alloc(GFP_NOIO, 1);
+	bio_set_dev(bio, sis->bdev);
+	bio->bi_iter.bi_sector = swap_page_sector(page);
 	bio->bi_opf = REQ_OP_WRITE | REQ_SWAP | wbc_to_write_flags(wbc);
+	bio->bi_end_io = end_write_func;
+	bio_add_page(bio, page, thp_size(page), 0);
+
 	bio_associate_blkg_from_page(bio, page);
 	count_swpout_vm_event(page);
 	set_page_writeback(page);
@@ -427,18 +408,18 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = get_swap_bio(GFP_KERNEL, page, end_swap_bio_read);
-	if (bio == NULL) {
-		unlock_page(page);
-		ret = -ENOMEM;
-		goto out;
-	}
+	bio = bio_alloc(GFP_KERNEL, 1);
+	bio_set_dev(bio, sis->bdev);
+	bio->bi_opf = REQ_OP_READ;
+	bio->bi_iter.bi_sector = swap_page_sector(page);
+	bio->bi_end_io = end_swap_bio_read;
+	bio_add_page(bio, page, thp_size(page), 0);
+
 	disk = bio->bi_bdev->bd_disk;
 	/*
 	 * Keep this task valid during swap readpage because the oom killer may
 	 * attempt to access it in the page fault retry time check.
 	 */
-	bio_set_op_attrs(bio, REQ_OP_READ, 0);
 	if (synchronous) {
 		bio->bi_opf |= REQ_HIPRI;
 		get_task_struct(current);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9fffc5af29d1b9..bfa9e8b0c2ef61 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2301,16 +2301,6 @@ static sector_t map_swap_entry(swp_entry_t entry, struct block_device **bdev)
 	return se->start_block + (offset - se->start_page);
 }
 
-/*
- * Returns the page offset into bdev for the specified page's swap entry.
- */
-sector_t map_swap_page(struct page *page, struct block_device **bdev)
-{
-	swp_entry_t entry;
-	entry.val = page_private(page);
-	return map_swap_entry(entry, bdev);
-}
-
 /*
  * Free all of a swapdev's extent information
  */
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

