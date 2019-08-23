Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1EC9B5CB
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA6761801592;
	Fri, 23 Aug 2019 17:49:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53D41001B12;
	Fri, 23 Aug 2019 17:49:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 555B71802218;
	Fri, 23 Aug 2019 17:49:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnGuI010231 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29E33608C2; Fri, 23 Aug 2019 17:49:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F8260872;
	Fri, 23 Aug 2019 17:49:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHnE2r006069; 
	Fri, 23 Aug 2019 12:49:14 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHnE7i006068;
	Fri, 23 Aug 2019 12:49:14 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:53 -0500
Message-Id: <1566582538-5979-10-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 09/14] libmultipath: make group_paths handle
	marginal paths
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Fri, 23 Aug 2019 17:49:38 +0000 (UTC)

group_paths() will now create seperate path groups for marginal and
normal paths, and place all of the marginal path groups after the normal
ones, in order by priority.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/pgpolicies.c  | 83 +++++++++++++++++++++++++++++++++-----
 libmultipath/switchgroup.c | 15 ++++++-
 2 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 2e7c0502..6fb2d28a 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -72,9 +72,11 @@ sort_pathgroups (struct multipath *mp) {
 			pgp2 = VECTOR_SLOT(mp->pg, j);
 			if (!pgp2)
 				continue;
-			if (pgp2->priority > pgp1->priority ||
-			    (pgp2->priority == pgp1->priority &&
-			     pgp2->enabled_paths >= pgp1->enabled_paths)) {
+			if (pgp2->marginal < pgp1->marginal ||
+			    (pgp2->marginal == pgp1->marginal &&
+			     (pgp2->priority > pgp1->priority ||
+			      (pgp2->priority == pgp1->priority &&
+			       pgp2->enabled_paths >= pgp1->enabled_paths)))) {
 				vector_move_up(mp->pg, i, j + 1);
 				break;
 			}
@@ -84,25 +86,88 @@ sort_pathgroups (struct multipath *mp) {
 	}
 }
 
+static int
+split_marginal_paths(vector paths, vector *normal_p, vector *marginal_p)
+{
+	int i;
+	int has_marginal = 0;
+	int has_normal = 0;
+	struct path *pp;
+	vector normal = NULL;
+	vector marginal = NULL;
+
+	*normal_p = *marginal_p = NULL;
+	vector_foreach_slot(paths, pp, i) {
+		if (pp->marginal)
+			has_marginal = 1;
+		else
+			has_normal = 1;
+	}
+
+	if (!has_marginal || !has_normal)
+		return -1;
+
+	normal = vector_alloc();
+	marginal = vector_alloc();
+	if (!normal || !marginal)
+		goto fail;
+
+	vector_foreach_slot(paths, pp, i) {
+		if (pp->marginal) {
+			if (store_path(marginal, pp))
+				goto fail;
+		}
+		else {
+			if (store_path(normal, pp))
+				goto fail;
+		}
+	}
+	*normal_p = normal;
+	*marginal_p = marginal;
+	return 0;
+fail:
+	vector_free(normal);
+	vector_free(marginal);
+	return -1;
+}
 
 int group_paths(struct multipath *mp)
 {
+	vector normal, marginal;
+
 	if (!mp->pg)
 		mp->pg = vector_alloc();
 	if (!mp->pg)
 		return 1;
 
-	if (VECTOR_SIZE(mp->paths) > 0 &&
-	    (!mp->pgpolicyfn || mp->pgpolicyfn(mp, mp->paths))) {
-		vector_free(mp->pg);
-		mp->pg = NULL;
-		return 1;
+	if (VECTOR_SIZE(mp->paths) == 0)
+		goto out;
+	if (!mp->pgpolicyfn)
+		goto fail;
+
+	if (split_marginal_paths(mp->paths, &normal, &marginal) != 0) {
+		if (mp->pgpolicyfn(mp, mp->paths) != 0)
+			goto fail;
+	} else {
+		if (mp->pgpolicyfn(mp, normal) != 0)
+			goto fail_marginal;
+		if (mp->pgpolicyfn(mp, marginal) != 0)
+			goto fail_marginal;
+		vector_free(normal);
+		vector_free(marginal);
 	}
-
 	sort_pathgroups(mp);
+out:
 	vector_free(mp->paths);
 	mp->paths = NULL;
 	return 0;
+fail_marginal:
+	vector_free(normal);
+	vector_free(marginal);
+fail:
+	vector_free(mp->pg);
+	mp->pg = NULL;
+	return 1;
 }
 
 typedef bool (path_match_fn)(struct path *pp1, struct path *pp2);
diff --git a/libmultipath/switchgroup.c b/libmultipath/switchgroup.c
index 9632ce2d..6fdfcfa7 100644
--- a/libmultipath/switchgroup.c
+++ b/libmultipath/switchgroup.c
@@ -11,6 +11,7 @@ void path_group_prio_update(struct pathgroup *pgp)
 {
 	int i;
 	int priority = 0;
+	int marginal = 0;
 	struct path * pp;
 
 	pgp->enabled_paths = 0;
@@ -19,6 +20,8 @@ void path_group_prio_update(struct pathgroup *pgp)
 		return;
 	}
 	vector_foreach_slot (pgp->paths, pp, i) {
+		if (pp->marginal)
+			marginal++;
 		if (pp->state == PATH_UP ||
 		    pp->state == PATH_GHOST) {
 			priority += pp->priority;
@@ -29,11 +32,14 @@ void path_group_prio_update(struct pathgroup *pgp)
 		pgp->priority = priority / pgp->enabled_paths;
 	else
 		pgp->priority = 0;
+	if (marginal && marginal == i)
+		pgp->marginal = 1;
 }
 
 int select_path_group(struct multipath *mpp)
 {
 	int i;
+	int normal_pgp = 0;
 	int max_priority = 0;
 	int bestpg = 1;
 	int max_enabled_paths = 1;
@@ -47,8 +53,15 @@ int select_path_group(struct multipath *mpp)
 			continue;
 
 		path_group_prio_update(pgp);
+		if (pgp->marginal && normal_pgp)
+			continue;
 		if (pgp->enabled_paths) {
-			if (pgp->priority > max_priority) {
+			if (!pgp->marginal && !normal_pgp) {
+				normal_pgp = 1;
+				max_priority = pgp->priority;
+				max_enabled_paths = pgp->enabled_paths;
+				bestpg = i + 1;
+			} else if (pgp->priority > max_priority) {
 				max_priority = pgp->priority;
 				max_enabled_paths = pgp->enabled_paths;
 				bestpg = i + 1;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
