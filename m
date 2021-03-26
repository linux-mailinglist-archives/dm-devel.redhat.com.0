Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B2B1C34A017
	for <lists+dm-devel@lfdr.de>; Fri, 26 Mar 2021 04:11:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-yiNOlgN8OLyiAx6I3OGscg-1; Thu, 25 Mar 2021 23:11:45 -0400
X-MC-Unique: yiNOlgN8OLyiAx6I3OGscg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3094C8710F4;
	Fri, 26 Mar 2021 03:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDBB436807;
	Fri, 26 Mar 2021 03:11:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9735E4BB7C;
	Fri, 26 Mar 2021 03:11:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q38fkr000887 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 23:08:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 790D920E1D81; Fri, 26 Mar 2021 03:08:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737DE20E1D80
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 03:08:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F37885A5BD
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 03:08:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-pK_KHhypNLmE4lv6JdE55Q-1; Thu, 25 Mar 2021 23:08:33 -0400
X-MC-Unique: pK_KHhypNLmE4lv6JdE55Q-1
Received: by mail-wr1-f50.google.com with SMTP id e18so4243068wrt.6;
	Thu, 25 Mar 2021 20:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=58DqbXdHrdpfnAvo2vNLkmRbPffLv2Llay7Jinc0/vM=;
	b=UrywmVfT8U7RPUXnTRCLl0VxHRX5CgCLh5wrzUqetYQD74kAnX+5ndVg+7lc9hKMhi
	+pAI9immII9KlzT45xdVRYh3SroIwydIMIcRZnSYM7eTeBzsol8yyC5BIl+HZ1GGPX21
	0zOB618aNQQC7RM776uS1XOfAtzB2SKr9QCPQEye4/Sgs2RhadOYjFQdAFLL3bUa4AYZ
	K6+UVA35QNZQeqsVE/MPdm30JOhQyLOJKP1SVdVIM0eJiq7sv9AirkciykpOrF/cmn4t
	ixdHcD4UbjYoq+EiwsM2Jh+PrzDAuQg7UibslJoogp1tk0eLFDQqKEpWXz9BI6u7ojrZ
	V+qA==
X-Gm-Message-State: AOAM530I9WbE/38gkfXT+MgooLVjdHSsIF/nRKpjHx6FGwRA4/KIT059
	xiiFG9I0soZuwLpMEijK7EOo+XEdWNe+
X-Google-Smtp-Source: ABdhPJwW29yxVJzYX8QbHqyB4H69rR+P+kN71o395iKc5IMkqfTc7hZfK1I8LR2/PDLj/XHAFxQWOw==
X-Received: by 2002:adf:de92:: with SMTP id w18mr11881188wrl.217.1616728112525;
	Thu, 25 Mar 2021 20:08:32 -0700 (PDT)
Received: from localhost (220.red-83-38-250.dynamicip.rima-tde.net.
	[83.38.250.220]) by smtp.gmail.com with ESMTPSA id
	l8sm10232642wrx.83.2021.03.25.20.08.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Mar 2021 20:08:32 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Fri, 26 Mar 2021 04:08:30 +0100
Message-Id: <20210326030830.15403-1-xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Zou Ming <zouming.zouming@huawei.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>,
	DM-DEVEL ML <dm-devel@redhat.com>, Zhouweigang <zhouweigang09@huawei.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2] multipath-tools: add NVME/Huawei-XSG1 to
	hwtable
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Info from: https://download.huawei.com/edownload/e/download.do?actionFlag=download&nid=EDOC1100154490&partNo=6001&mid=SUPE_DOC&_t=1612885603000

Cc: Zhouweigang (Jack) <zhouweigang09@huawei.com>
Cc: Zou Ming <zouming.zouming@huawei.com>
Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
v2: add Signed-off-by: and Cc: Zhouweigang
---
 libmultipath/hwtable.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 58fa7387..7923abba 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -1084,6 +1084,15 @@ static struct hwentry default_hw[] = {
 		.pgpolicy      = GROUP_BY_PRIO,
 		.prio_name     = PRIO_ALUA,
 	},
+	{
+		/* OceanStor NVMe */
+		.vendor        = "NVME",
+		.product       = "Huawei-XSG1",
+		.pgpolicy      = MULTIBUS,
+		.checker_name  = DIRECTIO,
+		.retain_hwhandler = RETAIN_HWHANDLER_OFF,
+		.no_path_retry = 12,
+	},
 	/*
 	 * Kove
 	 */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

