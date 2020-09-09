Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F41AF2630E9
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 17:49:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-jcacle6NNa-BnynW-Z3Ebw-1; Wed, 09 Sep 2020 11:48:59 -0400
X-MC-Unique: jcacle6NNa-BnynW-Z3Ebw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD4298015A8;
	Wed,  9 Sep 2020 15:48:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106EA5D9E8;
	Wed,  9 Sep 2020 15:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 852C67A016;
	Wed,  9 Sep 2020 15:48:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089FmDgK026282 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 11:48:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8644B2156A23; Wed,  9 Sep 2020 15:48:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE612156A2D
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 15:48:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E27A8026DD
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 15:48:11 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-524-eMYUlqZgMCihqXJFdRPQpw-1; Wed, 09 Sep 2020 11:48:09 -0400
X-MC-Unique: eMYUlqZgMCihqXJFdRPQpw-1
Received: by mail-wm1-f67.google.com with SMTP id s13so2758513wmh.4
	for <dm-devel@redhat.com>; Wed, 09 Sep 2020 08:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j7pmaI4wh2JxUzlXZ5LHnNhat2WmB/i5NaHxSYBOBE4=;
	b=EovdrVUfoh6sH6jJzyaBJqn3EWtgUtKcLsfaKQXqsnrfHybU/Tt375rPY20vijGiPw
	4o3tWc9JVzAtJFSFpadVAsEsYOZRFf4Z3TSL4jZ0YljL+46tnV6IEZS4RfJ4SfBjiTn1
	HyJRFVKhY2bzKTRfOq6t1F8hMW2BjpLCyte7u+wWDtnLhSCzSIT0zwReH039Y54yisgu
	/S5hVRYWejvrhXxFhMpBZUiGfCaNl4jMj+4dps7T7aFE72IDnRjfDty1bcZLr+zkzfAg
	0EJzziNriMZp4j/NGVkd1uNj7jfCToLotOthbb8jHsSAqKJZ8CSjn6s7XmIgd1axNfDg
	7mcA==
X-Gm-Message-State: AOAM532ZGKwGduViyACyhEhnj423NGvJQKTaIKFAKzQ2ahW6XIRvwC3S
	M0PruEPt3d4lYQdeiTMd8A==
X-Google-Smtp-Source: ABdhPJxjmivZWImyrXKQg5JX6iHQSLqbPgRNUoTolyuMQ0DAkTuPAXEnY1hQBhQZcs+O589/dM+mog==
X-Received: by 2002:a1c:4886:: with SMTP id v128mr4193105wma.139.1599666487642;
	Wed, 09 Sep 2020 08:48:07 -0700 (PDT)
Received: from localhost (15.red-79-155-252.dynamicip.rima-tde.net.
	[79.155.252.15]) by smtp.gmail.com with ESMTPSA id
	f14sm4733101wrv.72.2020.09.09.08.48.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Sep 2020 08:48:06 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Wed,  9 Sep 2020 17:48:05 +0200
Message-Id: <20200909154805.8210-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipath-tools: add HPE MSA 1060/2060 to hwtable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cc: Martin Wilck <mwilck@suse.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index d1fcfdb3..55162e0e 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -181,9 +181,9 @@ static struct hwentry default_hw[] = {
 		.prio_name     = PRIO_ALUA,
 	},
 	{
-		/* MSA 1040, 1050, 2040 and 2050 families */
+		/* MSA 1040, 1050, 1060, 2040, 2050 and 2060 families */
 		.vendor        = "HP",
-		.product       = "MSA [12]0[45]0 SA[NS]",
+		.product       = "MSA [12]0[456]0 SA[NS]",
 		.pgpolicy      = GROUP_BY_PRIO,
 		.pgfailback    = -FAILBACK_IMMEDIATE,
 		.no_path_retry = 18,
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

