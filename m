Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABE421305C
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593734871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gNjHkcwxGZQlHPhCvqgaagY3o6hFGKd81HE6Wdqa0D4=;
	b=CVagt3H14msbB4Iz+E80czdKRwz+SlfYX2qIrdteIMLaZ9PN5Swu5B95CZmvWXnJroC9TK
	l2FqnsPrZMQx8/FMWpJDs+Ry+V4bSxPgdyHrvyXjHBCjFxxxWYGSUdpewtRXUXFWB5ta0D
	jI5yJg/PkJyFWNvx+0y9p7liNjlJFIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-BVAzEugmOoeX0Z71-gCn6g-1; Thu, 02 Jul 2020 20:07:49 -0400
X-MC-Unique: BVAzEugmOoeX0Z71-gCn6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B631009610;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 771C31D1;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D4061809561;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06307Hfu014428 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:07:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5F5473FD1; Fri,  3 Jul 2020 00:07:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF7C5BAD8;
	Fri,  3 Jul 2020 00:07:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06307DxS014125; 
	Thu, 2 Jul 2020 19:07:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06307DrR014124;
	Thu, 2 Jul 2020 19:07:13 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:07:06 -0500
Message-Id: <1593734826-14059-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
References: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 7/7] multipath: add option to skip multipathd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the -D option to allow users to skip delegating commands to
multipathd.

Reviewed-by: Martin Wilck <mwilck@suse.com>
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

