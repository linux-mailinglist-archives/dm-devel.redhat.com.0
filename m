Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611F9B5CA
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 577CF3090FC4;
	Fri, 23 Aug 2019 17:49:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345066D0B1;
	Fri, 23 Aug 2019 17:49:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D199A24F33;
	Fri, 23 Aug 2019 17:49:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnFYn010226 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80DED850B; Fri, 23 Aug 2019 17:49:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4B260C44;
	Fri, 23 Aug 2019 17:49:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHnB6k006058; 
	Fri, 23 Aug 2019 12:49:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHnBOq006051;
	Fri, 23 Aug 2019 12:49:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:51 -0500
Message-Id: <1566582538-5979-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 07/14] libmultipath: consolidate group_by_*
	functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 23 Aug 2019 17:49:35 +0000 (UTC)

group_by_node_name() and group_by_serial() are exactly the same except
for how the paths are compared. group_by_prio() is different but its
pathvec solves the same issue as the bitmap from the other two
functions, and since we are always running sort_pathgroups() after
calling pgpriorityfn, there is no need to sort the pathgroups in
group_by_prio(). This means that all three functions can be replaced
with one function, group_by_match() that takes a match function as an
argument.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/pgpolicies.c | 189 +++++++++-----------------------------
 1 file changed, 41 insertions(+), 148 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 1af42f52..2e4db74c 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -4,6 +4,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <stdbool.h>
 
 #include "checkers.h"
 #include "util.h"
@@ -104,10 +105,29 @@ int group_paths(struct multipath *mp)
 	return 0;
 }
 
-/*
- * One path group per unique tgt_node_name present in the path vector
- */
-int group_by_node_name(struct multipath * mp)
+typedef bool (path_match_fn)(struct path *pp1, struct path *pp2);
+
+bool
+node_names_match(struct path *pp1, struct path *pp2)
+{
+	return (strncmp(pp1->tgt_node_name, pp2->tgt_node_name,
+			NODE_NAME_SIZE) == 0);
+}
+
+bool
+serials_match(struct path *pp1, struct path *pp2)
+{
+	return (strncmp(pp1->serial, pp2->serial, SERIAL_SIZE) == 0);
+}
+
+bool
+prios_match(struct path *pp1, struct path *pp2)
+{
+	return (pp1->priority == pp2->priority);
+}
+
+int group_by_match(struct multipath * mp,
+		   bool (*path_match_fn)(struct path *, struct path *))
 {
 	int i, j;
 	int * bitmap;
@@ -150,8 +170,7 @@ int group_by_node_name(struct multipath * mp)
 
 			pp2 = VECTOR_SLOT(mp->paths, j);
 
-			if (!strncmp(pp->tgt_node_name, pp2->tgt_node_name,
-					NODE_NAME_SIZE)) {
+			if (path_match_fn(pp, pp2)) {
 				if (store_path(pgp->paths, pp2))
 					goto out1;
 
@@ -171,70 +190,28 @@ out:
 	return 1;
 }
 
+/*
+ * One path group per unique tgt_node_name present in the path vector
+ */
+int group_by_node_name(struct multipath * mp)
+{
+	return group_by_match(mp, node_names_match);
+}
+
 /*
  * One path group per unique serial number present in the path vector
  */
 int group_by_serial(struct multipath * mp)
 {
-	int i, j;
-	int * bitmap;
-	struct path * pp;
-	struct pathgroup * pgp;
-	struct path * pp2;
-
-	/* init the bitmap */
-	bitmap = (int *)MALLOC(VECTOR_SIZE(mp->paths) * sizeof (int));
-
-	if (!bitmap)
-		goto out;
-
-	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
-
-		if (bitmap[i])
-			continue;
-
-		pp = VECTOR_SLOT(mp->paths, i);
-
-		/* here, we really got a new pg */
-		pgp = alloc_pathgroup();
-
-		if (!pgp)
-			goto out1;
-
-		if (add_pathgroup(mp, pgp))
-			goto out2;
-
-		/* feed the first path */
-		if (store_path(pgp->paths, pp))
-			goto out1;
-
-		bitmap[i] = 1;
-
-		for (j = i + 1; j < VECTOR_SIZE(mp->paths); j++) {
-
-			if (bitmap[j])
-				continue;
-
-			pp2 = VECTOR_SLOT(mp->paths, j);
-
-			if (0 == strcmp(pp->serial, pp2->serial)) {
-				if (store_path(pgp->paths, pp2))
-					goto out1;
+	return group_by_match(mp, serials_match);
+}
 
-				bitmap[j] = 1;
-			}
-		}
-	}
-	FREE(bitmap);
-	return 0;
-out2:
-	free_pathgroup(pgp, KEEP_PATHS);
-out1:
-	FREE(bitmap);
-out:
-	free_pgvec(mp->pg, KEEP_PATHS);
-	mp->pg = NULL;
-	return 1;
+/*
+ * One path group per priority present in the path vector
+ */
+int group_by_prio(struct multipath *mp)
+{
+	return group_by_match(mp, prios_match);
 }
 
 int one_path_per_group(struct multipath *mp)
@@ -293,87 +270,3 @@ out:
 	mp->pg = NULL;
 	return 1;
 }
-
-int group_by_prio(struct multipath *mp)
-{
-	int i;
-	int prio;
-	struct path * pp;
-	struct pathgroup * pgp;
-	vector pathvec = NULL;
-
-	pathvec = vector_alloc();
-	if (!pathvec)
-		goto out;
-
-	vector_foreach_slot(mp->paths, pp, i) {
-		if (!vector_alloc_slot(pathvec))
-			goto out1;
-		vector_set_slot(pathvec, pp);
-	}
-
-	while (VECTOR_SIZE(pathvec) > 0) {
-		pp = VECTOR_SLOT(pathvec, 0);
-		prio = pp->priority;
-
-		/*
-		 * Find the position to insert the new path group. All groups
-		 * are ordered by the priority value (higher value first).
-		 */
-		vector_foreach_slot(mp->pg, pgp, i) {
-			pp  = VECTOR_SLOT(pgp->paths, 0);
-
-			if (prio > pp->priority)
-				break;
-		}
-
-		/*
-		 * Initialize the new path group.
-		 */
-		pgp = alloc_pathgroup();
-
-		if (!pgp)
-			goto out1;
-
-		if (store_path(pgp->paths, VECTOR_SLOT(pathvec, 0)))
-			goto out2;
-
-		vector_del_slot(pathvec, 0);
-
-		/*
-		 * Store the new path group into the vector.
-		 */
-		if (i < VECTOR_SIZE(mp->pg)) {
-			if (!vector_insert_slot(mp->pg, i, pgp))
-				goto out2;
-			pgp->mpp = mp;
-		} else {
-			if (add_pathgroup(mp, pgp))
-				goto out2;
-		}
-
-		/*
-		 * add the other paths with the same prio
-		 */
-		vector_foreach_slot(pathvec, pp, i) {
-			if (pp->priority == prio) {
-				if (store_path(pgp->paths, pp))
-					goto out1;
-
-				vector_del_slot(pathvec, i);
-				i--;
-			}
-		}
-	}
-	free_pathvec(pathvec, KEEP_PATHS);
-	return 0;
-out2:
-	free_pathgroup(pgp, KEEP_PATHS);
-out1:
-	free_pathvec(pathvec, KEEP_PATHS);
-out:
-	free_pgvec(mp->pg, KEEP_PATHS);
-	mp->pg = NULL;
-	return 1;
-
-}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
