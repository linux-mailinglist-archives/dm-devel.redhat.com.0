Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4003D2772E4
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:45:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-oEsRAsiwN1utIOPq6jIK6A-1; Thu, 24 Sep 2020 09:45:10 -0400
X-MC-Unique: oEsRAsiwN1utIOPq6jIK6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8289801002;
	Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B275578E;
	Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76F0A1826D31;
	Thu, 24 Sep 2020 13:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjYY026794 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 11DDC114102; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071FB1140FD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C81D11021F60
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-54-1khuxTr-P1uEtexqTtyoVw-1;
	Thu, 24 Sep 2020 09:41:38 -0400
X-MC-Unique: 1khuxTr-P1uEtexqTtyoVw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 704A4B10B;
	Thu, 24 Sep 2020 13:41:37 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:34 +0200
Message-Id: <20200924134054.14632-4-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjYY026794
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 03/23] multipathd: move handling of
	io_err_stat_attr into libmultipath
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

This thread attribute can be dynamically initialized and destroyed.
No need to carry it along in multipathd. Removal of the symbol
requires a new ABI version.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/io_err_stat.c        |  7 +++++--
 libmultipath/libmultipath.version | 23 ++++++++---------------
 multipathd/main.c                 |  2 --
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 58bc1dd..5363049 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -34,6 +34,7 @@
 #include "lock.h"
 #include "time-util.h"
 #include "io_err_stat.h"
+#include "util.h"
 
 #define TIMEOUT_NO_IO_NSEC		10000000 /*10ms = 10000000ns*/
 #define FLAKY_PATHFAIL_THRESHOLD	2
@@ -70,8 +71,7 @@ struct io_err_stat_path {
 	int		err_rate_threshold;
 };
 
-pthread_t		io_err_stat_thr;
-pthread_attr_t		io_err_stat_attr;
+static pthread_t	io_err_stat_thr;
 
 static pthread_mutex_t io_err_thread_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t io_err_thread_cond = PTHREAD_COND_INITIALIZER;
@@ -727,6 +727,7 @@ static void *io_err_stat_loop(void *data)
 int start_io_err_stat_thread(void *data)
 {
 	int ret;
+	pthread_attr_t io_err_stat_attr;
 
 	if (uatomic_read(&io_err_thread_running) == 1)
 		return 0;
@@ -739,6 +740,7 @@ int start_io_err_stat_thread(void *data)
 	if (!paths)
 		goto destroy_ctx;
 
+	setup_thread_attr(&io_err_stat_attr, 32 * 1024, 0);
 	pthread_mutex_lock(&io_err_thread_lock);
 	pthread_cleanup_push(cleanup_unlock, &io_err_thread_lock);
 
@@ -750,6 +752,7 @@ int start_io_err_stat_thread(void *data)
 				 &io_err_thread_lock) == 0);
 
 	pthread_cleanup_pop(1);
+	pthread_attr_destroy(&io_err_stat_attr);
 
 	if (ret) {
 		io_err_stat_log(0, "cannot create io_error statistic thread");
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 2e531ef..9abdb22 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -1,4 +1,4 @@
-LIBMULTIPATH_0.8.4.1 {
+LIBMULTIPATH_0.8.4.5 {
 global:
 	/* symbols referenced by multipath and multipathd */
 	add_foreign;
@@ -88,7 +88,6 @@ global:
 	init_checkers;
 	init_foreign;
 	init_prio;
-	io_err_stat_attr;
 	io_err_stat_handle_pathfail;
 	is_path_valid;
 	is_quote;
@@ -209,30 +208,24 @@ global:
 	free_scandir_result;
 	sysfs_attr_get_value;
 
-local:
-	*;
-};
-
-LIBMULTIPATH_0.8.4.2 {
-global:
+	/* added in 0.8.4.2 */
 	libmp_dm_task_run;
 	cleanup_mutex;
-} LIBMULTIPATH_0.8.4.1;
 
-LIBMULTIPATH_0.8.4.3 {
-global:
+	/* added in 0.8.4.3 */
 	libmp_get_multipath_config;
 	get_multipath_config;
 	libmp_put_multipath_config;
 	put_multipath_config;
 	init_config;
 	uninit_config;
-} LIBMULTIPATH_0.8.4.2;
 
-LIBMULTIPATH_0.8.4.4 {
-global:
+	/* added in 0.8.4.4 */
 	udev;
 	logsink;
 	libmultipath_init;
 	libmultipath_exit;
-} LIBMULTIPATH_0.8.4.3;
+
+local:
+	*;
+};
diff --git a/multipathd/main.c b/multipathd/main.c
index be1b5ae..4d714e8 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2954,7 +2954,6 @@ child (__attribute__((unused)) void *param)
 	setup_thread_attr(&misc_attr, 64 * 1024, 0);
 	setup_thread_attr(&uevent_attr, DEFAULT_UEVENT_STACKSIZE * 1024, 0);
 	setup_thread_attr(&waiter_attr, 32 * 1024, 1);
-	setup_thread_attr(&io_err_stat_attr, 32 * 1024, 0);
 
 	if (logsink == 1) {
 		setup_thread_attr(&log_attr, 64 * 1024, 0);
@@ -3164,7 +3163,6 @@ child (__attribute__((unused)) void *param)
 	rcu_assign_pointer(multipath_conf, NULL);
 	call_rcu(&conf->rcu, rcu_free_config);
 	pthread_attr_destroy(&waiter_attr);
-	pthread_attr_destroy(&io_err_stat_attr);
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

