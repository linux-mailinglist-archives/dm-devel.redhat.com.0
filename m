Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A900F2772F9
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-llGg3InYOASnKxpS4_sHEA-1; Thu, 24 Sep 2020 09:46:11 -0400
X-MC-Unique: llGg3InYOASnKxpS4_sHEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 356D2ACE30;
	Thu, 24 Sep 2020 13:46:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3DFA5C1D7;
	Thu, 24 Sep 2020 13:46:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18A578C7A3;
	Thu, 24 Sep 2020 13:46:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjiO026811 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A16022166BD9; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7F62166BA3
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF67811E83
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-5-t40eFgyDPfqD1FgV8tIrNg-1;
	Thu, 24 Sep 2020 09:41:40 -0400
X-MC-Unique: t40eFgyDPfqD1FgV8tIrNg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6509B118;
	Thu, 24 Sep 2020 13:41:37 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:35 +0200
Message-Id: <20200924134054.14632-5-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjiO026811
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 04/23] multipathd: move vecs desctruction into
	cleanup function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This will make it easer to move the stuff around later.
The only functional change is that map destuction now happens after
joining all threads, which should actually improve robustness.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 64 +++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 4d714e8..2642570 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -148,7 +148,7 @@ int should_exit(void)
 /*
  * global copy of vecs for use in sig handlers
  */
-struct vectors * gvecs;
+static struct vectors * gvecs;
 
 struct config *multipath_conf;
 
@@ -2889,6 +2889,44 @@ set_oom_adj (void)
 	condlog(0, "couldn't adjust oom score");
 }
 
+static void cleanup_maps(struct vectors *vecs)
+{
+	int queue_without_daemon, i;
+	struct multipath *mpp;
+	struct config *conf;
+
+	conf = get_multipath_config();
+	queue_without_daemon = conf->queue_without_daemon;
+	put_multipath_config(conf);
+	if (queue_without_daemon == QUE_NO_DAEMON_OFF)
+		vector_foreach_slot(vecs->mpvec, mpp, i)
+			dm_queue_if_no_path(mpp->alias, 0);
+	remove_maps_and_stop_waiters(vecs);
+	vecs->mpvec = NULL;
+}
+
+static void cleanup_paths(struct vectors *vecs)
+{
+	free_pathvec(vecs->pathvec, FREE_PATHS);
+	vecs->pathvec = NULL;
+}
+
+static void cleanup_vecs(void)
+{
+	if (!gvecs)
+		return;
+	/*
+	 * We can't take the vecs lock here, because exit() may
+	 * have been called from the child() thread, holding the lock already.
+	 * Anyway, by the time we get here, all threads that might access
+	 * vecs should have been joined already (in cleanup_threads).
+	 */
+	cleanup_maps(gvecs);
+	cleanup_paths(gvecs);
+	pthread_mutex_destroy(&gvecs->lock.mutex);
+	FREE(gvecs);
+}
+
 /*
  * Use a non-default call_rcu_data for child().
  *
@@ -2936,13 +2974,10 @@ child (__attribute__((unused)) void *param)
 	pthread_t check_thr, uevent_thr, uxlsnr_thr, uevq_thr, dmevent_thr;
 	pthread_attr_t log_attr, misc_attr, uevent_attr;
 	struct vectors * vecs;
-	struct multipath * mpp;
-	int i;
 	int rc;
 	int pid_fd = -1;
 	struct config *conf;
 	char *envp;
-	int queue_without_daemon;
 	enum daemon_status state;
 	struct call_rcu_data *crdp;
 
@@ -3108,17 +3143,6 @@ child (__attribute__((unused)) void *param)
 	if (poll_dmevents)
 		pthread_cancel(dmevent_thr);
 
-	conf = get_multipath_config();
-	queue_without_daemon = conf->queue_without_daemon;
-	put_multipath_config(conf);
-
-	lock(&vecs->lock);
-	if (queue_without_daemon == QUE_NO_DAEMON_OFF)
-		vector_foreach_slot(vecs->mpvec, mpp, i)
-			dm_queue_if_no_path(mpp->alias, 0);
-	remove_maps_and_stop_waiters(vecs);
-	unlock(&vecs->lock);
-
 	pthread_join(check_thr, NULL);
 	pthread_join(uevent_thr, NULL);
 	pthread_join(uxlsnr_thr, NULL);
@@ -3128,15 +3152,7 @@ child (__attribute__((unused)) void *param)
 
 	stop_io_err_stat_thread();
 
-	lock(&vecs->lock);
-	free_pathvec(vecs->pathvec, FREE_PATHS);
-	vecs->pathvec = NULL;
-	unlock(&vecs->lock);
-
-	pthread_mutex_destroy(&vecs->lock.mutex);
-	FREE(vecs);
-	vecs = NULL;
-
+	cleanup_vecs();
 	cleanup_foreign();
 	cleanup_checkers();
 	cleanup_prio();
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

