Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5763C2C6FF3
	for <lists+dm-devel@lfdr.de>; Sat, 28 Nov 2020 17:23:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-C0Om_-FoO8mea2c3ZV1yiw-1; Sat, 28 Nov 2020 11:22:30 -0500
X-MC-Unique: C0Om_-FoO8mea2c3ZV1yiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E6F10059A9;
	Sat, 28 Nov 2020 16:22:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B02545D722;
	Sat, 28 Nov 2020 16:22:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EC591809CA3;
	Sat, 28 Nov 2020 16:22:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ASGMJVw023327 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 11:22:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CECA2027EAC; Sat, 28 Nov 2020 16:22:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581B8202717D
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:22:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0718C1859195
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 16:22:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-dZrckFn0Ou-8lWN-0poqIA-1; Sat, 28 Nov 2020 11:22:14 -0500
X-MC-Unique: dZrckFn0Ou-8lWN-0poqIA-1
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2tG-0000Ma-DB; Sat, 28 Nov 2020 16:16:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 28 Nov 2020 17:14:54 +0100
Message-Id: <20201128161510.347752-30-hch@lst.de>
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 29/45] block: initialize struct block_device in
	bdev_alloc
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't play tricks with slab constructors as bdev structures tends to not
get reused very much, and this makes the code a lot less error prone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 fs/block_dev.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 0569f5ebeb6fd0..a5b6955a841f18 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -784,20 +784,11 @@ static void bdev_free_inode(struct inode *inode)
 	kmem_cache_free(bdev_cachep, BDEV_I(inode));
 }
 
-static void init_once(void *foo)
+static void init_once(void *data)
 {
-	struct bdev_inode *ei = (struct bdev_inode *) foo;
-	struct block_device *bdev = &ei->bdev;
+	struct bdev_inode *ei = data;
 
-	memset(bdev, 0, sizeof(*bdev));
-	mutex_init(&bdev->bd_mutex);
-#ifdef CONFIG_SYSFS
-	INIT_LIST_HEAD(&bdev->bd_holder_disks);
-#endif
-	bdev->bd_bdi = &noop_backing_dev_info;
 	inode_init_once(&ei->vfs_inode);
-	/* Initialize mutex for freeze. */
-	mutex_init(&bdev->bd_fsfreeze_mutex);
 }
 
 static void bdev_evict_inode(struct inode *inode)
@@ -873,12 +864,17 @@ struct block_device *bdev_alloc(struct gendisk *disk, u8 partno)
 	mapping_set_gfp_mask(&inode->i_data, GFP_USER);
 
 	bdev = I_BDEV(inode);
+	memset(bdev, 0, sizeof(*bdev));
+	mutex_init(&bdev->bd_mutex);
+	mutex_init(&bdev->bd_fsfreeze_mutex);
 	spin_lock_init(&bdev->bd_size_lock);
 	bdev->bd_disk = disk;
 	bdev->bd_partno = partno;
-	bdev->bd_super = NULL;
 	bdev->bd_inode = inode;
-	bdev->bd_part_count = 0;
+	bdev->bd_bdi = &noop_backing_dev_info;
+#ifdef CONFIG_SYSFS
+	INIT_LIST_HEAD(&bdev->bd_holder_disks);
+#endif
 	return bdev;
 }
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

