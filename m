Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA1D1E3843
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:33:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3x9ePIIwhGba1uBCcAs/lVyOfqRTzQbVIX2Y5iziNqU=;
	b=dugLtMAIP2SvqpcOXSnNWs2nIuJjVIcyMEmeoUh9DCqgqnXV7f+QmtU65iu/4tjFLYTOWS
	HnnMbCzp1N9IQSE/S+FkpIPqgFYTqXWJXW1jxPfTRxLauwk8YcE5CijCWeUikXZ6C01A8G
	iHmgviITK8/dICPip+are9KrR3KzwdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-W8yEmXwNNlmWqLz1Iy_VkA-1; Wed, 27 May 2020 01:33:13 -0400
X-MC-Unique: W8yEmXwNNlmWqLz1Iy_VkA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E48E8015D2;
	Wed, 27 May 2020 05:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1ED65D9E5;
	Wed, 27 May 2020 05:33:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3B911809541;
	Wed, 27 May 2020 05:33:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5WxqL012103 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:32:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87033A317E; Wed, 27 May 2020 05:32:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8321A6F9FD
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:32:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 930B5101A525
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:32:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-noYDCrA4NYOnIO8gpTw0yQ-1; Wed, 27 May 2020 01:32:55 -0400
X-MC-Unique: noYDCrA4NYOnIO8gpTw0yQ-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYt-0001mp-Fh; Wed, 27 May 2020 05:25:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:19 +0200
Message-Id: <20200527052419.403583-17-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 16/16] block: reduce part_stat_lock() scope
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We only need the stats lock (aka preempt_disable()) for updating the
states, not for looking up or dropping the hd_struct reference.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 block/blk-core.c  | 5 +++--
 block/blk-merge.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index bf2f7d4bc0c1c..a01fb2b508f0e 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1437,9 +1437,9 @@ void blk_account_io_done(struct request *req, u64 now)
 		update_io_ticks(part, jiffies, true);
 		part_stat_inc(part, ios[sgrp]);
 		part_stat_add(part, nsecs[sgrp], now - req->start_time_ns);
+		part_stat_unlock();
 
 		hd_struct_put(part);
-		part_stat_unlock();
 	}
 }
 
@@ -1448,8 +1448,9 @@ void blk_account_io_start(struct request *rq)
 	if (!blk_do_io_stat(rq))
 		return;
 
-	part_stat_lock();
 	rq->part = disk_map_sector_rcu(rq->rq_disk, blk_rq_pos(rq));
+
+	part_stat_lock();
 	update_io_ticks(rq->part, jiffies, false);
 	part_stat_unlock();
 }
diff --git a/block/blk-merge.c b/block/blk-merge.c
index c3beae5c1be71..f0b0bae075a0c 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -674,8 +674,9 @@ static void blk_account_io_merge_request(struct request *req)
 	if (blk_do_io_stat(req)) {
 		part_stat_lock();
 		part_stat_inc(req->part, merges[op_stat_group(req_op(req))]);
-		hd_struct_put(req->part);
 		part_stat_unlock();
+
+		hd_struct_put(req->part);
 	}
 }
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

