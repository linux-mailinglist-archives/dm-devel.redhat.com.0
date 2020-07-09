Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 82BBD219E03
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-buel6symOtmAnsKcXMkgtg-1; Thu, 09 Jul 2020 06:37:11 -0400
X-MC-Unique: buel6symOtmAnsKcXMkgtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848F4108BD09;
	Thu,  9 Jul 2020 10:36:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6257890E65;
	Thu,  9 Jul 2020 10:36:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E665180CB27;
	Thu,  9 Jul 2020 10:36:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AaoTU031649 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F9AA208DD80; Thu,  9 Jul 2020 10:36:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B58A2026D69
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC19100E7C1
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-32-9sv2N6R3MDKXq-iDH9GDQw-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: 9sv2N6R3MDKXq-iDH9GDQw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B5206AE7F;
	Thu,  9 Jul 2020 10:36:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:17 +0200
Message-Id: <20200709103623.8302-7-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AaoTU031649
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 48/54] libmultipath: get_refwwid(): call
	get_multipath_config() only once
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

rather than 7 times in a single function. In get_refwwid(), the code that
is not run under the RCU read lock is negligible, so we might as well
keep the lock.

The "invalid" variable becomes obsolete by this change.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 60 ++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 39 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index e8d6db8..c4712d7 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1344,22 +1344,14 @@ struct udev_device *get_udev_device(const char *dev, enum devtypes dev_type)
 	return ud;
 }
 
-/*
- * returns:
- * 0 - success
- * 1 - failure
- * 2 - blacklist
- */
-int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
-		vector pathvec, char **wwid)
+static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
+			vector pathvec, struct config *conf, char **wwid)
 {
 	int ret = 1;
 	struct path * pp;
 	char buff[FILE_NAME_SIZE];
 	char * refwwid = NULL, tmpwwid[WWID_SIZE];
 	int flags = DI_SYSFS | DI_WWID;
-	struct config *conf;
-	int invalid = 0;
 
 	if (!wwid)
 		return 1;
@@ -1386,11 +1378,8 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 			if (!udevice)
 				return 1;
 
-			conf = get_multipath_config();
-			pthread_cleanup_push(put_multipath_config, conf);
 			ret = store_pathinfo(pathvec, conf, udevice,
 					     flags, &pp);
-			pthread_cleanup_pop(1);
 			udev_device_unref(udevice);
 			if (!pp) {
 				if (ret == 1)
@@ -1399,13 +1388,8 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 				return ret;
 			}
 		}
-		conf = get_multipath_config();
-		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			invalid = 1;
-		pthread_cleanup_pop(1);
-		if (invalid)
 			return 2;
 
 		refwwid = pp->wwid;
@@ -1424,11 +1408,8 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 				return 1;
 			}
 
-			conf = get_multipath_config();
-			pthread_cleanup_push(put_multipath_config, conf);
 			ret = store_pathinfo(pathvec, conf, udevice,
 					     flags, &pp);
-			pthread_cleanup_pop(1);
 			udev_device_unref(udevice);
 			if (!pp) {
 				if (ret == 1)
@@ -1437,13 +1418,8 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 				return ret;
 			}
 		}
-		conf = get_multipath_config();
-		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			invalid = 1;
-		pthread_cleanup_pop(1);
-		if (invalid)
 			return 2;
 		refwwid = pp->wwid;
 		goto out;
@@ -1455,24 +1431,16 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		if (!udevice)
 			return 1;
 
-		conf = get_multipath_config();
-		pthread_cleanup_push(put_multipath_config, conf);
 		ret = store_pathinfo(pathvec, conf, udevice,
 				     flags, &pp);
-		pthread_cleanup_pop(1);
 		udev_device_unref(udevice);
 		if (!pp) {
 			if (ret == 1)
 				condlog(0, "%s: can't store path info", dev);
 			return ret;
 		}
-		conf = get_multipath_config();
-		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
-			invalid = 1;
-		pthread_cleanup_pop(1);
-		if (invalid)
 			return 2;
 		refwwid = pp->wwid;
 		goto out;
@@ -1480,8 +1448,6 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 
 	if (dev_type == DEV_DEVMAP) {
 
-		conf = get_multipath_config();
-		pthread_cleanup_push(put_multipath_config, conf);
 		if (((dm_get_uuid(dev, tmpwwid, WWID_SIZE)) == 0)
 		    && (strlen(tmpwwid))) {
 			refwwid = tmpwwid;
@@ -1512,9 +1478,6 @@ check:
 		if (refwwid && strlen(refwwid) &&
 		    filter_wwid(conf->blist_wwid, conf->elist_wwid, refwwid,
 				NULL) > 0)
-			invalid = 1;
-		pthread_cleanup_pop(1);
-		if (invalid)
 			return 2;
 	}
 out:
@@ -1526,6 +1489,25 @@ out:
 	return 1;
 }
 
+/*
+ * returns:
+ * 0 - success
+ * 1 - failure
+ * 2 - blacklist
+ */
+int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
+		vector pathvec, char **wwid)
+
+{
+	int ret;
+	struct config *conf = get_multipath_config();
+
+	pthread_cleanup_push(put_multipath_config, conf);
+	ret = _get_refwwid(cmd, dev, dev_type, pathvec, conf, wwid);
+	pthread_cleanup_pop(1);
+	return ret;
+}
+
 int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
 	       int is_daemon)
 {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

