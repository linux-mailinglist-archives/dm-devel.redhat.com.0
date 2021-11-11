Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666F44CE91
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 02:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636592836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uysnnKcmerQQgcW+R9wCw+KYX1qZbsnhp3YYOw720bY=;
	b=cYOSxeKOx3OzUYeMDDGipDlUcH46UoWFdcrgqPg4r+firZ9YgckkyrZISiTCfrlXdhGFky
	7ZbenOtLcGgzaw/VFYOEsOW/o1BzKnB+4FZnzYoDRAd9MLJ/plKyHGgik4TaIeoQyfNKJP
	muzCCnFJj2UXTCwoivotD/T193j8/4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-57nx5va0PoiNSoiZJr4w8Q-1; Wed, 10 Nov 2021 20:07:13 -0500
X-MC-Unique: 57nx5va0PoiNSoiZJr4w8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D66F81006AA1;
	Thu, 11 Nov 2021 01:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B372D17567;
	Thu, 11 Nov 2021 01:07:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC8E34EA29;
	Thu, 11 Nov 2021 01:07:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AB16cuN013160 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 20:06:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B42360CA0; Thu, 11 Nov 2021 01:06:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D7760CC4;
	Thu, 11 Nov 2021 01:06:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AB16ZnH020457; 
	Wed, 10 Nov 2021 19:06:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AB16ZM2020456;
	Wed, 10 Nov 2021 19:06:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 10 Nov 2021 19:06:18 -0600
Message-Id: <1636592780-20391-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
References: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 7/9] libmultipath: deprecate file and
	directory config options
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Having multipath able to select pathnames for the files and directories
it needs causes unnecessary maintainer headaches. Mark these as
deprecated, but still support them for now.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dict.c        | 40 +++++++++++++++++++++++++++++---------
 multipath/multipath.conf.5 |  5 +++++
 2 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 149d3348..1b4e1106 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -268,6 +268,15 @@ def_ ## option ## _handler (struct config *conf, vector strvec,		\
 	return function (strvec, &conf->option, file, line_nr);		\
 }
 
+#define declare_def_warn_handler(option, function)			\
+static int								\
+def_ ## option ## _handler (struct config *conf, vector strvec,		\
+			    const char *file, int line_nr)		\
+{									\
+	condlog(2, "%s line %d, \"" #option "\" is deprecated and will be disabled in a future release", file, line_nr);				\
+	return function (strvec, &conf->option, file, line_nr);		\
+}
+
 #define declare_def_range_handler(option, minval, maxval)			\
 static int								\
 def_ ## option ## _handler (struct config *conf, vector strvec,         \
@@ -284,6 +293,17 @@ snprint_def_ ## option (struct config *conf, struct strbuf *buff,	\
 	return function(buff, conf->option);				\
 }
 
+#define declare_def_snprint_non_defstr(option, function, value)		\
+static int								\
+snprint_def_ ## option (struct config *conf, struct strbuf *buff,	\
+			const void *data)				\
+{									\
+	static const char *s = value;					\
+	if (!conf->option || strcmp(conf->option, s) == 0)		\
+		return 0;						\
+	return function(buff, conf->option);				\
+}
+
 #define declare_def_snprint_defint(option, function, value)		\
 static int								\
 snprint_def_ ## option (struct config *conf, struct strbuf *buff,	\
@@ -421,8 +441,8 @@ declare_def_snprint(verbosity, print_int)
 declare_def_handler(reassign_maps, set_yes_no)
 declare_def_snprint(reassign_maps, print_yes_no)
 
-declare_def_handler(multipath_dir, set_dir)
-declare_def_snprint(multipath_dir, print_str)
+declare_def_warn_handler(multipath_dir, set_dir)
+declare_def_snprint_non_defstr(multipath_dir, print_str, DEFAULT_MULTIPATHDIR)
 
 static int def_partition_delim_handler(struct config *conf, vector strvec,
 				       const char *file, int line_nr)
@@ -654,14 +674,14 @@ declare_hw_snprint(user_friendly_names, print_yes_no_undef)
 declare_mp_handler(user_friendly_names, set_yes_no_undef)
 declare_mp_snprint(user_friendly_names, print_yes_no_undef)
 
-declare_def_handler(bindings_file, set_path)
-declare_def_snprint(bindings_file, print_str)
+declare_def_warn_handler(bindings_file, set_path)
+declare_def_snprint_non_defstr(bindings_file, print_str, DEFAULT_BINDINGS_FILE)
 
-declare_def_handler(wwids_file, set_path)
-declare_def_snprint(wwids_file, print_str)
+declare_def_warn_handler(wwids_file, set_path)
+declare_def_snprint_non_defstr(wwids_file, print_str, DEFAULT_WWIDS_FILE)
 
-declare_def_handler(prkeys_file, set_path)
-declare_def_snprint(prkeys_file, print_str)
+declare_def_warn_handler(prkeys_file, set_path)
+declare_def_snprint_non_defstr(prkeys_file, print_str, DEFAULT_PRKEYS_FILE)
 
 declare_def_handler(retain_hwhandler, set_yes_no_undef)
 declare_def_snprint_defint(retain_hwhandler, print_yes_no_undef,
@@ -760,9 +780,11 @@ def_config_dir_handler(struct config *conf, vector strvec, const char *file,
 	/* this is only valid in the main config file */
 	if (conf->processed_main_config)
 		return 0;
+	condlog(2, "%s line %d, \"config_dir\" is deprecated and will be disabled in a future release",
+		file, line_nr);
 	return set_path(strvec, &conf->config_dir, file, line_nr);
 }
-declare_def_snprint(config_dir, print_str)
+declare_def_snprint_non_defstr(config_dir, print_str, DEFAULT_CONFIG_DIR)
 
 #define declare_def_attr_handler(option, function)			\
 static int								\
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 42a15ffd..17771e27 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -178,6 +178,7 @@ The default is: \fBno\fR
 .
 .TP
 .B multipath_dir
+This option is deprecated, and will be removed in a future release.
 Directory where the dynamic shared objects are stored. Defined at compile time,
 commonly \fI/lib64/multipath/\fR or \fI/lib/multipath/\fR.
 .RS
@@ -742,6 +743,7 @@ The default is: \fB<unset>\fR
 .
 .TP
 .B bindings_file
+This option is deprecated, and will be removed in a future release.
 The full pathname of the binding file to be used when the user_friendly_names
 option is set.
 .RS
@@ -752,6 +754,7 @@ The default is: \fB/etc/multipath/bindings\fR
 .
 .TP
 .B wwids_file
+This option is deprecated, and will be removed in a future release.
 The full pathname of the WWIDs file, which is used by multipath to keep track
 of the WWIDs for LUNs it has created multipath devices on in the past.
 .RS
@@ -762,6 +765,7 @@ The default is: \fB/etc/multipath/wwids\fR
 .
 .TP
 .B prkeys_file
+This option is deprecated, and will be removed in a future release.
 The full pathname of the prkeys file, which is used by multipathd to keep
 track of the persistent reservation key used for a specific WWID, when
 \fIreservation_key\fR is set to \fBfile\fR.
@@ -933,6 +937,7 @@ The default is: \fB<unset>\fR
 .
 .TP
 .B config_dir
+This option is deprecated, and will be removed in a future release.
 If set to anything other than "", multipath will search this directory
 alphabetically for file ending in ".conf" and it will read configuration
 information from them, just as if it was in \fI/etc/multipath.conf\fR.
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

