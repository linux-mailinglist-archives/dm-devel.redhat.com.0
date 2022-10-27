Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE460F2FA
	for <lists+dm-devel@lfdr.de>; Thu, 27 Oct 2022 10:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666861064;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OAJxWUK9WU2zTmfpnnkX0lb7c+xjaZ99hbltXzeJmDo=;
	b=WDy8Ww1mmMoT2ihMcaRnBAP3Vdy8ZGo9byrFWQKeSIQEFwFk0k/aLf/gHJEuHElM4SMNAF
	cGv9k0TZcyMwHYzsYPDW7Lpo6xHRTHAeOGcK5tp7EtDuajBKVZDL12PAvEMk7JTKoH2RGU
	ucBCYeCvXMjk9xjjB9LmMy+oxXpPrjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-SuH2DNMyP4i50RLjJAhoVw-1; Thu, 27 Oct 2022 04:57:41 -0400
X-MC-Unique: SuH2DNMyP4i50RLjJAhoVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67705101A528;
	Thu, 27 Oct 2022 08:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3413A2024CB7;
	Thu, 27 Oct 2022 08:57:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 22D0D1947061;
	Thu, 27 Oct 2022 08:57:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58A401946597
 for <dm-devel@listman.corp.redhat.com>; Thu, 27 Oct 2022 08:57:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0AA842022EBA; Thu, 27 Oct 2022 08:57:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C6820290A6;
 Thu, 27 Oct 2022 08:57:22 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Oct 2022 16:57:09 +0800
Message-Id: <20221027085709.513175-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH] blk-mq: don't add non-pt request with ->end_io
 to batch
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Changhui Zhong <czhong@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-rq implements ->end_io callback for request issued to underlying queue,
and it isn't passthrough request.

Commit ab3e1d3bbab9 ("block: allow end_io based requests in the completion
batch handling") doesn't clear rq->bio and rq->__data_len for request
with ->end_io in blk_mq_end_request_batch(), and this way is actually
dangerous, but so far it is only for nvme passthrough request.

dm-rq needs to clean up remained bios in case of partial completion,
and req->bio is required, then use-after-free is triggered, so the
underlying clone request can't be completed in blk_mq_end_request_batch.

Fix panic by not adding such request into batch list, and the issue
can be triggered simply by exposing nvme pci to dm-mpath simply.

Fixes: ab3e1d3bbab9 ("block: allow end_io based requests in the completion batch handling")
Cc: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@kernel.org>
Reported-by: Changhui Zhong <czhong@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 include/linux/blk-mq.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index ba18e9bdb799..d6119c5d1069 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -853,7 +853,8 @@ static inline bool blk_mq_add_to_batch(struct request *req,
 				       struct io_comp_batch *iob, int ioerror,
 				       void (*complete)(struct io_comp_batch *))
 {
-	if (!iob || (req->rq_flags & RQF_ELV) || ioerror)
+	if (!iob || (req->rq_flags & RQF_ELV) || ioerror ||
+			(req->end_io && !blk_rq_is_passthrough(req)))
 		return false;
 
 	if (!iob->complete)
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

