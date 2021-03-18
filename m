Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44B2A340AB8
	for <lists+dm-devel@lfdr.de>; Thu, 18 Mar 2021 17:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616086503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2xpu5nczlM4aCvnuQvkZY9HDS4GgOXa4DqYwaWSzr38=;
	b=VzVxeN9KHEPSRahgtrfIetRYXvwRX2d9voe1p038frZtxFk/7yWTG4Mgn37gbTQZrAPz8f
	dL3D2uUodvjshjjK7ka9n8FmfE24mUQzMjAQWJSsZZqd67rBjIDo5nJGoqBGNoLXOyThu8
	G+awCPEL3GU8MqHGoiH4wShmUUUK7OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-QXOPHuTDMoCr_z_9bVtkXw-1; Thu, 18 Mar 2021 12:53:59 -0400
X-MC-Unique: QXOPHuTDMoCr_z_9bVtkXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26232100946E;
	Thu, 18 Mar 2021 16:53:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E57E350FA2;
	Thu, 18 Mar 2021 16:53:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B50B4BB7C;
	Thu, 18 Mar 2021 16:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12IGnZlT030552 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Mar 2021 12:49:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1AF195D9D0; Thu, 18 Mar 2021 16:49:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-24.pek2.redhat.com [10.72.12.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 371DE5D9C6;
	Thu, 18 Mar 2021 16:49:33 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 19 Mar 2021 00:48:21 +0800
Message-Id: <20210318164827.1481133-8-ming.lei@redhat.com>
In-Reply-To: <20210318164827.1481133-1-ming.lei@redhat.com>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH V2 07/13] block/mq: extract one helper
	function polling hw queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeffle Xu <jefflexu@linux.alibaba.com>

Extract the logic of polling one hw queue and related statistics
handling out as the helper function.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index c832faa52ca0..03f59915fe2c 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3852,6 +3852,19 @@ static bool blk_mq_poll_hybrid(struct request_queue *q,
 	return blk_mq_poll_hybrid_sleep(q, rq);
 }
 
+static inline int blk_mq_poll_hctx(struct request_queue *q,
+				   struct blk_mq_hw_ctx *hctx)
+{
+	int ret;
+
+	hctx->poll_invoked++;
+	ret = q->mq_ops->poll(hctx);
+	if (ret > 0)
+		hctx->poll_success++;
+
+	return ret;
+}
+
 static int blk_bio_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
 {
 	/*
@@ -3908,11 +3921,8 @@ int blk_poll(struct request_queue *q, blk_qc_t cookie, bool spin)
 	do {
 		int ret;
 
-		hctx->poll_invoked++;
-
-		ret = q->mq_ops->poll(hctx);
+		ret = blk_mq_poll_hctx(q, hctx);
 		if (ret > 0) {
-			hctx->poll_success++;
 			__set_current_state(TASK_RUNNING);
 			return ret;
 		}
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

