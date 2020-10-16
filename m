Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE41290365
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:45:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Xsn-D_XiMdOVDOmj93G7Yg-1; Fri, 16 Oct 2020 06:45:42 -0400
X-MC-Unique: Xsn-D_XiMdOVDOmj93G7Yg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7678384BA66;
	Fri, 16 Oct 2020 10:45:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 515935D9F3;
	Fri, 16 Oct 2020 10:45:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F62B5812B;
	Fri, 16 Oct 2020 10:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAjMNS020835 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5E992011559; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F1F2011557
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8839C811E90
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-NjQ_EKj5MNmotgm92jwbPQ-1;
	Fri, 16 Oct 2020 06:45:20 -0400
X-MC-Unique: NjQ_EKj5MNmotgm92jwbPQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B26DCAB5C;
	Fri, 16 Oct 2020 10:45:18 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:45:01 +0200
Message-Id: <20201016104501.8700-30-mwilck@suse.com>
In-Reply-To: <20201016104501.8700-1-mwilck@suse.com>
References: <20201016104501.8700-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAjMNS020835
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 29/29] libmultipath: fix race between log_safe
	and log_thread_stop()
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

log_safe() could race with log_thread_stop(); simply
checking the value of log_thr has never been safe. By converting the
mutexes to static initializers, we avoid having to destroy them, and thus
possibly accessing a destroyed mutex in log_safe(). Furthermore, taking
both the logev_lock and the logq_lock makes sure the logarea isn't freed
while we are writing to it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/log_pthread.c | 39 ++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
index 3c73941..91c9c19 100644
--- a/libmultipath/log_pthread.c
+++ b/libmultipath/log_pthread.c
@@ -17,31 +17,42 @@
 
 static pthread_t log_thr;
 
-static pthread_mutex_t logq_lock;
-static pthread_mutex_t logev_lock;
-static pthread_cond_t logev_cond;
+/* logev_lock must not be taken with logq_lock held */
+static pthread_mutex_t logq_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_mutex_t logev_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t logev_cond = PTHREAD_COND_INITIALIZER;
 
 static int logq_running;
 static int log_messages_pending;
 
 void log_safe (int prio, const char * fmt, va_list ap)
 {
+	bool running;
+
 	if (prio > LOG_DEBUG)
 		prio = LOG_DEBUG;
 
-	if (log_thr == (pthread_t)0) {
-		vsyslog(prio, fmt, ap);
-		return;
-	}
+	/*
+	 * logev_lock protects logq_running. By holding it, we avoid a race
+	 * with log_thread_stop() -> log_close(), which would free the logarea.
+	 */
+	pthread_mutex_lock(&logev_lock);
+	pthread_cleanup_push(cleanup_mutex, &logev_lock);
+	running = logq_running;
 
-	pthread_mutex_lock(&logq_lock);
-	log_enqueue(prio, fmt, ap);
-	pthread_mutex_unlock(&logq_lock);
+	if (running) {
+		pthread_mutex_lock(&logq_lock);
+		pthread_cleanup_push(cleanup_mutex, &logq_lock);
+		log_enqueue(prio, fmt, ap);
+		pthread_cleanup_pop(1);
 
-	pthread_mutex_lock(&logev_lock);
-	log_messages_pending = 1;
-	pthread_cond_signal(&logev_cond);
-	pthread_mutex_unlock(&logev_lock);
+		log_messages_pending = 1;
+		pthread_cond_signal(&logev_cond);
+	}
+	pthread_cleanup_pop(1);
+
+	if (!running)
+		vsyslog(prio, fmt, ap);
 }
 
 static void flush_logqueue (void)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

