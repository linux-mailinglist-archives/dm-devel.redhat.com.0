Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E1F6198AE
	for <lists+dm-devel@lfdr.de>; Fri,  4 Nov 2022 15:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667570490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6r+9j3cMmEjSE2xb2DGOh6fDpTC0WRg5nEU3eenuzLc=;
	b=gjKWWZLDvUgu73Fdp+lyR3Akue7EDeTHyoH2tCSPXAe2l9WWMlCOjVIkfRb4Lwlo5ReYeX
	B1IEr2lSOuJ5N0d/9MiQCns7CeqJ8Qg/Z6zLkrqZ23Uu5lMt66mv/vSY4mTBhQK50EI9ww
	vfl2oNGvAFqIWmxwrDSlYUKsCh9sFZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-GTz-Cv33PvWw_ju3uvR4sA-1; Fri, 04 Nov 2022 10:01:28 -0400
X-MC-Unique: GTz-Cv33PvWw_ju3uvR4sA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC0B1857AB7;
	Fri,  4 Nov 2022 14:01:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EAB940C83EF;
	Fri,  4 Nov 2022 14:01:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 326401946A42;
	Fri,  4 Nov 2022 14:01:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BA651946586
 for <dm-devel@listman.corp.redhat.com>; Fri,  4 Nov 2022 14:01:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7F33420227AB; Fri,  4 Nov 2022 14:01:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DFB6202279C;
 Fri,  4 Nov 2022 14:01:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 2A4E1Mm8004026; Fri, 4 Nov 2022 10:01:22 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 2A4E1MYe004022; Fri, 4 Nov 2022 10:01:22 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Fri, 4 Nov 2022 10:01:22 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: NeilBrown <neilb@suse.de>, Jes Sorensen <jsorensen@fb.com>
Message-ID: <alpine.LRH.2.21.2211040957470.19553@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH] mdadm: fix compilation failure on the x32 ABI
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
Cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Guoqing Jiang <guoqing.jiang@linux.dev>, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

Here I'm sending a patch for the mdadm utility. It fixes compile failure 
on the x32 ABI.

Mikulas


From: Mikulas Patocka <mpatocka@redhat.com>

The x32 ABI has 32-bit long and 64-bit time_t. Consequently, it reports 
printf arguments mismatch when attempting to print time using the "%ld" 
format specifier.

Fix this by converting times to long long and using %lld when printing
them.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 monitor.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: mdadm/monitor.c
===================================================================
--- mdadm.orig/monitor.c	2022-11-04 14:25:52.000000000 +0100
+++ mdadm/monitor.c	2022-11-04 14:28:05.000000000 +0100
@@ -449,9 +449,9 @@ static int read_and_act(struct active_ar
 	}
 
 	gettimeofday(&tv, NULL);
-	dprintf("(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\n",
+	dprintf("(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%llu\n",
 		a->info.container_member,
-		tv.tv_sec, tv.tv_usec,
+		(long long)tv.tv_sec, (long long)tv.tv_usec,
 		array_states[a->curr_state],
 		array_states[a->prev_state],
 		sync_actions[a->curr_action],

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

