Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E2D7101A5
	for <lists+dm-devel@lfdr.de>; Thu, 25 May 2023 01:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684970523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sicQYc8oRsnG4tvBR16yDORKKO0fENP89dDlvr/1kfs=;
	b=PpxpnsU/C0ZKmH7a00mQN4Bl/CndP0VftBF5VZRXRR0dwU4pPGUZlYOxYoiEbwZqGuH+3m
	BFzEV//31grOIN6VhpLnGxWqVBKHb77GB0w3BpBLn99g/HtwJ8AmReAZs8otaVxbdzJiJ+
	sOZfaotnKBoB3plbiDgIx9b8fosvPbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-MzN2_5jnMIWIWcsiQwwJzA-1; Wed, 24 May 2023 19:21:27 -0400
X-MC-Unique: MzN2_5jnMIWIWcsiQwwJzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F9A185A792;
	Wed, 24 May 2023 23:21:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D70E52166B25;
	Wed, 24 May 2023 23:21:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7375019465BA;
	Wed, 24 May 2023 23:21:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8BB3719465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 24 May 2023 23:21:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F042407DEC3; Wed, 24 May 2023 23:21:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54635407DEC6;
 Wed, 24 May 2023 23:21:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 34ONLKHG028729;
 Wed, 24 May 2023 18:21:20 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 34ONLJxs028728;
 Wed, 24 May 2023 18:21:19 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 24 May 2023 18:21:12 -0500
Message-Id: <1684970472-28669-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1684970472-28669-1-git-send-email-bmarzins@redhat.com>
References: <1684970472-28669-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH 5/5] multipathd: don't assume mpp->paths will
 exist in need_switch_pathgroup
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When need_switch_pathgroup() is called by deferred_failback_tick(),
there is a chance that mpp->paths will be NULL, even if there are paths
in the multipath device's pathgroups. Instead check if there are
multiple pathgroups, since multipath can't be using the wrong pathgroup
if there is one or none.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 2ea7c76b..39ba6d27 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -423,7 +423,7 @@ need_switch_pathgroup (struct multipath * mpp, int refresh, bool *need_reload)
 		}
 	}
 
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

