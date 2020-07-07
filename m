Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 09C3F216FA1
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 17:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594134310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GSWcIsdjYiSgHnB5qPrmpBFM1b1QpmLUfFmiSTtaPq8=;
	b=enRGH3t4fdpxiKSz0VKIUquIrjyVKLkZFmWgDIAx76+NWGDOilUW7NLFnhm2oSV/qMomRK
	fOgDElw/cg0PI5dnyqzJcptr+/zxlNWw4gouttXwNZWjD+8e9XbjA0AruQdW37XK/+suTl
	RnZbdHfo7uLpom4v7cAE7HynXYWC0TY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-LkDfmcsSOWqKKRkElZQE6g-1; Tue, 07 Jul 2020 11:05:02 -0400
X-MC-Unique: LkDfmcsSOWqKKRkElZQE6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293A7804016;
	Tue,  7 Jul 2020 15:04:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 848B95D9C9;
	Tue,  7 Jul 2020 15:04:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AAF71809547;
	Tue,  7 Jul 2020 15:04:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067F4hFL029717 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 11:04:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2DED5F245; Tue,  7 Jul 2020 15:04:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE07B7C43
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 15:04:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B32C924907
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 15:04:40 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-e9SoI8isPmmNDlTlB5f-Ww-1; Tue, 07 Jul 2020 11:04:36 -0400
X-MC-Unique: e9SoI8isPmmNDlTlB5f-Ww-1
Received: by mail-qk1-f193.google.com with SMTP id q198so38400787qka.2;
	Tue, 07 Jul 2020 08:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=1sdiGbveFaT49tOO4Q9qYVxS3eQWzjAvrAW+jAKSq60=;
	b=LRS58ZIo1HZpSEW+nSBvAeDOq3yit6egJjo/dpFEe0Nm862zFHwrkb7JsrS9a5YWYU
	yCF5dibCBZDKfsevTiioHNxJVUmWYixkWIs5gLnmJXqjdSNU+StjSCLYSLassP+Chn5Y
	9GrvqVFCK6P+6YMUNxO4LE4udq8+ZqkwcDOlm6RgOcg8H2UhkwwY743m2G34zDW0S31b
	aVQSyKim8i16Ybyy3dhL5AWYjDmEebR9jbnPpuyHXzE05iF/iXjqMpVlKRMEIcbOS4L0
	yhmj0Lt9gXOVrDASl0se4eILE3W1s8w9F1aGEy1KDu32WS8wetDPcy4L3kpZzuUzqpeP
	yORQ==
X-Gm-Message-State: AOAM533aIsogv3TGcEFZT/sjjT/nEIn8hstaeVKqBF+ZyvTakUvg/4P6
	qiLlD2LqbFaA2AiboL9pyhs=
X-Google-Smtp-Source: ABdhPJzNU09L70s+DnlC72WKlG6/VZXcFKlZJCP+hPgECtW9dK1uhkidNNre7gq/w70u6rXybFaE7g==
X-Received: by 2002:a37:27c2:: with SMTP id
	n185mr49499562qkn.459.1594134275629; 
	Tue, 07 Jul 2020 08:04:35 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	c7sm28538179qta.95.2020.07.07.08.04.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jul 2020 08:04:34 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: linux-block@vger.kernel.org, axboe@kernel.dk
Date: Tue,  7 Jul 2020 11:04:33 -0400
Message-Id: <20200707150433.39480-1-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH] blk-mq: consider non-idle request as "inflight"
	in blk_mq_rq_inflight()
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ming Lei <ming.lei@redhat.com>

dm-multipath is the only user of blk_mq_queue_inflight().  When
dm-multipath calls blk_mq_queue_inflight() to check if it has
outstanding IO it can get a false negative.  The reason for this is
blk_mq_rq_inflight() doesn't consider requests that are no longer
MQ_RQ_IN_FLIGHT but that are now MQ_RQ_COMPLETE (->complete isn't
called or finished yet) as "inflight".

This causes request-based dm-multipath's dm_wait_for_completion() to
return before all outstanding dm-multipath requests have actually
completed.  This breaks DM multipath's suspend functionality because
blk-mq requests complete after DM's suspend has finished -- which
shouldn't happen.

Fix this by considering any request not in the MQ_RQ_IDLE state
(so either MQ_RQ_COMPLETE or MQ_RQ_IN_FLIGHT) as "inflight" in
blk_mq_rq_inflight().

Fixes: 3c94d83cb3526 ("blk-mq: change blk_mq_queue_busy() to blk_mq_queue_inflight()")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 block/blk-mq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 4f57d27bfa73..e6219c27fc65 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -828,10 +828,10 @@ static bool blk_mq_rq_inflight(struct blk_mq_hw_ctx *hctx, struct request *rq,
 			       void *priv, bool reserved)
 {
 	/*
-	 * If we find a request that is inflight and the queue matches,
+	 * If we find a request that isn't idle and the queue matches,
 	 * we know the queue is busy. Return false to stop the iteration.
 	 */
-	if (rq->state == MQ_RQ_IN_FLIGHT && rq->q == hctx->queue) {
+	if (blk_mq_request_started(rq) && rq->q == hctx->queue) {
 		bool *busy = priv;
 
 		*busy = true;
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

