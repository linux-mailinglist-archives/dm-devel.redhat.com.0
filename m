Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853FA9EE9
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:53:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E1F7C03D470;
	Thu,  5 Sep 2019 09:53:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAA8C5D712;
	Thu,  5 Sep 2019 09:53:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 835552551C;
	Thu,  5 Sep 2019 09:53:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859rBR7026801 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:53:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E6FCE5DA21; Thu,  5 Sep 2019 09:53:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BB85D9E2;
	Thu,  5 Sep 2019 09:53:02 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B5D31DA8;
	Thu,  5 Sep 2019 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677175; x=1599213175;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=4es099Tzn+1lybmV19FyhcM0o6YKAGlTweyIXLI8G2M=;
	b=jyvWmhoqA1tDRWgwp6yamSeW31Yawiw+nVPIdpGjwV97C/Twh6N8vp6L
	PiO7ZHJW4fPO71D3kqYx7wV8IiN1KL8uONccxW8V7fgz2S1lJoAgmyB0i
	g62i8vTMJmv1aAr0zuL+BSovIdVJpTYbcI4sol86oWKM8+6cUyJXvNeGL
	cGhReazCLYPfW5XCkGyWI7Yn2ROkG6npD8mIY7kqqoRJqCkyy3iNVz0sV
	PIixYdsvsEWCkzAnRtklEpUPu8CYYziDEiAi5mHowVaZARB4J+k7tahJ0
	QogNEf3VKHbYE+Dcttrnx17aC8kb+Ay2pzmWDqJ6yp/9X6P5PiUPn+CiQ Q==;
IronPort-SDR: 7m8HkkhRC4v9+TEK8AZJEcYSSZZ4kOyarggW7vgVnBL0yafhrTdA9PvykbHisgAmJUkSs/JtEO
	qcG7NaI5Oh0ggjvnkK1DlTOF6XbDcUaiwyVnPxEqc3C15g1T8iFXP89A5nqdvuczxs0mmgLEgn
	mGaokIgwEbR3K9UNmF/gF3ZK/AZ48OaL6k/wYvluGKNUyyx9NKNYyHiETHl22ZHLMwSCJ4mxLk
	aRzsAUBXy8CwwVytB3yGbTYJi1m+elYezla5PO52lgqCblwY7WVGqi4dOc/vDv2sh6GkiW8qt+
	Ehg=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106255"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:40 +0800
IronPort-SDR: lezBFArQ5rIUeNvHLexoKEhOBeH3cYJUCczdoXvzcyApq4UJAgK8Z1Lccclcm91uvxx/nvFvYe
	gTO0GcbVtyeDOQ7y2YAB3sJVILELDw4RmcdNBG+zY8ZJPvcz58r6+7MImO3bxHV6yDls2ry5IE
	YyiFhYrZ98dClqWem2z51GEZUvULXBJYFu3s+40IDgh8lvCQFeOOk9lKXD5wWWsjHUdFoaDeIU
	wL9IJdgCcY6Nw8uiG6ohK7pFrkayrNSUudU8rbkbmck6oh1C1hR3yE1kdEZjP4SpjrM2DD5B73
	7r+xsns6VjU4SxN8ImWiHgtX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:37 -0700
IronPort-SDR: zZEakMvskMlFNIDvSV9wxiBRD4mLO9VxhlarUpSqpeHQc9cpzF2ItrDi6grb6pXxAIrLz/PrNY
	5p7ZXCUwzzVNAVxwN84zKR6rqp/zYsNwjf6HN/LBJ49MZMNz08COVy3+JvOIZEJ8dZfT/Syw7r
	1NPIdlgd3F1/uQvRYUPXMKrK1KjY9vjx9MvChzyj0wr+iQmVU2eZUwuny/og6DaOVr3ZOxl92l
	T24+RRZEAoLIvHPf+vWIY41WW2e6gd9onB59X/s7rOwvWy/KJnE7XzOfZRSWQtdfs7qe4n1C7J
	50U=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:39 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:30 +0900
Message-Id: <20190905095135.26026-3-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Thu, 05 Sep 2019 09:52:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 05 Sep 2019 09:52:54 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 2/7] block: Change elevator_init_mq() to
	always succeed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 05 Sep 2019 09:53:16 +0000 (UTC)

If the default elevator chosen is mq-deadline, elevator_init_mq() may
return an error if mq-deadline initialization fails, leading to
blk_mq_init_allocated_queue() returning an error, which in turn will
cause the block device initialization to fail and the device not being
exposed.

Instead of taking such extreme measure, handle mq-deadline
initialization failures in the same manner as when mq-deadline is not
available (no module to load), that is, default to the "none" scheduler.
With this change, elevator_init_mq() return type can be changed to void.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c   |  8 +-------
 block/blk.h      |  2 +-
 block/elevator.c | 23 ++++++++++++-----------
 3 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 13923630e00a..ee4caf0c0807 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2842,8 +2842,6 @@ static unsigned int nr_hw_queues(struct blk_mq_tag_set *set)
 struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 						  struct request_queue *q)
 {
-	int ret = -ENOMEM;
-
 	/* mark the queue as mq asap */
 	q->mq_ops = set->ops;
 
@@ -2904,14 +2902,10 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
 
-	ret = elevator_init_mq(q);
-	if (ret)
-		goto err_tag_set;
+	elevator_init_mq(q);
 
 	return q;
 
-err_tag_set:
-	blk_mq_del_queue_tag_set(q);
 err_hctxs:
 	kfree(q->queue_hw_ctx);
 	q->nr_hw_queues = 0;
diff --git a/block/blk.h b/block/blk.h
index e4619fc5c99a..ed347f7a97b1 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -184,7 +184,7 @@ void blk_account_io_done(struct request *req, u64 now);
 
 void blk_insert_flush(struct request *rq);
 
-int elevator_init_mq(struct request_queue *q);
+void elevator_init_mq(struct request_queue *q);
 int elevator_switch_mq(struct request_queue *q,
 			      struct elevator_type *new_e);
 void __elevator_exit(struct request_queue *, struct elevator_queue *);
diff --git a/block/elevator.c b/block/elevator.c
index 4721834815bb..2944c129760c 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -628,34 +628,35 @@ static inline bool elv_support_iosched(struct request_queue *q)
 
 /*
  * For blk-mq devices supporting IO scheduling, we default to using mq-deadline,
- * if available, for single queue devices. If deadline isn't available OR we
- * have multiple queues, default to "none".
+ * if available, for single queue devices. If deadline isn't available OR
+ * deadline initialization fails OR we have multiple queues, default to "none".
  */
-int elevator_init_mq(struct request_queue *q)
+void elevator_init_mq(struct request_queue *q)
 {
 	struct elevator_type *e;
-	int err = 0;
+	int err;
 
 	if (!elv_support_iosched(q))
-		return 0;
+		return;
 
 	if (q->nr_hw_queues != 1)
-		return 0;
+		return;
 
 	WARN_ON_ONCE(test_bit(QUEUE_FLAG_REGISTERED, &q->queue_flags));
 
 	if (unlikely(q->elevator))
-		goto out;
+		return;
 
 	e = elevator_get(q, "mq-deadline", false);
 	if (!e)
-		goto out;
+		return;
 
 	err = blk_mq_init_sched(q, e);
-	if (err)
+	if (err) {
+		pr_warn("\"%s\" elevator initialization failed, "
+			"falling back to \"none\"\n", e->elevator_name);
 		elevator_put(e);
-out:
-	return err;
+	}
 }
 
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
