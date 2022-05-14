Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E129B527496
	for <lists+dm-devel@lfdr.de>; Sun, 15 May 2022 01:02:19 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-4nzLmn1fNxiWhO9FhFIfBQ-1; Sat, 14 May 2022 19:02:15 -0400
X-MC-Unique: 4nzLmn1fNxiWhO9FhFIfBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A69A833977;
	Sat, 14 May 2022 23:02:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F293240D2824;
	Sat, 14 May 2022 23:02:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD5831932116;
	Sat, 14 May 2022 23:02:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E02DF1947040
 for <dm-devel@listman.corp.redhat.com>; Sat, 14 May 2022 23:02:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CC92F15063E7; Sat, 14 May 2022 23:02:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B1414E2ECD
 for <dm-devel@redhat.com>; Sat, 14 May 2022 23:02:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1AE9101AA4D
 for <dm-devel@redhat.com>; Sat, 14 May 2022 23:02:10 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-HNckevgYN3CLeqxr6SVO5Q-2; Sat, 14 May 2022 19:02:09 -0400
X-MC-Unique: HNckevgYN3CLeqxr6SVO5Q-2
Received: by mail-wr1-f47.google.com with SMTP id u3so15965891wrg.3;
 Sat, 14 May 2022 16:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qm/cnd66PaGoj/wU7CI7n+pLIMxXL/+cOTSv/0ANInU=;
 b=CtfP4S9m8zVuljenYMnfdx0zHaaoV+WnNmFkkdQnPjSHdO9yi1b1SwK1TBauVYx2yq
 Bv56EiXeDMbcBN1nSR72EA2z9Jf8rjPXgC6sRrbfiZ7NFjSvqJ2gej/8BHgi+IZ/aBlR
 dKoZg/OYP3/27tMM1J0TIF7q7Ct/BIPvWXTtucN5ZVEw7pmnl2F3ymmuztLwEJslJjCk
 +BU+Vk0XbHnb4Fhq4W0PxVGxIheZ5sk3gURiq8DdxkXif4kVeAhXdz0gorG1WmnFHFa4
 bcUXTkQN1Bac+H7PN4EalW5NUcKXwxsd6WKzEBCzQbzuEuRmzQyStUaqaFcVWAqsm3Iq
 QtqQ==
X-Gm-Message-State: AOAM532FKfBkxHxMf9xIMTKn7ieKLtXN3DQwCOJqY9sWrAsZnZ7p0VsC
 beZtNXm7pH0TcaFKNslj1zayJpezn1rp
X-Google-Smtp-Source: ABdhPJzXeI9gf7llHndyYv8IUslU5rb1QZbzSsnqOvpgSgxj7KaZUmwrNl5JasA9PmlA8oC9wrhiFg==
X-Received: by 2002:a05:6000:793:b0:20c:7246:aa1 with SMTP id
 bu19-20020a056000079300b0020c72460aa1mr8814970wrb.38.1652569328291; 
 Sat, 14 May 2022 16:02:08 -0700 (PDT)
Received: from localhost (50.red-81-44-142.dynamicip.rima-tde.net.
 [81.44.142.50]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003942a244ecasm6262102wmi.15.2022.05.14.16.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 16:02:08 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Sun, 15 May 2022 01:01:48 +0200
Message-Id: <20220514230148.139675-10-xose.vazquez@gmail.com>
In-Reply-To: <20220514230148.139675-1-xose.vazquez@gmail.com>
References: <20220514230148.139675-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [dm-devel] [PATCH 9/9] multipath-tools: add Dell EMC PowerStore
 NVMe to hardware table
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Xose Vazquez Perez <xose.vazquez@gmail.com>, Martin Wilck <mwilck@suse.com>,
 DM-DEVEL ML <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Info from (page 46):
https://dl.dell.com/content/manual37523884-dell-emc-powerstore-host-configuration-guide.pdf

Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index bef1c8e5..47ea5d3d 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -403,6 +403,15 @@ static struct hwentry default_hw[] = {
 		.no_path_retry = 3,
 		.fast_io_fail  = 15,
 	},
+	{
+		/* PowerStore NVMe */
+		.vendor        = ".*",
+		.product       = "dellemc-powerstore",
+		.pgpolicy      = GROUP_BY_PRIO,
+		.prio_name     = PRIO_ANA,
+		.pgfailback    = -FAILBACK_IMMEDIATE,
+		.no_path_retry = 3,
+	},
 	{
 		/* PowerVault ME 4/5 families */
 		.vendor        = "DellEMC",
-- 
2.36.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

