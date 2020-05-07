Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9AD1C8C9B
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858834;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LLdE5qswZ7WXHfUiE2NSdPmIL0oV6W80KWGtvsBMleM=;
	b=d2C1/+jT5gj6WIFNBWis5Kfl8ftQKCj8Sjiq4e58CM7ihcuicpwMHTzgkgaTGtas0wydRD
	cgrGGxqHaFvhbhZ6gaV/ta39HIoodvrlxLtOsH25hIhXI+2r6X/XEq+hv9FlYN8FcELgcI
	6Jz7UDLkAMY4FCeOXuykeE0EbnJRytw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-wVlZ9WTgOhq_uSnhZbYZOQ-1; Thu, 07 May 2020 09:40:32 -0400
X-MC-Unique: wVlZ9WTgOhq_uSnhZbYZOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C24BFC5;
	Thu,  7 May 2020 13:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006636109F;
	Thu,  7 May 2020 13:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8EEFB4E564;
	Thu,  7 May 2020 13:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u5DI023937 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 407ABF7FD4; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF72F7FDD
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C9ED108C268
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-CfY6lfu3NP-KDjj0FpW4jw-1; Thu, 07 May 2020 03:56:02 -0400
X-MC-Unique: CfY6lfu3NP-KDjj0FpW4jw-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9EE03EA0C306B46DD563;
	Thu,  7 May 2020 15:55:58 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:50 +0800
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
Date: Thu, 7 May 2020 15:50:57 +0800
Message-ID: <20200507075100.1779-8-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u5DI023937
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 07/10] block: use sectors_to_npage() and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Replace "1 << (PAGE_SHIFT - 9)" with PAGE_SECTORS
2. Replace ">> (PAGE_SHIFT - 9)" with sectors_to_npage()

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 block/blk-settings.c    | 6 +++---
 block/partitions/core.c | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 14397b4c4b53..171665ed8318 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -150,7 +150,7 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
 	unsigned int max_sectors;
 
 	if ((max_hw_sectors << 9) < PAGE_SIZE) {
-		max_hw_sectors = 1 << (PAGE_SHIFT - 9);
+		max_hw_sectors = PAGE_SECTORS;
 		printk(KERN_INFO "%s: set to minimum %d\n",
 		       __func__, max_hw_sectors);
 	}
@@ -159,7 +159,7 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
 	max_sectors = min_not_zero(max_hw_sectors, limits->max_dev_sectors);
 	max_sectors = min_t(unsigned int, max_sectors, BLK_DEF_MAX_SECTORS);
 	limits->max_sectors = max_sectors;
-	q->backing_dev_info->io_pages = max_sectors >> (PAGE_SHIFT - 9);
+	q->backing_dev_info->io_pages = sectors_to_npage(max_sectors);
 }
 EXPORT_SYMBOL(blk_queue_max_hw_sectors);
 
@@ -630,7 +630,7 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 	}
 
 	t->backing_dev_info->io_pages =
-		t->limits.max_sectors >> (PAGE_SHIFT - 9);
+		sectors_to_npage(t->limits.max_sectors);
 }
 EXPORT_SYMBOL(disk_stack_limits);
 
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 9ef48a8cff86..4859739a2414 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -640,8 +640,7 @@ void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 		return NULL;
 	}
 
-	page = read_mapping_page(mapping,
-			(pgoff_t)(n >> (PAGE_SHIFT - 9)), NULL);
+	page = read_mapping_page(mapping, (pgoff_t)sectors_to_npage(n), NULL);
 	if (IS_ERR(page))
 		goto out;
 	if (PageError(page))
@@ -649,7 +648,7 @@ void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 
 	p->v = page;
 	return (unsigned char *)page_address(page) +
-			((n & ((1 << (PAGE_SHIFT - 9)) - 1)) << SECTOR_SHIFT);
+			((n & (PAGE_SECTORS - 1)) << SECTOR_SHIFT);
 out_put_page:
 	put_page(page);
 out:
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

