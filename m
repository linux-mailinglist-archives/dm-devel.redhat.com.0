Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239E77207
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 21:20:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ECE7308FBB1;
	Fri, 26 Jul 2019 19:20:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31CD5C6E2;
	Fri, 26 Jul 2019 19:20:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 543291800208;
	Fri, 26 Jul 2019 19:19:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6QJJjYb016763 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 15:19:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F5421711C; Fri, 26 Jul 2019 19:19:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A11A17109
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:43 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F99E756
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p74so48827918wme.4
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wY1lI0VynVhQjn2M/HCxy0ldCJfiwYeOhMxYPBVomv4=;
	b=iEhw0QF3TuTIqjgUrGWYwzCeo2cfraMUxNi60z8dohZgOwHO7hsfeoVKkjVW99gfaN
	o+CHH0HqIH9wDTkCoDdUc/jqmgUdxZ56ReWSuTD5LLUWhzYRNyxAqmOc6ItPlj9xAMjj
	wPYC/Z2spy6z6XPHVS6MSEUQNHaGAJwrcnvDsmHbVofhinZt9d0adcRuxeOVGQqvRMVc
	CSwV52FhlyCU6dmImAs0+OaCn1ZLUtnJexwScFUhYV5qGwC8Dds9EuhrMGJCosUsNosL
	PC7KXPYgHss3RHMEd4dznNJ7tRQVHH609zn7rTKXd4s+QHNZrDmOp25XLrov93B8tWYu
	7m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wY1lI0VynVhQjn2M/HCxy0ldCJfiwYeOhMxYPBVomv4=;
	b=aWYg1LG5fFNMTkpX0pKv+8B2aYISGhNVMqRcG0LpX2JVERT432unAKKVHolWLF8zj5
	hAcvR1W+TUpKhVXyjcu+l1YFRjnY/zq31gPt9a+RA54/zoxJCubdKE6MFh7WaNvUHDTa
	nT3Mnwp98wboWsTzLU/GNgrHEWGBRkL/45ECLfKq9BXz0CmIzWfr1Z3SworEeBcXxRKr
	MzEfHCXOXRFGrewN53wA0egAka/KKz5okqtZiCmwkXPa6IyEFKvmSchHDjjNBstXssmw
	vsJk70g52kt1XIumP4PpnENvi961ybGAI7kR7lZxULEAesSNujqptHXZcDOAancwZd0C
	t71g==
X-Gm-Message-State: APjAAAVwRHd8espBGrFmbMtxa5sEuBIH/MiZQe6+YoQb74V/O5c8NMaX
	HH91GcZdw8X7Z4KBLZouJQ==
X-Google-Smtp-Source: APXvYqygqMjbNl+eVsA04KWKmjI4bP4EIDIvc9HL0Mxw/NV8+9q87R8KdOI2WBZxuN/Y4dRKWz4ZSQ==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr84048851wmj.94.1564168780470; 
	Fri, 26 Jul 2019 12:19:40 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	h133sm58776336wme.28.2019.07.26.12.19.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 12:19:40 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Fri, 26 Jul 2019 21:19:30 +0200
Message-Id: <20190726191930.23630-3-xose.vazquez@gmail.com>
In-Reply-To: <20190726191930.23630-1-xose.vazquez@gmail.com>
References: <20190726191930.23630-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 26 Jul 2019 19:19:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Fri, 26 Jul 2019 19:19:42 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Yacine Kheddache <yacine@alyseo.com>, DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: reorder vendor in hwtable
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 26 Jul 2019 19:20:24 +0000 (UTC)

Nexenta was acquired by DDN.

Cc: Yacine Kheddache <yacine@alyseo.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 96e8b25..a06872e 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -300,6 +300,17 @@ static struct hwentry default_hw[] = {
 		.prio_name     = PRIO_ALUA,
 		.no_path_retry = 30,
 	},
+	{
+		/*
+		 * Nexenta COMSTAR
+		 *
+		 * Maintainer: Yacine Kheddache <yacine@alyseo.com>
+		 */
+		.vendor        = "NEXENTA",
+		.product       = "COMSTAR",
+		.pgpolicy      = GROUP_BY_SERIAL,
+		.no_path_retry = 30,
+	},
 	/*
 	 * Dell EMC
 	 */
@@ -780,18 +791,6 @@ static struct hwentry default_hw[] = {
 		.pgpolicy      = MULTIBUS,
 		.no_path_retry = NO_PATH_RETRY_QUEUE,
 	},
-	/*
-	 * Nexenta
-	 *
-	 * Maintainer: Yacine Kheddache <yacine@alyseo.com>
-	 */
-	{
-		/* COMSTAR */
-		.vendor        = "NEXENTA",
-		.product       = "COMSTAR",
-		.pgpolicy      = GROUP_BY_SERIAL,
-		.no_path_retry = 30,
-	},
 	/*
 	 * NEC
 	 */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
