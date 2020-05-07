Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CD5FA1C8C9D
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8eqvP8Of2F9gOSBKlpbv7lJyqAtnfXaWNVMaBxbzqf8=;
	b=UKJ13bf7xPPgkdDeMQR3XH57jCHwxi6AO/H44i35NwwpHM7IOprh96ZuTSHhuVY6J7W6qD
	6OaNIn6NEGDvNygbDIX5+PAZVUrEbsKsj/X15WUAWqLikjmDw5nufZi4Zullje34ko5Cum
	D1YZMjed3jWjA5FR6KaigFl4wqf2XQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-7yMXGDcBN0OdqiLC19iijA-1; Thu, 07 May 2020 09:40:33 -0400
X-MC-Unique: 7yMXGDcBN0OdqiLC19iijA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363C0835B44;
	Thu,  7 May 2020 13:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07161707B7;
	Thu,  7 May 2020 13:40:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 916C51809542;
	Thu,  7 May 2020 13:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u8vV023971 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15CB22026DFD; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11C6A2026D5D
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC13A88855D
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:07 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-WQMfex7aOw2TxTsuzOiNUg-1; Thu, 07 May 2020 03:56:03 -0400
X-MC-Unique: WQMfex7aOw2TxTsuzOiNUg-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 6EC65A859BAE067234FF;
	Thu,  7 May 2020 15:55:58 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:47 +0800
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
Date: Thu, 7 May 2020 15:50:54 +0800
Message-ID: <20200507075100.1779-5-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u8vV023971
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 04/10] zram: abolish macro
	SECTORS_PER_PAGE_SHIFT
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

The name of SECTORS_PER_PAGE_SHIFT is quite hard to read. So use
sectors_to_npage() to replace ">> SECTORS_PER_PAGE_SHIFT"

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/zram/zram_drv.c | 4 ++--
 drivers/block/zram/zram_drv.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index e2fbf7a847e7..918b77f9bce4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1549,7 +1549,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 	struct bio_vec bvec;
 	struct bvec_iter iter;
 
-	index = bio->bi_iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
+	index = sectors_to_npage(bio->bi_iter.bi_sector);
 	offset = (bio->bi_iter.bi_sector &
 		  (PAGE_SECTORS - 1)) << SECTOR_SHIFT;
 
@@ -1644,7 +1644,7 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 		goto out;
 	}
 
-	index = sector >> SECTORS_PER_PAGE_SHIFT;
+	index = sectors_to_npage(sector);
 	offset = (sector & (PAGE_SECTORS - 1)) << SECTOR_SHIFT;
 
 	bv.bv_page = page;
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 10fdf413dd6e..12309175d55e 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -21,7 +21,6 @@
 
 #include "zcomp.h"
 
-#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
 #define ZRAM_LOGICAL_BLOCK_SHIFT 12
 #define ZRAM_LOGICAL_BLOCK_SIZE	(1 << ZRAM_LOGICAL_BLOCK_SHIFT)
 #define ZRAM_SECTOR_PER_LOGICAL_BLOCK	\
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

