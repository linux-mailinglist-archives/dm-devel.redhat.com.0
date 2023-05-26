Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B2712111
	for <lists+dm-devel@lfdr.de>; Fri, 26 May 2023 09:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685086503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8/MXcmZ4r/NKYLvn+gVGsou1hjSVNH9myABP9heiK4A=;
	b=AQWFQT3TZgEuW16H+rcJo/wZVaZmSYSKuWxxRPis4+gH6g2Y01zpXudmA9VXirpaYiXsOV
	BoTsuAZz9ST9VvoY4ldIdj+zoVxhDXS7EsMcuM0gUXU/y987LAHAew65HlGUHcHU3VZfz2
	GJJ++blgkz9DQX4cuRKvqJA6OHXK0Ac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-umCtwuVIOr-_8P4FL614hg-1; Fri, 26 May 2023 03:34:18 -0400
X-MC-Unique: umCtwuVIOr-_8P4FL614hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C35DD8032FE;
	Fri, 26 May 2023 07:34:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF2BF1121314;
	Fri, 26 May 2023 07:34:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5397D19451CB;
	Fri, 26 May 2023 07:34:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 586FF19465B1
 for <dm-devel@listman.corp.redhat.com>; Fri, 26 May 2023 07:33:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFBC0140E962; Fri, 26 May 2023 07:33:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C86B4140E95D
 for <dm-devel@redhat.com>; Fri, 26 May 2023 07:33:47 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD1951C01E9C
 for <dm-devel@redhat.com>; Fri, 26 May 2023 07:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-cDqyTKFLPpeudrwrRPdKYQ-1; Fri, 26 May 2023 03:33:46 -0400
X-MC-Unique: cDqyTKFLPpeudrwrRPdKYQ-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1q2RxB-001Rda-0i; Fri, 26 May 2023 07:33:37 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
 philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
 christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
 minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 26 May 2023 00:33:36 -0700
Message-Id: <20230526073336.344543-6-mcgrof@kernel.org>
In-Reply-To: <20230526073336.344543-1-mcgrof@kernel.org>
References: <20230526073336.344543-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH v2 5/5] zram: use generic PAGE_SECTORS and
 PAGE_SECTORS_SHIFT
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
 da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
 willy@infradead.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 rpuri.linux@gmail.com, kbusch@kernel.org, drbd-dev@lists.linbit.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of re-defining the already existing constants use the provided ones:

So replace:

 o SECTORS_PER_PAGE_SHIFT with PAGE_SECTORS_SHIFT
 o SECTORS_PER_PAGE       with PAGE_SECTORS

This produces no functional changes.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/zram/zram_drv.c | 12 ++++++------
 drivers/block/zram/zram_drv.h |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index f6d90f1ba5cf..5fdeb78ace9a 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1834,8 +1834,8 @@ static ssize_t recompress_store(struct device *dev,
 static void zram_bio_discard(struct zram *zram, struct bio *bio)
 {
 	size_t n = bio->bi_iter.bi_size;
-	u32 index = bio->bi_iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
-	u32 offset = (bio->bi_iter.bi_sector & (SECTORS_PER_PAGE - 1)) <<
+	u32 index = bio->bi_iter.bi_sector >> PAGE_SECTORS_SHIFT;
+	u32 offset = (bio->bi_iter.bi_sector & (PAGE_SECTORS - 1)) <<
 			SECTOR_SHIFT;
 
 	/*
@@ -1876,8 +1876,8 @@ static void zram_bio_read(struct zram *zram, struct bio *bio)
 
 	start_time = bio_start_io_acct(bio);
 	bio_for_each_segment(bv, bio, iter) {
-		u32 index = iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
-		u32 offset = (iter.bi_sector & (SECTORS_PER_PAGE - 1)) <<
+		u32 index = iter.bi_sector >> PAGE_SECTORS_SHIFT;
+		u32 offset = (iter.bi_sector & (PAGE_SECTORS - 1)) <<
 				SECTOR_SHIFT;
 
 		if (zram_bvec_read(zram, &bv, index, offset, bio) < 0) {
@@ -1903,8 +1903,8 @@ static void zram_bio_write(struct zram *zram, struct bio *bio)
 
 	start_time = bio_start_io_acct(bio);
 	bio_for_each_segment(bv, bio, iter) {
-		u32 index = iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
-		u32 offset = (iter.bi_sector & (SECTORS_PER_PAGE - 1)) <<
+		u32 index = iter.bi_sector >> PAGE_SECTORS_SHIFT;
+		u32 offset = (iter.bi_sector & (PAGE_SECTORS - 1)) <<
 				SECTOR_SHIFT;
 
 		if (zram_bvec_write(zram, &bv, index, offset, bio) < 0) {
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index ca7a15bd4845..9f2543af5c76 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -21,8 +21,6 @@
 
 #include "zcomp.h"
 
-#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define SECTORS_PER_PAGE	(1 << SECTORS_PER_PAGE_SHIFT)
 #define ZRAM_LOGICAL_BLOCK_SHIFT 12
 #define ZRAM_LOGICAL_BLOCK_SIZE	(1 << ZRAM_LOGICAL_BLOCK_SHIFT)
 #define ZRAM_SECTOR_PER_LOGICAL_BLOCK	\
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

