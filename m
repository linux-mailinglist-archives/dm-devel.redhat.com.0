Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F05E041B526
	for <lists+dm-devel@lfdr.de>; Tue, 28 Sep 2021 19:31:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-nhK6Rs55NrielDyV3_BKWQ-1; Tue, 28 Sep 2021 13:31:51 -0400
X-MC-Unique: nhK6Rs55NrielDyV3_BKWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A946A1084687;
	Tue, 28 Sep 2021 17:31:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F40D60C13;
	Tue, 28 Sep 2021 17:31:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B8391800B9E;
	Tue, 28 Sep 2021 17:31:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18SHVVgR026537 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Sep 2021 13:31:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59D271111C7D; Tue, 28 Sep 2021 17:31:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EB4100213D
	for <dm-devel@redhat.com>; Tue, 28 Sep 2021 17:31:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FA21963E27
	for <dm-devel@redhat.com>; Tue, 28 Sep 2021 17:31:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-ImTbcCkmMoyZPNL7TWe4lg-1; Tue, 28 Sep 2021 13:31:25 -0400
X-MC-Unique: ImTbcCkmMoyZPNL7TWe4lg-1
Received: by mail-wm1-f43.google.com with SMTP id
	f78-20020a1c1f51000000b0030cdb3d6079so3313743wmf.3; 
	Tue, 28 Sep 2021 10:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QWqST17dfuVLjv5UiS2md23yXzNpgd+WpUiC5Cp1o38=;
	b=B/TC449JNSEXXY+WRbntIlb013C++znkFJ+iCq1I3i3Xm7k0Dhvj+tecMvr8GOXeZk
	Gwg8kBXE0g2+q0c1rCxa4PVZavU/TFKvi+XepLgWy8uBZtygwMm7yS3MR0zXc54VxGiE
	4DJyq0oJZZGZPp48TC32NpZQGjSNpeSLYI3VM6NeketkVqR8gzH3Yfai6VaMZO33SZnc
	vpbjxLyeyDwjWbmk1wycgnaRz9BRxBxtLEgqSy8KXyHsI2oL2aa6fs5oYbrp0GzRSW05
	KHjzSLRpKCqPOWhVfGlHuiwILc9LR2vgyqFba47tUg+MmrxHYdTpppLr/Hk0PVGZHl5m
	kIsA==
X-Gm-Message-State: AOAM530nbw1nYldKS4ngyvCqgYAguv6YM4HlP4lL9zh+oS+rkhnECtSa
	wv4KW/SrSlMckfUGmWL3Gw==
X-Google-Smtp-Source: ABdhPJwbHVr8X5SwEBz1iP7DgUB/QDyH+/2PBf8FYfUETWqcHKbuOrhApw2xVaE2yQl8ZR+KOeHyjg==
X-Received: by 2002:a1c:94:: with SMTP id 142mr3649112wma.87.1632850283559;
	Tue, 28 Sep 2021 10:31:23 -0700 (PDT)
Received: from localhost ([90.160.137.52]) by smtp.gmail.com with ESMTPSA id
	f17sm10348096wrm.83.2021.09.28.10.31.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Sep 2021 10:31:22 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Tue, 28 Sep 2021 19:31:21 +0200
Message-Id: <20210928173121.18081-1-xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Martin Wilck <mwilck@suse.com>,
	DM-DEVEL ML <dm-devel@redhat.com>
Subject: [dm-devel] [PATCH] multipath-tools: make EMC/Invista config work
	with alua and multibus
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Optimal Path Management (OPM) was introduced with VPLEX 5.5 to improve VPLEX
performance. OPM uses the ALUA mechanism to spread the I/O load across VPLEX directors
while gaining cache locality, pag #187:
https://www.delltechnologies.com/en-us/collaterals/unauth/technical-guides-support-information/products/storage-2/docu5128.pdf

Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 7095aaf1..4e8b52ff 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -350,8 +350,9 @@ static struct hwentry default_hw[] = {
 		.vendor        = "EMC",
 		.product       = "Invista",
 		.bl_product    = "LUNZ",
-		.pgpolicy      = MULTIBUS,
+		.pgpolicy      = GROUP_BY_PRIO,
 		.no_path_retry = 5,
+		.pgfailback    = -FAILBACK_IMMEDIATE,
 	},
 	{
 		/* XtremIO */
-- 
2.32.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

