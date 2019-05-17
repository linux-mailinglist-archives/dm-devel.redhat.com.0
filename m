Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2821B4E
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 18:16:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 635953004159;
	Fri, 17 May 2019 16:16:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 393245C1B5;
	Fri, 17 May 2019 16:16:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99C1A206D3;
	Fri, 17 May 2019 16:16:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HGEM15030080 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 12:14:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C43605C3FA; Fri, 17 May 2019 16:14:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0885C239;
	Fri, 17 May 2019 16:14:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4HGEIgw021231; 
	Fri, 17 May 2019 11:14:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4HGEIhZ021230;
	Fri, 17 May 2019 11:14:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 17 May 2019 11:14:10 -0500
Message-Id: <1558109650-21179-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
References: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 4/4] multipathd: handle NULL return from
	genhelp_handler
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 17 May 2019 16:16:39 +0000 (UTC)

parse_cmd() wasn't checking if genhelp_handler() returned NULL. It was simply
assuming that it got a string. On NULL, it now returns an error. Found by
Coverity.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/cli.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/multipathd/cli.c b/multipathd/cli.c
index ca176a99..17795b61 100644
--- a/multipathd/cli.c
+++ b/multipathd/cli.c
@@ -467,6 +467,8 @@ parse_cmd (char * cmd, char ** reply, int * len, void * data, int timeout )
 
 	if (r) {
 		*reply = genhelp_handler(cmd, r);
+		if (*reply == NULL)
+			return EINVAL;
 		*len = strlen(*reply) + 1;
 		return 0;
 	}
@@ -474,9 +476,11 @@ parse_cmd (char * cmd, char ** reply, int * len, void * data, int timeout )
 	h = find_handler(fingerprint(cmdvec));
 
 	if (!h || !h->fn) {
+		free_keys(cmdvec);
 		*reply = genhelp_handler(cmd, EINVAL);
+		if (*reply == NULL)
+			return EINVAL;
 		*len = strlen(*reply) + 1;
-		free_keys(cmdvec);
 		return 0;
 	}
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
