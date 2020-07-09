Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3E5219DA2
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:22:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-KI78aDWcO4-76Hpz4ruxfQ-1; Thu, 09 Jul 2020 06:21:38 -0400
X-MC-Unique: KI78aDWcO4-76Hpz4ruxfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5487C8015CE;
	Thu,  9 Jul 2020 10:21:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2018910023A0;
	Thu,  9 Jul 2020 10:21:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C95301809557;
	Thu,  9 Jul 2020 10:21:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH0gl029429 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DAB45F244; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 698255EDFD
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AEF88432AA
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-13-mI4Pg-iJNtWbvuUSAvVGTg-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: mI4Pg-iJNtWbvuUSAvVGTg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 70491B083;
	Thu,  9 Jul 2020 10:16:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:56 +0200
Message-Id: <20200709101620.6786-12-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH0gl029429
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 11/35] multipath-tools tests: add unit tests for
	strlcat
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Also, use some constants for both strlcpy and strlcat tests.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 222 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 210 insertions(+), 12 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index db7c05f..3c4113e 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -476,48 +476,54 @@ static int test_bitmasks(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
-static const char src_str[] = "Hello";
+#define DST_STR "Hello"
+static const char dst_str[] = DST_STR;
+/* length of src_str and dst_str should be different */
+static const char src_str[] = " World";
+/* Must be big enough to hold dst_str and src_str */
+#define ARRSZ 16
+#define FILL '@'
 
 /* strlcpy with length 0 */
 static void test_strlcpy_0(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	int rc;
 
 	rc = strlcpy(tst, src_str, 0);
 	assert_int_equal(rc, strlen(src_str));
-	assert_string_equal(tst, "word");
+	assert_string_equal(tst, dst_str);
 }
 
 /* strlcpy with length 1 */
 static void test_strlcpy_1(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	int rc;
 
 	rc = strlcpy(tst, src_str, 1);
 	assert_int_equal(rc, strlen(src_str));
 	assert_int_equal(tst[0], '\0');
-	assert_string_equal(tst + 1, "ord");
+	assert_string_equal(tst + 1, dst_str + 1);
 }
 
 /* strlcpy with length 2 */
 static void test_strlcpy_2(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	int rc;
 
 	rc = strlcpy(tst, src_str, 2);
 	assert_int_equal(rc, strlen(src_str));
 	assert_int_equal(tst[0], src_str[0]);
 	assert_int_equal(tst[1], '\0');
-	assert_string_equal(tst + 2, "rd");
+	assert_string_equal(tst + 2, dst_str + 2);
 }
 
 /* strlcpy with dst length < src length */
 static void test_strlcpy_3(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	int rc;
 
 	rc = strlcpy(tst, src_str, sizeof(tst));
@@ -580,26 +586,26 @@ static void test_strlcpy_6(void **state)
 /* strlcpy with empty src */
 static void test_strlcpy_7(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	static const char empty[] = "";
 	int rc;
 
 	rc = strlcpy(tst, empty, sizeof(tst));
 	assert_int_equal(rc, strlen(empty));
 	assert_string_equal(empty, tst);
-	assert_string_equal(tst + 1, "ord");
+	assert_string_equal(tst + 1, dst_str + 1);
 }
 
 /* strlcpy with empty src, length 0 */
 static void test_strlcpy_8(void **state)
 {
-	char tst[] = "word";
+	char tst[] = DST_STR;
 	static const char empty[] = "";
 	int rc;
 
 	rc = strlcpy(tst, empty, 0);
 	assert_int_equal(rc, strlen(empty));
-	assert_string_equal("word", tst);
+	assert_string_equal(dst_str, tst);
 }
 
 static int test_strlcpy(void)
@@ -619,6 +625,197 @@ static int test_strlcpy(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
+
+/* 0-terminated string, filled with non-0 after the terminator */
+static void prep_buf(char *buf, size_t size, const char *word)
+{
+	memset(buf, FILL, size);
+	assert_in_range(strlen(word), 0, size - 1);
+	memcpy(buf, word, strlen(word) + 1);
+}
+
+/* strlcat with size 0, dst not 0-terminated  */
+static void test_strlcat_0(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, 0);
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(tst, dst_str);
+	assert_int_equal(tst[sizeof(dst_str)], FILL);
+}
+
+/* strlcat with length 1, dst not 0-terminated */
+static void test_strlcat_1(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, 1);
+	assert_int_equal(rc, 1 + strlen(src_str));
+	assert_string_equal(tst, dst_str);
+	assert_int_equal(tst[sizeof(dst_str)], FILL);
+}
+
+/* strlcat with length = dst - 1 */
+static void test_strlcat_2(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, strlen(dst_str));
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_string_equal(tst, dst_str);
+	assert_int_equal(tst[sizeof(dst_str)], FILL);
+}
+
+/* strlcat with length = dst */
+static void test_strlcat_3(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, strlen(dst_str) + 1);
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_string_equal(tst, dst_str);
+	assert_int_equal(tst[sizeof(dst_str)], FILL);
+}
+
+/* strlcat with len = dst + 1 */
+static void test_strlcat_4(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, strlen(dst_str) + 2);
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_false(strncmp(tst, dst_str, strlen(dst_str)));
+	assert_int_equal(tst[strlen(dst_str)], src_str[0]);
+	assert_int_equal(tst[strlen(dst_str) + 1], '\0');
+	assert_int_equal(tst[strlen(dst_str) + 2], FILL);
+}
+
+/* strlcat with len = needed - 1 */
+static void test_strlcat_5(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, strlen(dst_str) + strlen(src_str));
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_false(strncmp(tst, dst_str, strlen(dst_str)));
+	assert_false(strncmp(tst + strlen(dst_str), src_str,
+			     strlen(src_str) - 1));
+	assert_int_equal(tst[strlen(dst_str) + strlen(src_str) - 1], '\0');
+	assert_int_equal(tst[strlen(dst_str) + strlen(src_str)], FILL);
+}
+
+/* strlcat with exactly sufficient space */
+static void test_strlcat_6(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, strlen(dst_str) + strlen(src_str) + 1);
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_false(strncmp(tst, dst_str, strlen(dst_str)));
+	assert_string_equal(tst + strlen(dst_str), src_str);
+	assert_int_equal(tst[strlen(dst_str) + strlen(src_str) + 1], FILL);
+}
+
+/* strlcat with sufficient space */
+static void test_strlcat_7(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, src_str, sizeof(tst));
+	assert_int_equal(rc, strlen(src_str) + strlen(dst_str));
+	assert_false(strncmp(tst, dst_str, strlen(dst_str)));
+	assert_string_equal(tst + strlen(dst_str), src_str);
+}
+
+/* strlcat with 0-length string */
+static void test_strlcat_8(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), dst_str);
+	rc = strlcat(tst, "", sizeof(tst));
+	assert_int_equal(rc, strlen(dst_str));
+	assert_string_equal(tst, dst_str);
+	assert_int_equal(tst[sizeof(dst_str)], FILL);
+}
+
+/* strlcat with empty dst */
+static void test_strlcat_9(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), "");
+	rc = strlcat(tst, src_str, ARRSZ);
+	assert_int_equal(rc, strlen(src_str));
+	assert_string_equal(tst, src_str);
+	assert_int_equal(tst[sizeof(src_str)], FILL);
+}
+
+/* strlcat with empty dst and src */
+static void test_strlcat_10(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), "");
+	rc = strlcat(tst, "", ARRSZ);
+	assert_int_equal(rc, 0);
+	assert_string_equal(tst, "");
+	assert_int_equal(tst[1], FILL);
+}
+
+/* strlcat with no space to store 0 */
+static void test_strlcat_11(void **state)
+{
+	char tst[ARRSZ];
+	int rc;
+
+	prep_buf(tst, sizeof(tst), "");
+	tst[0] = FILL;
+	rc = strlcat(tst, src_str, 0);
+	assert_int_equal(rc, strlen(src_str));
+	assert_int_equal(tst[0], FILL);
+}
+
+static int test_strlcat(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_strlcat_0),
+		cmocka_unit_test(test_strlcat_1),
+		cmocka_unit_test(test_strlcat_2),
+		cmocka_unit_test(test_strlcat_3),
+		cmocka_unit_test(test_strlcat_4),
+		cmocka_unit_test(test_strlcat_5),
+		cmocka_unit_test(test_strlcat_6),
+		cmocka_unit_test(test_strlcat_7),
+		cmocka_unit_test(test_strlcat_8),
+		cmocka_unit_test(test_strlcat_9),
+		cmocka_unit_test(test_strlcat_10),
+		cmocka_unit_test(test_strlcat_11),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
 static void test_strchop_nochop(void **state)
 {
 	char hello[] = "hello";
@@ -688,6 +885,7 @@ int main(void)
 	ret += test_basenamecpy();
 	ret += test_bitmasks();
 	ret += test_strlcpy();
+	ret += test_strlcat();
 	ret += test_strchop();
 	return ret;
 }
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

