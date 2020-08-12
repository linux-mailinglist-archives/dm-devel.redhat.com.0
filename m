Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EA67C2428CA
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-0zstjfDoO8KDh6l_UfZfWg-1; Wed, 12 Aug 2020 07:36:09 -0400
X-MC-Unique: 0zstjfDoO8KDh6l_UfZfWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6B810074D1;
	Wed, 12 Aug 2020 11:36:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B1E55D6BD;
	Wed, 12 Aug 2020 11:36:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49F56181A06D;
	Wed, 12 Aug 2020 11:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBa0TT028882 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E58CDD0180; Wed, 12 Aug 2020 11:35:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1878D0161
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C98371033656
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-74-IQ1eo3RwNOS8EL-QWeHkDw-1;
	Wed, 12 Aug 2020 07:35:57 -0400
X-MC-Unique: IQ1eo3RwNOS8EL-QWeHkDw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0174B6FE;
	Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:40 +0200
Message-Id: <20200812113543.26576-2-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBa0TT028882
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 76/80] libmultipath: select_action(): force
	udev reload for uninitialized maps
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

If we are in the reconfigure() code path, and we encounter maps to
be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to tell
udev not to repeat device detection steps above the multipath layer.
However, if the map was previously uninitialized, we have to force
udev to reload.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 61 ++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index cc54818..ac57b88 100644
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
+	mpp_ud = get_udev_for_mpp(cmpp);
+	env = udev_device_get_property_value(mpp_ud, "MPATH_DEVICE_READY");
+	if ((!env || strcmp(env, "1")) && count_active_paths(mpp) > 0)
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

