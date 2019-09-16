Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C292FB37A7
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 11:58:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EC0A18C8937;
	Mon, 16 Sep 2019 09:58:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3785860BE1;
	Mon, 16 Sep 2019 09:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 588111808876;
	Mon, 16 Sep 2019 09:58:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8G9wJHY017326 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 05:58:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D59455C299; Mon, 16 Sep 2019 09:58:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 370785C21A;
	Mon, 16 Sep 2019 09:58:11 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x8G9wAhD013625; Mon, 16 Sep 2019 05:58:10 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x8G9wAlS013622; Mon, 16 Sep 2019 05:58:10 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 16 Sep 2019 05:58:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <mbroz@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1909160555580.11421@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, lvm-devel@redhat.com
Subject: [dm-devel] [PATCH] lvm: introduce DM_GET_TARGET_VERSION
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 16 Sep 2019 09:58:26 +0000 (UTC)

This is userspace patch that adds support for the DM_GET_TARGET_VERSION to 
dmsetup. It introduces a new comman "target-version" that will accept list 
of targets and print their version.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 device_mapper/all.h               |    4 +++-
 device_mapper/ioctl/libdm-iface.c |    3 +++
 device_mapper/misc/dm-ioctl.h     |    3 +++
 libdm/dm-tools/dmsetup.c          |   28 ++++++++++++++++++++++++++++
 libdm/ioctl/libdm-iface.c         |    3 +++
 libdm/libdevmapper.h              |    4 +++-
 libdm/misc/dm-ioctl.h             |    2 ++
 7 files changed, 45 insertions(+), 2 deletions(-)

Index: lvm2/libdm/dm-tools/dmsetup.c
===================================================================
--- lvm2.orig/libdm/dm-tools/dmsetup.c	2019-09-16 10:11:12.000000000 +0200
+++ lvm2/libdm/dm-tools/dmsetup.c	2019-09-16 10:35:21.000000000 +0200
@@ -2587,6 +2587,33 @@ out:
 	return r;
 }
 
+/* Show target names and their version numbers */
+static int _target_version(CMD_ARGS)
+{
+	int r = 0;
+	struct dm_task *dmt;
+	struct dm_versions *target;
+
+	if (!(dmt = dm_task_create(DM_GET_TARGET_VERSION)))
+		return_0;
+
+	if (!dm_task_set_name(dmt, argv[0]))
+		goto_out;
+
+	if (!_task_run(dmt))
+		goto_out;
+
+	target = dm_task_get_versions(dmt);
+	printf("%-16s v%d.%d.%d\n", target->name, target->version[0],
+	       target->version[1], target->version[2]);
+
+	r = 1;
+
+out:
+	dm_task_destroy(dmt);
+	return r;
+}
+
 static int _info(CMD_ARGS)
 {
 	int r = 0;
@@ -6239,6 +6266,7 @@ static struct command _dmsetup_commands[
 	{"udevcomplete", "<cookie>", 1, 1, 0, 0, _udevcomplete},
 	{"udevcomplete_all", "[<age_in_minutes>]", 0, 1, 0, 0, _udevcomplete_all},
 	{"udevcookies", "", 0, 0, 0, 0, _udevcookies},
+	{"target-version", "[<target>...]", 1, -1, 1, 0, _target_version},
 	{"targets", "", 0, 0, 0, 0, _targets},
 	{"version", "", 0, 0, 0, 0, _version},
 	{"setgeometry", "<device> <cyl> <head> <sect> <start>", 5, 5, 0, 0, _setgeometry},
Index: lvm2/device_mapper/all.h
===================================================================
--- lvm2.orig/device_mapper/all.h	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/device_mapper/all.h	2019-09-16 10:19:16.000000000 +0200
@@ -121,7 +121,9 @@ enum {
 
 	DM_DEVICE_SET_GEOMETRY,
 
-	DM_DEVICE_ARM_POLL
+	DM_DEVICE_ARM_POLL,
+
+	DM_GET_TARGET_VERSION
 };
 
 /*
Index: lvm2/libdm/libdevmapper.h
===================================================================
--- lvm2.orig/libdm/libdevmapper.h	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/libdm/libdevmapper.h	2019-09-16 10:18:50.000000000 +0200
@@ -121,7 +121,9 @@ enum {
 
 	DM_DEVICE_SET_GEOMETRY,
 
-	DM_DEVICE_ARM_POLL
+	DM_DEVICE_ARM_POLL,
+
+	DM_GET_TARGET_VERSION
 };
 
 /*
Index: lvm2/device_mapper/ioctl/libdm-iface.c
===================================================================
--- lvm2.orig/device_mapper/ioctl/libdm-iface.c	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/device_mapper/ioctl/libdm-iface.c	2019-09-16 10:23:48.000000000 +0200
@@ -119,6 +119,9 @@ static struct cmd_data _cmd_data_v4[] =
 #ifdef DM_DEV_ARM_POLL
 	{"armpoll",	DM_DEV_ARM_POLL,	{4, 36, 0}},
 #endif
+#ifdef DM_GET_TARGET_VERSION
+	{"target-version", DM_GET_TARGET_VERSION, {4, 41, 0}},
+#endif
 };
 /* *INDENT-ON* */
 
Index: lvm2/libdm/ioctl/libdm-iface.c
===================================================================
--- lvm2.orig/libdm/ioctl/libdm-iface.c	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/libdm/ioctl/libdm-iface.c	2019-09-16 10:30:24.000000000 +0200
@@ -118,6 +118,9 @@ static struct cmd_data _cmd_data_v4[] =
 #ifdef DM_DEV_ARM_POLL
 	{"armpoll",	DM_DEV_ARM_POLL,	{4, 36, 0}},
 #endif
+#ifdef DM_GET_TARGET_VERSION
+	{"target-version", DM_GET_TARGET_VERSION, {4, 41, 0}},
+#endif
 };
 /* *INDENT-ON* */
 
Index: lvm2/device_mapper/misc/dm-ioctl.h
===================================================================
--- lvm2.orig/device_mapper/misc/dm-ioctl.h	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/device_mapper/misc/dm-ioctl.h	2019-09-16 10:29:24.000000000 +0200
@@ -244,6 +244,7 @@ enum {
 	DM_TARGET_MSG_CMD,
 	DM_DEV_SET_GEOMETRY_CMD,
 	DM_DEV_ARM_POLL_CMD,
+	DM_GET_TARGET_VERSION_CMD,
 };
 
 #define DM_IOCTL 0xfd
@@ -270,6 +271,8 @@ enum {
 #define DM_TARGET_MSG	 _IOWR(DM_IOCTL, DM_TARGET_MSG_CMD, struct dm_ioctl)
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
 
+#define DM_GET_TARGET_VERSION	_IOWR(DM_IOCTL, DM_GET_TARGET_VERSION_CMD, struct dm_ioctl)
+
 #define DM_VERSION_MAJOR	4
 #define DM_VERSION_MINOR	36
 #define DM_VERSION_PATCHLEVEL	0
Index: lvm2/libdm/misc/dm-ioctl.h
===================================================================
--- lvm2.orig/libdm/misc/dm-ioctl.h	2019-09-16 09:58:45.000000000 +0200
+++ lvm2/libdm/misc/dm-ioctl.h	2019-09-16 10:30:04.000000000 +0200
@@ -244,6 +244,7 @@ enum {
 	DM_TARGET_MSG_CMD,
 	DM_DEV_SET_GEOMETRY_CMD,
 	DM_DEV_ARM_POLL_CMD,
+	DM_GET_TARGET_VERSION_CMD,
 };
 
 #define DM_IOCTL 0xfd
@@ -269,6 +270,7 @@ enum {
 
 #define DM_TARGET_MSG	 _IOWR(DM_IOCTL, DM_TARGET_MSG_CMD, struct dm_ioctl)
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
+#define DM_GET_TARGET_VERSION	_IOWR(DM_IOCTL, DM_GET_TARGET_VERSION_CMD, struct dm_ioctl)
 
 #define DM_VERSION_MAJOR	4
 #define DM_VERSION_MINOR	36

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
