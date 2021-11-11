Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 047FC44DBDB
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 19:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636656906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ImX1d0mtRuQ0i1AN0oJpw0mUSDhrmfqfspg5mZH9shU=;
	b=UrxOpQfQHpqHsAL4YQFhuGsB04SdT95Zkb2HdLlkgIq1els9ks1MRsdNfL2T0PR/HVPa/g
	MDxQxOTyj8lsMhvnY6Pc/yYcJTA2LJzm1Dl0oTrvqCcux5VbhDjQeiaqFBmsNaP2UqQGvF
	/4850d+jLiQsNwc3j005wVhrWVc5GjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-hh5sMjS9Ol-z3Nm8WEqU6Q-1; Thu, 11 Nov 2021 13:54:36 -0500
X-MC-Unique: hh5sMjS9Ol-z3Nm8WEqU6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFBA9824F8D;
	Thu, 11 Nov 2021 18:54:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C418F10016F4;
	Thu, 11 Nov 2021 18:54:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC6FE4EA29;
	Thu, 11 Nov 2021 18:54:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABIsEhK027808 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 13:54:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 52FB95DF56; Thu, 11 Nov 2021 18:54:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3048229403;
	Thu, 11 Nov 2021 18:54:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1ABIsB61026134; 
	Thu, 11 Nov 2021 12:54:11 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1ABIsB1B026133;
	Thu, 11 Nov 2021 12:54:11 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 11 Nov 2021 12:53:51 -0600
Message-Id: <1636656832-26062-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1636656832-26062-1-git-send-email-bmarzins@redhat.com>
References: <1636656832-26062-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 8/9] libmultipath: split set_int to enable
	reuse
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Split the code that does the actual value parsing out of set_int(), into
a helper function, do_set_int(), so that it can be used by other
handlers. These functions no longer set the config value at all, when
they have invalid input.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dict.c | 82 +++++++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 36 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index d14be340..68647061 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -31,17 +31,12 @@
 #include "strbuf.h"
 
 static int
-set_int(vector strvec, void *ptr, int min, int max, const char *file,
-	int line_nr)
+do_set_int(vector strvec, void *ptr, int min, int max, const char *file,
+	int line_nr, char *buff)
 {
 	int *int_ptr = (int *)ptr;
-	char *buff, *eptr;
+	char *eptr;
 	long res;
-	int rc;
-
-	buff = set_value(strvec);
-	if (!buff)
-		return 1;
 
 	res = strtol(buff, &eptr, 10);
 	if (eptr > buff)
@@ -50,17 +45,30 @@ set_int(vector strvec, void *ptr, int min, int max, const char *file,
 	if (*buff == '\0' || *eptr != '\0') {
 		condlog(1, "%s line %d, invalid value for %s: \"%s\"",
 			file, line_nr, (char*)VECTOR_SLOT(strvec, 0), buff);
-		rc = 1;
-	} else {
-		if (res > max || res < min) {
-			res = (res > max) ? max : min;
-			condlog(1, "%s line %d, value for %s too %s, capping at %ld",
+		return 1;
+	}
+	if (res > max || res < min) {
+		res = (res > max) ? max : min;
+		condlog(1, "%s line %d, value for %s too %s, capping at %ld",
 			file, line_nr, (char*)VECTOR_SLOT(strvec, 0),
-			(res == max)? "large" : "small", res);
-		}
-		rc = 0;
-		*int_ptr = res;
+		(res == max)? "large" : "small", res);
 	}
+	*int_ptr = res;
+	return 0;
+}
+
+static int
+set_int(vector strvec, void *ptr, int min, int max, const char *file,
+	int line_nr)
+{
+	char *buff;
+	int rc;
+
+	buff = set_value(strvec);
+	if (!buff)
+		return 1;
+
+	rc = do_set_int(strvec, ptr, min, max, file, line_nr, buff);
 
 	FREE(buff);
 	return rc;
@@ -929,6 +937,7 @@ declare_mp_attr_snprint(gid, print_gid)
 static int
 set_undef_off_zero(vector strvec, void *ptr, const char *file, int line_nr)
 {
+	int rc = 0;
 	char * buff;
 	int *int_ptr = (int *)ptr;
 
@@ -938,10 +947,10 @@ set_undef_off_zero(vector strvec, void *ptr, const char *file, int line_nr)
 
 	if (strcmp(buff, "off") == 0)
 		*int_ptr = UOZ_OFF;
-	else if (sscanf(buff, "%d", int_ptr) != 1 ||
-		 *int_ptr < UOZ_ZERO)
-		*int_ptr = UOZ_UNDEF;
-	else if (*int_ptr == 0)
+	else
+		rc = do_set_int(strvec, int_ptr, 0, INT_MAX, file, line_nr,
+				buff);
+	if (rc == 0 && *int_ptr == 0)
 		*int_ptr = UOZ_ZERO;
 
 	FREE(buff);
@@ -1093,14 +1102,12 @@ max_fds_handler(struct config *conf, vector strvec, const char *file,
 		/* Assume safe limit */
 		max_fds = 4096;
 	}
-	if (strlen(buff) == 3 &&
-	    !strcmp(buff, "max"))
-		conf->max_fds = max_fds;
-	else
-		conf->max_fds = atoi(buff);
-
-	if (conf->max_fds > max_fds)
+	if (!strcmp(buff, "max")) {
 		conf->max_fds = max_fds;
+		r = 0;
+	} else
+		r = do_set_int(strvec, &conf->max_fds, 0, max_fds, file,
+			       line_nr, buff);
 
 	FREE(buff);
 
@@ -1169,6 +1176,7 @@ declare_mp_snprint(rr_weight, print_rr_weight)
 static int
 set_pgfailback(vector strvec, void *ptr, const char *file, int line_nr)
 {
+	int rc = 0;
 	int *int_ptr = (int *)ptr;
 	char * buff;
 
@@ -1183,11 +1191,11 @@ set_pgfailback(vector strvec, void *ptr, const char *file, int line_nr)
 	else if (strlen(buff) == 10 && !strcmp(buff, "followover"))
 		*int_ptr = -FAILBACK_FOLLOWOVER;
 	else
-		*int_ptr = atoi(buff);
+		rc = do_set_int(strvec, ptr, 0, INT_MAX, file, line_nr, buff);
 
 	FREE(buff);
 
-	return 0;
+	return rc;
 }
 
 int
@@ -1219,6 +1227,7 @@ declare_mp_snprint(pgfailback, print_pgfailback)
 static int
 no_path_retry_helper(vector strvec, void *ptr, const char *file, int line_nr)
 {
+	int rc = 0;
 	int *int_ptr = (int *)ptr;
 	char * buff;
 
@@ -1230,11 +1239,11 @@ no_path_retry_helper(vector strvec, void *ptr, const char *file, int line_nr)
 		*int_ptr = NO_PATH_RETRY_FAIL;
 	else if (!strcmp(buff, "queue"))
 		*int_ptr = NO_PATH_RETRY_QUEUE;
-	else if ((*int_ptr = atoi(buff)) < 1)
-		*int_ptr = NO_PATH_RETRY_UNDEF;
+	else
+		rc = do_set_int(strvec, ptr, 1, INT_MAX, file, line_nr, buff);
 
 	FREE(buff);
-	return 0;
+	return rc;
 }
 
 int
@@ -1376,6 +1385,7 @@ snprint_mp_reservation_key (struct config *conf, struct strbuf *buff,
 static int
 set_off_int_undef(vector strvec, void *ptr, const char *file, int line_nr)
 {
+	int rc =0;
 	int *int_ptr = (int *)ptr;
 	char * buff;
 
@@ -1385,11 +1395,11 @@ set_off_int_undef(vector strvec, void *ptr, const char *file, int line_nr)
 
 	if (!strcmp(buff, "no") || !strcmp(buff, "0"))
 		*int_ptr = NU_NO;
-	else if ((*int_ptr = atoi(buff)) < 1)
-		*int_ptr = NU_UNDEF;
+	else
+		rc = do_set_int(strvec, ptr, 1, INT_MAX, file, line_nr, buff);
 
 	FREE(buff);
-	return 0;
+	return rc;
 }
 
 int
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

