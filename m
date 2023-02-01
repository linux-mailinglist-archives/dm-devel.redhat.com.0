Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97193686AF4
	for <lists+dm-devel@lfdr.de>; Wed,  1 Feb 2023 16:57:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675267033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XA/bxO64xsNJNyze8P4/6DgrYCQ79AlwMlwpw3YA0aQ=;
	b=Mat4/sJACC2Ai1kk4CtZI4o0A3x4Q9UoDT8Yz1bae5NB//xUS4ztGCLaRRP/LCEbc/Pa2C
	4yMFcMeUWRFhvJSXCYS9RjYz0l0VYLen8huuoubccmsnsUeYU6ATwAWY2fRmb8gtGwW1/7
	jGvnRa2aQBsUy10Kd/7OsgfABfaQjA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-EfSM7GcpMMmE1CbMzCOhWQ-1; Wed, 01 Feb 2023 10:57:10 -0500
X-MC-Unique: EfSM7GcpMMmE1CbMzCOhWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3695028004A5;
	Wed,  1 Feb 2023 15:56:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1E4492B05;
	Wed,  1 Feb 2023 15:56:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DCC71946A51;
	Wed,  1 Feb 2023 15:56:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 33B2819465B2
 for <dm-devel@listman.corp.redhat.com>; Wed,  1 Feb 2023 15:56:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 516ED404BEC1; Wed,  1 Feb 2023 15:56:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBF7404BEC0;
 Wed,  1 Feb 2023 15:56:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 311FuVrN008323;
 Wed, 1 Feb 2023 09:56:32 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 311FuVrf008322;
 Wed, 1 Feb 2023 09:56:31 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Feb 2023 09:56:26 -0600
Message-Id: <1675266989-8281-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
References: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH v2 1/4] libmultipath: use select_reload_action in
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we have a function to set the action to reload, use it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index e689f8a7..050b984a 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -729,9 +729,7 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 
 	if (force_reload) {
 		mpp->force_udev_reload = 1;
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (forced by user)",
-			mpp->alias);
+		select_reload_action(mpp, "forced by user");
 		return;
 	}
 	if (cmpp->size != mpp->size) {
@@ -744,9 +742,7 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 
 	if (!is_udev_ready(cmpp) && count_active_paths(mpp) > 0) {
 		mpp->force_udev_reload = 1;
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (udev incomplete)",
-			mpp->alias);
+		select_reload_action(mpp, "udev incomplete");
 		return;
 	}
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

