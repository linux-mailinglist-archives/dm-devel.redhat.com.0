Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2FBF42A9BB
	for <lists+dm-devel@lfdr.de>; Tue, 12 Oct 2021 18:41:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-BGCRfDrrMVO85rsKlfOtUQ-1; Tue, 12 Oct 2021 12:41:47 -0400
X-MC-Unique: BGCRfDrrMVO85rsKlfOtUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F036800FF0;
	Tue, 12 Oct 2021 16:41:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D74A25D9C6;
	Tue, 12 Oct 2021 16:41:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E2621803B30;
	Tue, 12 Oct 2021 16:41:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19CGfCNm025633 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Oct 2021 12:41:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74EE3404727A; Tue, 12 Oct 2021 16:41:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 710C34047272
	for <dm-devel@redhat.com>; Tue, 12 Oct 2021 16:41:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 588D1180F6E6
	for <dm-devel@redhat.com>; Tue, 12 Oct 2021 16:41:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-raOJglXDNR6s96g1gPvtnA-1; Tue, 12 Oct 2021 12:41:08 -0400
X-MC-Unique: raOJglXDNR6s96g1gPvtnA-1
Received: from [2001:4bb8:199:73c5:f5ed:58c2:719f:d965] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maKp0-006eym-9j; Tue, 12 Oct 2021 16:40:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 12 Oct 2021 18:36:11 +0200
Message-Id: <20211012163613.994933-4-hch@lst.de>
In-Reply-To: <20211012163613.994933-1-hch@lst.de>
References: <20211012163613.994933-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 3/5] block: open code blk_max_size_offset in
	blk_rq_get_max_sectors
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

blk_rq_get_max_sectors always uses q->limits.chunk_sectors as the
chunk_sectors argument, and already checks for max_sectors through the
call to blk_queue_get_max_sectors.  That means much of
blk_max_size_offset is not needed and open coding it simplifies the code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 14ce19607cd8a..b3da43160032f 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -595,17 +595,18 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
 						  sector_t offset)
 {
 	struct request_queue *q = rq->q;
+	unsigned int max_sectors;
 
 	if (blk_rq_is_passthrough(rq))
 		return q->limits.max_hw_sectors;
 
-	if (!q->limits.chunk_sectors ||
-	    req_op(rq) == REQ_OP_DISCARD ||
-	    req_op(rq) == REQ_OP_SECURE_ERASE)
-		return blk_queue_get_max_sectors(q, req_op(rq));
-
-	return min(blk_max_size_offset(q, offset, 0),
-			blk_queue_get_max_sectors(q, req_op(rq)));
+	max_sectors = blk_queue_get_max_sectors(q, req_op(rq));
+	if (q->limits.chunk_sectors &&
+	    req_op(rq) != REQ_OP_DISCARD &&
+	    req_op(rq) != REQ_OP_SECURE_ERASE)
+		max_sectors = min(max_sectors,
+			chunk_size_left(offset, q->limits.chunk_sectors));
+	return max_sectors;
 }
 
 static inline int ll_new_hw_segment(struct request *req, struct bio *bio,
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

