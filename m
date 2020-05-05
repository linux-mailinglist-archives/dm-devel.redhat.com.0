Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C6DB61C633E
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EQfVQms3VF4CJLDusu13Zk8+nQVdVpUKj7cy6Rot0CA=;
	b=JIPl692Vgoc2CtkQw1fNYpr8isu7WnHD4zEBb2VSucMHRALZnXaa0vkZcnTANvLsyXFHDV
	37O/LWpo2e0uhV8KO/lbmkWtBCLsceENLwazT74aAn1olnTkleFagSeBuantOof8yDnRSE
	FYB2jivfwpGYrY3eIrAG1hZie2xyF4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-szSblDT2MGKZm1x1yHtpPw-1; Tue, 05 May 2020 17:41:09 -0400
X-MC-Unique: szSblDT2MGKZm1x1yHtpPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CE1E800D24;
	Tue,  5 May 2020 21:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F2B964430;
	Tue,  5 May 2020 21:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A39C4CAA7;
	Tue,  5 May 2020 21:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CCjhG010884 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:12:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EB982157F25; Tue,  5 May 2020 12:12:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A16A2156A22
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A785882974
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:43 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-62-uSi3iIcOOFKoKqJSV1vUQg-1; Tue, 05 May 2020 08:12:40 -0400
X-MC-Unique: uSi3iIcOOFKoKqJSV1vUQg-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id DB54372B6C5ABD53585B;
	Tue,  5 May 2020 19:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 5 May 2020 19:55:55 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel
	<dm-devel@redhat.com>, Song Liu <song@kernel.org>, linux-raid
	<linux-raid@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Tue, 5 May 2020 19:55:40 +0800
Message-ID: <20200505115543.1660-2-thunder.leizhen@huawei.com>
In-Reply-To: <20200505115543.1660-1-thunder.leizhen@huawei.com>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CCjhG010884
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 1/4] block: Move SECTORS_PER_PAGE and
	SECTORS_PER_PAGE_SHIFT definitions into <linux/blkdev.h>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is similar to commit 233bde21a ("block: Move SECTOR_SIZE and
SECTOR_SHIFT definitions into <linux/blkdev.h>"), prepare to clear dozens
of duplicated codes.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/block/zram/zram_drv.h |  2 --
 include/linux/blkdev.h        | 10 ++++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index f2fd46daa760..12309175d55e 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -21,8 +21,6 @@
 
 #include "zcomp.h"
 
-#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define SECTORS_PER_PAGE	(1 << SECTORS_PER_PAGE_SHIFT)
 #define ZRAM_LOGICAL_BLOCK_SHIFT 12
 #define ZRAM_LOGICAL_BLOCK_SIZE	(1 << ZRAM_LOGICAL_BLOCK_SHIFT)
 #define ZRAM_SECTOR_PER_LOGICAL_BLOCK	\
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 32868fbedc9e..a752e1c80bf0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -904,10 +904,16 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
  * multiple of 512 bytes. Hence these two constants.
  */
 #ifndef SECTOR_SHIFT
-#define SECTOR_SHIFT 9
+#define SECTOR_SHIFT		9
 #endif
 #ifndef SECTOR_SIZE
-#define SECTOR_SIZE (1 << SECTOR_SHIFT)
+#define SECTOR_SIZE		(1 << SECTOR_SHIFT)
+#endif
+#ifndef SECTORS_PER_PAGE_SHIFT
+#define SECTORS_PER_PAGE_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
+#endif
+#ifndef SECTORS_PER_PAGE
+#define SECTORS_PER_PAGE	(1 << SECTORS_PER_PAGE_SHIFT)
 #endif
 
 /*
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

