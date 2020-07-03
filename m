Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B901F213058
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593734868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1xGIiTafq4vv9+l57BidSgH39hdduSbIWKWRRiEZZbw=;
	b=X72LKL7WRplZ3W9iY6bk7QPk5qsSLURONqoOKVoycxucv3cg6JNg2mI9/DsBNrXsWsV6Jm
	KtmUfQiika0qP4VvY+CBTEM1bgpBei7rQ4Ah60+4IYHjf94pOmstQAZvBiRtTSrLF/JPdO
	CMUY1ulC1Zx/QFXi3muQiE2IhQsgHv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-biouOhN6Nx656eoWiTU_JA-1; Thu, 02 Jul 2020 20:07:46 -0400
X-MC-Unique: biouOhN6Nx656eoWiTU_JA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82763EC1A7;
	Fri,  3 Jul 2020 00:07:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF965101042D;
	Fri,  3 Jul 2020 00:07:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89A49180954D;
	Fri,  3 Jul 2020 00:07:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06307EcJ014377 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:07:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20285101042D; Fri,  3 Jul 2020 00:07:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A29810013D2;
	Fri,  3 Jul 2020 00:07:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06307Cvw014121; 
	Thu, 2 Jul 2020 19:07:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06307Ce7014120;
	Thu, 2 Jul 2020 19:07:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:07:05 -0500
Message-Id: <1593734826-14059-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
References: <1593734826-14059-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 6/7] multipath: delegate flushing maps to
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since there can be problems with removing maps outside of multipathd,
multipath should attempt to delegate this command to multipathd.
However, multipathd doesn't attempt to suspend the device, in order
to avoid potential hangs. If delegating to multipathd fails, multipath
should try the remove itself.

Reviewed-by: Martin Wilck <mwilck@suse.com>
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

