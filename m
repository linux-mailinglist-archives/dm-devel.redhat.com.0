Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA4C2772A2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:39:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-EUt5YQ_yM423A0xbPfuAWA-1; Thu, 24 Sep 2020 09:39:42 -0400
X-MC-Unique: EUt5YQ_yM423A0xbPfuAWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2DD481F02F;
	Thu, 24 Sep 2020 13:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77B581972B;
	Thu, 24 Sep 2020 13:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C68D181A870;
	Thu, 24 Sep 2020 13:39:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdTpj025988 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8B762028E91; Thu, 24 Sep 2020 13:39:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A31C42026F94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43928858294
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-140-icyBXQ6KNJyqjD_LyPoY-g-1;
	Thu, 24 Sep 2020 09:39:24 -0400
X-MC-Unique: icyBXQ6KNJyqjD_LyPoY-g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 31F44B0E6;
	Thu, 24 Sep 2020 13:39:23 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:57 +0200
Message-Id: <20200924133716.14120-3-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdTpj025988
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 02/21] multipathd: avoid sending "READY=1" to
	systemd on early shutdown
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If multipathd gets a shutdown request during initial reconfigure(),
it shouldn't send "READY=1" to systemd. Ensure this by sending
"READY=1" via post_config_state().

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index fa53e96..53a22a4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -189,6 +189,8 @@ static void do_sd_notify(enum daemon_status old_state,
 {
 	char notify_msg[MSG_SIZE];
 	const char *msg;
+	static bool startup_done = false;
+
 	/*
 	 * Checkerloop switches back and forth between idle and running state.
 	 * No need to tell systemd each time.
@@ -205,6 +207,11 @@ static void do_sd_notify(enum daemon_status old_state,
 
 	if (msg && !safe_sprintf(notify_msg, "STATUS=%s", msg))
 		sd_notify(0, notify_msg);
+
+	if (new_state == DAEMON_IDLE && !startup_done) {
+		sd_notify(0, "READY=1");
+		startup_done = true;
+	}
 }
 #endif
 
@@ -2903,9 +2910,6 @@ child (__attribute__((unused)) void *param)
 	struct vectors * vecs;
 	struct multipath * mpp;
 	int i;
-#ifdef USE_SYSTEMD
-	int startup_done = 0;
-#endif
 	int rc;
 	int pid_fd = -1;
 	struct config *conf;
@@ -3065,12 +3069,6 @@ child (__attribute__((unused)) void *param)
 			}
 			lock_cleanup_pop(vecs->lock);
 			post_config_state(DAEMON_IDLE);
-#ifdef USE_SYSTEMD
-			if (!startup_done) {
-				sd_notify(0, "READY=1");
-				startup_done = 1;
-			}
-#endif
 		}
 	}
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

