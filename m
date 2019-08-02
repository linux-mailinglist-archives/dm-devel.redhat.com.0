Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C907FEB3
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:38:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25324C0272FA;
	Fri,  2 Aug 2019 16:38:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C7E5D97C;
	Fri,  2 Aug 2019 16:38:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BBFD149E0;
	Fri,  2 Aug 2019 16:38:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GXxNG001346 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:33:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C57A66062B; Fri,  2 Aug 2019 16:33:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3A4608C2;
	Fri,  2 Aug 2019 16:33:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GXtqB031818; 
	Fri, 2 Aug 2019 11:33:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GXtDN031817;
	Fri, 2 Aug 2019 11:33:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:33 -0500
Message-Id: <1564763622-31752-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 07/16] libmultipath: make one_group allocate a
	new vector
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 02 Aug 2019 16:38:50 +0000 (UTC)

All the pgpolicy functions besides one_group() allocate a new vector for
the pathgroups. If one_group() works the same, it is easier to factor
out the common code.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/pgpolicies.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index d447c46e..1af42f52 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -267,24 +267,24 @@ out:
 
 int one_group(struct multipath *mp)	/* aka multibus */
 {
+	int i;
+	struct path * pp;
 	struct pathgroup * pgp;
 
-	if (VECTOR_SIZE(mp->paths) > 0) {
-		pgp = alloc_pathgroup();
+	pgp = alloc_pathgroup();
 
-		if (!pgp)
-			goto out;
+	if (!pgp)
+		goto out;
 
-		vector_free(pgp->paths);
+	if (add_pathgroup(mp, pgp))
+		goto out1;
 
-		if (add_pathgroup(mp, pgp))
-			goto out1;
+	for (i = 0; i < VECTOR_SIZE(mp->paths); i++) {
+		pp = VECTOR_SLOT(mp->paths, i);
 
-		pgp->paths = mp->paths;
-		/* Do this to avoid freeing vector in group_paths */
-		mp->paths = NULL;
+		if (store_path(pgp->paths, pp))
+			goto out;
 	}
-
 	return 0;
 out1:
 	free_pathgroup(pgp, KEEP_PATHS);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
