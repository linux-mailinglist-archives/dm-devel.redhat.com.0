Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 118A9D52F1
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:48:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19CA230624D0;
	Sat, 12 Oct 2019 21:48:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF15460BFB;
	Sat, 12 Oct 2019 21:48:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76EC81808878;
	Sat, 12 Oct 2019 21:48:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLXcRa007442 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:33:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9B525DA5B; Sat, 12 Oct 2019 21:33:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DDA15D9CC;
	Sat, 12 Oct 2019 21:33:36 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30B83307D971;
	Sat, 12 Oct 2019 21:30:51 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:50 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Rx95sTwF+fJV0LttyHcZDha7gvvRzXOpM7/pqKtjpJz0bGPCXAiM6zcfUlwhhWaM49V3qsm/FxXhcC8Mm0KpF4ogpUh0QrwuYwET3lOGkiueOVUo1UW+XTKtNOGNj1K9C0+nWpZhLfubpmI/QmiuKA4zbAluKiQWKvHCJiHmfupwfN5N0fw/sAhoE31AnPW0vpS+T49+/mSjz+DIatuTNBKR+0JAou9MEOROz2xjJlZnaNu+95XoOMoxmQCfZh2eHX7fiUlkxjawFvCoxTGgG7qD7LpaMN6Ucjf5PGstQLQGFKZ1TANULoX9Fb6z2EUc7sPaAQQtxsr5NvCDlZiMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tOi/4PAiMt+mJYfz/m3vEu9yBjG9RueNR4k7Y5o3HQw=;
	b=IQSBjPX+Vs8fIMWWaXYCk4MZgTr9NJOx9IxuBbSuHLzC2zgkd/jvA8pvndEmX+gCL6Nt8nB1aGijDsvvXJoW73yNx2gzThLTpAisw3zXlO+7aHmamZF4EKGIQ8G8un+wwfjZvvNh2oKKtohjcRNyLzuBLiY1fsx9ShIM5KG2yAzA18NitPpJ6xThHbN8+VZwtkVu72lK6pGa5xI7zIYD1Q1DMbOrwt5or9ERfoXgZRejeVnE1G9ILJF5076/S5XUqFadHmmNZy+ICQ+bFeDogxzz0Z0Q2rtAjhf5MZxR9XHUWE5o99jW2u6oCOiihKl10+gc/QH3AqNX2J6ehmWTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:44 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:44 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 30/72] multipath tools: mark unused arguments in thread
	routines
Thread-Index: AQHVgUP0lYf2ugpUc0Gy/w9QXKcjIg==
Date: Sat, 12 Oct 2019 21:28:14 +0000
Message-ID: <20191012212703.12989-31-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 80c8b0aa-806b-47e0-79fa-08d74f5b1727
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331782334F769D0CD02DABDFFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:147;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c2v1JcZZmHndd1CbMBVFTspmk1680ZEf6HWIxlXLaplzw00+Nn57WCvTlYFMPsIXqSfd1Wiw4p672Im8XOJqFn6Sc7wOC2X5y/hZDbFmQIGNkHuBsTDxx4nB1OQzZKQA7YD2JN/07AHeez8J23AtVpRL3QVtlPp6S8yldqoyYdyihIUFj9MB5QpZYxEPka5NGIwMGV1vB79yz28fLH7qWdfEcqm6Z0hQV61zwps7244ytUWa00FOH3ha6eKS6PyXj0Do5Ff3+Y63cjKThxreURBBfsYFB9Fkn32WZ5rNy2kSubZC5XoMlANZRy2BST5kgNyY4bv8QoywrEiue6AaSFnEDXLbtJPbfT85x93KZksW65XCKacEj0lalTyeqJ+HikKREeiffsUT/A+BCYIjo8l22xYT4WNhCUqCSzSmQYw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c8b0aa-806b-47e0-79fa-08d74f5b1727
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:14.8134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3uPd/tbSDbFcj+G8jSGbRi/qlrtv1SMCSwpMYdY1Q218h9aVvhtB28R8v+DUPIdNfskTS9AS/KNcQHPZq6HaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Sat, 12 Oct 2019 21:33:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sat, 12 Oct 2019 21:33:35 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLXcRa007442
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 30/72] multipath tools: mark unused arguments in
 thread routines
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 12 Oct 2019 21:48:10 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/log_pthread.c | 2 +-
 multipathd/main.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
index be57bb1a..15baef88 100644
--- a/libmultipath/log_pthread.c
+++ b/libmultipath/log_pthread.c
@@ -56,7 +56,7 @@ static void flush_logqueue (void)
 	} while (empty == 0);
 }
 
-static void * log_thread (void * et)
+static void * log_thread (__attribute__((unused)) void * et)
 {
 	int running;
 
diff --git a/multipathd/main.c b/multipathd/main.c
index 43ae42d4..e55f2795 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2792,7 +2792,7 @@ set_oom_adj (void)
 }
 
 static int
-child (void * param)
+child (__attribute__((unused)) void *param)
 {
 	pthread_t check_thr, uevent_thr, uxlsnr_thr, uevq_thr, dmevent_thr;
 	pthread_attr_t log_attr, misc_attr, uevent_attr;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
