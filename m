Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 493D020BFCF
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QiQMzj5CVywXA4q8xhHta4rSnG4HjuAX9mgeq1pZ36Y=;
	b=E6Th7b1xPMbFRoUneHJg+bdwQ4ZDtHSgsYjQlvPsgQ/1PxQ9ygypJQrXvuZatmembESgI3
	LiqVxQfrMjAo19Ss+L+UK9GNWU0OTtStL28t2PId38MSK/RLH3h8B6yYFLJkVowBzbBkJW
	qngYSJ6xgCy5WFSg7Cr8VdeaKD1bZGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Yqax2PUxM7aDZIKS53kMww-1; Sat, 27 Jun 2020 03:38:11 -0400
X-MC-Unique: Yqax2PUxM7aDZIKS53kMww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C8F8015F9;
	Sat, 27 Jun 2020 07:38:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C69937F4F9;
	Sat, 27 Jun 2020 07:38:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EBE21806B0A;
	Sat, 27 Jun 2020 07:38:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7c1os004548 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:38:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5073109FC83; Sat, 27 Jun 2020 07:38:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1232109FC82
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C238007AC
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:58 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-QMbWLwTTPkSQxr8kNrNhpA-1; Sat, 27 Jun 2020 03:37:55 -0400
X-MC-Unique: QMbWLwTTPkSQxr8kNrNhpA-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5K3-0006nC-48; Sat, 27 Jun 2020 07:32:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:52 +0200
Message-Id: <20200627073159.2447325-8-hch@lst.de>
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] [PATCH 07/14] block: merge blkg_lookup_create and
	__blkg_lookup_create
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

No good reason to keep these two functions split.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c | 49 +++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index bb0607bfd771cd..6aedb73ffbf473 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -316,30 +316,35 @@ static struct blkcg_gq *blkg_create(struct blkcg *blkcg,
 }
 
 /**
- * __blkg_lookup_create - lookup blkg, try to create one if not there
+ * blkg_lookup_create - lookup blkg, try to create one if not there
  * @blkcg: blkcg of interest
  * @q: request_queue of interest
  *
  * Lookup blkg for the @blkcg - @q pair.  If it doesn't exist, try to
  * create one.  blkg creation is performed recursively from blkcg_root such
  * that all non-root blkg's have access to the parent blkg.  This function
- * should be called under RCU read lock and @q->queue_lock.
+ * should be called under RCU read lock and takes @q->queue_lock.
  *
  * Returns the blkg or the closest blkg if blkg_create() fails as it walks
  * down from root.
  */
-static struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
-				      struct request_queue *q)
+static struct blkcg_gq *blkg_lookup_create(struct blkcg *blkcg,
+		struct request_queue *q)
 {
 	struct blkcg_gq *blkg;
+	unsigned long flags;
 
 	WARN_ON_ONCE(!rcu_read_lock_held());
-	lockdep_assert_held(&q->queue_lock);
 
-	blkg = __blkg_lookup(blkcg, q, true);
+	blkg = blkg_lookup(blkcg, q);
 	if (blkg)
 		return blkg;
 
+	spin_lock_irqsave(&q->queue_lock, flags);
+	blkg = __blkg_lookup(blkcg, q, true);
+	if (blkg)
+		goto found;
+
 	/*
 	 * Create blkgs walking down from blkcg_root to @blkcg, so that all
 	 * non-root blkgs have access to their parents.  Returns the closest
@@ -362,34 +367,16 @@ static struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
 		}
 
 		blkg = blkg_create(pos, q, NULL);
-		if (IS_ERR(blkg))
-			return ret_blkg;
+		if (IS_ERR(blkg)) {
+			blkg = ret_blkg;
+			break;
+		}
 		if (pos == blkcg)
-			return blkg;
-	}
-}
-
-/**
- * blkg_lookup_create - find or create a blkg
- * @blkcg: target block cgroup
- * @q: target request_queue
- *
- * This looks up or creates the blkg representing the unique pair
- * of the blkcg and the request_queue.
- */
-static struct blkcg_gq *blkg_lookup_create(struct blkcg *blkcg,
-				    struct request_queue *q)
-{
-	struct blkcg_gq *blkg = blkg_lookup(blkcg, q);
-
-	if (unlikely(!blkg)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&q->queue_lock, flags);
-		blkg = __blkg_lookup_create(blkcg, q);
-		spin_unlock_irqrestore(&q->queue_lock, flags);
+			break;
 	}
 
+found:
+	spin_unlock_irqrestore(&q->queue_lock, flags);
 	return blkg;
 }
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

