Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 26F0020BFCC
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I4C5BSE108trZbMY9Oe0s4a3O8manbUw+30DuPoAHDo=;
	b=bP4Ofv2Dmvg3v0LYZg/sLHmwdvb1O7Ddv7awexAvdFFWyl227sspPH6OAFpvrIosOgXqJX
	cQc1JRKcYXQ08dOpls85En+hHwN5xmOr9Q/H5xDt87cIsZYBs0MxJh3V/WDa+81UoZFFWk
	sucpjB92/tzWTfBQ2bJJT6WnEOdGS/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-iv_x6kxsOe2KWPgmUcwdxA-1; Sat, 27 Jun 2020 03:38:01 -0400
X-MC-Unique: iv_x6kxsOe2KWPgmUcwdxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1397D107AFC7;
	Sat, 27 Jun 2020 07:37:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E22AA10013D4;
	Sat, 27 Jun 2020 07:37:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5A108759D;
	Sat, 27 Jun 2020 07:37:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bqpa004510 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C711A109FC83; Sat, 27 Jun 2020 07:37:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C31DE109FC82
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A95348007B3
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-laGHfyZ4O4WLsWNtdfz5cw-1; Sat, 27 Jun 2020 03:37:50 -0400
X-MC-Unique: laGHfyZ4O4WLsWNtdfz5cw-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5KB-0006na-7G; Sat, 27 Jun 2020 07:32:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:54 +0200
Message-Id: <20200627073159.2447325-10-hch@lst.de>
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
Subject: [dm-devel] [PATCH 09/14] block: move the initial blkg lookup into
	blkg_tryget_closest
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

By moving the initial blkg lookup into blkg_tryget_closest we get
a nicely self contained routines that does all the RCU locking.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 0912820d4f8194..d21ec2acd716e7 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1716,19 +1716,20 @@ void blkcg_add_delay(struct blkcg_gq *blkg, u64 now, u64 delta)
 
 /**
  * blkg_tryget_closest - try and get a blkg ref on the closet blkg
- * @blkg: blkg to get
+ * @bio: target bio
+ * @css: target css
  *
- * This needs to be called rcu protected.  As the failure mode here is to walk
- * up the blkg tree, this ensure that the blkg->parent pointers are always
- * valid.  This returns the blkg that it ended up taking a reference on or %NULL
- * if no reference was taken.
+ * As the failure mode here is to walk up the blkg tree, this ensure that the
+ * blkg->parent pointers are always valid.  This returns the blkg that it ended
+ * up taking a reference on or %NULL if no reference was taken.
  */
-static inline struct blkcg_gq *blkg_tryget_closest(struct blkcg_gq *blkg)
+static inline struct blkcg_gq *blkg_tryget_closest(struct bio *bio,
+		struct cgroup_subsys_state *css)
 {
-	struct blkcg_gq *ret_blkg = NULL;
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
+	struct blkcg_gq *blkg, *ret_blkg = NULL;
 
+	rcu_read_lock();
+	blkg = blkg_lookup_create(css_to_blkcg(css), bio->bi_disk->queue);
 	while (blkg) {
 		if (blkg_tryget(blkg)) {
 			ret_blkg = blkg;
@@ -1736,6 +1737,7 @@ static inline struct blkcg_gq *blkg_tryget_closest(struct blkcg_gq *blkg)
 		}
 		blkg = blkg->parent;
 	}
+	rcu_read_unlock();
 
 	return ret_blkg;
 }
@@ -1757,21 +1759,14 @@ static inline struct blkcg_gq *blkg_tryget_closest(struct blkcg_gq *blkg)
 void bio_associate_blkg_from_css(struct bio *bio,
 				 struct cgroup_subsys_state *css)
 {
-	struct request_queue *q = bio->bi_disk->queue;
-
 	if (bio->bi_blkg)
 		blkg_put(bio->bi_blkg);
 
 	if (css && css->parent) {
-		struct blkcg_gq *blkg;
-
-		rcu_read_lock();
-		blkg = blkg_lookup_create(css_to_blkcg(css), q);
-		bio->bi_blkg = blkg_tryget_closest(blkg);
-		rcu_read_unlock();
+		bio->bi_blkg = blkg_tryget_closest(bio, css);
 	} else {
-		blkg_get(q->root_blkg);
-		bio->bi_blkg = q->root_blkg;
+		blkg_get(bio->bi_disk->queue->root_blkg);
+		bio->bi_blkg = bio->bi_disk->queue->root_blkg;
 	}
 }
 EXPORT_SYMBOL_GPL(bio_associate_blkg_from_css);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

