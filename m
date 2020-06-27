Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E633F20BFC8
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243474;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kXzgkyQg6FXvzPyZRK+Cb5FH/2fB4CVRpd+VyUzWEso=;
	b=fbAIYGAJbI39nMnRFCBS1EKgHAT8TipO96HQogr7vSRy4p5hIelgAbmvO+zjeYDd6JPseO
	NnyJ3c/bEQHb9FDZoIl6jF3sYFPSoiPmNVUgTPnHs5WL2VwoOphAMz/0odQm1a/oD+eXtQ
	Hwe7hzZscc53vMEkqXCFBofoWOjlisc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-U0MtUqEnONCx-2jOWtL1oA-1; Sat, 27 Jun 2020 03:37:51 -0400
X-MC-Unique: U0MtUqEnONCx-2jOWtL1oA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37F2E8018AB;
	Sat, 27 Jun 2020 07:37:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A83581001B0B;
	Sat, 27 Jun 2020 07:37:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B2DA875BC;
	Sat, 27 Jun 2020 07:37:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bdmf004455 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 911EB109FC83; Sat, 27 Jun 2020 07:37:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D308109FC82
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA45E8007AC
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-mqLdbrsPN4OyD4-kSFR87g-1; Sat, 27 Jun 2020 03:37:34 -0400
X-MC-Unique: mqLdbrsPN4OyD4-kSFR87g-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5KO-0006oz-Bj; Sat, 27 Jun 2020 07:32:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:57 +0200
Message-Id: <20200627073159.2447325-13-hch@lst.de>
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
Subject: [dm-devel] [PATCH 12/14] blk-cgroup: move rcu locking from
	blkcg_bio_issue_check to blk_throtl_bio
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The only thing in blkcg_bio_issue_check that needs to be under
rcu_read_lock is blk_throtl_bio, so move the locking there.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-throttle.c       | 3 ++-
 include/linux/blk-cgroup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index 209fdd8939fba6..ac008345050010 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -2168,7 +2168,7 @@ bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
 	bool throttled = false;
 	struct throtl_data *td = tg->td;
 
-	WARN_ON_ONCE(!rcu_read_lock_held());
+	rcu_read_lock();
 
 	/* see throtl_charge_bio() */
 	if (bio_flagged(bio, BIO_THROTTLED))
@@ -2273,6 +2273,7 @@ bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
 	if (throttled || !td->track_bio_latency)
 		bio->bi_issue.value |= BIO_ISSUE_THROTL_SKIP_LATENCY;
 #endif
+	rcu_read_unlock();
 	return throttled;
 }
 
diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index 8e86b598316c10..8ab043c911f233 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -546,7 +546,6 @@ static inline bool blkcg_bio_issue_check(struct request_queue *q,
 	struct blkcg_gq *blkg = bio->bi_blkg;
 	bool throtl = false;
 
-	rcu_read_lock();
 	throtl = blk_throtl_bio(q, blkg, bio);
 	if (!throtl) {
 		struct blkg_iostat_set *bis;
@@ -582,7 +581,6 @@ static inline bool blkcg_bio_issue_check(struct request_queue *q,
 
 	blkcg_bio_issue_init(bio);
 
-	rcu_read_unlock();
 	return !throtl;
 }
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

