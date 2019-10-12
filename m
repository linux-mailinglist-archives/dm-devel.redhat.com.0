Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 24814D52A2
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FF7C30BBE82;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 661BD608A5;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBD331803517;
	Sat, 12 Oct 2019 21:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSO7G005976 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 076F760BFB; Sat, 12 Oct 2019 21:28:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D00E60BF1;
	Sat, 12 Oct 2019 21:28:21 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F03A308FBFC;
	Sat, 12 Oct 2019 21:28:19 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:42 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OGNFCdlpfEUbkce15MpTPdPpM+4nYGrsaSWOWR5bBgtaL+s4c1ps8T522u3zWniIA4/l19OcPpnHLnddcd1c7i3t7xtFr9qj4g8cH0s0ap3HdFetvM6G1NZQ0xx4WKS028UzVpJvygdpJYNoPHB02O5eqcq+QuiSjF2JUwSUoSsUeDsmZtCvyL+TYU19Xa4VcUFwh9ya8e1nZOXlXzhrX3ZKxrpoO78Sx7zTR8c4KkbgD4dp9Y85hX8S3itYgIEGFcDW24lV8aqNmWbY0YhGtvCowGSEzNJPhNNlf/I6gcH/xldztz0uFYNz4GCa5rd3CXORAk2iYxBbDDeu70fCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qafaSLgsPCxljsG2NKBH0DC3luTiWJ/cTGvZZc8LlX8=;
	b=cQ6KDzei9IJ84py+79Y1AWMhcZZMgjm/WtoxMc0YRPHgTpkoq+ME1vIS8YkmpB11vF8qaCQbzQ2JUNeoTJK7qEZYsqIFifcekgK8P+ex7dBFnUc+FtT+iFTuiCIMYn8tXKeENEvTHQ93QyrKKY89Rjnxs0xkqnO+virWuKh2ImQMb582OUan/PAsCWlhebZ+nT6JovJPz3bx4VJmGAQYKCX9mnViqKRr3fSQopkXtLzfWHSWN4BNsW9Y1wmp94sInpxxHBtXWdbzSiEShTAGo/WBF4TpeGifeWkHECb+2eg0zyXr2thSQAJEKcSZpxff5KOmDWz5MJICTmcttznWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:39 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:39 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 02/72] multipath tests: add tests for alias handling
Thread-Index: AQHVgUPf7mUCAzaiq0KcU90TSmh1vA==
Date: Sat, 12 Oct 2019 21:27:39 +0000
Message-ID: <20191012212703.12989-3-martin.wilck@suse.com>
References: <20191012212703.12989-1-martin.wilck@suse.com>
In-Reply-To: <20191012212703.12989-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0045.eurprd02.prod.outlook.com
	(2603:10a6:208:d2::22) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f4bcba8-41bb-4d6a-731f-08d74f5b0232
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331750FC4D9885DB83E2C32EFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(30864003)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4IcDOlIF/lG5BMp8JcMdlmm7dzak4ov89fW3JAgfn7ShPucfaGvzUpWDFiFvW72Skcch9jOIdaBShhWQvHfs0qn5iuOQU2U57EYdyIVS17Td5Nl8X9yDsfLqWQ73mn9aJyNFOXwHTchuPjJgqtWMtogn8AncE+AClxGs7y4dtKuKdlAivxOUDAsUxgvsDhS2Y5j3yHt4URUF8U3+t8wHKG3FuEcdKnivvT3b7SH/IuGo/LXNs8TcoD5b70RE7+S4n+U6U0czW9RWckuYIuRFG2sRDWkd9Jv1Gf+UNYtB0VsSm27e6fHzpKEKCvyUHtrt0fyCpqHce34ykLm+3NFnHbBgVJ039JTXQU2VUSMIVnebcMYicx6TXnzsr4HdXS20CvQ4XPVPQ/mINX+p8ShVPLmcCBKfmmLwEAghNmWeSuE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4bcba8-41bb-4d6a-731f-08d74f5b0232
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:39.5582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3J3g0JQgzbRe2+8MDc3Grz5XlCCNbqOHcM2HGErnDQHN3c9FRzX8XLJvSDqQa4HqQHnM9liST0SiwFDV62l+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sat, 12 Oct 2019 21:28:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sat, 12 Oct 2019 21:28:20 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSO7G005976
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 02/72] multipath tests: add tests for alias
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 12 Oct 2019 21:30:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Some of these tests fail with the current code base.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile |   3 +-
 tests/alias.c  | 590 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 592 insertions(+), 1 deletion(-)
 create mode 100644 tests/alias.c

diff --git a/tests/Makefile b/tests/Makefile
index fb3c067b..0ce318c6 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -3,7 +3,7 @@ include ../Makefile.inc
 CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
 LIBDEPS += -L$(multipathdir) -lmultipath -lcmocka
 
-TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy
+TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy alias
 
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
@@ -28,6 +28,7 @@ blacklist-test_OBJDEPS := ../libmultipath/blacklist.o
 blacklist-test_LIBDEPS := -ludev
 vpd-test_OBJDEPS :=  ../libmultipath/discovery.o
 vpd-test_LIBDEPS := -ludev -lpthread -ldl
+alias-test_TESTDEPS := test-log.o
 
 lib/libchecktur.so:
 	mkdir lib
diff --git a/tests/alias.c b/tests/alias.c
new file mode 100644
index 00000000..32fdc697
--- /dev/null
+++ b/tests/alias.c
@@ -0,0 +1,590 @@
+#include <stdint.h>
+#include <setjmp.h>
+#include <stdio.h>
+#include <cmocka.h>
+#include "util.h"
+#include "alias.h"
+#include "test-log.h"
+
+#include "globals.c"
+#include "../libmultipath/alias.c"
+
+#if INT_MAX == 0x7fffffff
+/* user_friendly_name for map #INT_MAX */
+#define MPATH_ID_INT_MAX "fxshrxw"
+/* ... and one less */
+#define MPATH_ID_INT_MAX_m1 "fxshrxv"
+/* ... and one more */
+#define MPATH_ID_INT_MAX_p1 "fxshrxx"
+#endif
+
+void __wrap_rewind(FILE *stream)
+{}
+
+char *__wrap_fgets(char *buf, int n, FILE *stream)
+{
+	char *val = mock_ptr_type(char *);
+	if (!val)
+		return NULL;
+	strlcpy(buf, val, n);
+	return buf;
+}
+
+static void fd_mpatha(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 1, sizeof(buf), "FOO");
+	assert_int_equal(rc, 4);
+	assert_string_equal(buf, "FOOa");
+}
+
+static void fd_mpathz(void **state)
+{
+	/* This also tests a "short" buffer, see fd_mpath_short1 */
+	char buf[5];
+	int rc;
+
+	rc = format_devname(buf, 26, sizeof(buf), "FOO");
+	assert_int_equal(rc, 4);
+	assert_string_equal(buf, "FOOz");
+}
+
+static void fd_mpathaa(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26 + 1, sizeof(buf), "FOO");
+	assert_int_equal(rc, 5);
+	assert_string_equal(buf, "FOOaa");
+}
+
+static void fd_mpathzz(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26*26 + 26, sizeof(buf), "FOO");
+	assert_int_equal(rc, 5);
+	assert_string_equal(buf, "FOOzz");
+}
+
+static void fd_mpathaaa(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26*26 + 27, sizeof(buf), "FOO");
+	assert_int_equal(rc, 6);
+	assert_string_equal(buf, "FOOaaa");
+}
+
+static void fd_mpathzzz(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26*26*26 + 26*26 + 26, sizeof(buf), "FOO");
+	assert_int_equal(rc, 6);
+	assert_string_equal(buf, "FOOzzz");
+}
+
+static void fd_mpathaaaa(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26*26*26 + 26*26 + 27, sizeof(buf), "FOO");
+	assert_int_equal(rc, 7);
+	assert_string_equal(buf, "FOOaaaa");
+}
+
+static void fd_mpathzzzz(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc = format_devname(buf, 26*26*26*26 + 26*26*26 + 26*26 + 26,
+			    sizeof(buf), "FOO");
+	assert_int_equal(rc, 7);
+	assert_string_equal(buf, "FOOzzzz");
+}
+
+#ifdef MPATH_ID_INT_MAX
+static void fd_mpath_max(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc  = format_devname(buf, INT_MAX, sizeof(buf), "");
+	assert_int_equal(rc, strlen(MPATH_ID_INT_MAX));
+	assert_string_equal(buf, MPATH_ID_INT_MAX);
+}
+#endif
+
+static void fd_mpath_max1(void **state)
+{
+	char buf[32];
+	int rc;
+
+	rc  = format_devname(buf, INT_MIN, sizeof(buf), "");
+	assert_int_equal(rc, -1);
+}
+
+static void fd_mpath_short(void **state)
+{
+	char buf[4];
+	int rc;
+
+	rc = format_devname(buf, 1, sizeof(buf), "FOO");
+	assert_int_equal(rc, -1);
+}
+
+static void fd_mpath_short1(void **state)
+{
+	char buf[5];
+	int rc;
+
+	rc = format_devname(buf, 27, sizeof(buf), "FOO");
+	assert_int_equal(rc, -1);
+}
+
+static int test_format_devname(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(fd_mpatha),
+		cmocka_unit_test(fd_mpathz),
+		cmocka_unit_test(fd_mpathaa),
+		cmocka_unit_test(fd_mpathzz),
+		cmocka_unit_test(fd_mpathaaa),
+		cmocka_unit_test(fd_mpathzzz),
+		cmocka_unit_test(fd_mpathaaaa),
+		cmocka_unit_test(fd_mpathzzzz),
+#ifdef MPATH_ID_INT_MAX
+		cmocka_unit_test(fd_mpath_max),
+#endif
+		cmocka_unit_test(fd_mpath_max1),
+		cmocka_unit_test(fd_mpath_short),
+		cmocka_unit_test(fd_mpath_short1),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+static void sd_mpatha(void **state)
+{
+	int rc = scan_devname("MPATHa", "MPATH");
+
+	assert_int_equal(rc, 1);
+}
+
+/*
+ * Text after whitespace is ignored. But an overlong input
+ * errors out, even if it's just whitespace.
+ * It's kind of strange that scan_devname() treats whitespace
+ * like this. But I'm not sure if some corner case depends
+ * on this behavior.
+ */
+static void sd_mpatha_spc(void **state)
+{
+	int rc = scan_devname("MPATHa  00", "MPATH");
+
+	assert_int_equal(rc, 1);
+}
+
+static void sd_mpatha_tab(void **state)
+{
+	int rc = scan_devname("MPATHa\t00", "MPATH");
+
+	assert_int_equal(rc, 1);
+}
+
+static void sd_overlong(void **state)
+{
+	int rc = scan_devname("MPATHa       ", "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_overlong1(void **state)
+{
+	int rc = scan_devname("MPATHabcdefgh", "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_noprefix(void **state)
+{
+	int rc = scan_devname("MPATHa", NULL);
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_nomatchprefix(void **state)
+{
+	int rc = scan_devname("MPATHa", "mpath");
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_eq_prefix(void **state)
+{
+	int rc = scan_devname("MPATH", "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_bad_1(void **state)
+{
+	int rc = scan_devname("MPATH0", "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+
+static void sd_bad_2(void **state)
+{
+	int rc = scan_devname("MPATHa0c", "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+
+#ifdef MPATH_ID_INT_MAX
+static void sd_max(void **state)
+{
+	int rc = scan_devname("MPATH" MPATH_ID_INT_MAX, "MPATH");
+
+	assert_int_equal(rc, INT_MAX);
+}
+
+static void sd_max_p1(void **state)
+{
+	int rc = scan_devname("MPATH" MPATH_ID_INT_MAX_p1, "MPATH");
+
+	assert_int_equal(rc, -1);
+}
+#endif
+
+static int test_scan_devname(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(sd_mpatha),
+		cmocka_unit_test(sd_mpatha_spc),
+		cmocka_unit_test(sd_mpatha_tab),
+		cmocka_unit_test(sd_overlong),
+		cmocka_unit_test(sd_overlong1),
+		cmocka_unit_test(sd_noprefix),
+		cmocka_unit_test(sd_nomatchprefix),
+		cmocka_unit_test(sd_eq_prefix),
+		cmocka_unit_test(sd_bad_1),
+		cmocka_unit_test(sd_bad_2),
+#ifdef MPATH_ID_INT_MAX
+		cmocka_unit_test(sd_max),
+		cmocka_unit_test(sd_max_p1),
+#endif
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+static void lb_empty(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID0] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID0", &alias, NULL);
+	assert_int_equal(rc, 1);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_match_a(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	expect_condlog(3, "Found matching wwid [WWID0] in bindings file."
+		       " Setting alias to MPATHa\n");
+	rc = lookup_binding(NULL, "WWID0", &alias, "MPATH");
+	assert_int_equal(rc, 0);
+	assert_ptr_not_equal(alias, NULL);
+	assert_string_equal(alias, "MPATHa");
+	free(alias);
+}
+
+static void lb_nomatch_a(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID1] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID1", &alias, "MPATH");
+	assert_int_equal(rc, 2);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_match_c(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, "MPATHc WWID1\n");
+	expect_condlog(3, "Found matching wwid [WWID1] in bindings file."
+		       " Setting alias to MPATHc\n");
+	rc = lookup_binding(NULL, "WWID1", &alias, "MPATH");
+	assert_int_equal(rc, 0);
+	assert_ptr_not_equal(alias, NULL);
+	assert_string_equal(alias, "MPATHc");
+	free(alias);
+}
+
+static void lb_nomatch_a_c(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, "MPATHc WWID1\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, 2);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_nomatch_c_a(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHc WWID1\n");
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, 2);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_nomatch_a_b(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, "MPATHz WWID26\n");
+	will_return(__wrap_fgets, "MPATHb WWID1\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, 3);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_nomatch_a_b_bad(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, "MPATHz WWID26\n");
+	will_return(__wrap_fgets, "MPATHb\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "Ignoring malformed line 3 in bindings file\n");
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, 3);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_nomatch_b_a(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHb WWID1\n");
+	will_return(__wrap_fgets, "MPATHz WWID26\n");
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, 27);
+	assert_ptr_equal(alias, NULL);
+}
+
+#ifdef MPATH_ID_INT_MAX
+static void lb_nomatch_int_max(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHb WWID1\n");
+	will_return(__wrap_fgets, "MPATH" MPATH_ID_INT_MAX " WWIDMAX\n");
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(0, "no more available user_friendly_names\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, -1);
+	assert_ptr_equal(alias, NULL);
+}
+
+static void lb_nomatch_int_max_m1(void **state)
+{
+	int rc;
+	char *alias;
+
+	will_return(__wrap_fgets, "MPATHb WWID1\n");
+	will_return(__wrap_fgets, "MPATH" MPATH_ID_INT_MAX_m1 " WWIDMAX\n");
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching wwid [WWID2] in bindings file.\n");
+	rc = lookup_binding(NULL, "WWID2", &alias, "MPATH");
+	assert_int_equal(rc, INT_MAX);
+	assert_ptr_equal(alias, NULL);
+}
+#endif
+
+static int test_lookup_binding(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(lb_empty),
+		cmocka_unit_test(lb_match_a),
+		cmocka_unit_test(lb_nomatch_a),
+		cmocka_unit_test(lb_match_c),
+		cmocka_unit_test(lb_nomatch_a_c),
+		cmocka_unit_test(lb_nomatch_c_a),
+		cmocka_unit_test(lb_nomatch_a_b),
+		cmocka_unit_test(lb_nomatch_a_b_bad),
+		cmocka_unit_test(lb_nomatch_b_a),
+#ifdef MPATH_ID_INT_MAX
+		cmocka_unit_test(lb_nomatch_int_max),
+		cmocka_unit_test(lb_nomatch_int_max_m1),
+#endif
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+static void rl_empty(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching alias [MPATHa] in bindings file.\n");
+	rc = rlookup_binding(NULL, buf, "MPATHa");
+	assert_int_equal(rc, -1);
+	assert_string_equal(buf, "");
+}
+
+static void rl_match_a(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	expect_condlog(3, "Found matching alias [MPATHa] in bindings file.\n"
+		       "Setting wwid to WWID0\n");
+	rc = rlookup_binding(NULL, buf, "MPATHa");
+	assert_int_equal(rc, 0);
+	assert_string_equal(buf, "WWID0");
+}
+
+static void rl_nomatch_a(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "No matching alias [MPATHb] in bindings file.\n");
+	rc = rlookup_binding(NULL, buf, "MPATHb");
+	assert_int_equal(rc, -1);
+	assert_string_equal(buf, "");
+}
+
+static void rl_malformed_a(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, "MPATHa     \n");
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "Ignoring malformed line 1 in bindings file\n");
+	expect_condlog(3, "No matching alias [MPATHa] in bindings file.\n");
+	rc = rlookup_binding(NULL, buf, "MPATHa");
+	assert_int_equal(rc, -1);
+	assert_string_equal(buf, "");
+}
+
+static void rl_overlong_a(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+	char line[WWID_SIZE + 10];
+
+	snprintf(line, sizeof(line), "MPATHa ");
+	memset(line + strlen(line), 'W', sizeof(line) - 2 - strlen(line));
+	snprintf(line + sizeof(line) - 2, 2, "\n");
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, line);
+	will_return(__wrap_fgets, NULL);
+	expect_condlog(3, "Ignoring too large wwid at 1 in bindings file\n");
+	expect_condlog(3, "No matching alias [MPATHa] in bindings file.\n");
+	rc = rlookup_binding(NULL, buf, "MPATHa");
+	assert_int_equal(rc, -1);
+	assert_string_equal(buf, "");
+}
+
+static void rl_match_b(void **state)
+{
+	int rc;
+	char buf[WWID_SIZE];
+
+	buf[0] = '\0';
+	will_return(__wrap_fgets, "MPATHa WWID0\n");
+	will_return(__wrap_fgets, "MPATHz WWID26\n");
+	will_return(__wrap_fgets, "MPATHb WWID2\n");
+	expect_condlog(3, "Found matching alias [MPATHb] in bindings file.\n"
+		       "Setting wwid to WWID2\n");
+	rc = rlookup_binding(NULL, buf, "MPATHb");
+	assert_int_equal(rc, 0);
+	assert_string_equal(buf, "WWID2");
+}
+
+static int test_rlookup_binding(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(rl_empty),
+		cmocka_unit_test(rl_match_a),
+		cmocka_unit_test(rl_nomatch_a),
+		cmocka_unit_test(rl_malformed_a),
+		cmocka_unit_test(rl_overlong_a),
+		cmocka_unit_test(rl_match_b),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+int main(void)
+{
+	int ret = 0;
+
+	ret += test_format_devname();
+	ret += test_scan_devname();
+	ret += test_lookup_binding();
+	ret += test_rlookup_binding();
+
+	return ret;
+}
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
