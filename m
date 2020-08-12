Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8EB2428C5
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-RZwboXPfMOygE3fYtaY6iQ-1; Wed, 12 Aug 2020 07:36:01 -0400
X-MC-Unique: RZwboXPfMOygE3fYtaY6iQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1430100A8E1;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A5BD600C5;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1469F181A06E;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZg8k028780 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 036A32156A3B; Wed, 12 Aug 2020 11:35:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F186F2156A3A
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DD5080096B
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-130-rVy7PLMROJ-U03T4ylB9cQ-1;
	Wed, 12 Aug 2020 07:35:36 -0400
X-MC-Unique: rVy7PLMROJ-U03T4ylB9cQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B7F7FB705;
	Wed, 12 Aug 2020 11:35:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:05 +0200
Message-Id: <20200812113511.26469-3-mwilck@suse.com>
In-Reply-To: <20200812113511.26469-1-mwilck@suse.com>
References: <20200812113511.26469-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZg8k028780
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 58/74] libmultipath: verify_paths(): don't
	delete paths from pathvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If we encounter a non-existing device verify_paths(), just set
it to INIT_REMOVED state. Actual path deletion is postponed until
we don't see that path in the kernel map any more.

This allows us to get rid of the "pathvec" argument to this function.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c   |  2 +-
 libmultipath/structs_vec.c | 16 +++++++++-------
 libmultipath/structs_vec.h |  2 +-
 multipathd/main.c          |  4 ++--
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 5ecfae8..cc54818 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1196,7 +1196,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 				set_bit_in_bitfield(i, size_mismatch_seen);
 			}
 		}
-		verify_paths(mpp, vecs);
+		verify_paths(mpp);
 
 		params[0] = '\0';
 		if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index ee1004d..e0a84d4 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -499,11 +499,11 @@ out:
 	return NULL;
 }
 
-int verify_paths(struct multipath *mpp, struct vectors *vecs)
+int verify_paths(struct multipath *mpp)
 {
 	struct path * pp;
 	int count = 0;
-	int i, j;
+	int i;
 
 	if (!mpp)
 		return 0;
@@ -518,7 +518,7 @@ int verify_paths(struct multipath *mpp, struct vectors *vecs)
 				condlog(1, "%s: removing valid path %s in state %d",
 					mpp->alias, pp->dev, pp->state);
 			} else {
-				condlog(3, "%s: failed to access path %s",
+				condlog(2, "%s: failed to access path %s",
 					mpp->alias, pp->dev);
 			}
 			count++;
@@ -531,10 +531,12 @@ int verify_paths(struct multipath *mpp, struct vectors *vecs)
 			 */
 			if (mpp->hwe == pp->hwe)
 				mpp->hwe = NULL;
-			if ((j = find_slot(vecs->pathvec,
-					   (void *)pp)) != -1)
-				vector_del_slot(vecs->pathvec, j);
-			free_path(pp);
+			/*
+			 * Don't delete path from pathvec yet. We'll do this
+			 * after the path has been removed from the map, in
+			 * sync_paths().
+			 */
+			set_path_removed(pp);
 		} else {
 			condlog(4, "%s: verified path %s dev_t %s",
 				mpp->alias, pp->dev, pp->dev_t);
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index 7f6dece..d7dfe32 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -20,7 +20,7 @@ void orphan_paths(vector pathvec, struct multipath *mpp,
 void orphan_path (struct path * pp, const char *reason);
 void set_path_removed(struct path *pp);
 
-int verify_paths(struct multipath * mpp, struct vectors * vecs);
+int verify_paths(struct multipath *mpp);
 int update_mpp_paths(struct multipath * mpp, vector pathvec);
 int update_multipath_strings (struct multipath *mpp, vector pathvec,
 			      int is_daemon);
diff --git a/multipathd/main.c b/multipathd/main.c
index 2c5b982..0209db4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -492,7 +492,7 @@ retry:
 		retries = -1;
 		goto fail;
 	}
-	verify_paths(mpp, vecs);
+	verify_paths(mpp);
 	mpp->action = ACT_RELOAD;
 
 	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
@@ -960,7 +960,7 @@ rescan:
 		    find_slot(vecs->pathvec, pp) == -1)
 			goto fail; /* leave path added to pathvec */
 
-		verify_paths(mpp, vecs);
+		verify_paths(mpp);
 		mpp->action = ACT_RELOAD;
 	} else {
 		if (!should_multipath(pp, vecs->pathvec, vecs->mpvec)) {
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

