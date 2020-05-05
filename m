Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 20FA81C6341
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714879;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=62DIY+MhkvG+v9UACxzOk80TCU2IhIbQM5CSIS2drgU=;
	b=hpbeVA2gwIV9mkBd4e39FvsSg5t4XYAXJKGM82pPimysBaHvFPpCUEQglChfLEPHyUrOht
	57erTEJkyPxTkCnK53c0vfYpKEODQ9ZMjG9vLAYENPKo5bnSV+gSVN2qApGxOw8A9xG/U8
	xD3PhJceAYXFiYCagKmQro44MTc7AZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ywnABn9IN5av83HP9Xig-Q-1; Tue, 05 May 2020 17:41:16 -0400
X-MC-Unique: ywnABn9IN5av83HP9Xig-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 759AA80B711;
	Tue,  5 May 2020 21:41:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D95226197;
	Tue,  5 May 2020 21:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E391D4CAA8;
	Tue,  5 May 2020 21:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CCjQg010883 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:12:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EB572166BA2; Tue,  5 May 2020 12:12:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1A32156A23
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDF780CDB6
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:43 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-428-KRUpEXHkOp2I7uiJi7yorg-1; Tue, 05 May 2020 08:12:41 -0400
X-MC-Unique: KRUpEXHkOp2I7uiJi7yorg-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id CED93E741FB0B5C9C388;
	Tue,  5 May 2020 19:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 5 May 2020 19:55:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel
	<dm-devel@redhat.com>, Song Liu <song@kernel.org>, linux-raid
	<linux-raid@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Tue, 5 May 2020 19:55:41 +0800
Message-ID: <20200505115543.1660-3-thunder.leizhen@huawei.com>
In-Reply-To: <20200505115543.1660-1-thunder.leizhen@huawei.com>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CCjQg010883
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 2/4] mm/swap: use SECTORS_PER_PAGE_SHIFT to clean
	up code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 mm/page_io.c  |  4 ++--
 mm/swapfile.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index b1d4f4558e6b..51f25238fd9a 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -38,7 +38,7 @@ static struct bio *get_swap_bio(gfp_t gfp_flags,
 
 		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
 		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
+		bio->bi_iter.bi_sector <<= SECTORS_PER_PAGE_SHIFT;
 		bio->bi_end_io = end_io;
 
 		bio_add_page(bio, page, PAGE_SIZE * hpage_nr_pages(page), 0);
@@ -266,7 +266,7 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 
 static sector_t swap_page_sector(struct page *page)
 {
-	return (sector_t)__page_file_index(page) << (PAGE_SHIFT - 9);
+	return (sector_t)__page_file_index(page) << SECTORS_PER_PAGE_SHIFT;
 }
 
 static inline void count_swpout_vm_event(struct page *page)
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5871a2aa86a5..0871023c0166 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -177,8 +177,8 @@ static int discard_swap(struct swap_info_struct *si)
 
 	/* Do not discard the swap header page! */
 	se = first_se(si);
-	start_block = (se->start_block + 1) << (PAGE_SHIFT - 9);
-	nr_blocks = ((sector_t)se->nr_pages - 1) << (PAGE_SHIFT - 9);
+	start_block = (se->start_block + 1) << SECTORS_PER_PAGE_SHIFT;
+	nr_blocks = ((sector_t)se->nr_pages - 1) << SECTORS_PER_PAGE_SHIFT;
 	if (nr_blocks) {
 		err = blkdev_issue_discard(si->bdev, start_block,
 				nr_blocks, GFP_KERNEL, 0);
@@ -188,8 +188,8 @@ static int discard_swap(struct swap_info_struct *si)
 	}
 
 	for (se = next_se(se); se; se = next_se(se)) {
-		start_block = se->start_block << (PAGE_SHIFT - 9);
-		nr_blocks = (sector_t)se->nr_pages << (PAGE_SHIFT - 9);
+		start_block = se->start_block << SECTORS_PER_PAGE_SHIFT;
+		nr_blocks = (sector_t)se->nr_pages << SECTORS_PER_PAGE_SHIFT;
 
 		err = blkdev_issue_discard(si->bdev, start_block,
 				nr_blocks, GFP_KERNEL, 0);
@@ -240,8 +240,8 @@ static void discard_swap_cluster(struct swap_info_struct *si,
 		start_page += nr_blocks;
 		nr_pages -= nr_blocks;
 
-		start_block <<= PAGE_SHIFT - 9;
-		nr_blocks <<= PAGE_SHIFT - 9;
+		start_block <<= SECTORS_PER_PAGE_SHIFT;
+		nr_blocks <<= SECTORS_PER_PAGE_SHIFT;
 		if (blkdev_issue_discard(si->bdev, start_block,
 					nr_blocks, GFP_NOIO, 0))
 			break;
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

