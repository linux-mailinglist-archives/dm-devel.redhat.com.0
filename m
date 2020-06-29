Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 19E8720F786
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-sOa8KrXuO6GBqKmTxnxVEg-1; Tue, 30 Jun 2020 10:49:09 -0400
X-MC-Unique: sOa8KrXuO6GBqKmTxnxVEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB34819200C0;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D1A6106A;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4078F1809557;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNhtTM020341 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:43:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE7202029F79; Mon, 29 Jun 2020 23:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E162029F78
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7D6F185A78B
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:43:52 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-434-vH3TtY-lOIuM6lhpAxgCnQ-1; Mon, 29 Jun 2020 19:43:48 -0400
X-MC-Unique: vH3TtY-lOIuM6lhpAxgCnQ-1
IronPort-SDR: 7GzuzV+lmPk4ATLkjbNpCb6Kt3aLlOe1QYTlaYZZ7oSc4CG3c0EWoPLGXfLJ1OAJt7wPxJbxwt
	VMhBHtz2qLJH2Equ5sd1QdQUDf6VorU9LGQ9pbTsFxTUHBUPOkTw6F91QW8nT6kwYWpNHTjQNj
	oMRuZfppXmR/9SdSxmSdvoI4AG8fC/wa2iin+huwtsHJNC5NjUhmyAbPoN6k5hLUA/rHd5TnuJ
	aWzDyEtAOlllw6hPyPK91miSjh4fPXZJ6TE8cb4LmsRs61r07rVFDgkeDWiYRoB3ELFR0Copy9
	1P8=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="141431396"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:43:47 +0800
IronPort-SDR: kwj86SRihGrn1elUhhZQBiHcaCI9HDiSlEDfDt7ZNdva1GHgXPu9QkbAOnc63QsWYzV2EqFt+e
	sBCC00pV/oKfKMetXlTy4K/+n2nt2rtW0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:32:40 -0700
IronPort-SDR: GWpo01VB/dDgqIVJbMjgir3MmktW2jUd980tnAe2STAeEiBIqW3F877xTOSjZFjHfBZPYVTjFl
	4XXqzgO3aVug==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:43:46 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:06 -0700
Message-Id: <20200629234314.10509-4-chaitanya.kulkarni@wdc.com>
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
Subject: [dm-devel] [PATCH 03/11] block: use block_bio event class for
	bio_queue
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove block_bio_queue trace event which shares the code with block_bio.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index b5be387c4115..5e9f46469f50 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -357,32 +357,12 @@ DEFINE_EVENT(block_bio, block_bio_frontmerge,
  *
  * About to place the block IO operation @bio into queue.
  */
-TRACE_EVENT(block_bio_queue,
 
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
+DEFINE_EVENT(block_bio, block_bio_queue,
 
-	TP_fast_assign(
-		__entry->dev		= bio_dev(bio);
-		__entry->sector		= bio->bi_iter.bi_sector;
-		__entry->nr_sector	= bio_sectors(bio);
-		blk_fill_rwbs(__entry->rwbs, bio->bi_opf, bio->bi_iter.bi_size);
-		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
-	),
+	TP_PROTO(struct bio *bio),
 
-	TP_printk("%d,%d %s %llu + %u [%s]",
-		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
-		  (unsigned long long)__entry->sector,
-		  __entry->nr_sector, __entry->comm)
+	TP_ARGS(bio)
 );
 
 DECLARE_EVENT_CLASS(block_get_rq,
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

