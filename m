Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03DF320F785
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-hmYpD_hMPgyTDRBrpx5OBQ-1; Tue, 30 Jun 2020 10:49:06 -0400
X-MC-Unique: hmYpD_hMPgyTDRBrpx5OBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19CF58015F5;
	Tue, 30 Jun 2020 14:48:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED6C74F6A4;
	Tue, 30 Jun 2020 14:48:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF6DD6C9C4;
	Tue, 30 Jun 2020 14:48:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNimfh020454 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:44:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3057610F04B; Mon, 29 Jun 2020 23:44:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F6410FACC
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A490185A78B
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:40 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-261-w3EEPoQMP3CYnXwadpqqIg-1; Mon, 29 Jun 2020 19:44:37 -0400
X-MC-Unique: w3EEPoQMP3CYnXwadpqqIg-1
IronPort-SDR: L/6pY7XOSv8UTVgI2RMyqxpSmb5rqq6Oi6AU2xfUzPyjFgyvtHrxM7O/HnMzey5XSM3G/jwp83
	twS1N8vOd8daT3wYuO0izoOCbqY9k7ZdYLQi77bTUiUr4GGjke9PCit7m6N5jgTECSb1wEvO07
	8PE4ZGYOWUxIah1MOJTlY/C83OkuztPGHOPiK7gqTs+ljoJ5Le4ZNDACA5qvODVqWRArQhTeqA
	LbCUE4wqBsGspJVd3o/WyYt1TpWBsbekNYA+0odjVjrz4HuwMQVn9+yFCzQzsc/+OQik3qCz6s
	w00=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="141431451"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:44:31 +0800
IronPort-SDR: N+Q3bnzbkbVL0SsZlhKwqEZ5FzzZHbKubGtRj6nlH83AsbxqnLsIC/ykyok1c343ss4F/BPDJJ
	K6oIu1pBhRaKvrAx4/axGMDPNRZzw1EDo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:33:23 -0700
IronPort-SDR: ZSdzI9vxkzz1tOehmS7qpaytmCk5G6bJUtY9juZKJEfzT0tB+0d518YlIGIFXkDRR/2aHlo+9/
	9Lze0F0Ur6GQ==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:44:30 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:11 -0700
Message-Id: <20200629234314.10509-9-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 08/11] block: fix the comments in the trace event
	block.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is purely cleanup patch which fixes the comment in trace event
header for block_rq_issue() and block_rq_merge() events.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index 3d8923062fc4..6a74fb9f4dba 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -195,7 +195,7 @@ DEFINE_EVENT(block_rq, block_rq_insert,
 
 /**
  * block_rq_issue - issue pending block IO request operation to device driver
- * @rq: block IO operation operation request
+ * @rq: block IO operation request
  *
  * Called when block operation request @rq from queue @q is sent to a
  * device driver for processing.
@@ -209,7 +209,7 @@ DEFINE_EVENT(block_rq, block_rq_issue,
 
 /**
  * block_rq_merge - merge request with another one in the elevator
- * @rq: block IO operation operation request
+ * @rq: block IO operation request
  *
  * Called when block operation request @rq from queuei is merged to another
  * request queued in the elevator.
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

