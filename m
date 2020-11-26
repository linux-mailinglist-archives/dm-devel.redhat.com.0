Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A99872C5582
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 14:33:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-7c3zehcSPCmbp3UkAgMgFw-1; Thu, 26 Nov 2020 08:33:19 -0500
X-MC-Unique: 7c3zehcSPCmbp3UkAgMgFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A736185E48F;
	Thu, 26 Nov 2020 13:33:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14811608BA;
	Thu, 26 Nov 2020 13:33:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC57C1809CA6;
	Thu, 26 Nov 2020 13:33:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQDX9sl006024 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 08:33:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D5729C77F5; Thu, 26 Nov 2020 13:33:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D07DDC77E4
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:33:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90CFA8007DF
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 13:33:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-7uPN4JpdMweRuuRC6-K1lA-1; Thu, 26 Nov 2020 08:33:03 -0500
X-MC-Unique: 7uPN4JpdMweRuuRC6-K1lA-1
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGz8-00040S-Ao; Thu, 26 Nov 2020 13:06:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 26 Nov 2020 14:03:53 +0100
Message-Id: <20201126130422.92945-16-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 15/44] block: change the hash used for looking up
	block devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adding the minor to the major creates tons of pointless conflicts. Just
use the dev_t itself, which is 32-bits and thus is guaranteed to fit
into ino_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 fs/block_dev.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index c5755150c6be62..d707ab376da86e 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -863,35 +863,12 @@ void __init bdev_cache_init(void)
 	blockdev_superblock = bd_mnt->mnt_sb;   /* For writeback */
 }
 
-/*
- * Most likely _very_ bad one - but then it's hardly critical for small
- * /dev and can be fixed when somebody will need really large one.
- * Keep in mind that it will be fed through icache hash function too.
- */
-static inline unsigned long hash(dev_t dev)
-{
-	return MAJOR(dev)+MINOR(dev);
-}
-
-static int bdev_test(struct inode *inode, void *data)
-{
-	return BDEV_I(inode)->bdev.bd_dev == *(dev_t *)data;
-}
-
-static int bdev_set(struct inode *inode, void *data)
-{
-	BDEV_I(inode)->bdev.bd_dev = *(dev_t *)data;
-	return 0;
-}
-
 static struct block_device *bdget(dev_t dev)
 {
 	struct block_device *bdev;
 	struct inode *inode;
 
-	inode = iget5_locked(blockdev_superblock, hash(dev),
-			bdev_test, bdev_set, &dev);
-
+	inode = iget_locked(blockdev_superblock, dev);
 	if (!inode)
 		return NULL;
 
@@ -903,6 +880,7 @@ static struct block_device *bdget(dev_t dev)
 		bdev->bd_super = NULL;
 		bdev->bd_inode = inode;
 		bdev->bd_part_count = 0;
+		bdev->bd_dev = dev;
 		inode->i_mode = S_IFBLK;
 		inode->i_rdev = dev;
 		inode->i_bdev = bdev;
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

