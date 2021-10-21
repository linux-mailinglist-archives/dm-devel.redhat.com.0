Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F335F4364F6
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 17:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634828522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dIJKJn/TyBF79ity9MFK/P7hYuLZPRvxV7PdFKHQ5Ag=;
	b=NY5R8s18Ra7DXGn1kqmfzt0c5MIxy/gBc7tkF2m4HeLu1oVmCdfQZr9ixCqcPPLC6GzXRq
	p2z9S1z9ezgN47ezWecLGtfJyD294/KH/lbs92pGcaxRcoDzzhNuyjpk0noWhnFcAFXBHP
	h4aSbhBbG/uPIJuvpzspsx9G5JqaK8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-hmMKEpDgOiuVS2IujeIt9g-1; Thu, 21 Oct 2021 11:02:00 -0400
X-MC-Unique: hmMKEpDgOiuVS2IujeIt9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 158C919611CF;
	Thu, 21 Oct 2021 15:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E787B6A23C;
	Thu, 21 Oct 2021 15:00:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C390E4A704;
	Thu, 21 Oct 2021 15:00:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LF0ieo031642 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 11:00:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FFC37830B; Thu, 21 Oct 2021 15:00:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 807F25F4E9;
	Thu, 21 Oct 2021 15:00:40 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 21 Oct 2021 22:59:18 +0800
Message-Id: <20211021145918.2691762-4-ming.lei@redhat.com>
In-Reply-To: <20211021145918.2691762-1-ming.lei@redhat.com>
References: <20211021145918.2691762-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Yi Zhang <yi.zhang@redhat.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [dm-devel] [PATCH 3/3] dm: don't stop request queue after the dm
	device is suspended
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

For fixing queue quiesce race between driver and block layer(elevator
switch, update nr_requests, ...), we need to support concurrent quiesce
and unquiesce, which requires the two call to be balanced.

__bind() is only called from dm_swap_table() in which dm device has been
suspended already, so not necessary to stop queue again. With this way,
request queue quiesce and unquiesce can be balanced.

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Fixes: e70feb8b3e68 ("blk-mq: support concurrent queue quiesce/unquiesce")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 7870e6460633..727282d79b26 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1927,16 +1927,6 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
 
 	dm_table_event_callback(t, event_callback, md);
 
-	/*
-	 * The queue hasn't been stopped yet, if the old table type wasn't
-	 * for request-based during suspension.  So stop it to prevent
-	 * I/O mapping before resume.
-	 * This must be done before setting the queue restrictions,
-	 * because request-based dm may be run just after the setting.
-	 */
-	if (request_based)
-		dm_stop_queue(q);
-
 	if (request_based) {
 		/*
 		 * Leverage the fact that request-based DM targets are
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

