Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0182428D3
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-1ZDv12sENn6TjFnG6nwQYA-1; Wed, 12 Aug 2020 07:36:32 -0400
X-MC-Unique: 1ZDv12sENn6TjFnG6nwQYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08C58712FD;
	Wed, 12 Aug 2020 11:36:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FDC15D6BD;
	Wed, 12 Aug 2020 11:36:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 374799A8A0;
	Wed, 12 Aug 2020 11:36:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBa5a0028930 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 113592156A30; Wed, 12 Aug 2020 11:36:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2C32166BA4
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1BE811E80
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-388-P5zaT3HRNBaUhXjtvMWDuA-1;
	Wed, 12 Aug 2020 07:35:57 -0400
X-MC-Unique: P5zaT3HRNBaUhXjtvMWDuA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0FD48B70B;
	Wed, 12 Aug 2020 11:36:18 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:41 +0200
Message-Id: <20200812113543.26576-3-mwilck@suse.com>
In-Reply-To: <20200812113543.26576-1-mwilck@suse.com>
References: <20200812113543.26576-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBa5a0028930
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 77/80] libmultipath: log dm_task_run() errors
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

Log the ioctl error messages from libdm.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 19 +++++++------
 libmultipath/devmapper.c | 61 ++++++++++++++++++++++++++++++++--------
 libmultipath/devmapper.h |  4 +++
 multipathd/dmevents.c    |  4 ++-
 multipathd/waiter.c      |  2 ++
 5 files changed, 68 insertions(+), 22 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index ac57b88..a492e0a 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -661,7 +661,8 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
 }
 
 static void
-select_reload_action(struct multipath *mpp, const char *reason)
+select_reload_action(struct multipath *mpp, const struct multipath *cmpp,
+		     const char *reason)
 {
 	struct udev_device *mpp_ud;
 	const char *env;
@@ -754,7 +755,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
 	    !!strstr(mpp->features, "queue_if_no_path") !=
 	    !!strstr(cmpp->features, "queue_if_no_path")) {
-		select_reload_action(cmpp, "no_path_retry change");
+		select_reload_action(mpp, cmpp, "no_path_retry change");
 		return;
 	}
 	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
@@ -762,7 +763,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
 	     strncmp(cmpp->hwhandler, mpp->hwhandler,
 		    strlen(mpp->hwhandler)))) {
-		select_reload_action(cmpp, "hwhandler change");
+		select_reload_action(mpp, cmpp, "hwhandler change");
 		return;
 	}
 
@@ -770,7 +771,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
 	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
-		select_reload_action(cmpp, "retain_hwhandler change");
+		select_reload_action(mpp, cmpp, "retain_hwhandler change");
 		return;
 	}
 
@@ -782,7 +783,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		remove_feature(&cmpp_feat, "queue_if_no_path");
 		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
 		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
-			select_reload_action(cmpp, "features change");
+			select_reload_action(mpp, cmpp, "features change");
 			FREE(cmpp_feat);
 			FREE(mpp_feat);
 			return;
@@ -793,19 +794,19 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 
 	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
 		    strlen(mpp->selector))) {
-		select_reload_action(cmpp, "selector change");
+		select_reload_action(mpp, cmpp, "selector change");
 		return;
 	}
 	if (cmpp->minio != mpp->minio) {
-		select_reload_action(cmpp, "minio change");
+		select_reload_action(mpp, cmpp, "minio change");
 		return;
 	}
 	if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) {
-		select_reload_action(cmpp, "path group number change");
+		select_reload_action(mpp, cmpp, "path group number change");
 		return;
 	}
 	if (pgcmp(mpp, cmpp)) {
-		select_reload_action(cmpp, "path group topology change");
+		select_reload_action(mpp, cmpp, "path group topology change");
 		return;
 	}
 	if (cmpp->nextpg != mpp->bestpg) {
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 38d1990..cc2de1d 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -182,6 +182,7 @@ dm_tgt_version (unsigned int * version, char * str)
 	dm_task_no_open_count(dmt);
 
 	if (!dm_task_run(dmt)) {
+		dm_log_error(2, DM_DEVICE_LIST_VERSIONS, dmt);
 		condlog(0, "Can not communicate with kernel DM");
 		goto out;
 	}
@@ -320,6 +321,8 @@ dm_simplecmd (int task, const char *name, int no_flush, int need_sync, uint16_t
 		goto out;
 
 	r = dm_task_run (dmt);
+	if (!r)
+		dm_log_error(2, task, dmt);
 
 	if (udev_wait_flag)
 			dm_udev_wait(cookie);
@@ -410,6 +413,8 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
 		goto freeout;
 
 	r = dm_task_run (dmt);
+	if (!r)
+		dm_log_error(2, task, dmt);
 
 	if (task == DM_DEVICE_CREATE)
 			dm_udev_wait(cookie);
@@ -522,8 +527,10 @@ do_get_info(const char *name, struct dm_info *info)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_INFO, dmt);
 		goto out;
+	}
 
 	if (!dm_task_get_info(dmt, info))
 		goto out;
@@ -562,6 +569,7 @@ int dm_get_map(const char *name, unsigned long long *size, char *outparams)
 
 	errno = 0;
 	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_TABLE, dmt);
 		if (dm_task_get_errno(dmt) == ENXIO)
 			r = DMP_NOT_FOUND;
 		goto out;
@@ -602,8 +610,10 @@ dm_get_prefixed_uuid(const char *name, char *uuid, int uuid_len)
 	if (!dm_task_set_name (dmt, name))
 		goto uuidout;
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_INFO, dmt);
 		goto uuidout;
+	}
 
 	uuidtmp = dm_task_get_uuid(dmt);
 	if (uuidtmp)
@@ -672,6 +682,7 @@ int dm_get_status(const char *name, char *outstatus)
 
 	errno = 0;
 	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_STATUS, dmt);
 		if (dm_task_get_errno(dmt) == ENXIO)
 			r = DMP_NOT_FOUND;
 		goto out;
@@ -723,8 +734,10 @@ int dm_type(const char *name, char *type)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_TABLE, dmt);
 		goto out;
+	}
 
 	/* Fetch 1st target */
 	if (dm_get_next_target(dmt, NULL, &start, &length,
@@ -765,8 +778,10 @@ int dm_is_mpath(const char *name)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_TABLE, dmt);
 		goto out_task;
+	}
 
 	if (!dm_task_get_info(dmt, &info))
 		goto out_task;
@@ -827,8 +842,10 @@ dm_map_present_by_uuid(const char *uuid)
 	if (!dm_task_set_uuid(dmt, prefixed_uuid))
 		goto out_task;
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_INFO, dmt);
 		goto out_task;
+	}
 
 	if (!dm_task_get_info(dmt, &info))
 		goto out_task;
@@ -871,8 +888,10 @@ dm_get_opencount (const char * mapname)
 	if (!dm_task_set_name(dmt, mapname))
 		goto out;
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_INFO, dmt);
 		goto out;
+	}
 
 	if (!dm_task_get_info(dmt, &info))
 		goto out;
@@ -1029,8 +1048,10 @@ int dm_flush_maps (int need_suspend, int retries)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run (dmt))
+	if (!dm_task_run (dmt)) {
+		dm_log_error(3, DM_DEVICE_LIST, dmt);
 		goto out;
+	}
 
 	if (!(names = dm_task_get_names (dmt)))
 		goto out;
@@ -1073,8 +1094,10 @@ dm_message(const char * mapname, char * message)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(2, DM_DEVICE_TARGET_MSG, dmt);
 		goto out;
+	}
 
 	r = 0;
 out:
@@ -1191,8 +1214,10 @@ dm_get_maps (vector mp)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_LIST, dmt);
 		goto out;
+	}
 
 	if (!(names = dm_task_get_names(dmt)))
 		goto out;
@@ -1283,6 +1308,7 @@ dm_mapname(int major, int minor)
 	}
 
 	if (!r) {
+		dm_log_error(2, DM_DEVICE_STATUS, dmt);
 		condlog(0, "%i:%i: timeout fetching map name", major, minor);
 		goto bad;
 	}
@@ -1318,8 +1344,10 @@ do_foreach_partmaps (const char * mapname,
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_LIST, dmt);
 		goto out;
+	}
 
 	if (!(names = dm_task_get_names(dmt)))
 		goto out;
@@ -1552,6 +1580,8 @@ dm_rename (const char * old, char * new, char *delim, int skip_kpartx)
 	if (!dm_task_set_cookie(dmt, &cookie, udev_flags))
 		goto out;
 	r = dm_task_run(dmt);
+	if (!r)
+		dm_log_error(2, DM_DEVICE_RENAME, dmt);
 
 	dm_udev_wait(cookie);
 
@@ -1595,8 +1625,10 @@ int dm_reassign_table(const char *name, char *old, char *new)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_TABLE, dmt);
 		goto out;
+	}
 	if (!(reload_dmt = libmp_dm_task_create(DM_DEVICE_RELOAD)))
 		goto out;
 	if (!dm_task_set_name(reload_dmt, name))
@@ -1627,6 +1659,7 @@ int dm_reassign_table(const char *name, char *old, char *new)
 		dm_task_no_open_count(reload_dmt);
 
 		if (!dm_task_run(reload_dmt)) {
+			dm_log_error(3, DM_DEVICE_RELOAD, reload_dmt);
 			condlog(3, "%s: failed to reassign targets", name);
 			goto out_reload;
 		}
@@ -1672,8 +1705,10 @@ int dm_reassign(const char *mapname)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_DEPS, dmt);
 		goto out;
+	}
 
 	if (!dm_task_get_info(dmt, &info))
 		goto out;
@@ -1739,6 +1774,8 @@ int dm_setgeometry(struct multipath *mpp)
 	}
 
 	r = dm_task_run(dmt);
+	if (!r)
+		dm_log_error(3, DM_DEVICE_SET_GEOMETRY, dmt);
 out:
 	dm_task_destroy(dmt);
 
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 6dd178c..f568ab5 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -85,4 +85,8 @@ struct multipath *dm_get_multipath(const char *name);
 	((v[0] == minv[0]) && (v[1] == minv[1]) && (v[2] >= minv[2])) \
 )
 
+#define dm_log_error(lvl, cmd, dmt)			      \
+	condlog(lvl, "%s: libdm task=%d error: %s", __func__, \
+		cmd, strerror(dm_task_get_errno(dmt)))	      \
+
 #endif /* _DEVMAPPER_H */
diff --git a/multipathd/dmevents.c b/multipathd/dmevents.c
index b22b47d..b235dd4 100644
--- a/multipathd/dmevents.c
+++ b/multipathd/dmevents.c
@@ -156,8 +156,10 @@ static int dm_get_events(void)
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	if (!dm_task_run(dmt)) {
+		dm_log_error(3, DM_DEVICE_LIST, dmt);
 		goto fail;
+	}
 
 	if (!(names = dm_task_get_names(dmt)))
 		goto fail;
diff --git a/multipathd/waiter.c b/multipathd/waiter.c
index e645766..16fbdc8 100644
--- a/multipathd/waiter.c
+++ b/multipathd/waiter.c
@@ -119,6 +119,8 @@ static int waiteventloop (struct event_thread *waiter)
 
 	pthread_testcancel();
 	r = dm_task_run(waiter->dmt);
+	if (!r)
+		dm_log_error(2, DM_DEVICE_WAITEVENT, waiter->dmt);
 	pthread_testcancel();
 
 	pthread_sigmask(SIG_SETMASK, &oldset, NULL);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

