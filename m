Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9921FC870
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 10:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592382083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KLr9o9WI99pNl7Emu3MFw3jbLKVXV2J3yceM8jE+3Vo=;
	b=fYl1BFrRF5m1l3/Uq/8YM+xBXRynO7GpxOs+ACdbEbDEolEAtOr3HR3tH5FqlFzNW9DF3M
	deoLbsMYs1mCUlJloPYhz0hqOgt6n4W6nc6lODqbZAi2fg7kk+GADZ8gP5aAchirmtKqby
	AiyOb9Lvkkvz35mz//gz7bTwN5AkXG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-UnFUhFnpMGaG84jGKFN4jg-1; Wed, 17 Jun 2020 04:21:21 -0400
X-MC-Unique: UnFUhFnpMGaG84jGKFN4jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1891835B52;
	Wed, 17 Jun 2020 08:21:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 550C3768B4;
	Wed, 17 Jun 2020 08:21:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AECE18095FF;
	Wed, 17 Jun 2020 08:21:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GNBXxn019432 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 19:11:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C804FB5523; Tue, 16 Jun 2020 23:11:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A20B5530
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 23:11:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5825B8316EE
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 23:11:31 +0000 (UTC)
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-23-GyvjaSQMN8a3hUEXQqPEHQ-1; 
	Tue, 16 Jun 2020 19:11:28 -0400
X-MC-Unique: GyvjaSQMN8a3hUEXQqPEHQ-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Marius Bakke <marius@devup.no>
To: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com
Date: Wed, 17 Jun 2020 01:11:26 +0200
Message-Id: <20200616231126.18538-1-marius@devup.no>
In-Reply-To: <d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
References: <d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
MIME-Version: 1.0
X-Spam-Score: 4.90
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05GNBXxn019432
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Jun 2020 04:20:55 -0400
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH v2] multipath: Fix compiler warnings when built
	without systemd.
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add ifdef guards for code that is unused when systemd is not available.
---
 libmultipath/config.c |  6 ++++--
 multipathd/main.c     | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index b4d87689..658bec8b 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -696,9 +696,9 @@ process_config_dir(struct config *conf, char *dir)
 	pthread_cleanup_pop(1);
 }
 
+#ifdef USE_SYSTEMD
 static void set_max_checkint_from_watchdog(struct config *conf)
 {
-#ifdef USE_SYSTEMD
 	char *envp = getenv("WATCHDOG_USEC");
 	unsigned long checkint;
 
@@ -714,8 +714,8 @@ static void set_max_checkint_from_watchdog(struct config *conf)
 		condlog(3, "enabling watchdog, interval %ld", checkint);
 		conf->use_watchdog = true;
 	}
-#endif
 }
+#endif
 
 struct config *
 load_config (char * file)
@@ -789,7 +789,9 @@ load_config (char * file)
 	/*
 	 * fill the voids left in the config file
 	 */
+#ifdef USE_SYSTEMD
 	set_max_checkint_from_watchdog(conf);
+#endif
 	if (conf->max_checkint == 0) {
 		if (conf->checkint == CHECKINT_UNDEF)
 			conf->checkint = DEFAULT_CHECKINT;
diff --git a/multipathd/main.c b/multipathd/main.c
index 8baf9abe..ac8ae4c2 100644
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
+#ifdef USE_SYSTEMD
 		enum daemon_status old_state = running_state;
+#endif
 
 		running_state = state;
 		pthread_cond_broadcast(&config_cond);
@@ -272,7 +274,9 @@ int set_config_state(enum daemon_status state)
 	pthread_cleanup_push(config_cleanup, NULL);
 	pthread_mutex_lock(&config_lock);
 	if (running_state != state) {
+#ifdef USE_SYSTEMD
 		enum daemon_status old_state = running_state;
+#endif
 
 		if (running_state == DAEMON_SHUTDOWN)
 			rc = EINVAL;
@@ -2280,7 +2284,9 @@ checkerloop (void *ap)
 	struct timespec last_time;
 	struct config *conf;
 	int foreign_tick = 0;
+#ifdef USE_SYSTEMD
 	bool use_watchdog;
+#endif
 
 	pthread_cleanup_push(rcu_unregister, NULL);
 	rcu_register_thread();
@@ -2294,7 +2300,9 @@ checkerloop (void *ap)
 
 	/* use_watchdog is set from process environment and never changes */
 	conf = get_multipath_config();
+#ifdef USE_SYSTEMD
 	use_watchdog = conf->use_watchdog;
+#endif
 	put_multipath_config(conf);
 
 	while (1) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

