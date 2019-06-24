Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A981D505B4
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3FAB2F8BDF;
	Mon, 24 Jun 2019 09:30:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78375608D0;
	Mon, 24 Jun 2019 09:30:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8C7C206D3;
	Mon, 24 Jun 2019 09:30:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9T8XL004751 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D446D60BFC; Mon, 24 Jun 2019 09:29:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B0360BF7;
	Mon, 24 Jun 2019 09:29:08 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5040B81F0D;
	Mon, 24 Jun 2019 09:29:01 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:57 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:35 +0200
Message-Id: <20190624092756.7769-11-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 24 Jun 2019 09:29:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 24 Jun 2019 09:29:01 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 09/30] libmultipath: add size argument to
	dm_get_uuid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 24 Jun 2019 09:30:32 +0000 (UTC)

The length of the uuid field in libdm is DM_UUID_LEN, which happens
to be one byte more than our WWID_SIZE. Handle this cleanly.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c |  2 +-
 libmultipath/devmapper.c | 28 +++++++++++++++++-----------
 libmultipath/devmapper.h |  2 +-
 libmultipath/wwids.c     |  3 ++-
 multipathd/main.c        |  2 +-
 5 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 52afa378..c8dd69b0 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1451,7 +1451,7 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
-		if (((dm_get_uuid(dev, tmpwwid)) == 0)
+		if (((dm_get_uuid(dev, tmpwwid, WWID_SIZE)) == 0)
 		    && (strlen(tmpwwid))) {
 			refwwid = tmpwwid;
 			goto check;
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 2e79667d..0f0c3a34 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -13,7 +13,9 @@
 #include <unistd.h>
 #include <errno.h>
 #include <sys/sysmacros.h>
+#include <linux/dm-ioctl.h>
 
+#include "util.h"
 #include "checkers.h"
 #include "vector.h"
 #include "structs.h"
@@ -554,7 +556,7 @@ out:
 }
 
 static int
-dm_get_prefixed_uuid(const char *name, char *uuid)
+dm_get_prefixed_uuid(const char *name, char *uuid, int uuid_len)
 {
 	struct dm_task *dmt;
 	const char *uuidtmp;
@@ -572,7 +574,7 @@ dm_get_prefixed_uuid(const char *name, char *uuid)
 
 	uuidtmp = dm_task_get_uuid(dmt);
 	if (uuidtmp)
-		strcpy(uuid, uuidtmp);
+		strlcpy(uuid, uuidtmp, uuid_len);
 	else
 		uuid[0] = '\0';
 
@@ -582,14 +584,18 @@ uuidout:
 	return r;
 }
 
-int dm_get_uuid(const char *name, char *uuid)
+int dm_get_uuid(const char *name, char *uuid, int uuid_len)
 {
-	if (dm_get_prefixed_uuid(name, uuid))
+	char tmp[DM_UUID_LEN];
+
+	if (dm_get_prefixed_uuid(name, tmp, sizeof(tmp)))
 		return 1;
 
-	if (!strncmp(uuid, UUID_PREFIX, UUID_PREFIX_LEN))
-		memmove(uuid, uuid + UUID_PREFIX_LEN,
-			strlen(uuid + UUID_PREFIX_LEN) + 1);
+	if (!strncmp(tmp, UUID_PREFIX, UUID_PREFIX_LEN))
+		strlcpy(uuid, tmp + UUID_PREFIX_LEN, uuid_len);
+	else
+		uuid[0] = '\0';
+
 	return 0;
 }
 
@@ -597,12 +603,12 @@ static int
 is_mpath_part(const char *part_name, const char *map_name)
 {
 	char *p;
-	char part_uuid[WWID_SIZE], map_uuid[WWID_SIZE];
+	char part_uuid[DM_UUID_LEN], map_uuid[DM_UUID_LEN];
 
-	if (dm_get_prefixed_uuid(part_name, part_uuid))
+	if (dm_get_prefixed_uuid(part_name, part_uuid, sizeof(part_uuid)))
 		return 0;
 
-	if (dm_get_prefixed_uuid(map_name, map_uuid))
+	if (dm_get_prefixed_uuid(map_name, map_uuid, sizeof(map_uuid)))
 		return 0;
 
 	if (strncmp(part_uuid, "part", 4) != 0)
@@ -1066,7 +1072,7 @@ struct multipath *dm_get_multipath(const char *name)
 	if (dm_get_map(name, &mpp->size, NULL))
 		goto out;
 
-	dm_get_uuid(name, mpp->wwid);
+	dm_get_uuid(name, mpp->wwid, WWID_SIZE);
 	dm_get_info(name, &mpp->dmi);
 
 	return mpp;
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index db75526c..7557a86b 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -63,7 +63,7 @@ int dm_get_major_minor (const char *name, int *major, int *minor);
 char * dm_mapname(int major, int minor);
 int dm_remove_partmaps (const char * mapname, int need_sync,
 			int deferred_remove);
-int dm_get_uuid(const char *name, char *uuid);
+int dm_get_uuid(const char *name, char *uuid, int uuid_len);
 int dm_get_info (const char * mapname, struct dm_info ** dmi);
 int dm_rename (const char * old, char * new, char * delim, int skip_kpartx);
 int dm_reassign(const char * mapname);
diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index 53e79511..ef748125 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -294,7 +294,8 @@ should_multipath(struct path *pp1, vector pathvec, vector mpvec)
 		char tmp_wwid[WWID_SIZE];
 		struct multipath *mp = find_mp_by_wwid(mpvec, pp1->wwid);
 
-		if (mp != NULL && dm_get_uuid(mp->alias, tmp_wwid) == 0 &&
+		if (mp != NULL &&
+		    dm_get_uuid(mp->alias, tmp_wwid, WWID_SIZE) == 0 &&
 		    !strncmp(tmp_wwid, pp1->wwid, WWID_SIZE)) {
 			condlog(3, "wwid %s is already multipathed, keeping it",
 				pp1->wwid);
diff --git a/multipathd/main.c b/multipathd/main.c
index eef84a39..2e4973d7 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -406,7 +406,7 @@ set_multipath_wwid (struct multipath * mpp)
 	if (strlen(mpp->wwid))
 		return;
 
-	dm_get_uuid(mpp->alias, mpp->wwid);
+	dm_get_uuid(mpp->alias, mpp->wwid, WWID_SIZE);
 }
 
 static void set_no_path_retry(struct multipath *mpp)
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
