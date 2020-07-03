Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D9B9321305E
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593734951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Tt0mWOmQMnIOw/PVs3fR8QJB+BQKydr75cnxyTEy0M=;
	b=fo7zGVr2mjw4s85W/gH7K0laku2vmwl7w/owhqiwnXLtfHYJVvJcS1/NJ8ZsuD+6uD0I5l
	nJ2B+J8yZeMZbTY+lhLUb/gymFpmpxSI2+x0KSkSHMNFip8T/nFvXkFJZZOD8sPRQzJB5e
	O6XWywPVfz6zyPwmaXROrwUVaX58mjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-XpD5e2rBPEiMzHJ0WWZFfg-1; Thu, 02 Jul 2020 20:07:52 -0400
X-MC-Unique: XpD5e2rBPEiMzHJ0WWZFfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BC76EC1A3;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7750F101F69D;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EC8B1809563;
	Fri,  3 Jul 2020 00:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06307D7m014362 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:07:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27A5610027AC; Fri,  3 Jul 2020 00:07:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1164410013D2;
	Fri,  3 Jul 2020 00:07:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06307BOt014117; 
	Thu, 2 Jul 2020 19:07:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06307BxV014116;
	Thu, 2 Jul 2020 19:07:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:07:04 -0500
Message-Id: <1593734826-14059-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
References: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 5/7] multipath: make flushing maps work like
	other commands
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The config structure doesn't need a special variable just for removes.
Multipath can just use the cmd variable, like it does for the other
commands.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h    |  3 ++-
 libmultipath/configure.h |  3 ---
 multipath/main.c         | 20 ++++++++++----------
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index ceecff2d..55569360 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -38,6 +38,8 @@ enum mpath_cmds {
 	CMD_ADD_WWID,
 	CMD_USABLE_PATHS,
 	CMD_DUMP_CONFIG,
+	CMD_FLUSH_ONE,
+	CMD_FLUSH_ALL,
 };
 
 enum force_reload_types {
@@ -142,7 +144,6 @@ struct config {
 	unsigned int max_checkint;
 	bool use_watchdog;
 	int pgfailback;
-	int remove;
 	int rr_weight;
 	int no_path_retry;
 	int user_friendly_names;
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index d7509000..0e33bf40 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -45,9 +45,6 @@ enum {
 	CP_RETRY,
 };
 
-#define FLUSH_ONE 1
-#define FLUSH_ALL 2
-
 struct vectors;
 
 int setup_map (struct multipath * mpp, char * params, int params_size,
diff --git a/multipath/main.c b/multipath/main.c
index d89f0a91..101fd656 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -909,10 +909,10 @@ main (int argc, char *argv[])
 				cmd = CMD_DRY_RUN;
 			break;
 		case 'f':
-			conf->remove = FLUSH_ONE;
+			cmd = CMD_FLUSH_ONE;
 			break;
 		case 'F':
-			conf->remove = FLUSH_ALL;
+			cmd = CMD_FLUSH_ALL;
 			break;
 		case 'l':
 			if (optarg && !strncmp(optarg, "l", 1))
@@ -1053,6 +1053,10 @@ main (int argc, char *argv[])
 		condlog(0, "the -w option requires a device");
 		goto out;
 	}
+	if (cmd == CMD_FLUSH_ONE && dev_type != DEV_DEVMAP) {
+		condlog(0, "the -f option requires a map name to remove");
+		goto out;
+	}
 
 	switch(delegate_to_multipathd(cmd, dev, dev_type, conf)) {
 	case DELEGATE_OK:
@@ -1086,16 +1090,12 @@ main (int argc, char *argv[])
 	}
 	if (retries < 0)
 		retries = conf->remove_retries;
-	if (conf->remove == FLUSH_ONE) {
-		if (dev_type == DEV_DEVMAP) {
-			r = dm_suspend_and_flush_map(dev, retries) ?
-				RTVL_FAIL : RTVL_OK;
-		} else
-			condlog(0, "must provide a map name to remove");
-
+	if (cmd == CMD_FLUSH_ONE) {
+		r = dm_suspend_and_flush_map(dev, retries) ?
+		    RTVL_FAIL : RTVL_OK;
 		goto out;
 	}
-	else if (conf->remove == FLUSH_ALL) {
+	else if (cmd == CMD_FLUSH_ALL) {
 		r = dm_flush_maps(1, retries) ? RTVL_FAIL : RTVL_OK;
 		goto out;
 	}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

