Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BFAD52AA
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E9EF18C4272;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 395D01001B36;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B48A1803518;
	Sat, 12 Oct 2019 21:31:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSQEU006002 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 696435D71C; Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9715D6A3;
	Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 501A630ADBAF;
	Sat, 12 Oct 2019 21:28:25 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:03 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dkR5cN6z3KUUHpjndvyEEDCq8g92Z7Zu7LJxvW8r2hRyxgLJO9kLhC0810Xoy0yoB977OXbu6kxA/5sTbOIvkJQ8N1yF5Fjs0SozuV6M7H/AUD1Rl0i4KM96uitYqsEClt95CpdWPZJU7akPqD+YjCxede2ry9Eu3HtGILswol3DV1oNJvZJ3ZW5Cpc+klsNOXhrzz98X8pErMVa5xI6MaBrGQUiJ5k+Dcr4TbhuCVVnoLM1GYJyC09zDqFRt2yBJ6Qr4IxxAbig7fXLfY6Y95QzGP3nylwsq+uQukv0uhbQs+rS6bpa/oxEj7lb8ANTYabxgou1aYvBd0I03aN6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OHFat1GuFXEDHr7G3//pvI57Vc1EElq1bP7aD6mCdCg=;
	b=mq35vmSg4PQVONCUjXlnCS7wDtokhXy7xluseNQDh3Ro6vUtwKQroidu1dHZU08yJIaSq/KwAhAYDgllXz/6rwQdDwY8Y1eq5VVX9cxccr19nuEkkc8KBYGuEuFGMBNZ1w7zL/XPNRAqiLZ9WC/rR49lBZyHfbYt6yEI+jOWbZcgLshXh2Kcjh9BeTCvd9f+PgFsm7zml53+kEQMNeF+lb7Yt1seHdKpNEzqizkOueTdfm6/zqMFsNbpIxz8+y422562iH1GLYiwMw/ZY+RXYjoodCqnvuS9g6oOjyQNs6X4fkK0Md+nH2H4DmsZvWK3ceaKXZfv1yWk+UDC8ihpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:58 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 17/72] libmultipath: uevent_listen(): fix poll() retval
	check
Thread-Index: AQHVgUPrY7KFvL+IXke8okcJ6XDuOw==
Date: Sat, 12 Oct 2019 21:27:58 +0000
Message-ID: <20191012212703.12989-18-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: a1fc9d71-b7da-4dcc-938c-08d74f5b0d64
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317178374C390764250EF65FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcXyWknixZqv/dqrUTFZuEAI1EMUhaPa6CUPfSyVL2XTGXpJYmIxCFrn85lAnk8WRducHDVhuUfVRNYXrBWbCjtehN271VHqGlyjLhdyxyQLLcmFJenXlki+shDB5R8N9Q7tEyfFCKOCU01e+cVmyUNCLHT6AzhAEav8o7U5xe73Dpfsny8ssYFMh4uJo6Lce8mPSZ7l8bIrhHh97WBrp0WWBlZ5Q6bfIChugpDpaONJJnqQNnFMrIszp7cWCXaAaeL1p0qalyijWFgGosg9zehGdnvHvVjpi29DLVbkJTty+wOtvGoLWUzdTDFpPspX2/KIkgIXKqXTpU1wAif+XU9sw3G6+Pb4SBDwEeTJ/NO7Q1WNIRcc7wrW9iW7s+SYBvEnoOkm/FoaelJtxKTwTJbpYvvPndFuMuieerSdocQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fc9d71-b7da-4dcc-938c-08d74f5b0d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:58.4426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F5u5Puk0hJAV2eZ4CPVQm88mAKAVwkk7tCj1zJCqm3z7c0ZCP9a1dvOQ6ikheY2TNxbHlNsWvAMZRVUtYo1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sat, 12 Oct 2019 21:28:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sat, 12 Oct 2019 21:28:25 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSQEU006002
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 17/72] libmultipath: uevent_listen(): fix poll()
	retval check
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 12 Oct 2019 21:31:06 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Only check revents if poll() returns a positive value.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index 8f7b2ef5..f128ced2 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -853,7 +853,7 @@ int uevent_listen(struct udev *udev)
 		poll_timeout = timeout * 1000;
 		errno = 0;
 		fdcount = poll(&ev_poll, 1, poll_timeout);
-		if (fdcount && ev_poll.revents & POLLIN) {
+		if (fdcount > 0 && ev_poll.revents & POLLIN) {
 			timeout = uevent_burst(&start_time, events + 1) ? 1 : 0;
 			dev = udev_monitor_receive_device(monitor);
 			if (!dev) {
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
