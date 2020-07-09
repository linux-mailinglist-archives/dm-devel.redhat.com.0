Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C18D219D97
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-03llpygwOR6A-VeTZOYV5A-1; Thu, 09 Jul 2020 06:21:31 -0400
X-MC-Unique: 03llpygwOR6A-VeTZOYV5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38348E918;
	Thu,  9 Jul 2020 10:21:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9117F8C1;
	Thu,  9 Jul 2020 10:21:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82D7772F48;
	Thu,  9 Jul 2020 10:21:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGw4c029358 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 494711000DB2; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44BDA114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B297858EE4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-399-Au5SUbXqM-2LilSagyr3rA-1;
	Thu, 09 Jul 2020 06:16:53 -0400
X-MC-Unique: Au5SUbXqM-2LilSagyr3rA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CD37ADC0;
	Thu,  9 Jul 2020 10:16:51 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:46 +0200
Message-Id: <20200709101620.6786-2-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGw4c029358
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 01/35] multipath-tools tests/util: separate group
	for bitmask tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Separate these more cleanly.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index 7c486fc..48de384 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -141,6 +141,27 @@ static void test_basenamecpy_bad5(void **state)
         assert_int_equal(basenamecpy("baz/qux", NULL, sizeof(dst)), 0);
 }
 
+static int test_basenamecpy(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_basenamecpy_good0),
+		cmocka_unit_test(test_basenamecpy_good1),
+		cmocka_unit_test(test_basenamecpy_good2),
+		cmocka_unit_test(test_basenamecpy_good3),
+		cmocka_unit_test(test_basenamecpy_good4),
+		cmocka_unit_test(test_basenamecpy_good5),
+		cmocka_unit_test(test_basenamecpy_good6),
+		cmocka_unit_test(test_basenamecpy_good7),
+		cmocka_unit_test(test_basenamecpy_bad0),
+		cmocka_unit_test(test_basenamecpy_bad1),
+		cmocka_unit_test(test_basenamecpy_bad2),
+		cmocka_unit_test(test_basenamecpy_bad3),
+		cmocka_unit_test(test_basenamecpy_bad4),
+		cmocka_unit_test(test_basenamecpy_bad5),
+	};
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
 static void test_bitmask_1(void **state)
 {
 	uint64_t arr[BITARR_SZ];
@@ -235,23 +256,9 @@ static void test_bitmask_2(void **state)
 	}
 }
 
-int test_basenamecpy(void)
+static int test_bitmasks(void)
 {
 	const struct CMUnitTest tests[] = {
-		cmocka_unit_test(test_basenamecpy_good0),
-		cmocka_unit_test(test_basenamecpy_good1),
-		cmocka_unit_test(test_basenamecpy_good2),
-		cmocka_unit_test(test_basenamecpy_good3),
-		cmocka_unit_test(test_basenamecpy_good4),
-		cmocka_unit_test(test_basenamecpy_good5),
-		cmocka_unit_test(test_basenamecpy_good6),
-		cmocka_unit_test(test_basenamecpy_good7),
-		cmocka_unit_test(test_basenamecpy_bad0),
-		cmocka_unit_test(test_basenamecpy_bad1),
-		cmocka_unit_test(test_basenamecpy_bad2),
-		cmocka_unit_test(test_basenamecpy_bad3),
-		cmocka_unit_test(test_basenamecpy_bad4),
-		cmocka_unit_test(test_basenamecpy_bad5),
 		cmocka_unit_test(test_bitmask_1),
 		cmocka_unit_test(test_bitmask_2),
 	};
@@ -406,6 +413,7 @@ int main(void)
 	int ret = 0;
 
 	ret += test_basenamecpy();
+	ret += test_bitmasks();
 	ret += test_strlcpy();
 	return ret;
 }
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

