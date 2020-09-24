Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62A442772DD
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:44:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-7znBiQk9Pq-BcXNC1lcZTQ-1; Thu, 24 Sep 2020 09:44:53 -0400
X-MC-Unique: 7znBiQk9Pq-BcXNC1lcZTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37BE5100855D;
	Thu, 24 Sep 2020 13:44:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11E6260C15;
	Thu, 24 Sep 2020 13:44:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C02558C7A4;
	Thu, 24 Sep 2020 13:44:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfm5w026900 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C39E21140EC; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF6131140EB
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7AB5101A540
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-396-RPdS8xpxOm2UTrWEhAVvnw-1;
	Thu, 24 Sep 2020 09:41:43 -0400
X-MC-Unique: RPdS8xpxOm2UTrWEhAVvnw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B132B13B;
	Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:48 +0200
Message-Id: <20200924134054.14632-18-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfm5w026900
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 17/23] multipathd: add cleanup_child() exit
	handler
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

cleanup_child() calls all cleanups in the right order, in an
exit handler.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 48 +++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index f9749e5..e7b479a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3023,6 +3023,28 @@ static void cleanup_rcu(int dummy __attribute__((unused)), void *arg)
 	rcu_unregister_thread();
 }
 
+static void cleanup_child(void)
+{
+	cleanup_threads();
+	cleanup_vecs();
+	cleanup_foreign();
+	cleanup_checkers();
+	cleanup_prio();
+	if (poll_dmevents)
+		cleanup_dmevent_waiter();
+
+	cleanup_pidfile();
+	if (logsink == 1) {
+		logsink = 0;
+		log_thread_stop();
+	}
+	cleanup_conf();
+
+#ifdef _DEBUG_
+	dbg_free_final(NULL);
+#endif
+}
+
 static int sd_notify_exit(int err)
 {
 #ifdef USE_SYSTEMD
@@ -3049,7 +3071,11 @@ child (__attribute__((unused)) void *param)
 	mlockall(MCL_CURRENT | MCL_FUTURE);
 	signal_init();
 	crdp = setup_rcu();
-	on_exit(cleanup_rcu, crdp);
+
+	if (on_exit(cleanup_rcu, crdp) ||
+	    atexit(cleanup_child)) {
+		fprintf(stderr, "failed to register cleanup handlers\n");
+	}
 
 	setup_thread_attr(&misc_attr, 64 * 1024, 0);
 	setup_thread_attr(&uevent_attr, DEFAULT_UEVENT_STACKSIZE * 1024, 0);
@@ -3212,26 +3238,8 @@ child (__attribute__((unused)) void *param)
 
 	exit_code = 0;
 failed:
-	cleanup_threads();
-	cleanup_vecs();
-	cleanup_foreign();
-	cleanup_checkers();
-	cleanup_prio();
-	if (poll_dmevents)
-		cleanup_dmevent_waiter();
-
-	/* We're done here */
-	cleanup_pidfile();
 	condlog(2, "--------shut down-------");
-
-	if (logsink == 1) {
-		logsink = 0;
-		log_thread_stop();
-	}
-	cleanup_conf();
-#ifdef _DEBUG_
-	dbg_free_final(NULL);
-#endif
+	/* All cleanup is done in the cleanup_child() exit handler */
 	return sd_notify_exit(exit_code);
 }
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

