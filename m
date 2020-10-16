Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 47B2D290311
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:44:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-y2FtxmD_M8eDaMHXMFSsig-1; Fri, 16 Oct 2020 06:44:17 -0400
X-MC-Unique: y2FtxmD_M8eDaMHXMFSsig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1D76414D;
	Fri, 16 Oct 2020 10:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1FF5D9DD;
	Fri, 16 Oct 2020 10:44:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AA6158118;
	Fri, 16 Oct 2020 10:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhrUj020174 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95CA22011559; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E142011557
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61E77827EF8
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-26-54t_PORSPla480htUiGG2A-1;
	Fri, 16 Oct 2020 06:43:48 -0400
X-MC-Unique: 54t_PORSPla480htUiGG2A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2AAECAF37;
	Fri, 16 Oct 2020 10:43:46 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:43:14 +0200
Message-Id: <20201016104329.8337-7-mwilck@suse.com>
In-Reply-To: <20201016104329.8337-1-mwilck@suse.com>
References: <20201016104329.8337-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhrUj020174
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 06/21] multipathd: generalize and fix
	wait_for_state_change_if()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

It's unlikely but not impossible that other threads change the state
while we're waiting, and if we grab the lock again, it's still not
what we wanted. We need to continue waiting until either the condition
is met, or time timeout expired.

Moreover, generalize this code so that it can also be used in
set_config_state().

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index d081b3e..1fb0ee6 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -223,6 +223,23 @@ static void config_cleanup(__attribute__((unused)) void *arg)
 	pthread_mutex_unlock(&config_lock);
 }
 
+#define __wait_for_state_change(condition, ms)				\
+	({								\
+		struct timespec tmo;					\
+		int rc = 0;						\
+									\
+		if (condition) {					\
+			get_monotonic_time(&tmo);			\
+			tmo.tv_nsec += (ms) * 1000 * 1000;		\
+			normalize_timespec(&tmo);			\
+			do						\
+				rc = pthread_cond_timedwait(		\
+					&config_cond, &config_lock, &tmo); \
+			while (rc == 0 && (condition));			\
+		}							\
+		rc;							\
+	})
+
 /*
  * If the current status is @oldstate, wait for at most @ms milliseconds
  * for the state to change, and return the new state, which may still be
@@ -232,20 +249,14 @@ enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
 					    unsigned long ms)
 {
 	enum daemon_status st;
-	struct timespec tmo;
 
 	if (oldstate == DAEMON_SHUTDOWN)
 		return DAEMON_SHUTDOWN;
 
 	pthread_mutex_lock(&config_lock);
 	pthread_cleanup_push(config_cleanup, NULL);
+	__wait_for_state_change(running_state == oldstate, ms);
 	st = running_state;
-	if (st == oldstate && clock_gettime(CLOCK_MONOTONIC, &tmo) == 0) {
-		tmo.tv_nsec += ms * 1000 * 1000;
-		normalize_timespec(&tmo);
-		(void)pthread_cond_timedwait(&config_cond, &config_lock, &tmo);
-		st = running_state;
-	}
 	pthread_cleanup_pop(1);
 	return st;
 }
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

