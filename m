Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5B420F789
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-CrKHTN4UNhGW3sOJ_nu5JQ-1; Tue, 30 Jun 2020 10:49:15 -0400
X-MC-Unique: CrKHTN4UNhGW3sOJ_nu5JQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BA3B8064B2;
	Tue, 30 Jun 2020 14:49:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F007A2B47E;
	Tue, 30 Jun 2020 14:49:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE28A6C9CB;
	Tue, 30 Jun 2020 14:49:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNj35o020496 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:45:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0957E2157F25; Mon, 29 Jun 2020 23:45:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04DAB2166BA3
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD2F2800260
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:45:00 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1--q9NBEFGMxuBEnncqU1mVw-1; Mon, 29 Jun 2020 19:44:58 -0400
X-MC-Unique: -q9NBEFGMxuBEnncqU1mVw-1
IronPort-SDR: /EC9w4DtCTB0Oq3TD+A6NI7LHVuaop72oHb0g/+ymgRjb4nD1RWgDVrjuTQUqjnlhiDJCZwzAy
	F9lnyd5ybENGUo5T/91nMSfrtFS6U1pXQtw697/obK55p6xX60qjRB7LvPbytKHP0lP0usV/kg
	SD1g4XngZnSovlUfafUa0lUyE6kRtMCBIzpRnls5mJmJdkMVUZCQyM1GkfajMNMpdgtwPTfYjl
	H2m7BXlOab0pJqBE2iFWHFoxtX1Kc956eabF8vvG5fcaDPMV5CjXOB/yF2rBD5/a0kKTaQUFrc
	UTU=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="141220130"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:44:52 +0800
IronPort-SDR: hgHRUhkCMzpLcCNONUOjzEi6tFpV96LSYTjozJ0eLaMcbgEu8+KeuSMQKNX1H5lP1c7eQKSOyU
	sPkqGHEwcR/pA9H9bA0R5jMhHUnWHUDSY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:33:13 -0700
IronPort-SDR: XOE0qzV3gOcUVjTZqV2zR0gAt4486Qd0+ZKTtGC+7TEtI4APUPn2jB3lLbTrA7WSNmPLQxX+9i
	/fwMiZj37B2w==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:44:52 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:13 -0700
Message-Id: <20200629234314.10509-11-chaitanya.kulkarni@wdc.com>
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
Subject: [dm-devel] [PATCH 10/11] block: use block_bio class for getrq and
	sleeprq
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

The only difference in block_get_rq and block_bio was the last param
passed  __entry->nr_sector & bio->bi_iter.bi_size respectively. Since
that is not the case anymore replace block_get_rq class with block_bio
for block_getrq and block_sleeprq events, also adjust the code to handle
null bio case in block_bio.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index d191d2cd1070..21f1daaf012b 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -272,11 +272,19 @@ DECLARE_EVENT_CLASS(block_bio,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= bio_dev(bio);
-		__entry->sector		= bio->bi_iter.bi_sector;
-		__entry->nr_sector	= bio_sectors(bio);
-		blk_fill_rwbs(__entry->rwbs, bio->bi_opf);
-		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
+		if (bio) {
+			__entry->dev		= bio_dev(bio);
+			__entry->sector		= bio->bi_iter.bi_sector;
+			__entry->nr_sector	= bio_sectors(bio);
+			blk_fill_rwbs(__entry->rwbs, bio->bi_opf);
+			memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
+		} else {
+			__entry->dev		= 0;
+			__entry->sector		= 0;
+			__entry->nr_sector	= 0;
+			blk_fill_rwbs(__entry->rwbs, 0);
+			memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
+		}
 	),
 
 	TP_printk("%d,%d %s %llu + %u [%s]",
@@ -380,7 +388,7 @@ DECLARE_EVENT_CLASS(block_get_rq,
  * A request struct for queue has been allocated to handle the
  * block IO operation @bio.
  */
-DEFINE_EVENT(block_get_rq, block_getrq,
+DEFINE_EVENT(block_bio, block_getrq,
 
 	TP_PROTO(struct bio *bio),
 
@@ -396,7 +404,7 @@ DEFINE_EVENT(block_get_rq, block_getrq,
  * available.  This tracepoint event is generated each time the
  * process goes to sleep waiting for request struct become available.
  */
-DEFINE_EVENT(block_get_rq, block_sleeprq,
+DEFINE_EVENT(block_bio, block_sleeprq,
 
 	TP_PROTO(struct bio *bio),
 
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

