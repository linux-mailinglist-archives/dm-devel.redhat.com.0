Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 236802772A9
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:39:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-hneb6Qe1My6uES6RhYArSg-1; Thu, 24 Sep 2020 09:39:51 -0400
X-MC-Unique: hneb6Qe1My6uES6RhYArSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F95B100854F;
	Thu, 24 Sep 2020 13:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CD5D60C04;
	Thu, 24 Sep 2020 13:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 282128C7AA;
	Thu, 24 Sep 2020 13:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdWmm026043 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B9801140EA; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3751F1140FD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE7A1021F82
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-496-jtUaXf73M2GD24BAnIHsOQ-1;
	Thu, 24 Sep 2020 09:39:29 -0400
X-MC-Unique: jtUaXf73M2GD24BAnIHsOQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DBAAEB12B;
	Thu, 24 Sep 2020 13:39:26 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:12 +0200
Message-Id: <20200924133716.14120-18-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdWmm026043
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 17/21] libmultipath: add udev and logsink
	symbols
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

With these symbols added, applications using libmultipath don't
need to define global variables "udev" and "logsink" any more.
This comes at the cost of having to call an init function.
Currently, libmultipath_init() does nothing but initialize
"udev".

The linker's symbol lookup order still allows applications to use
their own "logsink" and "udev" variables, which will take precendence
over libmultipath's internal ones. In this case, calling
libmultipath_init() can be skipped, but like before,
udev should be initialized (using udev_new()) before making any
libmultipath calls.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c             | 46 +++++++++++++++++++++++++++++++
 libmultipath/config.h             | 46 ++++++++++++++++++++++++++++++-
 libmultipath/debug.c              |  2 ++
 libmultipath/libmultipath.version |  8 ++++++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 01b77df..fbb66b3 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -27,6 +27,52 @@
 #include "mpath_cmd.h"
 #include "propsel.h"
 
+/*
+ * We don't support re-initialization after
+ * libmultipath_exit().
+ */
+static bool libmultipath_exit_called;
+static pthread_once_t _init_once = PTHREAD_ONCE_INIT;
+static pthread_once_t _exit_once = PTHREAD_ONCE_INIT;
+struct udev *udev;
+
+static void _udev_init(void)
+{
+	if (udev)
+		udev_ref(udev);
+	else
+		udev = udev_new();
+	if (!udev)
+		condlog(0, "%s: failed to initialize udev", __func__);
+}
+
+static void _libmultipath_init(void)
+{
+	_udev_init();
+}
+
+static bool _is_libmultipath_initialized(void)
+{
+	return !libmultipath_exit_called && !!udev;
+}
+
+int libmultipath_init(void)
+{
+	pthread_once(&_init_once, _libmultipath_init);
+	return !_is_libmultipath_initialized();
+}
+
+static void _libmultipath_exit(void)
+{
+	libmultipath_exit_called = true;
+	udev_unref(udev);
+}
+
+void libmultipath_exit(void)
+{
+	pthread_once(&_exit_once, _libmultipath_exit);
+}
+
 static struct config __internal_config;
 struct config *libmp_get_multipath_config(void)
 {
diff --git a/libmultipath/config.h b/libmultipath/config.h
index 5997b71..dac4e8f 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -232,7 +232,51 @@ struct config {
 	char *enable_foreign;
 };
 
-extern struct udev * udev;
+/**
+ * extern variable: udev
+ *
+ * A &struct udev instance used by libmultipath. libmultipath expects
+ * a valid, initialized &struct udev in this variable.
+ * An application can define this variable itself, in which case
+ * the applications's instance will take precedence.
+ * The application can initialize and destroy this variable by
+ * calling libmultipath_init() and libmultipath_exit(), respectively,
+ * whether or not it defines the variable itself.
+ * An application can initialize udev with udev_new() before calling
+ * libmultipath_init(), e.g. if it has to make libudev calls before
+ * libmultipath calls. If an application wants to keep using the
+ * udev variable after calling libmultipath_exit(), it should have taken
+ * an additional reference on it beforehand. This is the case e.g.
+ * after initiazing udev with udev_new().
+ */
+extern struct udev *udev;
+
+/**
+ * libmultipath_init() - library initialization
+ *
+ * This function initializes libmultipath data structures.
+ * It is light-weight; some other initializations, like device-mapper
+ * initialization, are done lazily when the respective functionality
+ * is required.
+ *
+ * Clean up by libmultipath_exit() when the program terminates.
+ * It is an error to call libmultipath_init() after libmultipath_exit().
+ * Return: 0 on success, 1 on failure.
+ */
+int libmultipath_init(void);
+
+/**
+ * libmultipath_exit() - library un-initialization
+ *
+ * This function un-initializes libmultipath data structures.
+ * It is recommended to call this function at program exit.
+ *
+ * Calls to libmultipath_init() after libmultipath_exit() will fail
+ * (in other words, libmultipath can't be re-initialized).
+ * Any other libmultipath calls after libmultipath_exit() may cause
+ * undefined behavior.
+ */
+void libmultipath_exit(void);
 
 int find_hwe (const struct _vector *hwtable,
 	      const char * vendor, const char * product, const char *revision,
diff --git a/libmultipath/debug.c b/libmultipath/debug.c
index 4128cb9..b3a1de9 100644
--- a/libmultipath/debug.c
+++ b/libmultipath/debug.c
@@ -15,6 +15,8 @@
 #include "defaults.h"
 #include "debug.h"
 
+int logsink;
+
 void dlog (int sink, int prio, const char * fmt, ...)
 {
 	va_list ap;
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 81bcc9d..2e531ef 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -228,3 +228,11 @@ global:
 	init_config;
 	uninit_config;
 } LIBMULTIPATH_0.8.4.2;
+
+LIBMULTIPATH_0.8.4.4 {
+global:
+	udev;
+	logsink;
+	libmultipath_init;
+	libmultipath_exit;
+} LIBMULTIPATH_0.8.4.3;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

