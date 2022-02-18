Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF804BC106
	for <lists+dm-devel@lfdr.de>; Fri, 18 Feb 2022 21:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645215054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iWhGVOPpWM95XLfpYXvXRHXalWze9eozuZe3ynij8MU=;
	b=ALbnBRMTtCYw81BwtKMH54X2wzn/hMxvnK21AkIM5/Uk/mUUNq+tTSSGDc4WdpESi5CFee
	8bLgfUYSeu3+fPiOBeT0M+LPCAN2/2yDodEBzl0lp2Hf+aOvW+2EuzUcBur2HJlsKjdJba
	LoU9EvE8pMgrIRINZ9X1HY1S+Clrz3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-C1mlXpc6NDqb_XGgd0Bfdg-1; Fri, 18 Feb 2022 15:10:53 -0500
X-MC-Unique: C1mlXpc6NDqb_XGgd0Bfdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA5F1091DA2;
	Fri, 18 Feb 2022 20:10:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC1512E2E;
	Fri, 18 Feb 2022 20:10:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF53C4CA93;
	Fri, 18 Feb 2022 20:10:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21IKAgMl002740 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Feb 2022 15:10:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 56C88452EF; Fri, 18 Feb 2022 20:10:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D13F05DF21;
	Fri, 18 Feb 2022 20:10:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 21IKAOiJ000445; Fri, 18 Feb 2022 15:10:24 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 21IKAO1W000441; Fri, 18 Feb 2022 15:10:24 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 18 Feb 2022 15:10:24 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2202181509310.322@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/2] dm: add memory barriers to end_io_acct and
 dm_wait_for_completion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When one thread waits for another, we must use memory barriers, otherwise
the CPU may reorder memory accesses.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c	2022-02-18 17:04:34.000000000 +0100
+++ linux-2.6/drivers/md/dm.c	2022-02-18 17:15:11.000000000 +0100
@@ -506,6 +506,8 @@ static void end_io_acct(struct mapped_de
 				    bio->bi_iter.bi_sector, bio_sectors(bio),
 				    true, duration, stats_aux);
 
+	smp_wmb();
+
 	bio_end_io_acct(bio, start_time);
 
 	/* nudge anyone waiting on suspend queue */
@@ -2170,9 +2172,8 @@ static int dm_wait_for_completion(struct
 	int r = 0;
 
 	if (!queue_is_mq(md->queue))
-		return dm_wait_for_bios_completion(md, task_state);
-
-	while (true) {
+		r = dm_wait_for_bios_completion(md, task_state);
+	else while (true) {
 		if (!blk_mq_queue_inflight(md->queue))
 			break;
 
@@ -2184,6 +2185,8 @@ static int dm_wait_for_completion(struct
 		msleep(5);
 	}
 
+	smp_rmb();
+
 	return r;
 }
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

