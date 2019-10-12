Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F360D52D7
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:36:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE3FF796EF;
	Sat, 12 Oct 2019 21:35:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90C775C226;
	Sat, 12 Oct 2019 21:35:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E3231808878;
	Sat, 12 Oct 2019 21:35:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUlkc006811 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C43406031D; Sat, 12 Oct 2019 21:30:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 691EF60468;
	Sat, 12 Oct 2019 21:30:45 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14C4510CC1E0;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:37 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OS1wu5MEm6v3WAaChueqb4Vt+7zfYo6mo9+BJFTfI7t5LkkBHa0dZGG3TAV1jHTlVRxPBqnRVPKIv1luwHtwFrcz3ZtVleHeAY9Rtbg759PLzGDsh05fOZyPZ6InA7ba30BVoYMZyIDKkmFzpKBOJ9QJ86k6ErOnliq5RyMWQ46gtS4ifYB5zFXI4KTvmQEyxe0AR4AguAZLHYWP4Wo49ffBc+zA9IHI7hEQFvRKCWIPTJl5jGtDd72pai3h3vB+8JqlmPkAgHD12pJh5EV4qqXXiKO6j/9brC5JHIFKXmK7l2OopeCkHSWxCkPmxqR4WxsfAiYorcb6r7VE8A4+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JIA9/rWiMiwzrJECbjx2OLR74kVGf2CPN1oBPBaIim0=;
	b=VKrBlLk8r8Pa+QqjTCkAYs1s4F5G6rLBzw0qa7B0tFXQCPsS7jHExnsA4EvNF7FBwp7Tu8j8boHT3HFKQcROdwkm6K5MMeeNvoh4glnwoloveacWcctjutz2vAEajLEc5aZ6m2gqjlXOD7Z124hfFI7bpsIwJzqELb0zcCO3tqGjHTxmKirRY7UUOYMC7EQEo6rTrBCUsXIqL7hQkUjFF/2DnG5+Gwmbts4kzhj0EWsydqJEHWdq2lN+yZrAGA42Zo/V/ZLAfMDUFbwUStZum2US4rZT31OaXgJdonQ1kz8lFVeBDj6tElzj3OzJr70HWi6ChlB3e1nPUgBJdu5x8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:33 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:33 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 63/72] multipath tests: fix -Wformat-literal warning
Thread-Index: AQHVgUQNu1OZMsFNrE2juHATJ8/U0w==
Date: Sat, 12 Oct 2019 21:28:56 +0000
Message-ID: <20191012212703.12989-64-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 9786bc31-e65a-49e2-8a49-08d74f5b2fbd
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331716355CA130892642B6D1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
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
x-microsoft-antispam-message-info: Zvd82Q7o13/8LYQ6S7llvbe9oGUlGv2nUTFuq1mLDSSmYWxdzdW7kPwslS6oeaEdl5zbqZU4uzvXNZ8RU4bAXa3SQ4DaWGsSUmCpVudjo+d8P7tLPiigFTsbIoQXG81V6dMI6jiQCpCozOG00LViR38ap2Yk8/pC+yl5gd5eSEQ3AsZ8Vw9dZeJxG2TsLACdVTAbeBQpWqrQz8kUz8hhOIg74tURu2z4mxgMwyLbYIe8ff8NBKh7Bd8F0y5UyTHZOqdYOZKFjW/34Jc3t1PlkyHURKvP/RO08kaUJqoHumzGTrtVtV0SQJGkufSQA5CRgC2Ajwbl7NIIWp9VRBkM5MJMIV8vswgFXpgDyLL2GRhqouAMQKuwazw1cky+7xmblldc2UoQwrEPz/1nOQigoFMnv/VOYPYLg7UShNDSmfY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9786bc31-e65a-49e2-8a49-08d74f5b2fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:56.0652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7hxGX58PJ9LkRM0snAbH0yyikrTdFNYA4KINvhfKZ8xEJz4VBEIRzyPkPbfalo3gS7/CztIeCwk4U0ff32Gmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUlkc006811
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 63/72] multipath tests: fix -Wformat-literal
	warning
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sat, 12 Oct 2019 21:35:59 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/test-log.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-log.c b/tests/test-log.c
index 76a266eb..d685d582 100644
--- a/tests/test-log.c
+++ b/tests/test-log.c
@@ -6,6 +6,7 @@
 #include "log.h"
 #include "test-log.h"
 
+__attribute__((format(printf, 3, 0)))
 void __wrap_dlog (int sink, int prio, const char * fmt, ...)
 {
 	char buff[MAX_MSG_SIZE];
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
