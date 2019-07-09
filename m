Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85463251
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 09:45:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 996C4C0586D8;
	Tue,  9 Jul 2019 07:44:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2803E7C664;
	Tue,  9 Jul 2019 07:44:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BDBE18184A5;
	Tue,  9 Jul 2019 07:44:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x697fvPI031140 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 03:41:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 945227FCD6; Tue,  9 Jul 2019 07:41:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 574CB83FB2;
	Tue,  9 Jul 2019 07:41:55 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FFC981F22;
	Tue,  9 Jul 2019 07:41:31 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  9 Jul 2019 07:41:40 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 9 Jul 2019 07:40:01 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 07:40:01 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.246.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Tue, 9 Jul 2019 07:39:59 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Tue, 9 Jul 2019 07:39:59 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 0/4] multipath-patches for 0.8.2
Thread-Index: AQHVNimCoGX8nrfqz02rDb78nBPeyg==
Date: Tue, 9 Jul 2019 07:39:59 +0000
Message-ID: <20190709073909.32112-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P192CA0014.EURP192.PROD.OUTLOOK.COM
	(2603:10a6:209:83::27) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa699494-c5a7-4738-20db-08d70440a540
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3319; 
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-microsoft-antispam-prvs: <CH2PR18MB331998D259AD28613CFB75F8FCF10@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(386003)(52116002)(6506007)(6512007)(107886003)(110136005)(81166006)(81156014)(478600001)(54906003)(8936002)(26005)(2616005)(256004)(6436002)(4326008)(72206003)(6486002)(316002)(102836004)(5660300002)(36756003)(44832011)(4744005)(66556008)(66476007)(73956011)(1076003)(66446008)(7736002)(305945005)(6116002)(3846002)(486006)(68736007)(14454004)(86362001)(66066001)(99286004)(66946007)(64756008)(71190400001)(71200400001)(476003)(53936002)(186003)(2906002)(8676002)(50226002)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cNgHnJJBQgdpRirlNF8BTwbFhrb/mxnTLylimMASHoLiGwTada7ttg5y2DCQznavtXXT5lGMEnAC2eJLFA9CjljSR8PoCIVhUJQMxHL19YmGuKlRURzJblF3OzhJGGf0blqYVM5oQw96aPzSh8S9MbYhkj1OmphBwWfBBIuc3rpnaXQr1bR2YvMV/CSWb5wftAIoJaaGoLmTWfaZiO8Mruw2KFg2JeB1R2hdyWvVoOBmQaTvH/0gEg5ZbzXjTdiZcGF/gU4OaHog2o5GlVTQiksYt5er8yFggGyxpVYBVs7ViM/qvEC5u7TspwM+E1lSYOlEJ6xxm5LXljFZ6znhUXayCJ1CLGcFVxBcXJma5yHkLvDLeLmTPytn9d2ZLnLIHspbOF6duMYkEyaFNdt2+RWP8fRqlHT3rhV+P5HIJUo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa699494-c5a7-4738-20db-08d70440a540
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 07:39:59.7353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 09 Jul 2019 07:41:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 09 Jul 2019 07:41:41 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x697fvPI031140
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] multipath-patches for 0.8.2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 09 Jul 2019 07:45:51 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Hi Christophe,

as you requested, I'm resending the recent kpartx/DASD patch on top of
0.8.2. I'm resending 3 other previously posted patches, too. First and
foremost, Ben's "vector_foreach_slot_backwards" patch. The last two
have not been acked by Ben, or otherwise reviewed, yet.

Benjamin Marzinski (1):
  libmultipath: make vector_foreach_slot_backwards work as expected

Martin Wilck (3):
  kpartx: recognize DASD on loop devices again
  multipath-tools (coverity): assert availability of CLOCK_MONOTONIC
  libmultipath: trigger uevents for partitions, too

 kpartx/dasd.c               |  7 ++++---
 libmultipath/checkers/tur.c |  6 +++---
 libmultipath/configure.c    | 38 +++++++++++++++++++++++++++++++++++++
 libmultipath/time-util.c    |  9 +++++++++
 libmultipath/time-util.h    |  1 +
 libmultipath/vector.h       |  2 +-
 multipathd/main.c           | 34 +++++++++++++--------------------
 multipathd/uxlsnr.c         |  8 +++-----
 8 files changed, 72 insertions(+), 33 deletions(-)

-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
