Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F5686AF5
	for <lists+dm-devel@lfdr.de>; Wed,  1 Feb 2023 16:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675267035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pREKA1csCiSognxL7G2+/j7n/RIcxs703hXLwsYAozY=;
	b=E/vUr0LV8mcHXYlzrtLzWWBJG68BRcrrPcDmyp97NobSRtapOOjgDcoAZQkWadL4Rx2NJL
	p0lUave+ny4QN/V0mQ/wGKWJTSpS7b5pwtRRhwvVT23W1YNlFOUe/eP19881y1duVM8G+o
	tgSN3O1yEu/wQmQH787iNPAJD3UYlQo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-p4lpWEekNXW4fBsuJWsxDA-1; Wed, 01 Feb 2023 10:57:11 -0500
X-MC-Unique: p4lpWEekNXW4fBsuJWsxDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3679B3C16E8A;
	Wed,  1 Feb 2023 15:56:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D82FD404BEC7;
	Wed,  1 Feb 2023 15:56:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1D8C1946A40;
	Wed,  1 Feb 2023 15:56:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A97019465A3
 for <dm-devel@listman.corp.redhat.com>; Wed,  1 Feb 2023 15:56:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D038CC16021; Wed,  1 Feb 2023 15:56:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF7E4C16020;
 Wed,  1 Feb 2023 15:56:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 311FuYu0008331;
 Wed, 1 Feb 2023 09:56:34 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 311FuYgd008330;
 Wed, 1 Feb 2023 09:56:34 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Feb 2023 09:56:28 -0600
Message-Id: <1675266989-8281-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
References: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v2 3/4] libmultipath: cleanup ACT_CREATE code in
 select_action
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Combine the two separate blocks that set ACT_CREATE into one.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 6811e661..e870e0f6 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -686,33 +686,29 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 	if (mpp->need_reload || (cmpp && cmpp->need_reload))
 		force_reload = 1;
 
-	if (!cmpp_by_name) {
-		if (cmpp) {
-			condlog(2, "%s: rename %s to %s", mpp->wwid,
-				cmpp->alias, mpp->alias);
-			strlcpy(mpp->alias_old, cmpp->alias, WWID_SIZE);
-			mpp->action = ACT_RENAME;
-			if (force_reload) {
-				mpp->force_udev_reload = 1;
-				mpp->action = ACT_FORCERENAME;
-			}
-			return;
+	if (!cmpp) {
+		if (cmpp_by_name) {
+			condlog(1, "%s: can't use alias \"%s\" used by %s, falling back to WWID",
+				mpp->wwid, mpp->alias, cmpp_by_name->wwid);
+			/* We can do this because wwid wasn't found */
+			free(mpp->alias);
+			mpp->alias = strdup(mpp->wwid);
 		}
 		mpp->action = ACT_CREATE;
-		condlog(3, "%s: set ACT_CREATE (map does not exist)",
-			mpp->alias);
+		condlog(3, "%s: set ACT_CREATE (map does not exist%s)",
+			mpp->alias, cmpp_by_name ? ", name changed" : "");
 		return;
 	}
 
-	if (!cmpp) {
-		condlog(1, "%s: can't use alias \"%s\" used by %s, falling back to WWID",
-			mpp->wwid, mpp->alias, cmpp_by_name->wwid);
-		/* We can do this because wwid wasn't found */
-		free(mpp->alias);
-		mpp->alias = strdup(mpp->wwid);
-		mpp->action = ACT_CREATE;
-		condlog(3, "%s: set ACT_CREATE (map does not exist, name changed)",
+	if (!cmpp_by_name) {
+		condlog(2, "%s: rename %s to %s", mpp->wwid, cmpp->alias,
 			mpp->alias);
+		strlcpy(mpp->alias_old, cmpp->alias, WWID_SIZE);
+		mpp->action = ACT_RENAME;
+		if (force_reload) {
+			mpp->force_udev_reload = 1;
+			mpp->action = ACT_FORCERENAME;
+		}
 		return;
 	}
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

