Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B893B219DA1
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:22:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-tOHbrr7aNZqTSrW4quOePQ-1; Thu, 09 Jul 2020 06:21:50 -0400
X-MC-Unique: tOHbrr7aNZqTSrW4quOePQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E922E107B0E1;
	Thu,  9 Jul 2020 10:21:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2EFF60F8D;
	Thu,  9 Jul 2020 10:21:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C8DA1809561;
	Thu,  9 Jul 2020 10:21:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH3fn029563 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72E165EDFD; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAE55F243
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C06710B94EB
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-457-T2cKgYOSNVWRp4yL9qV2Mw-1;
	Thu, 09 Jul 2020 06:16:58 -0400
X-MC-Unique: T2cKgYOSNVWRp4yL9qV2Mw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB1ECAB89;
	Thu,  9 Jul 2020 10:16:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:12 +0200
Message-Id: <20200709101620.6786-28-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH3fn029563
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 27/35] libmultipath: improve libdm logging
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

Currently no libdm messages are logged at verbosity 3 and lower,
not even fatal ones. That seems wrong. Rather, we should map
our log levels (2 ~ WARN, 3 ~ NOTICE) to those of libdm
(_LOG_WARN = 4, _LOG_NOTICE = 5). Tests show that the results
are quite satisfactory for different verbosity levels.

dm_log_init_verbose() doesn't need to be called, as it only
sets the log level for libdm's internal logging function which
we don't use.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/devmapper.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f597ff8..4096e9d 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -12,6 +12,7 @@
 #include <ctype.h>
 #include <unistd.h>
 #include <errno.h>
+#include <syslog.h>
 #include <sys/sysmacros.h>
 #include <linux/dm-ioctl.h>
 
@@ -65,13 +66,15 @@ __attribute__((format(printf, 4, 5))) static void
 dm_write_log (int level, const char *file, int line, const char *f, ...)
 {
 	va_list ap;
-	int thres;
 
-	if (level > 6)
-		level = 6;
+	/*
+	 * libdm uses the same log levels as syslog,
+	 * except that EMERG/ALERT are not used
+	 */
+	if (level > LOG_DEBUG)
+		level = LOG_DEBUG;
 
-	thres = dm_conf_verbosity;
-	if (thres <= 3 || level > thres)
+	if (level > dm_conf_verbosity)
 		return;
 
 	va_start(ap, f);
@@ -90,8 +93,9 @@ dm_write_log (int level, const char *file, int line, const char *f, ...)
 		vfprintf(stderr, f, ap);
 		fprintf(stderr, "\n");
 	} else {
-		condlog(level, "libdevmapper: %s(%i): ", file, line);
-		log_safe(level + 3, f, ap);
+		condlog(level >= LOG_ERR ? level - LOG_ERR : 0,
+			"libdevmapper: %s(%i): ", file, line);
+		log_safe(level, f, ap);
 	}
 	va_end(ap);
 
@@ -100,9 +104,12 @@ dm_write_log (int level, const char *file, int line, const char *f, ...)
 
 void dm_init(int v)
 {
-	dm_conf_verbosity = v;
+	/*
+	 * This maps libdm's standard loglevel _LOG_WARN (= 4), which is rather
+	 * quiet in practice, to multipathd's default verbosity 2
+	 */
+	dm_conf_verbosity = v + 2;
 	dm_log_init(&dm_write_log);
-	dm_log_init_verbose(v + 3);
 }
 
 static int
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

