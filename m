Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C1726E16
	for <lists+dm-devel@lfdr.de>; Wed,  7 Jun 2023 22:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686170891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eE9IhHIKfxtCBopgJJ3wlXwDUkFjvyoBMRSnZqdzDM4=;
	b=ghzpev7KCrRm42XS+Uk9ShpNJvQW8+ecU5kE8+SxOscr59fw3bD9jWfNPeOmwwtgcNqbY8
	321mexYqu3UGyVKi6wnTV/npWUmWy9V1GhuZKUnlnECfda0SRcKl5OMfbgYFRQbtrS4vBk
	Rm0vAHvgfDGKy2jdt/LPgcfr+fGoP6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-iQC2IHIHOKa9bxkHEyHd4Q-1; Wed, 07 Jun 2023 16:48:07 -0400
X-MC-Unique: iQC2IHIHOKa9bxkHEyHd4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E589296A61D;
	Wed,  7 Jun 2023 20:48:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 282BB40CFD46;
	Wed,  7 Jun 2023 20:48:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC43C19451C9;
	Wed,  7 Jun 2023 20:48:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FF6019465BA
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Jun 2023 20:48:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71B292166B26; Wed,  7 Jun 2023 20:48:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6B32166B25;
 Wed,  7 Jun 2023 20:48:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 357KlxMp005809;
 Wed, 7 Jun 2023 15:47:59 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 357KlxwP005808;
 Wed, 7 Jun 2023 15:47:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  7 Jun 2023 15:47:46 -0500
Message-Id: <1686170873-5754-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1686170873-5754-1-git-send-email-bmarzins@redhat.com>
References: <1686170873-5754-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH V3 04/11] multipath-tools tests: add tests for
 group_by_tpg policy
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/pgpolicy.c | 201 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/tests/pgpolicy.c b/tests/pgpolicy.c
index 43be831f..85fa30ce 100644
--- a/tests/pgpolicy.c
+++ b/tests/pgpolicy.c
@@ -32,6 +32,15 @@ struct multipath mp8, mp4, mp1, mp0, mp_null;
 struct path p8[8], p4[4], p1[1];
 
 
+static void set_tpg(struct path *pp, int *tpg, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		pp[i].tpg_id = tpg[i];
+	}
+}
+
 static void set_priority(struct path *pp, int *prio, int size)
 {
 	int i;
@@ -639,6 +648,187 @@ static void test_group_by_prio_mixed_one_marginal8(void **state)
 	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
 }
 
+static void test_group_by_tpg_same8(void **state)
+{
+	int paths[] = {0,1,2,3,4,5,6,7};
+	int *groups[] = {paths};
+	int group_size[] = {8};
+
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 1);
+}
+
+static void test_group_by_tpg_different8(void **state)
+{
+	int prio[] = {1,2,3,4,5,6,7,8};
+	int tpg[] = {3,5,4,1,8,6,7,2};
+	int paths[] = {7,6,5,4,3,2,1,0};
+	int *groups[] = {&paths[0], &paths[1], &paths[2], &paths[3],
+			  &paths[4], &paths[5], &paths[6], &paths[7]};
+	int group_size[] = {1,1,1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_tpg(p8, tpg, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 8);
+}
+
+static void test_group_by_tpg_mixed8(void **state)
+{
+	int prio[] = {7,2,3,3,5,2,8,2};
+	int tpg[] = {1,2,3,3,4,2,5,6};
+	int group0[] = {6};
+	int group1[] = {0};
+	int group2[] = {4};
+	int group3[] = {2,3};
+	int group4[] = {1,5};
+	int group5[] = {7};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5};
+	int group_size[] = {1,1,1,2,2,1};
+
+	set_priority(p8, prio, 8);
+	set_tpg(p8, tpg, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 6);
+}
+
+static void test_group_by_tpg_3_groups8(void **state)
+{
+	int prio[] = {1,2,2,1,2,1,1,2};
+	int tpg[] = {1,2,2,1,3,1,1,3};
+	int group0[] = {1,2};
+	int group1[] = {4,7};
+	int group2[] = {0,3,5,6};
+	int *groups[] = {group0, group1, group2};
+	int group_size[] = {2,2,4};
+
+	set_priority(p8, prio, 8);
+	set_tpg(p8, tpg, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 0), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, NULL, 3);
+}
+
+static void test_group_by_tpg_2_groups4(void **state)
+{
+	int prio[] = {2,1,1,2};
+	int tpg[] = {1,2,2,1};
+	int group0[] = {0,3};
+	int group1[] = {1,2};
+	int *groups[] = {group0, group1};
+	int group_size[] = {2,2};
+
+	set_priority(p4, prio, 4);
+	set_tpg(p4, tpg, 4);
+	mp4.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp4, 0), 0);
+	verify_pathgroups(&mp4, p4, groups, group_size, NULL, 2);
+}
+
+static void test_group_by_tpg1(void **state)
+{
+	int paths[] = {0};
+	int *groups[] = {paths};
+	int group_size[] = {1};
+
+	mp1.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp1, 0), 0);
+	verify_pathgroups(&mp1, p1, groups, group_size, NULL, 1);
+}
+
+static void test_group_by_tpg0(void **state)
+{
+	mp0.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp0, 0), 0);
+	verify_pathgroups(&mp0, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_tpg_null(void **state)
+{
+	mp_null.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp_null, 0), 0);
+	verify_pathgroups(&mp_null, NULL, NULL, NULL, NULL, 0);
+}
+
+static void test_group_by_tpg_mixed_all_marginal8(void **state)
+{
+	int prio[] = {7,2,3,3,5,2,8,2};
+	int tpg[] = {1,2,3,3,4,2,5,6};
+	int marginal[] = {1,1,1,1,1,1,1,1};
+	int group0[] = {6};
+	int group1[] = {0};
+	int group2[] = {4};
+	int group3[] = {2,3};
+	int group4[] = {1,5};
+	int group5[] = {7};
+	int *groups[] = {group0, group1, group2, group3,
+			  group4, group5};
+	int group_size[] = {1,1,1,2,2,1};
+	int group_marginal[] = {1,1,1,1,1,1};
+
+	set_priority(p8, prio, 8);
+	set_tpg(p8, tpg, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 1), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 6);
+}
+
+static void test_group_by_tpg_mixed_half_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,3,2,8,2};
+	int tpg[] = {1,2,3,4,5,6,7,6};
+	int marginal[] = {0,0,0,1,0,1,1,1};
+	int group0[] = {0};
+	int group1[] = {2};
+	int group2[] = {4};
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
+	set_tpg(p8, tpg, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 1), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
+}
+
+static void test_group_by_tpg_mixed_one_marginal8(void **state)
+{
+	int prio[] = {7,1,3,3,5,2,8,2};
+	int tpg[]  = {1,2,3,3,4,5,6,5};
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
+	set_tpg(p8, tpg, 8);
+	set_marginal(p8, marginal, 8);
+	mp8.pgpolicyfn = group_by_tpg;
+	assert_int_equal(group_paths(&mp8, 1), 0);
+	verify_pathgroups(&mp8, p8, groups, group_size, group_marginal, 7);
+}
+
+
 static void test_group_by_node_name_same8(void **state)
 {
 	char *node_name[] = {"a","a","a","a","a","a","a","a"};
@@ -1002,6 +1192,17 @@ int test_pgpolicies(void)
 		setup_test(test_group_by_prio_mixed_all_marginal, 8),
 		setup_test(test_group_by_prio_mixed_half_marginal, 8),
 		setup_test(test_group_by_prio_mixed_one_marginal, 8),
+		setup_test(test_group_by_tpg_same, 8),
+		setup_test(test_group_by_tpg_different, 8),
+		setup_test(test_group_by_tpg_mixed, 8),
+		setup_test(test_group_by_tpg_3_groups, 8),
+		setup_test(test_group_by_tpg_2_groups, 4),
+		setup_test(test_group_by_tpg, 1),
+		setup_test(test_group_by_tpg, 0),
+		setup_test(test_group_by_tpg, _null),
+		setup_test(test_group_by_tpg_mixed_all_marginal, 8),
+		setup_test(test_group_by_tpg_mixed_half_marginal, 8),
+		setup_test(test_group_by_tpg_mixed_one_marginal, 8),
 		setup_test(test_group_by_node_name_same, 8),
 		setup_test(test_group_by_node_name_increasing, 8),
 		setup_test(test_group_by_node_name_3_groups, 8),
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

