Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B0D912C556C
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 14:32:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-NzxJKTFDNfyxkXzAGdL2Rg-1; Thu, 26 Nov 2020 08:32:42 -0500
X-MC-Unique: NzxJKTFDNfyxkXzAGdL2Rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67EC21074647;
	Thu, 26 Nov 2020 13:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 460F75C1C2;
	Thu, 26 Nov 2020 13:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3BAA180954D;
	Thu, 26 Nov 2020 13:32:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQDWYHE005786 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 08:32:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A9AE1018CBE; Thu, 26 Nov 2020 13:32:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76B8B1018E57
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:32:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1471800B3A
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:32:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-1e0QnNj_PJSL9HZYLfWN7Q-1; Thu, 26 Nov 2020 08:32:28 -0500
X-MC-Unique: 1e0QnNj_PJSL9HZYLfWN7Q-1
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGyw-0003xL-Ej; Thu, 26 Nov 2020 13:06:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 26 Nov 2020 14:03:44 +0100
Message-Id: <20201126130422.92945-7-hch@lst.de>
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, Minchan Kim <minchan@kernel.org>
Subject: [dm-devel] [PATCH 06/44] zram: do not call set_blocksize
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

set_blocksize is used by file systems to use their preferred buffer cache
block size.  Block drivers should not set it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
---
 drivers/block/zram/zram_drv.c | 11 +----------
 drivers/block/zram/zram_drv.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 6d15d51cee2b7e..b5f68951c9d280 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -403,13 +403,10 @@ static void reset_bdev(struct zram *zram)
 		return;
 
 	bdev = zram->bdev;
-	if (zram->old_block_size)
-		set_blocksize(bdev, zram->old_block_size);
 	blkdev_put(bdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
 	/* hope filp_close flush all of IO */
 	filp_close(zram->backing_dev, NULL);
 	zram->backing_dev = NULL;
-	zram->old_block_size = 0;
 	zram->bdev = NULL;
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
@@ -454,7 +451,7 @@ static ssize_t backing_dev_store(struct device *dev,
 	struct file *backing_dev = NULL;
 	struct inode *inode;
 	struct address_space *mapping;
-	unsigned int bitmap_sz, old_block_size = 0;
+	unsigned int bitmap_sz;
 	unsigned long nr_pages, *bitmap = NULL;
 	struct block_device *bdev = NULL;
 	int err;
@@ -509,14 +506,8 @@ static ssize_t backing_dev_store(struct device *dev,
 		goto out;
 	}
 
-	old_block_size = block_size(bdev);
-	err = set_blocksize(bdev, PAGE_SIZE);
-	if (err)
-		goto out;
-
 	reset_bdev(zram);
 
-	zram->old_block_size = old_block_size;
 	zram->bdev = bdev;
 	zram->backing_dev = backing_dev;
 	zram->bitmap = bitmap;
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index f2fd46daa76045..712354a4207c77 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -118,7 +118,6 @@ struct zram {
 	bool wb_limit_enable;
 	u64 bd_wb_limit;
 	struct block_device *bdev;
-	unsigned int old_block_size;
 	unsigned long *bitmap;
 	unsigned long nr_pages;
 #endif
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

