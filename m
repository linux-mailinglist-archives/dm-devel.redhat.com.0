Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DECB02772D7
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:44:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-b6kkjvX2NjmAemrPRZjclw-1; Thu, 24 Sep 2020 09:44:44 -0400
X-MC-Unique: b6kkjvX2NjmAemrPRZjclw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA691084D7D;
	Thu, 24 Sep 2020 13:44:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA56173693;
	Thu, 24 Sep 2020 13:44:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E6418C7A2;
	Thu, 24 Sep 2020 13:44:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjFb026791 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0732C1140FF; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F34291140F6
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE42F1869B94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-437-a1mTR2gcOkCZveheyndVhQ-1;
	Thu, 24 Sep 2020 09:41:40 -0400
X-MC-Unique: a1mTR2gcOkCZveheyndVhQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4F078B122;
	Thu, 24 Sep 2020 13:41:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:37 +0200
Message-Id: <20200924134054.14632-7-mwilck@suse.com>
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
References: <20200924134054.14632-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjFb026791
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 06/23] multipathd: move threads destruction into
	separate function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Also, introduce booleans that indicate a certain thread has
been started successfully. Using these booleans, we can avoid
crashing by cancelling threads that have never been started.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 76 +++++++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 25 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 1cdbff1..8b9df55 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -129,6 +129,9 @@ static volatile enum daemon_status running_state = DAEMON_INIT;
 pid_t daemon_pid;
 static pthread_mutex_t config_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t config_cond;
+static pthread_t check_thr, uevent_thr, uxlsnr_thr, uevq_thr, dmevent_thr;
+static bool check_thr_started, uevent_thr_started, uxlsnr_thr_started,
+	uevq_thr_started, dmevent_thr_started;
 
 static inline enum daemon_status get_running_state(void)
 {
@@ -2927,6 +2930,39 @@ static void cleanup_vecs(void)
 	FREE(gvecs);
 }
 
+static void cleanup_threads(void)
+{
+	stop_io_err_stat_thread();
+
+	if (check_thr_started)
+		pthread_cancel(check_thr);
+	if (uevent_thr_started)
+		pthread_cancel(uevent_thr);
+	if (uxlsnr_thr_started)
+		pthread_cancel(uxlsnr_thr);
+	if (uevq_thr_started)
+		pthread_cancel(uevq_thr);
+	if (dmevent_thr_started)
+		pthread_cancel(dmevent_thr);
+
+	if (check_thr_started)
+		pthread_join(check_thr, NULL);
+	if (uevent_thr_started)
+		pthread_join(uevent_thr, NULL);
+	if (uxlsnr_thr_started)
+		pthread_join(uxlsnr_thr, NULL);
+	if (uevq_thr_started)
+		pthread_join(uevq_thr, NULL);
+	if (dmevent_thr_started)
+		pthread_join(dmevent_thr, NULL);
+
+	/*
+	 * As all threads are joined now, and we're in DAEMON_SHUTDOWN
+	 * state, no new waiter threads will be created any more.
+	 */
+	pthread_attr_destroy(&waiter_attr);
+}
+
 /*
  * Use a non-default call_rcu_data for child().
  *
@@ -2971,7 +3007,6 @@ static void cleanup_rcu(int dummy __attribute__((unused)), void *arg)
 static int
 child (__attribute__((unused)) void *param)
 {
-	pthread_t check_thr, uevent_thr, uxlsnr_thr, uevq_thr, dmevent_thr;
 	pthread_attr_t log_attr, misc_attr, uevent_attr;
 	struct vectors * vecs;
 	int rc;
@@ -3070,9 +3105,12 @@ child (__attribute__((unused)) void *param)
 		condlog(0, "failed to create cli listener: %d", rc);
 		goto failed;
 	}
-	else if (state != DAEMON_CONFIGURE) {
-		condlog(0, "cli listener failed to start");
-		goto failed;
+	else {
+		uxlsnr_thr_started = true;
+		if (state != DAEMON_CONFIGURE) {
+			condlog(0, "cli listener failed to start");
+			goto failed;
+		}
 	}
 
 	if (poll_dmevents) {
@@ -3085,7 +3123,8 @@ child (__attribute__((unused)) void *param)
 			condlog(0, "failed to create dmevent waiter thread: %d",
 				rc);
 			goto failed;
-		}
+		} else
+			dmevent_thr_started = true;
 	}
 
 	/*
@@ -3094,7 +3133,8 @@ child (__attribute__((unused)) void *param)
 	if ((rc = pthread_create(&uevent_thr, &uevent_attr, ueventloop, udev))) {
 		condlog(0, "failed to create uevent thread: %d", rc);
 		goto failed;
-	}
+	} else
+		uevent_thr_started = true;
 	pthread_attr_destroy(&uevent_attr);
 
 	/*
@@ -3103,11 +3143,13 @@ child (__attribute__((unused)) void *param)
 	if ((rc = pthread_create(&check_thr, &misc_attr, checkerloop, vecs))) {
 		condlog(0,"failed to create checker loop thread: %d", rc);
 		goto failed;
-	}
+	} else
+		check_thr_started = true;
 	if ((rc = pthread_create(&uevq_thr, &misc_attr, uevqloop, vecs))) {
 		condlog(0, "failed to create uevent dispatcher: %d", rc);
 		goto failed;
-	}
+	} else
+		uevq_thr_started = true;
 	pthread_attr_destroy(&misc_attr);
 
 	while (1) {
@@ -3136,22 +3178,7 @@ child (__attribute__((unused)) void *param)
 		}
 	}
 
-	pthread_cancel(check_thr);
-	pthread_cancel(uevent_thr);
-	pthread_cancel(uxlsnr_thr);
-	pthread_cancel(uevq_thr);
-	if (poll_dmevents)
-		pthread_cancel(dmevent_thr);
-
-	pthread_join(check_thr, NULL);
-	pthread_join(uevent_thr, NULL);
-	pthread_join(uxlsnr_thr, NULL);
-	pthread_join(uevq_thr, NULL);
-	if (poll_dmevents)
-		pthread_join(dmevent_thr, NULL);
-
-	stop_io_err_stat_thread();
-
+	cleanup_threads();
 	cleanup_vecs();
 	cleanup_foreign();
 	cleanup_checkers();
@@ -3178,7 +3205,6 @@ child (__attribute__((unused)) void *param)
 	conf = rcu_dereference(multipath_conf);
 	rcu_assign_pointer(multipath_conf, NULL);
 	call_rcu(&conf->rcu, rcu_free_config);
-	pthread_attr_destroy(&waiter_attr);
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

