Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6822AD69E
	for <lists+dm-devel@lfdr.de>; Tue, 10 Nov 2020 13:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605012330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iIWRC3sNUVaOxqIxFwW1zd5E/8+6oHwJd5QLSZgi7aY=;
	b=hiZmaG0rJ7jVInAP1105uWcWhu0dPOMquAEkV+Q+DLimrSCRKfiJXgvMJGqm4f7lign9J7
	bLQBJ6FLCrN8RwUlLM+NI44wMYWZPPCnFMloQTKQfwNpKrEHxFPWwqSWPQT714gwFvhqit
	QIvV+br5QQE64SUP56lyZeysiTZa3Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-DjDKIwuROIKP7rexZVq_8g-1; Tue, 10 Nov 2020 07:45:28 -0500
X-MC-Unique: DjDKIwuROIKP7rexZVq_8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0369801FDF;
	Tue, 10 Nov 2020 12:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4897D3C89;
	Tue, 10 Nov 2020 12:45:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7700C58100;
	Tue, 10 Nov 2020 12:45:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AACjHXK026836 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 07:45:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 618EE6EF78; Tue, 10 Nov 2020 12:45:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B266EF48;
	Tue, 10 Nov 2020 12:45:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AACjDJH002510; Tue, 10 Nov 2020 07:45:13 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AACjDHu002506; Tue, 10 Nov 2020 07:45:13 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 10 Nov 2020 07:45:13 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>, 
	Corey Marthaler <cmarthal@redhat.com>
Message-ID: <alpine.LRH.2.02.2011100744020.19628@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm writecache: fix the maximum number of
	arguments
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Advance the maximum number of arguments to 16.

This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1895117

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 48debafe4f2f ("dm: add writecache target")
Cc: stable@vger.kernel.org	# v4.18+

---
 drivers/md/dm-writecache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-10-29 12:20:47.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-11-10 11:09:47.000000000 +0100
@@ -2041,7 +2041,7 @@ static int writecache_ctr(struct dm_targ
 	struct wc_memory_superblock s;
 
 	static struct dm_arg _args[] = {
-		{0, 10, "Invalid number of feature args"},
+		{0, 16, "Invalid number of feature args"},
 	};
 
 	as.argc = argc;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

