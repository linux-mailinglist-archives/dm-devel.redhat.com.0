Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 720464247AB
	for <lists+dm-devel@lfdr.de>; Wed,  6 Oct 2021 22:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633550761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mqnt6yIIJMEGqus6AaXv8p/ElyKNj2/vy0zOaWiB/kY=;
	b=JFXSHVmnpaIPZf9nzV8EGDmxOJ0J64AgfjGNtf6XTil6Bcz2qH4vP9buYlgQ+AqgFZW+2g
	1E2SYx4PfEQHQN6kdG4TvCJhoEKgDN3TSasplpiW42GSFqz5+CfUVRPqPyJOTHQvpXT00W
	x5nXfCgza3VmXawAFYJhSXAH+mA6Tz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-Nn34J0sEO5uNPtWiLVFxCA-1; Wed, 06 Oct 2021 16:05:02 -0400
X-MC-Unique: Nn34J0sEO5uNPtWiLVFxCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5A8750753;
	Wed,  6 Oct 2021 20:04:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8863A17001;
	Wed,  6 Oct 2021 20:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2AF41809C81;
	Wed,  6 Oct 2021 20:04:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196K4ba1020102 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 16:04:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C8DC5C1C5; Wed,  6 Oct 2021 20:04:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A1259AA33;
	Wed,  6 Oct 2021 20:04:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 196K4Z7m025642; 
	Wed, 6 Oct 2021 15:04:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 196K4ZFn025641;
	Wed, 6 Oct 2021 15:04:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  6 Oct 2021 15:04:23 -0500
Message-Id: <1633550663-25571-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1633550663-25571-1-git-send-email-bmarzins@redhat.com>
References: <1633550663-25571-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 8/8] libmultipath: cleanup invalid config handling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add error reporting to the remaining config handlers. If the value is
invalid, do not change the existing config option's value. Also print
an error whenever 0 is returned for an invalid value. When the handler
returns 1, config processing already fails with an error message.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dict.c | 73 +++++++++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index e79fcdd7..8c3b5f72 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -199,8 +199,11 @@ set_yes_no(vector strvec, void *ptr, const char *file, int line_nr)
 
 	if (strcmp(buff, "yes") == 0 || strcmp(buff, "1") == 0)
 		*int_ptr = YN_YES;
-	else
+	else if (strcmp(buff, "no") == 0 || strcmp(buff, "0") == 0)
 		*int_ptr = YN_NO;
+	else
+		condlog(1, "%s line %d, invalid value for %s: \"%s\"",
+			file, line_nr, (char*)VECTOR_SLOT(strvec, 0), buff);
 
 	FREE(buff);
 	return 0;
@@ -221,7 +224,8 @@ set_yes_no_undef(vector strvec, void *ptr, const char *file, int line_nr)
 	else if (strcmp(buff, "yes") == 0 || strcmp(buff, "1") == 0)
 		*int_ptr = YNU_YES;
 	else
-		*int_ptr = YNU_UNDEF;
+		condlog(1, "%s line %d, invalid value for %s: \"%s\"",
+			file, line_nr, (char*)VECTOR_SLOT(strvec, 0), buff);
 
 	FREE(buff);
 	return 0;
@@ -471,9 +475,6 @@ def_find_multipaths_handler(struct config *conf, vector strvec,
 	char *buff;
 	int i;
 
-	if (set_yes_no_undef(strvec, &conf->find_multipaths, file, line_nr) == 0 && conf->find_multipaths != FIND_MULTIPATHS_UNDEF)
-		return 0;
-
 	buff = set_value(strvec);
 	if (!buff)
 		return 1;
@@ -486,9 +487,14 @@ def_find_multipaths_handler(struct config *conf, vector strvec,
 		}
 	}
 
-	if (conf->find_multipaths == YNU_UNDEF) {
-		condlog(0, "illegal value for find_multipaths: %s", buff);
-		conf->find_multipaths = DEFAULT_FIND_MULTIPATHS;
+	if (i >= __FIND_MULTIPATHS_LAST) {
+		if (strcmp(buff, "no") == 0 || strcmp(buff, "0") == 0)
+			conf->find_multipaths = FIND_MULTIPATHS_OFF;
+		else if (strcmp(buff, "yes") == 0 || strcmp(buff, "1") == 0)
+			conf->find_multipaths = FIND_MULTIPATHS_ON;
+		else
+			condlog(1, "%s line %d, invalid value for find_multipaths: \"%s\"",
+				file, line_nr, buff);
 	}
 
 	FREE(buff);
@@ -537,8 +543,10 @@ static int uid_attrs_handler(struct config *conf, vector strvec,
 	if (!val)
 		return 1;
 	if (parse_uid_attrs(val, conf))
-		condlog(1, "error parsing uid_attrs: \"%s\"", val);
-	condlog(3, "parsed %d uid_attrs", VECTOR_SIZE(&conf->uid_attrs));
+		condlog(1, "%s line %d,error parsing uid_attrs: \"%s\"", file,
+			line_nr, val);
+	else
+		condlog(4, "parsed %d uid_attrs", VECTOR_SIZE(&conf->uid_attrs));
 	FREE(val);
 	return 0;
 }
@@ -766,8 +774,11 @@ def_config_dir_handler(struct config *conf, vector strvec, const char *file,
 		       int line_nr)
 {
 	/* this is only valid in the main config file */
-	if (conf->processed_main_config)
+	if (conf->processed_main_config) {
+		condlog(1, "%s line %d, config_dir option only valid in /etc/multipath.conf",
+			file, line_nr);
 		return 0;
+	}
 	return set_path(strvec, &conf->config_dir, file, line_nr);
 }
 declare_def_snprint(config_dir, print_str)
@@ -825,7 +836,9 @@ set_mode(vector strvec, void *ptr, int *flags, const char *file, int line_nr)
 	if (sscanf(buff, "%o", &mode) == 1 && mode <= 0777) {
 		*flags |= (1 << ATTR_MODE);
 		*mode_ptr = mode;
-	}
+	} else
+		condlog(1, "%s line %d, invalid value for mode: \"%s\"",
+			file, line_nr, buff);
 
 	FREE(buff);
 	return 0;
@@ -850,7 +863,9 @@ set_uid(vector strvec, void *ptr, int *flags, const char *file, int line_nr)
 	else if (sscanf(buff, "%u", &uid) == 1){
 		*flags |= (1 << ATTR_UID);
 		*uid_ptr = uid;
-	}
+	} else
+		condlog(1, "%s line %d, invalid value for uid: \"%s\"",
+			file, line_nr, buff);
 
 	FREE(buff);
 	return 0;
@@ -876,7 +891,9 @@ set_gid(vector strvec, void *ptr, int *flags, const char *file, int line_nr)
 	else if (sscanf(buff, "%u", &gid) == 1){
 		*flags |= (1 << ATTR_GID);
 		*gid_ptr = gid;
-	}
+	} else
+		condlog(1, "%s line %d, invalid value for gid: \"%s\"",
+			file, line_nr, buff);
 	FREE(buff);
 	return 0;
 }
@@ -978,7 +995,8 @@ set_dev_loss(vector strvec, void *ptr, const char *file, int line_nr)
 	if (!strcmp(buff, "infinity"))
 		*uint_ptr = MAX_DEV_LOSS_TMO;
 	else if (sscanf(buff, "%u", uint_ptr) != 1)
-		*uint_ptr = DEV_LOSS_TMO_UNSET;
+		condlog(1, "%s line %d, invalid value for dev_loss_tmo: \"%s\"",
+			file, line_nr, buff);
 
 	FREE(buff);
 	return 0;
@@ -1012,13 +1030,19 @@ static int
 set_pgpolicy(vector strvec, void *ptr, const char *file, int line_nr)
 {
 	char * buff;
+	int policy;
 	int *int_ptr = (int *)ptr;
 
 	buff = set_value(strvec);
 	if (!buff)
 		return 1;
 
-	*int_ptr = get_pgpolicy_id(buff);
+	policy = get_pgpolicy_id(buff);
+	if (policy != IOPOLICY_UNDEF)
+		*int_ptr = policy;
+	else
+		condlog(1, "%s line %d, invalid value for path_grouping_policy: \"%s\"",
+			file, line_nr, buff);
 	FREE(buff);
 
 	return 0;
@@ -1131,10 +1155,11 @@ set_rr_weight(vector strvec, void *ptr, const char *file, int line_nr)
 
 	if (!strcmp(buff, "priorities"))
 		*int_ptr = RR_WEIGHT_PRIO;
-
-	if (!strcmp(buff, "uniform"))
+	else if (!strcmp(buff, "uniform"))
 		*int_ptr = RR_WEIGHT_NONE;
-
+	else
+		condlog(1, "%s line %d, invalid value for rr_weight: \"%s\"",
+			file, line_nr, buff);
 	FREE(buff);
 
 	return 0;
@@ -1270,10 +1295,13 @@ def_log_checker_err_handler(struct config *conf, vector strvec,
 	if (!buff)
 		return 1;
 
-	if (strlen(buff) == 4 && !strcmp(buff, "once"))
+	if (!strcmp(buff, "once"))
 		conf->log_checker_err = LOG_CHKR_ERR_ONCE;
-	else if (strlen(buff) == 6 && !strcmp(buff, "always"))
+	else if (!strcmp(buff, "always"))
 		conf->log_checker_err = LOG_CHKR_ERR_ALWAYS;
+	else
+		condlog(1, "%s line %d, invalid value for log_checker_err: \"%s\"",
+			file, line_nr, buff);
 
 	free(buff);
 	return 0;
@@ -1534,7 +1562,8 @@ hw_vpd_vendor_handler(struct config *conf, vector strvec, const char *file,
 			goto out;
 		}
 	}
-	hwe->vpd_vendor_id = 0;
+	condlog(1, "%s line %d, invalid value for vpd_vendor: \"%s\"",
+		file, line_nr, buff);
 out:
 	FREE(buff);
 	return 0;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

