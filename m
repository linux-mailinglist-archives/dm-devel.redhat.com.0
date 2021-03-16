Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF9B333CBED
	for <lists+dm-devel@lfdr.de>; Tue, 16 Mar 2021 04:19:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615864760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NUppJdWriToEulnS9oayHw9dM3k8sGGW6Owz6UkVr1M=;
	b=ZsBbQMiAvNdrSnfJbKAbJGDEr7dIN+FJU7hJNKu4H5YQXG70QVa7nhbNpAwf3EHn012ZnK
	m+ULwWZiuqK3GQR/GqKUM/sgCURNVRNTHjeoYpViBJ81LdvciTV9hFvPINJa2/u7t26imv
	D1i+YbZk3i+UZgFiOoUm5TQKCWCWUU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-CF6KnrTWOOqUyRf0lJfcfA-1; Mon, 15 Mar 2021 23:19:17 -0400
X-MC-Unique: CF6KnrTWOOqUyRf0lJfcfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0B618460E2;
	Tue, 16 Mar 2021 03:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8D51B472;
	Tue, 16 Mar 2021 03:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3B9585CB;
	Tue, 16 Mar 2021 03:18:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G3HuhA002702 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 23:17:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A65C2A89E; Tue, 16 Mar 2021 03:17:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-86.pek2.redhat.com [10.72.12.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F21760C0F;
	Tue, 16 Mar 2021 03:17:44 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 16 Mar 2021 11:15:15 +0800
Message-Id: <20210316031523.864506-4-ming.lei@redhat.com>
In-Reply-To: <20210316031523.864506-1-ming.lei@redhat.com>
References: <20210316031523.864506-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 03/11] block: add helper of
	blk_create_io_context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add one helper for creating io context and prepare for supporting
efficient bio based io poll.

Meantime move the code of creating io_context before checking bio's
REQ_HIPRI flag because the following patch may change to clear REQ_HIPRI
if io_context can't be created.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index a31371d55b9d..d58f8a0c80de 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -792,6 +792,18 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 	return BLK_STS_OK;
 }
 
+static inline void blk_create_io_context(struct request_queue *q)
+{
+	/*
+	 * Various block parts want %current->io_context, so allocate it up
+	 * front rather than dealing with lots of pain to allocate it only
+	 * where needed. This may fail and the block layer knows how to live
+	 * with it.
+	 */
+	if (unlikely(!current->io_context))
+		create_task_io_context(current, GFP_ATOMIC, q->node);
+}
+
 static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 {
 	struct block_device *bdev = bio->bi_bdev;
@@ -836,6 +848,8 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		}
 	}
 
+	blk_create_io_context(q);
+
 	if (!blk_queue_poll(q))
 		bio->bi_opf &= ~REQ_HIPRI;
 
@@ -876,15 +890,6 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		break;
 	}
 
-	/*
-	 * Various block parts want %current->io_context, so allocate it up
-	 * front rather than dealing with lots of pain to allocate it only
-	 * where needed. This may fail and the block layer knows how to live
-	 * with it.
-	 */
-	if (unlikely(!current->io_context))
-		create_task_io_context(current, GFP_ATOMIC, q->node);
-
 	if (blk_throtl_bio(bio)) {
 		blkcg_bio_issue_init(bio);
 		return false;
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

