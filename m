Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E3CA441295E
	for <lists+dm-devel@lfdr.de>; Tue, 21 Sep 2021 01:22:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632180120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g3mxnOc9Pa3C+0E3uQxQa0ZTCltT8nbn9uIujuSEWss=;
	b=hzu2Bn2uk8VVXa7WcXqBksBWFEPTj9s61EIw7S8HgmGThIma3MFjl4NgFuN0MzAtrSIgH4
	oSQSkAkaSFuvl5Avvys0uBm9xBxcgv4Etn6f2nXi6cJ/iqdpUDL/O0niVL7LM70vEcDOMZ
	Gr8C5C9oJV7/pbzn5g4cAFEI8t7bsUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-Kxo2_2iuOPiwHVlmoI_u4Q-1; Mon, 20 Sep 2021 19:21:57 -0400
X-MC-Unique: Kxo2_2iuOPiwHVlmoI_u4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF8B6824FAD;
	Mon, 20 Sep 2021 23:21:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0386B55B;
	Mon, 20 Sep 2021 23:21:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A33C180598A;
	Mon, 20 Sep 2021 23:21:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KNLTd7025921 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 19:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CDF217B5B; Mon, 20 Sep 2021 23:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D64C85DF26;
	Mon, 20 Sep 2021 23:21:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18KNLLAW009348; 
	Mon, 20 Sep 2021 18:21:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18KNLLMI009347;
	Mon, 20 Sep 2021 18:21:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 20 Sep 2021 18:21:16 -0500
Message-Id: <1632180076-9294-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1632180076-9294-1-git-send-email-bmarzins@redhat.com>
References: <1632180076-9294-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/4] multipathd: add "reconfigure all" command.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With this commit, multipathd no longer defaults to full reconfigures for
the "reconfigure" command and the HUP signal. The default is a weak
reconfigure. A new command, "reconfigure all", has been added to do
a full reconfigure.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/main.c          |  2 +-
 multipathd/cli.c          |  1 +
 multipathd/cli.h          |  2 ++
 multipathd/cli_handlers.c | 10 ++++++++++
 multipathd/main.c         |  2 +-
 5 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 65ece830..7b9797ec 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -759,7 +759,7 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 		return NOT_DELEGATED;
 
 	if (cmd == CMD_CREATE && conf->force_reload == FORCE_RELOAD_YES) {
-		p += snprintf(p, n, "reconfigure");
+		p += snprintf(p, n, "reconfigure all");
 	}
 	else if (cmd == CMD_FLUSH_ONE && dev && dev_type == DEV_DEVMAP) {
 		p += snprintf(p, n, "del map %s", dev);
diff --git a/multipathd/cli.c b/multipathd/cli.c
index 414f6608..d9308bdf 100644
--- a/multipathd/cli.c
+++ b/multipathd/cli.c
@@ -212,6 +212,7 @@ load_keys (void)
 	r += add_key(keys, "local", LOCAL, 0);
 	r += add_key(keys, "setmarginal", SETMARGINAL, 0);
 	r += add_key(keys, "unsetmarginal", UNSETMARGINAL, 0);
+	r += add_key(keys, "all", ALL, 0);
 
 
 	if (r) {
diff --git a/multipathd/cli.h b/multipathd/cli.h
index fcb6af00..bba705e8 100644
--- a/multipathd/cli.h
+++ b/multipathd/cli.h
@@ -47,6 +47,7 @@ enum {
 	__LOCAL,			/* 40 */
 	__SETMARGINAL,
 	__UNSETMARGINAL,
+	__ALL,
 };
 
 #define LIST		(1ULL << __LIST)
@@ -93,6 +94,7 @@ enum {
 #define LOCAL		(1ULL << __LOCAL)
 #define SETMARGINAL	(1ULL << __SETMARGINAL)
 #define UNSETMARGINAL	(1ULL << __UNSETMARGINAL)
+#define ALL		(1ULL << __ALL)
 
 #define INITIAL_REPLY_LEN	1200
 
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index b12a4e7e..58b9916c 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -1012,6 +1012,15 @@ cli_reconfigure(void * v, struct strbuf *reply, void * data)
 {
 	condlog(2, "reconfigure (operator)");
 
+	schedule_reconfigure(false);
+	return 0;
+}
+
+int
+cli_reconfigure_all(void * v, struct strbuf *reply, void * data)
+{
+	condlog(2, "reconfigure all (operator)");
+
 	schedule_reconfigure(true);
 	return 0;
 }
@@ -1497,6 +1506,7 @@ void init_handler_callbacks(void)
 	set_handler_callback(DEL+MAPS, cli_del_maps);
 	set_handler_callback(SWITCH+MAP+GROUP, cli_switch_group);
 	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
+	set_unlocked_handler_callback(RECONFIGURE+ALL, cli_reconfigure_all);
 	set_handler_callback(SUSPEND+MAP, cli_suspend);
 	set_handler_callback(RESUME+MAP, cli_resume);
 	set_handler_callback(RESIZE+MAP, cli_resize);
diff --git a/multipathd/main.c b/multipathd/main.c
index 5c831e8d..cc4a4a5d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2817,7 +2817,7 @@ handle_signals(bool nonfatal)
 		return;
 	if (reconfig_sig) {
 		condlog(2, "reconfigure (signal)");
-		schedule_reconfigure(true);
+		schedule_reconfigure(false);
 	}
 	if (log_reset_sig) {
 		condlog(2, "reset log (signal)");
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

