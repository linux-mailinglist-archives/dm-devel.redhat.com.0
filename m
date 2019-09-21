Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471CB9FF8
	for <lists+dm-devel@lfdr.de>; Sun, 22 Sep 2019 01:41:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5427D307D8B9;
	Sat, 21 Sep 2019 23:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4084600D1;
	Sat, 21 Sep 2019 23:41:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F395B18005A0;
	Sat, 21 Sep 2019 23:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8LNelt2007792 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 21 Sep 2019 19:40:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81943196AE; Sat, 21 Sep 2019 23:40:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B5DC19C78
	for <dm-devel@redhat.com>; Sat, 21 Sep 2019 23:40:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE3D13082135
	for <dm-devel@redhat.com>; Sat, 21 Sep 2019 23:40:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y135so12170907wmc.1
	for <dm-devel@redhat.com>; Sat, 21 Sep 2019 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2IjBRTOHV19E+KQg+iN2/eBf0xsM70/GvNMBPO7oP0c=;
	b=X1TBaPjIHwiX9/F1rfEbxc9NrAPWSmKmHaR9yyW/JZY8lbA1Kv/ByLtyHv23OR6yF0
	ywLRMYa00wmc244wIs4yzUhBvcrKSIkyaqz0as7ra+LStba9gBRQ2CdoCtHnDu3aMMdV
	ujRKdJq8C8WE9e/gvc67IuiGfckgWzZu8Hs9fb4v6w0F6rlqQYhTDNOZDn0gd894+hWy
	mUzh/v7t/1yOqlli6gR/gW50ShznA2HuuVPHsyf9L9ZemV6JGBw6gr4Mfp7fP1J4JUJV
	S3E7G4UJiZ2CMNt8x63fyjFiEV8gnKLc+Tt6E1lHrXux+BHnKOkNeRiVe+FAHhNlzlbL
	uexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2IjBRTOHV19E+KQg+iN2/eBf0xsM70/GvNMBPO7oP0c=;
	b=ItB0a5goLWcxJgmZ33qptD8tnt3c8vskLLwxAT40mKQuf8FIpzfx+iVOKZo6CDeunZ
	lUH1LiVgn/InLvHqOcG4QrxFNdntQSKsBXaExMaNz7jZQLJbaukoXGEIHvm02FVj1JzR
	C89tV7MFfy90pFGVrbbpoJnHvt27cCmkujoU1k/05ApvHype4321W+RRyE1EWdW8QrRG
	ySl542McnBnGTzFZkyVjlfFL+3+XN4yUCkwxrFVg+TLpBolJdn4ex0zGAN/2GKv+xLYC
	/KoKHNtkvSjtJwwdxFV+7BAm9+JH2dwLzmbI2YtSNUmG0UkqJYYn0Z+lpNspHLh4CX6p
	PNBQ==
X-Gm-Message-State: APjAAAXqOZSm1puxSQcCfZlOJzR/z50WY6tYyia5NB87Q/3URf2Pey/J
	TCNig8jKBTPorW8VwtWCyA==
X-Google-Smtp-Source: APXvYqyGtNL1XqTOXz2jJL2oGI+axBkdbjgI9ODCJJdXQvej5iUZADLS1JnwIdiNRcoZAHJ2YZyqQg==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr8390019wme.152.1569109241455; 
	Sat, 21 Sep 2019 16:40:41 -0700 (PDT)
Received: from localhost (126.red-83-37-181.dynamicip.rima-tde.net.
	[83.37.181.126]) by smtp.gmail.com with ESMTPSA id
	c18sm5475634wrv.10.2019.09.21.16.40.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 21 Sep 2019 16:40:40 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Sun, 22 Sep 2019 01:40:39 +0200
Message-Id: <20190921234039.26515-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 21 Sep 2019 23:40:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 21 Sep 2019 23:40:43 +0000 (UTC) for IP:'209.85.128.48'
	DOMAIN:'mail-wm1-f48.google.com' HELO:'mail-wm1-f48.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.48 mail-wm1-f48.google.com 209.85.128.48
	mail-wm1-f48.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: cosmetic changes in hwtable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 21 Sep 2019 23:41:28 +0000 (UTC)

Tegile IntelliFlash was acquired by DDN, from WD.

HPE Primera is also identified as 3PARdata/VV

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index a06872e..7a8f276 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -107,7 +107,7 @@ static struct hwentry default_hw[] = {
 	 * HPE
 	 */
 	{
-		/* 3PAR */
+		/* 3PAR / Primera */
 		.vendor        = "3PARdata",
 		.product       = "VV",
 		.pgpolicy      = GROUP_BY_PRIO,
@@ -311,6 +311,16 @@ static struct hwentry default_hw[] = {
 		.pgpolicy      = GROUP_BY_SERIAL,
 		.no_path_retry = 30,
 	},
+	{
+		/* Tegile IntelliFlash */
+		.vendor        = "TEGILE",
+		.product       = "(ZEBI-(FC|ISCSI)|INTELLIFLASH)",
+		.hwhandler     = "1 alua",
+		.pgpolicy      = GROUP_BY_PRIO,
+		.pgfailback    = -FAILBACK_IMMEDIATE,
+		.prio_name     = PRIO_ALUA,
+		.no_path_retry = 10,
+	},
 	/*
 	 * Dell EMC
 	 */
@@ -1074,19 +1084,6 @@ static struct hwentry default_hw[] = {
 		.product       = "K2",
 		.pgpolicy      = MULTIBUS,
 	},
-	/*
-	 * Western Digital (Tegile Systems)
-	 */
-	{
-		/* IntelliFlash */
-		.vendor        = "TEGILE",
-		.product       = "(ZEBI-(FC|ISCSI)|INTELLIFLASH)",
-		.hwhandler     = "1 alua",
-		.pgpolicy      = GROUP_BY_PRIO,
-		.pgfailback    = -FAILBACK_IMMEDIATE,
-		.prio_name     = PRIO_ALUA,
-		.no_path_retry = 10,
-	},
 	/*
 	 * Imation/Nexsan
 	 */
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
