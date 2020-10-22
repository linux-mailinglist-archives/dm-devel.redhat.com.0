Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC33D296566
	for <lists+dm-devel@lfdr.de>; Thu, 22 Oct 2020 21:31:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-xUC4HsUmMa2S09qMo0OjMg-1; Thu, 22 Oct 2020 15:31:19 -0400
X-MC-Unique: xUC4HsUmMa2S09qMo0OjMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0220A1009E22;
	Thu, 22 Oct 2020 19:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA36E60BFA;
	Thu, 22 Oct 2020 19:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56338922F8;
	Thu, 22 Oct 2020 19:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09MJOtYK004109 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Oct 2020 15:24:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15DA9AFD45; Thu, 22 Oct 2020 19:24:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FE23E5B19
	for <dm-devel@redhat.com>; Thu, 22 Oct 2020 19:24:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE550811E95
	for <dm-devel@redhat.com>; Thu, 22 Oct 2020 19:24:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-5-vY97diOROUWyQLN_2dSkmQ-1; Thu, 22 Oct 2020 15:24:46 -0400
X-MC-Unique: vY97diOROUWyQLN_2dSkmQ-1
Received: by mail-wr1-f52.google.com with SMTP id h7so4380538wre.4;
	Thu, 22 Oct 2020 12:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yGV9tArgPYV278pbG+lGzLKJJhqX2TSNT0nwwIiWoLg=;
	b=KgRp3RacvXcWTrvezfHe30xjHyLKXM1ui+jK/MgipxmV0Sao0BB0xYHhrwO1rj6W6L
	1SGAGa+iAszNRxCjMQjyOpp/AY9399RRDFLKWD1PCBanrs+hv97vUEUdOdrkN5ccSbVY
	Xvmf2BMT/JAJ6VYko3Y4OLipsP0s6LrK6BTVNOydMvy/SpokGtThc1/oMZ6rjftSWr7B
	dwK1MfxTic5iay/QETOtJc0W+m6kPy+0XvzO9iBtA3x3uVo3sxW/m8C8jrPoalvXZ6D1
	F9MfCQgatGrut6mM7gKlEx9TR3B/XSsSdx3EpT2SkFHewHBV8NsP9pElfX9l/K33GWLX
	PypA==
X-Gm-Message-State: AOAM532XVTw6JIZhy/4jDqURqyZO5hyFf6+1rqRobZaayRsbLG54JzCi
	o+ADHYfFD7Se1g5Rr7rEHA==
X-Google-Smtp-Source: ABdhPJzrIu+bUCn+sldm/iy/LA2AYcj4miNXVIuP0BZILcmnKINHH8MvfM3vq72SvhJBvU1y2z4GPw==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr4204727wrt.171.1603394684644; 
	Thu, 22 Oct 2020 12:24:44 -0700 (PDT)
Received: from localhost (100.red-176-87-1.dynamicip.rima-tde.net.
	[176.87.1.100])
	by smtp.gmail.com with ESMTPSA id x3sm4904764wmi.45.2020.10.22.12.24.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Oct 2020 12:24:44 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Thu, 22 Oct 2020 21:24:39 +0200
Message-Id: <20201022192439.5527-2-xose.vazquez@gmail.com>
In-Reply-To: <20201022192439.5527-1-xose.vazquez@gmail.com>
References: <20201022192439.5527-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Martin Wilck <mwilck@suse.com>,
	DM-DEVEL ML <dm-devel@redhat.com>
Subject: [dm-devel] [PATCH 2/2] multipath-tools: replace leading spaces with
	tabs at LENOVO/DE_Series
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 43154dd0..f2778b71 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -729,26 +729,26 @@ static struct hwentry default_hw[] = {
 		.no_path_retry = (300 / DEFAULT_CHECKINT),
 		.prio_name     = PRIO_ALUA,
 	},
-        /*
-         * Lenovo
-         */
-        {
-                /*
+	/*
+	 * Lenovo
+	 */
+	{
+		/*
 		 * DE Series
 		 *
 		 * Maintainer: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
 		 */
-                .vendor        = "LENOVO",
-                .product       = "DE_Series",
-                .bl_product    = "Universal Xport",
-                .pgpolicy      = GROUP_BY_PRIO,
-                .checker_name  = RDAC,
-                .features      = "2 pg_init_retries 50",
-                .hwhandler     = "1 rdac",
-                .prio_name     = PRIO_RDAC,
-                .pgfailback    = -FAILBACK_IMMEDIATE,
-                .no_path_retry = 30,
-        },
+		.vendor        = "LENOVO",
+		.product       = "DE_Series",
+		.bl_product    = "Universal Xport",
+		.pgpolicy      = GROUP_BY_PRIO,
+		.checker_name  = RDAC,
+		.features      = "2 pg_init_retries 50",
+		.hwhandler     = "1 rdac",
+		.prio_name     = PRIO_RDAC,
+		.pgfailback    = -FAILBACK_IMMEDIATE,
+		.no_path_retry = 30,
+	},
 	/*
 	 * NetApp
 	 */
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

