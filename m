Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 689DD37D464
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 23:18:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-7O8mZ7J5PXaxZXGLA6vDVg-1; Wed, 12 May 2021 17:18:01 -0400
X-MC-Unique: 7O8mZ7J5PXaxZXGLA6vDVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B550D9F92A;
	Wed, 12 May 2021 21:17:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA11C58823;
	Wed, 12 May 2021 21:17:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E011955341;
	Wed, 12 May 2021 21:17:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14CLHSGE018179 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 May 2021 17:17:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFDDE116711; Wed, 12 May 2021 21:17:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5FC1182DD
	for <dm-devel@redhat.com>; Wed, 12 May 2021 21:17:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B84B857D08
	for <dm-devel@redhat.com>; Wed, 12 May 2021 21:17:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-120-cusAMZdRMtm3lTfcdaX51g-1;
	Wed, 12 May 2021 17:17:22 -0400
X-MC-Unique: cusAMZdRMtm3lTfcdaX51g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E7A0EAF0E;
	Wed, 12 May 2021 21:17:20 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 May 2021 23:17:05 +0200
Message-Id: <20210512211705.31561-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14CLHSGE018179
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipathd: fix compilation issue with liburcu <
	0.8
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

To avoid race conditions with pending RCU callbacks on exit, it's
necessary to call rcu_barrier() in cleanup_rcu() (see
https://lists.lttng.org/pipermail/lttng-dev/2021-May/029958.html and
follow-ups).

rcu_barrier() is only available in User-space RCU v0.8 and newer.
Fix it by reverting 5d0dae6 ("multipathd: Fix liburcu memory leak")
if an older version of liburcu is detected.

Fixes: 5d0dae6 ("multipathd: Fix liburcu memory leak")
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/Makefile |  2 ++
 multipathd/main.c   | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/multipathd/Makefile b/multipathd/Makefile
index d053c1e..dc7eb32 100644
--- a/multipathd/Makefile
+++ b/multipathd/Makefile
@@ -16,6 +16,8 @@ LDFLAGS += $(BIN_LDFLAGS)
 LIBDEPS += -L$(multipathdir) -lmultipath -L$(mpathpersistdir) -lmpathpersist \
 	   -L$(mpathcmddir) -lmpathcmd -ludev -ldl -lurcu -lpthread \
 	   -ldevmapper -lreadline
+CFLAGS += $(shell pkg-config --modversion liburcu 2>/dev/null | \
+	awk -F. '{ printf("-DURCU_VERSION=0x%06x\n", 256 * ( 256 * $$1 + $$2) + $$3); }')
 
 ifdef SYSTEMD
 	CFLAGS += -DUSE_SYSTEMD=$(SYSTEMD)
diff --git a/multipathd/main.c b/multipathd/main.c
index 102946b..c34fd9c 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3031,6 +3031,10 @@ static void cleanup_threads(void)
 	pthread_attr_destroy(&waiter_attr);
 }
 
+#ifndef URCU_VERSION
+#  define URCU_VERSION 0
+#endif
+#if (URCU_VERSION >= 0x000800)
 /*
  * Use a non-default call_rcu_data for child().
  *
@@ -3040,6 +3044,9 @@ static void cleanup_threads(void)
  * can't be joined with pthread_join(), leaving a memory leak.
  *
  * Therefore we create our own, which can be destroyed and joined.
+ * The cleanup handler needs to call rcu_barrier(), which is only
+ * available in user-space RCU v0.8 and newer. See
+ * https://lists.lttng.org/pipermail/lttng-dev/2021-May/029958.html
  */
 static struct call_rcu_data *setup_rcu(void)
 {
@@ -3072,6 +3079,7 @@ static void cleanup_rcu(void)
 	}
 	rcu_unregister_thread();
 }
+#endif /* URCU_VERSION */
 
 static void cleanup_child(void)
 {
@@ -3116,9 +3124,14 @@ child (__attribute__((unused)) void *param)
 	init_unwinder();
 	mlockall(MCL_CURRENT | MCL_FUTURE);
 	signal_init();
+#if (URCU_VERSION >= 0x000800)
 	mp_rcu_data = setup_rcu();
-
-	if (atexit(cleanup_rcu) || atexit(cleanup_child))
+	if (atexit(cleanup_rcu))
+		fprintf(stderr, "failed to register RCU cleanup handler\n");
+#else
+	rcu_init();
+#endif
+	if (atexit(cleanup_child))
 		fprintf(stderr, "failed to register cleanup handlers\n");
 
 	setup_thread_attr(&misc_attr, 64 * 1024, 0);
-- 
2.31.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

