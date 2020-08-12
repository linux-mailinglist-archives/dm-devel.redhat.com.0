Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2943A2428C1
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:35:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-qDLclpDkOoaUaLT9R_5Ggg-1; Wed, 12 Aug 2020 07:35:48 -0400
X-MC-Unique: qDLclpDkOoaUaLT9R_5Ggg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AED08B7D03;
	Wed, 12 Aug 2020 11:35:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1832DE77;
	Wed, 12 Aug 2020 11:35:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1264181A06E;
	Wed, 12 Aug 2020 11:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZBs2028694 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D5FD20316D9; Wed, 12 Aug 2020 11:35:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3901320316D5
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF8B1033644
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-408-2WnauWMJOUyQVKV40tsG7A-1;
	Wed, 12 Aug 2020 07:35:05 -0400
X-MC-Unique: 2WnauWMJOUyQVKV40tsG7A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 88811B6F8;
	Wed, 12 Aug 2020 11:35:25 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:34:28 +0200
Message-Id: <20200812113429.26314-2-mwilck@suse.com>
In-Reply-To: <20200812113429.26314-1-mwilck@suse.com>
References: <20200812113429.26314-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZBs2028694
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 44/54] libmultipath: adopt_paths(): don't bail
	out on single path failure
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If pathinfo fails for one path to be adopted, we currently
fail the entire function. This may cause ev_add_path() for a valid
path to fail because some other path is broken. Fix it by just
skipping paths that don't look healthy.

adopt_paths() may now succeed even if some paths couldn't be
added (e.g. because of pathinfo() failure). If this happens while we are
trying to add a specific path, we need to check after successful call to
adopt_paths() if that specific path had been actually added, and fail in the
caller otherwise.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 17 +++++++++++------
 multipathd/main.c          |  3 ++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index b1f83c6..fb225f1 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -75,16 +75,20 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
 			if (!mpp->paths && !(mpp->paths = vector_alloc()))
 				return 1;
 
-			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
-			    store_path(mpp->paths, pp))
-					return 1;
 			conf = get_multipath_config();
 			pthread_cleanup_push(put_multipath_config, conf);
 			ret = pathinfo(pp, conf,
 				       DI_PRIO | DI_CHECKER);
 			pthread_cleanup_pop(1);
-			if (ret)
-				return 1;
+			if (ret) {
+				condlog(3, "%s: pathinfo failed for %s",
+					__func__, pp->dev);
+				continue;
+			}
+
+			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
+			    store_path(mpp->paths, pp))
+					return 1;
 		}
 	}
 	return 0;
@@ -456,7 +460,8 @@ struct multipath *add_map_with_path(struct vectors *vecs, struct path *pp,
 		goto out;
 	mpp->size = pp->size;
 
-	if (adopt_paths(vecs->pathvec, mpp))
+	if (adopt_paths(vecs->pathvec, mpp) ||
+	    find_slot(vecs->pathvec, pp) == -1)
 		goto out;
 
 	if (add_vec) {
diff --git a/multipathd/main.c b/multipathd/main.c
index 61929a7..5902e7c 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -956,7 +956,8 @@ rescan:
 	if (mpp) {
 		condlog(4,"%s: adopting all paths for path %s",
 			mpp->alias, pp->dev);
-		if (adopt_paths(vecs->pathvec, mpp))
+		if (adopt_paths(vecs->pathvec, mpp) ||
+		    find_slot(vecs->pathvec, pp) == -1)
 			goto fail; /* leave path added to pathvec */
 
 		verify_paths(mpp, vecs);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

