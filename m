Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E69811FDA2E
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X1jz0CebPYLjCACkQOUV7JAQZQOmv9a+PpgfU3b0vlU=;
	b=Se5FbLQEjTB9mOV64R5D2iuPXyYgVVbFbzLQxLLc/kHzq1VK2HUM9L/ygDGcfS5IRN1d+C
	SRs/FkybZXfK+MVJyA7SPCPhaXQoXogkGToCJR3Ihb9XOkPO+suAulNNkyXnHt5Xyh33c5
	ESDIoE2oHobWNr/YY0NGkVQqoCQ+qA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-iCfnca61Nwqfv_MLetrRSw-1; Wed, 17 Jun 2020 20:25:10 -0400
X-MC-Unique: iCfnca61Nwqfv_MLetrRSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C66B7835B47;
	Thu, 18 Jun 2020 00:25:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A588D512FE;
	Thu, 18 Jun 2020 00:25:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6404F833BD;
	Thu, 18 Jun 2020 00:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0Ofsq026557 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C50E5EE0E; Thu, 18 Jun 2020 00:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 237357E59A;
	Thu, 18 Jun 2020 00:24:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0Oa6X018493; 
	Wed, 17 Jun 2020 19:24:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OaRt018492;
	Wed, 17 Jun 2020 19:24:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:27 -0500
Message-Id: <1592439867-18427-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 7/7] multipath: add option to skip multipathd
	delegation
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the -D option to allow users to skip delegating commands to
multipathd.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h |  1 +
 multipath/main.c      | 15 +++++++++++----
 multipath/multipath.8 | 16 +++++++++++-----
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index 55569360..92c61a0d 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -190,6 +190,7 @@ struct config {
 	int ghost_delay;
 	int find_multipaths_timeout;
 	int marginal_pathgroups;
+	int skip_delegate;
 	unsigned int version[3];
 	unsigned int sequence_nr;
 
diff --git a/multipath/main.c b/multipath/main.c
index 6a24e483..0cf7608f 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -130,9 +130,9 @@ usage (char * progname)
 {
 	fprintf (stderr, VERSION_STRING);
 	fprintf (stderr, "Usage:\n");
-	fprintf (stderr, "  %s [-v level] [-B|-d|-i|-q|-r] [-b file] [-p policy] [device]\n", progname);
-	fprintf (stderr, "  %s [-v level] [-R retries] -f device\n", progname);
-	fprintf (stderr, "  %s [-v level] [-R retries] -F\n", progname);
+	fprintf (stderr, "  %s [-v level] [-B|-d|-D|-i|-q|-r] [-b file] [-p policy] [device]\n", progname);
+	fprintf (stderr, "  %s [-v level] [-D|-R retries] -f device\n", progname);
+	fprintf (stderr, "  %s [-v level] [-D|-R retries] -F\n", progname);
 	fprintf (stderr, "  %s [-v level] [-l|-ll] [device]\n", progname);
 	fprintf (stderr, "  %s [-v level] [-a|-w] device\n", progname);
 	fprintf (stderr, "  %s [-v level] -W\n", progname);
@@ -153,6 +153,7 @@ usage (char * progname)
 		"  -C      check if a multipath device has usable paths\n"
 		"  -q      allow queue_if_no_path when multipathd is not running\n"
 		"  -d      dry run, do not create or update devmaps\n"
+		"  -D      Do not delegate command to multipathd\n"
 		"  -t      display the currently used multipathd configuration\n"
 		"  -T      display the multipathd configuration without builtin defaults\n"
 		"  -r      force devmap reload\n"
@@ -817,6 +818,9 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 	*p = '\0';
 	n = sizeof(command);
 
+	if (conf->skip_delegate)
+		return NOT_DELEGATED;
+
 	if (cmd == CMD_CREATE && conf->force_reload == FORCE_RELOAD_YES) {
 		p += snprintf(p, n, "reconfigure");
 	}
@@ -890,7 +894,7 @@ main (int argc, char *argv[])
 	multipath_conf = conf;
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
-	while ((arg = getopt(argc, argv, ":adcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
+	while ((arg = getopt(argc, argv, ":adDcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
 		switch(arg) {
 		case 1: printf("optarg : %s\n",optarg);
 			break;
@@ -922,6 +926,9 @@ main (int argc, char *argv[])
 			if (cmd == CMD_CREATE)
 				cmd = CMD_DRY_RUN;
 			break;
+		case 'D':
+			conf->skip_delegate = 1;
+			break;
 		case 'f':
 			cmd = CMD_FLUSH_ONE;
 			break;
diff --git a/multipath/multipath.8 b/multipath/multipath.8
index 6fb8645a..16a27363 100644
--- a/multipath/multipath.8
+++ b/multipath/multipath.8
@@ -22,7 +22,7 @@ multipath \- Device mapper target autoconfig.
 .B multipath
 .RB [\| \-v\ \c
 .IR level \|]
-.RB [\| \-B | \-d | \-i | \-q | \-r \|]
+.RB [\| \-B | \-d | \-D | \-i | \-q | \-r \|]
 .RB [\| \-b\ \c
 .IR file \|]
 .RB [\| \-p\ \c
@@ -33,7 +33,7 @@ multipath \- Device mapper target autoconfig.
 .B multipath
 .RB [\| \-v\ \c
 .IR level \|]
-.RB [\| \-R\ \c
+.RB [\| \-D | \-R\ \c
 .IR retries \|]
 .B \-f device
 .
@@ -41,7 +41,7 @@ multipath \- Device mapper target autoconfig.
 .B multipath
 .RB [\| \-v\ \c
 .IR level \|]
-.RB [\| \-R\ \c
+.RB [\| \-D | \-R\ \c
 .IR retries \|]
 .B \-F
 .
@@ -125,11 +125,11 @@ the system.
 Other operation modes are chosen by using one of the following command line switches:
 .TP
 .B \-f
-Flush (remove) a multipath device map specified as parameter, if unused.
+Flush (remove) a multipath device map specified as parameter, if unused. This operation is delegated to the multipathd daemon if it's running.
 .
 .TP
 .B \-F
-Flush (remove) all unused multipath device maps.
+Flush (remove) all unused multipath device maps. This operation is delegated to the multipathd daemon if it's running.
 .
 .TP
 .B \-l
@@ -223,6 +223,12 @@ The verbosity level also controls the level of log and debug messages printed to
 Dry run, do not create or update devmaps.
 .
 .TP
+.B \-D
+Do not delegate operation to multipathd. By default, multipath delegates
+forced reloads and flushes (removes) to multipathd. Setting this option will
+cause the multipath command to execute these operations itself.
+.
+.TP
 .B \-e
 Enable all foreign libraries. This overrides the
 .I enable_foreign 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

