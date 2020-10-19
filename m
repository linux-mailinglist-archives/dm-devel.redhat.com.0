Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7562936B5
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 10:23:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-_eSJqyqmOWqYzak7WGDiDg-1; Tue, 20 Oct 2020 04:22:49 -0400
X-MC-Unique: _eSJqyqmOWqYzak7WGDiDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D1011087D6A;
	Tue, 20 Oct 2020 08:22:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15486100239A;
	Tue, 20 Oct 2020 08:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1AEC8C7BD;
	Tue, 20 Oct 2020 08:22:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JBK7L5022425 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 07:20:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44E8612EC0F; Mon, 19 Oct 2020 11:20:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6D712EC05
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 11:20:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB7F8800883
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 11:20:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-396-kt-7LDV8NDu0PNo2szNJ0g-1;
	Mon, 19 Oct 2020 07:20:04 -0400
X-MC-Unique: kt-7LDV8NDu0PNo2szNJ0g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 29359B2E6;
	Mon, 19 Oct 2020 11:20:03 +0000 (UTC)
From: Anthony Iliopoulos <ailiop@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 19 Oct 2020 13:20:17 +0200
Message-Id: <20201019112017.18544-4-ailiop@suse.com>
In-Reply-To: <20201019112017.18544-1-ailiop@suse.com>
References: <20201019112017.18544-1-ailiop@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09JBK7L5022425
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Oct 2020 04:22:10 -0400
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/3] multipathd: fix compilation on systems
	without systemd
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hide sd_notify_status as well as a bunch of variables that are specific
to systemd notifications behind ifdefs. This fixes compilation on
non-systemd environments due to -Werror and gcc detecting unused
variables and functions.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 multipathd/main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 8baf9abe30a6..5dd256284f61 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -173,6 +173,7 @@ daemon_status(void)
 	return NULL;
 }
 
+#ifdef USE_SYSTEMD
 /*
  * I love you too, systemd ...
  */
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
@@ -2292,10 +2298,12 @@ checkerloop (void *ap)
 	get_monotonic_time(&last_time);
 	last_time.tv_sec -= 1;
 
+#ifdef USE_SYSTEMD
 	/* use_watchdog is set from process environment and never changes */
 	conf = get_multipath_config();
 	use_watchdog = conf->use_watchdog;
 	put_multipath_config(conf);
+#endif
 
 	while (1) {
 		struct timespec diff_time, start_time, end_time;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

