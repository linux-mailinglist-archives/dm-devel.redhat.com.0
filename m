Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 32D501CB856
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 21:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588966447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0O2tmFRfnF6DWxHaH7lFsDoLezzBTZnkhnV7UQDxOlk=;
	b=CwkFUHb+Xmi3ovjQ4aZz4nus6+ZhDcvp3Md+/uTPZPyQX8OBRGU2Qlfp5yYttxGDkRpv29
	O6o8BHPw+oSqZpQWmX5pjlStya4u/h7WFlVNwIEMpTFVT9oxfPe99bvHLYNKCNBJsXEs1Q
	n6YdyiFZJYkL4PmiHGqvcf1kytNoUOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-veadMOa7M8q04SYCNwyA1w-1; Fri, 08 May 2020 15:34:04 -0400
X-MC-Unique: veadMOa7M8q04SYCNwyA1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9646D464;
	Fri,  8 May 2020 19:33:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AEB65D9CA;
	Fri,  8 May 2020 19:33:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5006C4CAA8;
	Fri,  8 May 2020 19:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JXmE6011986 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:33:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B4C32156A3B; Fri,  8 May 2020 19:33:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B5A2156A3A
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62A1E8007DB
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-c9mL7zZoPBCn1UQAF8-IVw-1;
	Fri, 08 May 2020 15:33:40 -0400
X-MC-Unique: c9mL7zZoPBCn1UQAF8-IVw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8FBA3AD26;
	Fri,  8 May 2020 19:33:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  8 May 2020 21:33:02 +0200
Message-Id: <20200508193302.11401-3-mwilck@suse.com>
In-Reply-To: <20200508193302.11401-1-mwilck@suse.com>
References: <20200508193302.11401-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048JXmE6011986
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/2] multipath: add "-e" option to enable foreign
	libraries
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

As we have set "enable_foreign" to "NONE" now by default, users
may find it useful to be able to switch on foreign multipath display
with an extra command line option even if foreign libraries are
not enabled in multipath.conf. Currently this makes only sense
with "multipath -ll", as the nvme library (and foreign libraries
in general) support only the display of status information.

Suggested-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c      | 11 ++++++++++-
 multipath/multipath.8 |  6 ++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/multipath/main.c b/multipath/main.c
index cf9d2a28..af9d757a 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -148,6 +148,7 @@ usage (char * progname)
 		"  -h      print this usage text\n"
 		"  -l      show multipath topology (sysfs and DM info)\n"
 		"  -ll     show multipath topology (maximum info)\n"
+		"  -e      enable foreign libraries with -l/-ll\n"
 		"  -f      flush a multipath device map\n"
 		"  -F      flush all multipath device maps\n"
 		"  -a      add a device wwid to the wwids file\n"
@@ -898,6 +899,7 @@ main (int argc, char *argv[])
 	char *dev = NULL;
 	struct config *conf;
 	int retries = -1;
+	bool enable_foreign = false;
 
 	udev = udev_new();
 	logsink = 0;
@@ -907,7 +909,7 @@ main (int argc, char *argv[])
 	multipath_conf = conf;
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
-	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
+	while ((arg = getopt(argc, argv, ":adcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
 		switch(arg) {
 		case 1: printf("optarg : %s\n",optarg);
 			break;
@@ -1000,6 +1002,9 @@ main (int argc, char *argv[])
 		case 'R':
 			retries = atoi(optarg);
 			break;
+		case 'e':
+			enable_foreign = true;
+			break;
 		case ':':
 			fprintf(stderr, "Missing option argument\n");
 			usage(argv[0]);
@@ -1051,6 +1056,10 @@ main (int argc, char *argv[])
 		condlog(0, "failed to initialize prioritizers");
 		goto out;
 	}
+
+	if ((cmd == CMD_LIST_SHORT || cmd == CMD_LIST_LONG) && enable_foreign)
+		conf->enable_foreign = "";
+
 	/* Failing here is non-fatal */
 	init_foreign(conf->multipath_dir, conf->enable_foreign);
 	if (cmd == CMD_USABLE_PATHS) {
diff --git a/multipath/multipath.8 b/multipath/multipath.8
index 9cdd05a3..6fb8645a 100644
--- a/multipath/multipath.8
+++ b/multipath/multipath.8
@@ -223,6 +223,12 @@ The verbosity level also controls the level of log and debug messages printed to
 Dry run, do not create or update devmaps.
 .
 .TP
+.B \-e
+Enable all foreign libraries. This overrides the
+.I enable_foreign 
+option from \fBmultipath.conf(5)\fR.
+.
+.TP
 .B \-i
 Ignore WWIDs file when processing devices. If
 \fIfind_multipaths strict\fR or \fIfind_multipaths no\fR is set in
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

