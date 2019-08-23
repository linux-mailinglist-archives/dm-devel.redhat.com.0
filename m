Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C919B5C4
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAB727F773;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B812260C80;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 594EB24FDF;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnEla010221 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B43E45D9E5; Fri, 23 Aug 2019 17:49:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 916F65D9CA;
	Fri, 23 Aug 2019 17:49:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHnD3Y006063; 
	Fri, 23 Aug 2019 12:49:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHnCNY006061;
	Fri, 23 Aug 2019 12:49:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:52 -0500
Message-Id: <1566582538-5979-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 08/14] libmultipath: make pgpolicyfn take a
	paths vector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Fri, 23 Aug 2019 17:49:28 +0000 (UTC)

To enable future changes, mp->pgpolicyfn() now takes a vector of
paths instead of always using mp->paths.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/pgpolicies.c | 38 +++++++++++++++++++-------------------
 libmultipath/pgpolicies.h | 10 +++++-----
 libmultipath/structs.h    |  2 +-
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 2e4db74c..2e7c0502 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -93,7 +93,7 @@ int group_paths(struct multipath *mp)
 		return 1;
 
 	if (VECTOR_SIZE(mp->paths) > 0 &&
-	    (!mp->pgpolicyfn || mp->pgpolicyfn(mp))) {
+	    (!mp->pgpolicyfn || mp->pgpolicyfn(mp, mp->paths))) {
 		vector_free(mp->pg);
 		mp->pg = NULL;
 		return 1;
@@ -126,7 +126,7 @@ prios_match(struct path *pp1, struct path *pp2)
 	return (pp1->priority == pp2->priority);
 }
 
-int group_by_match(struct multipath * mp,
+int group_by_match(struct multipath * mp, vector paths,
 		   bool (*path_match_fn)(struct path *, struct path *))
 {
 	int i, j;
@@ -136,17 +136,17 @@ int group_by_match(struct multipath * mp,
 	struct path * pp2;
 
 	/* init the bitmap */
-	bitmap = (int *)MALLOC(VECTOR_SIZE(mp->paths) * sizeof (int));
+	bitmap = (int *)MALLOC(VECTOR_SIZE(paths) * sizeof (int));
 
 	if (!bitmap)
 		goto out;
 
-	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
+	for (i = 0; i < VECTOR_SIZE(paths); i++) {
 
 		if (bitmap[i])
 			continue;
 
-		pp = VECTOR_SLOT(mp->paths, i);
+		pp = VECTOR_SLOT(paths, i);
 
 		/* here, we really got a new pg */
 		pgp = alloc_pathgroup();
@@ -163,12 +163,12 @@ int group_by_match(struct multipath * mp,
 
 		bitmap[i] = 1;
 
-		for (j = i + 1; j < VECTOR_SIZE(mp->paths); j++) {
+		for (j = i + 1; j < VECTOR_SIZE(paths); j++) {
 
 			if (bitmap[j])
 				continue;
 
-			pp2 = VECTOR_SLOT(mp->paths, j);
+			pp2 = VECTOR_SLOT(paths, j);
 
 			if (path_match_fn(pp, pp2)) {
 				if (store_path(pgp->paths, pp2))
@@ -193,35 +193,35 @@ out:
 /*
  * One path group per unique tgt_node_name present in the path vector
  */
-int group_by_node_name(struct multipath * mp)
+int group_by_node_name(struct multipath * mp, vector paths)
 {
-	return group_by_match(mp, node_names_match);
+	return group_by_match(mp, paths, node_names_match);
 }
 
 /*
  * One path group per unique serial number present in the path vector
  */
-int group_by_serial(struct multipath * mp)
+int group_by_serial(struct multipath * mp, vector paths)
 {
-	return group_by_match(mp, serials_match);
+	return group_by_match(mp, paths, serials_match);
 }
 
 /*
  * One path group per priority present in the path vector
  */
-int group_by_prio(struct multipath *mp)
+int group_by_prio(struct multipath *mp, vector paths)
 {
-	return group_by_match(mp, prios_match);
+	return group_by_match(mp, paths, prios_match);
 }
 
-int one_path_per_group(struct multipath *mp)
+int one_path_per_group(struct multipath *mp, vector paths)
 {
 	int i;
 	struct path * pp;
 	struct pathgroup * pgp;
 
-	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
-		pp = VECTOR_SLOT(mp->paths, i);
+	for (i = 0; i < VECTOR_SIZE(paths); i++) {
+		pp = VECTOR_SLOT(paths, i);
 		pgp = alloc_pathgroup();
 
 		if (!pgp)
@@ -242,7 +242,7 @@ out:
 	return 1;
 }
 
-int one_group(struct multipath *mp)	/* aka multibus */
+int one_group(struct multipath *mp, vector paths)	/* aka multibus */
 {
 	int i;
 	struct path * pp;
@@ -256,8 +256,8 @@ int one_group(struct multipath *mp)	/* aka multibus */
 	if (add_pathgroup(mp, pgp))
 		goto out1;
 
-	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
-		pp = VECTOR_SLOT(mp->paths, i);
+	for (i = 0; i < VECTOR_SIZE(paths); i++) {
+		pp = VECTOR_SLOT(paths, i);
 
 		if (store_path(pgp->paths, pp))
 			goto out;
diff --git a/libmultipath/pgpolicies.h b/libmultipath/pgpolicies.h
index 11834011..7532d75f 100644
--- a/libmultipath/pgpolicies.h
+++ b/libmultipath/pgpolicies.h
@@ -25,10 +25,10 @@ int group_paths(struct multipath *);
 /*
  * policies
  */
-int one_path_per_group(struct multipath *);
-int one_group(struct multipath *);
-int group_by_serial(struct multipath *);
-int group_by_prio(struct multipath *);
-int group_by_node_name(struct multipath *);
+int one_path_per_group(struct multipath *, vector);
+int one_group(struct multipath *, vector);
+int group_by_serial(struct multipath *, vector);
+int group_by_prio(struct multipath *, vector);
+int group_by_node_name(struct multipath *, vector);
 
 #endif
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 893074eb..a8b9d325 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -295,7 +295,7 @@ struct path {
 	struct gen_path generic_path;
 };
 
-typedef int (pgpolicyfn) (struct multipath *);
+typedef int (pgpolicyfn) (struct multipath *, vector);
 
 struct multipath {
 	char wwid[WWID_SIZE];
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
