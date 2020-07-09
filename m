Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB1D219E01
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-vnmMYvlzM5SaqEBVU_mSrQ-1; Thu, 09 Jul 2020 06:37:11 -0400
X-MC-Unique: vnmMYvlzM5SaqEBVU_mSrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4315108BD16;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7501002394;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4070893F90;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AanmO031612 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36F0C1000DAA; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330EF100405E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC5080CDDF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-tk4P7jyMO7u_IwM1mzSB-g-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: tk4P7jyMO7u_IwM1mzSB-g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 764DBAEBF;
	Thu,  9 Jul 2020 10:36:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:20 +0200
Message-Id: <20200709103623.8302-10-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AanmO031612
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 51/54] libmultipath: get_refwwid(): use switch
	statement
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

This code calls for a switch. Some additional compaction is possible by
observing that the code for DEV_DEVNODE, DEV_DEVT, and DEV_UEVENT is almost
the same, and factoring it out into a "common" section. Doing this with
a goto inside the switch statement is a bit unusual, but shows the intention
of the code more clearly than other variants I tried.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 81 ++++++++++++----------------------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index e68494b..db9a255 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1351,6 +1351,7 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 	struct path * pp;
 	char buff[FILE_NAME_SIZE];
 	char * refwwid = NULL, tmpwwid[WWID_SIZE];
+	struct udev_device *udevice;
 	int flags = DI_SYSFS | DI_WWID;
 
 	if (!wwid)
@@ -1363,45 +1364,31 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 	if (cmd != CMD_REMOVE_WWID)
 		flags |= DI_BLACKLIST;
 
-	if (dev_type == DEV_DEVNODE) {
+	switch (dev_type) {
+	case DEV_DEVNODE:
 		if (basenamecpy(dev, buff, FILE_NAME_SIZE) == 0) {
 			condlog(1, "basename failed for '%s' (%s)",
 				dev, buff);
 			return PATHINFO_FAILED;
 		}
 
-		pp = find_path_by_dev(pathvec, buff);
-		if (!pp) {
-			struct udev_device *udevice =
-				get_udev_device(buff, dev_type);
+		/* dev is used in common code below */
+		dev = buff;
+		pp = find_path_by_dev(pathvec, dev);
+		goto common;
 
-			if (!udevice)
-				return PATHINFO_FAILED;
-
-			ret = store_pathinfo(pathvec, conf, udevice,
-					     flags, &pp);
-			udev_device_unref(udevice);
-			if (!pp) {
-				if (ret == PATHINFO_FAILED)
-					condlog(0, "%s: can't store path info",
-						dev);
-				return ret;
-			}
-		}
-		if (pp->udev && pp->uid_attribute &&
-		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			return PATHINFO_SKIPPED;
-
-		refwwid = pp->wwid;
-		goto out;
-	}
-
-	if (dev_type == DEV_DEVT) {
+	case DEV_DEVT:
 		strchop(dev);
 		pp = find_path_by_devt(pathvec, dev);
+		goto common;
+
+	case DEV_UEVENT:
+		pp = NULL;
+		/* For condlog below, dev is unused in get_udev_device() */
+		dev = "environment";
+	common:
 		if (!pp) {
-			struct udev_device *udevice =
-				get_udev_device(dev, dev_type);
+			udevice = get_udev_device(dev, dev_type);
 
 			if (!udevice) {
 				condlog(0, "%s: cannot find block device", dev);
@@ -1413,8 +1400,8 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 			udev_device_unref(udevice);
 			if (!pp) {
 				if (ret == PATHINFO_FAILED)
-					condlog(0, "%s can't store path info",
-						buff);
+					condlog(0, "%s: can't store path info",
+						dev);
 				return ret;
 			}
 		}
@@ -1422,32 +1409,9 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
 			return PATHINFO_SKIPPED;
 		refwwid = pp->wwid;
-		goto out;
-	}
-
-	if (dev_type == DEV_UEVENT) {
-		struct udev_device *udevice = get_udev_device(dev, dev_type);
-
-		if (!udevice)
-			return PATHINFO_FAILED;
-
-		ret = store_pathinfo(pathvec, conf, udevice,
-				     flags, &pp);
-		udev_device_unref(udevice);
-		if (!pp) {
-			if (ret == PATHINFO_FAILED)
-				condlog(0, "%s: can't store path info", dev);
-			return ret;
-		}
-		if (pp->udev && pp->uid_attribute &&
-		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			return PATHINFO_SKIPPED;
-		refwwid = pp->wwid;
-		goto out;
-	}
-
-	if (dev_type == DEV_DEVMAP) {
+		break;
 
+	case DEV_DEVMAP:
 		if (((dm_get_uuid(dev, tmpwwid, WWID_SIZE)) == 0)
 		    && (strlen(tmpwwid)))
 			refwwid = tmpwwid;
@@ -1470,8 +1434,11 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		    filter_wwid(conf->blist_wwid, conf->elist_wwid, refwwid,
 				NULL) > 0)
 			return PATHINFO_SKIPPED;
+		break;
+	default:
+		break;
 	}
-out:
+
 	if (refwwid && strlen(refwwid)) {
 		*wwid = STRDUP(refwwid);
 		return PATHINFO_OK;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

