Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A1D52B1
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE4D01DA3;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5FCD12C53;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EDA2180B536;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTCiw006255 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE8676031D; Sat, 12 Oct 2019 21:29:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBB8601B3;
	Sat, 12 Oct 2019 21:29:10 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EED93309B149;
	Sat, 12 Oct 2019 21:29:08 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:15 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:59 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Fz5h22T6zLQp76jRkoh852h2c8XoRseVOCWjxG1LHaa1yEqHRfdhzThIZmd+1AX9pj/S/y60c8g3EbMmxbyOMCERae5G5nPbOe18pOkWsUMM5ewzqfVnwvK1SEuO23QZr8ntO2CWRp4e1Bzz31y62qupPsjzb5g2B7wfslwxgFKtNflyPNMRHpgE+uUrQ5qEYP2I51UzMEFpaWVfbQ38SN/1mHmXgY4Xx8SoIlxbwuS1zKIlyS8Ru+fevsIGYIBwGlLKO0YTv6jRON4IUpiYz3EPtEhc764ewVKS3ddLU6hqkVzu6xRBamooSlA9ES2vFU7nKzWgOWKC0yHPAC+EfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5MZdOkCNogQ8WE2wRy4cw9QaNwaNXBS9Ir+Biw/uxXY=;
	b=ljpddHxEidQxz9WKo96QBWZBqYYTBeU6q9WtcDVgifcIHTIRge36LQXeYK56N4AZ4Y2+r7SygMt28ZfbWG78+lLm9FqpsdobuhirrDFv4qMIEBuqcIjNiVZSjRS/hWfIl/LRatQLav0luMM7hY1WklH6s2Ezjk/e7yCETlnhp6FG0G+44UCHYR2fFSYyTd+YVAwhNRnpbPLkgaZ0OsEa/kvQsojiXwfyInyzC5l6JHaiwBvtVCoPDU3aYb/rvGkwog5F6UPW5SKAFEDGLc7IXJ/utFeQ89rhWb04t+7xZgn+mWyVA+no/MbvZF4Z6T+9udEtRbl1tr507wRCNOIAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:55 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:55 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 49/72] libmultipath: vector_for_each_slot: fix
	-Wsign-compare warnings
Thread-Index: AQHVgUQCXbtcIqG9lUSCHHOLWx2V+g==
Date: Sat, 12 Oct 2019 21:28:38 +0000
Message-ID: <20191012212703.12989-50-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 33a6c5e4-0a3e-4f32-06f9-08d74f5b250f
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317803DA2021B3F9B9D2C00FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
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
x-microsoft-antispam-message-info: c3skHOxlN50BZKDCRBPOtClILtClHZzsIESAl0SY/IXTcT1nAcZXClaen1ZoXr2wk8/4bz78otbjp4SCf4Q9PASuoVF0SYeK6TSvAW9lLoZspw4nrpiSBKOEvmFMml6mQgK8YoAf5JFafyzmcluXpbFumgK7W3u0ARrUbny6z8BNK3RnJ1jsXxyrngFVMCAmaaYMdiDeIushCwQ7n7l8zul8nD/cMTDOjhJxTbvjYcoVmaXL9CttaJt2zPing/1rCYVhegScCh6oQ9qPUrrie6z66iwjQQAxrhCiEFn23sV3wqE05wCcXnSAmkiJjz4jQKe4zeH55JIs6GgNelP37ODsXAmdI+Z8N+rxgLEkWmXaGT9LJXEU4KWYArN/419gVYeEWUbdVsLXl7VTSfyib2ozJjMWJbnTInL3CJ0483M=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a6c5e4-0a3e-4f32-06f9-08d74f5b250f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:38.1063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3rgcb9AsVBXklPKrl/wRyjCqKCkUOv9giixA1Yw7kF5NTaB73iTyeX1jvpfpnatQRDBHlG2icjACB77U4fAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Sat, 12 Oct 2019 21:29:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 12 Oct 2019 21:29:09 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTCiw006255
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 49/72] libmultipath: vector_for_each_slot: fix
 -Wsign-compare warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Sat, 12 Oct 2019 21:31:47 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/vector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/vector.h b/libmultipath/vector.h
index 344dffd5..e16ec461 100644
--- a/libmultipath/vector.h
+++ b/libmultipath/vector.h
@@ -36,9 +36,9 @@ typedef struct _vector *vector;
 #define VECTOR_LAST_SLOT(V)   (((V) && VECTOR_SIZE(V) > 0) ? (V)->slot[(VECTOR_SIZE(V) - 1)] : NULL)
 
 #define vector_foreach_slot(v,p,i) \
-	for (i = 0; (v) && i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
+	for (i = 0; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
 #define vector_foreach_slot_after(v,p,i) \
-	for (; (v) && i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
+	for (; (v) && (int)i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
 #define vector_foreach_slot_backwards(v,p,i) \
 	for (i = VECTOR_SIZE(v) - 1; (int)i >= 0 && ((p) = (v)->slot[i]); i--)
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
