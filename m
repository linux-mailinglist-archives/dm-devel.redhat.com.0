Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6B45157F2
	for <lists+dm-devel@lfdr.de>; Sat, 30 Apr 2022 00:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651270165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GD4jOgqBFZsrg07tG2mS4a/DosK2WXOIn2ORMKlBf7g=;
	b=E/A5+UiVaSNhKUKsXaNwLDbVOfarzidiLpNyHNYJn6Jx9TvNIVISJwmI/QCxzePTk5yaVh
	whvpXUsLA4ny23rdUSR+susuLjlye8sJHlgCHZ80Ud+hZ/9Ek23z+pQcL7LXPtMxwsUftr
	TUtbvdgCs29OpWQYRsGh8oLo+DXrbVk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-drCXELHGOyiY8crHkr6WuQ-1; Fri, 29 Apr 2022 18:09:23 -0400
X-MC-Unique: drCXELHGOyiY8crHkr6WuQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0FFA1C068C3;
	Fri, 29 Apr 2022 22:09:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 346A8416157;
	Fri, 29 Apr 2022 22:09:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 23C18194705F;
	Fri, 29 Apr 2022 22:09:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C1851947050
 for <dm-devel@listman.corp.redhat.com>; Fri, 29 Apr 2022 22:09:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0841C145BA68; Fri, 29 Apr 2022 22:09:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC811140EBD5;
 Fri, 29 Apr 2022 22:09:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 23TM95KD029991;
 Fri, 29 Apr 2022 17:09:05 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 23TM9587029990;
 Fri, 29 Apr 2022 17:09:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 29 Apr 2022 17:09:04 -0500
Message-Id: <1651270144-29953-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [dm-devel] [PATCH] update HPE MSA builtin config
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Jon Paul <Jon.Paul@hpe.com>, Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the config better align to MSA 4th, 5th and 6th Generation systems.

Suggested-by: Jon Paul <Jon.Paul@hpe.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/hwtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 0e1c0a41..0f0795c3 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -182,8 +182,8 @@ static struct hwentry default_hw[] = {
 	},
 	{
 		/* MSA 1040, 1050, 1060, 2040, 2050 and 2060 families */
-		.vendor        = "HP",
-		.product       = "MSA [12]0[456]0 SA[NS]",
+		.vendor        = "(HP|HPE)",
+		.product       = "MSA [12]0[456]0 (SAN|SAS|FC|iSCSI)",
 		.pgpolicy      = GROUP_BY_PRIO,
 		.pgfailback    = -FAILBACK_IMMEDIATE,
 		.no_path_retry = 18,
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

