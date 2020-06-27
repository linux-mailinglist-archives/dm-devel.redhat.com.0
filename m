Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F2A7320BFBF
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+We9xrvhj3IyELsqg1qgc+lah91NWHfYnKP4i/oXm9I=;
	b=FZOQEf/gCMo6mBCpEVOHV87+zrPOAi2nnG0zseYrlvK6XzxX7p25aAM0ZOJmPzMDlpL8ys
	QHJEvNlus4NUwWMqPfN/dScFnkH3wyGx4Y8+pLBCLzS/QS+f/J2JCLrWdlNLSzJ1RfUZe0
	iWadtjKGiz7Iahd8dwbZqGgH7CmafUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-hmdpu2oNOLS1wcvObUNgVw-1; Sat, 27 Jun 2020 03:37:35 -0400
X-MC-Unique: hmdpu2oNOLS1wcvObUNgVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594F018585B2;
	Sat, 27 Jun 2020 07:37:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3BE360BF4;
	Sat, 27 Jun 2020 07:37:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65FC1875A7;
	Sat, 27 Jun 2020 07:37:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7b6nq004337 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE2C52156A4A; Sat, 27 Jun 2020 07:37:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA2122156A3A
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E17805C1E
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:03 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-457-QPaUPJS9M1yudSVlhG0naQ-1; Sat, 27 Jun 2020 03:37:01 -0400
X-MC-Unique: QPaUPJS9M1yudSVlhG0naQ-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5K8-0006nQ-7F; Sat, 27 Jun 2020 07:32:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:53 +0200
Message-Id: <20200627073159.2447325-9-hch@lst.de>
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] [PATCH 08/14] block: bypass blkg_tryget_closest for the
	root_blkg
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

The root_blkg is only torn down at the very end of removing a queue.
So in the I/O submission path is always has a life reference and we
can just grab another one using blkg_get instead of doing a tryget
and parent walk that won't lead anywhere.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 6aedb73ffbf473..0912820d4f8194 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1758,16 +1758,21 @@ void bio_associate_blkg_from_css(struct bio *bio,
 				 struct cgroup_subsys_state *css)
 {
 	struct request_queue *q = bio->bi_disk->queue;
-	struct blkcg_gq *blkg = q->root_blkg;
 
 	if (bio->bi_blkg)
 		blkg_put(bio->bi_blkg);
 
-	rcu_read_lock();
-	if (css && css->parent)
+	if (css && css->parent) {
+		struct blkcg_gq *blkg;
+
+		rcu_read_lock();
 		blkg = blkg_lookup_create(css_to_blkcg(css), q);
-	bio->bi_blkg = blkg_tryget_closest(blkg);
-	rcu_read_unlock();
+		bio->bi_blkg = blkg_tryget_closest(blkg);
+		rcu_read_unlock();
+	} else {
+		blkg_get(q->root_blkg);
+		bio->bi_blkg = q->root_blkg;
+	}
 }
 EXPORT_SYMBOL_GPL(bio_associate_blkg_from_css);
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

