Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 963752CDB5B
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 17:36:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-cxzJKa9PPFGlMqOkgJ_znw-1; Thu, 03 Dec 2020 11:36:12 -0500
X-MC-Unique: cxzJKa9PPFGlMqOkgJ_znw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EFFE800D62;
	Thu,  3 Dec 2020 16:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ED3F5C1BD;
	Thu,  3 Dec 2020 16:36:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A23E918095C7;
	Thu,  3 Dec 2020 16:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3GVtRW031485 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 11:31:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F11E9EAFB6; Thu,  3 Dec 2020 16:31:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E98CAEAFBB
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 16:31:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D55A4803DDB
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 16:31:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-560-YbMniouSOKy7n2-1kIou4w-1; Thu, 03 Dec 2020 11:31:53 -0500
X-MC-Unique: YbMniouSOKy7n2-1kIou4w-1
Received: from 213-225-0-143.nat.highway.a1.net ([213.225.0.143]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkrMU-0005bR-Mw; Thu, 03 Dec 2020 16:21:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Dec 2020 17:21:35 +0100
Message-Id: <20201203162139.2110977-2-hch@lst.de>
In-Reply-To: <20201203162139.2110977-1-hch@lst.de>
References: <20201203162139.2110977-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 1/5] block: remove the unused block_sleeprq
	tracepoint
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The block_sleeprq tracepoint was only used by the legacy request code.
Remove it now that the legacy request code is gone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/trace/events/block.h | 18 ------------------
 kernel/trace/blktrace.c      | 22 ----------------------
 2 files changed, 40 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index 34d64ca306b1c7..76459cf750e14d 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -441,24 +441,6 @@ DEFINE_EVENT(block_get_rq, block_getrq,
 	TP_ARGS(q, bio, rw)
 );
 
-/**
- * block_sleeprq - waiting to get a free request entry in queue for block IO operation
- * @q: queue for operation
- * @bio: pending block IO operation (can be %NULL)
- * @rw: low bit indicates a read (%0) or a write (%1)
- *
- * In the case where a request struct cannot be provided for queue @q
- * the process needs to wait for an request struct to become
- * available.  This tracepoint event is generated each time the
- * process goes to sleep waiting for request struct become available.
- */
-DEFINE_EVENT(block_get_rq, block_sleeprq,
-
-	TP_PROTO(struct request_queue *q, struct bio *bio, int rw),
-
-	TP_ARGS(q, bio, rw)
-);
-
 /**
  * block_plug - keep operations requests in request queue
  * @q: request queue to plug
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index a482a37848bff7..ced589df304b57 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -959,25 +959,6 @@ static void blk_add_trace_getrq(void *ignore,
 	}
 }
 
-
-static void blk_add_trace_sleeprq(void *ignore,
-				  struct request_queue *q,
-				  struct bio *bio, int rw)
-{
-	if (bio)
-		blk_add_trace_bio(q, bio, BLK_TA_SLEEPRQ, 0);
-	else {
-		struct blk_trace *bt;
-
-		rcu_read_lock();
-		bt = rcu_dereference(q->blk_trace);
-		if (bt)
-			__blk_add_trace(bt, 0, 0, rw, 0, BLK_TA_SLEEPRQ,
-					0, 0, NULL, 0);
-		rcu_read_unlock();
-	}
-}
-
 static void blk_add_trace_plug(void *ignore, struct request_queue *q)
 {
 	struct blk_trace *bt;
@@ -1164,8 +1145,6 @@ static void blk_register_tracepoints(void)
 	WARN_ON(ret);
 	ret = register_trace_block_getrq(blk_add_trace_getrq, NULL);
 	WARN_ON(ret);
-	ret = register_trace_block_sleeprq(blk_add_trace_sleeprq, NULL);
-	WARN_ON(ret);
 	ret = register_trace_block_plug(blk_add_trace_plug, NULL);
 	WARN_ON(ret);
 	ret = register_trace_block_unplug(blk_add_trace_unplug, NULL);
@@ -1185,7 +1164,6 @@ static void blk_unregister_tracepoints(void)
 	unregister_trace_block_split(blk_add_trace_split, NULL);
 	unregister_trace_block_unplug(blk_add_trace_unplug, NULL);
 	unregister_trace_block_plug(blk_add_trace_plug, NULL);
-	unregister_trace_block_sleeprq(blk_add_trace_sleeprq, NULL);
 	unregister_trace_block_getrq(blk_add_trace_getrq, NULL);
 	unregister_trace_block_bio_queue(blk_add_trace_bio_queue, NULL);
 	unregister_trace_block_bio_frontmerge(blk_add_trace_bio_frontmerge, NULL);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

