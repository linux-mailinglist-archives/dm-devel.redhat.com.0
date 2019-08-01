Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC467E0F8
	for <lists+dm-devel@lfdr.de>; Thu,  1 Aug 2019 19:22:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 519B172650;
	Thu,  1 Aug 2019 17:22:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79355600C4;
	Thu,  1 Aug 2019 17:22:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AD3C1800204;
	Thu,  1 Aug 2019 17:22:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x71HLkUB026215 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 13:21:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B90DD60922; Thu,  1 Aug 2019 17:21:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E0A60A9F
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 17:21:44 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34B26C0BA43D
	for <dm-devel@redhat.com>; Thu,  1 Aug 2019 17:21:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p74so65384081wme.4
	for <dm-devel@redhat.com>; Thu, 01 Aug 2019 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WxJwqTt8HydAg98vEQk003SQkFZaA3kup5MLkOTXyiw=;
	b=qI18K7WG115vGb6UFMW2DPvdlg5Pd38yPD4cmWxGppXDZ0f9HvfTSG4F2mp2zxSSRx
	ikOVn8GfdTOyj6kS+FgYVnc464N/rx/fIGNsFjb4O7g3bbsV2pOAOMit6gteaRf6tYrx
	iedRCNiknjF/EzzUgIDISN1zoZmkbRnHhZ0MiRdxgywVF+iSe6oleXnTu1bBeEemc5rN
	s/STcn0o175c9Bc4UBz11iWW3PRIX/P0RUNJqLLSE1Ab0lsQqlNccSlta5qogRtGNoiU
	FG5PyaMRE+ZiSsU4VtxLWPqkwgaZY6xgCT7wlu+ClHhmcDN6B3/kiJuv8iaLnPMdMVUV
	MhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WxJwqTt8HydAg98vEQk003SQkFZaA3kup5MLkOTXyiw=;
	b=YSKZJQUMkYoqBypdzsJWSaE8YN0NFNfy2ZfS9Pk9MrThKVl+5ELjUHDHk1OZ+J5EMQ
	mrFgG83aab7XHiAmtvunkEWdDGMYSpbclUhMFDQGPvVC2z6bUcZp0XSTSRugWFEXnbnV
	TP8lP4dOWtlpR4CQQd53Ber0LxRur+t5xupytdulyAWXB6S/1ZlC0EloAyzM1xxSRaFE
	vSXQVVqppIZDQAkFUp78Pc9bym418PEUexiOda0adpn/tiSoZ4YFrEBOobQtYj6zLJVW
	uBYT53SdzFyJPqPi0fpBulyHeZAHOe7y7dd4k15Qap37rbqDzX320uVmThyJ5wSS/iPD
	MJgg==
X-Gm-Message-State: APjAAAVokooJReYiqtbTmELEWu4COrckDGpqZXjmL8tK2Wpbd/n1Z+yh
	6tKgqmad+v2C4QDQjQAGj92PvdQ=
X-Google-Smtp-Source: APXvYqz8J4Dh9FS44AQY5hiX77Il+zS15EQdk12mlCeGzZ7g3L/7kso3MbYjaKkIWsV99szsxw9oYA==
X-Received: by 2002:a1c:99c6:: with SMTP id
	b189mr108680770wme.57.1564680101499; 
	Thu, 01 Aug 2019 10:21:41 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	e19sm101114062wra.71.2019.08.01.10.21.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 10:21:40 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Thu,  1 Aug 2019 19:21:38 +0200
Message-Id: <20190801172138.15049-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 01 Aug 2019 17:21:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 01 Aug 2019 17:21:43 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Brian King <brking@linux.vnet.ibm.com>, DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: reorder NVDISK devices
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 01 Aug 2019 17:22:39 +0000 (UTC)

Otherwise "3303[ ]+NVDISK" is never reached, because "NVDISK" regex takes
priority over it.

Cc: Brian King <brking@linux.vnet.ibm.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index a06872e..8209554 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -696,12 +696,6 @@ static struct hwentry default_hw[] = {
 		.pgpolicy      = MULTIBUS,
 		.no_path_retry = (300 / DEFAULT_CHECKINT),
 	},
-	{
-		/* 3303 NVDISK */
-		.vendor        = "IBM",
-		.product       = "3303[ ]+NVDISK",
-		.no_path_retry = (300 / DEFAULT_CHECKINT),
-	},
 	{
 		/* AIX NVDISK */
 		.vendor        = "AIX",
@@ -712,6 +706,12 @@ static struct hwentry default_hw[] = {
 		.no_path_retry = (300 / DEFAULT_CHECKINT),
 		.prio_name     = PRIO_ALUA,
 	},
+	{
+		/* 3303 NVDISK */
+		.vendor        = "IBM",
+		.product       = "3303[ ]+NVDISK",
+		.no_path_retry = (300 / DEFAULT_CHECKINT),
+	},
         /*
          * Lenovo
          */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
