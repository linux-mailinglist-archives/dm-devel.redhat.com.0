Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8692A37FC70
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 19:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620926638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uOrPk/oYiUIlLP9YdUnHlDOgIi2PmsfC+W+4IsV8KHc=;
	b=VBdkXbK2ZNbRTDGqdYrBSi1H8WyHkQHdb2xGy+8AybWb/7WZcyQUI8vi5m7/nb+GDFng10
	YNduIINK4Hb46DiW5y2ohh2qGcNpVPDuGRMIn25bZ19zyCMYUftZ4SXRMPtQZScPzgWAqF
	ab1vZBZeIeACXCPdHgF1v9fQ5pvUFmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-n3nAMUf3MUKiA6wxqqyV8g-1; Thu, 13 May 2021 13:23:56 -0400
X-MC-Unique: n3nAMUf3MUKiA6wxqqyV8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A08801AF7;
	Thu, 13 May 2021 17:23:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 749A11B49D;
	Thu, 13 May 2021 17:23:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1714055343;
	Thu, 13 May 2021 17:23:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DHNMU2005629 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 13:23:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E22CB5D9DC; Thu, 13 May 2021 17:23:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E02F5D9CC;
	Thu, 13 May 2021 17:23:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DHNHbs012071; 
	Thu, 13 May 2021 12:23:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DHNHiW012070;
	Thu, 13 May 2021 12:23:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 13 May 2021 12:23:10 -0500
Message-Id: <1620926595-12029-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
References: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/6] multipathd: don't fail to remove path
	once the map is removed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In ev_remove_path(), if update_mpp_paths() fails, we delete the entire
map. However, since update_mpp_paths() happens before we call
set_path_removed(), pp->initialized isn't set to INIT_REMOVED, so
remove_map_and_stop_waiter() doesn't remove the path when in removes the
map.  But with the map removed, there's nothing to keep us from removing
the path.

Call set_path_removed() before update_mpp_paths() to avoid the odd case
of ev_remove_path() removing the map but not the path.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/structs_vec.c |  4 ++--
 multipathd/main.c          | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index d242c06b..75390198 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -45,8 +45,8 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
 
 				/*
 				 * Avoid adding removed paths to the map again
-				 * when we reload it. Such paths may exist if
-				 * domap fails in ev_remove_path().
+				 * when we reload it. Such paths may exist in
+				 * ev_remove_paths() or if it returns failure.
 				 */
 				pp1 = find_path_by_devt(pathvec, pp->dev_t);
 				if (pp1 && pp->initialized != INIT_REMOVED &&
diff --git a/multipathd/main.c b/multipathd/main.c
index 102946bf..449ce384 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1199,6 +1199,13 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 	 * avoid referring to the map of an orphaned path
 	 */
 	if ((mpp = pp->mpp)) {
+		/*
+		 * Mark the path as removed. In case of success, we
+		 * will delete it for good. Otherwise, it will be deleted
+		 * later, unless all attempts to reload this map fail.
+		 */
+		set_path_removed(pp);
+
 		/*
 		 * transform the mp->pg vector of vectors of paths
 		 * into a mp->params string to feed the device-mapper
@@ -1210,13 +1217,9 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 		}
 
 		/*
-		 * Mark the path as removed. In case of success, we
-		 * will delete it for good. Otherwise, it will be deleted
-		 * later, unless all attempts to reload this map fail.
-		 * Note: we have to explicitly remove pp from mpp->paths,
+		 * we have to explicitly remove pp from mpp->paths,
 		 * update_mpp_paths() doesn't do that.
 		 */
-		set_path_removed(pp);
 		i = find_slot(mpp->paths, pp);
 		if (i != -1)
 			vector_del_slot(mpp->paths, i);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

