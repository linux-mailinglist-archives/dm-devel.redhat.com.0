Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 262413FF6D3
	for <lists+dm-devel@lfdr.de>; Fri,  3 Sep 2021 00:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630620302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FwV47wkzHoi7sWw0vBGdXgpU7dQX/zl2JmXWThXd7QA=;
	b=djFuKhYP1/lKxzC+bF/JIO2L2XxN/vU69U9jFDPUqaA3oHeYpz5VWPBdDHp89HfrBlduQc
	7vm/0RLcw5MujYvtJdR7wU7h7CXRdNVWGj7pDRM7f1x9LRSWpLDxoi8M0luNwwLpnWOewB
	q7+N7FT9oLWchkPE1YlXYL0Gn8eebZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-SO8-mokNMJeszuY6BTwPHQ-1; Thu, 02 Sep 2021 18:04:26 -0400
X-MC-Unique: SO8-mokNMJeszuY6BTwPHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B259E800FF3;
	Thu,  2 Sep 2021 22:04:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90CD45D9FC;
	Thu,  2 Sep 2021 22:04:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451C344A5A;
	Thu,  2 Sep 2021 22:04:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182Lw1Ot013380 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 17:58:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E610102AE41; Thu,  2 Sep 2021 21:58:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 183AA10074F1;
	Thu,  2 Sep 2021 21:57:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 182Lvu0T012307; 
	Thu, 2 Sep 2021 16:57:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 182Lvull012306;
	Thu, 2 Sep 2021 16:57:56 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Sep 2021 16:57:47 -0500
Message-Id: <1630619869-12251-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
References: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/6] libmultipath: remove unneeded code in
	coalesce_paths
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The code at the end of coalesce_paths() removes a multipath device that
was just created/reloaded, if none of its path devices have pp->dev set.
This code is very old, and no longer has any actual effect. Multipath
devices no longer get placed in pathvec without having pp->dev set. Even
if they could, there's no point in creating/reloading the device and
then immediately removing it.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c | 46 ----------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 2f417914..3f241c5c 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1060,28 +1060,6 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
 	return DOMAP_FAIL;
 }
 
-static int
-deadmap (struct multipath * mpp)
-{
-	int i, j;
-	struct pathgroup * pgp;
-	struct path * pp;
-
-	if (!mpp->pg)
-		return 1;
-
-	vector_foreach_slot (mpp->pg, pgp, i) {
-		if (!pgp->paths)
-			continue;
-
-		vector_foreach_slot (pgp->paths, pp, j)
-			if (strlen(pp->dev))
-				return 0; /* alive */
-	}
-
-	return 1; /* dead */
-}
-
 extern int
 check_daemon(void)
 {
@@ -1313,30 +1291,6 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 			remove_map(mpp, vecs->pathvec, vecs->mpvec,
 				   KEEP_VEC);
 	}
-	/*
-	 * Flush maps with only dead paths (ie not in sysfs)
-	 * Keep maps with only failed paths
-	 */
-	if (mpvec) {
-		vector_foreach_slot (newmp, mpp, i) {
-			char alias[WWID_SIZE];
-
-			if (!deadmap(mpp))
-				continue;
-
-			strlcpy(alias, mpp->alias, WWID_SIZE);
-
-			vector_del_slot(newmp, i);
-			i--;
-			remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
-
-			if (dm_flush_map(alias))
-				condlog(2, "%s: remove failed (dead)",
-					alias);
-			else
-				condlog(2, "%s: remove (dead)", alias);
-		}
-	}
 	ret = CP_OK;
 out:
 	free(size_mismatch_seen);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

