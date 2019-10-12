Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0FD5297
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:29:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77DFD1DB0;
	Sat, 12 Oct 2019 21:28:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3380410013D9;
	Sat, 12 Oct 2019 21:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76D5E1803517;
	Sat, 12 Oct 2019 21:28:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSJ5i005926 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29DE85C22F; Sat, 12 Oct 2019 21:28:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 959A45C223;
	Sat, 12 Oct 2019 21:28:16 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D476E10CC1E0;
	Sat, 12 Oct 2019 21:28:14 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:50 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ezIKU4r3SOpnrkGDpsDZrLnQ0mNG8Gv9C4pdOUyYpGL/9GKYWq86tlywtURI7Dzm/mRQxRvwnd0kBtGzLzuS1N648Rvc9fz0x+KYaUkScabVNDtRXQg92cXdf7FMAW0AAqaXA8GjZ1NDhDL+j5kHc5MyuklYCmJyRlS23ad2pacoOBTIspsalmTTGwnzIy3sHKKJEy/ckhQxrx7zYE7DdBc5GUar7/DS4yHWYyFHdHAVtdsvYpMBMK2hq7ZGpJ7F2EoLBiBxUV8Qv1ysHmph9rNwxZk7fYsNVvckfpzyQnPiVNq8wdRp+ne4bbuumWwgum9T6OM9FGz8B1F9I8Z1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TYf9COWlrjjsb3wkntfzZoZ+JRRXRJ2Mej1VxOSps+M=;
	b=B6Bw5wfntYnr9tX6lgpuTWXwx2ftzYKk5wd2TBs68kxU9UBJ6XLDKn3ROrg8lCiXTi3lW+4OVx5vhS1zCupq6PV4nUDVBPQ4SJAl04OfxFy6J/W1BpNEpOhGyazu+pWGvOwkwipUnq3Vw1Q6/sU+Lq9yHfPO5A3kBwOZorThAmjBTesHpXO0d82qpRqLP+UGc/fI0tmCMwX8ILClSn40JOfcBNobwwhn9KREIH2mn5S0jRDzxQXDZWDGpW/3QsemZKWqNnGfvQt7egEUcAXnq9mvXwn09VNiEKugUw3o6QX6p0yNF9nzmFIBcqzrTYskhK11LJPug6N7aokib3KZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:44 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:44 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 06/72] libmultipath: scan_devname: fix int overflow
	detection
Thread-Index: AQHVgUPiigmZ0oY4f0Shl8VUC6Ag2A==
Date: Sat, 12 Oct 2019 21:27:44 +0000
Message-ID: <20191012212703.12989-7-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 1776a4ae-4a1e-4b4c-6019-08d74f5b050f
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331734BE1CDC81BF82E76838FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(52314003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y1yrpFX8Y2dEuAZZkUIj0S6KHGLp6E9WC0m7rNA86CE7WcGzAT4Z7FprKu2K3X0XAjGHt5xwwFOU2mQeZjSfn9wEIQzueBY/HFJhKG7bNxTNkZpfGIrzGPpgMVZQd9LtTaJMVXPla6vOucf9kHFl4a0dy9FDi3erLAjbX9Cp9jjJ6VW2UUP6rUo/DVcu11OkEV56rRdaOWggXlk2OO8xThgT3wUphFvKH25ekhmsIRcMYM2aRGpuWTnG8xbXMk3duY9tVXSDjsKtr0vvQwQvqPKD1llwSOamw+qBcfoCganDSvAzGuWblcb2QGN02oAT6elwRqHjysTJu8q6Odi5UzYD3GqAvH+MD/293yHhKQa4pwH3ifwtnFE5mChYfFQj9mHV5i71B4TSqKdSMGP8Ax/xEyV5DlAfnvXA4kpLYjE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1776a4ae-4a1e-4b4c-6019-08d74f5b050f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:44.4694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfgwyNvR1CvIvXOo9k0OeJO9a22Q2kTerElDYRoAyifM3MIOijxaNUoH4i84EZo1D5XS/jYwHH1ZR2AIyRDIEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Sat, 12 Oct 2019 21:28:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Sat, 12 Oct 2019 21:28:15 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSJ5i005926
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 06/72] libmultipath: scan_devname: fix int
	overflow detection
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Sat, 12 Oct 2019 21:29:00 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

For an int n, it's possible that n > 0 and (26 * n) > 0, but
and still 26 * n overflows the int.
E.g. n = 0x0ec4ec4e; 26 * n = 0x17fffffec, truncated to 32 bit
yields 0x7fffffec, which is > 0.

And anyway, relying on a signed int overflow to detect a problem
is wrong, as the result of such operations is undefined in C.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 0fb206d1..a96ba5cc 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -77,6 +77,7 @@ scan_devname(const char *alias, const char *prefix)
 {
 	const char *c;
 	int i, n = 0;
+	static const int last_26 = INT_MAX / 26;
 
 	if (!prefix || strncmp(alias, prefix, strlen(prefix)))
 		return -1;
@@ -93,9 +94,9 @@ scan_devname(const char *alias, const char *prefix)
 		if (*c < 'a' || *c > 'z')
 			return -1;
 		i = *c - 'a';
-		n = ( n * 26 ) + i;
-		if (n < 0)
+		if (n > last_26 || (n == last_26 && i >= INT_MAX % 26))
 			return -1;
+		n = n * 26 + i;
 		c++;
 		n++;
 	}
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
