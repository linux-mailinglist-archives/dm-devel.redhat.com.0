Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B758E207
	for <lists+dm-devel@lfdr.de>; Tue,  9 Aug 2022 23:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660081601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VIQJKMv1uNvSJBmvM57S1fzYtpnjVolcroW1kUr4FG8=;
	b=QGYXtbl4mll02AZD4E/Jd2Z3cGL/gtbazmX/mMJw9dCQcpwNm/qRCSqCMhAAklIisL4zy7
	ZwwlVN4817Im5MlXJeJByNcHtODdpM0T3plF3aNTr+WyqIg013VDCPEJ++xsobpZqf5ZKg
	1qEXOWbLqK0hRJLYCDNtjD7gLmHc4lM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480--VCzqx4VNgqlUHqnT7XmgA-1; Tue, 09 Aug 2022 17:46:37 -0400
X-MC-Unique: -VCzqx4VNgqlUHqnT7XmgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A963C1172E;
	Tue,  9 Aug 2022 21:46:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA02140D296C;
	Tue,  9 Aug 2022 21:46:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5514D1932221;
	Tue,  9 Aug 2022 21:46:33 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3C201946A41
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 Aug 2022 21:46:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C87EA1121315; Tue,  9 Aug 2022 21:46:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63911121314;
 Tue,  9 Aug 2022 21:46:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 279LkVEb023324;
 Tue, 9 Aug 2022 16:46:31 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 279LkVeF023323;
 Tue, 9 Aug 2022 16:46:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Aug 2022 16:46:27 -0500
Message-Id: <1660081588-23278-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1660081588-23278-1-git-send-email-bmarzins@redhat.com>
References: <1660081588-23278-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [dm-devel] [PATCH 2/3] libmultipath: return success if we raced to
 remove a map and lost
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

_dm_flush_map() was returning failure if it failed to remove a map,
even if that was because the map had already been removed. Return
success in this case.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 4 ++++
 multipathd/main.c        | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 1748d258..a49db3b0 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1111,6 +1111,10 @@ int _dm_flush_map (const char * mapname, int need_sync, int deferred_remove,
 			}
 			condlog(4, "multipath map %s removed", mapname);
 			return 0;
+		} else if (dm_is_mpath(mapname) != 1) {
+			condlog(4, "multipath map %s removed externally",
+				mapname);
+			return 0; /*we raced with someone else removing it */
 		} else {
 			condlog(2, "failed to remove multipath map %s",
 				mapname);
diff --git a/multipathd/main.c b/multipathd/main.c
index 325f8cd4..1380dd8b 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -758,10 +758,6 @@ flush_map(struct multipath * mpp, struct vectors * vecs, int nopaths)
 	 * the spurious uevent we may generate with the dm_flush_map call below
 	 */
 	if (r) {
-		/*
-		 * May not really be an error -- if the map was already flushed
-		 * from the device mapper by dmsetup(8) for instance.
-		 */
 		if (r == 1)
 			condlog(0, "%s: can't flush", mpp->alias);
 		else {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

