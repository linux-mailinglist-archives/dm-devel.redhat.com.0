Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A39A237B271
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 01:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620775443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w2GTy1HT9Wx7crqbtcVr1WhXbAxkYoN4lzVdBiL4b50=;
	b=VQ7qP6XCVCFL9+fAXVsbA00wWNQgLHPgH6UOP2Vq0JOvA/vp1ULuh73iuSI6/mowEGhImu
	Ke2cDuAfgOyciz3nAB30Tk2J8W3HtzPRDH7Hy5HWxpZ0bybz7ilDM9wr6tPwf/gEUk4I2A
	RsstF1qQT9Od2mfB3Uth0d5qQbBjg6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-E0idpu-GP36cBWkPHQ4kjg-1; Tue, 11 May 2021 19:22:44 -0400
X-MC-Unique: E0idpu-GP36cBWkPHQ4kjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BBE06D4E6;
	Tue, 11 May 2021 23:22:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65235D9E3;
	Tue, 11 May 2021 23:22:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF94E18005B6;
	Tue, 11 May 2021 23:22:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BNMBIM013332 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 19:22:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62A1C51150; Tue, 11 May 2021 23:22:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8C09CA0;
	Tue, 11 May 2021 23:22:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14BNM6TG024026; 
	Tue, 11 May 2021 18:22:06 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14BNM6io024025;
	Tue, 11 May 2021 18:22:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 May 2021 18:22:00 -0500
Message-Id: <1620775324-23984-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1620775324-23984-1-git-send-email-bmarzins@redhat.com>
References: <1620775324-23984-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/5] multipathd: don't fail to remove path once
	the map is removed
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
 libmultipath/structs_vec.c |  3 +--
 multipathd/main.c          | 13 ++++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index d242c06b..432c0c63 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -45,8 +45,7 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
 
 				/*
 				 * Avoid adding removed paths to the map again
-				 * when we reload it. Such paths may exist if
-				 * domap fails in ev_remove_path().
+				 * when we reload it.
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

