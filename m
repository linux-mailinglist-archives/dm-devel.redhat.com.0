Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8DB1228B
	for <lists+dm-devel@lfdr.de>; Thu,  2 May 2019 21:24:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EEDCD7F746;
	Thu,  2 May 2019 19:24:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006235C1B4;
	Thu,  2 May 2019 19:24:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26C6C41F3D;
	Thu,  2 May 2019 19:24:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x42JOFhk017635 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 May 2019 15:24:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A443C19C58; Thu,  2 May 2019 19:24:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED7719C4F
	for <dm-devel@redhat.com>; Thu,  2 May 2019 19:24:13 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81412859FF
	for <dm-devel@redhat.com>; Thu,  2 May 2019 19:24:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q15so4392016wmf.3
	for <dm-devel@redhat.com>; Thu, 02 May 2019 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M4A8XwpjEWfOAWIujAxyFlnP2hspj+YW8Pinn8arfT8=;
	b=aoTJW6q/x/l5zHd8R8ZawSgUBXI5kYrLmiVV16Oid7DuScANZF79GW5GJcKIv4SADK
	ygfn+WEhw7X6ByAuUJeveo72mOvDqUAjM6E3v03FLBIctmOi0xauCUqoCSOFrp5oHxCB
	d4op4VkA8DNVV9tYuAKKECyTsd+jw8j4TPoR+M9MqnvFhAT3cxaTgkW/4Vj0SGkoRrSd
	WG/ci0RMdRh5NoNXjxiY9sSMLgyV3UO7fxE+sQPGV2rNsBIvzgvIGBGNyEL8h4xgBDMT
	AO7AzHR7dBPsDH24JZh/LkCvqDAwzYhasBk33ctB0I9I9SetqDA8j/Lr3bVk8tnfOpL7
	Ra6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M4A8XwpjEWfOAWIujAxyFlnP2hspj+YW8Pinn8arfT8=;
	b=lE58w750lpzbQN+ZXa18ccRPS8GEwv4+RZVb90dsZsE7oLal24BHh2ARqIEJdTZs3y
	//egKGnHb9441Z6pI/HrI5HIRRLGFt9P2wkFFG79YDErpGII7bbqWye9sBwMguiqLOmr
	PlOu8EfMbRfwbJWYnsPKYz8QWTtJFSW4Vn+eofDPOuB5Z911Dg36Eou1YxWHvCBnCFCa
	9TgPr/B50LfFq6jS5MCRzPSQzLcLVvRQL99yD+h7+PYYW9E2WnLl3bKtstE9N0PVrvNR
	tYiaT9rk7SXlbOByPjQEmJTZh8tB+ROcqI/+gs4G3GyZOE+zVa/3UV2IXKiSU0F+pbMH
	2Q1Q==
X-Gm-Message-State: APjAAAUr2Qv2aj7d6rY1MHvZQCVwvPGQoKR4xLzFj3IzRVqk21wYn8gW
	H+UQkVsCitgvb9wbcD5MbEcw8Jw=
X-Google-Smtp-Source: APXvYqxtxExSjHKfN5C08GaVIIftPDbLuC9qDBAA681sX3DiKPzEewjcnWA6FUNuG/WRf9JSvwxqBg==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3785471wmj.45.1556825050069;
	Thu, 02 May 2019 12:24:10 -0700 (PDT)
Received: from localhost (101.red-83-33-153.dynamicip.rima-tde.net.
	[83.33.153.101])
	by smtp.gmail.com with ESMTPSA id z9sm52451wma.39.2019.05.02.12.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 12:24:09 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Thu,  2 May 2019 21:24:08 +0200
Message-Id: <20190502192408.31187-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 02 May 2019 19:24:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 02 May 2019 19:24:12 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: document missing multipath
	flags in help output
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 02 May 2019 19:24:41 +0000 (UTC)

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipath/main.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 008e3d3..252ade7 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -133,11 +133,15 @@ usage (char * progname)
 {
 	fprintf (stderr, VERSION_STRING);
 	fprintf (stderr, "Usage:\n");
-	fprintf (stderr, "  %s [-a|-c|-w|-W] [-d] [-r] [-i] [-v lvl] [-p pol] [-b fil] [-q] [dev]\n", progname);
-	fprintf (stderr, "  %s -l|-ll|-f [-v lvl] [-b fil] [-R num] [dev]\n", progname);
-	fprintf (stderr, "  %s -F [-v lvl] [-R num]\n", progname);
-	fprintf (stderr, "  %s [-t|-T]\n", progname);
-	fprintf (stderr, "  %s -h\n", progname);
+	fprintf (stderr, "  %s [-v level] [-B|-d|-i|-q|-r] [-b file] [-p policy] [device]\n", progname);
+	fprintf (stderr, "  %s [-v level] [-R retries] -f device\n", progname);
+	fprintf (stderr, "  %s [-v level] [-R retries] -F\n", progname);
+	fprintf (stderr, "  %s [-v level] [-l|-ll] [device]\n", progname);
+	fprintf (stderr, "  %s [-v level] [-a|-w] device\n", progname);
+	fprintf (stderr, "  %s [-v level] -W\n", progname);
+	fprintf (stderr, "  %s [-v level] [-i] [-c|-C] device\n", progname);
+	fprintf (stderr, "  %s [-v level] [-i] [-u|-U]\n", progname);
+	fprintf (stderr, "  %s [-h|-t|-T]\n", progname);
 	fprintf (stderr,
 		"\n"
 		"Where:\n"
@@ -159,23 +163,28 @@ usage (char * progname)
 		"  -b fil  bindings file location\n"
 		"  -w      remove a device from the wwids file\n"
 		"  -W      reset the wwids file include only the current devices\n"
-		"  -p pol  force all maps to specified path grouping policy :\n"
+		"  -R num  number of times to retry removes of in-use devices\n"
+		"  -u      check if the device specified in the program environment should be a\n"
+		"          path in a multipath device\n"
+		"  -U      check if the device specified in the program environment is a\n"
+		"          multipath device with usable paths, see -C flag\n"
+		"  -p pol  force all maps to specified path grouping policy:\n"
 		"          . failover            one path per priority group\n"
 		"          . multibus            all paths in one priority group\n"
 		"          . group_by_serial     one priority group per serial\n"
 		"          . group_by_prio       one priority group per priority lvl\n"
 		"          . group_by_node_name  one priority group per target node\n"
-		"  -v lvl  verbosity level\n"
+		"  -v lvl  verbosity level:\n"
 		"          . 0 no output\n"
 		"          . 1 print created devmap names only\n"
 		"          . 2 default verbosity\n"
 		"          . 3 print debug information\n"
-		"  -R num  number of times to retry removes of in-use devices\n"
-		"  dev     action limited to:\n"
-		"          . multipath named 'dev' (ex: mpath0) or\n"
-		"          . multipath whose wwid is 'dev' (ex: 60051..)\n"
-		"          . multipath including the path named 'dev' (ex: /dev/sda)\n"
-		"          . multipath including the path with maj:min 'dev' (ex: 8:0)\n"
+		"  device  action limited to:\n"
+		"          . multipath named 'device' (ex: mpath0)\n"
+		"          . multipath whose wwid is 'device' (ex: 60051...)\n"
+		"          . multipath including the path named 'device' (ex: /dev/sda or\n"
+		"            /dev/dm-0)\n"
+		"          . multipath including the path with maj:min 'device' (ex: 8:0)\n"
 		);
 
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
