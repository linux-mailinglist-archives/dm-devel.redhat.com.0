Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6C38AF7
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1D893082126;
	Fri,  7 Jun 2019 13:09:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 924B77DE3E;
	Fri,  7 Jun 2019 13:09:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAFDB18433A1;
	Fri,  7 Jun 2019 13:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D6rxL000402 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:06:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D889F68C67; Fri,  7 Jun 2019 13:06:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D039E5F5BB;
	Fri,  7 Jun 2019 13:06:51 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A8D430C5843;
	Fri,  7 Jun 2019 13:06:27 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:21 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:34 +0200
Message-Id: <20190607130552.13203-13-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Fri, 07 Jun 2019 13:06:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 07 Jun 2019 13:06:38 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 12/30] multipath-tools tests: add strlcpy() tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 07 Jun 2019 13:09:54 +0000 (UTC)

As we're using strlcpy quite a bit, make sure it works as designed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/tests/util.c b/tests/util.c
index e6d4b9ab..4e04a480 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -258,10 +258,152 @@ int test_basenamecpy(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
+static const char src_str[] = "Hello";
+
+/* strlcpy with length 0 */
+static void test_strlcpy_0(void **state)
+{
+	char tst[] = "word";
+	int rc;
+
+	rc = strlcpy(tst, src_str, 0);
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(tst, "word");
+}
+
+/* strlcpy with length 1 */
+static void test_strlcpy_1(void **state)
+{
+	char tst[] = "word";
+	int rc;
+
+	rc = strlcpy(tst, src_str, 1);
+	assert_int_equal(rc, strlen(src_str));
+	assert_int_equal(tst[0], '\0');
+	assert_string_equal(tst + 1, "ord");
+}
+
+/* strlcpy with length 2 */
+static void test_strlcpy_2(void **state)
+{
+	char tst[] = "word";
+	int rc;
+
+	rc = strlcpy(tst, src_str, 2);
+	assert_int_equal(rc, strlen(src_str));
+	assert_int_equal(tst[0], src_str[0]);
+	assert_int_equal(tst[1], '\0');
+	assert_string_equal(tst + 2, "rd");
+}
+
+/* strlcpy with dst length < src length */
+static void test_strlcpy_3(void **state)
+{
+	char tst[] = "word";
+	int rc;
+
+	rc = strlcpy(tst, src_str, sizeof(tst));
+	assert_int_equal(rc, strlen(src_str));
+	assert_int_equal(sizeof(tst) - 1, strlen(tst));
+	assert_true(strncmp(tst, src_str, sizeof(tst) - 1) == 0);
+}
+
+/* strlcpy with dst length > src length */
+static void test_strlcpy_4(void **state)
+{
+	static const char old[] = "0123456789";
+	char *tst;
+	int rc;
+
+	tst = strdup(old);
+	rc = strlcpy(tst, src_str, sizeof(old));
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(src_str, tst);
+	assert_string_equal(tst + sizeof(src_str), old + sizeof(src_str));
+	free(tst);
+}
+
+/* strlcpy with dst length = src length, dst not terminated */
+static void test_strlcpy_5(void **state)
+{
+	char *tst;
+	int rc;
+
+	tst = malloc(sizeof(src_str));
+	memset(tst, 'f', sizeof(src_str));
+
+	rc = strlcpy(tst, src_str, sizeof(src_str));
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(src_str, tst);
+
+	free(tst);
+}
+
+/* strlcpy with dst length > src length, dst not terminated */
+static void test_strlcpy_6(void **state)
+{
+	char *tst;
+	int rc;
+
+	tst = malloc(sizeof(src_str) + 2);
+	memset(tst, 'f', sizeof(src_str) + 2);
+
+	rc = strlcpy(tst, src_str, sizeof(src_str) + 2);
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(src_str, tst);
+	assert_int_equal(tst[sizeof(src_str)], 'f');
+	assert_int_equal(tst[sizeof(src_str) + 1], 'f');
+
+	free(tst);
+}
+
+/* strlcpy with empty src */
+static void test_strlcpy_7(void **state)
+{
+	char tst[] = "word";
+	static const char empty[] = "";
+	int rc;
+
+	rc = strlcpy(tst, empty, sizeof(tst));
+	assert_int_equal(rc, strlen(empty));
+	assert_string_equal(empty, tst);
+	assert_string_equal(tst + 1, "ord");
+}
+
+/* strlcpy with empty src, length 0 */
+static void test_strlcpy_8(void **state)
+{
+	char tst[] = "word";
+	static const char empty[] = "";
+	int rc;
+
+	rc = strlcpy(tst, empty, 0);
+	assert_int_equal(rc, strlen(empty));
+	assert_string_equal("word", tst);
+}
+
+static int test_strlcpy(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_strlcpy_0),
+		cmocka_unit_test(test_strlcpy_1),
+		cmocka_unit_test(test_strlcpy_2),
+		cmocka_unit_test(test_strlcpy_3),
+		cmocka_unit_test(test_strlcpy_4),
+		cmocka_unit_test(test_strlcpy_5),
+		cmocka_unit_test(test_strlcpy_6),
+		cmocka_unit_test(test_strlcpy_7),
+		cmocka_unit_test(test_strlcpy_8),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
 int main(void)
 {
 	int ret = 0;
 
 	ret += test_basenamecpy();
+	ret += test_strlcpy();
 	return ret;
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
