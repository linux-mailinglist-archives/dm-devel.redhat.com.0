Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0433C1C8C9A
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=omv63yxU58ELqDoW7bj1tBNSXo8IbAswXjbb0aRWGgg=;
	b=g4ZXFf49APO8z6DOkMrZwk0ypcQaN3fjldadowcGmZqi3X2PrSrX5tr/hmz20FjSqr+Y+j
	7odo34b0w2Jq9wLTICVQuTJARdwIB7YpyQDvYgfqT3U9SFHa3RFCHDCpUFtQrZFSsJxFat
	ilU8FY6TI6ZAW6/5FbTgin+9iMFCIC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-O8B0fxJMP1ST-uG_aPbUhA-1; Thu, 07 May 2020 09:40:31 -0400
X-MC-Unique: O8B0fxJMP1ST-uG_aPbUhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24E8BBFC4;
	Thu,  7 May 2020 13:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5ACC60BEC;
	Thu,  7 May 2020 13:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C7634E561;
	Thu,  7 May 2020 13:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u69J023954 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DACE41033C48; Thu,  7 May 2020 07:56:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E321033C44
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69D980066D
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:06 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-j_Z9JP5kMy-7r7IcVXl2rA-1; Thu, 07 May 2020 03:56:03 -0400
X-MC-Unique: j_Z9JP5kMy-7r7IcVXl2rA-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id A7051CED3291C742681E;
	Thu,  7 May 2020 15:55:58 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:48 +0800
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
Date: Thu, 7 May 2020 15:50:55 +0800
Message-ID: <20200507075100.1779-6-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u69J023954
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 05/10] block: abolish macro PAGE_SECTORS_SHIFT
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The name of PAGE_SECTORS_SHIFT is quite hard to read.
1. use sectors_to_npage() to replace ">> PAGE_SECTORS_SHIFT"
2. use npage_to_sectors() to replace "<< PAGE_SECTORS_SHIFT"

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/brd.c           | 6 ++----
 drivers/block/null_blk_main.c | 9 ++++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 30df6daa9dbc..051c5a50497f 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -25,8 +25,6 @@
 
 #include <linux/uaccess.h>
 
-#define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-
 /*
  * Each block ramdisk device has a radix_tree brd_pages of pages that stores
  * the pages containing the block device's contents. A brd page's ->index is
@@ -69,7 +67,7 @@ static struct page *brd_lookup_page(struct brd_device *brd, sector_t sector)
 	 * here, only deletes).
 	 */
 	rcu_read_lock();
-	idx = sector >> PAGE_SECTORS_SHIFT; /* sector to page index */
+	idx = sectors_to_npage(sector);
 	page = radix_tree_lookup(&brd->brd_pages, idx);
 	rcu_read_unlock();
 
@@ -108,7 +106,7 @@ static struct page *brd_insert_page(struct brd_device *brd, sector_t sector)
 	}
 
 	spin_lock(&brd->brd_lock);
-	idx = sector >> PAGE_SECTORS_SHIFT;
+	idx = sectors_to_npage(sector);
 	page->index = idx;
 	if (radix_tree_insert(&brd->brd_pages, idx, page)) {
 		__free_page(page);
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 25048ff15858..81485f47dcf0 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include "null_blk.h"
 
-#define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
 #define SECTOR_MASK		(PAGE_SECTORS - 1)
 
 #define FREE_BATCH		16
@@ -737,7 +736,7 @@ static void null_free_sector(struct nullb *nullb, sector_t sector,
 	struct radix_tree_root *root;
 
 	root = is_cache ? &nullb->dev->cache : &nullb->dev->data;
-	idx = sector >> PAGE_SECTORS_SHIFT;
+	idx = sectors_to_npage(sector);
 	sector_bit = (sector & SECTOR_MASK);
 
 	t_page = radix_tree_lookup(root, idx);
@@ -808,7 +807,7 @@ static struct nullb_page *__null_lookup_page(struct nullb *nullb,
 	struct nullb_page *t_page;
 	struct radix_tree_root *root;
 
-	idx = sector >> PAGE_SECTORS_SHIFT;
+	idx = sectors_to_npage(sector);
 	sector_bit = (sector & SECTOR_MASK);
 
 	root = is_cache ? &nullb->dev->cache : &nullb->dev->data;
@@ -855,7 +854,7 @@ static struct nullb_page *null_insert_page(struct nullb *nullb,
 		goto out_freepage;
 
 	spin_lock_irq(&nullb->lock);
-	idx = sector >> PAGE_SECTORS_SHIFT;
+	idx = sectors_to_npage(sector);
 	t_page->page->index = idx;
 	t_page = null_radix_tree_insert(nullb, idx, t_page, !ignore_cache);
 	radix_tree_preload_end();
@@ -878,7 +877,7 @@ static int null_flush_cache_page(struct nullb *nullb, struct nullb_page *c_page)
 
 	idx = c_page->page->index;
 
-	t_page = null_insert_page(nullb, idx << PAGE_SECTORS_SHIFT, true);
+	t_page = null_insert_page(nullb, npage_to_sectors(idx), true);
 
 	__clear_bit(NULLB_PAGE_LOCK, c_page->bitmap);
 	if (test_bit(NULLB_PAGE_FREE, c_page->bitmap)) {
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

