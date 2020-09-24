Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A73412772FD
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-ABtghoABOLGaB3-abKgVsg-1; Thu, 24 Sep 2020 09:46:21 -0400
X-MC-Unique: ABtghoABOLGaB3-abKgVsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E5480B71B;
	Thu, 24 Sep 2020 13:46:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68B5855792;
	Thu, 24 Sep 2020 13:46:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 213F61826D2C;
	Thu, 24 Sep 2020 13:46:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfmQ4026894 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93CBC10064E1; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E7F5100619B
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765E5811E94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-40-hmMZwNuSOCiJpx4O-5mGeg-1;
	Thu, 24 Sep 2020 09:41:43 -0400
X-MC-Unique: hmMZwNuSOCiJpx4O-5mGeg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EEDD2B183;
	Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:49 +0200
Message-Id: <20200924134054.14632-19-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfmQ4026894
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 18/23] libmultipath: fix log_thread startup and
	teardown
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This fixes several issues with the log_thread. First, the running
flag logq_running should be set by the thread itself, not by
log_thread_start()/_stop(). Second, the thread was both cancelled and
terminated via a flag (again, logq_running). It's sufficient,
and better, to just cancel it and use logq_running as indication for
successful termination. Third, the locking wasn't cancel-safe in some
places. Forth, log_thread_start() and log_thread_stop() didn't wait for
startup/teardown properly. Fifth, using (pthread_t)0 is wrong (pthread_t is
opaque; there's no guarantee that 0 is not a valid pthread_t value). Finally,
pthread_cancel() was called under logq_lock, which doesn't make sense to
me at all.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/log_pthread.c | 59 ++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
index 0c327ff..5825e66 100644
--- a/libmultipath/log_pthread.c
+++ b/libmultipath/log_pthread.c
@@ -13,6 +13,7 @@
 #include "log_pthread.h"
 #include "log.h"
 #include "lock.h"
+#include "util.h"
 
 static pthread_t log_thr;
 
@@ -56,28 +57,45 @@ static void flush_logqueue (void)
 	} while (empty == 0);
 }
 
+static void cleanup_log_thread(__attribute((unused)) void *arg)
+{
+	logdbg(stderr, "log thread exiting");
+	pthread_mutex_lock(&logev_lock);
+	logq_running = 0;
+	pthread_cond_signal(&logev_cond);
+	pthread_mutex_unlock(&logev_lock);
+}
+
 static void * log_thread (__attribute__((unused)) void * et)
 {
 	int running;
 
 	pthread_mutex_lock(&logev_lock);
-	logq_running = 1;
+	running = logq_running;
+	if (!running)
+		logq_running = 1;
+	pthread_cond_signal(&logev_cond);
 	pthread_mutex_unlock(&logev_lock);
+	if (running)
+		/* already started */
+		return NULL;
+	pthread_cleanup_push(cleanup_log_thread, NULL);
 
 	mlockall(MCL_CURRENT | MCL_FUTURE);
 	logdbg(stderr,"enter log_thread\n");
 
 	while (1) {
 		pthread_mutex_lock(&logev_lock);
-		if (logq_running && !log_messages_pending)
+		pthread_cleanup_push(cleanup_mutex, &logev_lock);
+		while (!log_messages_pending)
+			/* this is a cancellation point */
 			pthread_cond_wait(&logev_cond, &logev_lock);
 		log_messages_pending = 0;
-		running = logq_running;
-		pthread_mutex_unlock(&logev_lock);
-		if (!running)
-			break;
+		pthread_cleanup_pop(1);
+
 		flush_logqueue();
 	}
+	pthread_cleanup_pop(1);
 	return NULL;
 }
 
@@ -98,6 +116,12 @@ void log_thread_start (pthread_attr_t *attr)
 		exit(1);
 	}
 
+	pthread_mutex_lock(&logev_lock);
+	pthread_cleanup_push(cleanup_mutex, &logev_lock);
+	/* wait for thread startup */
+	while (!logq_running)
+		pthread_cond_wait(&logev_cond, &logev_lock);
+	pthread_cleanup_pop(1);
 	return;
 }
 
@@ -112,21 +136,26 @@ void log_thread_reset (void)
 
 void log_thread_stop (void)
 {
+	int running;
+
 	if (!la)
 		return;
-
 	logdbg(stderr,"enter log_thread_stop\n");
 
 	pthread_mutex_lock(&logev_lock);
-	logq_running = 0;
-	pthread_cond_signal(&logev_cond);
-	pthread_mutex_unlock(&logev_lock);
+	pthread_cleanup_push(cleanup_mutex, &logev_lock);
+	running = logq_running;
+	if (running) {
+		pthread_cancel(log_thr);
+		pthread_cond_signal(&logev_cond);
+	}
+	while (logq_running)
+		pthread_cond_wait(&logev_cond, &logev_lock);
+	pthread_cleanup_pop(1);
+
+	if (running)
+		pthread_join(log_thr, NULL);
 
-	pthread_mutex_lock(&logq_lock);
-	pthread_cancel(log_thr);
-	pthread_mutex_unlock(&logq_lock);
-	pthread_join(log_thr, NULL);
-	log_thr = (pthread_t)0;
 
 	flush_logqueue();
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

