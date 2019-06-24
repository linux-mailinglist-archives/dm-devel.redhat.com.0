Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 29655505B6
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B942831628FA;
	Mon, 24 Jun 2019 09:30:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DCA4608E4;
	Mon, 24 Jun 2019 09:30:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85B4A206D5;
	Mon, 24 Jun 2019 09:30:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9TA66004800 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 694315C22F; Mon, 24 Jun 2019 09:29:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 602925C225;
	Mon, 24 Jun 2019 09:29:08 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 219225D61E;
	Mon, 24 Jun 2019 09:29:01 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:55 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:34 +0200
Message-Id: <20190624092756.7769-10-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Mon, 24 Jun 2019 09:29:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 24 Jun 2019 09:29:01 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 08/30] libmultipath: inline set_default()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 24 Jun 2019 09:30:34 +0000 (UTC)

This is nothing but a reimplementation of strdup(), and it causes gcc 9
warnings. Remove it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/debug.c    |  1 +
 libmultipath/defaults.c | 17 -----------------
 libmultipath/defaults.h |  9 ++++++++-
 3 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/libmultipath/debug.c b/libmultipath/debug.c
index cbf1e570..4128cb90 100644
--- a/libmultipath/debug.c
+++ b/libmultipath/debug.c
@@ -4,6 +4,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdarg.h>
+#include <string.h>
 
 #include "log_pthread.h"
 #include <sys/types.h>
diff --git a/libmultipath/defaults.c b/libmultipath/defaults.c
index c20bb0d2..082640d3 100644
--- a/libmultipath/defaults.c
+++ b/libmultipath/defaults.c
@@ -7,20 +7,3 @@
 #include "memory.h"
 
 const char * const default_partition_delim = DEFAULT_PARTITION_DELIM;
-
-char *
-set_default (char * str)
-{
-	int len;
-	char * p;
-
-	len = strlen(str);
-	p = MALLOC(len + 1);
-
-	if (!p)
-		return NULL;
-
-	strncat(p, str, len);
-
-	return p;
-}
diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 65769398..83f89f37 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -1,3 +1,5 @@
+#ifndef _DEFAULTS_H
+#define _DEFAULTS_H
 /*
  * If you add or modify a value also update multipath/multipath.conf.5
  * and the TEMPLATE in libmultipath/hwtable.c
@@ -60,5 +62,10 @@
 #define DEFAULT_CONFIG_DIR	"/etc/multipath/conf.d"
 #define MULTIPATH_SHM_BASE	"/dev/shm/multipath/"
 
-char * set_default (char * str);
+
+static inline char *set_default(char *str)
+{
+	return strdup(str);
+}
 extern const char *const default_partition_delim;
+#endif /* _DEFAULTS_H */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
