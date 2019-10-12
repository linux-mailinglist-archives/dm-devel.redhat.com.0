Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D95D529E
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F3019D381;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD1760470;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 305AA1808878;
	Sat, 12 Oct 2019 21:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSTdx006027 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25FE65D717; Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C03D5D6A3;
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 996DBA3CD70;
	Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:54 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=l+SqhnNJkAVjcs+iNMOW3naf1e+M0e9cvX+sAWE26uOPRGD1/U2nqbLNGfuAng8fboKT+A3dKphMocVLQExtIDoiZ83WV7F/WXVshaUUZcCUF06tF2lOasl7bR5SnzKz+Z822AM6oCVuyU+/uvSSsO/k+/svHdgJtsomyfV2Ie58cpCA75DceoGufo5Geaif8pcsm1qYH4sUDEsVqG87XcT1LeZbRAaOnur2EmhQ4a8sdGH0qQwuPAQwwnjPHph/a83m0VaLsMvXKvOvLGgtmm+OIy/ICNX4kPKjegWYmORMroTaKB9gd4FKEBnVTuip1eoXUqGt8C0riEWjUA28jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/1I5s3OF9n5rzA0s2mpe13ab5GIpCFzstQIoVK7Nabw=;
	b=FIXiNjVFHf+htgs1gR49iMl7n+ebNoXzqild0+guEJ5xVDA03oIPr7pVP//ODBxCIQBjZX6AwjazTvWl3mTAZU51AhLiNu1fOg050bHl2smM3fgO0o3hlJX1k93f78Vz2yam81x1R2jRgcdvBYdNDohKtGmOzExuMkJKBV0+SSxfZIxfpiRoiN1JOpzmzMaMKMkuVh+6gaq9Syp8Oftwr7yKZ+iTGsUh1AFEzpg0mNOGuh7VbaLIlROkzr/G7x7WEerl6SToIrxRc7AttFwnNi8WNhHA7k9SqVcvgfV8O7l5ROVPRGkXDMXn3mKXWlbw80arOggKYrri4xRTwl4Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 12/72] multipath tests: alias: add format/scan test
Thread-Index: AQHVgUPni+wtQF4/DkmCgCxfWlwOTA==
Date: Sat, 12 Oct 2019 21:27:52 +0000
Message-ID: <20191012212703.12989-13-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: ccc7655e-9e78-46d5-9b8f-08d74f5b09a9
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317645D2295A274B2301886FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
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
x-microsoft-antispam-message-info: k3hMqwlrI1GzkTZ/wrqzjsVLqDhop7N/QSdU356f/X2tJWAfUUVtyzHHHvOgOqodbIM/ipaNxnzthC4wHmBu0j1+/2w3xqcPzcRPf1cJLaeeOmZgtlhjm/unNVji0I6Q1R1fBKx9dU92lon1SL7JnnlAfraLtEuNYgk9QWOx45bcZWS2mu4LAY1da2OCRO/VW55v0OCnf5P5DKgmr2+ePTTUBtHRBvUjTnsGKo1AH1XVaVk5JFuBFhP7Go0RTL8UOJnRRyTMCn9bCOs0P92JpE3SKPD185N7rtg71l9Zn0ZHODxhOCdoeyBxmZqouzNVyr4+EuvTriuWofSwhJ/UX72txP+SB598hEdVh2+VWfHO8p1fLrz0APOZFBPdBLVOcv4dMS0ZWpzi4zpMhn/M2NfM6c+LU/jq+CFnd20Ull8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7655e-9e78-46d5-9b8f-08d74f5b09a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:52.1821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opJssBDFNHVuiFZAPuCIcRASpzKX+C+Eu9KnbFTgLYEiF25ubOM6N5cLG2N2k6QK22ZOKOrqKOpo3bmpNJsNdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Sat, 12 Oct 2019 21:28:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Sat, 12 Oct 2019 21:28:27 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSTdx006027
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 12/72] multipath tests: alias: add format/scan
	test
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sat, 12 Oct 2019 21:29:41 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Test scan_devname(format_devname(id)) == id.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/alias.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/alias.c b/tests/alias.c
index 170ebbeb..30414db0 100644
--- a/tests/alias.c
+++ b/tests/alias.c
@@ -297,6 +297,34 @@ static void sd_max_p1(void **state)
 }
 #endif
 
+static void sd_fd_many(void **state)
+{
+	char buf[32];
+	int rc, i;
+
+	for (i = 1; i < 5000; i++) {
+		rc = format_devname(buf, i, sizeof(buf), "MPATH");
+		assert_in_range(rc, 6, 8);
+		rc = scan_devname(buf, "MPATH");
+		assert_int_equal(rc, i);
+	}
+}
+
+static void sd_fd_random(void **state)
+{
+	char buf[32];
+	int rc, i, n;
+
+	srandom(1);
+	for (i = 1; i < 1000; i++) {
+		n = random() & 0xffff;
+		rc = format_devname(buf, n, sizeof(buf), "MPATH");
+		assert_in_range(rc, 6, 9);
+		rc = scan_devname(buf, "MPATH");
+		assert_int_equal(rc, n);
+	}
+}
+
 static int test_scan_devname(void)
 {
 	const struct CMUnitTest tests[] = {
@@ -314,6 +342,8 @@ static int test_scan_devname(void)
 		cmocka_unit_test(sd_max),
 		cmocka_unit_test(sd_max_p1),
 #endif
+		cmocka_unit_test(sd_fd_many),
+		cmocka_unit_test(sd_fd_random),
 	};
 
 	return cmocka_run_group_tests(tests, NULL, NULL);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
