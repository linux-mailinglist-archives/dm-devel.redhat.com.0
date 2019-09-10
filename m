Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD1AF2FE
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 00:40:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D54155DB;
	Tue, 10 Sep 2019 22:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 806691001B0B;
	Tue, 10 Sep 2019 22:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FC90E204;
	Tue, 10 Sep 2019 22:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8AMdSNv030082 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Sep 2019 18:39:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBB3B5D6D0; Tue, 10 Sep 2019 22:39:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65B345D6C8;
	Tue, 10 Sep 2019 22:39:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8AMdPP5009389; 
	Tue, 10 Sep 2019 17:39:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8AMdOmG009388;
	Tue, 10 Sep 2019 17:39:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 10 Sep 2019 17:39:19 -0500
Message-Id: <1568155161-9343-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>, heyi <yi.he@dell.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] libmultipath: EMC PowerMax NVMe device config
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 10 Sep 2019 22:40:30 +0000 (UTC)

Got this config from Dell.

Cc: heyi <yi.he@dell.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/hwtable.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 96e8b25d..ca217e65 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -360,6 +360,12 @@ static struct hwentry default_hw[] = {
 		.pgfailback    = -FAILBACK_IMMEDIATE,
 		.no_path_retry = 30,
 	},
+	{
+		/* EMC PowerMax NVMe */
+		.vendor        = "NVME",
+		.product       = "^EMC PowerMax_",
+		.pgpolicy      = MULTIBUS,
+	},
 	/*
 	 * Fujitsu
 	 */
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
