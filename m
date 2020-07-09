Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BF717219EA3
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ECian0pnNeGa--XaoiGoXA-1; Thu, 09 Jul 2020 07:04:14 -0400
X-MC-Unique: ECian0pnNeGa--XaoiGoXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C622B1083;
	Thu,  9 Jul 2020 11:04:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F34ED610F2;
	Thu,  9 Jul 2020 11:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC93293F90;
	Thu,  9 Jul 2020 11:04:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3rs4002050 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 956BB5F256; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 437375F26C
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CA8E8007D2
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-62-qLdbYeR-O0a4r_DDrtrq8w-1;
	Thu, 09 Jul 2020 07:03:48 -0400
X-MC-Unique: qLdbYeR-O0a4r_DDrtrq8w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1BABFAEC9;
	Thu,  9 Jul 2020 11:03:47 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:26 +0200
Message-Id: <20200709110330.9917-3-mwilck@suse.com>
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3rs4002050
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 76/80] libmultipath: select_action(): force udev
	reload for uninitialized maps
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

If we are in the reconfigure() code path, and we encounter maps to
be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to tell
udev not to repeat device detection steps above the multipath layer.
However, if the map was previously uninitialized, we have to force
udev to reload.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 61 ++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 2509053..efb5808 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -660,6 +660,32 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
 	return err;
 }
 
+static void
+select_reload_action(struct multipath *mpp, const char *reason)
+{
+	struct udev_device *mpp_ud;
+	const char *env;
+
+	/*
+	 * MPATH_DEVICE_READY != 1 can mean two things:
+	 *  (a) no usable paths
+	 *  (b) device was never fully processed (e.g. udev killed)
+	 * If we are in this code path (startup or forced reconfigure),
+	 * (b) can mean that upper layers like kpartx have never been
+	 * run for this map. Thus force udev reload.
+	 */
+
+	mpp_ud = get_udev_for_mpp(mpp);
+	env = udev_device_get_property_value(mpp_ud, "MPATH_DEVICE_READY");
+	if (!env || strcmp(env, "1"))
+		mpp->force_udev_reload = 1;
+	udev_device_unref(mpp_ud);
+	mpp->action = ACT_RELOAD;
+	condlog(3, "%s: set ACT_RELOAD (%s%s)", mpp->alias,
+		mpp->force_udev_reload ? "forced, " : "",
+		reason);
+}
+
 static void
 select_action (struct multipath * mpp, vector curmp, int force_reload)
 {
@@ -728,9 +754,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
 	    !!strstr(mpp->features, "queue_if_no_path") !=
 	    !!strstr(cmpp->features, "queue_if_no_path")) {
-		mpp->action =  ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (no_path_retry change)",
-			mpp->alias);
+		select_reload_action(cmpp, "no_path_retry change");
 		return;
 	}
 	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
@@ -738,9 +762,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
 	     strncmp(cmpp->hwhandler, mpp->hwhandler,
 		    strlen(mpp->hwhandler)))) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (hwhandler change)",
-			mpp->alias);
+		select_reload_action(cmpp, "hwhandler change");
 		return;
 	}
 
@@ -748,9 +770,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
 	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (retain_hwhandler change)",
-			mpp->alias);
+		select_reload_action(cmpp, "retain_hwhandler change");
 		return;
 	}
 
@@ -762,9 +782,10 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		remove_feature(&cmpp_feat, "queue_if_no_path");
 		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
 		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
-			mpp->action =  ACT_RELOAD;
-			condlog(3, "%s: set ACT_RELOAD (features change)",
-				mpp->alias);
+			select_reload_action(cmpp, "features change");
+			FREE(cmpp_feat);
+			FREE(mpp_feat);
+			return;
 		}
 	}
 	FREE(cmpp_feat);
@@ -772,27 +793,19 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 
 	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
 		    strlen(mpp->selector))) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (selector change)",
-			mpp->alias);
+		select_reload_action(cmpp, "selector change");
 		return;
 	}
 	if (cmpp->minio != mpp->minio) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (minio change, %u->%u)",
-			mpp->alias, cmpp->minio, mpp->minio);
+		select_reload_action(cmpp, "minio change");
 		return;
 	}
 	if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (path group number change)",
-			mpp->alias);
+		select_reload_action(cmpp, "path group number change");
 		return;
 	}
 	if (pgcmp(mpp, cmpp)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (path group topology change)",
-			mpp->alias);
+		select_reload_action(cmpp, "path group topology change");
 		return;
 	}
 	if (cmpp->nextpg != mpp->bestpg) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

