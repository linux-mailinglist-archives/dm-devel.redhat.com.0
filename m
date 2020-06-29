Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8ED20F783
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-roaPAlOHPZKkuNfrnxEfSw-1; Tue, 30 Jun 2020 10:49:04 -0400
X-MC-Unique: roaPAlOHPZKkuNfrnxEfSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEBC0107ACF2;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45B599CFE1;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 385E86C9C4;
	Tue, 30 Jun 2020 14:48:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNiTOt020400 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:44:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 848E32029F81; Mon, 29 Jun 2020 23:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8068B2029F79
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A4CF800883
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:27 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-220-RrvTTI1tNsi3FkPzgyaa-A-1; Mon, 29 Jun 2020 19:44:24 -0400
X-MC-Unique: RrvTTI1tNsi3FkPzgyaa-A-1
IronPort-SDR: R4vBs+S9TcZPGvJOwx22WZZKzLFfzpSTixO1XiSYEKnn5FjlbmHUjHss/NJBmEWMEW/bmNgxnN
	p3R4+J5iqMb4fcowCCnXqIR2jUlv/Q+ZYIdRMS5gVrSP11raSiaK78ZYnNqYmuAFHEiOwWpMeO
	6E9wrM2Ae91SEfsZSnzLd7zGUibPcJzggwNy2AqMhxAw9wrGSVYn146xOM9qXXGs8J1NXzbvNg
	khgRB5bbFVLfAbAWGmaRQuYttekDRx+LV32/PmnuaNOpEFl2rkFzaCqhl1XwV+l+GMylkRwMjj
	zsQ=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="141431445"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:44:23 +0800
IronPort-SDR: mQpHWNJ5UMt0+yY7XLkciv4GQKjLD4kjSCTk2BnzSMt0+sZDAcf/ntPeLLVaQP8+r4uhatq/gz
	q7loFpIxBBlqGO8TQ69iZrmBT7jc2AgWg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:32:43 -0700
IronPort-SDR: TMjCv1P8V1EeKz6bnWpEiZmnvuYzuTYBmaPtIh375x1fm74/Pz/7R5PydgzYumXw90ZHscENtH
	UmSWjd8gVN2A==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:44:22 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:10 -0700
Message-Id: <20200629234314.10509-8-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 07/11] block: get rid of
	blk_trace_request_get_cgid()
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

Now that we have done cleanup we can safely get rid of the
blk_trace_request_get_cgid() and replace it with
blk_trace_bio_get_cgid().

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 kernel/trace/blktrace.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 1d36e6153ab8..bb864a50307f 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -804,15 +804,6 @@ u64 blk_trace_bio_get_cgid(struct request_queue *q, struct bio *bio)
 }
 #endif
 
-static u64
-blk_trace_request_get_cgid(struct request_queue *q, struct request *rq)
-{
-	if (!rq->bio)
-		return 0;
-	/* Use the first bio */
-	return blk_trace_bio_get_cgid(q, rq->bio);
-}
-
 /*
  * blktrace probes
  */
@@ -854,32 +845,32 @@ static void blk_add_trace_rq(struct request *rq, int error,
 static void blk_add_trace_rq_insert(void *ignore, struct request *rq)
 {
 	blk_add_trace_rq(rq, 0, blk_rq_bytes(rq), BLK_TA_INSERT,
-			 blk_trace_request_get_cgid(rq->q, rq));
+			 rq->bio ? blk_trace_bio_get_cgid(rq->q, rq->bio) : 0);
 }
 
 static void blk_add_trace_rq_issue(void *ignore, struct request *rq)
 {
 	blk_add_trace_rq(rq, 0, blk_rq_bytes(rq), BLK_TA_ISSUE,
-			 blk_trace_request_get_cgid(rq->q, rq));
+			 rq->bio ? blk_trace_bio_get_cgid(rq->q, rq->bio) : 0);
 }
 
 static void blk_add_trace_rq_merge(void *ignore, struct request *rq)
 {
 	blk_add_trace_rq(rq, 0, blk_rq_bytes(rq), BLK_TA_BACKMERGE,
-			 blk_trace_request_get_cgid(rq->q, rq));
+			 rq->bio ? blk_trace_bio_get_cgid(rq->q, rq->bio) : 0);
 }
 
 static void blk_add_trace_rq_requeue(void *ignore, struct request *rq)
 {
 	blk_add_trace_rq(rq, 0, blk_rq_bytes(rq), BLK_TA_REQUEUE,
-			 blk_trace_request_get_cgid(rq->q, rq));
+			 rq->bio ? blk_trace_bio_get_cgid(rq->q, rq->bio) : 0);
 }
 
 static void blk_add_trace_rq_complete(void *ignore, struct request *rq,
 			int error, unsigned int nr_bytes)
 {
 	blk_add_trace_rq(rq, error, nr_bytes, BLK_TA_COMPLETE,
-			 blk_trace_request_get_cgid(rq->q, rq));
+			 rq->bio ? blk_trace_bio_get_cgid(rq->q, rq->bio) : 0);
 }
 
 /**
@@ -1105,7 +1096,8 @@ static void blk_add_trace_rq_remap(void *ignore,
 
 	__blk_add_trace(bt, blk_rq_pos(rq), blk_rq_bytes(rq),
 			rq_data_dir(rq), 0, BLK_TA_REMAP, 0,
-			sizeof(r), &r, blk_trace_request_get_cgid(q, rq));
+			sizeof(r), &r,
+			rq->bio ? blk_trace_bio_get_cgid(q, rq->bio) : 0);
 	rcu_read_unlock();
 }
 
@@ -1134,8 +1126,8 @@ void blk_add_driver_data(struct request_queue *q,
 	}
 
 	__blk_add_trace(bt, blk_rq_trace_sector(rq), blk_rq_bytes(rq), 0, 0,
-				BLK_TA_DRV_DATA, 0, len, data,
-				blk_trace_request_get_cgid(q, rq));
+			BLK_TA_DRV_DATA, 0, len, data,
+			rq->bio ? blk_trace_bio_get_cgid(q, rq->bio) : 0);
 	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(blk_add_driver_data);
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

