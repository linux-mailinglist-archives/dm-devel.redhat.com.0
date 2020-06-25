Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 320A720A6F1
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p5f7oH4ppclXZz7rNGA4ig32MvxkbohQYlwAhof+sOc=;
	b=Wlii3cuCmT4SG96oKj/y7oQXkWOVy0DoVo0CcPXA1enQvooYFa/1UayvPJwLXhmMY6YeUm
	qIO1Tm564GVofmNcGWTdPy3kJiQckNcXmnKYCEDC7/QyUDN07NQIJSTp8WZyhxHQrHAWTo
	EGobFlQonQgpGWMuBsXF13mmv4ElfYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-0neCDEriMyyGO6ggJv7kpQ-1; Thu, 25 Jun 2020 16:42:45 -0400
X-MC-Unique: 0neCDEriMyyGO6ggJv7kpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 404648015FE;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18CE6101E665;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB0491809557;
	Thu, 25 Jun 2020 20:42:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgWUg014066 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17F8517C0F; Thu, 25 Jun 2020 20:42:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737F65D9C9;
	Thu, 25 Jun 2020 20:42:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgTRv028812; 
	Thu, 25 Jun 2020 15:42:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgSNp028811;
	Thu, 25 Jun 2020 15:42:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:20 -0500
Message-Id: <1593117741-28750-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/7] multipath: delegate flushing maps to
	multipathd
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since there can be problems with removing maps outside of multipathd,
multipath should attempt to delegate this command to multipathd.
However, multipathd doesn't attempt to suspend the device, in order
to avoid potential hangs. If delegating to multipathd fails, multipath
should try the remove itself.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/main.c      | 14 ++++++++++++++
 multipath/multipath.8 |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 101fd656..6a24e483 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -820,6 +820,20 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 	if (cmd == CMD_CREATE && conf->force_reload == FORCE_RELOAD_YES) {
 		p += snprintf(p, n, "reconfigure");
 	}
+	else if (cmd == CMD_FLUSH_ONE && dev && dev_type == DEV_DEVMAP) {
+		p += snprintf(p, n, "del map %s", dev);
+		/* multipathd doesn't try as hard, to avoid potentially
+		 * hanging. If it fails, retry with the regular multipath
+		 * command */
+		r = NOT_DELEGATED;
+	}
+	else if (cmd == CMD_FLUSH_ALL) {
+		p += snprintf(p, n, "del maps");
+		/* multipathd doesn't try as hard, to avoid potentially
+		 * hanging. If it fails, retry with the regular multipath
+		 * command */
+		r = NOT_DELEGATED;
+	}
 	/* Add other translations here */
 
 	if (strlen(command) == 0)
diff --git a/multipath/multipath.8 b/multipath/multipath.8
index 6fb8645a..5b29a5d9 100644
--- a/multipath/multipath.8
+++ b/multipath/multipath.8
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
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

