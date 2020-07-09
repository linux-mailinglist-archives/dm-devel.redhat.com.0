Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 38FE0219E46
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-8XkQv81qM0GIqfuvN9K7qQ-1; Thu, 09 Jul 2020 06:52:35 -0400
X-MC-Unique: 8XkQv81qM0GIqfuvN9K7qQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3FDF19200C2;
	Thu,  9 Jul 2020 10:52:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C08260C80;
	Thu,  9 Jul 2020 10:52:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF17093F81;
	Thu,  9 Jul 2020 10:52:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqIJA000581 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBDC2208BDE9; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BAF208BDE0
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75DA58007CD
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-381-XcdIavBSOeqyrj6DPaM8jg-1;
	Thu, 09 Jul 2020 06:52:16 -0400
X-MC-Unique: XcdIavBSOeqyrj6DPaM8jg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19CB5AE39;
	Thu,  9 Jul 2020 10:52:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:36 +0200
Message-Id: <20200709105145.9211-13-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqIJA000581
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 65/74] libmultipath: add update_pathvec_from_dm()
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

It can happen in particular during boot or startup that we encounter
paths as map members which haven't been discovered or fully initialized
yet, and are thus not in the pathvec. These paths need special treatment
in various ways. Currently this is dealt with in disassemble_map(). That's
a layer violation, and the way it is done is suboptimal in various ways.

As a preparation to change that, this patch introduces a new function,
update_pathvec_from_dm(), that is supposed to deal with newly discovered
paths from disassemble_map(). It has to be called after disassemble_map()
has finished.

The logic of the new function is similar but not identical to what
disassemble_map() was doing before. Firstly, the function will simply
remove path devices that don't exist - there's no point in carrying these
around. Map reloads can't be called from this code for reasons of the
overall program logic. But it's prepared to signal to the caller that
a map reload is in order. Using this return value will be future work.

Second, pathinfo() is now called on new paths rather than just setting
pp->dev. The pathinfo flags can be passed as argument to make the function
flexible for different callers.

Finally, treatment of WWIDs is different now. There'll be only one attempt
at guessing the map WWID if it's not set yet. If a non-matching path WWID
is found, the path is removed, and a new uevent triggered (this is the
most important change wrt the dangerous previous code that would simply
overwrite the path WWID). If the path WWID is empty, it will still be
set from the map WWID, which I consider not perfect, but no worse
than what we did before.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 134 +++++++++++++++++++++++++++++++++++++
 libmultipath/structs_vec.h |   2 +
 2 files changed, 136 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 1e0f109..5dd37d5 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -59,6 +59,140 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
 	return store_failure;
 }
 
+static bool guess_mpp_wwid(struct multipath *mpp)
+{
+	int i, j;
+	struct pathgroup *pgp;
+	struct path *pp;
+
+	if (strlen(mpp->wwid) || !mpp->pg)
+		return true;
+
+	vector_foreach_slot(mpp->pg, pgp, i) {
+		if (!pgp->paths)
+			continue;
+		vector_foreach_slot(pgp->paths, pp, j) {
+			if (pp->initialized == INIT_OK && strlen(pp->wwid)) {
+				strlcpy(mpp->wwid, pp->wwid, sizeof(mpp->wwid));
+				condlog(2, "%s: guessed WWID %s from path %s",
+					mpp->alias, mpp->wwid, pp->dev);
+				return true;
+			}
+		}
+	}
+	condlog(1, "%s: unable to guess WWID", mpp->alias);
+	return false;
+}
+
+/*
+ * update_pathvec_from_dm() - update pathvec after disassemble_map()
+ *
+ * disassemble_map() may return block devices that are members in
+ * multipath maps but haven't been discovered. Check whether they
+ * need to be added to pathvec or discarded.
+ *
+ * Returns: true if immediate map reload is desirable
+ *
+ * Side effects:
+ * - may delete non-existing paths and empty pathgroups from mpp
+ * - may set pp->wwid and / or mpp->wwid
+ * - calls pathinfo() on existing paths is pathinfo_flags is not 0
+ */
+bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
+	int pathinfo_flags)
+{
+	int i, j;
+	struct pathgroup *pgp;
+	struct path *pp;
+	struct config *conf;
+	bool mpp_has_wwid;
+	bool must_reload = false;
+
+	if (!mpp->pg)
+		return false;
+
+	mpp_has_wwid = guess_mpp_wwid(mpp);
+
+	vector_foreach_slot(mpp->pg, pgp, i) {
+		if (!pgp->paths)
+			goto delete_pg;
+
+		vector_foreach_slot(pgp->paths, pp, j) {
+			pp->mpp = mpp;
+
+			if (pp->udev) {
+				if (pathinfo_flags) {
+					conf = get_multipath_config();
+					pthread_cleanup_push(put_multipath_config,
+							     conf);
+					pathinfo(pp, conf, pathinfo_flags);
+					pthread_cleanup_pop(1);
+				}
+				continue;
+			}
+
+			/* If this fails, the device is not in sysfs */
+			pp->udev = get_udev_device(pp->dev_t, DEV_DEVT);
+			if (!pp->udev) {
+				condlog(2, "%s: discarding non-existing path %s",
+					mpp->alias, pp->dev_t);
+				vector_del_slot(pgp->paths, j--);
+				free_path(pp);
+				must_reload = true;
+			} else {
+
+				devt2devname(pp->dev, sizeof(pp->dev),
+					     pp->dev_t);
+				conf = get_multipath_config();
+				pthread_cleanup_push(put_multipath_config,
+						     conf);
+				pp->checkint = conf->checkint;
+				if (pathinfo(pp, conf,
+					     DI_SYSFS|DI_WWID|pathinfo_flags)
+				    != PATHINFO_OK)
+					condlog(1, "%s: error in pathinfo",
+						pp->dev);
+				pthread_cleanup_pop(1);
+				if (mpp_has_wwid && !strlen(pp->wwid)) {
+					condlog(3, "%s: setting wwid from map: %s",
+						pp->dev, mpp->wwid);
+					strlcpy(pp->wwid, mpp->wwid,
+						sizeof(pp->wwid));
+				} else if (mpp_has_wwid &&
+					   strcmp(mpp->wwid, pp->wwid)) {
+
+					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
+						mpp->wwid, pp->dev_t, pp->wwid);
+					/*
+					 * This path exists, but in the wong map.
+					 * We can't reload the map from here.
+					 * Instead, treat this path like "missing udev",
+					 * which it probably is.
+					 * check_path() will trigger an uevent
+					 * and reset pp->tick.
+					 */
+					must_reload = true;
+					pp->mpp = NULL;
+					dm_fail_path(mpp->alias, pp->dev_t);
+					vector_del_slot(pgp->paths, j--);
+					pp->initialized = INIT_MISSING_UDEV;
+					pp->tick = 1;
+				}
+				condlog(2, "%s: adding new path %s",
+					mpp->alias, pp->dev);
+				store_path(pathvec, pp);
+			}
+		}
+		if (VECTOR_SIZE(pgp->paths) != 0)
+			continue;
+	delete_pg:
+		condlog(2, "%s: removing empty pathgroup %d", mpp->alias, i);
+		vector_del_slot(mpp->pg, i--);
+		free_pathgroup(pgp, KEEP_PATHS);
+	}
+	return must_reload;
+}
+
 int adopt_paths(vector pathvec, struct multipath *mpp)
 {
 	int i, ret;
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index cd3ef76..4c28148 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -21,6 +21,8 @@ void orphan_path (struct path * pp, const char *reason);
 void set_path_removed(struct path *pp);
 
 int verify_paths(struct multipath *mpp);
+bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
+			    int pathinfo_flags);
 int update_mpp_paths(struct multipath * mpp, vector pathvec);
 int update_multipath_strings (struct multipath *mpp, vector pathvec,
 			      int is_daemon);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

