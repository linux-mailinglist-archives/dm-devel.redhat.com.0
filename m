Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77D421C8C98
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3QzlNA4iHmy+5mceida2zXbwlpUgKBoAIaK578NzBtc=;
	b=RBNKiwricZa44oyhHILT9fk8kJiSN9b+RAp1DhvyYvBFRBNv+QhSa8XRBzPMoDP4M1l6dC
	geKzbF365yHCkU28u2IUvEhL8ogzcni65M7WagbQwDLGMZLUvFWzPxscLk7z0TzGe8MJCB
	S7K5FX9wOSWCLOWYcg+I7PEKfa7scRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-fiWRNOoQNPKptF-UryVu_A-1; Thu, 07 May 2020 09:40:29 -0400
X-MC-Unique: fiWRNOoQNPKptF-UryVu_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B161C835B78;
	Thu,  7 May 2020 13:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E56110013BD;
	Thu,  7 May 2020 13:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AFBA4CA94;
	Thu,  7 May 2020 13:40:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u50G023936 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 19AF52156A3A; Thu,  7 May 2020 07:56:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 154A52157F25
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D79D80CDB1
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:00 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-x8_VDq6LM8uCJh29xu5udQ-1; Thu, 07 May 2020 03:55:57 -0400
X-MC-Unique: x8_VDq6LM8uCJh29xu5udQ-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 5F976B5F71AE7B2ED715;
	Thu,  7 May 2020 15:55:53 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:45 +0800
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
Date: Thu, 7 May 2020 15:50:51 +0800
Message-ID: <20200507075100.1779-2-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u50G023936
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 01/10] block: move PAGE_SECTORS definition
	into <linux/blkdev.h>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Too many duplicated PAGE_SECTORS definitions, eliminate it.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/brd.c           | 1 -
 drivers/block/null_blk_main.c | 1 -
 drivers/md/bcache/util.h      | 2 --
 include/linux/blkdev.h        | 5 +++--
 include/linux/device-mapper.h | 1 -
 5 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 2fb25c348d53..30df6daa9dbc 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -26,7 +26,6 @@
 #include <linux/uaccess.h>
 
 #define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
 
 /*
  * Each block ramdisk device has a radix_tree brd_pages of pages that stores
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 8efd8778e209..25048ff15858 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -12,7 +12,6 @@
 #include "null_blk.h"
 
 #define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
 #define SECTOR_MASK		(PAGE_SECTORS - 1)
 
 #define FREE_BATCH		16
diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
index c029f7443190..55196e0f37c3 100644
--- a/drivers/md/bcache/util.h
+++ b/drivers/md/bcache/util.h
@@ -15,8 +15,6 @@
 
 #include "closure.h"
 
-#define PAGE_SECTORS		(PAGE_SIZE / 512)
-
 struct closure;
 
 #ifdef CONFIG_BCACHE_DEBUG
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 32868fbedc9e..934f31fc15cd 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -904,11 +904,12 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
  * multiple of 512 bytes. Hence these two constants.
  */
 #ifndef SECTOR_SHIFT
-#define SECTOR_SHIFT 9
+#define SECTOR_SHIFT		9
 #endif
 #ifndef SECTOR_SIZE
-#define SECTOR_SIZE (1 << SECTOR_SHIFT)
+#define SECTOR_SIZE		(1 << SECTOR_SHIFT)
 #endif
+#define PAGE_SECTORS		(PAGE_SIZE / SECTOR_SIZE)
 
 /*
  * blk_rq_pos()			: the current sector
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index af48d9da3916..83e018ed8c21 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -143,7 +143,6 @@ typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
 		void *addr, size_t bytes, struct iov_iter *i);
 typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
 		size_t nr_pages);
-#define PAGE_SECTORS (PAGE_SIZE / 512)
 
 void dm_error(const char *message);
 
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

