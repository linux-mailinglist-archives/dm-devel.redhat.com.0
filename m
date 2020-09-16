Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 834BF26C466
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-lSMgwPRsNfO-9WYcvInngw-1; Wed, 16 Sep 2020 11:39:56 -0400
X-MC-Unique: lSMgwPRsNfO-9WYcvInngw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BB16839A49;
	Wed, 16 Sep 2020 15:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8617512D;
	Wed, 16 Sep 2020 15:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44B9444A6C;
	Wed, 16 Sep 2020 15:39:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdTjt024173 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 980562157F24; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934AA2166B27
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80096101AA45
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-210-Htqc6zk2NUOCfrtLrU_dMQ-1;
	Wed, 16 Sep 2020 11:39:24 -0400
X-MC-Unique: Htqc6zk2NUOCfrtLrU_dMQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5431CB2DF;
	Wed, 16 Sep 2020 15:39:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:01 +0200
Message-Id: <20200916153718.582-3-mwilck@suse.com>
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
References: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdTjt024173
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 02/19] multipathd: avoid sending "READY=1" to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If multipathd gets a shutdown request during initial reconfigure(),
it shouldn't send "READY=1" to systemd. Ensure this by sending
"READY=1" via post_config_state().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index d5e90b2..afc6c99 100644
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
 
@@ -2913,9 +2920,6 @@ child (__attribute__((unused)) void *param)
 	struct vectors * vecs;
 	struct multipath * mpp;
 	int i;
-#ifdef USE_SYSTEMD
-	int startup_done = 0;
-#endif
 	int rc;
 	int pid_fd = -1;
 	struct config *conf;
@@ -3075,12 +3079,6 @@ child (__attribute__((unused)) void *param)
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

