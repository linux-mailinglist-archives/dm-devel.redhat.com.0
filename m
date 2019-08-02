Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A447FEBA
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:39:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE48F30C75B5;
	Fri,  2 Aug 2019 16:39:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 086215C22B;
	Fri,  2 Aug 2019 16:39:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B723149E4;
	Fri,  2 Aug 2019 16:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GXpad001286 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:33:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5E156012A; Fri,  2 Aug 2019 16:33:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7499B600C8;
	Fri,  2 Aug 2019 16:33:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GXkrk031798; 
	Fri, 2 Aug 2019 11:33:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GXkPV031797;
	Fri, 2 Aug 2019 11:33:46 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:28 -0500
Message-Id: <1564763622-31752-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 02/16] libmultipath: add marginal paths and
	groups infrastructure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 02 Aug 2019 16:39:28 +0000 (UTC)

This commit adds a marginal variable ot the paths and pathgroups structs.
The marginal paths variable can be set by

multipathd path <path> setmarginal

and cleared by

multipathd path <path> unsetmarginal

All of the marginal paths on a multipath device can be cleared by

multipathd map <map> unsetmarginal

Currently, the marginal variable of a pathgroup will not change. This
will be added by a future commit. The marginal state of a path or
pathgroup is printable with the %M wildcard, and is displayed in the
json output.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/print.c      | 18 ++++++++
 libmultipath/print.h      |  6 ++-
 libmultipath/structs.h    |  2 +
 multipathd/cli.c          |  5 +++
 multipathd/cli.h          |  4 ++
 multipathd/cli_handlers.c | 91 +++++++++++++++++++++++++++++++++++++++
 multipathd/cli_handlers.h |  3 ++
 multipathd/main.c         |  3 ++
 8 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index fc40b0f0..907469ad 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -502,6 +502,14 @@ snprint_pg_state (char * buff, size_t len, const struct pathgroup * pgp)
 	}
 }
 
+static int
+snprint_pg_marginal (char * buff, size_t len, const struct pathgroup * pgp)
+{
+	if (pgp->marginal)
+		return snprintf(buff, len, "marginal");
+	return snprintf(buff, len, "normal");
+}
+
 static int
 snprint_path_size (char * buff, size_t len, const struct path * pp)
 {
@@ -672,6 +680,14 @@ snprint_path_protocol(char * buff, size_t len, const struct path * pp)
 	}
 }
 
+int
+snprint_path_marginal(char * buff, size_t len, const struct path * pp)
+{
+	if (pp->marginal)
+		return snprintf(buff, len, "marginal");
+	return snprintf(buff, len, "normal");
+}
+
 struct multipath_data mpd[] = {
 	{'n', "name",          0, snprint_name},
 	{'w', "uuid",          0, snprint_multipath_uuid},
@@ -713,6 +729,7 @@ struct path_data pd[] = {
 	{'p', "pri",           0, snprint_pri},
 	{'S', "size",          0, snprint_path_size},
 	{'z', "serial",        0, snprint_path_serial},
+	{'M', "marginal_st",   0, snprint_path_marginal},
 	{'m', "multipath",     0, snprint_path_mpp},
 	{'N', "host WWNN",     0, snprint_host_wwnn},
 	{'n', "target WWNN",   0, snprint_tgt_wwnn},
@@ -729,6 +746,7 @@ struct pathgroup_data pgd[] = {
 	{'s', "selector",      0, snprint_pg_selector},
 	{'p', "pri",           0, snprint_pg_pri},
 	{'t', "dm_st",         0, snprint_pg_state},
+	{'M', "marginal_st",   0, snprint_pg_marginal},
 	{0, NULL, 0 , NULL}
 };
 
diff --git a/libmultipath/print.h b/libmultipath/print.h
index e2fb865c..7e36ec63 100644
--- a/libmultipath/print.h
+++ b/libmultipath/print.h
@@ -50,7 +50,8 @@
 #define PRINT_JSON_GROUP     "{\n" \
 			     "         \"selector\" : \"%s\",\n" \
 			     "         \"pri\" : %p,\n" \
-			     "         \"dm_st\" : \"%t\","
+			     "         \"dm_st\" : \"%t\",\n" \
+			     "         \"marginal_st\" : \"%M\","
 
 #define PRINT_JSON_GROUP_NUM "         \"group\" : %d,\n"
 
@@ -66,7 +67,8 @@
 			     "            \"target_wwnn\" : \"%n\",\n" \
 			     "            \"host_wwpn\" : \"%R\",\n" \
 			     "            \"target_wwpn\" : \"%r\",\n" \
-			     "            \"host_adapter\" : \"%a\""
+			     "            \"host_adapter\" : \"%a\",\n" \
+			     "            \"marginal_st\" : \"%M\""
 
 #define MAX_LINE_LEN  80
 #define MAX_LINES     64
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 7879d763..1a3d827b 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -289,6 +289,7 @@ struct path {
 	int io_err_pathfail_cnt;
 	int io_err_pathfail_starttime;
 	int find_multipaths_timeout;
+	int marginal;
 	/* configlet pointers */
 	vector hwe;
 	struct gen_path generic_path;
@@ -403,6 +404,7 @@ struct pathgroup {
 	int status;
 	int priority;
 	int enabled_paths;
+	int marginal;
 	vector paths;
 	struct multipath *mpp;
 	struct gen_pathgroup generic_pg;
diff --git a/multipathd/cli.c b/multipathd/cli.c
index 17795b61..800c0fbe 100644
--- a/multipathd/cli.c
+++ b/multipathd/cli.c
@@ -215,6 +215,8 @@ load_keys (void)
 	r += add_key(keys, "unsetprkey", UNSETPRKEY, 0);
 	r += add_key(keys, "key", KEY, 1);
 	r += add_key(keys, "local", LOCAL, 0);
+	r += add_key(keys, "setmarginal", SETMARGINAL, 0);
+	r += add_key(keys, "unsetmarginal", UNSETMARGINAL, 0);
 
 
 	if (r) {
@@ -589,6 +591,9 @@ cli_init (void) {
 	add_handler(UNSETPRKEY+MAP, NULL);
 	add_handler(FORCEQ+DAEMON, NULL);
 	add_handler(RESTOREQ+DAEMON, NULL);
+	add_handler(SETMARGINAL+PATH, NULL);
+	add_handler(UNSETMARGINAL+PATH, NULL);
+	add_handler(UNSETMARGINAL+MAP, NULL);
 
 	return 0;
 }
diff --git a/multipathd/cli.h b/multipathd/cli.h
index 32dcffac..fdfb9aed 100644
--- a/multipathd/cli.h
+++ b/multipathd/cli.h
@@ -45,6 +45,8 @@ enum {
 	__UNSETPRKEY,
 	__KEY,
 	__LOCAL,
+	__SETMARGINAL,
+	__UNSETMARGINAL,
 };
 
 #define LIST		(1 << __LIST)
@@ -89,6 +91,8 @@ enum {
 #define UNSETPRKEY	(1ULL << __UNSETPRKEY)
 #define KEY		(1ULL << __KEY)
 #define LOCAL		(1ULL << __LOCAL)
+#define SETMARGINAL	(1ULL << __SETMARGINAL)
+#define UNSETMARGINAL	(1ULL << __UNSETMARGINAL)
 
 #define INITIAL_REPLY_LEN	1200
 
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 4c32d953..8a899049 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -1537,3 +1537,94 @@ cli_setprkey(void * v, char ** reply, int * len, void * data)
 
 	return ret;
 }
+
+int cli_set_marginal(void * v, char ** reply, int * len, void * data)
+{
+	struct vectors * vecs = (struct vectors *)data;
+	char * param = get_keyparam(v, PATH);
+	struct path * pp;
+
+	param = convert_dev(param, 1);
+	pp = find_path_by_dev(vecs->pathvec, param);
+
+	if (!pp)
+		pp = find_path_by_devt(vecs->pathvec, param);
+
+	if (!pp || !pp->mpp || !pp->mpp->alias)
+		return 1;
+
+	condlog(2, "%s: set marginal path %s (operator)",
+		pp->mpp->alias, pp->dev_t);
+	if (pp->mpp->wait_for_udev) {
+		condlog(2, "%s: device not fully created, failing set marginal",
+			pp->mpp->alias);
+		return 1;
+	}
+	pp->marginal = 1;
+
+	return update_path_groups(pp->mpp, vecs, 0);
+}
+
+int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
+{
+	struct vectors * vecs = (struct vectors *)data;
+	char * param = get_keyparam(v, PATH);
+	struct path * pp;
+
+	param = convert_dev(param, 1);
+	pp = find_path_by_dev(vecs->pathvec, param);
+
+	if (!pp)
+		pp = find_path_by_devt(vecs->pathvec, param);
+
+	if (!pp || !pp->mpp || !pp->mpp->alias)
+		return 1;
+
+	condlog(2, "%s: unset marginal path %s (operator)",
+		pp->mpp->alias, pp->dev_t);
+	if (pp->mpp->wait_for_udev) {
+		condlog(2, "%s: device not fully created, "
+			"failing unset marginal", pp->mpp->alias);
+		return 1;
+	}
+	pp->marginal = 0;
+
+	return update_path_groups(pp->mpp, vecs, 0);
+}
+
+int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
+{
+	struct vectors * vecs = (struct vectors *)data;
+	char * mapname = get_keyparam(v, MAP);
+	struct multipath *mpp;
+	struct pathgroup * pgp;
+	struct path * pp;
+	unsigned int i, j;
+	int minor;
+
+	mapname = convert_dev(mapname, 0);
+	condlog(2, "%s: unset all marginal paths (operator)",
+		mapname);
+
+	if (sscanf(mapname, "dm-%d", &minor) == 1)
+		mpp = find_mp_by_minor(vecs->mpvec, minor);
+	else
+		mpp = find_mp_by_alias(vecs->mpvec, mapname);
+
+	if (!mpp) {
+		condlog(0, "%s: invalid map name. "
+			"cannot unset marginal paths", mapname);
+		return 1;
+	}
+	if (mpp->wait_for_udev) {
+		condlog(2, "%s: device not fully created, "
+			"failing unset all marginal", mpp->alias);
+		return 1;
+	}
+
+	vector_foreach_slot (mpp->pg, pgp, i)
+		vector_foreach_slot (pgp->paths, pp, j)
+			pp->marginal = 0;
+
+	return update_path_groups(mpp, vecs, 0);
+}
diff --git a/multipathd/cli_handlers.h b/multipathd/cli_handlers.h
index edbdf063..0f451064 100644
--- a/multipathd/cli_handlers.h
+++ b/multipathd/cli_handlers.h
@@ -49,3 +49,6 @@ int cli_unsetprstatus(void * v, char ** reply, int * len, void * data);
 int cli_getprkey(void * v, char ** reply, int * len, void * data);
 int cli_setprkey(void * v, char ** reply, int * len, void * data);
 int cli_unsetprkey(void * v, char ** reply, int * len, void * data);
+int cli_set_marginal(void * v, char ** reply, int * len, void * data);
+int cli_unset_marginal(void * v, char ** reply, int * len, void * data);
+int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data);
diff --git a/multipathd/main.c b/multipathd/main.c
index 7a5cd115..7db15736 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1609,6 +1609,9 @@ uxlsnrloop (void * ap)
 	set_handler_callback(GETPRKEY+MAP, cli_getprkey);
 	set_handler_callback(SETPRKEY+MAP+KEY, cli_setprkey);
 	set_handler_callback(UNSETPRKEY+MAP, cli_unsetprkey);
+	set_handler_callback(SETMARGINAL+PATH, cli_set_marginal);
+	set_handler_callback(UNSETMARGINAL+PATH, cli_unset_marginal);
+	set_handler_callback(UNSETMARGINAL+MAP, cli_unset_all_marginal);
 
 	umask(077);
 	uxsock_listen(&uxsock_trigger, ux_sock, ap);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
