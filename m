Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5D7FEBD
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:39:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F3FEA836;
	Fri,  2 Aug 2019 16:39:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 630D65DA38;
	Fri,  2 Aug 2019 16:39:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED127149E4;
	Fri,  2 Aug 2019 16:39:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GYDC8001434 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:34:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B77C10016EA; Fri,  2 Aug 2019 16:34:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58DAE1001B02;
	Fri,  2 Aug 2019 16:34:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GY7co031843; 
	Fri, 2 Aug 2019 11:34:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GY6HW031842;
	Fri, 2 Aug 2019 11:34:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:39 -0500
Message-Id: <1564763622-31752-14-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 13/16] libmultipath: add marginal_pathgroups
	config option
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 02 Aug 2019 16:39:51 +0000 (UTC)

group_paths now gets passed this to determine whether to enable
marginal pathgroups. The unit tests have also been updated.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h     |   1 +
 libmultipath/configure.c  |   5 +-
 libmultipath/dict.c       |   3 +
 libmultipath/pgpolicies.c |   5 +-
 libmultipath/pgpolicies.h |   2 +-
 tests/pgpolicy.c          | 140 +++++++++++++++++++++++---------------
 6 files changed, 98 insertions(+), 58 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index ff2b4e86..0b978970 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -186,6 +186,7 @@ struct config {
 	int max_sectors_kb;
 	int ghost_delay;
 	int find_multipaths_timeout;
+	int marginal_pathgroups;
 	unsigned int version[3];
 
 	char * multipath_dir;
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 3c309d64..3238d485 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -297,7 +297,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 {
 	struct pathgroup * pgp;
 	struct config *conf;
-	int i, n_paths;
+	int i, n_paths, marginal_pathgroups;
 
 	/*
 	 * don't bother if devmap size is unknown
@@ -357,6 +357,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	select_flush_on_last_del(conf, mpp);
 
 	sysfs_set_scsi_tmo(mpp, conf->checkint);
+	marginal_pathgroups = conf->marginal_pathgroups;
 	pthread_cleanup_pop(1);
 
 	if (marginal_path_check_enabled(mpp)) {
@@ -387,7 +388,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 		vector_free(mpp->pg);
 		mpp->pg = NULL;
 	}
-	if (group_paths(mpp))
+	if (group_paths(mpp, marginal_pathgroups))
 		return 1;
 
 	/*
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index c6eba0f6..b5feb884 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -1339,6 +1339,8 @@ declare_ovr_snprint(all_tg_pt, print_yes_no_undef)
 declare_hw_handler(all_tg_pt, set_yes_no_undef)
 declare_hw_snprint(all_tg_pt, print_yes_no_undef)
 
+declare_def_handler(marginal_pathgroups, set_yes_no)
+declare_def_snprint(marginal_pathgroups, print_yes_no)
 
 static int
 def_uxsock_timeout_handler(struct config *conf, vector strvec)
@@ -1710,6 +1712,7 @@ init_keywords(vector keywords)
 	install_keyword("find_multipaths_timeout",
 			&def_find_multipaths_timeout_handler,
 			&snprint_def_find_multipaths_timeout);
+	install_keyword("marginal_pathgroups", &def_marginal_pathgroups_handler, &snprint_def_marginal_pathgroups);
 	__deprecated install_keyword("default_selector", &def_selector_handler, NULL);
 	__deprecated install_keyword("default_path_grouping_policy", &def_pgpolicy_handler, NULL);
 	__deprecated install_keyword("default_uid_attribute", &def_uid_attribute_handler, NULL);
diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 6fb2d28a..8f7c6b13 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -131,7 +131,7 @@ fail:
 	return -1;
 }
 
-int group_paths(struct multipath *mp)
+int group_paths(struct multipath *mp, int marginal_pathgroups)
 {
 	vector normal, marginal;
 
@@ -145,7 +145,8 @@ int group_paths(struct multipath *mp)
 	if (!mp->pgpolicyfn)
 		goto fail;
 
-	if (split_marginal_paths(mp->paths, &normal, &marginal) != 0) {
+	if (!marginal_pathgroups ||
+	    split_marginal_paths(mp->paths, &normal, &marginal) != 0) {
 		if (mp->pgpolicyfn(mp, mp->paths) != 0)
 			goto fail;
 	} else {
diff --git a/libmultipath/pgpolicies.h b/libmultipath/pgpolicies.h
index 7532d75f..15927610 100644
--- a/libmultipath/pgpolicies.h
+++ b/libmultipath/pgpolicies.h
@@ -21,7 +21,7 @@ enum iopolicies {
 
 int get_pgpolicy_id(char *);
 int get_pgpolicy_name (char *, int, int);
-int group_paths(struct multipath *);
+int group_paths(struct multipath *, int);
 /*
  * policies
  */
diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
index ab09f91c..3f61b123 100644
--- a/tests/pgpolicy.c
+++ b/tests/pgpolicy.c
@@ -204,7 +204,7 @@ static void test_one_group8(void **state)
 	int group_size[] = {8};
 
 	mp8.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
@@ -215,7 +215,7 @@ static void test_one_group4(void **state)
 	int group_size[] = {4};
 
 	mp4.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 1);
 }
 
@@ -226,21 +226,21 @@ static void test_one_group1(void **state)
 	int group_size[] = {1};
 
 	mp1.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp1), 0);
+	assert_int_equal(group_paths(&mp1, 0), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_one_group0(void **state)
 {
 	mp0.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp0), 0);
+	assert_int_equal(group_paths(&mp0, 0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_one_group_null(void **state)
 {
 	mp_null.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp_null), 0);
+	assert_int_equal(group_paths(&mp_null, 0), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
 }
 
@@ -254,7 +254,7 @@ static void test_one_group_all_marginal8(void **state)
 
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 1);
 }
 
@@ -269,10 +269,23 @@ static void test_one_group_half_marginal8(void **state)
 
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
 }
 
+static void test_one_group_ignore_marginal8(void **state)
+{
+	int marginal[] = {1,0,1,0,1,1,0,0};
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
+}
+
 static void test_one_group_one_marginal8(void **state)
 {
 	int marginal[] = {0,0,0,0,0,1,0,0};
@@ -284,7 +297,7 @@ static void test_one_group_one_marginal8(void **state)
 
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = one_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
 }
 
@@ -296,7 +309,7 @@ static void test_one_path_per_group_same8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -310,7 +323,7 @@ static void test_one_path_per_group_increasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -324,7 +337,7 @@ static void test_one_path_per_group_decreasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -338,7 +351,7 @@ static void test_one_path_per_group_mixed8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -349,7 +362,7 @@ static void test_one_path_per_group4(void **state)
 	int group_size[] = {1,1,1,1};
 
 	mp4.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 4);
 }
 
@@ -360,21 +373,21 @@ static void test_one_path_per_group1(void **state)
 	int group_size[] = {1};
 
 	mp1.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp1), 0);
+	assert_int_equal(group_paths(&mp1, 0), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_one_path_per_group0(void **state)
 {
 	mp0.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp0), 0);
+	assert_int_equal(group_paths(&mp0, 0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_one_path_per_group_null(void **state)
 {
 	mp_null.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp_null), 0);
+	assert_int_equal(group_paths(&mp_null, 0), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
 }
 
@@ -391,7 +404,7 @@ static void test_one_path_per_group_mixed_all_marginal8(void **state)
 	set_priority(p8, prio, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 8);
 }
 
@@ -408,7 +421,7 @@ static void test_one_path_per_group_mixed_half_marginal8(void **state)
 	set_priority(p8, prio, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = one_path_per_group;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 8);
 }
 
@@ -419,7 +432,7 @@ static void test_group_by_prio_same8(void **state)
 	int group_size[] = {8};
 
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
@@ -433,7 +446,7 @@ static void test_group_by_prio_increasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -447,7 +460,7 @@ static void test_group_by_prio_decreasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -466,7 +479,26 @@ static void test_group_by_prio_mixed8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 6);
+}
+
+static void test_group_by_prio_mixed_no_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int group0[] = {6};
+	int group1[] = {0};
+	int group2[] = {4};
+	int group3[] = {2,3};
+	int group4[] = {5,7};
+	int group5[] = {1};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5};
+	int group_size[] = {1,1,1,2,2,1};
+
+	set_priority(p8, prio, 8);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 6);
 }
 
@@ -480,7 +512,7 @@ static void test_group_by_prio_2_groups8(void **state)
 
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
@@ -495,7 +527,7 @@ static void test_group_by_prio_mixed4(void **state)
 
 	set_priority(p4, prio, 4);
 	mp4.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
@@ -509,7 +541,7 @@ static void test_group_by_prio_2_groups4(void **state)
 
 	set_priority(p4, prio, 4);
 	mp4.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
@@ -520,21 +552,21 @@ static void test_group_by_prio1(void **state)
 	int group_size[] = {1};
 
 	mp1.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp1), 0);
+	assert_int_equal(group_paths(&mp1, 0), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_prio0(void **state)
 {
 	mp0.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp0), 0);
+	assert_int_equal(group_paths(&mp0, 0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_prio_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp_null), 0);
+	assert_int_equal(group_paths(&mp_null, 0), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
 }
 
@@ -556,7 +588,7 @@ static void test_group_by_prio_mixed_all_marginal8(void **state)
 	set_priority(p8, prio, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 6);
 }
 
@@ -579,7 +611,7 @@ static void test_group_by_prio_mixed_half_marginal8(void **state)
 	set_priority(p8, prio, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
 }
 
@@ -602,7 +634,7 @@ static void test_group_by_prio_mixed_one_marginal8(void **state)
 	set_priority(p8, prio, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = group_by_prio;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
 }
 
@@ -615,7 +647,7 @@ static void test_group_by_node_name_same8(void **state)
 
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
@@ -631,7 +663,7 @@ static void test_group_by_node_name_increasing8(void **state)
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -648,7 +680,7 @@ static void test_group_by_node_name_3_groups8(void **state)
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 3);
 }
 
@@ -664,7 +696,7 @@ static void test_group_by_node_name_2_groups8(void **state)
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
@@ -681,7 +713,7 @@ static void test_group_by_node_name_3_groups4(void **state)
 	set_priority(p4, prio, 4);
 	set_tgt_node_name(p4, node_name, 4);
 	mp4.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
@@ -697,7 +729,7 @@ static void test_group_by_node_name_2_groups4(void **state)
 	set_priority(p4, prio, 4);
 	set_tgt_node_name(p4, node_name, 4);
 	mp4.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
@@ -710,21 +742,21 @@ static void test_group_by_node_name1(void **state)
 
 	set_tgt_node_name(p1, node_name, 1);
 	mp1.pgpolicyfn = group_by_node_name;
-        assert_int_equal(group_paths(&mp1), 0);
+        assert_int_equal(group_paths(&mp1,0), 0);
         verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_node_name0(void **state)
 {
 	mp0.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp0), 0);
+	assert_int_equal(group_paths(&mp0, 0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_node_name_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp_null), 0);
+	assert_int_equal(group_paths(&mp_null, 0), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
 }
 
@@ -743,7 +775,7 @@ static void test_group_by_node_name_2_groups_all_marginal8(void **state)
 	set_marginal(p8, marginal, 8);
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
 }
 
@@ -764,7 +796,7 @@ static void test_group_by_node_name_2_groups_half_marginal8(void **state)
 	set_marginal(p8, marginal, 8);
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 4);
 }
 
@@ -777,7 +809,7 @@ static void test_group_by_serial_same8(void **state)
 
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
@@ -793,7 +825,7 @@ static void test_group_by_serial_increasing8(void **state)
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
@@ -810,7 +842,7 @@ static void test_group_by_serial_3_groups8(void **state)
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 3);
 }
 
@@ -826,7 +858,7 @@ static void test_group_by_serial_2_groups8(void **state)
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 0), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
@@ -843,7 +875,7 @@ static void test_group_by_serial_3_groups4(void **state)
 	set_priority(p4, prio, 4);
 	set_serial(p4, serial, 4);
 	mp4.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
@@ -859,7 +891,7 @@ static void test_group_by_serial_2_groups4(void **state)
 	set_priority(p4, prio, 4);
 	set_serial(p4, serial, 4);
 	mp4.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp4), 0);
+	assert_int_equal(group_paths(&mp4, 0), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
@@ -872,21 +904,21 @@ static void test_group_by_serial1(void **state)
 
 	set_serial(p1, serial, 1);
 	mp1.pgpolicyfn = group_by_serial;
-        assert_int_equal(group_paths(&mp1), 0);
+        assert_int_equal(group_paths(&mp1, 0), 0);
         verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_serial0(void **state)
 {
 	mp0.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp0), 0);
+	assert_int_equal(group_paths(&mp0, 0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_serial_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp_null), 0);
+	assert_int_equal(group_paths(&mp_null, 0), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
 }
 
@@ -905,7 +937,7 @@ static void test_group_by_serial_2_groups8_all_marginal8(void **state)
 	set_serial(p8, serial, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
 }
 
@@ -926,7 +958,7 @@ static void test_group_by_serial_2_groups8_half_marginal8(void **state)
 	set_serial(p8, serial, 8);
 	set_marginal(p8, marginal, 8);
 	mp8.pgpolicyfn = group_by_serial;
-	assert_int_equal(group_paths(&mp8), 0);
+	assert_int_equal(group_paths(&mp8, 1), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 4);
 }
 
@@ -943,6 +975,7 @@ int test_pgpolicies(void)
 		setup_test(test_one_group, _null),
 		setup_test(test_one_group_all_marginal, 8),
 		setup_test(test_one_group_half_marginal, 8),
+		setup_test(test_one_group_ignore_marginal, 8),
 		setup_test(test_one_group_one_marginal, 8),
 		setup_test(test_one_path_per_group_same, 8),
 		setup_test(test_one_path_per_group_increasing, 8),
@@ -958,6 +991,7 @@ int test_pgpolicies(void)
 		setup_test(test_group_by_prio_increasing, 8),
 		setup_test(test_group_by_prio_decreasing, 8),
 		setup_test(test_group_by_prio_mixed, 8),
+		setup_test(test_group_by_prio_mixed_no_marginal, 8),
 		setup_test(test_group_by_prio_2_groups, 8),
 		setup_test(test_group_by_prio_mixed, 4),
 		setup_test(test_group_by_prio_2_groups, 4),
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
