Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE8B2DC61C
	for <lists+dm-devel@lfdr.de>; Wed, 16 Dec 2020 19:19:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-H7ieJ__iNy-FwgzQvia6uw-1; Wed, 16 Dec 2020 13:19:16 -0500
X-MC-Unique: H7ieJ__iNy-FwgzQvia6uw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0880A879528;
	Wed, 16 Dec 2020 18:19:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2C51971D;
	Wed, 16 Dec 2020 18:19:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8935D50030;
	Wed, 16 Dec 2020 18:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGIIduP018078 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 13:18:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4CF8AD0164; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47431CF62E
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3394D858EEC
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-468-hoHMpoEBMH6xWsW3fuUtcA-1;
	Wed, 16 Dec 2020 13:18:36 -0500
X-MC-Unique: hoHMpoEBMH6xWsW3fuUtcA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 360ABAF9E;
	Wed, 16 Dec 2020 18:18:35 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Dec 2020 19:17:05 +0100
Message-Id: <20201216181708.22224-27-mwilck@suse.com>
In-Reply-To: <20201216181708.22224-1-mwilck@suse.com>
References: <20201216181708.22224-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BGIIduP018078
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 26/29] libmultipath: simplify dlog()
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

By checking the log level in condlog() directly, we can simplify
dlog(). Also, it's now possible to limit the log level at compile
time by setting MAX_VERBOSITY, enabling the compiler to optimize
away log messages with higher loglevel.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/debug.c     | 30 +++++++++++++-----------------
 libmultipath/debug.h     | 20 ++++++++++++++++----
 libmultipath/devmapper.c |  4 +++-
 tests/test-log.c         |  4 ++--
 tests/test-log.h         |  3 ++-
 5 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/libmultipath/debug.c b/libmultipath/debug.c
index f9b7755..429f269 100644
--- a/libmultipath/debug.c
+++ b/libmultipath/debug.c
@@ -18,29 +18,25 @@
 int logsink;
 int libmp_verbosity = DEFAULT_VERBOSITY;
 
-void dlog (int sink, int prio, const char * fmt, ...)
+void dlog(int prio, const char * fmt, ...)
 {
 	va_list ap;
 
 	va_start(ap, fmt);
+	if (logsink != LOGSINK_SYSLOG) {
+		if (logsink == LOGSINK_STDERR_WITH_TIME) {
+			time_t t = time(NULL);
+			struct tm *tb = localtime(&t);
+			char buff[16];
 
-	if (prio <= libmp_verbosity) {
-		if (sink != LOGSINK_SYSLOG) {
-			if (sink == LOGSINK_STDERR_WITH_TIME) {
-				time_t t = time(NULL);
-				struct tm *tb = localtime(&t);
-				char buff[16];
-
-				strftime(buff, sizeof(buff),
-					 "%b %d %H:%M:%S", tb);
-				buff[sizeof(buff)-1] = '\0';
-
-				fprintf(stderr, "%s | ", buff);
-			}
-			vfprintf(stderr, fmt, ap);
+			strftime(buff, sizeof(buff),
+				 "%b %d %H:%M:%S", tb);
+			buff[sizeof(buff)-1] = '\0';
+			fprintf(stderr, "%s | ", buff);
 		}
-		else
-			log_safe(prio + 3, fmt, ap);
+		vfprintf(stderr, fmt, ap);
 	}
+	else
+		log_safe(prio + 3, fmt, ap);
 	va_end(ap);
 }
diff --git a/libmultipath/debug.h b/libmultipath/debug.h
index b6ce70a..705a5d7 100644
--- a/libmultipath/debug.h
+++ b/libmultipath/debug.h
@@ -1,5 +1,7 @@
-void dlog (int sink, int prio, const char * fmt, ...)
-	__attribute__((format(printf, 3, 4)));
+#ifndef _DEBUG_H
+#define _DEBUG_H
+void dlog (int prio, const char *fmt, ...)
+	__attribute__((format(printf, 2, 3)));
 
 
 #include <pthread.h>
@@ -10,11 +12,21 @@ void dlog (int sink, int prio, const char * fmt, ...)
 extern int logsink;
 extern int libmp_verbosity;
 
-#define condlog(prio, fmt, args...) \
-	dlog(logsink, prio, fmt "\n", ##args)
+#ifndef MAX_VERBOSITY
+#define MAX_VERBOSITY 4
+#endif
 
 enum {
 	LOGSINK_STDERR_WITH_TIME = 0,
 	LOGSINK_STDERR_WITHOUT_TIME = -1,
 	LOGSINK_SYSLOG = 1,
 };
+
+#define condlog(prio, fmt, args...)					\
+	do {								\
+		int __p = (prio);					\
+									\
+		if (__p <= MAX_VERBOSITY && __p <= libmp_verbosity)	\
+			dlog(__p, fmt "\n", ##args);			\
+	} while (0)
+#endif /* _DEBUG_H */
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f8b180e..4977b31 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -276,7 +276,9 @@ static int dm_tgt_prereq (unsigned int *ver)
 
 static void _init_versions(void)
 {
-	dlog(logsink, 3, VERSION_STRING);
+	/* Can't use condlog here because of how VERSION_STRING is defined */
+	if (3 <= libmp_verbosity)
+		dlog(3, VERSION_STRING);
 	init_dm_library_version();
 	init_dm_drv_version();
 	init_dm_mpath_version();
diff --git a/tests/test-log.c b/tests/test-log.c
index 1c901cb..14f25b9 100644
--- a/tests/test-log.c
+++ b/tests/test-log.c
@@ -7,8 +7,8 @@
 #include "log.h"
 #include "test-log.h"
 
-__attribute__((format(printf, 3, 0)))
-void __wrap_dlog (int sink, int prio, const char * fmt, ...)
+__attribute__((format(printf, 2, 0)))
+void __wrap_dlog (int prio, const char * fmt, ...)
 {
 	char buff[MAX_MSG_SIZE];
 	va_list ap;
diff --git a/tests/test-log.h b/tests/test-log.h
index 2c878c6..6d22cd2 100644
--- a/tests/test-log.h
+++ b/tests/test-log.h
@@ -1,7 +1,8 @@
 #ifndef _TEST_LOG_H
 #define _TEST_LOG_H
 
-void __wrap_dlog (int sink, int prio, const char * fmt, ...);
+__attribute__((format(printf, 2, 0)))
+void __wrap_dlog (int prio, const char * fmt, ...);
 void expect_condlog(int prio, char *string);
 
 #endif
-- 
2.29.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

