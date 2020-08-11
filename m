Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C30FD24223F
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mPjInyvx7prtkRntqz3wEuTz54XDUOgV8Y02mn+ezAc=;
	b=IIgK3x5Ht12y6M/cOCPfDmIcvmuDy0XJs+JohhuUFSTqxeNx+ypG3LAFp42byskgvea1eR
	QJgSl+XD4Cplh8+APidYO/54vIS47WxIIabYFw4lsTFC9Cl+/9bNgCCyeB+vn8kffcsuf0
	xwI0SFh7D2nn3xkHRPT6aax3vgBRtPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-9I_nWFtCMwaHrITW6E7Rcg-1; Tue, 11 Aug 2020 18:01:03 -0400
X-MC-Unique: 9I_nWFtCMwaHrITW6E7Rcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CE080048B;
	Tue, 11 Aug 2020 22:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 429B087D9D;
	Tue, 11 Aug 2020 22:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E93FF1809554;
	Tue, 11 Aug 2020 22:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwqT9009146 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72D961A921; Tue, 11 Aug 2020 21:58:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D1719931;
	Tue, 11 Aug 2020 21:58:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwmqF015847; 
	Tue, 11 Aug 2020 16:58:48 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwlXU015846;
	Tue, 11 Aug 2020 16:58:47 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:38 -0500
Message-Id: <1597183123-15797-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/8] libmultipath: refactor path counting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pathcountgr() is never used except by pathcount(), and neither is the
special case for PATH_WILD. Simplify this and change it into a helper
function that is called by pathcount, and will be used again in a future
patch. Leave count_active_paths alone for the sake of compiler
optimization.

Also use count_active_paths() in mpath_persist.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c |  4 ++--
 libmultipath/structs.c          | 31 +++++++++++++++++--------------
 libmultipath/structs.h          |  1 -
 3 files changed, 19 insertions(+), 17 deletions(-)

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
index 2dd378c4..90874559 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -455,30 +455,33 @@ find_path_by_devt (const struct _vector *pathvec, const char * dev_t)
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

