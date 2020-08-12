Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2D85B2428CE
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-_U2XHl9TNjyhmMuDl_R-sg-1; Wed, 12 Aug 2020 07:36:23 -0400
X-MC-Unique: _U2XHl9TNjyhmMuDl_R-sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402FC890F13;
	Wed, 12 Aug 2020 11:35:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CAA75D9D3;
	Wed, 12 Aug 2020 11:35:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C44F7A554F;
	Wed, 12 Aug 2020 11:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZjBU028838 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF1612026D69; Wed, 12 Aug 2020 11:35:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA74C2018283
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1B52185A797
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-194-n79sB-kHO3CU6_5B6JJFmg-1;
	Wed, 12 Aug 2020 07:35:38 -0400
X-MC-Unique: n79sB-kHO3CU6_5B6JJFmg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C6AADB709;
	Wed, 12 Aug 2020 11:35:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:09 +0200
Message-Id: <20200812113511.26469-7-mwilck@suse.com>
In-Reply-To: <20200812113511.26469-1-mwilck@suse.com>
References: <20200812113511.26469-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZjBU028838
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 65/74] libmultipath: add
	update_pathvec_from_dm()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 libmultipath/structs_vec.c | 136 +++++++++++++++++++++++++++++++++++++
 libmultipath/structs_vec.h |   2 +
 2 files changed, 138 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index b644d3f..bd2d13b 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -59,6 +59,142 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
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
+	/*
+	 * This will initialize mpp->wwid with an educated guess,
+	 * either from the dm uuid or from a member path with properly
+	 * determined WWID.
+	 */
+	mpp_has_wwid = guess_mpp_wwid(mpp);
+
+	vector_foreach_slot(mpp->pg, pgp, i) {
+		if (!pgp->paths)
+			goto delete_pg;
+
+		vector_foreach_slot(pgp->paths, pp, j) {
+			pp->mpp = mpp;
+
+			/*
+			 * The way disassemble_map() works: If it encounters a
+			 * path device which isn't found in pathvec, it adds an
+			 * uninitialized struct path to pgp->paths, with only
+			 * pp->dev_t filled in. Thus if pp->udev is set here,
+			 * we know that the path is in pathvec already.
+			 */
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
+				int rc;
+
+				devt2devname(pp->dev, sizeof(pp->dev),
+					     pp->dev_t);
+				conf = get_multipath_config();
+				pthread_cleanup_push(put_multipath_config,
+						     conf);
+				pp->checkint = conf->checkint;
+				rc = pathinfo(pp, conf,
+					      DI_SYSFS|DI_WWID|DI_BLACKLIST|
+					      pathinfo_flags);
+				pthread_cleanup_pop(1);
+				if (rc != PATHINFO_OK) {
+					condlog(1, "%s: error %d in pathinfo, discarding path",
+						pp->dev, rc);
+					vector_del_slot(pgp->paths, j--);
+					free_path(pp);
+					must_reload = true;
+				} else {
+					if (mpp_has_wwid && !strlen(pp->wwid)) {
+						condlog(3, "%s: setting wwid from map: %s",
+							pp->dev, mpp->wwid);
+						strlcpy(pp->wwid, mpp->wwid,
+							sizeof(pp->wwid));
+					}
+					condlog(2, "%s: adding new path %s",
+						mpp->alias, pp->dev);
+					store_path(pathvec, pp);
+					pp->tick = 1;
+				}
+			}
+		}
+		if (VECTOR_SIZE(pgp->paths) != 0)
+			continue;
+	delete_pg:
+		condlog(2, "%s: removing empty pathgroup %d", mpp->alias, i);
+		vector_del_slot(mpp->pg, i--);
+		free_pathgroup(pgp, KEEP_PATHS);
+		must_reload = true;
+	}
+	return must_reload;
+}
+
 int adopt_paths(vector pathvec, struct multipath *mpp)
 {
 	int i, ret;
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index d7dfe32..6c79069 100644
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

