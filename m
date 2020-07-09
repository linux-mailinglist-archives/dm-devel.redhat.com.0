Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5A895219E00
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-pzUp4OPhOyyKi3N-H22XMg-1; Thu, 09 Jul 2020 06:37:09 -0400
X-MC-Unique: pzUp4OPhOyyKi3N-H22XMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 928CB18FF669;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F5355C298;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24C471806B0A;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AanaZ031620 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6608F2157F25; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 621852166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BAE218056A2
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-283-jAj8ZvP3NoGT5a-hgYwFAA-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: jAj8ZvP3NoGT5a-hgYwFAA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3C0F7AE83;
	Thu,  9 Jul 2020 10:36:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:19 +0200
Message-Id: <20200709103623.8302-9-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AanaZ031620
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 50/54] libmultipath: get_refwwid(): use symbolic
	return values
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The return values of get_refwwid() are the same as those of pathinfo().
So use them.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index defc54b..e68494b 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1354,11 +1354,11 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 	int flags = DI_SYSFS | DI_WWID;
 
 	if (!wwid)
-		return 1;
+		return PATHINFO_FAILED;
 	*wwid = NULL;
 
 	if (dev_type == DEV_NONE)
-		return 1;
+		return PATHINFO_FAILED;
 
 	if (cmd != CMD_REMOVE_WWID)
 		flags |= DI_BLACKLIST;
@@ -1367,7 +1367,7 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		if (basenamecpy(dev, buff, FILE_NAME_SIZE) == 0) {
 			condlog(1, "basename failed for '%s' (%s)",
 				dev, buff);
-			return 1;
+			return PATHINFO_FAILED;
 		}
 
 		pp = find_path_by_dev(pathvec, buff);
@@ -1376,13 +1376,13 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 				get_udev_device(buff, dev_type);
 
 			if (!udevice)
-				return 1;
+				return PATHINFO_FAILED;
 
 			ret = store_pathinfo(pathvec, conf, udevice,
 					     flags, &pp);
 			udev_device_unref(udevice);
 			if (!pp) {
-				if (ret == 1)
+				if (ret == PATHINFO_FAILED)
 					condlog(0, "%s: can't store path info",
 						dev);
 				return ret;
@@ -1390,7 +1390,7 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		}
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			return 2;
+			return PATHINFO_SKIPPED;
 
 		refwwid = pp->wwid;
 		goto out;
@@ -1405,14 +1405,14 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 
 			if (!udevice) {
 				condlog(0, "%s: cannot find block device", dev);
-				return 1;
+				return PATHINFO_FAILED;
 			}
 
 			ret = store_pathinfo(pathvec, conf, udevice,
 					     flags, &pp);
 			udev_device_unref(udevice);
 			if (!pp) {
-				if (ret == 1)
+				if (ret == PATHINFO_FAILED)
 					condlog(0, "%s can't store path info",
 						buff);
 				return ret;
@@ -1420,7 +1420,7 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		}
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			return 2;
+			return PATHINFO_SKIPPED;
 		refwwid = pp->wwid;
 		goto out;
 	}
@@ -1429,19 +1429,19 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		struct udev_device *udevice = get_udev_device(dev, dev_type);
 
 		if (!udevice)
-			return 1;
+			return PATHINFO_FAILED;
 
 		ret = store_pathinfo(pathvec, conf, udevice,
 				     flags, &pp);
 		udev_device_unref(udevice);
 		if (!pp) {
-			if (ret == 1)
+			if (ret == PATHINFO_FAILED)
 				condlog(0, "%s: can't store path info", dev);
 			return ret;
 		}
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			return 2;
+			return PATHINFO_SKIPPED;
 		refwwid = pp->wwid;
 		goto out;
 	}
@@ -1469,22 +1469,19 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		if (refwwid && strlen(refwwid) &&
 		    filter_wwid(conf->blist_wwid, conf->elist_wwid, refwwid,
 				NULL) > 0)
-			return 2;
+			return PATHINFO_SKIPPED;
 	}
 out:
 	if (refwwid && strlen(refwwid)) {
 		*wwid = STRDUP(refwwid);
-		return 0;
+		return PATHINFO_OK;
 	}
 
-	return 1;
+	return PATHINFO_FAILED;
 }
 
 /*
- * returns:
- * 0 - success
- * 1 - failure
- * 2 - blacklist
+ * Returns: PATHINFO_OK, PATHINFO_FAILED, or PATHINFO_SKIPPED (see pathinfo())
  */
 int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		vector pathvec, char **wwid)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

