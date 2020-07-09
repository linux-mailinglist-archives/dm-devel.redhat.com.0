Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 242ED219D9E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-Swvb20ZROZSsVt9iisJ-0A-1; Thu, 09 Jul 2020 06:21:52 -0400
X-MC-Unique: Swvb20ZROZSsVt9iisJ-0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E2A107ACF4;
	Thu,  9 Jul 2020 10:21:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83461512FE;
	Thu,  9 Jul 2020 10:21:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43E4893F91;
	Thu,  9 Jul 2020 10:21:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH6BC029595 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F06425EDFD; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC5625F246
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE27880CD81
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-404--ZyeojB8M4mVq0xkPDOIYw-1;
	Thu, 09 Jul 2020 06:16:58 -0400
X-MC-Unique: -ZyeojB8M4mVq0xkPDOIYw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 77CC7B071;
	Thu,  9 Jul 2020 10:16:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:11 +0200
Message-Id: <20200709101620.6786-27-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH6BC029595
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 26/35] libmultipath:
	io_err_stat_handle_pathfail(): less error conditions
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

io_err_stat_pathfail() returns an error if marginal path checking is
disabled, and on various other conditions which aren't runtime errors.
Fix that. Also, check the validity of parameters when the configuration
is read, and not on every call.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/defaults.h    |  2 ++
 libmultipath/io_err_stat.c | 25 ++++++++-----------------
 libmultipath/propsel.c     |  6 ++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 01a501b..0574e8f 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -31,6 +31,8 @@
 #define DEFAULT_DEFERRED_REMOVE	DEFERRED_REMOVE_OFF
 #define DEFAULT_DELAY_CHECKS	NU_NO
 #define DEFAULT_ERR_CHECKS	NU_NO
+/* half of minimum value for marginal_path_err_sample_time */
+#define IOTIMEOUT_SEC		60
 #define DEFAULT_UEVENT_STACKSIZE 256
 #define DEFAULT_RETRIGGER_DELAY	10
 #define DEFAULT_RETRIGGER_TRIES	3
diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 1b9cd6c..58bc1dd 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -35,7 +35,6 @@
 #include "time-util.h"
 #include "io_err_stat.h"
 
-#define IOTIMEOUT_SEC			60
 #define TIMEOUT_NO_IO_NSEC		10000000 /*10ms = 10000000ns*/
 #define FLAKY_PATHFAIL_THRESHOLD	2
 #define CONCUR_NR_EVENT			32
@@ -301,30 +300,22 @@ int io_err_stat_handle_pathfail(struct path *path)
 	struct timespec curr_time;
 
 	if (uatomic_read(&io_err_thread_running) == 0)
-		return 1;
+		return 0;
 
 	if (path->io_err_disable_reinstate) {
 		io_err_stat_log(3, "%s: reinstate is already disabled",
 				path->dev);
-		return 1;
+		return 0;
 	}
 	if (path->io_err_pathfail_cnt < 0)
-		return 1;
+		return 0;
 
 	if (!path->mpp)
-		return 1;
-	if (path->mpp->marginal_path_double_failed_time <= 0 ||
-		path->mpp->marginal_path_err_sample_time <= 0 ||
-		path->mpp->marginal_path_err_recheck_gap_time <= 0 ||
-		path->mpp->marginal_path_err_rate_threshold < 0) {
-		io_err_stat_log(4, "%s: parameter not set", path->mpp->alias);
-		return 1;
-	}
-	if (path->mpp->marginal_path_err_sample_time < (2 * IOTIMEOUT_SEC)) {
-		io_err_stat_log(2, "%s: marginal_path_err_sample_time should not less than %d",
-				path->mpp->alias, 2 * IOTIMEOUT_SEC);
-		return 1;
-	}
+		return 0;
+
+	if (!marginal_path_check_enabled(path->mpp))
+		return 0;
+
 	/*
 	 * The test should only be started for paths that have failed
 	 * repeatedly in a certain time frame, so that we have reason
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index d362beb..2233527 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -1066,6 +1066,12 @@ int select_marginal_path_err_sample_time(struct config *conf, struct multipath *
 	mp_set_conf(marginal_path_err_sample_time);
 	mp_set_default(marginal_path_err_sample_time, DEFAULT_ERR_CHECKS);
 out:
+	if (mp->marginal_path_err_sample_time > 0 &&
+	    mp->marginal_path_err_sample_time < 2 * IOTIMEOUT_SEC) {
+		condlog(2, "%s: configuration error: marginal_path_err_sample_time must be >= %d",
+			mp->alias, 2 * IOTIMEOUT_SEC);
+			mp->marginal_path_err_sample_time = 2 * IOTIMEOUT_SEC;
+	}
 	if (print_off_int_undef(buff, 12, mp->marginal_path_err_sample_time)
 	    != 0)
 		condlog(3, "%s: marginal_path_err_sample_time = %s %s",
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

