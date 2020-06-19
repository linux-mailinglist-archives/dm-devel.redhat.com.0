Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BEBF420043E
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 10:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592556286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WM2vM+5KjmACKTuXRckN9O3tT70/hW7EvYetk/TvssU=;
	b=LIsfQGkdzb2onNi68R4pIOExo1fu6BEion/zCLo8Rj3CBFRyR+DzG6uq92CqbUE3x2gCUL
	JISBorTBjIwtypODfgcIXVWQK38BU/4mxzGZUl+VK4d1Pi747XntDUi6YjHTC3razHd3xv
	J02LkurtyVJXXcGw43keBLIUZsPWljc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-RTes5HvcNIq7vV_807fkcA-1; Fri, 19 Jun 2020 04:44:43 -0400
X-MC-Unique: RTes5HvcNIq7vV_807fkcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51BD78015CE;
	Fri, 19 Jun 2020 08:44:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9842B7C1E8;
	Fri, 19 Jun 2020 08:44:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0015D1809547;
	Fri, 19 Jun 2020 08:44:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J8gSRl029017 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 04:42:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 972505BAC1; Fri, 19 Jun 2020 08:42:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-44.pek2.redhat.com [10.72.12.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A3AF5BACA;
	Fri, 19 Jun 2020 08:42:18 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Date: Fri, 19 Jun 2020 16:42:14 +0800
Message-Id: <20200619084214.337449-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH] dm-rq: don't call blk_mq_queue_stopped in
	dm_stop_queue()
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

dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
remove the check.

dm_stop_queue() actually tries to quiesce hw queues via blk_mq_quiesce_queue(),
we can't check via blk_queue_quiesced for avoiding unnecessary queue
quiesce because the flag is set before synchronize_rcu() and dm_stop_queue
may be called when synchronize_rcu from another blk_mq_quiesce_queue is
in-progress.

Cc: linux-block@vger.kernel.org
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm-rq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index f60c02512121..ed4d5ea66ccc 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -70,9 +70,6 @@ void dm_start_queue(struct request_queue *q)
 
 void dm_stop_queue(struct request_queue *q)
 {
-	if (blk_mq_queue_stopped(q))
-		return;
-
 	blk_mq_quiesce_queue(q);
 }
 
-- 
2.25.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

