Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DBC9B5C6
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88AAE10F23EA;
	Fri, 23 Aug 2019 17:49:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62CA75C28C;
	Fri, 23 Aug 2019 17:49:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F13A8180BA9D;
	Fri, 23 Aug 2019 17:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnB2I010189 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8692F5C3FA; Fri, 23 Aug 2019 17:49:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E705C28F;
	Fri, 23 Aug 2019 17:49:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHnAHL006045; 
	Fri, 23 Aug 2019 12:49:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHn98q006044;
	Fri, 23 Aug 2019 12:49:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:50 -0500
Message-Id: <1566582538-5979-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 06/14] libmultipath: fix double free in
	pgpolicyfn error paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Fri, 23 Aug 2019 17:49:31 +0000 (UTC)

In the pgpolicy functions, if an error is encountered after
alloc_pathgroup() is called, but before the path group is added to a
multipath device with add_pathgroup(), the pathgroup needs to be cleaned
up by calling free_pathgroup(). However, after the pathgroup has been
added to the multipath device, calling free_pgvec() will clean it up. In
this case, if free_pathgroup() is called first, the recently added
pathgroup will be freed twice.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/pgpolicies.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 1b59485c..1af42f52 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -139,7 +139,7 @@ int group_by_node_name(struct multipath * mp)
 
 		/* feed the first path */
 		if (store_path(pgp->paths, pp))
-			goto out2;
+			goto out1;
 
 		bitmap[i] = 1;
 
@@ -153,7 +153,7 @@ int group_by_node_name(struct multipath * mp)
 			if (!strncmp(pp->tgt_node_name, pp2->tgt_node_name,
 					NODE_NAME_SIZE)) {
 				if (store_path(pgp->paths, pp2))
-					goto out2;
+					goto out1;
 
 				bitmap[j] = 1;
 			}
@@ -206,7 +206,7 @@ int group_by_serial(struct multipath * mp)
 
 		/* feed the first path */
 		if (store_path(pgp->paths, pp))
-			goto out2;
+			goto out1;
 
 		bitmap[i] = 1;
 
@@ -219,7 +219,7 @@ int group_by_serial(struct multipath * mp)
 
 			if (0 == strcmp(pp->serial, pp2->serial)) {
 				if (store_path(pgp->paths, pp2))
-					goto out2;
+					goto out1;
 
 				bitmap[j] = 1;
 			}
@@ -254,7 +254,7 @@ int one_path_per_group(struct multipath *mp)
 			goto out1;
 
 		if (store_path(pgp->paths, pp))
-			goto out1;
+			goto out;
 	}
 	return 0;
 out1:
@@ -358,7 +358,7 @@ int group_by_prio(struct multipath *mp)
 		vector_foreach_slot(pathvec, pp, i) {
 			if (pp->priority == prio) {
 				if (store_path(pgp->paths, pp))
-					goto out2;
+					goto out1;
 
 				vector_del_slot(pathvec, i);
 				i--;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
