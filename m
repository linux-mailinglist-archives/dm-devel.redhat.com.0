Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534A7FEC9
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:41:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDB0B30832EA;
	Fri,  2 Aug 2019 16:41:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE8261559;
	Fri,  2 Aug 2019 16:41:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B4B241F63;
	Fri,  2 Aug 2019 16:41:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GY8JB001403 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:34:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66B375D962; Fri,  2 Aug 2019 16:34:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3AEB5DA38;
	Fri,  2 Aug 2019 16:34:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GY5w4031839; 
	Fri, 2 Aug 2019 11:34:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GY40X031838;
	Fri, 2 Aug 2019 11:34:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:38 -0500
Message-Id: <1564763622-31752-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 12/16] tests: add tests for grouping marginal
	paths.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 02 Aug 2019 16:41:34 +0000 (UTC)

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/pgpolicy.c | 337 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 295 insertions(+), 42 deletions(-)

diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
index 04a77c4c..ab09f91c 100644
--- a/tests/pgpolicy.c
+++ b/tests/pgpolicy.c
@@ -40,6 +40,15 @@ static void set_priority(struct path *pp, int *prio, int size)
 	}
 }
 
+static void set_marginal(struct path *pp, int *marginal, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		pp[i].marginal = marginal[i];
+	}
+}
+
 static void set_tgt_node_name(struct path *pp, char **tgt_node_name, int size)
 {
 	int i;
@@ -82,6 +91,7 @@ static int setupX(struct multipath *mp, struct path *pp, int size)
 {
 	int i;
 	int prio[8] = {10, 10, 10, 10, 10, 10, 10, 10};
+	int marginal[8] = {0, 0, 0, 0, 0, 0, 0, 0};
 
 	mp->paths = vector_alloc();
 	if (!mp->paths)
@@ -92,6 +102,7 @@ static int setupX(struct multipath *mp, struct path *pp, int size)
 		vector_set_slot(mp->paths, &pp[i]);
 	}
 	set_priority(pp, prio, size);
+	set_marginal(pp, marginal, size);
 	mp->pgpolicyfn = NULL;
 	return 0;
 }
@@ -155,7 +166,7 @@ static int teardown_null(void **state)
 
 static void
 verify_pathgroups(struct multipath *mp, struct path *pp, int **groups,
-		  int *group_size, int size)
+		  int *group_size, int *marginal, int size)
 {
 	int i, j;
 	struct pathgroup *pgp;
@@ -168,6 +179,10 @@ verify_pathgroups(struct multipath *mp, struct path *pp, int **groups,
 		assert_non_null(pgp);
 		assert_non_null(pgp->paths);
 		assert_int_equal(VECTOR_SIZE(pgp->paths), group_size[i]);
+		if (marginal)
+			assert_int_equal(pgp->marginal, marginal[i]);
+		else
+			assert_int_equal(pgp->marginal, 0);
 		for (j = 0; j < group_size[i]; j++) {
 			int path_nr = groups[i][j];
 			struct path *pgp_path = VECTOR_SLOT(pgp->paths, j);
@@ -190,7 +205,7 @@ static void test_one_group8(void **state)
 
 	mp8.pgpolicyfn = one_group;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
 static void test_one_group4(void **state)
@@ -201,7 +216,7 @@ static void test_one_group4(void **state)
 
 	mp4.pgpolicyfn = one_group;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 1);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 1);
 }
 
 static void test_one_group1(void **state)
@@ -212,21 +227,65 @@ static void test_one_group1(void **state)
 
 	mp1.pgpolicyfn = one_group;
 	assert_int_equal(group_paths(&mp1), 0);
-	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_one_group0(void **state)
 {
 	mp0.pgpolicyfn = one_group;
 	assert_int_equal(group_paths(&mp0), 0);
-	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_one_group_null(void **state)
 {
 	mp_null.pgpolicyfn = one_group;
 	assert_int_equal(group_paths(&mp_null), 0);
-	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_one_group_all_marginal8(void **state)
+{
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+	int group_marginal[] = {1};
+
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 1);
+}
+
+static void test_one_group_half_marginal8(void **state)
+{
+	int marginal[] = {1,0,1,0,1,1,0,0};
+	int group0[] = {1,3,6,7};
+	int group1[] = {0,2,4,5};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+	int group_marginal[] = {0,1};
+
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
+}
+
+static void test_one_group_one_marginal8(void **state)
+{
+	int marginal[] = {0,0,0,0,0,1,0,0};
+	int group0[] = {0,1,2,3,4,6,7};
+	int group1[] = {5};
+	int *groups[] = {group0, group1};
+	int group_size[] = {7,1};
+	int group_marginal[] = {0,1};
+
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
 }
 
 static void test_one_path_per_group_same8(void **state)
@@ -238,7 +297,7 @@ static void test_one_path_per_group_same8(void **state)
 
 	mp8.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_one_path_per_group_increasing8(void **state)
@@ -252,7 +311,7 @@ static void test_one_path_per_group_increasing8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_one_path_per_group_decreasing8(void **state)
@@ -266,7 +325,7 @@ static void test_one_path_per_group_decreasing8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_one_path_per_group_mixed8(void **state)
@@ -280,7 +339,7 @@ static void test_one_path_per_group_mixed8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_one_path_per_group4(void **state)
@@ -291,7 +350,7 @@ static void test_one_path_per_group4(void **state)
 
 	mp4.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 4);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 4);
 }
 
 static void test_one_path_per_group1(void **state)
@@ -302,21 +361,55 @@ static void test_one_path_per_group1(void **state)
 
 	mp1.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp1), 0);
-	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_one_path_per_group0(void **state)
 {
 	mp0.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp0), 0);
-	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_one_path_per_group_null(void **state)
 {
 	mp_null.pgpolicyfn = one_path_per_group;
 	assert_int_equal(group_paths(&mp_null), 0);
-	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_one_path_per_group_mixed_all_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int paths[] = {6,0,4,2,3,5,7,1};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+	int group_marginal[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 8);
+}
+
+static void test_one_path_per_group_mixed_half_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int marginal[] = {0,1,1,0,0,0,1,1};
+	int paths[] = {0,4,3,5,6,2,7,1};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+	int group_marginal[] = {0,0,0,0,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 8);
 }
 
 static void test_group_by_prio_same8(void **state)
@@ -327,7 +420,7 @@ static void test_group_by_prio_same8(void **state)
 
 	mp8.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_prio_increasing8(void **state)
@@ -341,7 +434,7 @@ static void test_group_by_prio_increasing8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_group_by_prio_decreasing8(void **state)
@@ -355,7 +448,7 @@ static void test_group_by_prio_decreasing8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_group_by_prio_mixed8(void **state)
@@ -374,7 +467,7 @@ static void test_group_by_prio_mixed8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 6);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 6);
 }
 
 static void test_group_by_prio_2_groups8(void **state)
@@ -388,7 +481,7 @@ static void test_group_by_prio_2_groups8(void **state)
 	set_priority(p8, prio, 8);
 	mp8.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_prio_mixed4(void **state)
@@ -403,7 +496,7 @@ static void test_group_by_prio_mixed4(void **state)
 	set_priority(p4, prio, 4);
 	mp4.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
 static void test_group_by_prio_2_groups4(void **state)
@@ -417,7 +510,7 @@ static void test_group_by_prio_2_groups4(void **state)
 	set_priority(p4, prio, 4);
 	mp4.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_prio1(void **state)
@@ -428,21 +521,89 @@ static void test_group_by_prio1(void **state)
 
 	mp1.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp1), 0);
-	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_prio0(void **state)
 {
 	mp0.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp0), 0);
-	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_prio_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_prio;
 	assert_int_equal(group_paths(&mp_null), 0);
-	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_prio_mixed_all_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int group0[] = {6};
+	int group1[] = {0};
+	int group2[] = {4};
+	int group3[] = {2,3};
+	int group4[] = {5,7};
+	int group5[] = {1};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5};
+	int group_size[] = {1,1,1,2,2,1};
+	int group_marginal[] = {1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 6);
+}
+
+static void test_group_by_prio_mixed_half_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int marginal[] = {0,0,0,1,0,1,1,1};
+	int group0[] = {0};
+	int group1[] = {4};
+	int group2[] = {2};
+	int group3[] = {1};
+	int group4[] = {6};
+	int group5[] = {3};
+	int group6[] = {5,7};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5, group6};
+	int group_size[] = {1,1,1,1,1,1,2};
+	int group_marginal[] = {0,0,0,0,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
+}
+
+static void test_group_by_prio_mixed_one_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int marginal[] = {0,0,0,0,0,1,0,0};
+	int group0[] = {6};
+	int group1[] = {0};
+	int group2[] = {4};
+	int group3[] = {2,3};
+	int group4[] = {7};
+	int group5[] = {1};
+	int group6[] = {5};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5, group6};
+	int group_size[] = {1,1,1,2,1,1,1};
+	int group_marginal[] = {0,0,0,0,0,0,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
 }
 
 static void test_group_by_node_name_same8(void **state)
@@ -455,7 +616,7 @@ static void test_group_by_node_name_same8(void **state)
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_node_name_increasing8(void **state)
@@ -471,7 +632,7 @@ static void test_group_by_node_name_increasing8(void **state)
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_group_by_node_name_3_groups8(void **state)
@@ -488,7 +649,7 @@ static void test_group_by_node_name_3_groups8(void **state)
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 3);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 3);
 }
 
 static void test_group_by_node_name_2_groups8(void **state)
@@ -504,7 +665,7 @@ static void test_group_by_node_name_2_groups8(void **state)
 	set_tgt_node_name(p8, node_name, 8);
 	mp8.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_node_name_3_groups4(void **state)
@@ -521,7 +682,7 @@ static void test_group_by_node_name_3_groups4(void **state)
 	set_tgt_node_name(p4, node_name, 4);
 	mp4.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
 static void test_group_by_node_name_2_groups4(void **state)
@@ -537,7 +698,7 @@ static void test_group_by_node_name_2_groups4(void **state)
 	set_tgt_node_name(p4, node_name, 4);
 	mp4.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_node_name1(void **state)
@@ -550,21 +711,61 @@ static void test_group_by_node_name1(void **state)
 	set_tgt_node_name(p1, node_name, 1);
 	mp1.pgpolicyfn = group_by_node_name;
         assert_int_equal(group_paths(&mp1), 0);
-        verify_pathgroups(&mp1, p1, groups, group_size, 1);
+        verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_node_name0(void **state)
 {
 	mp0.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp0), 0);
-	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_node_name_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_node_name;
 	assert_int_equal(group_paths(&mp_null), 0);
-	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_node_name_2_groups_all_marginal8(void **state)
+{
+	char *node_name[] = {"a", "a", "b", "a", "b", "b", "b", "a"};
+	int prio[] = {4,1,2,1,2,2,2,1};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int group0[] = {2,4,5,6};
+	int group1[] = {0,1,3,7};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+	int group_marginal[] = {1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	set_tgt_node_name(p8, node_name, 8);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
+}
+
+static void test_group_by_node_name_2_groups_half_marginal8(void **state)
+{
+	char *node_name[] = {"a", "a", "b", "a", "b", "b", "b", "a"};
+	int prio[] = {4,1,2,1,2,2,2,1};
+	int marginal[] = {1,0,1,1,0,1,0,0};
+	int group0[] = {4,6};
+	int group1[] = {1,7};
+	int group2[] = {0,3};
+	int group3[] = {2,5};
+	int *groups[] = {group0, group1, group2, group3};
+	int group_size[] = {2,2,2,2};
+	int group_marginal[] = {0,0,1,1};
+
+	set_priority(p8, prio, 8);
+	set_marginal(p8, marginal, 8);
+	set_tgt_node_name(p8, node_name, 8);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 4);
 }
 
 static void test_group_by_serial_same8(void **state)
@@ -577,7 +778,7 @@ static void test_group_by_serial_same8(void **state)
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_serial_increasing8(void **state)
@@ -593,7 +794,7 @@ static void test_group_by_serial_increasing8(void **state)
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
 }
 
 static void test_group_by_serial_3_groups8(void **state)
@@ -610,7 +811,7 @@ static void test_group_by_serial_3_groups8(void **state)
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 3);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 3);
 }
 
 static void test_group_by_serial_2_groups8(void **state)
@@ -626,7 +827,7 @@ static void test_group_by_serial_2_groups8(void **state)
 	set_serial(p8, serial, 8);
 	mp8.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp8), 0);
-	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_serial_3_groups4(void **state)
@@ -643,7 +844,7 @@ static void test_group_by_serial_3_groups4(void **state)
 	set_serial(p4, serial, 4);
 	mp4.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 3);
 }
 
 static void test_group_by_serial_2_groups4(void **state)
@@ -659,7 +860,7 @@ static void test_group_by_serial_2_groups4(void **state)
 	set_serial(p4, serial, 4);
 	mp4.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp4), 0);
-	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
 }
 
 static void test_group_by_serial1(void **state)
@@ -672,21 +873,61 @@ static void test_group_by_serial1(void **state)
 	set_serial(p1, serial, 1);
 	mp1.pgpolicyfn = group_by_serial;
         assert_int_equal(group_paths(&mp1), 0);
-        verify_pathgroups(&mp1, p1, groups, group_size, 1);
+        verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
 }
 
 static void test_group_by_serial0(void **state)
 {
 	mp0.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp0), 0);
-	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_serial_null(void **state)
 {
 	mp_null.pgpolicyfn = group_by_serial;
 	assert_int_equal(group_paths(&mp_null), 0);
-	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_serial_2_groups8_all_marginal8(void **state)
+{
+	char *serial[] = {"1", "2", "1", "1", "2", "2", "1", "2"};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int prio[] = {3,2,2,1,2,2,1,2};
+	int group0[] = {1,4,5,7};
+	int group1[] = {0,2,3,6};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+	int group_marginal[] = {1,1};
+
+	set_priority(p8, prio, 8);
+	set_serial(p8, serial, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 2);
+}
+
+static void test_group_by_serial_2_groups8_half_marginal8(void **state)
+{
+	char *serial[] = {"1", "2", "1", "1", "2", "2", "1", "2"};
+	int marginal[] = {0,0,1,1,1,1,0,0};
+	int prio[] = {3,2,2,1,2,2,1,2};
+	int group0[] = {0,6};
+	int group1[] = {1,7};
+	int group2[] = {4,5};
+	int group3[] = {2,3};
+	int *groups[] = {group0, group1, group2, group3};
+	int group_size[] = {2,2,2,2};
+	int group_marginal[] = {0,0,1,1};
+
+	set_priority(p8, prio, 8);
+	set_serial(p8, serial, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 4);
 }
 
 #define setup_test(name, nr) \
@@ -700,6 +941,9 @@ int test_pgpolicies(void)
 		setup_test(test_one_group, 1),
 		setup_test(test_one_group, 0),
 		setup_test(test_one_group, _null),
+		setup_test(test_one_group_all_marginal, 8),
+		setup_test(test_one_group_half_marginal, 8),
+		setup_test(test_one_group_one_marginal, 8),
 		setup_test(test_one_path_per_group_same, 8),
 		setup_test(test_one_path_per_group_increasing, 8),
 		setup_test(test_one_path_per_group_decreasing, 8),
@@ -708,6 +952,8 @@ int test_pgpolicies(void)
 		setup_test(test_one_path_per_group, 1),
 		setup_test(test_one_path_per_group, 0),
 		setup_test(test_one_path_per_group, _null),
+		setup_test(test_one_path_per_group_mixed_all_marginal, 8),
+		setup_test(test_one_path_per_group_mixed_half_marginal, 8),
 		setup_test(test_group_by_prio_same, 8),
 		setup_test(test_group_by_prio_increasing, 8),
 		setup_test(test_group_by_prio_decreasing, 8),
@@ -718,6 +964,9 @@ int test_pgpolicies(void)
 		setup_test(test_group_by_prio, 1),
 		setup_test(test_group_by_prio, 0),
 		setup_test(test_group_by_prio, _null),
+		setup_test(test_group_by_prio_mixed_all_marginal, 8),
+		setup_test(test_group_by_prio_mixed_half_marginal, 8),
+		setup_test(test_group_by_prio_mixed_one_marginal, 8),
 		setup_test(test_group_by_node_name_same, 8),
 		setup_test(test_group_by_node_name_increasing, 8),
 		setup_test(test_group_by_node_name_3_groups, 8),
@@ -727,6 +976,8 @@ int test_pgpolicies(void)
 		setup_test(test_group_by_node_name, 1),
 		setup_test(test_group_by_node_name, 0),
 		setup_test(test_group_by_node_name, _null),
+		setup_test(test_group_by_node_name_2_groups_all_marginal, 8),
+		setup_test(test_group_by_node_name_2_groups_half_marginal, 8),
 		setup_test(test_group_by_serial_same, 8),
 		setup_test(test_group_by_serial_increasing, 8),
 		setup_test(test_group_by_serial_3_groups, 8),
@@ -736,6 +987,8 @@ int test_pgpolicies(void)
 		setup_test(test_group_by_serial, 1),
 		setup_test(test_group_by_serial, 0),
 		setup_test(test_group_by_serial, _null),
+		setup_test(test_group_by_serial_2_groups8_all_marginal, 8),
+		setup_test(test_group_by_serial_2_groups8_half_marginal, 8),
 	};
 	return cmocka_run_group_tests(tests, setup, NULL);
 }
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
