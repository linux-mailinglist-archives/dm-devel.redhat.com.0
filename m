Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 731804F55DE
	for <lists+dm-devel@lfdr.de>; Wed,  6 Apr 2022 08:12:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-57ti7JYFOwiMccz7SFZ9uQ-1; Wed, 06 Apr 2022 02:12:47 -0400
X-MC-Unique: 57ti7JYFOwiMccz7SFZ9uQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6701011637;
	Wed,  6 Apr 2022 06:12:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4EC403D17F;
	Wed,  6 Apr 2022 06:12:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BC89C193F6E3;
	Wed,  6 Apr 2022 06:12:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3ED0F19451F3
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Apr 2022 06:12:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1FC8640C1241; Wed,  6 Apr 2022 06:12:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC9E403D1DD
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 06:12:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D08101AA42
 for <dm-devel@redhat.com>; Wed,  6 Apr 2022 06:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-SVlOrHSiMcCr4vcv72rTIg-1; Wed, 06 Apr 2022 02:12:38 -0400
X-MC-Unique: SVlOrHSiMcCr4vcv72rTIg-1
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyuA-003zHx-LZ; Wed, 06 Apr 2022 06:12:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:12:24 +0200
Message-Id: <20220406061228.410163-2-hch@lst.de>
In-Reply-To: <20220406061228.410163-1-hch@lst.de>
References: <20220406061228.410163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [dm-devel] [PATCH 1/5] btrfs: simplify ->flush_bio handling
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
Cc: linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, target-devel@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use and embedded bios that is initialized when used instead of
bio_kmalloc plus bio_reset.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/disk-io.c |  8 +++++---
 fs/btrfs/volumes.c | 11 -----------
 fs/btrfs/volumes.h |  4 ++--
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index b30309f187cf0..51f4cdf6bcaea 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -4225,6 +4225,7 @@ static int wait_dev_supers(struct btrfs_device *device, int max_mirrors)
  */
 static void btrfs_end_empty_barrier(struct bio *bio)
 {
+	bio_uninit(bio);
 	complete(bio->bi_private);
 }
 
@@ -4234,7 +4235,7 @@ static void btrfs_end_empty_barrier(struct bio *bio)
  */
 static void write_dev_flush(struct btrfs_device *device)
 {
-	struct bio *bio = device->flush_bio;
+	struct bio *bio = &device->flush_bio;
 
 #ifndef CONFIG_BTRFS_FS_CHECK_INTEGRITY
 	/*
@@ -4252,7 +4253,8 @@ static void write_dev_flush(struct btrfs_device *device)
 		return;
 #endif
 
-	bio_reset(bio, device->bdev, REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH);
+	bio_init(bio, device->bdev, NULL, 0,
+		 REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH);
 	bio->bi_end_io = btrfs_end_empty_barrier;
 	init_completion(&device->flush_wait);
 	bio->bi_private = &device->flush_wait;
@@ -4266,7 +4268,7 @@ static void write_dev_flush(struct btrfs_device *device)
  */
 static blk_status_t wait_dev_flush(struct btrfs_device *device)
 {
-	struct bio *bio = device->flush_bio;
+	struct bio *bio = &device->flush_bio;
 
 	if (!test_bit(BTRFS_DEV_STATE_FLUSH_SENT, &device->dev_state))
 		return BLK_STS_OK;
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 1be7cb2f955fc..00517239b5c01 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -405,7 +405,6 @@ void btrfs_free_device(struct btrfs_device *device)
 	WARN_ON(!list_empty(&device->post_commit_list));
 	rcu_string_free(device->name);
 	extent_io_tree_release(&device->alloc_state);
-	bio_put(device->flush_bio);
 	btrfs_destroy_dev_zone_info(device);
 	kfree(device);
 }
@@ -6956,16 +6955,6 @@ struct btrfs_device *btrfs_alloc_device(struct btrfs_fs_info *fs_info,
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * Preallocate a bio that's always going to be used for flushing device
-	 * barriers and matches the device lifespan
-	 */
-	dev->flush_bio = bio_kmalloc(GFP_KERNEL, 0);
-	if (!dev->flush_bio) {
-		kfree(dev);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	INIT_LIST_HEAD(&dev->dev_list);
 	INIT_LIST_HEAD(&dev->dev_alloc_list);
 	INIT_LIST_HEAD(&dev->post_commit_list);
diff --git a/fs/btrfs/volumes.h b/fs/btrfs/volumes.h
index bd297f23d19e7..628c9af894749 100644
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@ -121,8 +121,8 @@ struct btrfs_device {
 	/* bytes used on the current transaction */
 	u64 commit_bytes_used;
 
-	/* for sending down flush barriers */
-	struct bio *flush_bio;
+	/* Bio used for flushing device barriers */
+	struct bio flush_bio;
 	struct completion flush_wait;
 
 	/* per-device scrub information */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

