Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 323801D7364
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 11:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589792401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bhhsaluY5sqvw3P2oIJft61DjIvaWXe0sUicbPDAz9g=;
	b=f0oOw9u8wlV+Vb5lHRK5QPUo9syL5mvRT9lB90O94opbpvC7PVtYz50Eb17NHtRM46xMgI
	GmSQQHe3zndOKmiXKTeCy8LCaJYlfPddQuQ1cG10CsQcGFtuDvCKXVM87UciGxtx11DlGn
	fIVh6YrPakWUctHVQ1gO34CYQAYSXwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-fr3afXrdPXm8gzW-qdWLKg-1; Mon, 18 May 2020 04:59:58 -0400
X-MC-Unique: fr3afXrdPXm8gzW-qdWLKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E961800D42;
	Mon, 18 May 2020 08:59:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 675B479587;
	Mon, 18 May 2020 08:59:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23B051809543;
	Mon, 18 May 2020 08:59:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GI4EYC026808 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 14:04:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E62A32029F61; Sat, 16 May 2020 18:04:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E20CB2029F60
	for <dm-devel@redhat.com>; Sat, 16 May 2020 18:04:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9F17101A525
	for <dm-devel@redhat.com>; Sat, 16 May 2020 18:04:09 +0000 (UTC)
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-215-zJFZ9qSeP9eJIaYyUaZM2w-1;
	Sat, 16 May 2020 14:04:06 -0400
X-MC-Unique: zJFZ9qSeP9eJIaYyUaZM2w-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Marius Bakke <marius@devup.no>
To: dm-devel@redhat.com
Date: Sat, 16 May 2020 19:55:08 +0200
Message-Id: <20200516175508.12412-1-marius@devup.no>
MIME-Version: 1.0
X-Spam-Score: 4.90
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04GI4EYC026808
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 18 May 2020 04:59:34 -0400
Subject: [dm-devel] [PATCH] multipath-tools: Fix compiler warnings when
	built without systemd.
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
 libmultipath/config.c |  2 +-
 multipathd/main.c     | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index b4d87689..a28dc4f2 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -696,7 +696,7 @@ process_config_dir(struct config *conf, char *dir)
 	pthread_cleanup_pop(1);
 }
 
-static void set_max_checkint_from_watchdog(struct config *conf)
+static void set_max_checkint_from_watchdog(__attribute__((unused)) struct config *conf)
 {
 #ifdef USE_SYSTEMD
 	char *envp = getenv("WATCHDOG_USEC");
diff --git a/multipathd/main.c b/multipathd/main.c
index 8baf9abe..8d3eace6 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -176,6 +176,7 @@ daemon_status(void)
 /*
  * I love you too, systemd ...
  */
+#ifdef USE_SYSTEMD
 static const char *
 sd_notify_status(enum daemon_status state)
 {
@@ -195,7 +196,6 @@ sd_notify_status(enum daemon_status state)
 	return NULL;
 }
 
-#ifdef USE_SYSTEMD
 static void do_sd_notify(enum daemon_status old_state,
 			 enum daemon_status new_state)
 {
@@ -247,7 +247,9 @@ enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
 static void __post_config_state(enum daemon_status state)
 {
 	if (state != running_state && running_state != DAEMON_SHUTDOWN) {
-		enum daemon_status old_state = running_state;
+		/* save state for sd_notify */
+		enum daemon_status
+			__attribute__((unused)) old_state = running_state;
 
 		running_state = state;
 		pthread_cond_broadcast(&config_cond);
@@ -272,7 +274,9 @@ int set_config_state(enum daemon_status state)
 	pthread_cleanup_push(config_cleanup, NULL);
 	pthread_mutex_lock(&config_lock);
 	if (running_state != state) {
-		enum daemon_status old_state = running_state;
+		/* save state for sd_notify */
+		enum daemon_status
+			__attribute__((unused)) old_state = running_state;
 
 		if (running_state == DAEMON_SHUTDOWN)
 			rc = EINVAL;
@@ -2280,7 +2284,6 @@ checkerloop (void *ap)
 	struct timespec last_time;
 	struct config *conf;
 	int foreign_tick = 0;
-	bool use_watchdog;
 
 	pthread_cleanup_push(rcu_unregister, NULL);
 	rcu_register_thread();
@@ -2292,11 +2295,15 @@ checkerloop (void *ap)
 	get_monotonic_time(&last_time);
 	last_time.tv_sec -= 1;
 
-	/* use_watchdog is set from process environment and never changes */
 	conf = get_multipath_config();
-	use_watchdog = conf->use_watchdog;
 	put_multipath_config(conf);
 
+#ifdef USE_SYSTEMD
+	/* use_watchdog is set from process environment and never changes */
+	bool use_watchdog;
+	use_watchdog = conf->use_watchdog;
+#endif
+
 	while (1) {
 		struct timespec diff_time, start_time, end_time;
 		int num_paths = 0, strict_timing, rc = 0;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

