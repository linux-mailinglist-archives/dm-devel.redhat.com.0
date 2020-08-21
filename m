Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EAA4124D03C
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 10:02:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-nT9KqepwNHOePZPvUSty3w-1; Fri, 21 Aug 2020 04:02:35 -0400
X-MC-Unique: nT9KqepwNHOePZPvUSty3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC6E48030D4;
	Fri, 21 Aug 2020 08:02:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDE65DA7B;
	Fri, 21 Aug 2020 08:02:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D6C5180B656;
	Fri, 21 Aug 2020 08:02:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L2KTeX016820 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 22:20:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A7681007A4B; Fri, 21 Aug 2020 02:20:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5482210087CE
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 02:20:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AF978119DD
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 02:20:27 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-269-U41Wj8jSMoypkebEroNwGQ-1; Thu, 20 Aug 2020 22:20:22 -0400
X-MC-Unique: U41Wj8jSMoypkebEroNwGQ-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7CF4D46E9A2671E94ED7;
	Fri, 21 Aug 2020 10:04:36 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.174.177.253) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 21 Aug 2020 10:04:27 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>, Kent Overstreet
	<kent.overstreet@gmail.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>, dm-devel <dm-devel@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-bcache <linux-bcache@vger.kernel.org>
Date: Fri, 21 Aug 2020 10:03:45 +0800
Message-ID: <20200821020345.3358-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07L2KTeX016820
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 04:02:08 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 1/1] block: move the PAGE_SECTORS definition into
	<linux/blkdev.h>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are too many PAGE_SECTORS definitions, and all of them are the
same. It looks a bit of a mess. So why not move it into <linux/blkdev.h>,
to achieve a basic and unique definition.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/brd.c           | 1 -
 drivers/block/null_blk_main.c | 1 -
 drivers/md/bcache/util.h      | 2 --
 include/linux/blkdev.h        | 5 +++--
 include/linux/device-mapper.h | 1 -
 5 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 2723a70eb855936..24c4687694b9f49 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -26,7 +26,6 @@
 #include <linux/uaccess.h>
 
 #define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
 
 /*
  * Each block ramdisk device has a radix_tree brd_pages of pages that stores
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 47a9dad880af2aa..0624a26b86453ce 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -12,7 +12,6 @@
 #include "null_blk.h"
 
 #define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
 #define SECTOR_MASK		(PAGE_SECTORS - 1)
 
 #define FREE_BATCH		16
diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
index c029f7443190805..55196e0f37c32c6 100644
--- a/drivers/md/bcache/util.h
+++ b/drivers/md/bcache/util.h
@@ -15,8 +15,6 @@
 
 #include "closure.h"
 
-#define PAGE_SECTORS		(PAGE_SIZE / 512)
-
 struct closure;
 
 #ifdef CONFIG_BCACHE_DEBUG
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bb5636cc17b91a7..b068dfc5f2ef0ab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -949,11 +949,12 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
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
index 93096e524e43945..ffccce9b700c326 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -143,7 +143,6 @@ typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
 		void *addr, size_t bytes, struct iov_iter *i);
 typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
 		size_t nr_pages);
-#define PAGE_SECTORS (PAGE_SIZE / 512)
 
 void dm_error(const char *message);
 
-- 
1.8.3



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

