Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B88D52D1
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3B10308FBAC;
	Sat, 12 Oct 2019 21:34:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53E66017E;
	Sat, 12 Oct 2019 21:34:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05A004EE50;
	Sat, 12 Oct 2019 21:34:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUdPa006738 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED64A10016EB; Sat, 12 Oct 2019 21:30:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E581001B08;
	Sat, 12 Oct 2019 21:30:37 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4389610C093C;
	Sat, 12 Oct 2019 21:30:36 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:52 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:36 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FQTB7ncRHvrJJqs7j+ccrjLrWFTDWlfMdhmP/kF//w1oK+0aP0FNLtPMSVI6cLngjHD25dHDAal9o1AM6XHHfPDdPz1gnxlVylmRHMSJQHbc5qUSbZxX43AsbR+ZW+Xej2muvYdY2Uf6qNea6K1ssl+4H6JKoh/DXPXczb7b8Ye8KeihFFYIlPrO2Qw076RyAOH6xfpXxqj9d0Ozls7H7DCni+G37f1/5kIcKsRTn4Pw5XLsPUyVjN5wyt7PkGYcy3OYyc8nS+Frm7CoHm0Ls8FNgI7kMz5r/QfqcFKYdzsHqZrZ2MNlatUGNt011UMei0PHbI10yXhnNCGRgxw9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=E7rAG6XVGxvn9zm484hVBM76X/Gzg83iVBtRU+ej7t0=;
	b=m3zLqbaPp4BsntgwZU4GmZU4mDWqyiBjqTdwiIEi7PrG7IJwPmirZiRSwdFImM4oZ9av0SgjTExrFEmGOcZuaKnkKNcbIGiggKuZyPGlU4iv8SFWZ3UZEpAzGAz3f/c2h0m2SaCjDVD3JX6cxiniIY2C47idJsZA3avUt5cmLrA2jiTWruCWUzyKGy0htHea5pl3bZfDoU0/fJKQdoXasPQ8q+DtZS+jtC6IGPx9re1pBRiCTIHZfkIbUK3QHCjwON2V5WGmV4rCH7Ie3mioVeoFGpyrSKliMr4tRVqWHjy4aUlhJ80VXh3nlDU8aE29WLTbTZI5/HPWt6qJNGJYwQ==
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
Thread-Topic: [PATCH 61/72] multipath tests: blacklist: remove always-true
	condition
Thread-Index: AQHVgUQLnhrQRVFCmEyPGYtb+CqRnw==
Date: Sat, 12 Oct 2019 21:28:53 +0000
Message-ID: <20191012212703.12989-62-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 753b3f3e-6a74-4b63-c003-08d74f5b2e25
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33175C43A5A0388B5409FED7FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:469;
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
x-microsoft-antispam-message-info: A9oDXH/ORTfFm6mBWiVTzAgNAyfenf4nN69L7CDjqYh4vjJ5omQtjPA9dOmjQ2Y/WyI7kABZsXEC6YUWuD8s8/C8edlS1coAbppmon1Rid5dYTorRwEAc/lS2iyy35ndlB6jNxMqCjPsFlcloUnBXn1nOLjYWyoX/Hfv3gXMCeTeux54b4ZJF/6a0hGF9N2Py0Sk6vBjaQYtx3Cd+Tks4wTu8nbpxAH4NKaAEmxBgKFFu/2TvQzh8rB8JFL4AiCmnGdKDHWzBZ0cszBgcV435J3AQCFL39wsMunNOnFDtQUEUFAJ4YUpCHERMMIJAnbIsZ9DK0mmLwey8vnJDjk8yKpzMHYJ6OUbgCbk80FRrOdgd0n1sYnGbj2emm+bU/NPPi8fWRY8sc49mcyUZqn6LkvnNTbMM8v+dSHQyrM+yY0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 753b3f3e-6a74-4b63-c003-08d74f5b2e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:53.4037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TSAek+P6Awctxa+2kJ5G9i3ovSVUAskYCbhmTlYEMLfK9uy5+u94ywdPkCGZh5CvUOCzPuOZIluub5TRFYY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Sat, 12 Oct 2019 21:30:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Sat, 12 Oct 2019 21:30:37 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUdPa006738
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 61/72] multipath tests: blacklist: remove
 always-true condition
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 12 Oct 2019 21:34:56 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang warns about this (udev_device->property_list can't be NULL).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/blacklist.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/blacklist.c b/tests/blacklist.c
index 733ee398..6e7c1864 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -40,8 +40,6 @@ struct udev_list_entry *
 __wrap_udev_device_get_properties_list_entry(struct udev_device *udev_device)
 {
 	assert_non_null(udev_device);
-	if (!udev_device->property_list)
-		return NULL;
 	if (!*udev_device->property_list)
 		return NULL;
 	return (struct udev_list_entry *)udev_device->property_list;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
