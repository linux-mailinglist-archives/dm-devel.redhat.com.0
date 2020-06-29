Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A57520F787
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-yrtGrgDdMHas1cZZwcx88g-1; Tue, 30 Jun 2020 10:49:10 -0400
X-MC-Unique: yrtGrgDdMHas1cZZwcx88g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994F58015F7;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE22289B5;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F7356C9C4;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNiMKV020383 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:44:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C97EA109FE5D; Mon, 29 Jun 2020 23:44:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C51D310E38DC
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E642858EE2
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:20 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-NTJ8RtLeMwK6Niz0yc5d7Q-1; Mon, 29 Jun 2020 19:44:16 -0400
X-MC-Unique: NTJ8RtLeMwK6Niz0yc5d7Q-1
IronPort-SDR: lIvAmBWDsKcj8kIqAxpO9BPDoVU7Zbk4nTgM6o2JxTviNhMZe4FW63Onyp471xsZQDsodOGy0S
	W92Tq6m6lCl426Ozdmak4fNDR4rSc6ONYO7l3T+54B2htTTYmyMbK0xLQUVFLZGluYNHD9ZaxY
	Hmy8d/WcHEET+8SlU54fW38lGzkSfKkZKEUxQpIkELWqGkjAts1LzXtSmF2v0LBNe8lZ8XMKcP
	3liSQEyUarbKOog+zrjx7IxMD2KeLyf8Grz4Plbd51R+cUEQ/cNXIVzMVcSWtUAg4GQf0qEWkh
	EtI=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="145544751"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:44:15 +0800
IronPort-SDR: zrWpW3J7jP7+lrpJ24vWGdfHFMXCkljI5c9cV4kWWalJrwQc9Mb3MnzwfA2NAQZZI0Dj6UxHuX
	+HH0iNYluACAt4DNBQttdE0MuJZeBBbT4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:33:07 -0700
IronPort-SDR: QFmmXIwnVwMqHDqonKjxZOGDQQVIf2sH9oQwNx0KXycFd6uadSP94t6PxOe0NRoAWO/UJAx0RJ
	8ovtlsScHh/Q==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:44:14 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:09 -0700
Message-Id: <20200629234314.10509-7-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 06/11] block: remove extra param for
	trace_block_getrq()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove the extra parameter for trace_block_getrq() since we can derive
I/O direction from bio->bi_opf.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-mq.c               |  2 +-
 include/trace/events/block.h | 14 ++++++--------
 kernel/trace/blktrace.c      | 13 ++++++-------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index dbb98b2bc868..d66bb299d4ae 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2111,7 +2111,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
 		goto queue_exit;
 	}
 
-	trace_block_getrq(bio, bio->bi_opf);
+	trace_block_getrq(bio);
 
 	rq_qos_track(q, rq, bio);
 
diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index d7289576f1fd..3d8923062fc4 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -347,9 +347,9 @@ DEFINE_EVENT(block_bio, block_bio_queue,
 
 DECLARE_EVENT_CLASS(block_get_rq,
 
-	TP_PROTO(struct bio *bio, int rw),
+	TP_PROTO(struct bio *bio),
 
-	TP_ARGS(bio, rw),
+	TP_ARGS(bio),
 
 	TP_STRUCT__entry(
 		__field( dev_t,		dev			)
@@ -377,22 +377,20 @@ DECLARE_EVENT_CLASS(block_get_rq,
 /**
  * block_getrq - get a free request entry in queue for block IO operations
  * @bio: pending block IO operation (can be %NULL)
- * @rw: low bit indicates a read (%0) or a write (%1)
  *
  * A request struct for queue has been allocated to handle the
  * block IO operation @bio.
  */
 DEFINE_EVENT(block_get_rq, block_getrq,
 
-	TP_PROTO(struct bio *bio, int rw),
+	TP_PROTO(struct bio *bio),
 
-	TP_ARGS(bio, rw)
+	TP_ARGS(bio)
 );
 
 /**
  * block_sleeprq - waiting to get a free request entry in queue for block IO operation
  * @bio: pending block IO operation (can be %NULL)
- * @rw: low bit indicates a read (%0) or a write (%1)
  *
  * In the case where a request struct cannot be provided for queue
  * the process needs to wait for an request struct to become
@@ -401,9 +399,9 @@ DEFINE_EVENT(block_get_rq, block_getrq,
  */
 DEFINE_EVENT(block_get_rq, block_sleeprq,
 
-	TP_PROTO(struct bio *bio, int rw),
+	TP_PROTO(struct bio *bio),
 
-	TP_ARGS(bio, rw)
+	TP_ARGS(bio)
 );
 
 /**
diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
index 7b72781a591d..1d36e6153ab8 100644
--- a/kernel/trace/blktrace.c
+++ b/kernel/trace/blktrace.c
@@ -949,8 +949,7 @@ static void blk_add_trace_bio_queue(void *ignore, struct bio *bio)
 	blk_add_trace_bio(bio, BLK_TA_QUEUE, 0);
 }
 
-static void blk_add_trace_getrq(void *ignore,
-				struct bio *bio, int rw)
+static void blk_add_trace_getrq(void *ignore, struct bio *bio)
 {
 	if (bio)
 		blk_add_trace_bio(bio, BLK_TA_GETRQ, 0);
@@ -960,14 +959,14 @@ static void blk_add_trace_getrq(void *ignore,
 		rcu_read_lock();
 		bt = rcu_dereference(bio_q(bio)->blk_trace);
 		if (bt)
-			__blk_add_trace(bt, 0, 0, rw, 0, BLK_TA_GETRQ, 0, 0,
-					NULL, 0);
+			__blk_add_trace(bt, 0, 0, bio->bi_opf, 0,
+					BLK_TA_GETRQ, 0, 0, NULL, 0);
 		rcu_read_unlock();
 	}
 }
 
 
-static void blk_add_trace_sleeprq(void *ignore, struct bio *bio, int rw)
+static void blk_add_trace_sleeprq(void *ignore, struct bio *bio)
 {
 	if (bio)
 		blk_add_trace_bio(bio, BLK_TA_SLEEPRQ, 0);
@@ -977,8 +976,8 @@ static void blk_add_trace_sleeprq(void *ignore, struct bio *bio, int rw)
 		rcu_read_lock();
 		bt = rcu_dereference(bio_q(bio)->blk_trace);
 		if (bt)
-			__blk_add_trace(bt, 0, 0, rw, 0, BLK_TA_SLEEPRQ,
-					0, 0, NULL, 0);
+			__blk_add_trace(bt, 0, 0, bio->bi_opf, 0,
+					BLK_TA_SLEEPRQ, 0, 0, NULL, 0);
 		rcu_read_unlock();
 	}
 }
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

