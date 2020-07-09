Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 13CA9219E45
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-BF_WnBlYPlOeoDcLt3CB0A-1; Thu, 09 Jul 2020 06:52:34 -0400
X-MC-Unique: BF_WnBlYPlOeoDcLt3CB0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661851082;
	Thu,  9 Jul 2020 10:52:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5C290E65;
	Thu,  9 Jul 2020 10:52:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CFA7180954D;
	Thu,  9 Jul 2020 10:52:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqILT000580 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9EA42026D67; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E882026D69
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5459100E7C1
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-275-kS06L8R-N5Snlitekkzlrw-1;
	Thu, 09 Jul 2020 06:52:15 -0400
X-MC-Unique: kS06L8R-N5Snlitekkzlrw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8AF6CAEBF;
	Thu,  9 Jul 2020 10:52:12 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:29 +0200
Message-Id: <20200709105145.9211-6-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqILT000580
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 58/74] libmultipath: verify_paths(): don't delete
	paths from pathvec
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

If we encounter a non-existing device verify_paths(), just set
it to INIT_REMOVED state. Actual path deletion is postponed until
we don't see that path in the kernel map any more.

This allows us to get rid of the "pathvec" argument to this function.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c   |  2 +-
 libmultipath/structs_vec.c | 16 +++++++++-------
 libmultipath/structs_vec.h |  2 +-
 multipathd/main.c          |  4 ++--
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 48426cd..2509053 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1196,7 +1196,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 				set_bit_in_bitfield(i, size_mismatch_seen);
 			}
 		}
-		verify_paths(mpp, vecs);
+		verify_paths(mpp);
 
 		if (does_alias_exist(newmp, mpp)) {
 			remove_map(mpp, vecs, PURGE_VEC);
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 8999552..5634101 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -502,11 +502,11 @@ out:
 	return NULL;
 }
 
-int verify_paths(struct multipath *mpp, struct vectors *vecs)
+int verify_paths(struct multipath *mpp)
 {
 	struct path * pp;
 	int count = 0;
-	int i, j;
+	int i;
 
 	if (!mpp)
 		return 0;
@@ -521,7 +521,7 @@ int verify_paths(struct multipath *mpp, struct vectors *vecs)
 				condlog(1, "%s: removing valid path %s in state %d",
 					mpp->alias, pp->dev, pp->state);
 			} else {
-				condlog(3, "%s: failed to access path %s",
+				condlog(2, "%s: failed to access path %s",
 					mpp->alias, pp->dev);
 			}
 			count++;
@@ -534,10 +534,12 @@ int verify_paths(struct multipath *mpp, struct vectors *vecs)
 			 */
 			if (mpp->hwe == pp->hwe)
 				mpp->hwe = NULL;
-			if ((j = find_slot(vecs->pathvec,
-					   (void *)pp)) != -1)
-				vector_del_slot(vecs->pathvec, j);
-			free_path(pp);
+			/*
+			 * Don't delete path from pathvec yet. We'll do this
+			 * after the path has been removed from the map, in
+			 * sync_paths().
+			 */
+			set_path_removed(pp);
 		} else {
 			condlog(4, "%s: verified path %s dev_t %s",
 				mpp->alias, pp->dev, pp->dev_t);
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index cf7d569..cd3ef76 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -20,7 +20,7 @@ void orphan_paths(vector pathvec, struct multipath *mpp,
 void orphan_path (struct path * pp, const char *reason);
 void set_path_removed(struct path *pp);
 
-int verify_paths(struct multipath * mpp, struct vectors * vecs);
+int verify_paths(struct multipath *mpp);
 int update_mpp_paths(struct multipath * mpp, vector pathvec);
 int update_multipath_strings (struct multipath *mpp, vector pathvec,
 			      int is_daemon);
diff --git a/multipathd/main.c b/multipathd/main.c
index 4a5aa17..402e179 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -492,7 +492,7 @@ retry:
 		retries = -1;
 		goto fail;
 	}
-	verify_paths(mpp, vecs);
+	verify_paths(mpp);
 	mpp->action = ACT_RELOAD;
 
 	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
@@ -959,7 +959,7 @@ rescan:
 		if (adopt_paths(vecs->pathvec, mpp))
 			goto fail; /* leave path added to pathvec */
 
-		verify_paths(mpp, vecs);
+		verify_paths(mpp);
 		mpp->action = ACT_RELOAD;
 	} else {
 		if (!should_multipath(pp, vecs->pathvec, vecs->mpvec)) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

