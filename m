Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3D90424783
	for <lists+dm-devel@lfdr.de>; Wed,  6 Oct 2021 21:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633549821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AtFGtyqwDISIGxcfLhbhfuwiZ6cjonRdsBIPx6WIpYA=;
	b=ihcWsdZCpugBJOV2d/NYAaOHfsv66i+hO9r4VEsYJgzikaJHKihT+my/K0+qV+dsA8mBsb
	XKDKsJVWtNRiC+qVTRMMQrXyCiT0o9ijL77itQgSLSzCh0KUlCIHwon3DCVJKZZTTLvAHc
	v20tVlpca/r7IkSPq6BWB4IBfFBQ2U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dlR56Y1FO3OHRC_rLkz31A-1; Wed, 06 Oct 2021 15:49:46 -0400
X-MC-Unique: dlR56Y1FO3OHRC_rLkz31A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A681084681;
	Wed,  6 Oct 2021 19:49:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7111B19D9F;
	Wed,  6 Oct 2021 19:49:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 428AE1801241;
	Wed,  6 Oct 2021 19:49:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196JQIKq016753 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 15:26:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF5F60C05; Wed,  6 Oct 2021 19:26:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761A460C0F;
	Wed,  6 Oct 2021 19:25:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 196JPqYx025269; 
	Wed, 6 Oct 2021 14:25:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 196JPqtY025268;
	Wed, 6 Oct 2021 14:25:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  6 Oct 2021 14:25:47 -0500
Message-Id: <1633548350-25227-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1633548350-25227-1-git-send-email-bmarzins@redhat.com>
References: <1633548350-25227-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/4] multipathd: move delayed_reconfig out of
	struct config
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

delayed_reconfig was inside the config struct, but it wasn't updated
during an RCU write section, so there's no synchronization on it.
Instead, pull it out of the config structure, and use the config_lock
to synchronize it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h |  1 -
 multipathd/main.c     | 45 ++++++++++++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index 933fe0d1..c73389b5 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -178,7 +178,6 @@ struct config {
 	int strict_timing;
 	int retrigger_tries;
 	int retrigger_delay;
-	int delayed_reconfig;
 	int uev_wait_timeout;
 	int skip_kpartx;
 	int remove_retries;
diff --git a/multipathd/main.c b/multipathd/main.c
index 2b416af9..1ead0904 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -127,6 +127,8 @@ static int poll_dmevents = 1;
 #endif
 /* Don't access this variable without holding config_lock */
 static volatile enum daemon_status running_state = DAEMON_INIT;
+/* Don't access this variable without holding config_lock */
+static bool __delayed_reconfig;
 pid_t daemon_pid;
 static pthread_mutex_t config_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t config_cond;
@@ -150,6 +152,23 @@ int should_exit(void)
 	return get_running_state() == DAEMON_SHUTDOWN;
 }
 
+static bool get_delayed_reconfig(void)
+{
+	bool val;
+
+	pthread_mutex_lock(&config_lock);
+	val = __delayed_reconfig;
+	pthread_mutex_unlock(&config_lock);
+	return val;
+}
+
+static void set_delayed_reconfig(bool val)
+{
+	pthread_mutex_lock(&config_lock);
+	__delayed_reconfig = val;
+	pthread_mutex_unlock(&config_lock);
+}
+
 /*
  * global copy of vecs for use in sig handlers
  */
@@ -297,8 +316,10 @@ static void __post_config_state(enum daemon_status state)
 			old_state = DAEMON_IDLE;
 			state = DAEMON_CONFIGURE;
 		}
-		if (reconfigure_pending && state == DAEMON_CONFIGURE)
+		if (state == DAEMON_CONFIGURE) {
 			reconfigure_pending = false;
+			__delayed_reconfig = false;
+		}
 		running_state = state;
 		pthread_cond_broadcast(&config_cond);
 		do_sd_notify(old_state, state);
@@ -765,7 +786,7 @@ int
 ev_add_map (char * dev, const char * alias, struct vectors * vecs)
 {
 	struct multipath * mpp;
-	int delayed_reconfig, reassign_maps;
+	int reassign_maps;
 	struct config *conf;
 
 	if (dm_is_mpath(alias) != 1) {
@@ -784,12 +805,11 @@ ev_add_map (char * dev, const char * alias, struct vectors * vecs)
 				return 1;
 		}
 		conf = get_multipath_config();
-		delayed_reconfig = conf->delayed_reconfig;
 		reassign_maps = conf->reassign_maps;
 		put_multipath_config(conf);
 		if (mpp->wait_for_udev) {
 			mpp->wait_for_udev = 0;
-			if (delayed_reconfig &&
+			if (get_delayed_reconfig() &&
 			    !need_to_delay_reconfig(vecs)) {
 				condlog(2, "reconfigure (delayed)");
 				schedule_reconfigure();
@@ -1791,8 +1811,7 @@ missing_uev_wait_tick(struct vectors *vecs)
 {
 	struct multipath * mpp;
 	unsigned int i;
-	int timed_out = 0, delayed_reconfig;
-	struct config *conf;
+	int timed_out = 0;
 
 	vector_foreach_slot (vecs->mpvec, mpp, i) {
 		if (mpp->wait_for_udev && --mpp->uev_wait_tick <= 0) {
@@ -1808,10 +1827,7 @@ missing_uev_wait_tick(struct vectors *vecs)
 		}
 	}
 
-	conf = get_multipath_config();
-	delayed_reconfig = conf->delayed_reconfig;
-	put_multipath_config(conf);
-	if (timed_out && delayed_reconfig &&
+	if (timed_out && get_delayed_reconfig() &&
 	    !need_to_delay_reconfig(vecs)) {
 		condlog(2, "reconfigure (delayed)");
 		schedule_reconfigure();
@@ -3257,13 +3273,10 @@ child (__attribute__((unused)) void *param)
 			pthread_cleanup_push(cleanup_lock, &vecs->lock);
 			lock(&vecs->lock);
 			pthread_testcancel();
-			if (!need_to_delay_reconfig(vecs)) {
+			if (!need_to_delay_reconfig(vecs))
 				reconfigure(vecs);
-			} else {
-				conf = get_multipath_config();
-				conf->delayed_reconfig = 1;
-				put_multipath_config(conf);
-			}
+			else
+				set_delayed_reconfig(true);
 			lock_cleanup_pop(vecs->lock);
 			post_config_state(DAEMON_IDLE);
 		}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

