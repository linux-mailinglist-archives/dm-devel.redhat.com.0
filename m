Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D56C20BFC0
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ci2ubWOrrwQjl2Y6JN+OnJDZcpUzLcgYHjDudwIAB5Y=;
	b=P6LPeXO0BGzD6BLgbOT9RR/OzkQrevec8jdlUacDLDzpWaYFGolzejSrptvXZbFYgiuhNZ
	3V0G19dZL43gL38sVhmWL5S5rUqMIxEIsVs1DaMUpTKR8N4RFCzsWxIeghETTFrIkuBuzU
	ZtHZNvYEOs2Yugtj3lrEflzTK7UjSuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-7iS435P-NA6wNP9HTTuGbQ-1; Sat, 27 Jun 2020 03:37:35 -0400
X-MC-Unique: 7iS435P-NA6wNP9HTTuGbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57A167BAD;
	Sat, 27 Jun 2020 07:37:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D25D87F4EA;
	Sat, 27 Jun 2020 07:37:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F36E410480D;
	Sat, 27 Jun 2020 07:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bIOr004371 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FD16109FC84; Sat, 27 Jun 2020 07:37:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA9B109FC83
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70CE7800052
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:18 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-338-AHhb9hv3PSmCiT4LsuYrrA-1; Sat, 27 Jun 2020 03:37:07 -0400
X-MC-Unique: AHhb9hv3PSmCiT4LsuYrrA-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jo-0006m0-Ro; Sat, 27 Jun 2020 07:32:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:47 +0200
Message-Id: <20200627073159.2447325-3-hch@lst.de>
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
Subject: [dm-devel] [PATCH 02/14] block: remove bio_disassociate_blkg
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bio_disassociate_blkg has two callers, of which one immediately assigns
a new value to >bi_blkg.  Just open code the function in the two callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c         | 27 ++++++++-------------------
 include/linux/bio.h |  2 --
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index fb5533416fa670..8aef4460b32e0e 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -234,8 +234,12 @@ struct bio_vec *bvec_alloc(gfp_t gfp_mask, int nr, unsigned long *idx,
 
 void bio_uninit(struct bio *bio)
 {
-	bio_disassociate_blkg(bio);
-
+#ifdef CONFIG_BLK_CGROUP
+	if (bio->bi_blkg) {
+		blkg_put(bio->bi_blkg);
+		bio->bi_blkg = NULL;
+	}
+#endif
 	if (bio_integrity(bio))
 		bio_integrity_free(bio);
 
@@ -1625,21 +1629,6 @@ EXPORT_SYMBOL(bioset_init_from_src);
 
 #ifdef CONFIG_BLK_CGROUP
 
-/**
- * bio_disassociate_blkg - puts back the blkg reference if associated
- * @bio: target bio
- *
- * Helper to disassociate the blkg from @bio if a blkg is associated.
- */
-void bio_disassociate_blkg(struct bio *bio)
-{
-	if (bio->bi_blkg) {
-		blkg_put(bio->bi_blkg);
-		bio->bi_blkg = NULL;
-	}
-}
-EXPORT_SYMBOL_GPL(bio_disassociate_blkg);
-
 /**
  * __bio_associate_blkg - associate a bio with the a blkg
  * @bio: target bio
@@ -1656,8 +1645,8 @@ EXPORT_SYMBOL_GPL(bio_disassociate_blkg);
  */
 static void __bio_associate_blkg(struct bio *bio, struct blkcg_gq *blkg)
 {
-	bio_disassociate_blkg(bio);
-
+	if (bio->bi_blkg)
+		blkg_put(bio->bi_blkg);
 	bio->bi_blkg = blkg_tryget_closest(blkg);
 }
 
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 0282f8aa85935c..4cd229e175c058 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -497,13 +497,11 @@ static inline void bio_associate_blkg_from_page(struct bio *bio,
 #endif
 
 #ifdef CONFIG_BLK_CGROUP
-void bio_disassociate_blkg(struct bio *bio);
 void bio_associate_blkg(struct bio *bio);
 void bio_associate_blkg_from_css(struct bio *bio,
 				 struct cgroup_subsys_state *css);
 void bio_clone_blkg_association(struct bio *dst, struct bio *src);
 #else	/* CONFIG_BLK_CGROUP */
-static inline void bio_disassociate_blkg(struct bio *bio) { }
 static inline void bio_associate_blkg(struct bio *bio) { }
 static inline void bio_associate_blkg_from_css(struct bio *bio,
 					       struct cgroup_subsys_state *css)
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

