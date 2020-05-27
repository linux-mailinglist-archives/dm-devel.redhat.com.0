Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D52E81E3833
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1v5a2DV9gJfKs4kimf5HSgHsXmNTmgdYUiEzxjHYqVE=;
	b=bCym0TfkGuHejtnwsx2N1rALCxdrNvRdRhzu7gMZxBRhYiq11JG+jEsFF9Err4m66cccnZ
	dxStFUVZ0uyLceRrsxQPScPPplT1NIbhFdpmxDPbd6I2ky1yIBRFY22F398Da5GzOibJn5
	TvFLrOKYURiarRX4NPAsv7VKSzexefE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-un6NvRMMO3acJcQNC8bhxg-1; Wed, 27 May 2020 01:28:43 -0400
X-MC-Unique: un6NvRMMO3acJcQNC8bhxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7FCB107ACF7;
	Wed, 27 May 2020 05:28:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B146FB86;
	Wed, 27 May 2020 05:28:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47B6E6B49A;
	Wed, 27 May 2020 05:28:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5SYZm011757 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:28:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD2A6100727F; Wed, 27 May 2020 05:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B10EE100727D
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:28:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3DC828822
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:28:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-438-Hgoeq9K9N4KNAzQ1uX6Mow-1; Wed, 27 May 2020 01:28:31 -0400
X-MC-Unique: Hgoeq9K9N4KNAzQ1uX6Mow-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYh-0000tS-QQ; Wed, 27 May 2020 05:24:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:15 +0200
Message-Id: <20200527052419.403583-13-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 12/16] block: account merge of two requests
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Also rename blk_account_io_merge() into blk_account_io_merge_request() to
distinguish it from merging request and bio.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
[hch: rebased]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 6a4538d39efd2..c3beae5c1be71 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -669,18 +669,16 @@ void blk_rq_set_mixed_merge(struct request *rq)
 	rq->rq_flags |= RQF_MIXED_MERGE;
 }
 
-static void blk_account_io_merge(struct request *req)
+static void blk_account_io_merge_request(struct request *req)
 {
 	if (blk_do_io_stat(req)) {
-		struct hd_struct *part;
-
 		part_stat_lock();
-		part = req->part;
-
-		hd_struct_put(part);
+		part_stat_inc(req->part, merges[op_stat_group(req_op(req))]);
+		hd_struct_put(req->part);
 		part_stat_unlock();
 	}
 }
+
 /*
  * Two cases of handling DISCARD merge:
  * If max_discard_segments > 1, the driver takes every bio
@@ -792,7 +790,7 @@ static struct request *attempt_merge(struct request_queue *q,
 	/*
 	 * 'next' is going away, so update stats accordingly
 	 */
-	blk_account_io_merge(next);
+	blk_account_io_merge_request(next);
 
 	/*
 	 * ownership of bio passed from next to req, return 'next' for
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

