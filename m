Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2C55420F78C
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-OfQP3aDFNqmfBb5GDi1sYg-1; Tue, 30 Jun 2020 10:49:16 -0400
X-MC-Unique: OfQP3aDFNqmfBb5GDi1sYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C92CE6BF99;
	Tue, 30 Jun 2020 14:49:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A96315C1B0;
	Tue, 30 Jun 2020 14:49:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 672516C9CD;
	Tue, 30 Jun 2020 14:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNj5J1020507 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:45:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEA352156890; Mon, 29 Jun 2020 23:45:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A93162156A4F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C32F1859172
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:04 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-BUh4CrEzOcuFM2fpm4Fq7w-2; Mon, 29 Jun 2020 19:45:00 -0400
X-MC-Unique: BUh4CrEzOcuFM2fpm4Fq7w-2
IronPort-SDR: m5lrq06poJsHn2WhXuts/pAjVt4+yAfgZXajydH3nJtBEZnya4MauO3On4eiDNxxjAdOtuF2YZ
	6066qqJvZBHVfFXZ8OefSvbjTJlQOpNPCX53mc4OjiPA9WSs2/hGq5ugbPo8xu9fM5htxihzQV
	grlDU+2uFabahJZRAsrfvIv6Evu6AGfCvLETaUjVg/GUbnFgMN3jzn2p5lLbfxqxtco1kziF7v
	BYHQSpVa1yvf2NfreRtEB0qBXxyxZcHHiM784Gdis7MDzTq8XI8YQO1qd4nwS1hiOOWyN11Oj4
	mCE=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="141220090"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:43:56 +0800
IronPort-SDR: moQKFH8As+Dl6A2iqbN9fheGovNcuSLccEES7KtTopv7KOkCWBRd5y+hwBly4zLjRBt7fUUu+W
	xIQ+VBEzHP4CZCvOKj9eMupJqAWq0trs4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:32:49 -0700
IronPort-SDR: 2TTYKV2UBhmVUliSx1iiNA0qEyTuvXyPEcykDKJ/0JtkuwHLf1c4l7haqfPhSdQFt2rCuSffO0
	J8bjRRwkx1QA==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:43:56 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:07 -0700
Message-Id: <20200629234314.10509-5-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 04/11] block: use block_bio event class for
	bio_bounce
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

Remove block_bio_bounce trace event which shares the code with block_bio.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 56 ++++++++++++------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index 5e9f46469f50..d7289576f1fd 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -221,44 +221,6 @@ DEFINE_EVENT(block_rq, block_rq_merge,
 	TP_ARGS(rq)
 );
 
-/**
- * block_bio_bounce - used bounce buffer when processing block operation
- * @bio: block operation
- *
- * A bounce buffer was used to handle the block operation @bio in queue.
- * This occurs when hardware limitations prevent a direct transfer of
- * data between the @bio data memory area and the IO device.  Use of a
- * bounce buffer requires extra copying of data and decreases
- * performance.
- */
-TRACE_EVENT(block_bio_bounce,
-
-	TP_PROTO(struct bio *bio),
-
-	TP_ARGS(bio),
-
-	TP_STRUCT__entry(
-		__field( dev_t,		dev			)
-		__field( sector_t,	sector			)
-		__field( unsigned int,	nr_sector		)
-		__array( char,		rwbs,	RWBS_LEN	)
-		__array( char,		comm,	TASK_COMM_LEN	)
-	),
-
-	TP_fast_assign(
-		__entry->dev		= bio_dev(bio);
-		__entry->sector		= bio->bi_iter.bi_sector;
-		__entry->nr_sector	= bio_sectors(bio);
-		blk_fill_rwbs(__entry->rwbs, bio->bi_opf, bio->bi_iter.bi_size);
-		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
-	),
-
-	TP_printk("%d,%d %s %llu + %u [%s]",
-		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
-		  (unsigned long long)__entry->sector,
-		  __entry->nr_sector, __entry->comm)
-);
-
 /**
  * block_bio_complete - completed all work on the block operation
  * @q: queue holding the block operation
@@ -351,6 +313,24 @@ DEFINE_EVENT(block_bio, block_bio_frontmerge,
 	TP_ARGS(bio)
 );
 
+/**
+ * block_bio_bounce - used bounce buffer when processing block operation
+ * @bio: block operation
+ *
+ * A bounce buffer was used to handle the block operation @bio in queue.
+ * This occurs when hardware limitations prevent a direct transfer of
+ * data between the @bio data memory area and the IO device.  Use of a
+ * bounce buffer requires extra copying of data and decreases
+ * performance.
+ */
+
+DEFINE_EVENT(block_bio, block_bio_bounce,
+
+	TP_PROTO(struct bio *bio),
+
+	TP_ARGS(bio)
+);
+
 /**
  * block_bio_queue - putting new block IO operation in queue
  * @bio: new block operation
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

