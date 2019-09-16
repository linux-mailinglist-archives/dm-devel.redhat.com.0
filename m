Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6CB379B
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 11:56:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFE598750EF;
	Mon, 16 Sep 2019 09:56:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 060345D6A3;
	Mon, 16 Sep 2019 09:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2E644E589;
	Mon, 16 Sep 2019 09:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8G9tm4U017223 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 05:55:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79A4E60610; Mon, 16 Sep 2019 09:55:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 928B5608C2;
	Mon, 16 Sep 2019 09:55:43 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x8G9thu6013012; Mon, 16 Sep 2019 05:55:43 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x8G9thkb013008; Mon, 16 Sep 2019 05:55:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 16 Sep 2019 05:55:42 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <mbroz@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, lvm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm: introduce DM_GET_TARGET_VERSION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Mon, 16 Sep 2019 09:56:10 +0000 (UTC)

This patch introduces a new ioctl DM_GET_TARGET_VERSION. It will load a
target that is specified in the "name" entry in the parameter structure
and return its version.

This functionality is intended to be used by cryptsetup, so that it can
query kernel capabilities before activating the device.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ioctl.c         |   32 +++++++++++++++++++++++++++++---
 include/uapi/linux/dm-ioctl.h |    6 ++++--
 2 files changed, 33 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-ioctl.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ioctl.c	2019-09-16 11:42:45.000000000 +0200
+++ linux-2.6/drivers/md/dm-ioctl.c	2019-09-16 11:50:10.000000000 +0200
@@ -601,17 +601,27 @@ static void list_version_get_info(struct
     info->vers = align_ptr(((void *) ++info->vers) + strlen(tt->name) + 1);
 }
 
-static int list_versions(struct file *filp, struct dm_ioctl *param, size_t param_size)
+static int __list_versions(struct dm_ioctl *param, size_t param_size, const char *name)
 {
 	size_t len, needed = 0;
 	struct dm_target_versions *vers;
 	struct vers_iter iter_info;
+	struct target_type *tt = NULL;
+
+	if (name) {
+		tt = dm_get_target_type(name);
+		if (!tt)
+			return -EINVAL;
+	}
 
 	/*
 	 * Loop through all the devices working out how much
 	 * space we need.
 	 */
-	dm_target_iterate(list_version_get_needed, &needed);
+	if (!tt)
+		dm_target_iterate(list_version_get_needed, &needed);
+	else
+		list_version_get_needed(tt, &needed);
 
 	/*
 	 * Grab our output buffer.
@@ -632,13 +642,28 @@ static int list_versions(struct file *fi
 	/*
 	 * Now loop through filling out the names & versions.
 	 */
-	dm_target_iterate(list_version_get_info, &iter_info);
+	if (!tt)
+		dm_target_iterate(list_version_get_info, &iter_info);
+	else
+		list_version_get_info(tt, &iter_info);
 	param->flags |= iter_info.flags;
 
  out:
+	if (tt)
+		dm_put_target_type(tt);
 	return 0;
 }
 
+static int list_versions(struct file *filp, struct dm_ioctl *param, size_t param_size)
+{
+	return __list_versions(param, param_size, NULL);
+}
+
+static int get_target_version(struct file *filp, struct dm_ioctl *param, size_t param_size)
+{
+	return __list_versions(param, param_size, param->name);
+}
+
 static int check_name(const char *name)
 {
 	if (strchr(name, '/')) {
@@ -1664,6 +1689,7 @@ static ioctl_fn lookup_ioctl(unsigned in
 		{DM_TARGET_MSG_CMD, 0, target_message},
 		{DM_DEV_SET_GEOMETRY_CMD, 0, dev_set_geometry},
 		{DM_DEV_ARM_POLL, IOCTL_FLAGS_NO_PARAMS, dev_arm_poll},
+		{DM_GET_TARGET_VERSION, 0, get_target_version},
 	};
 
 	if (unlikely(cmd >= ARRAY_SIZE(_ioctls)))
Index: linux-2.6/include/uapi/linux/dm-ioctl.h
===================================================================
--- linux-2.6.orig/include/uapi/linux/dm-ioctl.h	2019-09-16 11:42:45.000000000 +0200
+++ linux-2.6/include/uapi/linux/dm-ioctl.h	2019-09-16 11:50:37.000000000 +0200
@@ -243,6 +243,7 @@ enum {
 	DM_TARGET_MSG_CMD,
 	DM_DEV_SET_GEOMETRY_CMD,
 	DM_DEV_ARM_POLL_CMD,
+	DM_GET_TARGET_VERSION_CMD,
 };
 
 #define DM_IOCTL 0xfd
@@ -265,14 +266,15 @@ enum {
 #define DM_TABLE_STATUS  _IOWR(DM_IOCTL, DM_TABLE_STATUS_CMD, struct dm_ioctl)
 
 #define DM_LIST_VERSIONS _IOWR(DM_IOCTL, DM_LIST_VERSIONS_CMD, struct dm_ioctl)
+#define DM_GET_TARGET_VERSION _IOWR(DM_IOCTL, DM_GET_TARGET_VERSION_CMD, struct dm_ioctl)
 
 #define DM_TARGET_MSG	 _IOWR(DM_IOCTL, DM_TARGET_MSG_CMD, struct dm_ioctl)
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
 
 #define DM_VERSION_MAJOR	4
-#define DM_VERSION_MINOR	40
+#define DM_VERSION_MINOR	41
 #define DM_VERSION_PATCHLEVEL	0
-#define DM_VERSION_EXTRA	"-ioctl (2019-01-18)"
+#define DM_VERSION_EXTRA	"-ioctl (2019-09-16)"
 
 /* Status bits */
 #define DM_READONLY_FLAG	(1 << 0) /* In/Out */

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
