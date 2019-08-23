Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B06829B5C3
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E535410F23F0;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BABA25D713;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A5A124F68;
	Fri, 23 Aug 2019 17:49:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnBsH010201 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B74565C3FA; Fri, 23 Aug 2019 17:49:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFCF55C28C;
	Fri, 23 Aug 2019 17:49:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHn8Ni006041; 
	Fri, 23 Aug 2019 12:49:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHn8uT006040;
	Fri, 23 Aug 2019 12:49:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:49 -0500
Message-Id: <1566582538-5979-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 05/14] tests: update pgpolicy tests to work
	with group_paths()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Fri, 23 Aug 2019 17:49:28 +0000 (UTC)

The pgpolicy unit tests now work again, using group_paths().
test_one_group0(), which was skipped with the old path grouping code
because it failed, is now working correctly.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/pgpolicy.c | 125 +++++++++++++++++++++++++++++++----------------
 1 file changed, 83 insertions(+), 42 deletions(-)

diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
index fbb8589e..04a77c4c 100644
--- a/tests/pgpolicy.c
+++ b/tests/pgpolicy.c
@@ -92,6 +92,7 @@ static int setupX(struct multipath *mp, struct path *pp, int size)
 		vector_set_slot(mp->paths, &pp[i]);
 	}
 	set_priority(pp, prio, size);
+	mp->pgpolicyfn = NULL;
 	return 0;
 }
 
@@ -187,7 +188,8 @@ static void test_one_group8(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {8};
 
-	assert_int_equal(one_group(&mp8), 0);
+	mp8.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 1);
 }
 
@@ -197,7 +199,8 @@ static void test_one_group4(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {4};
 
-	assert_int_equal(one_group(&mp4), 0);
+	mp4.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 1);
 }
 
@@ -207,20 +210,22 @@ static void test_one_group1(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {1};
 
-	assert_int_equal(one_group(&mp1), 0);
+	mp1.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp1), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, 1);
 }
 
 static void test_one_group0(void **state)
 {
-	assert_int_equal(one_group(&mp0), 0);
-	skip(); /* BROKEN */
+	mp0.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
 }
 
 static void test_one_group_null(void **state)
 {
-	assert_int_equal(one_group(&mp_null), 0);
+	mp_null.pgpolicyfn = one_group;
+	assert_int_equal(group_paths(&mp_null), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
 }
 
@@ -231,7 +236,8 @@ static void test_one_path_per_group_same8(void **state)
 			  &paths[4], &paths[5], &paths[6], &paths[7]};
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
-	assert_int_equal(one_path_per_group(&mp8), 0);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -244,7 +250,8 @@ static void test_one_path_per_group_increasing8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(one_path_per_group(&mp8), 0);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -257,7 +264,8 @@ static void test_one_path_per_group_decreasing8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(one_path_per_group(&mp8), 0);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -270,7 +278,8 @@ static void test_one_path_per_group_mixed8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(one_path_per_group(&mp8), 0);
+	mp8.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -280,7 +289,8 @@ static void test_one_path_per_group4(void **state)
 	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3]};
 	int group_size[] = {1,1,1,1};
 
-	assert_int_equal(one_path_per_group(&mp4), 0);
+	mp4.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 4);
 }
 
@@ -290,19 +300,22 @@ static void test_one_path_per_group1(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {1};
 
-	assert_int_equal(one_path_per_group(&mp1), 0);
+	mp1.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp1), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, 1);
 }
 
 static void test_one_path_per_group0(void **state)
 {
-	assert_int_equal(one_path_per_group(&mp0), 0);
+	mp0.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
 }
 
 static void test_one_path_per_group_null(void **state)
 {
-	assert_int_equal(one_path_per_group(&mp_null), 0);
+	mp_null.pgpolicyfn = one_path_per_group;
+	assert_int_equal(group_paths(&mp_null), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
 }
 
@@ -312,7 +325,8 @@ static void test_group_by_prio_same8(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {8};
 
-	assert_int_equal(group_by_prio(&mp8), 0);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 1);
 }
 
@@ -325,7 +339,8 @@ static void test_group_by_prio_increasing8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(group_by_prio(&mp8), 0);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -338,7 +353,8 @@ static void test_group_by_prio_decreasing8(void **state)
 	int group_size[] = {1,1,1,1,1,1,1,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(group_by_prio(&mp8), 0);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -356,7 +372,8 @@ static void test_group_by_prio_mixed8(void **state)
 	int group_size[] = {1,1,1,2,2,1};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(group_by_prio(&mp8), 0);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 6);
 }
 
@@ -369,7 +386,8 @@ static void test_group_by_prio_2_groups8(void **state)
 	int group_size[] = {4,4};
 
 	set_priority(p8, prio, 8);
-	assert_int_equal(group_by_prio(&mp8), 0);
+	mp8.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 2);
 }
 
@@ -383,7 +401,8 @@ static void test_group_by_prio_mixed4(void **state)
 	int group_size[] = {2,1,1};
 
 	set_priority(p4, prio, 4);
-	assert_int_equal(group_by_prio(&mp4), 0);
+	mp4.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 3);
 }
 
@@ -396,7 +415,8 @@ static void test_group_by_prio_2_groups4(void **state)
 	int group_size[] = {2,2};
 
 	set_priority(p4, prio, 4);
-	assert_int_equal(group_by_prio(&mp4), 0);
+	mp4.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 2);
 }
 
@@ -406,19 +426,22 @@ static void test_group_by_prio1(void **state)
 	int *groups[] = {paths};
 	int group_size[] = {1};
 
-	assert_int_equal(group_by_prio(&mp1), 0);
+	mp1.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp1), 0);
 	verify_pathgroups(&mp1, p1, groups, group_size, 1);
 }
 
 static void test_group_by_prio0(void **state)
 {
-	assert_int_equal(group_by_prio(&mp0), 0);
+	mp0.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_prio_null(void **state)
 {
-	assert_int_equal(group_by_prio(&mp_null), 0);
+	mp_null.pgpolicyfn = group_by_prio;
+	assert_int_equal(group_paths(&mp_null), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
 }
 
@@ -430,7 +453,8 @@ static void test_group_by_node_name_same8(void **state)
 	int group_size[] = {8};
 
 	set_tgt_node_name(p8, node_name, 8);
-	assert_int_equal(group_by_node_name(&mp8), 0);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 1);
 }
 
@@ -445,7 +469,8 @@ static void test_group_by_node_name_increasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
-	assert_int_equal(group_by_node_name(&mp8), 0);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -461,7 +486,8 @@ static void test_group_by_node_name_3_groups8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
-	assert_int_equal(group_by_node_name(&mp8), 0);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 3);
 }
 
@@ -476,7 +502,8 @@ static void test_group_by_node_name_2_groups8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_tgt_node_name(p8, node_name, 8);
-	assert_int_equal(group_by_node_name(&mp8), 0);
+	mp8.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 2);
 }
 
@@ -492,7 +519,8 @@ static void test_group_by_node_name_3_groups4(void **state)
 
 	set_priority(p4, prio, 4);
 	set_tgt_node_name(p4, node_name, 4);
-	assert_int_equal(group_by_node_name(&mp4), 0);
+	mp4.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 3);
 }
 
@@ -507,7 +535,8 @@ static void test_group_by_node_name_2_groups4(void **state)
 
 	set_priority(p4, prio, 4);
 	set_tgt_node_name(p4, node_name, 4);
-	assert_int_equal(group_by_node_name(&mp4), 0);
+	mp4.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 2);
 }
 
@@ -519,19 +548,22 @@ static void test_group_by_node_name1(void **state)
         int group_size[] = {1};
 
 	set_tgt_node_name(p1, node_name, 1);
-        assert_int_equal(group_by_node_name(&mp1), 0);
+	mp1.pgpolicyfn = group_by_node_name;
+        assert_int_equal(group_paths(&mp1), 0);
         verify_pathgroups(&mp1, p1, groups, group_size, 1);
 }
 
 static void test_group_by_node_name0(void **state)
 {
-	assert_int_equal(group_by_node_name(&mp0), 0);
+	mp0.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_node_name_null(void **state)
 {
-	assert_int_equal(group_by_node_name(&mp_null), 0);
+	mp_null.pgpolicyfn = group_by_node_name;
+	assert_int_equal(group_paths(&mp_null), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
 }
 
@@ -543,7 +575,8 @@ static void test_group_by_serial_same8(void **state)
 	int group_size[] = {8};
 
 	set_serial(p8, serial, 8);
-	assert_int_equal(group_by_serial(&mp8), 0);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 1);
 }
 
@@ -558,7 +591,8 @@ static void test_group_by_serial_increasing8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
-	assert_int_equal(group_by_serial(&mp8), 0);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 8);
 }
 
@@ -574,7 +608,8 @@ static void test_group_by_serial_3_groups8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
-	assert_int_equal(group_by_serial(&mp8), 0);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 3);
 }
 
@@ -589,7 +624,8 @@ static void test_group_by_serial_2_groups8(void **state)
 
 	set_priority(p8, prio, 8);
 	set_serial(p8, serial, 8);
-	assert_int_equal(group_by_serial(&mp8), 0);
+	mp8.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp8), 0);
 	verify_pathgroups(&mp8, p8, groups, group_size, 2);
 }
 
@@ -605,7 +641,8 @@ static void test_group_by_serial_3_groups4(void **state)
 
 	set_priority(p4, prio, 4);
 	set_serial(p4, serial, 4);
-	assert_int_equal(group_by_serial(&mp4), 0);
+	mp4.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 3);
 }
 
@@ -620,7 +657,8 @@ static void test_group_by_serial_2_groups4(void **state)
 
 	set_priority(p4, prio, 4);
 	set_serial(p4, serial, 4);
-	assert_int_equal(group_by_serial(&mp4), 0);
+	mp4.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp4), 0);
 	verify_pathgroups(&mp4, p4, groups, group_size, 2);
 }
 
@@ -632,19 +670,22 @@ static void test_group_by_serial1(void **state)
         int group_size[1] = {1};
 
 	set_serial(p1, serial, 1);
-        assert_int_equal(group_by_serial(&mp1), 0);
+	mp1.pgpolicyfn = group_by_serial;
+        assert_int_equal(group_paths(&mp1), 0);
         verify_pathgroups(&mp1, p1, groups, group_size, 1);
 }
 
 static void test_group_by_serial0(void **state)
 {
-	assert_int_equal(group_by_serial(&mp0), 0);
+	mp0.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp0), 0);
 	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
 }
 
 static void test_group_by_serial_null(void **state)
 {
-	assert_int_equal(group_by_serial(&mp_null), 0);
+	mp_null.pgpolicyfn = group_by_serial;
+	assert_int_equal(group_paths(&mp_null), 0);
 	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
