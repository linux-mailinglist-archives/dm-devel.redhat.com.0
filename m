Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 61D291FDA2B
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M2fNJS7FobnW+rn/MBq7uOTVJLgb86BSwJVeVRh8Pbc=;
	b=cIF1vUWZSYn+XD2GCZJWy2N/WaK76dH81JVjznG1r225+X1ofPcKhpFCaM+CUpD9lyobPD
	5RxShF9v5aE+lPPsXPys/DDdWXdjRzL6+Ft24CHfiX31sCL5DRfAGbB/VJsScY4eaNFbJi
	VfZs/X82Ia6sjHAX1uYYATPQPzAFE/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-QxDzVRoIOCmDA1DRNa9J-A-1; Wed, 17 Jun 2020 20:25:05 -0400
X-MC-Unique: QxDzVRoIOCmDA1DRNa9J-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA65410059A5;
	Thu, 18 Jun 2020 00:24:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 279AC5D9E4;
	Thu, 18 Jun 2020 00:24:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20AE51809547;
	Thu, 18 Jun 2020 00:24:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0OXSb026480 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F28D25D9E5; Thu, 18 Jun 2020 00:24:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EFB5D9E4;
	Thu, 18 Jun 2020 00:24:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OT1D018469; 
	Wed, 17 Jun 2020 19:24:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OT3Z018468;
	Wed, 17 Jun 2020 19:24:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:21 -0500
Message-Id: <1592439867-18427-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/7] libmultipath: change do_get_info returns
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make do_get_info() differentiate between dm failures and missing
devices, and update callers to retain their current behavior. Also,
rename it and make it external. These changes will be used by future
commits.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 29 ++++++++++++++++-------------
 libmultipath/devmapper.h |  1 +
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 27d52398..b44f7545 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -496,8 +496,14 @@ int dm_addmap_reload(struct multipath *mpp, char *params, int flush)
 	return 0;
 }
 
-static int
-do_get_info(const char *name, struct dm_info *info)
+/*
+ * Returns:
+ * -1: Error
+ *  0: device does not exist
+ *  1: device exists
+ */
+int
+do_dm_get_info(const char *name, struct dm_info *info)
 {
 	int r = -1;
 	struct dm_task *dmt;
@@ -516,10 +522,7 @@ do_get_info(const char *name, struct dm_info *info)
 	if (!dm_task_get_info(dmt, info))
 		goto out;
 
-	if (!info->exists)
-		goto out;
-
-	r = 0;
+	r = !!info->exists;
 out:
 	dm_task_destroy(dmt);
 	return r;
@@ -529,7 +532,7 @@ int dm_map_present(const char * str)
 {
 	struct dm_info info;
 
-	return (do_get_info(str, &info) == 0);
+	return (do_dm_get_info(str, &info) == 1);
 }
 
 int dm_get_map(const char *name, unsigned long long *size, char *outparams)
@@ -820,7 +823,7 @@ dm_dev_t (const char * mapname, char * dev_t, int len)
 {
 	struct dm_info info;
 
-	if (do_get_info(mapname, &info) != 0)
+	if (do_dm_get_info(mapname, &info) != 1)
 		return 1;
 
 	if (snprintf(dev_t, len, "%i:%i", info.major, info.minor) > len)
@@ -862,7 +865,7 @@ dm_get_major_minor(const char *name, int *major, int *minor)
 {
 	struct dm_info info;
 
-	if (do_get_info(name, &info) != 0)
+	if (do_dm_get_info(name, &info) != 1)
 		return -1;
 
 	*major = info.major;
@@ -1199,7 +1202,7 @@ dm_geteventnr (const char *name)
 {
 	struct dm_info info;
 
-	if (do_get_info(name, &info) != 0)
+	if (do_dm_get_info(name, &info) != 1)
 		return -1;
 
 	return info.event_nr;
@@ -1210,7 +1213,7 @@ dm_is_suspended(const char *name)
 {
 	struct dm_info info;
 
-	if (do_get_info(name, &info) != 0)
+	if (do_dm_get_info(name, &info) != 1)
 		return -1;
 
 	return info.suspended;
@@ -1383,7 +1386,7 @@ dm_get_deferred_remove (const char * mapname)
 {
 	struct dm_info info;
 
-	if (do_get_info(mapname, &info) != 0)
+	if (do_dm_get_info(mapname, &info) != 1)
 		return -1;
 
 	return info.deferred_remove;
@@ -1442,7 +1445,7 @@ dm_get_info (const char * mapname, struct dm_info ** dmi)
 	if (!*dmi)
 		return 1;
 
-	if (do_get_info(mapname, *dmi) != 0) {
+	if (do_dm_get_info(mapname, *dmi) != 1) {
 		memset(*dmi, 0, sizeof(struct dm_info));
 		FREE(*dmi);
 		*dmi = NULL;
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 5ed7edc5..79c9afb2 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -66,6 +66,7 @@ char * dm_mapname(int major, int minor);
 int dm_remove_partmaps (const char * mapname, int need_sync,
 			int deferred_remove);
 int dm_get_uuid(const char *name, char *uuid, int uuid_len);
+int do_dm_get_info(const char *, struct dm_info *);
 int dm_get_info (const char * mapname, struct dm_info ** dmi);
 int dm_rename (const char * old, char * new, char * delim, int skip_kpartx);
 int dm_reassign(const char * mapname);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

