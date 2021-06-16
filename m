Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97EAE3A9B8D
	for <lists+dm-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623848832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o+h4PPJwICc0yAB7a1SnpG8GbHLQ8pzRFWIdNrGFHbg=;
	b=da5o1xB6+MH/Fq++mBkaF2FBGzpDy8DSkM+fvFAJzdd4U/p3KqJ3x+YDe6S9G9Rza6hpkr
	zrbhqHayLWcuL1MN4MHfD9Re41wbssvyTWmSQydaHn8ovsrVd0jMuggRUdp/Yy1Fyoy4uF
	3JbhxFBNwQPUbLlUBbF6Wd0O/Eepmzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-8Un4XNrdMYKawTqpKFZVyg-1; Wed, 16 Jun 2021 09:07:10 -0400
X-MC-Unique: 8Un4XNrdMYKawTqpKFZVyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57781100D0DD;
	Wed, 16 Jun 2021 13:07:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D79100238C;
	Wed, 16 Jun 2021 13:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFA0646F59;
	Wed, 16 Jun 2021 13:07:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15GD70Fk001433 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 09:07:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F104260CC9; Wed, 16 Jun 2021 13:07:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-48.pek2.redhat.com [10.72.12.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4723860C13;
	Wed, 16 Jun 2021 13:06:59 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 16 Jun 2021 21:05:32 +0800
Message-Id: <20210616130533.754248-4-ming.lei@redhat.com>
In-Reply-To: <20210616130533.754248-1-ming.lei@redhat.com>
References: <20210616130533.754248-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 3/4] block: add ->poll_bio to
	block_device_operations
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Prepare for supporting IO polling for bio based driver.

Add ->poll_bio callback so that bio driver can provide their own logic
for polling bio.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c       | 18 +++++++++++++-----
 block/genhd.c          |  3 +++
 include/linux/blkdev.h |  2 ++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1e24c71c6738..a1552ec8d608 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1113,11 +1113,13 @@ EXPORT_SYMBOL(submit_bio);
  */
 int bio_poll(struct bio *bio, unsigned int flags)
 {
-	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
+	struct gendisk *disk = bio->bi_bdev->bd_disk;
+	struct request_queue *q = disk->queue;
 	blk_qc_t cookie = READ_ONCE(bio->bi_cookie);
 	int ret;
 
-	if (cookie == BLK_QC_T_NONE || !blk_queue_poll(q))
+	if ((queue_is_mq(q) && cookie == BLK_QC_T_NONE) ||
+			!blk_queue_poll(q))
 		return 0;
 
 	if (current->plug)
@@ -1125,10 +1127,16 @@ int bio_poll(struct bio *bio, unsigned int flags)
 
 	if (blk_queue_enter(q, BLK_MQ_REQ_NOWAIT))
 		return 0;
-	if (WARN_ON_ONCE(!queue_is_mq(q)))
-		ret = 0;	/* not yet implemented, should not happen */
-	else
+	if (!queue_is_mq(q)) {
+		if (disk->fops->poll_bio) {
+			ret = disk->fops->poll_bio(bio, flags);
+		} else {
+			WARN_ON_ONCE(1);
+			ret = 0;
+		}
+	} else {
 		ret = blk_mq_poll(q, cookie, flags);
+	}
 	blk_queue_exit(q);
 	return ret;
 }
diff --git a/block/genhd.c b/block/genhd.c
index 5f5628216295..042dfa5b3f79 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -471,6 +471,9 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 {
 	int ret;
 
+	/* ->poll_bio is only for bio based driver */
+	WARN_ON_ONCE(queue_is_mq(disk->queue) && disk->fops->poll_bio);
+
 	/*
 	 * The disk queue should now be all set with enough information about
 	 * the device for the elevator code to pick an adequate default
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index fc0ba0b80776..6da6fb120148 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1858,6 +1858,8 @@ static inline void blk_ksm_unregister(struct request_queue *q) { }
 
 struct block_device_operations {
 	void (*submit_bio)(struct bio *bio);
+	/* ->poll_bio is for bio driver only */
+	int (*poll_bio)(struct bio *bio, unsigned int flags);
 	int (*open) (struct block_device *, fmode_t);
 	void (*release) (struct gendisk *, fmode_t);
 	int (*rw_page)(struct block_device *, sector_t, struct page *, unsigned int);
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

