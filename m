Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A3B22E
	for <lists+dm-devel@lfdr.de>; Sat, 27 Apr 2019 03:31:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE6F951F1B;
	Sat, 27 Apr 2019 01:31:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B7E1001E6F;
	Sat, 27 Apr 2019 01:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F209181AC90;
	Sat, 27 Apr 2019 01:31:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3R1UsZv026067 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Apr 2019 21:30:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 158A32CAFE; Sat, 27 Apr 2019 01:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4F45C21F
	for <dm-devel@redhat.com>; Sat, 27 Apr 2019 01:30:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F1534EA5F
	for <dm-devel@redhat.com>; Sat, 27 Apr 2019 01:30:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y5so5833581wma.2
	for <dm-devel@redhat.com>; Fri, 26 Apr 2019 18:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4yH/P7qENGX7YZ/Nj2dBAS089bFjee6lt3T+zZS74k=;
	b=Jue81+8DDI8TNStsI/ULnQCB9Pdv3e5554cYSn08LJmRuqSgnHFXDXrg3iH0076sXB
	nCzEzvngXOmaSYInkEAxK6AIAEDNOpKU0SBvLYtDuWugfja85JAY5nmbL4i6oIud37tN
	xrovAeHTVa5dM6rbjXqAYno/O7t9YCR1qkiQjxHDvrquwX3p+z26WGF56VjrTvHCkv19
	zFmU/CEsv2/Cer0zU667mb8O5j1Bh3a0BGxIt38u/kelmOa3ygUKYoRfHIiOrmeW9/gJ
	ByKFhW8b4oYlB5T+jHCkKCrb10YxlCGdC9PGgZuMXp7smbc1lOeWgYhVgsiOuoOu9GeO
	mr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4yH/P7qENGX7YZ/Nj2dBAS089bFjee6lt3T+zZS74k=;
	b=O69dh6NrwsiQW3Cgry6rHE8s/Kaw6egT7UUkaiQJdh6HukBMUtItWdHbaX0M5ZDkeV
	1PO5wD23NaQWTaP9ipKLR2UnQmJsuEqOy18rIsrUgV6rVz7LySp/SPS4/QN9LAwLwH0+
	KHycoVbMcoBHCRHiFLRzCSYNk81BF8TDoJtPlJDbjPFZdvq2PftLpwRtuR6nzrWEGcWH
	PXu1glbyQbarmuzYxQpyniJ3H1t167whwferAKM1zo0bxLtGxn7yiG/PawnSYkB8v85h
	Otv+/Vun1cNwF5fLEQ1W4V8ORdEUUZZFOuJd8d1H/dwCde4KGPio40Y98sSPCFt9k9yZ
	pChg==
X-Gm-Message-State: APjAAAXhO7XNBqk1zvnqlLpu6FRC3fJhl4CHXhGYWXIkNxzRl/b2kHwy
	u/zEyaJg7jVeu4CuYtIZGiaUqMQ=
X-Google-Smtp-Source: APXvYqw1Jw3dSFi0Y2T6Owo73S0ybQzzhHnE5eM21CwSJo4nS4xmrBsliK2+imtqN3WzQWGyZdhz2g==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr10460536wmk.18.1556328647837; 
	Fri, 26 Apr 2019 18:30:47 -0700 (PDT)
Received: from localhost (101.red-83-33-153.dynamicip.rima-tde.net.
	[83.33.153.101]) by smtp.gmail.com with ESMTPSA id
	s18sm26811224wmc.41.2019.04.26.18.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 18:30:47 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Sat, 27 Apr 2019 03:30:45 +0200
Message-Id: <20190427013045.14487-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 27 Apr 2019 01:30:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sat, 27 Apr 2019 01:30:49 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: document missing kpartx options
	in man and output
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Sat, 27 Apr 2019 01:31:20 +0000 (UTC)

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 kpartx/Makefile | 2 +-
 kpartx/kpartx.8 | 8 ++++++--
 kpartx/kpartx.c | 7 +++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/kpartx/Makefile b/kpartx/Makefile
index 7eb467e..2906a98 100644
--- a/kpartx/Makefile
+++ b/kpartx/Makefile
@@ -3,7 +3,7 @@
 #
 include ../Makefile.inc
 
-CFLAGS += $(BIN_CFLAGS) -I. -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+CFLAGS += $(BIN_CFLAGS) -I. -I$(multipathdir) -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 LDFLAGS += $(BIN_LDFLAGS)
 
 LIBDEPS += -ldevmapper
diff --git a/kpartx/kpartx.8 b/kpartx/kpartx.8
index ba58acb..08bb349 100644
--- a/kpartx/kpartx.8
+++ b/kpartx/kpartx.8
@@ -25,7 +25,7 @@ kpartx \- Create device maps from partition tables.
 .RB [\| \-p \|]
 .RB [\| \-f \|]
 .RB [\| \-g \|]
-.RB [\| \-s \|]
+.RB [\| \-s | \-n \|]
 .RB [\| \-v \|]
 .B wholedisk
 .
@@ -77,7 +77,11 @@ Force GUID partition table (GPT).
 .
 .TP
 .B \-s
-Sync mode. Don't return until the partitions are created.
+Sync mode (Default). Don't return until the partitions are created.
+.
+.TP
+.B \-n
+Nosync mode. Return before the partitions are created.
 .
 .TP
 .B \-v
diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
index d4fb53b..d3620c5 100644
--- a/kpartx/kpartx.c
+++ b/kpartx/kpartx.c
@@ -37,6 +37,7 @@
 #include "crc32.h"
 #include "lopart.h"
 #include "kpartx.h"
+#include "version.h"
 
 #define SIZE(a) (sizeof(a)/sizeof((a)[0]))
 
@@ -95,7 +96,9 @@ int force_devmap=0;
 
 static int
 usage(void) {
-	printf("usage : kpartx [-a|-d|-l] [-f] [-v] wholedisk\n");
+	printf(VERSION_STRING);
+	printf("Usage:\n");
+	printf("  kpartx [-a|-d|-u|-l] [-r] [-p] [-f] [-g] [-s|-n] [-v] wholedisk\n");
 	printf("\t-a add partition devmappings\n");
 	printf("\t-r devmappings will be readonly\n");
 	printf("\t-d del partition devmappings\n");
@@ -106,7 +109,7 @@ usage(void) {
 	printf("\t-f force devmap create\n");
 	printf("\t-v verbose\n");
 	printf("\t-n nosync mode. Return before the partitions are created\n");
-	printf("\t-s sync mode. Don't return until the partitions are created. Default.\n");
+	printf("\t-s sync mode (Default). Don't return until the partitions are created\n");
 	return 1;
 }
 
-- 
2.21.0-Tranquilo majete

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
