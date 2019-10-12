Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B8589D52C5
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B00518C4273;
	Sat, 12 Oct 2019 21:33:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23E610013D9;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A541180B761;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUwwT006886 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FCBE10016EB; Sat, 12 Oct 2019 21:30:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6C5510013D9;
	Sat, 12 Oct 2019 21:30:55 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A35DE30BBE88;
	Sat, 12 Oct 2019 21:30:53 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:15 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:40 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=B0Js+yE7Qx2Wi1KuVaV9LqEK87hHrkH+a6yAurk3g56Ym96YzF8BoVIs4fgPW8T/SwpCr+NuXJCFMjPCNZ1jyLlLQJCd0gLsCHW2HgguQLGw6xTMTkbJqyBkC7l9qcIpv+PregXOR55yOGEmFFOllZ65w8JFCW+2vsI0ypnyeqm5aH7WvE/Tk4bx1SqJdRigg4CYLYhc/6EFT6mDEzqtqOCtuf50Wdk73N+OVE4sYV5Ib3lvyUkiAlAdgUQaswmshOn3APaHfm10sCGT0OsdRkRcNRCsMY0pJooJPvZfZO5bVn2YZwaXXIMXEMvKf1DoeMrI73Nj9ve9jnWUabFtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KdlVaK3eWcuuRvKbZxWDnJEq6mN/6l4hVhgcANi/sxw=;
	b=Fej1IjUgf3DQM5cBWviK+ZCxj9zHK03n4KNa5G8rEgOvj29/0+bgS3gvfT922cKRINIe+teCTjKug0WhQwO/YtaLmjCrRiTrlwLYayB+bm88l+3/2ZRDO0YLnmJtrW0c4pz6NjCgoKyExVg/rHx5Z9hsZ6HD8FfV2I9IDvRmnvBdPe95y5FUPsVKT6WlyVtE/t4MWCsS2UGV+3TuhW3tQaBDZw43As/eak+hvYkBj9dyZ46szbsGHCKs8NynxdSaKdQ/xZn4dpUMUuulSt15UMk0HixZdrim+Owc70tYLYetMkE0ozJ6JfQnCmwyL6pAmPXkDY9812Kerh1Qfd+NDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:36 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:36 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 70/72] multipath tests: Makefile: avoid gcc 4.8 missing
	initializers failure
Thread-Index: AQHVgUQSZdY5u0U9D0K+yC1ayXyCZQ==
Date: Sat, 12 Oct 2019 21:29:04 +0000
Message-ID: <20191012212703.12989-71-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 1e0099c5-947a-4130-0ff9-08d74f5b3508
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331727EFF0B142D07C02C034FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:224;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hskX2bhz6++DVO/R0P70r03QhkFnTeciA2Fjywp9opqHR/HYu/2Ph/WIEj6um+fFy2dzT/2zmlGAi4zAEaKwZycIb7HcV6jEba5R0vtCe8oXkgvEJwlV+d38p7dQFCRYibi52ieYFrYfNV7CH0vIJM9M/XeCBCVSLETgnrqzztxDcUl3jyD35yQpwHIKvPeEIb4uaqtS2cPkpU8Psd43tt7QzZXpuVdZZvtyoF3rfKtGKQKREl6Azlz62SAZ0K6jv7tFSGhWyzjcEYc/iv6VRJws1eXrfSERKCT8GA0w938d4MpmLJP9/u1mhIJdiywrNbIoGWzTTO+fp9+8OX8K6XDeL9AFaE5bQ4NgYnGAsy7fHl+1gHtqLPkGJvMIU2r3f1/YLlCOpuR1cN+anwvuVZBrXjVf9ajJauORU1WdMCI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0099c5-947a-4130-0ff9-08d74f5b3508
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:29:04.8152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLMopK1s85g6UM3ZZt4UjKLNTBoWMkJ5VSk2Jwq8VG+H/+IXoaXfI4a4ShUq/AO8r448IOLI5SVTOeNnCuLQJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:30:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:30:54 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUwwT006886
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 70/72] multipath tests: Makefile: avoid gcc 4.8
 missing initializers failure
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 12 Oct 2019 21:33:31 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

With -Wmissing-field-initializers (implied by our current compiler flags),
gcc 4.8 errors out if nested initializers are missing:

struct A {
       int a, b;
};

struct B {
       struct A a;
       int c;
} b = { .a.a = 1; }

Later gcc versions and clang accept it just fine.
Add a test to tests/Makefile and use -Wno-missing-initializers if gcc 4.8
behavior is detected.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index c70b8399..c9406e75 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -1,6 +1,15 @@
 include ../Makefile.inc
 
-CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) -Wno-unused-parameter
+# Test special behavior of gcc 4.8 with nested initializers
+# gcc 4.8 compiles blacklist.c only with -Wno-missing-field-initializers
+TEST_MISSING_INITIALIZERS = $(shell \
+	echo 'struct A {int a, b;}; struct B {struct A a; int b;} b = {.a.a=1};' | \
+		$(CC) -c -Werror -Wmissing-field-initializers -o /dev/null -xc - >/dev/null 2>&1 \
+	|| echo -Wno-missing-field-initializers)
+W_MISSING_INITIALIZERS := $(call TEST_MISSING_INITIALIZERS)
+
+CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) \
+	-Wno-unused-parameter $(W_MISSING_INITIALIZERS)
 LIBDEPS += -L$(multipathdir) -lmultipath -lcmocka
 
 TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy alias
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
