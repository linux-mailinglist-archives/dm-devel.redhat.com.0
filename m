Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 74D8A219E55
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-rBqcIlg0N2Gdi5jQuOFSpw-1; Thu, 09 Jul 2020 06:52:49 -0400
X-MC-Unique: rBqcIlg0N2Gdi5jQuOFSpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E2B11083E8F;
	Thu,  9 Jul 2020 10:52:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5A96111F;
	Thu,  9 Jul 2020 10:52:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A55F393F85;
	Thu,  9 Jul 2020 10:52:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqMaM000703 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 694855F248; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 651D64C821
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C231856A57
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-125-O1xE9vBhNjWO2glew_Gd7g-1;
	Thu, 09 Jul 2020 06:52:17 -0400
X-MC-Unique: O1xE9vBhNjWO2glew_Gd7g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F0CE4AEFA;
	Thu,  9 Jul 2020 10:52:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:40 +0200
Message-Id: <20200709105145.9211-17-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqMaM000703
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 69/74] libmultipath: disassemble_map(): get rid
	of "is_daemon" argument
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The reason for the is_daemon parameter in disassemble_map() lies
deep in multipath-tools' past, in b96dead ("[multipathd] remove the
retry login in uev_remove_path()"): By not adding paths from
disassembled maps to the pathvec, we avoided to re-add removed paths on
future map reloads (logic in update_mpp_paths()). As we can handle this with
INIT_REMOVED now, we don't need to distinguish daemon and non-daemon
mode any more. This fixes a memory leak, because only paths which are in
pathvec will be freed on program exit.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c | 2 +-
 libmultipath/dmparser.c         | 6 ++----
 libmultipath/dmparser.h         | 2 +-
 libmultipath/structs_vec.c      | 9 ++++-----
 libmultipath/structs_vec.h      | 6 ++----
 multipath/main.c                | 4 ++--
 multipathd/main.c               | 8 ++++----
 7 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 3da7a6c..cb3182f 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -391,7 +391,7 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
 		condlog(3, "params = %s", params);
 		dm_get_status(mpp->alias, status);
 		condlog(3, "status = %s", status);
-		disassemble_map (pathvec, params, mpp, 0);
+		disassemble_map (pathvec, params, mpp);
 
 		/*
 		 * disassemble_map() can add new paths to pathvec.
diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index e6f2cbe..233a1b8 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -122,8 +122,7 @@ err:
 
 #undef APPEND
 
-int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
-		    int is_daemon)
+int disassemble_map(vector pathvec, char *params, struct multipath *mpp)
 {
 	char * word;
 	char * p;
@@ -311,8 +310,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 					strlcpy(pp->wwid, mpp->wwid,
 						WWID_SIZE);
 				}
-				/* Only call this in multipath client mode */
-				if (!is_daemon && store_path(pathvec, pp))
+				if (store_path(pathvec, pp))
 					goto out1;
 			} else {
 				if (!strlen(pp->wwid) &&
diff --git a/libmultipath/dmparser.h b/libmultipath/dmparser.h
index e1badb0..1b45df0 100644
--- a/libmultipath/dmparser.h
+++ b/libmultipath/dmparser.h
@@ -1,3 +1,3 @@
 int assemble_map (struct multipath *, char *, int);
-int disassemble_map (vector, char *, struct multipath *, int);
+int disassemble_map (vector, char *, struct multipath *);
 int disassemble_status (char *, struct multipath *);
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 8651b98..73a7221 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -370,7 +370,7 @@ extract_hwe_from_path(struct multipath * mpp)
 }
 
 int
-update_multipath_table (struct multipath *mpp, vector pathvec, int is_daemon)
+update_multipath_table (struct multipath *mpp, vector pathvec)
 {
 	int r = DMP_ERR;
 	char params[PARAMS_SIZE] = {0};
@@ -384,7 +384,7 @@ update_multipath_table (struct multipath *mpp, vector pathvec, int is_daemon)
 		return r;
 	}
 
-	if (disassemble_map(pathvec, params, mpp, is_daemon)) {
+	if (disassemble_map(pathvec, params, mpp)) {
 		condlog(3, "%s: cannot disassemble map", mpp->alias);
 		return DMP_ERR;
 	}
@@ -474,7 +474,7 @@ void sync_paths(struct multipath *mpp, vector pathvec)
 }
 
 int
-update_multipath_strings(struct multipath *mpp, vector pathvec, int is_daemon)
+update_multipath_strings(struct multipath *mpp, vector pathvec)
 {
 	struct pathgroup *pgp;
 	int i, r = DMP_ERR;
@@ -489,10 +489,9 @@ update_multipath_strings(struct multipath *mpp, vector pathvec, int is_daemon)
 	free_pgvec(mpp->pg, KEEP_PATHS);
 	mpp->pg = NULL;
 
-	r = update_multipath_table(mpp, pathvec, is_daemon);
+	r = update_multipath_table(mpp, pathvec);
 	if (r != DMP_OK)
 		return r;
-
 	sync_paths(mpp, pathvec);
 
 	r = update_multipath_status(mpp);
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index 4c28148..32cad60 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -24,8 +24,7 @@ int verify_paths(struct multipath *mpp);
 bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 			    int pathinfo_flags);
 int update_mpp_paths(struct multipath * mpp, vector pathvec);
-int update_multipath_strings (struct multipath *mpp, vector pathvec,
-			      int is_daemon);
+int update_multipath_strings (struct multipath *mpp, vector pathvec);
 void extract_hwe_from_path(struct multipath * mpp);
 
 #define PURGE_VEC 1
@@ -41,8 +40,7 @@ struct multipath * add_map_with_path (struct vectors * vecs,
 				struct path * pp, int add_vec);
 void update_queue_mode_del_path(struct multipath *mpp);
 void update_queue_mode_add_path(struct multipath *mpp);
-int update_multipath_table (struct multipath *mpp, vector pathvec,
-			    int is_daemon);
+int update_multipath_table (struct multipath *mpp, vector pathvec);
 int update_multipath_status (struct multipath *mpp);
 vector get_used_hwes(const struct _vector *pathvec);
 
diff --git a/multipath/main.c b/multipath/main.c
index cfb85dc..8a2a6f7 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -272,7 +272,7 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 		dm_get_status(mpp->alias, status);
 		condlog(3, "status = %s", status);
 
-		disassemble_map(pathvec, params, mpp, 0);
+		disassemble_map(pathvec, params, mpp);
 
 		/*
 		 * disassemble_map() can add new paths to pathvec.
@@ -352,7 +352,7 @@ static int check_usable_paths(struct config *conf,
 
 	dm_get_map(mpp->alias, &mpp->size, params);
 	dm_get_status(mpp->alias, status);
-	disassemble_map(pathvec, params, mpp, 0);
+	disassemble_map(pathvec, params, mpp);
 	disassemble_status(status, mpp);
 
 	vector_foreach_slot (mpp->pg, pg, i) {
diff --git a/multipathd/main.c b/multipathd/main.c
index 0cd0ee6..66ca4e3 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -409,7 +409,7 @@ int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 		goto out;
 	}
 
-	if (update_multipath_strings(mpp, vecs->pathvec, 1) != DMP_OK) {
+	if (update_multipath_strings(mpp, vecs->pathvec) != DMP_OK) {
 		condlog(0, "%s: failed to setup multipath", mpp->alias);
 		goto out;
 	}
@@ -551,7 +551,7 @@ add_map_without_path (struct vectors *vecs, const char *alias)
 	mpp->mpe = find_mpe(conf->mptable, mpp->wwid);
 	put_multipath_config(conf);
 
-	if (update_multipath_table(mpp, vecs->pathvec, 1) != DMP_OK)
+	if (update_multipath_table(mpp, vecs->pathvec) != DMP_OK)
 		goto out;
 	if (update_multipath_status(mpp) != DMP_OK)
 		goto out;
@@ -1410,7 +1410,7 @@ map_discovery (struct vectors * vecs)
 		return 1;
 
 	vector_foreach_slot (vecs->mpvec, mpp, i)
-		if (update_multipath_table(mpp, vecs->pathvec, 1) != DMP_OK ||
+		if (update_multipath_table(mpp, vecs->pathvec) != DMP_OK ||
 		    update_multipath_status(mpp) != DMP_OK) {
 			remove_map(mpp, vecs, 1);
 			i--;
@@ -2153,7 +2153,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	/*
 	 * Synchronize with kernel state
 	 */
-	ret = update_multipath_strings(pp->mpp, vecs->pathvec, 1);
+	ret = update_multipath_strings(pp->mpp, vecs->pathvec);
 	if (ret != DMP_OK) {
 		if (ret == DMP_NOT_FOUND) {
 			/* multipath device missing. Likely removed */
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

