Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 14EE233EEA1
	for <lists+dm-devel@lfdr.de>; Wed, 17 Mar 2021 11:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615978057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Dsn6e+XLcsuNtddBuJ0H4UxTSn4ctwf5ILMVRIAcyg=;
	b=h3mwtIViVp5nM5Xcogdd1HjH2Z42icXsm3O2rgSnl15iwKyT517p1a8aIekGrQMR+5iT+G
	yinCKWHg0K08aEShja1rA7tn7hC5dT+EG6vbMHRFCQiR3x5gTHhjr2BKnBmopDPd1SW0aG
	ToxeB8ZvDs88z2ODv4thA3CrNJzRXz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-OvZwSLM1PGOAMgEy5j9lgA-1; Wed, 17 Mar 2021 06:47:35 -0400
X-MC-Unique: OvZwSLM1PGOAMgEy5j9lgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 917C785EE8B;
	Wed, 17 Mar 2021 10:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 857AA10016F8;
	Wed, 17 Mar 2021 10:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01F664BB7C;
	Wed, 17 Mar 2021 10:47:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12HAkviG020620 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 06:46:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAC965D74F; Wed, 17 Mar 2021 10:46:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A6C62A6F;
	Wed, 17 Mar 2021 10:46:50 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 12HAkn5g000602; Wed, 17 Mar 2021 06:46:49 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 12HAknhv000598; Wed, 17 Mar 2021 06:46:49 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 17 Mar 2021 06:46:49 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <alpine.LRH.2.02.2103170644080.32577@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, ming.lei@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: [dm-devel] [PATCH] block: remove the "detected capacity change"
	message
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Every time a new device mapper device is created, a message "detected
capacity change from 0 to 2097152" is reported. This message is useless,
so this patch removes it.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 block/genhd.c |    3 ---
 1 file changed, 3 deletions(-)

Index: linux-2.6/block/genhd.c
===================================================================
--- linux-2.6.orig/block/genhd.c	2021-03-17 11:03:52.000000000 +0100
+++ linux-2.6/block/genhd.c	2021-03-17 11:04:27.000000000 +0100
@@ -72,9 +72,6 @@ bool set_capacity_and_notify(struct gend
 	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
 		return false;
 
-	pr_info("%s: detected capacity change from %lld to %lld\n",
-		disk->disk_name, capacity, size);
-
 	/*
 	 * Historically we did not send a uevent for changes to/from an empty
 	 * device.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

