Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 74A9820A6F2
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ztTys/gAvfRU/aMAo/bwq0iTijh7R9bQ0QSw8TwHq4=;
	b=ivAim6xrkN1LdipJ3eZRetyXmla6LJ5OA/xxQjE0o3WGaMGTb27NFmLZzRbTwRpE846SxZ
	XJpK6I4FRWvdWmRCOk6OJenenp7pyTiYGs8aYePUsgTU1hf2Aa4JUsiAss6YiCRFue4ITS
	ZiZC1GJb475Efkcn0WGpxG4wRxxLxPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105--J4pwpw4MDafkiTk4AZwMw-1; Thu, 25 Jun 2020 16:42:47 -0400
X-MC-Unique: -J4pwpw4MDafkiTk4AZwMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 239DF804015;
	Thu, 25 Jun 2020 20:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F343460C80;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B37001809557;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgVad014060 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CA541A912; Thu, 25 Jun 2020 20:42:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8582B1A835;
	Thu, 25 Jun 2020 20:42:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgUNA028816; 
	Thu, 25 Jun 2020 15:42:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgTAo028815;
	Thu, 25 Jun 2020 15:42:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:21 -0500
Message-Id: <1593117741-28750-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 7/7] multipath: add option to skip multipathd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the -D option to allow users to skip delegating commands to
multipathd.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h | 1 +
 multipath/main.c      | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index 6a24e483..4c43314e 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -817,6 +817,9 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 	*p = '\0';
 	n = sizeof(command);
 
+	if (conf->skip_delegate)
+		return NOT_DELEGATED;
+
 	if (cmd == CMD_CREATE && conf->force_reload == FORCE_RELOAD_YES) {
 		p += snprintf(p, n, "reconfigure");
 	}
@@ -890,7 +893,7 @@ main (int argc, char *argv[])
 	multipath_conf = conf;
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
-	while ((arg = getopt(argc, argv, ":adcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
+	while ((arg = getopt(argc, argv, ":adDcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
 		switch(arg) {
 		case 1: printf("optarg : %s\n",optarg);
 			break;
@@ -922,6 +925,9 @@ main (int argc, char *argv[])
 			if (cmd == CMD_CREATE)
 				cmd = CMD_DRY_RUN;
 			break;
+		case 'D':
+			conf->skip_delegate = 1;
+			break;
 		case 'f':
 			cmd = CMD_FLUSH_ONE;
 			break;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

