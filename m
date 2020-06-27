Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA5B20BFC5
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t0F4rU7vfJfvvbdX9kMr6MwWj1tXVwQftTmhlaIxqTc=;
	b=YuNmKxRIMvBn5fo/B7Sf45q2m2uLexHpVOkyzPwA3C5+87gzbJddyN7pPeYDVGlancgRFu
	o/3MPWha71raydFc4MBiH0uVCA5iV9Axy0o6Um6ADAK1HZcJkDTulGhXbXwjIdNW4+OfQL
	eh+nIKYGwNx7jBD8N4dF2hafDrnY0+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-e1Lf8C2DMFKcrIsvz50bKg-1; Sat, 27 Jun 2020 03:37:51 -0400
X-MC-Unique: e1Lf8C2DMFKcrIsvz50bKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A2C804004;
	Sat, 27 Jun 2020 07:37:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 209D660E1C;
	Sat, 27 Jun 2020 07:37:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D73DB104903;
	Sat, 27 Jun 2020 07:37:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bZpN004432 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70CF9207AC6D; Sat, 27 Jun 2020 07:37:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C9C020316DD
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B65D800052
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:33 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-56x0hA8NMdmIxqEhz3oDcQ-1; Sat, 27 Jun 2020 03:37:31 -0400
X-MC-Unique: 56x0hA8NMdmIxqEhz3oDcQ-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5KD-0006nj-M4; Sat, 27 Jun 2020 07:32:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:55 +0200
Message-Id: <20200627073159.2447325-11-hch@lst.de>
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] [PATCH 10/14] blk-cgroup: remove the !bio->bi_blkg check
	in blkcg_bio_issue_check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is purely a sanity check for grave programming errors.  Remove it
to simplify further work in this area.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/blk-cgroup.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index 60df97202314c7..8e86b598316c10 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -543,24 +543,11 @@ static inline void blkcg_bio_issue_init(struct bio *bio)
 static inline bool blkcg_bio_issue_check(struct request_queue *q,
 					 struct bio *bio)
 {
-	struct blkcg_gq *blkg;
+	struct blkcg_gq *blkg = bio->bi_blkg;
 	bool throtl = false;
 
 	rcu_read_lock();
-
-	if (!bio->bi_blkg) {
-		char b[BDEVNAME_SIZE];
-
-		WARN_ONCE(1,
-			  "no blkg associated for bio on block-device: %s\n",
-			  bio_devname(bio, b));
-		bio_associate_blkg(bio);
-	}
-
-	blkg = bio->bi_blkg;
-
 	throtl = blk_throtl_bio(q, blkg, bio);
-
 	if (!throtl) {
 		struct blkg_iostat_set *bis;
 		int rwd, cpu;
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

