Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 240CD26C46A
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-aBXAm2ckPcKIVljdW_LvZw-1; Wed, 16 Sep 2020 11:40:06 -0400
X-MC-Unique: aBXAm2ckPcKIVljdW_LvZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CCD80F04E;
	Wed, 16 Sep 2020 15:39:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF7E960CC0;
	Wed, 16 Sep 2020 15:39:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96AA4183D036;
	Wed, 16 Sep 2020 15:39:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdYwo024279 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 325E3F49D1; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E180F5AE5
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1509C88FA0F
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-190-DWbT5fi8PgiVXqPIiuAKfg-1;
	Wed, 16 Sep 2020 11:39:29 -0400
X-MC-Unique: DWbT5fi8PgiVXqPIiuAKfg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2310BB3C9;
	Wed, 16 Sep 2020 15:39:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:16 +0200
Message-Id: <20200916153718.582-18-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdYwo024279
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 17/19] libmultipath: add udev and logsink symbols
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
X-Mimecast-Spam-Score: 0.003
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
 libmultipath/config.c | 22 ++++++++++++++++++++++
 libmultipath/config.h |  4 +++-
 libmultipath/debug.c  |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index b83e5cd..4b48b27 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -27,6 +27,28 @@
 #include "mpath_cmd.h"
 #include "propsel.h"
 
+static pthread_once_t _udev_once = PTHREAD_ONCE_INIT;
+struct udev *udev;
+
+void _udev_init(void)
+{
+	udev = udev_new();
+	if (!udev)
+		condlog(0, "%s: failed to initialize udev", __func__);
+}
+
+int libmultipath_init(void)
+{
+	if (!udev)
+		pthread_once(&_udev_once, _udev_init);
+	return udev ? 0 : 1;
+}
+
+void libmultipath_exit(void)
+{
+	udev_unref(udev);
+}
+
 static struct config __internal_config;
 struct config *libmp_get_multipath_config(void)
 {
diff --git a/libmultipath/config.h b/libmultipath/config.h
index 5997b71..541b2e4 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -232,7 +232,9 @@ struct config {
 	char *enable_foreign;
 };
 
-extern struct udev * udev;
+extern struct udev *udev;
+int libmultipath_init(void);
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
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

