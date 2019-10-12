Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801FD52C9
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92AAA81129;
	Sat, 12 Oct 2019 21:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF6D5C226;
	Sat, 12 Oct 2019 21:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39A1D180B76F;
	Sat, 12 Oct 2019 21:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUAII006518 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 354096092F; Sat, 12 Oct 2019 21:30:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 717FB608A5;
	Sat, 12 Oct 2019 21:30:07 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60419316E535;
	Sat, 12 Oct 2019 21:30:05 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:27 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:55 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hufGDckSClQSDWilujzKaYmKtsmtNt+t9Sk/03HBTqZCnpGsCfLejowmcdjl014a2B8oBbcdl/RCUd4sMFC4DwAq15OJPvzyZQiyVIaJL0ZPi8UhsAGtE1Wqr7qkXK3SjndX7EJs3xiFdyFl9jk+9FO/SYf6Bd1Dt4lnzAGXDVifO3LhpPGrYnbaoF7DpyYXnve0EyoHpo69vDM4+kMbzKCJ/DW7KUFnxQgW92ABGgqEMd0fHqHCqi20aHlwmFkQqPjVrsfklev8OCF49SYn8RY75qlvrNKA49TtOf1MCiQEu8Pu6Q1HZlMwlxEw90M58K80CSWIS+irlKvFqCexAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GuUutE6yO1Fd1YLeopVVsO8ouk3XxGRq+zUYpiGLXfo=;
	b=MP2Zc1kmmszDCDyjaCzMDcv/gFwcms8abeP7lbqCQ6VpN/NeguWD+VCXTtdMjS0zRYq3QOYiLeoyE1bY7vyDF45mdXCQPa3n8tEQ6vQ0/ohOreuj+G7qHlW3NSsfP7c3qVMNXOiP/i128kdgUs25jrxEv9MH8pmeq3I9MAv+Yh7ocGGyx1ePsTa1oWJsyTF7pQtRsj9jMB4q2a57GLeYrxmqqAYBYyiOqW9Y7iCuSmtN79owJpNHmabhF1gvZVHiBvOStvzytD1+QSJ7y0yxLWER9x1BWP2xLE4HqHd9m7OsSluiXEaNraziANjYB9p0Zk8KCArsPTFafHS/5uqSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:54 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 14/72] multipath tests: use -lpthread for alias test
Thread-Index: AQHVgUPo21WZ2c5n+UKwOtczpUMYKA==
Date: Sat, 12 Oct 2019 21:27:54 +0000
Message-ID: <20191012212703.12989-15-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 8485c3ea-2fa6-4e54-1d05-08d74f5b0b36
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317EC43908B0AD390FD5BD3FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7/2PvVZZ9eNxeR1/PGGSl4ndyHRW6HS6v3FTphKZ1PgZejqMlmmpSFZG5k7fG5CIiECB7A0c6iaAT0BG/7+dPmlmAZUlhypyPi6NAb1FOFdZVHe+7l2mlW7AVW/OWP7GyZ559pRDc5t7IuDQraZPRyaacN6OJiBkL6V0uUsIrtncotor6BR+8N9CvU3lgILtXUIfnmuM3YLVcSPzfqltkPCztZ1UdWN8lkTWvQ0J/IEr1WuDvFndXyugDKfMeEPR3rP06qyIkNpxFaqmXigiMxp8HGBt5y688Z0iHI3m4Mdl4BV8cJwzta5Y4yRl8mXnjEsjjWsT6TxY+dNgq8NOw9Pt1QKHqi69TlZ4MFkEDbSC1F0GHUTVYe1y26JQMX0CYp/YS+ZrJbp7um4+SF7okCHGSwNZwotASWXUoJM7bvM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8485c3ea-2fa6-4e54-1d05-08d74f5b0b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:54.7826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YBlUB7CIDu039MxG8BRSPqqjAakWzcUADy5b4Ldbm84SPCLVFu/8hGMQ5DxAQAHRC2JOw9xQ25z2AyFds93lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Sat, 12 Oct 2019 21:30:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sat, 12 Oct 2019 21:30:06 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUAII006518
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 14/72] multipath tests: use -lpthread for alias
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 12 Oct 2019 21:33:55 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This becomes necessary because of the previous patch.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile b/tests/Makefile
index 0ce318c6..0dce8571 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -29,6 +29,7 @@ blacklist-test_LIBDEPS := -ludev
 vpd-test_OBJDEPS :=  ../libmultipath/discovery.o
 vpd-test_LIBDEPS := -ludev -lpthread -ldl
 alias-test_TESTDEPS := test-log.o
+alias-test_LIBDEPS := -lpthread -ldl
 
 lib/libchecktur.so:
 	mkdir lib
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
