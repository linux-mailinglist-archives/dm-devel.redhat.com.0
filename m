Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 854781F48EC
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 23:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591738616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JJPqcJ+R5b4x2AHg6pH2p/ViICc2vVxcqhID+kvVCHE=;
	b=Gf5wTdEj4B3/SMRo2jO3HEib/RWBSSy1dq4AwmbHk1AuD209t40N25BK7jXgCKzsj7q9ry
	nJjo1fgFSJbKd2CzIoBJlwxGsnMJ2sEobPehhT6x7IRpdKukDnN+bDtj49b+U2D1CtCdno
	zmwHwz84rc2wc2gz/YSDsf+sgIRIczg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-7S3w54ohO2WvzKgSejA5xA-1; Tue, 09 Jun 2020 17:36:54 -0400
X-MC-Unique: 7S3w54ohO2WvzKgSejA5xA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB94100A61F;
	Tue,  9 Jun 2020 21:36:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE1856116D;
	Tue,  9 Jun 2020 21:36:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 978E51809554;
	Tue,  9 Jun 2020 21:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059LZcDe029302 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 17:35:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF47219D61; Tue,  9 Jun 2020 21:35:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28EF719C71;
	Tue,  9 Jun 2020 21:35:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 059LZYG3026854; 
	Tue, 9 Jun 2020 16:35:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 059LZYE0026853;
	Tue, 9 Jun 2020 16:35:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Jun 2020 16:35:28 -0500
Message-Id: <1591738529-26810-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
References: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/3] libmultipath: fix parser issue with
	comments in strings
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a quoted string starts with '#' or '!', the parser will stop
parsing the line, thinking that it's a comment.  It should only
be checking for comments outside of quoted strings. Fixed this and
added unit tests to verify it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/parser.c |  4 +++-
 tests/parser.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/libmultipath/parser.c b/libmultipath/parser.c
index d478b177..11a6168c 100644
--- a/libmultipath/parser.c
+++ b/libmultipath/parser.c
@@ -300,8 +300,10 @@ alloc_strvec(char *string)
 			(isspace((int) *cp) || !isascii((int) *cp)))
 		       && *cp != '\0')
 			cp++;
-		if (*cp == '\0' || *cp == '!' || *cp == '#')
+		if (*cp == '\0' ||
+		    (!in_string && (*cp == '!' || *cp == '#'))) {
 			return strvec;
+		}
 	}
 out:
 	vector_free(strvec);
diff --git a/tests/parser.c b/tests/parser.c
index 29859dac..5772391e 100644
--- a/tests/parser.c
+++ b/tests/parser.c
@@ -440,6 +440,46 @@ static void test18(void **state)
 	free_strvec(v);
 }
 
+static void test19(void **state)
+{
+#define QUOTED19 "!value"
+	vector v = alloc_strvec("key \"" QUOTED19 "\"");
+	char *val;
+
+	assert_int_equal(VECTOR_SIZE(v), 4);
+	assert_string_equal(VECTOR_SLOT(v, 0), "key");
+	assert_true(is_quote(VECTOR_SLOT(v, 1)));
+	assert_string_equal(VECTOR_SLOT(v, 2), QUOTED19);
+	assert_true(is_quote(VECTOR_SLOT(v, 3)));
+	assert_int_equal(validate_config_strvec(v, test_file), 0);
+
+	val = set_value(v);
+	assert_string_equal(val, QUOTED19);
+
+	free(val);
+	free_strvec(v);
+}
+
+static void test20(void **state)
+{
+#define QUOTED20 "#value"
+	vector v = alloc_strvec("key \"" QUOTED20 "\"");
+	char *val;
+
+	assert_int_equal(VECTOR_SIZE(v), 4);
+	assert_string_equal(VECTOR_SLOT(v, 0), "key");
+	assert_true(is_quote(VECTOR_SLOT(v, 1)));
+	assert_string_equal(VECTOR_SLOT(v, 2), QUOTED20);
+	assert_true(is_quote(VECTOR_SLOT(v, 3)));
+	assert_int_equal(validate_config_strvec(v, test_file), 0);
+
+	val = set_value(v);
+	assert_string_equal(val, QUOTED20);
+
+	free(val);
+	free_strvec(v);
+}
+
 int test_config_parser(void)
 {
 	const struct CMUnitTest tests[] = {
@@ -461,6 +501,8 @@ int test_config_parser(void)
 		cmocka_unit_test(test16),
 		cmocka_unit_test(test17),
 		cmocka_unit_test(test18),
+		cmocka_unit_test(test19),
+		cmocka_unit_test(test20),
 	};
 	return cmocka_run_group_tests(tests, setup, teardown);
 }
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

