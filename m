Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D7878219EA6
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-ibf84G-vNmuwnW8KggCMSg-1; Thu, 09 Jul 2020 07:04:45 -0400
X-MC-Unique: ibf84G-vNmuwnW8KggCMSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B25108F;
	Thu,  9 Jul 2020 11:04:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7FA10013C2;
	Thu,  9 Jul 2020 11:04:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4953793F81;
	Thu,  9 Jul 2020 11:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3uoM002077 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8E8F2084827; Thu,  9 Jul 2020 11:03:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C87EE2084823
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C618007CB
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-358-zLO4BCo4OM20Q4DBRQrdKw-1;
	Thu, 09 Jul 2020 07:03:49 -0400
X-MC-Unique: zLO4BCo4OM20Q4DBRQrdKw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91659AEE9;
	Thu,  9 Jul 2020 11:03:47 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:28 +0200
Message-Id: <20200709110330.9917-5-mwilck@suse.com>
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3uoM002077
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 78/80] libmultipath: move reload_map() to
	multipathd
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

From: Martin Wilck <mwilck@suse.com>

reload_map() is only used by multipathd. We don't have less exported
symbols though, because select_action() now needs to be exported.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 40 +---------------------------------------
 libmultipath/configure.h |  2 +-
 multipathd/main.c        | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index faead8c..b77c2a8 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -688,8 +688,7 @@ select_reload_action(struct multipath *mpp, const struct multipath *cmpp,
 		reason);
 }
 
-static void
-select_action (struct multipath * mpp, vector curmp, int force_reload)
+void select_action (struct multipath *mpp, vector curmp, int force_reload)
 {
 	struct multipath * cmpp;
 	struct multipath * cmpp_by_name;
@@ -1478,40 +1477,3 @@ int get_refwwid(enum mpath_cmds cmd, const char *dev, enum devtypes dev_type,
 	pthread_cleanup_pop(1);
 	return ret;
 }
-
-int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
-	       int is_daemon)
-{
-	char params[PARAMS_SIZE] = {0};
-	struct path *pp;
-	int i, r;
-
-	update_mpp_paths(mpp, vecs->pathvec);
-	if (refresh) {
-		vector_foreach_slot (mpp->paths, pp, i) {
-			struct config *conf = get_multipath_config();
-			pthread_cleanup_push(put_multipath_config, conf);
-			r = pathinfo(pp, conf, DI_PRIO);
-			pthread_cleanup_pop(1);
-			if (r) {
-				condlog(2, "%s: failed to refresh pathinfo",
-					mpp->alias);
-				return 1;
-			}
-		}
-	}
-	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
-		condlog(0, "%s: failed to setup map", mpp->alias);
-		return 1;
-	}
-	select_action(mpp, vecs->mpvec, 1);
-
-	r = domap(mpp, params, is_daemon);
-	if (r == DOMAP_FAIL || r == DOMAP_RETRY) {
-		condlog(3, "%s: domap (%u) failure "
-			"for reload map", mpp->alias, r);
-		return 1;
-	}
-
-	return 0;
-}
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index d9a7de6..9907775 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -49,11 +49,11 @@ struct vectors;
 
 int setup_map (struct multipath * mpp, char * params, int params_size,
 	       struct vectors *vecs );
+void select_action (struct multipath *mpp, vector curmp, int force_reload);
 int domap (struct multipath * mpp, char * params, int is_daemon);
 int reinstate_paths (struct multipath *mpp);
 int coalesce_paths (struct vectors *vecs, vector curmp, char * refwwid, int force_reload, enum mpath_cmds cmd);
 int get_refwwid (enum mpath_cmds cmd, const char *dev, enum devtypes dev_type,
 		 vector pathvec, char **wwid);
-int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh, int is_daemon);
 struct udev_device *get_udev_device(const char *dev, enum devtypes dev_type);
 void trigger_paths_udev_change(struct multipath *mpp, bool is_mpath);
diff --git a/multipathd/main.c b/multipathd/main.c
index 29227cd..aa08807 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1909,6 +1909,43 @@ int update_prio(struct path *pp, int refresh_all)
 	return 1;
 }
 
+static int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
+		      int is_daemon)
+{
+	char params[PARAMS_SIZE] = {0};
+	struct path *pp;
+	int i, r;
+
+	update_mpp_paths(mpp, vecs->pathvec);
+	if (refresh) {
+		vector_foreach_slot (mpp->paths, pp, i) {
+			struct config *conf = get_multipath_config();
+			pthread_cleanup_push(put_multipath_config, conf);
+			r = pathinfo(pp, conf, DI_PRIO);
+			pthread_cleanup_pop(1);
+			if (r) {
+				condlog(2, "%s: failed to refresh pathinfo",
+					mpp->alias);
+				return 1;
+			}
+		}
+	}
+	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+		condlog(0, "%s: failed to setup map", mpp->alias);
+		return 1;
+	}
+	select_action(mpp, vecs->mpvec, 1);
+
+	r = domap(mpp, params, is_daemon);
+	if (r == DOMAP_FAIL || r == DOMAP_RETRY) {
+		condlog(3, "%s: domap (%u) failure "
+			"for reload map", mpp->alias, r);
+		return 1;
+	}
+
+	return 0;
+}
+
 int update_path_groups(struct multipath *mpp, struct vectors *vecs, int refresh)
 {
 	if (reload_map(vecs, mpp, refresh, 1))
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

