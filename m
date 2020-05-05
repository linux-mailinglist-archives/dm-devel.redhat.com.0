Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CBAE21C6343
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714880;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n33+cbCBilDg0ZBldUd10bcCzJ9JxR9Ge4gWbJZUVEA=;
	b=g+RAqrPQ+G1iV+kkC3NedkEgns7XbzVDBn5xbveH9PXbhjbXDlSphmLL8tXte4EN/d2YPh
	7vvaT3LFM7syWL/RFqMk9mFIZW0xqdU1mxo5JbPyP+hsaJsGhJOfH496e0WxpENqIKr9WK
	KrVRSr00TlpNdIUAfPZA/gCWym5gtN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-T3im6wwyMESqyaqv9T94Mg-1; Tue, 05 May 2020 17:41:18 -0400
X-MC-Unique: T3im6wwyMESqyaqv9T94Mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0BA18FF663;
	Tue,  5 May 2020 21:41:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 532136298C;
	Tue,  5 May 2020 21:41:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D57634CAAE;
	Tue,  5 May 2020 21:41:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CCoGZ010894 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:12:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AB8C1131E; Tue,  5 May 2020 12:12:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67399B5510
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E2F800655
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:47 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-287-Ki9xcYoaMyWZfNGxB2G9Qw-1; Tue, 05 May 2020 08:12:43 -0400
X-MC-Unique: Ki9xcYoaMyWZfNGxB2G9Qw-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C87C3311B16D4642CC9A;
	Tue,  5 May 2020 19:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 5 May 2020 19:55:57 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel
	<dm-devel@redhat.com>, Song Liu <song@kernel.org>, linux-raid
	<linux-raid@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Tue, 5 May 2020 19:55:42 +0800
Message-ID: <20200505115543.1660-4-thunder.leizhen@huawei.com>
In-Reply-To: <20200505115543.1660-1-thunder.leizhen@huawei.com>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CCoGZ010894
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 3/4] block: use SECTORS_PER_PAGE_SHIFT and
	SECTORS_PER_PAGE to clean up code
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

1. Replace "1 << (PAGE_SHIFT - 9)" with SECTORS_PER_PAGE
2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
3. Replace "9" with SECTOR_SHIFT

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 block/blk-settings.c    | 8 ++++----
 block/partitions/core.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 14397b4c4b53..a62037a7ff0f 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -149,8 +149,8 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
 	struct queue_limits *limits = &q->limits;
 	unsigned int max_sectors;
 
-	if ((max_hw_sectors << 9) < PAGE_SIZE) {
-		max_hw_sectors = 1 << (PAGE_SHIFT - 9);
+	if ((max_hw_sectors << SECTOR_SHIFT) < PAGE_SIZE) {
+		max_hw_sectors = SECTORS_PER_PAGE;
 		printk(KERN_INFO "%s: set to minimum %d\n",
 		       __func__, max_hw_sectors);
 	}
@@ -159,7 +159,7 @@ void blk_queue_max_hw_sectors(struct request_queue *q, unsigned int max_hw_secto
 	max_sectors = min_not_zero(max_hw_sectors, limits->max_dev_sectors);
 	max_sectors = min_t(unsigned int, max_sectors, BLK_DEF_MAX_SECTORS);
 	limits->max_sectors = max_sectors;
-	q->backing_dev_info->io_pages = max_sectors >> (PAGE_SHIFT - 9);
+	q->backing_dev_info->io_pages = max_sectors >> SECTORS_PER_PAGE_SHIFT;
 }
 EXPORT_SYMBOL(blk_queue_max_hw_sectors);
 
@@ -630,7 +630,7 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
 	}
 
 	t->backing_dev_info->io_pages =
-		t->limits.max_sectors >> (PAGE_SHIFT - 9);
+		t->limits.max_sectors >> SECTORS_PER_PAGE_SHIFT;
 }
 EXPORT_SYMBOL(disk_stack_limits);
 
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 9ef48a8cff86..6e44ac840ca0 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -641,7 +641,7 @@ void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 	}
 
 	page = read_mapping_page(mapping,
-			(pgoff_t)(n >> (PAGE_SHIFT - 9)), NULL);
+			(pgoff_t)(n >> SECTORS_PER_PAGE_SHIFT), NULL);
 	if (IS_ERR(page))
 		goto out;
 	if (PageError(page))
@@ -649,7 +649,7 @@ void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 
 	p->v = page;
 	return (unsigned char *)page_address(page) +
-			((n & ((1 << (PAGE_SHIFT - 9)) - 1)) << SECTOR_SHIFT);
+			((n & (SECTORS_PER_PAGE - 1)) << SECTOR_SHIFT);
 out_put_page:
 	put_page(page);
 out:
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

