Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE37D52B0
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DA1710CC1F0;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EDCA6061E;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D3014A460;
	Sat, 12 Oct 2019 21:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSUo3006060 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43C27608C2; Sat, 12 Oct 2019 21:28:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B7C608A5;
	Sat, 12 Oct 2019 21:28:30 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DC40307D971;
	Sat, 12 Oct 2019 21:28:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:52 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=liCkzdTuwHLdw8RkljD1nzjZUzmGAc2H4HoEYAH9De99FZdeOQtob2s0MeS880a5zRaAWr2kb2Q5TYba/RDEfXkm8QKFPXmseF1YMllykETGjBjjLFelu6sxDET0kY9ASyP/o4LbjBH8aR/GaypmdimTjpCTvrnNGKHPSjpC5oJhTFmMs//HsODlflD6g9+F9sCqvYJzr5v4adok49mA2KR8xODvypkornwGq6qnlAeB/nYFY4GxsOQ75uvP6sRaIfWckeIbdDXTiXlFb6rW+FtFNqoQY5G5FI7k/C9JXAOf1Hu0S3mT+/3iZQHTNmnNx/THSx2X2X+dni9TJyoITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=R8EuTIXqsrGB5wewPlolr+OymBij5aERJFSg+ItwQKc=;
	b=U6gfen984cD+lZ065VQiKRkHc7sXBaYoRStNntsmzkQQFonh7b3X41BfOX2xYJj/cc+uwh+Go46T+w6r0b2A1C97EAzw0pnmD+D9XEwAzKUSm98Jdqb8OPySpB8Wx/ves699qy9YYIh+YxysPkO0vlBDQsHX2nboAz6XuE5330p4ebflL4fWJ6yzQGQAnOX+8plh9my7ESqMvX5/IR37aRFYRB8R/o4wo9X3XkqF496yD7P0bF/l5NLpG3M+D31e5e/L+2muBocI5IOjCuKEO+oDduv+tWpAGyNts93lnGZl/0yvaG8Mig5Y5Mxs4a1hNYxupwn0CD1tcfRyR+N47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:51 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:51 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 11/72] multipath tests: alias: add tests for
	allocate_binding()
Thread-Index: AQHVgUPm2auRXL3ebkCFreIF12xa/A==
Date: Sat, 12 Oct 2019 21:27:50 +0000
Message-ID: <20191012212703.12989-12-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: b7490ed3-6e86-49dc-3b87-08d74f5b08f1
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317D0226F0DC75AB468EDE1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4nVmYidzetXGtxp0EAmFBl3iL8GQH87LT7bj0UQT/bSHHJ8zM98kpuUncQYPwyisBiCPgvhUGMFVEUqgYT4mwn1J2eMflZv2MkrJYeY6L6bhkJ/6vCCTqPnTxfu3x4ftemSBP5/OekvE42WYfcy32kdQt5VAit6L6kYkwDVSdmrAFXwx6FRqwxh04b5inB3dl9w6cEdyjE8jHiz5n8/2a288uWWX2qYh5d56Pwko5vIDAfqBTrkEstgiA90XRdAh8bJO83sxqLi0cbyCX5aKjcRa3/c0Q/ssxw/dpfn4DLn5dcECo87iIIWUAQgEeNQCM8m/iW1SJ6SENhsSkSqH/QwKZyddqxxmNnf4QIaFhm0yPBKO4D05J1eBZMr9LISWEl6gM0iA0U8YfZUUKtpyFf5jTew+Jcz8dRNs+uZTEis=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b7490ed3-6e86-49dc-3b87-08d74f5b08f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:50.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4VYQWLxbxu2EVPmUTT877oKD4tPKVd0rwWRlz6+luTN4wS7a6KlB6bt3+lvWdbia+QhTAR090KMaiB3e9BU8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSUo3006060
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 11/72] multipath tests: alias: add tests for
 allocate_binding()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Sat, 12 Oct 2019 21:31:27 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/alias.c | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/alias.c b/tests/alias.c
index 32fdc697..170ebbeb 100644
--- a/tests/alias.c
+++ b/tests/alias.c
@@ -5,6 +5,7 @@
 #include "util.h"
 #include "alias.h"
 #include "test-log.h"
+#include <errno.h>
 
 #include "globals.c"
 #include "../libmultipath/alias.c"
@@ -30,6 +31,36 @@ char *__wrap_fgets(char *buf, int n, FILE *stream)
 	return buf;
 }
 
+static int __set_errno(int err)
+{
+	if (err >= 0) {
+		errno = 0;
+		return err;
+	} else {
+		errno = -err;
+		return -1;
+	}
+}
+
+off_t __wrap_lseek(int fd, off_t offset, int whence)
+{
+	return __set_errno(mock_type(int));
+
+}
+
+ssize_t __wrap_write(int fd, const void *buf, size_t count)
+{
+	check_expected(count);
+	check_expected(buf);
+	return __set_errno(mock_type(int));
+}
+
+int __wrap_ftruncate(int fd, off_t length)
+{
+	check_expected(length);
+	return __set_errno(mock_type(int));
+}
+
 static void fd_mpatha(void **state)
 {
 	char buf[32];
@@ -577,6 +608,98 @@ static int test_rlookup_binding(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
+static void al_a(void **state)
+{
+	static const char ln[] = "MPATHa WWIDa\n";
+	char *alias;
+
+	will_return(__wrap_lseek, 0);
+	expect_value(__wrap_write, count, strlen(ln));
+	expect_string(__wrap_write, buf, ln);
+	will_return(__wrap_write, strlen(ln));
+	expect_condlog(3, "Created new binding [MPATHa] for WWID [WWIDa]\n");
+
+	alias = allocate_binding(0, "WWIDa", 1, "MPATH");
+	assert_ptr_not_equal(alias, NULL);
+	assert_string_equal(alias, "MPATHa");
+}
+
+static void al_zz(void **state)
+{
+	static const char ln[] = "MPATHzz WWIDzz\n";
+	char *alias;
+
+	will_return(__wrap_lseek, 0);
+	expect_value(__wrap_write, count, strlen(ln));
+	expect_string(__wrap_write, buf, ln);
+	will_return(__wrap_write, strlen(ln));
+	expect_condlog(3, "Created new binding [MPATHzz] for WWID [WWIDzz]\n");
+
+	alias = allocate_binding(0, "WWIDzz", 26*26 + 26, "MPATH");
+	assert_ptr_not_equal(alias, NULL);
+	assert_string_equal(alias, "MPATHzz");
+}
+
+static void al_0(void **state)
+{
+	char *alias;
+
+	expect_condlog(0, "allocate_binding: cannot allocate new binding for id 0\n");
+	alias = allocate_binding(0, "WWIDa", 0, "MPATH");
+	assert_ptr_equal(alias, NULL);
+}
+
+static void al_m2(void **state)
+{
+	char *alias;
+
+	expect_condlog(0, "allocate_binding: cannot allocate new binding for id -2\n");
+	alias = allocate_binding(0, "WWIDa", -2, "MPATH");
+	assert_ptr_equal(alias, NULL);
+}
+
+static void al_lseek_err(void **state)
+{
+	char *alias;
+
+	will_return(__wrap_lseek, -ENODEV);
+	expect_condlog(0, "Cannot seek to end of bindings file : No such device\n");
+	alias = allocate_binding(0, "WWIDa", 1, "MPATH");
+	assert_ptr_equal(alias, NULL);
+}
+
+static void al_write_err(void **state)
+{
+	static const char ln[] = "MPATHa WWIDa\n";
+	const int offset = 20;
+	char *alias;
+
+	will_return(__wrap_lseek, offset);
+	expect_value(__wrap_write, count, strlen(ln));
+	expect_string(__wrap_write, buf, ln);
+	will_return(__wrap_write, strlen(ln) - 1);
+	expect_value(__wrap_ftruncate, length, offset);
+	will_return(__wrap_ftruncate, 0);
+	expect_condlog(0, "Cannot write binding to bindings file : Success\n");
+
+	alias = allocate_binding(0, "WWIDa", 1, "MPATH");
+	assert_ptr_equal(alias, NULL);
+}
+
+static int test_allocate_binding(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(al_a),
+		cmocka_unit_test(al_zz),
+		cmocka_unit_test(al_0),
+		cmocka_unit_test(al_m2),
+		cmocka_unit_test(al_lseek_err),
+		cmocka_unit_test(al_write_err),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
 int main(void)
 {
 	int ret = 0;
@@ -585,6 +708,7 @@ int main(void)
 	ret += test_scan_devname();
 	ret += test_lookup_binding();
 	ret += test_rlookup_binding();
+	ret += test_allocate_binding();
 
 	return ret;
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
