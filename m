Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B47FEBF
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:40:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DEA130A5412;
	Fri,  2 Aug 2019 16:40:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2020A60BF4;
	Fri,  2 Aug 2019 16:40:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DA9E149E0;
	Fri,  2 Aug 2019 16:40:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GXtqw001311 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:33:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA200600F8; Fri,  2 Aug 2019 16:33:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 940E9600C8;
	Fri,  2 Aug 2019 16:33:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GXsh1031814; 
	Fri, 2 Aug 2019 11:33:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GXrBg031813;
	Fri, 2 Aug 2019 11:33:53 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:32 -0500
Message-Id: <1564763622-31752-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 06/16] libmultipath: remove store_pathgroup
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 02 Aug 2019 16:40:10 +0000 (UTC)

store_pathgroup() is only called by add_pathgroup(), and doesn't need to
exist as a seperate function.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/structs.c | 16 +++-------------
 libmultipath/structs.h |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index fee899bd..bf7fdd73 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -318,23 +318,13 @@ store_path (vector pathvec, struct path * pp)
 	return 0;
 }
 
-int
-store_pathgroup (vector pgvec, struct pathgroup * pgp)
+int add_pathgroup(struct multipath *mpp, struct pathgroup *pgp)
 {
-	if (!vector_alloc_slot(pgvec))
+	if (!vector_alloc_slot(mpp->pg))
 		return 1;
 
-	vector_set_slot(pgvec, pgp);
-
-	return 0;
-}
-
-int add_pathgroup(struct multipath *mpp, struct pathgroup *pgp)
-{
-	int ret = store_pathgroup(mpp->pg, pgp);
+	vector_set_slot(mpp->pg, pgp);
 
-	if (ret)
-		return ret;
 	pgp->mpp = mpp;
 	return 0;
 }
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 1a3d827b..893074eb 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -445,7 +445,6 @@ int store_adaptergroup(vector adapters, struct adapter_group *agp);
 int store_hostgroup(vector hostgroupvec, struct host_group *hgp);
 
 int store_path (vector pathvec, struct path * pp);
-int store_pathgroup (vector pgvec, struct pathgroup * pgp);
 int add_pathgroup(struct multipath*, struct pathgroup *);
 
 struct multipath * find_mp_by_alias (const struct _vector *mp, const char *alias);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
