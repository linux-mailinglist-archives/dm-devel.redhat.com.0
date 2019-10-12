Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F0D5296
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD1F810DCC8B;
	Sat, 12 Oct 2019 21:28:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33793608A5;
	Sat, 12 Oct 2019 21:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77102180B536;
	Sat, 12 Oct 2019 21:28:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSIaK005916 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 151A4608C2; Sat, 12 Oct 2019 21:28:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D78608A5;
	Sat, 12 Oct 2019 21:28:15 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD1A710C0938;
	Sat, 12 Oct 2019 21:28:12 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:39 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NHMsZFB6hh8oqT0nw5OfqFytoHW79F0OfccaDiBzUk166o+5wPbhZo7H7hZwikwuN7LlT+243aPeYXNDT6XMXYEZ8gkYTH2T0i6tNiw9p4pcZMKs/OR9VQctteMhP748dRHL4qEHiLCZU0e6E7DeUbGUe1Npi1ompDxB8yOldM6HcNlkLFXVvu81VEWOM+AOzkR7om5kOpvfsgWpEq5R7OJ5FgU1WnRi/0Qmp9VsAebgcO47pNDu2143it6Op1eCCo7jpsGibA8nuqYcucsQebjXQj0mrzDPaC2Qzf//CaIHFV2kPlDsuYgTK+6oDYdADq7qsZ5FxHQks4jekX3zLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QJn0BgBtYFESXnRpkLJE9gk4VTI/OIMf1y+yuDT6Dq4=;
	b=NKYy+N4qOH9GSA4TUvUcGJIpdSJ6R/xwZXMZ7+CFD19TPZHdbY+fqGvI3YsGhvKWWZ2TMvE6quEC7XF9Kkc+/7aZzXfyHB0jRqlxdWDASvQ42E6Eo1uRfCnNxEBeglZKS8mISgYCmUY4lqmJ3PRAa/BR7dbxS/Un14YlCFHFJK8UjZrFR3GboyUL/IkKNWMu+V0QwckQ7NQOaIr8bvMqwSUD9PfUwiWYNdYitku3EMPPuYzss9LzhX2myve+C7V/MT5IKddERw8W+AYPIs3pziStEZLAHGQZxLoj13phqarPX7JQQcmf+B2F1nbeDm2ajBiCm9lzF4JjV0lcX3U5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:38 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:38 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 01/72] multipath tests: move condlog test wrappers to
	separate file
Thread-Index: AQHVgUPfUtltUC2VTUmF8/qMckPiLg==
Date: Sat, 12 Oct 2019 21:27:38 +0000
Message-ID: <20191012212703.12989-2-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: d3f48095-5413-4da9-d2fb-08d74f5b016a
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317FC8C0183431E264590BCFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
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
x-microsoft-antispam-message-info: DT78T7AuT2tRFbQ12OxjMxtkg3envEaIvBuEFsHWy+iLPPP7pq78wnIqukZCaal5pTwg35Skh2yD0/vF1JC/XkTbdMHiIES21jMQFUvB7FjWrCm62sYiLe/ciGtsqpOjHCNI20dMzx9aIP2R/yjaxvPXXR1eJ2jbWKZKzqcXiN8fIUInFC3QISIBUlHACauBF4OMzAVDBtHPMiN4MwJ0b6NZgCslh4hp8l4Pk1+M2DL0s19Cx8C2c5o2Eb1VnfY5AWX5rOH/wfFDIymEjpnSyngQdKBmHh0LxlT1sul8xX8Cl2ILpr4/7igieuGhHUqsENOdWwC82FGj4hiWRVuEz5Pt1rgRzfPIgvwRzXs4FHaLvMuSTJyHQUrL7wpcZVuIEyMLaLt/DOSQVchn0c6Ogq2KwfklmCKsyiC86PThsxY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f48095-5413-4da9-d2fb-08d74f5b016a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:38.3159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeL4LVf9C6722TfRVxuwcwSWqpCBdtJlYoZrWBKLeo2T85P8ms4DbZnGyUvo+V+i8i4Wl7l+TH8k/XrrmTqguA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Sat, 12 Oct 2019 21:28:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Sat, 12 Oct 2019 21:28:14 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSIaK005916
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 01/72] multipath tests: move condlog test
 wrappers to separate file
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 21:29:00 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

These helpers can be useful in other tests.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile    |  1 +
 tests/blacklist.c | 20 +-------------------
 tests/test-log.c  | 26 ++++++++++++++++++++++++++
 tests/test-log.h  |  7 +++++++
 4 files changed, 35 insertions(+), 19 deletions(-)
 create mode 100644 tests/test-log.c
 create mode 100644 tests/test-log.h

diff --git a/tests/Makefile b/tests/Makefile
index a5cdf390..fb3c067b 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -23,6 +23,7 @@ hwtable-test_TESTDEPS := test-lib.o
 hwtable-test_OBJDEPS := ../libmultipath/discovery.o ../libmultipath/blacklist.o \
 	../libmultipath/prio.o ../libmultipath/callout.o ../libmultipath/structs.o
 hwtable-test_LIBDEPS := -ludev -lpthread -ldl
+blacklist-test_TESTDEPS := test-log.o
 blacklist-test_OBJDEPS := ../libmultipath/blacklist.o
 blacklist-test_LIBDEPS := -ludev
 vpd-test_OBJDEPS :=  ../libmultipath/discovery.o
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 362c44d9..733ee398 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -21,7 +21,7 @@
 #include <cmocka.h>
 #include "globals.c"
 #include "blacklist.h"
-#include "log.h"
+#include "test-log.h"
 
 struct udev_device {
 	const char *sysname;
@@ -62,24 +62,6 @@ __wrap_udev_list_entry_get_name(struct udev_list_entry *list_entry)
 	return *(const char **)list_entry;
 }
 
-void __wrap_dlog (int sink, int prio, const char * fmt, ...)
-{
-	char buff[MAX_MSG_SIZE];
-	va_list ap;
-
-	assert_int_equal(prio, mock_type(int));
-	va_start(ap, fmt);
-	vsnprintf(buff, MAX_MSG_SIZE, fmt, ap);
-	va_end(ap);
-	assert_string_equal(buff, mock_ptr_type(char *));
-}
-
-void expect_condlog(int prio, char *string)
-{
-	will_return(__wrap_dlog, prio);
-	will_return(__wrap_dlog, string);
-}
-
 vector blist_devnode_sdb;
 vector blist_all;
 vector blist_device_foo_bar;
diff --git a/tests/test-log.c b/tests/test-log.c
new file mode 100644
index 00000000..76a266eb
--- /dev/null
+++ b/tests/test-log.c
@@ -0,0 +1,26 @@
+#include <setjmp.h>
+#include <stddef.h>
+#include <stdarg.h>
+#include <stdio.h>
+#include <cmocka.h>
+#include "log.h"
+#include "test-log.h"
+
+void __wrap_dlog (int sink, int prio, const char * fmt, ...)
+{
+	char buff[MAX_MSG_SIZE];
+	va_list ap;
+
+	assert_int_equal(prio, mock_type(int));
+	va_start(ap, fmt);
+	vsnprintf(buff, MAX_MSG_SIZE, fmt, ap);
+	va_end(ap);
+	assert_string_equal(buff, mock_ptr_type(char *));
+}
+
+void expect_condlog(int prio, char *string)
+{
+	will_return(__wrap_dlog, prio);
+	will_return(__wrap_dlog, string);
+}
+
diff --git a/tests/test-log.h b/tests/test-log.h
new file mode 100644
index 00000000..2c878c63
--- /dev/null
+++ b/tests/test-log.h
@@ -0,0 +1,7 @@
+#ifndef _TEST_LOG_H
+#define _TEST_LOG_H
+
+void __wrap_dlog (int sink, int prio, const char * fmt, ...);
+void expect_condlog(int prio, char *string);
+
+#endif
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
