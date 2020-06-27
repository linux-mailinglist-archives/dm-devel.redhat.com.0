Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A843A20BFC9
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mRJ7W+LJajYswk5vNWatuTVwrWZb1KVw2IMIV0C4p1Y=;
	b=gC3gSbtXhKvvWp4na0JDOQYkOyeyjpEeo3FSmZ8gWY7O4tGylRL/rbT3qSJH+E7TRomf4u
	dkHcDIXgVzkRcGNezxQKkty/fWQt0ws6Y84ZbO8dhC+vvha7rwINmRmB8ekH5B3dCWA97O
	GfH769HClCKKW5kqO9U7pvtWwHfPm3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-ADjyvZ1pNHep7J9icH3LGQ-1; Sat, 27 Jun 2020 03:37:57 -0400
X-MC-Unique: ADjyvZ1pNHep7J9icH3LGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CC2804002;
	Sat, 27 Jun 2020 07:37:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 735DF5BAE3;
	Sat, 27 Jun 2020 07:37:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3038F1809563;
	Sat, 27 Jun 2020 07:37:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bmrg004480 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33950109FC82; Sat, 27 Jun 2020 07:37:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FBA1109FC86
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6F9185A78B
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:48 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-92-YJWmE4ESM4yEOnPsdHAOIA-1; Sat, 27 Jun 2020 03:37:39 -0400
X-MC-Unique: YJWmE4ESM4yEOnPsdHAOIA-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jr-0006mC-8O; Sat, 27 Jun 2020 07:32:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:48 +0200
Message-Id: <20200627073159.2447325-4-hch@lst.de>
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
Subject: [dm-devel] [PATCH 03/14] block: really clone the block cgroup in
	bio_clone_blkg_association
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

bio_clone_blkg_association is supposed to clone the associatation, but
actually ends up doing a search with a tryget.  As we know we have a
reference on the source cgroup just get an unconditional additional
reference to it and call it a day.  That also removes the need for
a RCU critical section.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 8aef4460b32e0e..e1d01acce8070c 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1737,12 +1737,12 @@ EXPORT_SYMBOL_GPL(bio_associate_blkg);
  */
 void bio_clone_blkg_association(struct bio *dst, struct bio *src)
 {
-	rcu_read_lock();
-
-	if (src->bi_blkg)
-		__bio_associate_blkg(dst, src->bi_blkg);
-
-	rcu_read_unlock();
+	if (src->bi_blkg) {
+		if (dst->bi_blkg)
+			blkg_put(dst->bi_blkg);
+		blkg_get(src->bi_blkg);
+		dst->bi_blkg = src->bi_blkg;
+	}
 }
 EXPORT_SYMBOL_GPL(bio_clone_blkg_association);
 #endif /* CONFIG_BLK_CGROUP */
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

