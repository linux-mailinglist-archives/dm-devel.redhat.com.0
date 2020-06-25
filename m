Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4C86820A6EE
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VT2IbSRrizAJf63PUumFrVdlVbhwCxHF6klCaDVK19s=;
	b=ecGY9YQeXmDvJNXFeREDFieS16gSQuCqyS+TWMtKfQoONqSwTAzTIvzbvIPGyk1MX+OA7l
	zPN3cmqzn6rdxb67xRJZxQO+hlGf7/va5Zogrq8WRoccu1ydQzYEJqnPIFuKqecigkjeev
	8CpvZW1cuyteKhJahcGWuRdcIfYSxEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-BkrHEtLoPXKy-b41gQn8NQ-1; Thu, 25 Jun 2020 16:42:42 -0400
X-MC-Unique: BkrHEtLoPXKy-b41gQn8NQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7DE18A08B5;
	Thu, 25 Jun 2020 20:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F8F60C80;
	Thu, 25 Jun 2020 20:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DB3D875A3;
	Thu, 25 Jun 2020 20:42:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgR3j013995 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A888517D92; Thu, 25 Jun 2020 20:42:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7E5917C0F;
	Thu, 25 Jun 2020 20:42:24 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgNG6028792; 
	Thu, 25 Jun 2020 15:42:23 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgM5B028791;
	Thu, 25 Jun 2020 15:42:22 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:15 -0500
Message-Id: <1593117741-28750-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/7] libmultipath: make dm_get_map/status
	return codes symbolic
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_get_map() and dm_get_status() now use symbolic return codes. They
also differentiate between failing to get information from device-mapper
and not finding the requested device. These symboilc return codes are
also used by update_multipath_* functions.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c   | 51 +++++++++++++++++++++++++-------------
 libmultipath/devmapper.h   |  6 +++++
 libmultipath/structs_vec.c | 45 +++++++++++++++++++--------------
 multipathd/main.c          | 12 ++++-----
 4 files changed, 72 insertions(+), 42 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 27d52398..f5cfe296 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -534,36 +534,43 @@ int dm_map_present(const char * str)
 
 int dm_get_map(const char *name, unsigned long long *size, char *outparams)
 {
-	int r = 1;
+	int r = DMP_ERR;
 	struct dm_task *dmt;
 	uint64_t start, length;
 	char *target_type = NULL;
 	char *params = NULL;
 
 	if (!(dmt = libmp_dm_task_create(DM_DEVICE_TABLE)))
-		return 1;
+		return r;
 
 	if (!dm_task_set_name(dmt, name))
 		goto out;
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	errno = 0;
+	if (!dm_task_run(dmt)) {
+		if (errno == ENXIO)
+			r = DMP_FAIL;
 		goto out;
+	}
 
+	r = DMP_FAIL;
 	/* Fetch 1st target */
-	dm_get_next_target(dmt, NULL, &start, &length,
-			   &target_type, &params);
+	if (dm_get_next_target(dmt, NULL, &start, &length,
+			       &target_type, &params) != NULL)
+		/* more than one target */
+		goto out;
 
 	if (size)
 		*size = length;
 
 	if (!outparams) {
-		r = 0;
+		r = DMP_PASS;
 		goto out;
 	}
 	if (snprintf(outparams, PARAMS_SIZE, "%s", params) <= PARAMS_SIZE)
-		r = 0;
+		r = DMP_PASS;
 out:
 	dm_task_destroy(dmt);
 	return r;
@@ -637,35 +644,45 @@ is_mpath_part(const char *part_name, const char *map_name)
 
 int dm_get_status(const char *name, char *outstatus)
 {
-	int r = 1;
+	int r = DMP_ERR;
 	struct dm_task *dmt;
 	uint64_t start, length;
 	char *target_type = NULL;
 	char *status = NULL;
 
 	if (!(dmt = libmp_dm_task_create(DM_DEVICE_STATUS)))
-		return 1;
+		return r;
 
 	if (!dm_task_set_name(dmt, name))
 		goto out;
 
 	dm_task_no_open_count(dmt);
 
-	if (!dm_task_run(dmt))
+	errno = 0;
+	if (!dm_task_run(dmt)) {
+		if (errno == ENXIO)
+			r = DMP_FAIL;
 		goto out;
+	}
 
+	r = DMP_FAIL;
 	/* Fetch 1st target */
-	dm_get_next_target(dmt, NULL, &start, &length,
-			   &target_type, &status);
+	if (dm_get_next_target(dmt, NULL, &start, &length,
+			       &target_type, &status) != NULL)
+		goto out;
+
+	if (!target_type || strcmp(target_type, TGT_MPATH) != 0)
+		goto out;
+
 	if (!status) {
 		condlog(2, "get null status.");
 		goto out;
 	}
 
 	if (snprintf(outstatus, PARAMS_SIZE, "%s", status) <= PARAMS_SIZE)
-		r = 0;
+		r = DMP_PASS;
 out:
-	if (r)
+	if (r != DMP_PASS)
 		condlog(0, "%s: error getting map status string", name);
 
 	dm_task_destroy(dmt);
@@ -920,7 +937,7 @@ int _dm_flush_map (const char * mapname, int need_sync, int deferred_remove,
 			return 1;
 
 	if (need_suspend &&
-	    !dm_get_map(mapname, &mapsize, params) &&
+	    dm_get_map(mapname, &mapsize, params) == DMP_PASS &&
 	    strstr(params, "queue_if_no_path")) {
 		if (!dm_queue_if_no_path(mapname, 0))
 			queue_if_no_path = 1;
@@ -1129,7 +1146,7 @@ struct multipath *dm_get_multipath(const char *name)
 	if (!mpp->alias)
 		goto out;
 
-	if (dm_get_map(name, &mpp->size, NULL))
+	if (dm_get_map(name, &mpp->size, NULL) != DMP_PASS)
 		goto out;
 
 	dm_get_uuid(name, mpp->wwid, WWID_SIZE);
@@ -1313,7 +1330,7 @@ do_foreach_partmaps (const char * mapname,
 		    /*
 		     * and we can fetch the map table from the kernel
 		     */
-		    !dm_get_map(names->name, &size, &params[0]) &&
+		    dm_get_map(names->name, &size, &params[0]) == DMP_PASS &&
 
 		    /*
 		     * and the table maps over the multipath map
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 5ed7edc5..5b18bf4b 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -27,6 +27,12 @@
 #define UUID_PREFIX "mpath-"
 #define UUID_PREFIX_LEN (sizeof(UUID_PREFIX) - 1)
 
+enum {
+	DMP_ERR = -1,
+	DMP_PASS,
+	DMP_FAIL,
+};
+
 void dm_init(int verbosity);
 int dm_prereq(unsigned int *v);
 void skip_libmp_dm_init(void);
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 077f2e42..2225abeb 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -196,43 +196,47 @@ extract_hwe_from_path(struct multipath * mpp)
 int
 update_multipath_table (struct multipath *mpp, vector pathvec, int is_daemon)
 {
+	int r = DMP_ERR;
 	char params[PARAMS_SIZE] = {0};
 
 	if (!mpp)
-		return 1;
+		return r;
 
-	if (dm_get_map(mpp->alias, &mpp->size, params)) {
-		condlog(3, "%s: cannot get map", mpp->alias);
-		return 1;
+	r = dm_get_map(mpp->alias, &mpp->size, params);
+	if (r != DMP_PASS) {
+		condlog(3, "%s: %s", mpp->alias, (r == DMP_ERR)? "error getting table" : "map not present");
+		return r;
 	}
 
 	if (disassemble_map(pathvec, params, mpp, is_daemon)) {
 		condlog(3, "%s: cannot disassemble map", mpp->alias);
-		return 1;
+		return DMP_ERR;
 	}
 
-	return 0;
+	return DMP_PASS;
 }
 
 int
 update_multipath_status (struct multipath *mpp)
 {
+	int r = DMP_ERR;
 	char status[PARAMS_SIZE] = {0};
 
 	if (!mpp)
-		return 1;
+		return r;
 
-	if (dm_get_status(mpp->alias, status)) {
-		condlog(3, "%s: cannot get status", mpp->alias);
-		return 1;
+	r = dm_get_status(mpp->alias, status);
+	if (r != DMP_PASS) {
+		condlog(3, "%s: %s", mpp->alias, (r == DMP_ERR)? "error getting status" : "map not present");
+		return r;
 	}
 
 	if (disassemble_status(status, mpp)) {
 		condlog(3, "%s: cannot disassemble status", mpp->alias);
-		return 1;
+		return DMP_ERR;
 	}
 
-	return 0;
+	return DMP_PASS;
 }
 
 void sync_paths(struct multipath *mpp, vector pathvec)
@@ -264,10 +268,10 @@ int
 update_multipath_strings(struct multipath *mpp, vector pathvec, int is_daemon)
 {
 	struct pathgroup *pgp;
-	int i;
+	int i, r = DMP_ERR;
 
 	if (!mpp)
-		return 1;
+		return r;
 
 	update_mpp_paths(mpp, pathvec);
 	condlog(4, "%s: %s", mpp->alias, __FUNCTION__);
@@ -276,18 +280,21 @@ update_multipath_strings(struct multipath *mpp, vector pathvec, int is_daemon)
 	free_pgvec(mpp->pg, KEEP_PATHS);
 	mpp->pg = NULL;
 
-	if (update_multipath_table(mpp, pathvec, is_daemon))
-		return 1;
+	r = update_multipath_table(mpp, pathvec, is_daemon);
+	if (r != DMP_PASS)
+		return r;
+
 	sync_paths(mpp, pathvec);
 
-	if (update_multipath_status(mpp))
-		return 1;
+	r = update_multipath_status(mpp);
+	if (r != DMP_PASS)
+		return r;
 
 	vector_foreach_slot(mpp->pg, pgp, i)
 		if (pgp->paths)
 			path_group_prio_update(pgp);
 
-	return 0;
+	return DMP_PASS;
 }
 
 static void enter_recovery_mode(struct multipath *mpp)
diff --git a/multipathd/main.c b/multipathd/main.c
index 205ddb32..d73b1b9a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -418,7 +418,7 @@ int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 		goto out;
 	}
 
-	if (update_multipath_strings(mpp, vecs->pathvec, 1)) {
+	if (update_multipath_strings(mpp, vecs->pathvec, 1) != DMP_PASS) {
 		condlog(0, "%s: failed to setup multipath", mpp->alias);
 		goto out;
 	}
@@ -557,9 +557,9 @@ add_map_without_path (struct vectors *vecs, const char *alias)
 	mpp->mpe = find_mpe(conf->mptable, mpp->wwid);
 	put_multipath_config(conf);
 
-	if (update_multipath_table(mpp, vecs->pathvec, 1))
+	if (update_multipath_table(mpp, vecs->pathvec, 1) != DMP_PASS)
 		goto out;
-	if (update_multipath_status(mpp))
+	if (update_multipath_status(mpp) != DMP_PASS)
 		goto out;
 
 	if (!vector_alloc_slot(vecs->mpvec))
@@ -1350,8 +1350,8 @@ map_discovery (struct vectors * vecs)
 		return 1;
 
 	vector_foreach_slot (vecs->mpvec, mpp, i)
-		if (update_multipath_table(mpp, vecs->pathvec, 1) ||
-		    update_multipath_status(mpp)) {
+		if (update_multipath_table(mpp, vecs->pathvec, 1) != DMP_PASS ||
+		    update_multipath_status(mpp) != DMP_PASS) {
 			remove_map(mpp, vecs, 1);
 			i--;
 		}
@@ -2091,7 +2091,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	/*
 	 * Synchronize with kernel state
 	 */
-	if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
+	if (update_multipath_strings(pp->mpp, vecs->pathvec, 1) != DMP_PASS) {
 		condlog(1, "%s: Could not synchronize with kernel state",
 			pp->dev);
 		pp->dmstate = PSTATE_UNDEF;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

