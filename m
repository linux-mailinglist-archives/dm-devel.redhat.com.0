Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF8922F8F9
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 21:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595877902;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pxqADv1uKpu69/CWkc9dZV3jQWNgT753f7QhZG6w8qo=;
	b=JoQ1k58J0eMYX/GGa0nG3IcJIgQpfo3dIGNYeQNB4iPJlMJtie5B2OdP1jdWe3AuycJDtq
	ksIwMkxYjGZ4dDKobM1kxMvspO0UqOxsAH1mwGqHev4xnb3GnOFe9eldz780QsEW3rsxSa
	h6kqXI1dnPV4zWKsk14bSdIirLfR//Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-4C2_yprsPP-x0AgXyoC1VA-1; Mon, 27 Jul 2020 15:24:59 -0400
X-MC-Unique: 4C2_yprsPP-x0AgXyoC1VA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9CE359;
	Mon, 27 Jul 2020 19:24:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40AF08FA56;
	Mon, 27 Jul 2020 19:24:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B45D1A3594;
	Mon, 27 Jul 2020 19:24:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJOZp3024683 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:24:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D880A8FF9F; Mon, 27 Jul 2020 19:24:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B35AD90E69;
	Mon, 27 Jul 2020 19:24:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RJOYlj005643; 
	Mon, 27 Jul 2020 14:24:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RJOX9T005642;
	Mon, 27 Jul 2020 14:24:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 27 Jul 2020 14:24:25 -0500
Message-Id: <1595877868-5595-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/6] libmultipath: remove code duplication in
	path counting
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pathcountgr() is never used except by pathcount(), and neither is the
special case for PATH_WILD. Simplify this and make one function that is
used by both pathcount() and count_active_paths(). This will be used
again in a future patch.

Also use count_active_paths() in mpath_persist.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c |  4 +--
 libmultipath/structs.c          | 47 +++++++++++++--------------------
 libmultipath/structs.h          |  1 -
 3 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 3da7a6cf..a132f4e9 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -436,7 +436,7 @@ int mpath_prout_reg(struct multipath *mpp,int rq_servact, int rq_scope,
 
 	all_tg_pt = (mpp->all_tg_pt == ALL_TG_PT_ON ||
 		     paramp->sa_flags & MPATH_F_ALL_TG_PT_MASK);
-	active_pathcount = pathcount(mpp, PATH_UP) + pathcount(mpp, PATH_GHOST);
+	active_pathcount = count_active_paths(mpp);
 
 	if (active_pathcount == 0) {
 		condlog (0, "%s: no path available", mpp->wwid);
@@ -648,7 +648,7 @@ int mpath_prout_rel(struct multipath *mpp,int rq_servact, int rq_scope,
 	if (!mpp)
 		return MPATH_PR_DMMP_ERROR;
 
-	active_pathcount = pathcount (mpp, PATH_UP) + pathcount (mpp, PATH_GHOST);
+	active_pathcount = count_active_paths(mpp);
 
 	struct threadinfo thread[active_pathcount];
 	memset(thread, 0, sizeof(thread));
diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index 2dd378c4..3eac3d61 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -455,49 +455,40 @@ find_path_by_devt (const struct _vector *pathvec, const char * dev_t)
 	return NULL;
 }
 
-int pathcountgr(const struct pathgroup *pgp, int state)
+static int do_pathcount(const struct multipath *mpp, const int *states,
+			unsigned int nr_states)
 {
+	struct pathgroup *pgp;
 	struct path *pp;
 	int count = 0;
-	int i;
+	unsigned int i, j, k;
 
-	vector_foreach_slot (pgp->paths, pp, i)
-		if ((pp->state == state) || (state == PATH_WILD))
-			count++;
+	if (!mpp->pg || !nr_states)
+		return count;
 
+	vector_foreach_slot (mpp->pg, pgp, i) {
+		vector_foreach_slot (pgp->paths, pp, j) {
+			for (k = 0; k < nr_states; k++) {
+				if (pp->state == states[k]) {
+					count++;
+					break;
+				}
+			}
+		}
+	}
 	return count;
 }
 
 int pathcount(const struct multipath *mpp, int state)
 {
-	struct pathgroup *pgp;
-	int count = 0;
-	int i;
-
-	if (mpp->pg) {
-		vector_foreach_slot (mpp->pg, pgp, i)
-			count += pathcountgr(pgp, state);
-	}
-	return count;
+	return do_pathcount(mpp, &state, 1);
 }
 
 int count_active_paths(const struct multipath *mpp)
 {
-	struct pathgroup *pgp;
-	struct path *pp;
-	int count = 0;
-	int i, j;
-
-	if (!mpp->pg)
-		return 0;
+	int states[] = {PATH_UP, PATH_GHOST};
 
-	vector_foreach_slot (mpp->pg, pgp, i) {
-		vector_foreach_slot (pgp->paths, pp, j) {
-			if (pp->state == PATH_UP || pp->state == PATH_GHOST)
-				count++;
-		}
-	}
-	return count;
+	return do_pathcount(mpp, states, 2);
 }
 
 int pathcmp(const struct pathgroup *pgp, const struct pathgroup *cpgp)
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index d69bc2e9..0c03e711 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -446,7 +446,6 @@ struct path * find_path_by_devt (const struct _vector *pathvec, const char *devt
 struct path * find_path_by_dev (const struct _vector *pathvec, const char *dev);
 struct path * first_path (const struct multipath *mpp);
 
-int pathcountgr (const struct pathgroup *, int);
 int pathcount (const struct multipath *, int);
 int count_active_paths(const struct multipath *);
 int pathcmp (const struct pathgroup *, const struct pathgroup *);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

