Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A05833C9D57
	for <lists+dm-devel@lfdr.de>; Thu, 15 Jul 2021 12:55:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-raMCSHaAMsauc3bSHiMWnA-1; Thu, 15 Jul 2021 06:55:42 -0400
X-MC-Unique: raMCSHaAMsauc3bSHiMWnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F13100C61F;
	Thu, 15 Jul 2021 10:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 396FB179E6;
	Thu, 15 Jul 2021 10:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8514D4EA2A;
	Thu, 15 Jul 2021 10:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16FAqihG015552 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Jul 2021 06:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CC382028759; Thu, 15 Jul 2021 10:52:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C98202874F
	for <dm-devel@redhat.com>; Thu, 15 Jul 2021 10:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD84980015A
	for <dm-devel@redhat.com>; Thu, 15 Jul 2021 10:52:41 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-YuD4UJIIPuWiXRp1ZJWbPQ-1; Thu, 15 Jul 2021 06:52:39 -0400
X-MC-Unique: YuD4UJIIPuWiXRp1ZJWbPQ-1
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1434D1FDED;
	Thu, 15 Jul 2021 10:52:38 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D503E13AB7;
	Thu, 15 Jul 2021 10:52:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA id YAByMnUT8GDQIAAAGKfGzw
	(envelope-from <mwilck@suse.com>); Thu, 15 Jul 2021 10:52:37 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 15 Jul 2021 12:52:17 +0200
Message-Id: <20210715105223.30463-4-mwilck@suse.com>
In-Reply-To: <20210715105223.30463-1-mwilck@suse.com>
References: <20210715105223.30463-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16FAqihG015552
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/9] libmultipath: variable-size parameters in
	assemble_map()
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

Instead of using fixed PARAMS_SIZE-sized arrays for parameters, use
dynamically allocated memory.

The library version needs to be bumped, because setup_map() argument
list has changed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c          | 18 ++++++------
 libmultipath/configure.h          |  3 +-
 libmultipath/dmparser.c           | 47 ++++++++++---------------------
 libmultipath/dmparser.h           |  2 +-
 libmultipath/libmultipath.version |  5 +++-
 libmultipath/structs.h            |  1 -
 libmultipath/util.c               |  5 ++++
 libmultipath/util.h               |  1 +
 multipathd/cli_handlers.c         |  4 +--
 multipathd/main.c                 | 20 +++++++------
 10 files changed, 50 insertions(+), 56 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index a6ae335..1227864 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -292,8 +292,7 @@ static int wait_for_pending_paths(struct multipath *mpp,
 	return n_pending;
 }
 
-int setup_map(struct multipath *mpp, char *params, int params_size,
-	      struct vectors *vecs)
+int setup_map(struct multipath *mpp, char **params, struct vectors *vecs)
 {
 	struct pathgroup * pgp;
 	struct config *conf;
@@ -462,7 +461,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	 * transform the mp->pg vector of vectors of paths
 	 * into a mp->params strings to feed the device-mapper
 	 */
-	if (assemble_map(mpp, params, params_size)) {
+	if (assemble_map(mpp, params)) {
 		condlog(0, "%s: problem assembing map", mpp->alias);
 		return 1;
 	}
@@ -811,7 +810,7 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 		remove_feature(&mpp_feat, "retain_attached_hw_handler");
 		remove_feature(&cmpp_feat, "queue_if_no_path");
 		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
-		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
+		if (strcmp(mpp_feat, cmpp_feat)) {
 			select_reload_action(mpp, "features change");
 			FREE(cmpp_feat);
 			FREE(mpp_feat);
@@ -1128,14 +1127,14 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 	int ret = CP_FAIL;
 	int k, i, r;
 	int is_daemon = (cmd == CMD_NONE) ? 1 : 0;
-	char params[PARAMS_SIZE];
+	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
 	struct multipath * mpp;
-	struct path * pp1;
+	struct path * pp1 = NULL;
 	struct path * pp2;
 	vector curmp = vecs->mpvec;
 	vector pathvec = vecs->pathvec;
 	vector newmp;
-	struct config *conf;
+	struct config *conf = NULL;
 	int allow_queueing;
 	struct bitfield *size_mismatch_seen;
 
@@ -1247,8 +1246,7 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 		}
 		verify_paths(mpp);
 
-		params[0] = '\0';
-		if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+		if (setup_map(mpp, &params, vecs)) {
 			remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
 			continue;
 		}
@@ -1260,6 +1258,8 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 				      force_reload == FORCE_RELOAD_YES ? 1 : 0);
 
 		r = domap(mpp, params, is_daemon);
+		free(params);
+		params = NULL;
 
 		if (r == DOMAP_FAIL || r == DOMAP_RETRY) {
 			condlog(3, "%s: domap (%u) failure "
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index 70cf77a..92a5aba 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -47,8 +47,7 @@ enum {
 
 struct vectors;
 
-int setup_map (struct multipath * mpp, char * params, int params_size,
-	       struct vectors *vecs );
+int setup_map (struct multipath * mpp, char **params, struct vectors *vecs);
 void select_action (struct multipath *mpp, const struct _vector *curmp,
 		    int force_reload);
 int domap (struct multipath * mpp, char * params, int is_daemon);
diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index b306c46..fb09e0a 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -15,6 +15,7 @@
 #include "util.h"
 #include "debug.h"
 #include "dmparser.h"
+#include "strbuf.h"
 
 #define WORD_SIZE 64
 
@@ -41,40 +42,21 @@ merge_words(char **dst, const char *word)
 	return 0;
 }
 
-#define APPEND(p, end, args...)						\
-({									\
-	int ret;							\
-									\
-	ret = snprintf(p, end - p, ##args);				\
-	if (ret < 0) {							\
-		condlog(0, "%s: conversion error", mp->alias);		\
-		goto err;						\
-	}								\
-	p += ret;							\
-	if (p >= end) {							\
-		condlog(0, "%s: params too small", mp->alias);		\
-		goto err;						\
-	}								\
-})
-
 /*
  * Transforms the path group vector into a proper device map string
  */
-int
-assemble_map (struct multipath * mp, char * params, int len)
+int assemble_map(struct multipath *mp, char **params)
 {
+	static const char no_path_retry[] = "queue_if_no_path";
+	static const char retain_hwhandler[] = "retain_attached_hw_handler";
 	int i, j;
 	int minio;
 	int nr_priority_groups, initial_pg_nr;
-	char * p;
-	const char *const end = params + len;
-	char no_path_retry[] = "queue_if_no_path";
-	char retain_hwhandler[] = "retain_attached_hw_handler";
+	struct strbuf __attribute__((cleanup(reset_strbuf))) buff = STRBUF_INIT;
 	struct pathgroup * pgp;
 	struct path * pp;
 
 	minio = mp->minio;
-	p = params;
 
 	nr_priority_groups = VECTOR_SIZE(mp->pg);
 	initial_pg_nr = (nr_priority_groups ? mp->bestpg : 0);
@@ -87,14 +69,15 @@ assemble_map (struct multipath * mp, char * params, int len)
 	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
 		add_feature(&mp->features, retain_hwhandler);
 
-	/* mp->features must not be NULL */
-	APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler,
-		nr_priority_groups, initial_pg_nr);
+	if (print_strbuf(&buff, "%s %s %i %i", mp->features, mp->hwhandler,
+			 nr_priority_groups, initial_pg_nr) < 0)
+		goto err;
 
 	vector_foreach_slot (mp->pg, pgp, i) {
 		pgp = VECTOR_SLOT(mp->pg, i);
-		APPEND(p, end, " %s %i 1", mp->selector,
-		       VECTOR_SIZE(pgp->paths));
+		if (print_strbuf(&buff, " %s %i 1", mp->selector,
+				 VECTOR_SIZE(pgp->paths)) < 0)
+			goto err;
 
 		vector_foreach_slot (pgp->paths, pp, j) {
 			int tmp_minio = minio;
@@ -106,19 +89,19 @@ assemble_map (struct multipath * mp, char * params, int len)
 				condlog(0, "dev_t not set for '%s'", pp->dev);
 				goto err;
 			}
-			APPEND(p, end, " %s %d", pp->dev_t, tmp_minio);
+			if (print_strbuf(&buff, " %s %d", pp->dev_t, tmp_minio) < 0)
+				goto err;
 		}
 	}
 
-	condlog(4, "%s: assembled map [%s]", mp->alias, params);
+	*params = steal_strbuf_str(&buff);
+	condlog(4, "%s: assembled map [%s]", mp->alias, *params);
 	return 0;
 
 err:
 	return 1;
 }
 
-#undef APPEND
-
 /*
  * Caution callers: If this function encounters yet unkown path devices, it
  * adds them uninitialized to the mpp.
diff --git a/libmultipath/dmparser.h b/libmultipath/dmparser.h
index 212fee5..666ae74 100644
--- a/libmultipath/dmparser.h
+++ b/libmultipath/dmparser.h
@@ -1,3 +1,3 @@
-int assemble_map (struct multipath *, char *, int);
+int assemble_map (struct multipath *, char **);
 int disassemble_map (const struct _vector *, const char *, struct multipath *);
 int disassemble_status (const char *, struct multipath *);
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 7567837..6dd52c2 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -31,7 +31,7 @@
  *   The new version inherits the previous ones.
  */
 
-LIBMULTIPATH_6.0.0 {
+LIBMULTIPATH_7.0.0 {
 global:
 	/* symbols referenced by multipath and multipathd */
 	add_foreign;
@@ -267,6 +267,9 @@ global:
 	/* added in 4.5.0 */
 	get_vpd_sgio;
 	trigger_partitions_udev_change;
+
+	/* added in 7.0.0 */
+	cleanup_charp;
 local:
 	*;
 };
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index c52bcee..399540e 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -13,7 +13,6 @@
 #define SERIAL_SIZE		128
 #define NODE_NAME_SIZE		224
 #define PATH_STR_SIZE		16
-#define PARAMS_SIZE		4096
 #define FILE_NAME_SIZE		256
 #define CALLOUT_MAX_SIZE	256
 #define BLK_DEV_SIZE		33
diff --git a/libmultipath/util.c b/libmultipath/util.c
index 0e37f3f..e2fafe8 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -455,3 +455,8 @@ int should_exit(void)
 {
 	return 0;
 }
+
+void cleanup_charp(char **p)
+{
+	free(*p);
+}
diff --git a/libmultipath/util.h b/libmultipath/util.h
index e9b48f9..89027f8 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -123,4 +123,5 @@ static inline void clear_bit_in_bitfield(unsigned int bit, struct bitfield *bf)
 		___p;		       \
 	})
 
+void cleanup_charp(char **p);
 #endif /* _UTIL_H */
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index d70e1db..bce40b1 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -972,12 +972,12 @@ cli_reload(void *v, char **reply, int *len, void *data)
 int resize_map(struct multipath *mpp, unsigned long long size,
 	       struct vectors * vecs)
 {
-	char params[PARAMS_SIZE] = {0};
+	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
 	unsigned long long orig_size = mpp->size;
 
 	mpp->size = size;
 	update_mpp_paths(mpp, vecs->pathvec);
-	if (setup_map(mpp, params, PARAMS_SIZE, vecs) != 0) {
+	if (setup_map(mpp, &params, vecs) != 0) {
 		condlog(0, "%s: failed to setup map for resize : %s",
 			mpp->alias, strerror(errno));
 		mpp->size = orig_size;
diff --git a/multipathd/main.c b/multipathd/main.c
index bdd629e..f760643 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -489,7 +489,7 @@ static int
 update_map (struct multipath *mpp, struct vectors *vecs, int new_map)
 {
 	int retries = 3;
-	char params[PARAMS_SIZE] = {0};
+	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
 
 retry:
 	condlog(4, "%s: updating new map", mpp->alias);
@@ -502,13 +502,15 @@ retry:
 	verify_paths(mpp);
 	mpp->action = ACT_RELOAD;
 
-	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+	if (setup_map(mpp, &params, vecs)) {
 		condlog(0, "%s: failed to setup new map in update", mpp->alias);
 		retries = -1;
 		goto fail;
 	}
 	if (domap(mpp, params, 1) == DOMAP_FAIL && retries-- > 0) {
 		condlog(0, "%s: map_udate sleep", mpp->alias);
+		free(params);
+		params = NULL;
 		sleep(1);
 		goto retry;
 	}
@@ -1028,7 +1030,7 @@ int
 ev_add_path (struct path * pp, struct vectors * vecs, int need_do_map)
 {
 	struct multipath * mpp;
-	char params[PARAMS_SIZE] = {0};
+	char *params __attribute((cleanup(cleanup_charp))) = NULL;
 	int retries = 3;
 	int start_waiter = 0;
 	int ret;
@@ -1104,7 +1106,9 @@ rescan:
 	/*
 	 * push the map to the device-mapper
 	 */
-	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+	free(params);
+	params = NULL;
+	if (setup_map(mpp, &params, vecs)) {
 		condlog(0, "%s: failed to setup map for addition of new "
 			"path %s", mpp->alias, pp->dev);
 		goto fail_map;
@@ -1189,7 +1193,7 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 {
 	struct multipath * mpp;
 	int i, retval = REMOVE_PATH_SUCCESS;
-	char params[PARAMS_SIZE] = {0};
+	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
 
 	/*
 	 * avoid referring to the map of an orphaned path
@@ -1250,7 +1254,7 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 			 */
 		}
 
-		if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+		if (setup_map(mpp, &params, vecs)) {
 			condlog(0, "%s: failed to setup map for"
 				" removal of path %s", mpp->alias, pp->dev);
 			goto fail;
@@ -1940,7 +1944,7 @@ int update_prio(struct path *pp, int refresh_all)
 static int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
 		      int is_daemon)
 {
-	char params[PARAMS_SIZE] = {0};
+	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
 	struct path *pp;
 	int i, r;
 
@@ -1958,7 +1962,7 @@ static int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
 			}
 		}
 	}
-	if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
+	if (setup_map(mpp, &params, vecs)) {
 		condlog(0, "%s: failed to setup map", mpp->alias);
 		return 1;
 	}
-- 
2.32.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

