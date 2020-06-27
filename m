Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4C20BFC3
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qSygOuKRHfq7OQQuD+8g9/2mlr2PjFRYWE7/Foce54I=;
	b=FpYHEfA8gD1QTUhV0FqINSOpzBcSzjgBMvKz7idT8GYFh3NgBnPR5b5ahdEnICFvKTKoC+
	6XdescheKUDM905VsVH1AMOgdJbYu67Fic/ZL+Zbdzd+ZUJotZDhuNwVngwJXh87vQlrXT
	hk/7PxZOBzFpIEjmVKN4dkzmfutqViE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-vWUQ_wyYOgak13FWG00ZxA-1; Sat, 27 Jun 2020 03:37:46 -0400
X-MC-Unique: vWUQ_wyYOgak13FWG00ZxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 041D718585C5;
	Sat, 27 Jun 2020 07:37:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA87B7F4EA;
	Sat, 27 Jun 2020 07:37:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 978C4180954D;
	Sat, 27 Jun 2020 07:37:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bJWu004375 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 592A3109FC82; Sat, 27 Jun 2020 07:37:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 553FB109FC88
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33323185AD01
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-HV0bCVnGPHiuDj96F3c7uw-1; Sat, 27 Jun 2020 03:37:17 -0400
X-MC-Unique: HV0bCVnGPHiuDj96F3c7uw-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jw-0006me-CB; Sat, 27 Jun 2020 07:32:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:50 +0200
Message-Id: <20200627073159.2447325-6-hch@lst.de>
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
Subject: [dm-devel] [PATCH 05/14] block: move bio_associate_blkg_from_page
	to mm/page_io.c
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

bio_associate_blkg_from_page is a special purpose helper for swap bios
that doesn't need access to bio internals.  Move it to the swap code
instead of having it in bio.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c         | 26 --------------------------
 include/linux/bio.h |  7 -------
 mm/page_io.c        | 17 +++++++++++++++++
 3 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index bc8de2432e3645..901d22715dd4f3 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1659,32 +1659,6 @@ void bio_associate_blkg_from_css(struct bio *bio,
 }
 EXPORT_SYMBOL_GPL(bio_associate_blkg_from_css);
 
-#ifdef CONFIG_MEMCG
-/**
- * bio_associate_blkg_from_page - associate a bio with the page's blkg
- * @bio: target bio
- * @page: the page to lookup the blkcg from
- *
- * Associate @bio with the blkg from @page's owning memcg and the respective
- * request_queue.  If cgroup_e_css returns %NULL, fall back to the queue's
- * root_blkg.
- */
-void bio_associate_blkg_from_page(struct bio *bio, struct page *page)
-{
-	struct cgroup_subsys_state *css;
-
-	if (!page->mem_cgroup)
-		return;
-
-	rcu_read_lock();
-
-	css = cgroup_e_css(page->mem_cgroup->css.cgroup, &io_cgrp_subsys);
-	bio_associate_blkg_from_css(bio, css);
-
-	rcu_read_unlock();
-}
-#endif /* CONFIG_MEMCG */
-
 /**
  * bio_associate_blkg - associate a bio with a blkg
  * @bio: target bio
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 4cd229e175c058..c6d76538292644 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -489,13 +489,6 @@ do {						\
 #define bio_dev(bio) \
 	disk_devt((bio)->bi_disk)
 
-#if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
-void bio_associate_blkg_from_page(struct bio *bio, struct page *page);
-#else
-static inline void bio_associate_blkg_from_page(struct bio *bio,
-						struct page *page) { }
-#endif
-
 #ifdef CONFIG_BLK_CGROUP
 void bio_associate_blkg(struct bio *bio);
 void bio_associate_blkg_from_css(struct bio *bio,
diff --git a/mm/page_io.c b/mm/page_io.c
index e8726f3e3820bf..ccda7679008851 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -277,6 +277,23 @@ static inline void count_swpout_vm_event(struct page *page)
 	count_vm_events(PSWPOUT, hpage_nr_pages(page));
 }
 
+#if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
+static void bio_associate_blkg_from_page(struct bio *bio, struct page *page)
+{
+	struct cgroup_subsys_state *css;
+
+	if (!page->mem_cgroup)
+		return;
+
+	rcu_read_lock();
+	css = cgroup_e_css(page->mem_cgroup->css.cgroup, &io_cgrp_subsys);
+	bio_associate_blkg_from_css(bio, css);
+	rcu_read_unlock();
+}
+#else
+#define bio_associate_blkg_from_page(bio, page)		do { } while (0)
+#endif /* CONFIG_MEMCG && CONFIG_BLK_CGROUP */
+
 int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		bio_end_io_t end_write_func)
 {
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

