Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCA7FEAD
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:38:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7754307D88C;
	Fri,  2 Aug 2019 16:38:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC2D1001B02;
	Fri,  2 Aug 2019 16:38:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C433C1800204;
	Fri,  2 Aug 2019 16:37:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GXrxJ001296 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:33:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCEB619D70; Fri,  2 Aug 2019 16:33:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D9119C70;
	Fri,  2 Aug 2019 16:33:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GXpe2031806; 
	Fri, 2 Aug 2019 11:33:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GXolT031805;
	Fri, 2 Aug 2019 11:33:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:30 -0500
Message-Id: <1564763622-31752-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 04/16] libmultipath: add wrapper function around
	pgpolicyfn
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 02 Aug 2019 16:38:13 +0000 (UTC)

group_paths() is a wrapper around the pgpolicy functions, that pulls out
the common code from the beginning and the end. However since
one_group() didn't free the mp->paths vector, it has to set it to NULL,
to avoid having the wrapper code do that. Also, the pathgroups in
group_by_prio are now needlessly sorted afterwards.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c  |  2 +-
 libmultipath/pgpolicies.c | 65 +++++++++++++--------------------------
 libmultipath/pgpolicies.h |  2 +-
 3 files changed, 23 insertions(+), 46 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index b09ef529..3c309d64 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -387,7 +387,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 		vector_free(mpp->pg);
 		mpp->pg = NULL;
 	}
-	if (mpp->pgpolicyfn && mpp->pgpolicyfn(mpp))
+	if (group_paths(mpp))
 		return 1;
 
 	/*
diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 660768a4..21d4f122 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -84,6 +84,26 @@ sort_pathgroups (struct multipath *mp) {
 }
 
 
+int group_paths(struct multipath *mp)
+{
+	if (!mp->pg)
+		mp->pg = vector_alloc();
+	if (!mp->pg)
+		return 1;
+
+	if (VECTOR_SIZE(mp->paths) > 0 &&
+	    (!mp->pgpolicyfn || mp->pgpolicyfn(mp))) {
+		vector_free(mp->pg);
+		mp->pg = NULL;
+		return 1;
+	}
+
+	sort_pathgroups(mp);
+	vector_free(mp->paths);
+	mp->paths = NULL;
+	return 0;
+}
+
 /*
  * One path group per unique tgt_node_name present in the path vector
  */
@@ -95,12 +115,6 @@ int group_by_node_name(struct multipath * mp)
 	struct pathgroup * pgp;
 	struct path * pp2;
 
-	if (!mp->pg)
-		mp->pg = vector_alloc();
-
-	if (!mp->pg)
-		return 1;
-
 	/* init the bitmap */
 	bitmap = (int *)MALLOC(VECTOR_SIZE(mp->paths) * sizeof (int));
 
@@ -146,9 +160,6 @@ int group_by_node_name(struct multipath * mp)
 		}
 	}
 	FREE(bitmap);
-	sort_pathgroups(mp);
-	free_pathvec(mp->paths, KEEP_PATHS);
-	mp->paths = NULL;
 	return 0;
 out2:
 	free_pathgroup(pgp, KEEP_PATHS);
@@ -171,12 +182,6 @@ int group_by_serial(struct multipath * mp)
 	struct pathgroup * pgp;
 	struct path * pp2;
 
-	if (!mp->pg)
-		mp->pg = vector_alloc();
-
-	if (!mp->pg)
-		return 1;
-
 	/* init the bitmap */
 	bitmap = (int *)MALLOC(VECTOR_SIZE(mp->paths) * sizeof (int));
 
@@ -221,9 +226,6 @@ int group_by_serial(struct multipath * mp)
 		}
 	}
 	FREE(bitmap);
-	sort_pathgroups(mp);
-	free_pathvec(mp->paths, KEEP_PATHS);
-	mp->paths = NULL;
 	return 0;
 out2:
 	free_pathgroup(pgp, KEEP_PATHS);
@@ -241,12 +243,6 @@ int one_path_per_group(struct multipath *mp)
 	struct path * pp;
 	struct pathgroup * pgp;
 
-	if (!mp->pg)
-		mp->pg = vector_alloc();
-
-	if (!mp->pg)
-		return 1;
-
 	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
 		pp = VECTOR_SLOT(mp->paths, i);
 		pgp = alloc_pathgroup();
@@ -260,9 +256,6 @@ int one_path_per_group(struct multipath *mp)
 		if (store_path(pgp->paths, pp))
 			goto out1;
 	}
-	sort_pathgroups(mp);
-	free_pathvec(mp->paths, KEEP_PATHS);
-	mp->paths = NULL;
 	return 0;
 out1:
 	free_pathgroup(pgp, KEEP_PATHS);
@@ -276,15 +269,6 @@ int one_group(struct multipath *mp)	/* aka multibus */
 {
 	struct pathgroup * pgp;
 
-	if (VECTOR_SIZE(mp->paths) < 0)
-		return 0;
-
-	if (!mp->pg)
-		mp->pg = vector_alloc();
-
-	if (!mp->pg)
-		return 1;
-
 	if (VECTOR_SIZE(mp->paths) > 0) {
 		pgp = alloc_pathgroup();
 
@@ -297,6 +281,7 @@ int one_group(struct multipath *mp)	/* aka multibus */
 			goto out1;
 
 		pgp->paths = mp->paths;
+		/* Do this to avoid freeing vector in group_paths */
 		mp->paths = NULL;
 	}
 
@@ -317,12 +302,6 @@ int group_by_prio(struct multipath *mp)
 	struct pathgroup * pgp;
 	vector pathvec = NULL;
 
-	if (!mp->pg)
-		mp->pg = vector_alloc();
-
-	if (!mp->pg)
-		return 1;
-
 	pathvec = vector_alloc();
 	if (!pathvec)
 		goto out;
@@ -387,8 +366,6 @@ int group_by_prio(struct multipath *mp)
 		}
 	}
 	free_pathvec(pathvec, KEEP_PATHS);
-	free_pathvec(mp->paths, KEEP_PATHS);
-	mp->paths = NULL;
 	return 0;
 out2:
 	free_pathgroup(pgp, KEEP_PATHS);
diff --git a/libmultipath/pgpolicies.h b/libmultipath/pgpolicies.h
index c0eaa7f4..11834011 100644
--- a/libmultipath/pgpolicies.h
+++ b/libmultipath/pgpolicies.h
@@ -21,7 +21,7 @@ enum iopolicies {
 
 int get_pgpolicy_id(char *);
 int get_pgpolicy_name (char *, int, int);
-
+int group_paths(struct multipath *);
 /*
  * policies
  */
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
