Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E2957219D99
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-XvdYtMixO3y9Prb6c3_DXQ-1; Thu, 09 Jul 2020 06:21:35 -0400
X-MC-Unique: XvdYtMixO3y9Prb6c3_DXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 697E319253C6;
	Thu,  9 Jul 2020 10:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 484C85C298;
	Thu,  9 Jul 2020 10:21:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0398B93F8D;
	Thu,  9 Jul 2020 10:21:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGwUi029366 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 598CC208DD86; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 543A72026D67
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE7C10B94FF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-490-SWaI0qAlNay-9oZmOokyvw-1;
	Thu, 09 Jul 2020 06:16:53 -0400
X-MC-Unique: SWaI0qAlNay-9oZmOokyvw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EC808B05C;
	Thu,  9 Jul 2020 10:16:51 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:49 +0200
Message-Id: <20200709101620.6786-5-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGwUi029366
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 04/35] multipath tools tests: add strchop() test
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/util.c b/tests/util.c
index 48de384..6d12fda 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -408,6 +408,68 @@ static int test_strlcpy(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
+static void test_strchop_nochop(void **state)
+{
+	char hello[] = "hello";
+
+	assert_int_equal(strchop(hello), 5);
+	assert_string_equal(hello, "hello");
+}
+
+static void test_strchop_newline(void **state)
+{
+	char hello[] = "hello\n";
+
+	assert_int_equal(strchop(hello), 5);
+	assert_string_equal(hello, "hello");
+}
+
+static void test_strchop_space(void **state)
+{
+	char hello[] = " ello      ";
+
+	assert_int_equal(strchop(hello), 5);
+	assert_string_equal(hello, " ello");
+}
+
+static void test_strchop_mix(void **state)
+{
+	char hello[] = " el\no \t  \n\n \t    \n";
+
+	assert_int_equal(strchop(hello), 5);
+	assert_string_equal(hello, " el\no");
+}
+
+static void test_strchop_blank(void **state)
+{
+	char hello[] = "  \t  \n\n \t    \n";
+
+	assert_int_equal(strchop(hello), 0);
+	assert_string_equal(hello, "");
+}
+
+static void test_strchop_empty(void **state)
+{
+	char hello[] = "";
+
+	assert_int_equal(strchop(hello), 0);
+	assert_string_equal(hello, "");
+}
+
+static int test_strchop(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_strchop_nochop),
+		cmocka_unit_test(test_strchop_newline),
+		cmocka_unit_test(test_strchop_space),
+		cmocka_unit_test(test_strchop_mix),
+		cmocka_unit_test(test_strchop_blank),
+		cmocka_unit_test(test_strchop_empty),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
 int main(void)
 {
 	int ret = 0;
@@ -415,5 +477,6 @@ int main(void)
 	ret += test_basenamecpy();
 	ret += test_bitmasks();
 	ret += test_strlcpy();
+	ret += test_strchop();
 	return ret;
 }
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

