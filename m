Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A5534249F64
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:18:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-_Aeu7Q7rOR2SQihnbnmxjg-1; Wed, 19 Aug 2020 09:18:25 -0400
X-MC-Unique: _Aeu7Q7rOR2SQihnbnmxjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37EAB801AB5;
	Wed, 19 Aug 2020 13:18:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12687756BE;
	Wed, 19 Aug 2020 13:18:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE73F662B0;
	Wed, 19 Aug 2020 13:18:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDICiM020866 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:18:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05FB42166BB3; Wed, 19 Aug 2020 13:18:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E4E2166BA0
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9348A801181
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-78-Yjj4DJ5KN_uUobDil0qW-A-1;
	Wed, 19 Aug 2020 09:18:02 -0400
X-MC-Unique: Yjj4DJ5KN_uUobDil0qW-A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ED82FACC6;
	Wed, 19 Aug 2020 13:18:27 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:17:46 +0200
Message-Id: <20200819131747.13400-2-mwilck@suse.com>
In-Reply-To: <20200819131747.13400-1-mwilck@suse.com>
References: <20200819131747.13400-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDICiM020866
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 76/80] libmultipath: select_action(): force
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
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
 libmultipath/configure.c | 62 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index cc54818..a492e0a 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -660,6 +660,33 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
 	return err;
 }
 
+static void
+select_reload_action(struct multipath *mpp, const struct multipath *cmpp,
+		     const char *reason)
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
@@ -728,9 +755,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
 	    !!strstr(mpp->features, "queue_if_no_path") !=
 	    !!strstr(cmpp->features, "queue_if_no_path")) {
-		mpp->action =  ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (no_path_retry change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "no_path_retry change");
 		return;
 	}
 	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
@@ -738,9 +763,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
 	     strncmp(cmpp->hwhandler, mpp->hwhandler,
 		    strlen(mpp->hwhandler)))) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (hwhandler change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "hwhandler change");
 		return;
 	}
 
@@ -748,9 +771,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
 	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (retain_hwhandler change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "retain_hwhandler change");
 		return;
 	}
 
@@ -762,9 +783,10 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		remove_feature(&cmpp_feat, "queue_if_no_path");
 		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
 		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
-			mpp->action =  ACT_RELOAD;
-			condlog(3, "%s: set ACT_RELOAD (features change)",
-				mpp->alias);
+			select_reload_action(mpp, cmpp, "features change");
+			FREE(cmpp_feat);
+			FREE(mpp_feat);
+			return;
 		}
 	}
 	FREE(cmpp_feat);
@@ -772,27 +794,19 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 
 	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
 		    strlen(mpp->selector))) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (selector change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "selector change");
 		return;
 	}
 	if (cmpp->minio != mpp->minio) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (minio change, %u->%u)",
-			mpp->alias, cmpp->minio, mpp->minio);
+		select_reload_action(mpp, cmpp, "minio change");
 		return;
 	}
 	if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (path group number change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "path group number change");
 		return;
 	}
 	if (pgcmp(mpp, cmpp)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (path group topology change)",
-			mpp->alias);
+		select_reload_action(mpp, cmpp, "path group topology change");
 		return;
 	}
 	if (cmpp->nextpg != mpp->bestpg) {
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

