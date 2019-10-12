Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C2458D52D6
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:35:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F975309BF21;
	Sat, 12 Oct 2019 21:35:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1DFD601B3;
	Sat, 12 Oct 2019 21:35:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69E514EE6D;
	Sat, 12 Oct 2019 21:35:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUfor006749 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C397110016EB; Sat, 12 Oct 2019 21:30:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BB710013D9;
	Sat, 12 Oct 2019 21:30:41 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6826F18C4272;
	Sat, 12 Oct 2019 21:30:40 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:56 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:37 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=i/bMg3bcg5BHVcqBQ28TVYQsilIC+MYQfy/ml5syXP3iRqZ6RkUv7e77EkUxb3xlboKTwa0l33bODU7plcjEl2lH8WJOjNlFUtfowG41aq/tyfdiaYOxa4dglYl1PFqv3N7da6A6975GAGmcw/EWvhB2svvkihiZcw6a2vFtZh4xqRua0Ma+ViQQaJXjOxtIlJrc297TTnssFO2l89zmQxgWjZBIshc79XH/GA7Bhp8MxSa2wkQlFCFJdI2tYYFbMJSsZGO12pK1FJ0v/rj9SfI1RtjSXnRFjC2+RO8/uuGsnF3vjZmH+0ym+6pvAkEaJTUsoGjbvPs1gMbMbD10GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3LSE/G0GDskcWAVfXFBX9V9l0ubN/6veEo6jEFnGWlM=;
	b=Uv1ieweqGmdeOm0oKdCIerUKnApHwwYvFXxbClmsWBv37tsLS2sg2nmJMtYS3mAZuCXfKNUReh0NYiTupHzNT9QZHkfAeu57pJF3t2jyLToLPf3cu0wpcqwVEiBz9znivC1T2CzVukIROHoFYOt4TN3JRmjznpNwwPH6sostjqakB36MHLPTi+pqtLklihF6pjttNMD8a6vXj6bHjtMRfCGZ38Ma8L6UjFxonrqJKfTxJUrB76XUonrnKyDIFdXkKoWz01w23p1Bc55zeXNCkCtD4IEkvXvOPHzriBKL5kgWcT585bHkLHIUrwlsWNtyHamCCiUEw1c7xDkA8r2zfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:31 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:31 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 62/72] multipath tests: hwtable: fix strncat() invocation
Thread-Index: AQHVgUQMffoOTC1CLU+p9+j9NFSyfQ==
Date: Sat, 12 Oct 2019 21:28:54 +0000
Message-ID: <20191012212703.12989-63-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 70428adb-9c3d-4732-b66d-08d74f5b2ef2
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33173E00BF74C0297FFB82E9FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ngOSgaiDpWcdNu1WYxt9/zNZOHQ8wY1B6DBrZf5OOFrphPYzUJp9ECiV5Etxi/UYa3pYWRTuXvXJcPP+3DWTBJrlQ4A8PkH8yePmd+OkIBR3nLWvz6WsiuSGq7+tD/PZseIZTrbbPjtl1WRmIsZD9SJVxcta7/m1ce0tw0Efr7DFUZfpWqfEiN0SVGskHTCumEqYhsOhoLAEnenfqzn5J4T3WGWKKUhSlLioAm6YmaX5Jc9dm2dJOwCwnAZztc8PJNAhFPsipbYP8u9JZRQN7uckjt+7fJ1tLGoEKgKl70xfZoqn9vdj2rOyHQymkaJiHs6HCLi/VG0Dzl6Y5xDEpe/Dbpffib9/Ezgg0sVqZ4hIne+1qBTYgMWOvgSXP1koaDsQuRi3DUGk6oiw26Qn90hs40UvN00Av2rr0s5939E=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70428adb-9c3d-4732-b66d-08d74f5b2ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:54.7519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Q1eUEWQJSEiy2bazX1IS2uXdHvoB4S4wlbd9NgrgHTlO29Dgc6SDMCihH10rHPdAMD1fVxUR3TMyGKG8Y4/qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Sat, 12 Oct 2019 21:30:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Sat, 12 Oct 2019 21:30:41 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUfor006749
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 62/72] multipath tests: hwtable: fix strncat()
	invocation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 12 Oct 2019 21:35:43 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang detected this error.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/hwtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/hwtable.c b/tests/hwtable.c
index 977a5663..473028b7 100644
--- a/tests/hwtable.c
+++ b/tests/hwtable.c
@@ -261,7 +261,7 @@ static void write_defaults(const struct hwt_state *hwt)
 	defaults[0].value = hwt->dirname;
 	defaults[1].value = buf;
 	assert_ptr_not_equal(getcwd(dirbuf, sizeof(dirbuf)), NULL);
-	strncat(dirbuf, "/lib", sizeof(dirbuf));
+	strncat(dirbuf, "/lib", sizeof(dirbuf) - 5);
 	defaults[2].value = dirbuf;
 	write_section(hwt->config_file, "defaults",
 		      ARRAY_SIZE(defaults), defaults);
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
