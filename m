Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3820BFCB
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RmgfxSfNhNKe/rNv7afeNlGSbEmxPjTlCdGCwY5eDxg=;
	b=VXalGbK4y3qdEpo13SKDxmpxFa8ezSIw3EPHT0Q2w/dmmO/JeYjrnMhEekKa8Wd67i64Pa
	0kxn0QmXzc8T+GGgLzWEiNWCuXDxove+BCCHWUBgAilw/mfpsBV77vSF8gxnaRiCguXot5
	ZvMpOoW17Hdkv3KKY9YlXdkIKYZyvp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-9J3jNaxBP7yZXS0_RC2K4A-1; Sat, 27 Jun 2020 03:37:36 -0400
X-MC-Unique: 9J3jNaxBP7yZXS0_RC2K4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3AE18585B9;
	Sat, 27 Jun 2020 07:37:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DF510013D0;
	Sat, 27 Jun 2020 07:37:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDEE91809547;
	Sat, 27 Jun 2020 07:37:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7b98B004349 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 508C2109FC83; Sat, 27 Jun 2020 07:37:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C514109FC82
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93191800260
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:06 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-EpRr4CGYOoSa5qMQs-Y40Q-1; Sat, 27 Jun 2020 03:37:04 -0400
X-MC-Unique: EpRr4CGYOoSa5qMQs-Y40Q-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jz-0006n0-L2; Sat, 27 Jun 2020 07:32:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:51 +0200
Message-Id: <20200627073159.2447325-7-hch@lst.de>
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
Subject: [dm-devel] [PATCH 06/14] block: move the bio cgroup associatation
	helpers to blk-cgroup.c
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

Keep the cgroup code together.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c                |  75 ---------------------------
 block/blk-cgroup.c         | 103 ++++++++++++++++++++++++++++++++++++-
 include/linux/blk-cgroup.h |  30 -----------
 3 files changed, 101 insertions(+), 107 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 901d22715dd4f3..fc1299f9d86a24 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1627,81 +1627,6 @@ int bioset_init_from_src(struct bio_set *bs, struct bio_set *src)
 }
 EXPORT_SYMBOL(bioset_init_from_src);
 
-#ifdef CONFIG_BLK_CGROUP
-/**
- * bio_associate_blkg_from_css - associate a bio with a specified css
- * @bio: target bio
- * @css: target css
- *
- * Associate @bio with the blkg found by combining the css's blkg and the
- * request_queue of the @bio.  An association failure is handled by walking up
- * the blkg tree.  Therefore, the blkg associated can be anything between @blkg
- * and q->root_blkg.  This situation only happens when a cgroup is dying and
- * then the remaining bios will spill to the closest alive blkg.
- *
- * A reference will be taken on the blkg and will be released when @bio is
- * freed.
- */
-void bio_associate_blkg_from_css(struct bio *bio,
-				 struct cgroup_subsys_state *css)
-{
-	struct request_queue *q = bio->bi_disk->queue;
-	struct blkcg_gq *blkg = q->root_blkg;
-
-	if (bio->bi_blkg)
-		blkg_put(bio->bi_blkg);
-
-	rcu_read_lock();
-	if (css && css->parent)
-		blkg = blkg_lookup_create(css_to_blkcg(css), q);
-	bio->bi_blkg = blkg_tryget_closest(blkg);
-	rcu_read_unlock();
-}
-EXPORT_SYMBOL_GPL(bio_associate_blkg_from_css);
-
-/**
- * bio_associate_blkg - associate a bio with a blkg
- * @bio: target bio
- *
- * Associate @bio with the blkg found from the bio's css and request_queue.
- * If one is not found, bio_lookup_blkg() creates the blkg.  If a blkg is
- * already associated, the css is reused and association redone as the
- * request_queue may have changed.
- */
-void bio_associate_blkg(struct bio *bio)
-{
-	struct cgroup_subsys_state *css;
-
-	rcu_read_lock();
-
-	if (bio->bi_blkg)
-		css = &bio_blkcg(bio)->css;
-	else
-		css = blkcg_css();
-
-	bio_associate_blkg_from_css(bio, css);
-
-	rcu_read_unlock();
-}
-EXPORT_SYMBOL_GPL(bio_associate_blkg);
-
-/**
- * bio_clone_blkg_association - clone blkg association from src to dst bio
- * @dst: destination bio
- * @src: source bio
- */
-void bio_clone_blkg_association(struct bio *dst, struct bio *src)
-{
-	if (src->bi_blkg) {
-		if (dst->bi_blkg)
-			blkg_put(dst->bi_blkg);
-		blkg_get(src->bi_blkg);
-		dst->bi_blkg = src->bi_blkg;
-	}
-}
-EXPORT_SYMBOL_GPL(bio_clone_blkg_association);
-#endif /* CONFIG_BLK_CGROUP */
-
 static void __init biovec_init_slabs(void)
 {
 	int i;
diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 0ecc897b225c96..bb0607bfd771cd 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -328,7 +328,7 @@ static struct blkcg_gq *blkg_create(struct blkcg *blkcg,
  * Returns the blkg or the closest blkg if blkg_create() fails as it walks
  * down from root.
  */
-struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
+static struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
 				      struct request_queue *q)
 {
 	struct blkcg_gq *blkg;
@@ -377,7 +377,7 @@ struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
  * This looks up or creates the blkg representing the unique pair
  * of the blkcg and the request_queue.
  */
-struct blkcg_gq *blkg_lookup_create(struct blkcg *blkcg,
+static struct blkcg_gq *blkg_lookup_create(struct blkcg *blkcg,
 				    struct request_queue *q)
 {
 	struct blkcg_gq *blkg = blkg_lookup(blkcg, q);
@@ -1727,6 +1727,105 @@ void blkcg_add_delay(struct blkcg_gq *blkg, u64 now, u64 delta)
 	atomic64_add(delta, &blkg->delay_nsec);
 }
 
+/**
+ * blkg_tryget_closest - try and get a blkg ref on the closet blkg
+ * @blkg: blkg to get
+ *
+ * This needs to be called rcu protected.  As the failure mode here is to walk
+ * up the blkg tree, this ensure that the blkg->parent pointers are always
+ * valid.  This returns the blkg that it ended up taking a reference on or %NULL
+ * if no reference was taken.
+ */
+static inline struct blkcg_gq *blkg_tryget_closest(struct blkcg_gq *blkg)
+{
+	struct blkcg_gq *ret_blkg = NULL;
+
+	WARN_ON_ONCE(!rcu_read_lock_held());
+
+	while (blkg) {
+		if (blkg_tryget(blkg)) {
+			ret_blkg = blkg;
+			break;
+		}
+		blkg = blkg->parent;
+	}
+
+	return ret_blkg;
+}
+
+/**
+ * bio_associate_blkg_from_css - associate a bio with a specified css
+ * @bio: target bio
+ * @css: target css
+ *
+ * Associate @bio with the blkg found by combining the css's blkg and the
+ * request_queue of the @bio.  An association failure is handled by walking up
+ * the blkg tree.  Therefore, the blkg associated can be anything between @blkg
+ * and q->root_blkg.  This situation only happens when a cgroup is dying and
+ * then the remaining bios will spill to the closest alive blkg.
+ *
+ * A reference will be taken on the blkg and will be released when @bio is
+ * freed.
+ */
+void bio_associate_blkg_from_css(struct bio *bio,
+				 struct cgroup_subsys_state *css)
+{
+	struct request_queue *q = bio->bi_disk->queue;
+	struct blkcg_gq *blkg = q->root_blkg;
+
+	if (bio->bi_blkg)
+		blkg_put(bio->bi_blkg);
+
+	rcu_read_lock();
+	if (css && css->parent)
+		blkg = blkg_lookup_create(css_to_blkcg(css), q);
+	bio->bi_blkg = blkg_tryget_closest(blkg);
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(bio_associate_blkg_from_css);
+
+/**
+ * bio_associate_blkg - associate a bio with a blkg
+ * @bio: target bio
+ *
+ * Associate @bio with the blkg found from the bio's css and request_queue.
+ * If one is not found, bio_lookup_blkg() creates the blkg.  If a blkg is
+ * already associated, the css is reused and association redone as the
+ * request_queue may have changed.
+ */
+void bio_associate_blkg(struct bio *bio)
+{
+	struct cgroup_subsys_state *css;
+
+	rcu_read_lock();
+
+	if (bio->bi_blkg)
+		css = &bio_blkcg(bio)->css;
+	else
+		css = blkcg_css();
+
+	bio_associate_blkg_from_css(bio, css);
+
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(bio_associate_blkg);
+
+/**
+ * bio_clone_blkg_association - clone blkg association from src to dst bio
+ * @dst: destination bio
+ * @src: source bio
+ */
+void bio_clone_blkg_association(struct bio *dst, struct bio *src)
+{
+	if (src->bi_blkg) {
+		if (dst->bi_blkg)
+			blkg_put(dst->bi_blkg);
+		blkg_get(src->bi_blkg);
+		dst->bi_blkg = src->bi_blkg;
+	}
+}
+EXPORT_SYMBOL_GPL(bio_clone_blkg_association);
+
 static int __init blkcg_init(void)
 {
 	blkcg_punt_bio_wq = alloc_workqueue("blkcg_punt_bio",
diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index a57ebe2f00abd8..60df97202314c7 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -183,10 +183,6 @@ extern bool blkcg_debug_stats;
 
 struct blkcg_gq *blkg_lookup_slowpath(struct blkcg *blkcg,
 				      struct request_queue *q, bool update_hint);
-struct blkcg_gq *__blkg_lookup_create(struct blkcg *blkcg,
-				      struct request_queue *q);
-struct blkcg_gq *blkg_lookup_create(struct blkcg *blkcg,
-				    struct request_queue *q);
 int blkcg_init_queue(struct request_queue *q);
 void blkcg_exit_queue(struct request_queue *q);
 
@@ -480,32 +476,6 @@ static inline bool blkg_tryget(struct blkcg_gq *blkg)
 	return blkg && percpu_ref_tryget(&blkg->refcnt);
 }
 
-/**
- * blkg_tryget_closest - try and get a blkg ref on the closet blkg
- * @blkg: blkg to get
- *
- * This needs to be called rcu protected.  As the failure mode here is to walk
- * up the blkg tree, this ensure that the blkg->parent pointers are always
- * valid.  This returns the blkg that it ended up taking a reference on or %NULL
- * if no reference was taken.
- */
-static inline struct blkcg_gq *blkg_tryget_closest(struct blkcg_gq *blkg)
-{
-	struct blkcg_gq *ret_blkg = NULL;
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
-
-	while (blkg) {
-		if (blkg_tryget(blkg)) {
-			ret_blkg = blkg;
-			break;
-		}
-		blkg = blkg->parent;
-	}
-
-	return ret_blkg;
-}
-
 /**
  * blkg_put - put a blkg reference
  * @blkg: blkg to put
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

