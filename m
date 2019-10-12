Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 06410D52F0
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:48:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35F9F316D8C8;
	Sat, 12 Oct 2019 21:48:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096735C226;
	Sat, 12 Oct 2019 21:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A9534EE69;
	Sat, 12 Oct 2019 21:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLW452007148 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59B01601B3; Sat, 12 Oct 2019 21:32:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C4D6017E;
	Sat, 12 Oct 2019 21:32:04 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D949B10CC1E0;
	Sat, 12 Oct 2019 21:32:02 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:09 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:55 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KmRnAr3erZi2usTpKgCI5us798lgydJYGJof58VMLSXORCXHTACNzJrNnKmpRFHJxil6U6UtP7FdJJngqIGRzjGzvBTnRI9TVDIgig6FiOpR0rm5v09qStS3sRhk3MvhXY7dLGwHp7bQLS+7yc95uIZvj+Bo/iDH61JbDsJxRCQvqScnLJIxWU798UeTO+jyFpaFU6jdLms9gGdpXrraAHVTLBX/wr92VY4CsfC7XU+rh+/rMDGwebsxX6jQm0PM7jlpIPXg0h9KkkadW2lut3a1KsCo0AKnIA0Yer00Mt3GcKuNIV9KrjyGv0tuHwRTSBpZjuGRsB6jY66u4dvNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CAodbElx5YoySF2fPj1YFFWXE796u6IwWZjvWLOgKUw=;
	b=ogu1PNcPGJig7nwiyxpx3LMS8k6E38vv2lrXYcxCxzIlRWgXaTLUMTMhZOYk4Z9C3f88DYFoiCgEVdCdbyEv+u9yJU9GtlI7wBInx4mkjaxE8A4wUFeDXSWbZtRuPsvP5rvGiXJB2KXUniZN9561tf1Rdo2YroOvF+r5Q3MFiGrHmNIpH10n4R3ri9vU5Sicqvap02Ccs3zMaCtuVEaJPaDGJPmT5+0BdPa1WksIJqf1w2rqeM3kgQNHNZ5pYCgQyomc9qTvSfQiLoJxPZ56nuzUyxaItROVJYJl3AjIHS+0yO86tpsOKOYqOTubzr4aH2jhKVkj0+CDDc+o7JOPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:51 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:51 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 41/72] multipath-tools tests: add -Wno-unused-parameter
Thread-Index: AQHVgUP8opJncuXnX0OxbqXphvLM1Q==
Date: Sat, 12 Oct 2019 21:28:28 +0000
Message-ID: <20191012212703.12989-42-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 9fb7c8bd-f20d-46e1-0f5b-08d74f5b1f51
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317B7CF78AC6905440C3D72FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:107;
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
x-microsoft-antispam-message-info: 3ivr45owSM2ANWpSdSox/wAtrsNP8il8qMPJwcVS4UJjqz60XOZDQTba6UfYifFZ27KzMvFh5I5zSwMlMX4DxlxbZkcIn48tHjq5dyP6FVhyzQa4E7b9I9rkHcacqGMtYez4Ly6ndGeM7YKi/dxUW1WOjrtmYPBzhZtvaQnVhaGRs5VvD7cOsOphEwOkyVj3b0QDr9wyFZ1MdxGtE148HqkiafqlP36m7IxukQVgEXiWzY9TwYsB/keDM6WLwQuO08P//yzh4L143rSAbnRFUmIfWF+ntNlr2+w2q/MHr0u5WSwpli4/0OMWc0X3Doop1sFsxnm3ur8hO1CEacyy79gS3i+MUWRQx7fRD5FFOG6H1UvHTLJ5VJp5LeMADA6+pjot0AjOpnqM3Kdo6Ski2vEasfxhBy4aLWE+eHBLXFQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb7c8bd-f20d-46e1-0f5b-08d74f5b1f51
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:28.4887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8bZ+p761YhGJI/V+wYpF2BW9FmhnoUUIgxDIugMAvflMy85rkNpQhSZ4S9a6DI4kanUlai0BkIidGN8NS9JRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Sat, 12 Oct 2019 21:32:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Sat, 12 Oct 2019 21:32:03 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLW452007148
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 41/72] multipath-tools tests: add
	-Wno-unused-parameter
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 21:48:04 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Too many unused "void **state" parameters unders tests.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index 0dce8571..60338f14 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -1,6 +1,6 @@
 include ../Makefile.inc
 
-CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
+CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) -Wno-unused-parameter
 LIBDEPS += -L$(multipathdir) -lmultipath -lcmocka
 
 TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy alias
@@ -56,6 +56,7 @@ dep_clean:
 	@sed -n 's/^.*__wrap_\([a-zA-Z0-9_]*\).*$$/-Wl,--wrap=\1/p' $< | \
 		sort -u | tr '\n' ' ' >$@
 
+
 # COLON will get expanded during second expansion below
 COLON:=:
 .SECONDEXPANSION:
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
