Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 291DA2772B6
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:40:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-KWdPdaqNMEGu8JX-ckhSKg-1; Thu, 24 Sep 2020 09:39:58 -0400
X-MC-Unique: KWdPdaqNMEGu8JX-ckhSKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9271964158;
	Thu, 24 Sep 2020 13:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67397389;
	Thu, 24 Sep 2020 13:39:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 137001826D30;
	Thu, 24 Sep 2020 13:39:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdWwc026054 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 712561140FC; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0431140F7
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5647785829A
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-360-l_gdjGyjOxyunYgd8batLQ-1;
	Thu, 24 Sep 2020 09:39:29 -0400
X-MC-Unique: l_gdjGyjOxyunYgd8batLQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5EAEEB12F;
	Thu, 24 Sep 2020 13:39:27 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:14 +0200
Message-Id: <20200924133716.14120-20-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdWwc026054
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 19/21] libmpathpersist: call
	libmultipath_{init, exit}()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Have libmpathpersist_{init,exit} do the udev initialization, too.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c | 11 ++++++++---
 libmpathpersist/mpath_persist.h |  9 ++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index a529a38..873b419 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -48,6 +48,10 @@ int libmpathpersist_init(void)
 	struct config *conf;
 	int rc = 0;
 
+	if (libmultipath_init()) {
+		condlog(0, "Failed to initialize libmultipath.");
+		return 1;
+	}
 	if (init_config(DEFAULT_CONFIGFILE)) {
 		condlog(0, "Failed to initialize multipath config.");
 		return 1;
@@ -74,23 +78,24 @@ mpath_lib_init (void)
 
 static void libmpathpersist_cleanup(void)
 {
-	dm_lib_exit();
 	cleanup_prio();
 	cleanup_checkers();
+	libmultipath_exit();
+	dm_lib_exit();
 }
 
 int
 mpath_lib_exit (struct config *conf)
 {
-	libmpathpersist_cleanup();
 	free_config(conf);
+	libmpathpersist_cleanup();
 	return 0;
 }
 
 int libmpathpersist_exit(void)
 {
-	libmpathpersist_cleanup();
 	uninit_config();
+	libmpathpersist_cleanup();
 	return 0;
 }
 
diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
index 91606ef..5435eae 100644
--- a/libmpathpersist/mpath_persist.h
+++ b/libmpathpersist/mpath_persist.h
@@ -176,7 +176,8 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
  *	Initialize device mapper multipath configuration. This function must be invoked first
  *	before performing reservation management functions.
  *	Either this function or mpath_lib_init() may be used.
- *	Use this function to work with libmultipath's internal "struct config".
+ *	Use this function to work with libmultipath's internal "struct config"
+ *	and "struct udev". The latter will be initialized automatically.
  *	Call libmpathpersist_exit() for cleanup.
  * RESTRICTIONS:
  *
@@ -189,7 +190,8 @@ extern int libmpathpersist_init (void);
  *	Initialize device mapper multipath configuration. This function must be invoked first
  *	before performing reservation management functions.
  *	Either this function or libmpathpersist_init() may be used.
- *	Use this function to work with an application-specific "struct config".
+ *	Use this function to work with an application-specific "struct config"
+ *	and "struct udev". The latter must be initialized by the application.
  *	Call mpath_lib_exit() for cleanup.
  * RESTRICTIONS:
  *
@@ -211,9 +213,10 @@ extern int mpath_lib_exit (struct config *conf);
 
 /*
  * DESCRIPTION :
- *	Release device mapper multipath configuration. This function must be invoked after
+ *	Release device mapper multipath configuration a. This function must be invoked after
  *	performing reservation management functions.
  *	Use this after initialization with libmpathpersist_init().
+ *	Calling libmpathpersist_init() after libmpathpersist_exit() will fail.
  * RESTRICTIONS:
  *
  * RETURNS: 0->Success, 1->Failed.
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

