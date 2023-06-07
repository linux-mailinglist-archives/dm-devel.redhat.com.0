Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74819726E1C
	for <lists+dm-devel@lfdr.de>; Wed,  7 Jun 2023 22:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686170897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VMBvnZx+kN4ZF2b9Vm+AnTY8dZdglzRB2dK6w48eAtk=;
	b=gAc9ZhqPRxLPoj/jn5abqOLj39kdCmb0JyFFr+TB+Yf+ojsKt4UwUWrFTRzO/3SmMAXTPe
	kdXURMdC0Asm6u+7vntD2sh4av6TxcDtdlwjnVFTyx4TylFwcvFKGnoHAbzgaNc+kO4dge
	X3GFohmOmlm7dkd3oOGIos7LQ8F9CQE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-9wUamjwiNyCvDmZs3-CFCQ-1; Wed, 07 Jun 2023 16:48:15 -0400
X-MC-Unique: 9wUamjwiNyCvDmZs3-CFCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A76D3806708;
	Wed,  7 Jun 2023 20:48:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5584A40D1B66;
	Wed,  7 Jun 2023 20:48:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0C0DC19451C0;
	Wed,  7 Jun 2023 20:48:13 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C812A19452D3
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Jun 2023 20:48:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A89CE40D1B68; Wed,  7 Jun 2023 20:48:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E97C40D1B66;
 Wed,  7 Jun 2023 20:48:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 357Km8qh005837;
 Wed, 7 Jun 2023 15:48:09 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 357Km8WA005836;
 Wed, 7 Jun 2023 15:48:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  7 Jun 2023 15:47:53 -0500
Message-Id: <1686170873-5754-12-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1686170873-5754-1-git-send-email-bmarzins@redhat.com>
References: <1686170873-5754-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH V3 11/11] multipathd: don't assume mpp->paths
 will exist in need_switch_pathgroup
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
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When need_switch_pathgroup() is called by deferred_failback_tick(),
there is a chance that mpp->paths will be NULL, even if there are paths
in the multipath device's pathgroups. Instead check if there are
multiple pathgroups, since multipath can't be using the wrong pathgroup
if there is one or none.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 584be895..6463d2b7 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -439,7 +439,7 @@ need_switch_pathgroup (struct multipath * mpp, bool *need_reload)
 	if (!mpp)
 		return 0;
 
-	if (!mpp->pg || VECTOR_SIZE(mpp->paths) == 0)
+	if (VECTOR_SIZE(mpp->pg) < 2)
 		return 0;
 
 	bestpg = select_path_group(mpp);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

