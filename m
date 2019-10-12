Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD66D52B5
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39D29C054C58;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DCEC6031D;
	Sat, 12 Oct 2019 21:32:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72E8D1803517;
	Sat, 12 Oct 2019 21:32:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUNJk006625 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81C925C299; Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7718C5C22F;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE912CD811;
	Sat, 12 Oct 2019 21:30:21 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:43 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:13 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KZNkXZaTDdB4U1adAwZ4oDoasY0qEJF3HtwaWW9lp9NEchTcehmJJaFsCYLN/HP9QHrCqTZiqVHh+4SRL7H54uaMXRSaQSI9udcreADWSxIjp5TPvd9RKaN2L8Q2Z3FfinTQmWn33rsw376g3IwlrkWa2pC/3syXUIxZ0G942fx3hjcrPPZ8QhZv7Szz30K73AUxAp3mLXgq5+B9+xe9NYsosrx2UL34IRPiZnVCPtZeYBWUcNpr0fHCAlYnnzvwskDPMvOs4swUm10NQWV0MyIjSxUtyXikhwwAuGb7vHMU3ZSN+YylHT9IZGyonuBHaZ7qpnQeyo7Nm64B4YXjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4ucXWcPsRX45PBqBTTzw49MNJ3cBg0QYmm/EMZPsOW0=;
	b=VzcdBGsQwTuuAM4cvlmym6sM/gXseF0AcDSieHyq5Mk/XV0Bhr/31nUkCJuPqG63YPnX5ieQ0Ttc5z6XnyrEehSSICAt2ea4HjYU2JM6GI7jCDHMtxQToUgWaQmPevumL9/2KOCObkU7apqsA8HZI8/P4E4OL/tlsODTft250KyNQSErhqeUIQRh71SZL2qx23x1u7fkAB4ON/xPZIMsMG4BiLOxH3+n8py3a2Vw90K9+bSL4Z4UR0uuSx6YXzM3PIRo52tbbS0N9fPeSayFeHAkr7RusAaiI92+UA7P1yeZCGPkRKFmWZ78vuimtr6UC26jHmkGFj0HepdPg6ZyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:12 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:12 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 28/72] libmultipath: checkers: mark unused arguments in
	methods
Thread-Index: AQHVgUPzsodi1DA3G0Kt64LVWyI5Fg==
Date: Sat, 12 Oct 2019 21:28:12 +0000
Message-ID: <20191012212703.12989-29-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 95903583-4219-4d61-32ec-08d74f5b15be
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317E397B8D2984CC59301A9FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FySeALXUmk0GFDhFw4bLGdh6drTKvnJmegipvXUzW0/zZAY6qOIOupiOPFjV6snV4JVvUIvHoRpVirEY7pRjuAUUGEkK099ozcbosnMaxPrg2mDEGkAvIj1ITHuUFCpr3rb2cmcDdu+HLyIh1IqZoNGlpUGPmtYugk6Z4oG3HArdcWU2BVOsdw4K6uc3eLcGfGefsmB8MCAtXUc52Mh7gfUG2hUkn4J9YPi2nRbzV+3ovldKCSevnY5ZRFx/B10oilvlSgwdmVSx9Dl25yB2AccfS4rLJP8+cYudLHmSvvDlk5FpGAGPTDeH6npgOLafsTrRm0nrM32NZkiawAsR8WX/SyKeKbQHRHiSVkfC+NPJsBD6+3KsuqmfD3AVd+/NG3rBZSJCdAxZLKKpzy3sAG+dYuWYnR7R8SEHMpAmIx8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95903583-4219-4d61-32ec-08d74f5b15be
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:12.3308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGPFn63OFLNVGM8XVzXLCtlDI+UY0zMa1b8+38SacD7TyzEF6kqnI56VzBOASZNokHRfbkzcJ1/Ss8VtihQxMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Sat, 12 Oct 2019 21:30:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Sat, 12 Oct 2019 21:30:22 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUNJk006625
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 28/72] libmultipath: checkers: mark unused
 arguments in methods
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 12 Oct 2019 21:32:08 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/checkers/cciss_tur.c   | 4 ++--
 libmultipath/checkers/hp_sw.c       | 4 ++--
 libmultipath/checkers/rdac.c        | 2 +-
 libmultipath/checkers/readsector0.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/libmultipath/checkers/cciss_tur.c b/libmultipath/checkers/cciss_tur.c
index ea843742..eaf67b35 100644
--- a/libmultipath/checkers/cciss_tur.c
+++ b/libmultipath/checkers/cciss_tur.c
@@ -46,12 +46,12 @@ struct cciss_tur_checker_context {
 	void * dummy;
 };
 
-int libcheck_init (struct checker * c)
+int libcheck_init (__attribute__((unused)) struct checker * c)
 {
 	return 0;
 }
 
-void libcheck_free (struct checker * c)
+void libcheck_free (__attribute__((unused)) struct checker * c)
 {
 	return;
 }
diff --git a/libmultipath/checkers/hp_sw.c b/libmultipath/checkers/hp_sw.c
index eabfa93c..915918c0 100644
--- a/libmultipath/checkers/hp_sw.c
+++ b/libmultipath/checkers/hp_sw.c
@@ -32,12 +32,12 @@ struct sw_checker_context {
 	void * dummy;
 };
 
-int libcheck_init (struct checker * c)
+int libcheck_init (__attribute__((unused)) struct checker * c)
 {
 	return 0;
 }
 
-void libcheck_free (struct checker * c)
+void libcheck_free (__attribute__((unused)) struct checker * c)
 {
 	return;
 }
diff --git a/libmultipath/checkers/rdac.c b/libmultipath/checkers/rdac.c
index 8a3b73ec..d924a9f7 100644
--- a/libmultipath/checkers/rdac.c
+++ b/libmultipath/checkers/rdac.c
@@ -133,7 +133,7 @@ out:
 	return 0;
 }
 
-void libcheck_free (struct checker * c)
+void libcheck_free(__attribute__((unused)) struct checker *c)
 {
 	return;
 }
diff --git a/libmultipath/checkers/readsector0.c b/libmultipath/checkers/readsector0.c
index cf79e067..b041f110 100644
--- a/libmultipath/checkers/readsector0.c
+++ b/libmultipath/checkers/readsector0.c
@@ -10,12 +10,12 @@ struct readsector0_checker_context {
 	void * dummy;
 };
 
-int libcheck_init (struct checker * c)
+int libcheck_init (__attribute__((unused)) struct checker * c)
 {
 	return 0;
 }
 
-void libcheck_free (struct checker * c)
+void libcheck_free (__attribute__((unused)) struct checker * c)
 {
 	return;
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
