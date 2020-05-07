Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E5BC81C8CA0
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gc6T3m611IAZ+Qme3EA/egR6ZfBRKrZCp+J1E2iPkDk=;
	b=b4YlfxDhyvz5Gctn0Y+LKDpPtJVEyCR52YldTbYKbqD4PxN/ljq9q4dvFesn6LLGnlM5Op
	GPTbjTnW66HmxQk7dXQ2cV45bHbZaQqtecMvMmVluGlfcON+PrFWrWmIMIQa//49HSXraV
	iOaPoDWBwcF1FBI64WTWzGT/IneGFGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Bm-6vkRiOXaOEtXeZnPF7g-1; Thu, 07 May 2020 09:40:38 -0400
X-MC-Unique: Bm-6vkRiOXaOEtXeZnPF7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278EA108BD09;
	Thu,  7 May 2020 13:40:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00DF15799C;
	Thu,  7 May 2020 13:40:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 956E04E585;
	Thu,  7 May 2020 13:40:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u7Aa023957 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDA152026D5D; Thu,  7 May 2020 07:56:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7858202B16F
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05BE31859171
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-uS5JuYrePf2fNwRyuPXimA-1; Thu, 07 May 2020 03:56:02 -0400
X-MC-Unique: uS5JuYrePf2fNwRyuPXimA-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 65D8F75FC4DD6324E1FD;
	Thu,  7 May 2020 15:55:58 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:49 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, Coly Li
	<colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, "Alasdair
	Kergon" <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, dm-devel <dm-devel@redhat.com>, Song Liu
	<song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Date: Thu, 7 May 2020 15:50:56 +0800
Message-ID: <20200507075100.1779-7-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u7Aa023957
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 06/10] mm/swap: use npage_to_sectors() and
	PAGE_SECTORS to clean up code
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Replace "<<= (PAGE_SHIFT - 9)" with "*= PAGE_SECTORS"
2. Replace "<< (PAGE_SHIFT - 9)" with npage_to_sectors()

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 mm/page_io.c  |  4 ++--
 mm/swapfile.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 76965be1d40e..23291a49ab91 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -38,7 +38,7 @@ static struct bio *get_swap_bio(gfp_t gfp_flags,
 
 		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
 		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
+		bio->bi_iter.bi_sector *= PAGE_SECTORS;
 		bio->bi_end_io = end_io;
 
 		bio_add_page(bio, page, PAGE_SIZE * hpage_nr_pages(page), 0);
@@ -266,7 +266,7 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 
 static sector_t swap_page_sector(struct page *page)
 {
-	return (sector_t)__page_file_index(page) << (PAGE_SHIFT - 9);
+	return npage_to_sectors((sector_t)__page_file_index(page));
 }
 
 static inline void count_swpout_vm_event(struct page *page)
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 5871a2aa86a5..c8be92f972a4 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -177,8 +177,8 @@ static int discard_swap(struct swap_info_struct *si)
 
 	/* Do not discard the swap header page! */
 	se = first_se(si);
-	start_block = (se->start_block + 1) << (PAGE_SHIFT - 9);
-	nr_blocks = ((sector_t)se->nr_pages - 1) << (PAGE_SHIFT - 9);
+	start_block = npage_to_sectors(se->start_block + 1);
+	nr_blocks = npage_to_sectors((sector_t)se->nr_pages - 1);
 	if (nr_blocks) {
 		err = blkdev_issue_discard(si->bdev, start_block,
 				nr_blocks, GFP_KERNEL, 0);
@@ -188,8 +188,8 @@ static int discard_swap(struct swap_info_struct *si)
 	}
 
 	for (se = next_se(se); se; se = next_se(se)) {
-		start_block = se->start_block << (PAGE_SHIFT - 9);
-		nr_blocks = (sector_t)se->nr_pages << (PAGE_SHIFT - 9);
+		start_block = npage_to_sectors(se->start_block);
+		nr_blocks = npage_to_sectors((sector_t)se->nr_pages);
 
 		err = blkdev_issue_discard(si->bdev, start_block,
 				nr_blocks, GFP_KERNEL, 0);
@@ -240,8 +240,8 @@ static void discard_swap_cluster(struct swap_info_struct *si,
 		start_page += nr_blocks;
 		nr_pages -= nr_blocks;
 
-		start_block <<= PAGE_SHIFT - 9;
-		nr_blocks <<= PAGE_SHIFT - 9;
+		start_block *= PAGE_SECTORS;
+		nr_blocks *= PAGE_SECTORS;
 		if (blkdev_issue_discard(si->bdev, start_block,
 					nr_blocks, GFP_NOIO, 0))
 			break;
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

