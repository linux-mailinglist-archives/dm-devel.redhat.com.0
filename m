Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E9FB226C461
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-95uoBLs8Or-Jn3n7mJIbKg-1; Wed, 16 Sep 2020 11:39:59 -0400
X-MC-Unique: 95uoBLs8Or-Jn3n7mJIbKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0222593B2;
	Wed, 16 Sep 2020 15:39:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EF3575261;
	Wed, 16 Sep 2020 15:39:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C26944A6C;
	Wed, 16 Sep 2020 15:39:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdW81024210 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88B91F5578; Wed, 16 Sep 2020 15:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8408FF5ADA
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D2A218AE949
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-366-LKV6X_YxPYmsG3glR3VHIw-1;
	Wed, 16 Sep 2020 11:39:24 -0400
X-MC-Unique: LKV6X_YxPYmsG3glR3VHIw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C38ABB339;
	Wed, 16 Sep 2020 15:39:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:03 +0200
Message-Id: <20200916153718.582-5-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdW81024210
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 04/19] multipathd: send "RELOADING=1" to systemd
	on DAEMON_CONFIGURE state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The logic is as follows: child() sets DAEMON_IDLE status after
DAEMON_CONFIGURE when reconfigure() has finished. The only other state change
that can race with that is DAEMON_SHUTDOWN. Other state changes will wait for
DAEMON_IDLE first (see set_config_state()). When DAEMON_CONFIGURE is entered,
and we are not just starting up, send a "RELOADING=1" message to
systemd. After that, we must send "READY=1" when we're done reloading. Also
do that on startup, when DAEMON_IDLE is set for the first time.
See sd_notify(3).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 2923c08..8cc9b74 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -210,10 +210,11 @@ static void do_sd_notify(enum daemon_status old_state,
 
 	if (new_state == DAEMON_SHUTDOWN)
 		sd_notify(0, "STOPPING=1");
-	else if (new_state == DAEMON_IDLE && !startup_done) {
+	else if (new_state == DAEMON_IDLE && old_state == DAEMON_CONFIGURE) {
 		sd_notify(0, "READY=1");
 		startup_done = true;
-	}
+	} else if (new_state == DAEMON_CONFIGURE && startup_done)
+		sd_notify(0, "RELOADING=1");
 }
 #endif
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

