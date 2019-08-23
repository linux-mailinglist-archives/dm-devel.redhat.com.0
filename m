Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A246A9B5C9
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC32830A5A54;
	Fri, 23 Aug 2019 17:49:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C45BC1001B28;
	Fri, 23 Aug 2019 17:49:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65DE624F33;
	Fri, 23 Aug 2019 17:49:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnB40010196 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B9AE5D9CA; Fri, 23 Aug 2019 17:49:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12695D9E5;
	Fri, 23 Aug 2019 17:49:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHn5UN006032; 
	Fri, 23 Aug 2019 12:49:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHn57T006031;
	Fri, 23 Aug 2019 12:49:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:47 -0500
Message-Id: <1566582538-5979-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 03/14] tests: add path grouping policy unit
	tests.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 23 Aug 2019 17:49:33 +0000 (UTC)

In preparation for changing the path grouping code, add some unit tests
to verify that it works correctly. The only test that currently fails
(and so it being skipped) is using MULTIBUS when mp->paths is empty. All
the other path grouping policies free mp->paths, even if it is empty.
one_group() should as well. This will be fixed when the path grouping
code is updated.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/Makefile   |   2 +-
 tests/pgpolicy.c | 708 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 709 insertions(+), 1 deletion(-)
 create mode 100644 tests/pgpolicy.c

diff --git a/tests/Makefile b/tests/Makefile
index bf159b2d..a5cdf390 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -3,7 +3,7 @@ include ../Makefile.inc
 CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
 LIBDEPS += -L$(multipathdir) -lmultipath -lcmocka
 
-TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd
+TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy
 
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
new file mode 100644
index 00000000..fbb8589e
--- /dev/null
+++ b/tests/pgpolicy.c
@@ -0,0 +1,708 @@
+/*
+ * Copyright (c) 2018 Benjamin Marzinski, Redhat
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ *
+ */
+
+#include <stdint.h>
+#include <stdbool.h>
+#include <stdarg.h>
+#include <stddef.h>
+#include <setjmp.h>
+#include <stdlib.h>
+#include <cmocka.h>
+
+#include "globals.c"
+#include "pgpolicies.h"
+
+struct multipath mp8, mp4, mp1, mp0, mp_null;
+struct path p8[8], p4[4], p1[1];
+
+
+static void set_priority(struct path *pp, int *prio, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		pp[i].priority = prio[i];
+	}
+}
+
+static void set_tgt_node_name(struct path *pp, char **tgt_node_name, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		strcpy(pp[i].tgt_node_name, tgt_node_name[i]);
+	}
+}
+
+static void set_serial(struct path *pp, char **serial, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		strcpy(pp[i].serial, serial[i]);
+	}
+}
+
+static int setup(void **state)
+{
+	int i;
+
+	for (i = 0; i < 8; i++) {
+		sprintf(p8[i].dev, "p8_%d", i);
+		sprintf(p8[i].dev_t, "8:%d", i);
+		p8[i].state = PATH_UP;
+	}
+	for (i = 0; i < 4; i++) {
+		sprintf(p4[i].dev, "p4_%d", i);
+		sprintf(p4[i].dev_t, "4:%d", i);
+		p4[i].state = PATH_UP;
+	}
+	sprintf(p1[0].dev, "p1_0");
+	sprintf(p1[0].dev_t, "4:0");
+	p1[0].state = PATH_UP;
+	return 0;
+}
+
+static int setupX(struct multipath *mp, struct path *pp, int size)
+{
+	int i;
+	int prio[8] = {10, 10, 10, 10, 10, 10, 10, 10};
+
+	mp->paths = vector_alloc();
+	if (!mp->paths)
+		return -1;
+	for (i = 0; i < size; i++) {
+		if (!vector_alloc_slot(mp->paths))
+			return -1;
+		vector_set_slot(mp->paths, &pp[i]);
+	}
+	set_priority(pp, prio, size);
+	return 0;
+}
+
+static int setup8(void **state)
+{
+	return setupX(&mp8, p8, 8);
+}
+
+static int setup4(void **state)
+{
+	return setupX(&mp4, p4, 4);
+}
+
+static int setup1(void **state)
+{
+	return setupX(&mp1, p1, 1);
+}
+
+static int setup0(void **state)
+{
+	return setupX(&mp0, NULL, 0);
+}
+
+static int setup_null(void **state)
+{
+	return 0;
+}
+
+static int teardownX(struct multipath *mp)
+{
+	free_pgvec(mp->pg, KEEP_PATHS);
+	mp->pg = NULL;
+	return 0;
+}
+
+static int teardown8(void **state)
+{
+	return teardownX(&mp8);
+}
+
+static int teardown4(void **state)
+{
+	return teardownX(&mp4);
+}
+
+static int teardown1(void **state)
+{
+	return teardownX(&mp1);
+}
+
+static int teardown0(void **state)
+{
+	return teardownX(&mp0);
+}
+
+static int teardown_null(void **state)
+{
+	return teardownX(&mp_null);
+}
+
+static void
+verify_pathgroups(struct multipath *mp, struct path *pp, int **groups,
+		  int *group_size, int size)
+{
+	int i, j;
+	struct pathgroup *pgp;
+
+	assert_null(mp->paths);
+	assert_non_null(mp->pg);
+	assert_int_equal(VECTOR_SIZE(mp->pg), size);
+	for (i = 0; i < size; i++) {
+		pgp = VECTOR_SLOT(mp->pg, i);
+		assert_non_null(pgp);
+		assert_non_null(pgp->paths);
+		assert_int_equal(VECTOR_SIZE(pgp->paths), group_size[i]);
+		for (j = 0; j < group_size[i]; j++) {
+			int path_nr = groups[i][j];
+			struct path *pgp_path = VECTOR_SLOT(pgp->paths, j);
+			struct path *pp_path = &pp[path_nr];
+			/* Test names instead of pointers to get a more
+			 * useful error message */
+			assert_string_equal(pgp_path->dev, pp_path->dev);
+			/* This test is just a backkup in case the
+			 * something wenth wrong naming the paths */
+			assert_ptr_equal(pgp_path, pp_path);
+		}
+	}
+}
+
+static void test_one_group8(void **state)
+{
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	assert_int_equal(one_group(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+}
+
+static void test_one_group4(void **state)
+{
+	int paths[] = {0,1,2,3};
+	int *groups[] = {paths};
+	int group_size[] = {4};
+
+	assert_int_equal(one_group(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 1);
+}
+
+static void test_one_group1(void **state)
+{
+	int paths[] = {0};
+	int *groups[] = {paths};
+	int group_size[] = {1};
+
+	assert_int_equal(one_group(&mp1), 0);
+	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+}
+
+static void test_one_group0(void **state)
+{
+	assert_int_equal(one_group(&mp0), 0);
+	skip(); /* BROKEN */
+	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+}
+
+static void test_one_group_null(void **state)
+{
+	assert_int_equal(one_group(&mp_null), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+}
+
+static void test_one_path_per_group_same8(void **state)
+{
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	assert_int_equal(one_path_per_group(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_one_path_per_group_increasing8(void **state)
+{
+	int prio[] = {1,2,3,4,5,6,7,8};
+	int paths[] = {7,6,5,4,3,2,1,0};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(one_path_per_group(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_one_path_per_group_decreasing8(void **state)
+{
+	int prio[] = {8,7,6,5,4,3,2,1};
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(one_path_per_group(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_one_path_per_group_mixed8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int paths[] = {6,0,4,2,3,5,7,1};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(one_path_per_group(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_one_path_per_group4(void **state)
+{
+	int paths[] = {0,1,2,3};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3]};
+	int group_size[] = {1,1,1,1};
+
+	assert_int_equal(one_path_per_group(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 4);
+}
+
+static void test_one_path_per_group1(void **state)
+{
+	int paths[] = {0};
+	int *groups[] = {paths};
+	int group_size[] = {1};
+
+	assert_int_equal(one_path_per_group(&mp1), 0);
+	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+}
+
+static void test_one_path_per_group0(void **state)
+{
+	assert_int_equal(one_path_per_group(&mp0), 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+}
+
+static void test_one_path_per_group_null(void **state)
+{
+	assert_int_equal(one_path_per_group(&mp_null), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_prio_same8(void **state)
+{
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	assert_int_equal(group_by_prio(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+}
+
+static void test_group_by_prio_increasing8(void **state)
+{
+	int prio[] = {1,2,3,4,5,6,7,8};
+	int paths[] = {7,6,5,4,3,2,1,0};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(group_by_prio(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_group_by_prio_decreasing8(void **state)
+{
+	int prio[] = {8,7,6,5,4,3,2,1};
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(group_by_prio(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_group_by_prio_mixed8(void **state)
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
+	assert_int_equal(group_by_prio(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 6);
+}
+
+static void test_group_by_prio_2_groups8(void **state)
+{
+	int prio[] = {1,2,2,1,2,1,1,2};
+	int group0[] = {1,2,4,7};
+	int group1[] = {0,3,5,6};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+
+	set_priority(p8, prio, 8);
+	assert_int_equal(group_by_prio(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+}
+
+static void test_group_by_prio_mixed4(void **state)
+{
+	int prio[] = {2,3,1,3};
+	int group0[] = {1,3};
+	int group1[] = {0};
+	int group2[] = {2};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {2,1,1};
+
+	set_priority(p4, prio, 4);
+	assert_int_equal(group_by_prio(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+}
+
+static void test_group_by_prio_2_groups4(void **state)
+{
+	int prio[] = {2,1,1,2};
+	int group0[] = {0,3};
+	int group1[] = {1,2};
+	int *groups[] = {group0, group1};
+	int group_size[] = {2,2};
+
+	set_priority(p4, prio, 4);
+	assert_int_equal(group_by_prio(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+}
+
+static void test_group_by_prio1(void **state)
+{
+	int paths[] = {0};
+	int *groups[] = {paths};
+	int group_size[] = {1};
+
+	assert_int_equal(group_by_prio(&mp1), 0);
+	verify_pathgroups(&mp1, p1, groups, group_size, 1);
+}
+
+static void test_group_by_prio0(void **state)
+{
+	assert_int_equal(group_by_prio(&mp0), 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_prio_null(void **state)
+{
+	assert_int_equal(group_by_prio(&mp_null), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_node_name_same8(void **state)
+{
+	char *node_name[] = {"a","a","a","a","a","a","a","a"};
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	set_tgt_node_name(p8, node_name, 8);
+	assert_int_equal(group_by_node_name(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+}
+
+static void test_group_by_node_name_increasing8(void **state)
+{
+	char *node_name[] = {"a","b","c","d","e","f","g","h"};
+	int prio[] = {1,2,3,4,5,6,7,8};
+	int paths[] = {7,6,5,4,3,2,1,0};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_tgt_node_name(p8, node_name, 8);
+	assert_int_equal(group_by_node_name(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_group_by_node_name_3_groups8(void **state)
+{
+	char *node_name[] = {"a","b","a","c","b","c","c","a"};
+	int prio[] = {4,1,4,1,1,1,1,4};
+	int group0[] = {0,2,7};
+	int group1[] = {3,5,6};
+	int group2[] = {1,4};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {3,3,2};
+
+	set_priority(p8, prio, 8);
+	set_tgt_node_name(p8, node_name, 8);
+	assert_int_equal(group_by_node_name(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 3);
+}
+
+static void test_group_by_node_name_2_groups8(void **state)
+{
+	char *node_name[] = {"a", "a", "b", "a", "b", "b", "b", "a"};
+	int prio[] = {4,1,2,1,2,2,2,1};
+	int group0[] = {2,4,5,6};
+	int group1[] = {0,1,3,7};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+
+	set_priority(p8, prio, 8);
+	set_tgt_node_name(p8, node_name, 8);
+	assert_int_equal(group_by_node_name(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+}
+
+static void test_group_by_node_name_3_groups4(void **state)
+{
+	char *node_name[] = {"a","b","c","a"};
+	int prio[] = {3,1,3,1};
+	int group0[] = {2};
+	int group1[] = {0,3};
+	int group2[] = {1};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {1,2,1};
+
+	set_priority(p4, prio, 4);
+	set_tgt_node_name(p4, node_name, 4);
+	assert_int_equal(group_by_node_name(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+}
+
+static void test_group_by_node_name_2_groups4(void **state)
+{
+	char *node_name[] = {"a","b","b","a"};
+	int prio[] = {2,1,1,2};
+	int group0[] = {0,3};
+	int group1[] = {1,2};
+	int *groups[] = {group0, group1};
+	int group_size[] = {2,2};
+
+	set_priority(p4, prio, 4);
+	set_tgt_node_name(p4, node_name, 4);
+	assert_int_equal(group_by_node_name(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+}
+
+static void test_group_by_node_name1(void **state)
+{
+	char *node_name[] = {"a"};
+        int paths[] = {0};
+        int *groups[] = {paths};
+        int group_size[] = {1};
+
+	set_tgt_node_name(p1, node_name, 1);
+        assert_int_equal(group_by_node_name(&mp1), 0);
+        verify_pathgroups(&mp1, p1, groups, group_size, 1);
+}
+
+static void test_group_by_node_name0(void **state)
+{
+	assert_int_equal(group_by_node_name(&mp0), 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_node_name_null(void **state)
+{
+	assert_int_equal(group_by_node_name(&mp_null), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_serial_same8(void **state)
+{
+	char *serial[] = {"1","1","1","1","1","1","1","1"};
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	set_serial(p8, serial, 8);
+	assert_int_equal(group_by_serial(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 1);
+}
+
+static void test_group_by_serial_increasing8(void **state)
+{
+	char *serial[] = {"1","2","3","4","5","6","7","8"};
+	int prio[] = {1,2,3,4,5,6,7,8};
+	int paths[] = {7,6,5,4,3,2,1,0};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_serial(p8, serial, 8);
+	assert_int_equal(group_by_serial(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 8);
+}
+
+static void test_group_by_serial_3_groups8(void **state)
+{
+	char *serial[] = {"1","2","1","3","2","3","2","1"};
+	int prio[] = {4,1,4,3,1,3,1,4};
+	int group0[] = {0,2,7};
+	int group1[] = {3,5};
+	int group2[] = {1,4,6};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {3,2,3};
+
+	set_priority(p8, prio, 8);
+	set_serial(p8, serial, 8);
+	assert_int_equal(group_by_serial(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 3);
+}
+
+static void test_group_by_serial_2_groups8(void **state)
+{
+	char *serial[] = {"1", "2", "1", "1", "2", "2", "1", "2"};
+	int prio[] = {3,2,2,1,2,2,1,2};
+	int group0[] = {1,4,5,7};
+	int group1[] = {0,2,3,6};
+	int *groups[] = {group0, group1};
+	int group_size[] = {4,4};
+
+	set_priority(p8, prio, 8);
+	set_serial(p8, serial, 8);
+	assert_int_equal(group_by_serial(&mp8), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, 2);
+}
+
+static void test_group_by_serial_3_groups4(void **state)
+{
+	char *serial[] = {"1","2","3","2"};
+	int prio[] = {3,1,3,1};
+	int group0[] = {0};
+	int group1[] = {2};
+	int group2[] = {1,3};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {1,1,2};
+
+	set_priority(p4, prio, 4);
+	set_serial(p4, serial, 4);
+	assert_int_equal(group_by_serial(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 3);
+}
+
+static void test_group_by_serial_2_groups4(void **state)
+{
+	char *serial[] = {"1","2","1","2"};
+	int prio[] = {3,1,3,1};
+	int group0[] = {0,2};
+	int group1[] = {1,3};
+	int *groups[] = {group0, group1};
+	int group_size[] = {2,2};
+
+	set_priority(p4, prio, 4);
+	set_serial(p4, serial, 4);
+	assert_int_equal(group_by_serial(&mp4), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, 2);
+}
+
+static void test_group_by_serial1(void **state)
+{
+	char *serial[1] = {"1"};
+        int paths[1] = {0};
+        int *groups[1] = {paths};
+        int group_size[1] = {1};
+
+	set_serial(p1, serial, 1);
+        assert_int_equal(group_by_serial(&mp1), 0);
+        verify_pathgroups(&mp1, p1, groups, group_size, 1);
+}
+
+static void test_group_by_serial0(void **state)
+{
+	assert_int_equal(group_by_serial(&mp0), 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_serial_null(void **state)
+{
+	assert_int_equal(group_by_serial(&mp_null), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, 0);
+}
+
+#define setup_test(name, nr) \
+cmocka_unit_test_setup_teardown(name ## nr, setup ## nr, teardown ## nr)
+
+int test_pgpolicies(void)
+{
+	const struct CMUnitTest tests[] = {
+		setup_test(test_one_group, 8),
+		setup_test(test_one_group, 4),
+		setup_test(test_one_group, 1),
+		setup_test(test_one_group, 0),
+		setup_test(test_one_group, _null),
+		setup_test(test_one_path_per_group_same, 8),
+		setup_test(test_one_path_per_group_increasing, 8),
+		setup_test(test_one_path_per_group_decreasing, 8),
+		setup_test(test_one_path_per_group_mixed, 8),
+		setup_test(test_one_path_per_group, 4),
+		setup_test(test_one_path_per_group, 1),
+		setup_test(test_one_path_per_group, 0),
+		setup_test(test_one_path_per_group, _null),
+		setup_test(test_group_by_prio_same, 8),
+		setup_test(test_group_by_prio_increasing, 8),
+		setup_test(test_group_by_prio_decreasing, 8),
+		setup_test(test_group_by_prio_mixed, 8),
+		setup_test(test_group_by_prio_2_groups, 8),
+		setup_test(test_group_by_prio_mixed, 4),
+		setup_test(test_group_by_prio_2_groups, 4),
+		setup_test(test_group_by_prio, 1),
+		setup_test(test_group_by_prio, 0),
+		setup_test(test_group_by_prio, _null),
+		setup_test(test_group_by_node_name_same, 8),
+		setup_test(test_group_by_node_name_increasing, 8),
+		setup_test(test_group_by_node_name_3_groups, 8),
+		setup_test(test_group_by_node_name_2_groups, 8),
+		setup_test(test_group_by_node_name_3_groups, 4),
+		setup_test(test_group_by_node_name_2_groups, 4),
+		setup_test(test_group_by_node_name, 1),
+		setup_test(test_group_by_node_name, 0),
+		setup_test(test_group_by_node_name, _null),
+		setup_test(test_group_by_serial_same, 8),
+		setup_test(test_group_by_serial_increasing, 8),
+		setup_test(test_group_by_serial_3_groups, 8),
+		setup_test(test_group_by_serial_2_groups, 8),
+		setup_test(test_group_by_serial_3_groups, 4),
+		setup_test(test_group_by_serial_2_groups, 4),
+		setup_test(test_group_by_serial, 1),
+		setup_test(test_group_by_serial, 0),
+		setup_test(test_group_by_serial, _null),
+	};
+	return cmocka_run_group_tests(tests, setup, NULL);
+}
+
+int main(void)
+{
+	int ret = 0;
+
+	ret += test_pgpolicies();
+	return ret;
+}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
