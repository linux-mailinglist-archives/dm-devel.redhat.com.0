Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD40326C460
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-ieC8SFWFNEagNdLEc4YmsA-1; Wed, 16 Sep 2020 11:39:56 -0400
X-MC-Unique: ieC8SFWFNEagNdLEc4YmsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C9757085;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855FC61799;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E65B183D030;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdWEt024205 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 545A620244F7; Wed, 16 Sep 2020 15:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 498D12024508
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39BAE801224
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-175-OHbDd5BeMYGoWUOnO7Nv-w-1;
	Wed, 16 Sep 2020 11:39:27 -0400
X-MC-Unique: OHbDd5BeMYGoWUOnO7Nv-w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 67BC1B2DF;
	Wed, 16 Sep 2020 15:39:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:13 +0200
Message-Id: <20200916153718.582-15-mwilck@suse.com>
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
References: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdWEt024205
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 14/19] libmpathpersist: allow using libmultipath
	{get, put}_multipath_config
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Provide an alternative init function libmpathpersist_init() which
avoids allocating a new struct config, simply using libmultipath's
internal implementation.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c | 42 ++++++++++++++++++++++++++++-----
 libmpathpersist/mpath_persist.h | 28 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 729a8e4..fd113cc 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -37,6 +37,27 @@
 
 extern struct udev *udev;
 
+static void adapt_config(struct config *conf)
+{
+	conf->force_sync = 1;
+	set_max_fds(conf->max_fds);
+}
+
+int libmpathpersist_init(void)
+{
+	struct config *conf;
+	int rc = 0;
+
+	if (init_config(DEFAULT_CONFIGFILE)) {
+		condlog(0, "Failed to initialize multipath config.");
+		return 1;
+	}
+	conf = libmp_get_multipath_config();
+	adapt_config(conf);
+	libmp_put_multipath_config(conf);
+	return rc;
+}
+
 struct config *
 mpath_lib_init (void)
 {
@@ -47,20 +68,29 @@ mpath_lib_init (void)
 		condlog(0, "Failed to initialize multipath config.");
 		return NULL;
 	}
-	conf->force_sync = 1;
-	set_max_fds(conf->max_fds);
-
+	adapt_config(conf);
 	return conf;
 }
 
-int
-mpath_lib_exit (struct config *conf)
+static void libmpathpersist_cleanup(void)
 {
 	dm_lib_exit();
 	cleanup_prio();
 	cleanup_checkers();
+}
+
+int
+mpath_lib_exit (struct config *conf)
+{
+	libmpathpersist_cleanup();
 	free_config(conf);
-	conf = NULL;
+	return 0;
+}
+
+int libmpathpersist_exit(void)
+{
+	libmpathpersist_cleanup();
+	uninit_config();
 	return 0;
 }
 
diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
index 7cf4faf..91606ef 100644
--- a/libmpathpersist/mpath_persist.h
+++ b/libmpathpersist/mpath_persist.h
@@ -175,6 +175,22 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
  * DESCRIPTION :
  *	Initialize device mapper multipath configuration. This function must be invoked first
  *	before performing reservation management functions.
+ *	Either this function or mpath_lib_init() may be used.
+ *	Use this function to work with libmultipath's internal "struct config".
+ *	Call libmpathpersist_exit() for cleanup.
+ * RESTRICTIONS:
+ *
+ * RETURNS: 0->Success, 1->Failed.
+ */
+extern int libmpathpersist_init (void);
+
+/*
+ * DESCRIPTION :
+ *	Initialize device mapper multipath configuration. This function must be invoked first
+ *	before performing reservation management functions.
+ *	Either this function or libmpathpersist_init() may be used.
+ *	Use this function to work with an application-specific "struct config".
+ *	Call mpath_lib_exit() for cleanup.
  * RESTRICTIONS:
  *
  * RETURNS: struct config ->Success, NULL->Failed.
@@ -186,12 +202,24 @@ extern struct config * mpath_lib_init (void);
  * DESCRIPTION :
  *	Release device mapper multipath configuration. This function must be invoked after
  *	performing reservation management functions.
+ *	Use this after initialization with mpath_lib_init().
  * RESTRICTIONS:
  *
  * RETURNS: 0->Success, 1->Failed.
  */
 extern int mpath_lib_exit (struct config *conf);
 
+/*
+ * DESCRIPTION :
+ *	Release device mapper multipath configuration. This function must be invoked after
+ *	performing reservation management functions.
+ *	Use this after initialization with libmpathpersist_init().
+ * RESTRICTIONS:
+ *
+ * RETURNS: 0->Success, 1->Failed.
+ */
+extern int libmpathpersist_exit (void);
+
 
 /*
  * DESCRIPTION :
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

