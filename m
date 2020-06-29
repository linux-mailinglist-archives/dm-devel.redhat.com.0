Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC420F78F
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-rNNo1owSPcWQdVplcdNe8g-1; Tue, 30 Jun 2020 10:49:17 -0400
X-MC-Unique: rNNo1owSPcWQdVplcdNe8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2885E107B284;
	Tue, 30 Jun 2020 14:49:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B907BEA0;
	Tue, 30 Jun 2020 14:49:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B12AA6C9CE;
	Tue, 30 Jun 2020 14:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNj7O9020516 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:45:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09BB52156A4F; Mon, 29 Jun 2020 23:45:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 057A82156A4E
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE389800260
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:06 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409-_PiV6O-HO0WQGdorwWM44g-1; Mon, 29 Jun 2020 19:45:02 -0400
X-MC-Unique: _PiV6O-HO0WQGdorwWM44g-1
IronPort-SDR: RDbrNq5en+/Emd78Yq+QKouObsy8BWeVaMVlxV7sZnPceZD9WWh2OR/SWt/tByHAFHM38QDub0
	Uh5fRIsPy0XFl0hmdiLlkfkdCBw/8WbGwl0G392GydJGBYGHtrv6rTQjv9VNq5dFrHrerLC7XH
	Gu4PXtsN8/FHvbVzunyVch4VxrsX5KhYVsVcSsmFzCUwIyM7sGPGWgSyvzeXX782atMWCqXC3g
	FKM0ffoKQYQM1FGLxeFWqH2DGziM7BKSdo8KDg+s96yUlqCPCN701nB6uxGmPJlztjy5+djNmw
	doo=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="250451525"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:45:00 +0800
IronPort-SDR: vfrhNK5/BW9+Li0qalWwyoKTIAbV+ZvsF6GSbn8+1xebIf0t1b+jDG01pcbWVQpF+A4emV7M6n
	PrKPrxSpgs0wExcNSa+8rZ2XIMhFCUUI4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:33:20 -0700
IronPort-SDR: 6lJvjQXfWa7Clf3GSzVOBFEGRf7qj96erZRiTrcownPOnxcf3VeOT+CS0b4eeudQVMs5ebyHky
	3Yp09SaAptIg==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:44:59 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:14 -0700
Message-Id: <20200629234314.10509-12-chaitanya.kulkarni@wdc.com>
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
Subject: [dm-devel] [PATCH 11/11] block: remove block_get_rq event class
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that there are no users for the block_get_rq event class remove the
event class.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index 21f1daaf012b..dc1834250baa 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -353,34 +353,6 @@ DEFINE_EVENT(block_bio, block_bio_queue,
 	TP_ARGS(bio)
 );
 
-DECLARE_EVENT_CLASS(block_get_rq,
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
-        ),
-
-	TP_fast_assign(
-		__entry->dev		= bio ? bio_dev(bio) : 0;
-		__entry->sector		= bio ? bio->bi_iter.bi_sector : 0;
-		__entry->nr_sector	= bio ? bio_sectors(bio) : 0;
-		blk_fill_rwbs(__entry->rwbs, bio ? bio->bi_opf : 0);
-		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
-        ),
-
-	TP_printk("%d,%d %s %llu + %u [%s]",
-		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
-		  (unsigned long long)__entry->sector,
-		  __entry->nr_sector, __entry->comm)
-);
-
 /**
  * block_getrq - get a free request entry in queue for block IO operations
  * @bio: pending block IO operation (can be %NULL)
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

