Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A928D52CF
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6B4A316E535;
	Sat, 12 Oct 2019 21:34:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89FB3601B3;
	Sat, 12 Oct 2019 21:34:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26A584EE6A;
	Sat, 12 Oct 2019 21:34:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUFL9006558 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F920F6E1; Sat, 12 Oct 2019 21:30:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36D9126170;
	Sat, 12 Oct 2019 21:30:12 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F35A6C075BD2;
	Sat, 12 Oct 2019 21:30:10 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:53 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WLNotUf31yQ1rzJi14yfuVsLVbBlmMEZloysyCpPJ05G3xmLt/2FC0hzntZ63un4mcRfMLtljdsjpBjxo98YBc75W8GFzC42UjNLw5kHdZmKbkTI70yXaOvfvjeQ9r7OtPQuQGltrFsUgytR6FdSbviwBjsXXIeZbZz629AWusP2g3QF/ZATqShF/U9AeQMZDGszmC9SzC2zZMaMixG6RXZIYF8Gn1OXgHacrYZTmkyfHYzICUrWR4vLRUr7/LUivx/JkszhMb4pzCvHqwiNwEUZqMxaCP7qEgiwpvjZMHo1X6Tjdpk1dZcR9zexF9xPoxdUSwISqKor53lgW9vvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jPyBS+pFQDHUDF9QcSsWVCZ1Y+QTOr1L32nmBAC7W0U=;
	b=CyDKhAc0i159A2C1Q76RfVkRLn4Fr4ERiiwNuaq75ZSCKlc6zEoTXMWmejbgEG1x8c9GgmDBWXBbpS1MfrpPDyL+4cV4Momxs/d0gwAn8mTfES2stgbtO+oN3W06IJ+dGXlOhgD2Bf1+swGXOwqtq9FQkgLfR7wu3/wCDR2m9QcLO1P+3jQR1CMsoOC82SsqEjm/SUYvKOmAofNcbvUJhmxrm0yX3KhOADKmg8h9vMzNUh7ln0Zm4Zt+t4mqhznHZnB/QJsopsWL8rWbl7t55u+R8BZ7JjJ/iGaGAhmewVm3Krr2u9bPuPyWGfKu1FIjfaloz+rRWeK1tFk1VOQWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:49 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:49 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 37/72] libmultipath: use -Wno-unused-parameter for dict.c
Thread-Index: AQHVgUP6cIQRrElOGUyaGlp5jNRM2Q==
Date: Sat, 12 Oct 2019 21:28:23 +0000
Message-ID: <20191012212703.12989-38-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 6ac9d71a-c45f-4661-0650-08d74f5b1c55
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331795671F978676FD1FB4F3FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
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
x-microsoft-antispam-message-info: HnYOMwaL4str9qOpdt1cKUpCVn9oz2yzky+ZeHwExm6NDEHw8QV6mn2PokmOothfe3ttnJfw7tfCxmE3NQqT9R/06I1Dw0DPJy1j/CDzSpxgseVCDA8ck9BT4JBUc7SMcMHoLf/tEg1+Ogmoo3MZnddXa8FvdV+6UkikCM+dAx+oC/Be7cA/UNsa4czqSMRF3w6bF5Q9SaYwrpaCUaIS9JCynjywo4BdifkufSgPj1m08zeKdq94nyvnso3sW3EjeK/3407mA8MgwySMw3r3Vbrv5T42ti4A0i1DZ7hZVAmvo+1tfQDbiKcBlItpNXPZsrzZ/ZxiI8Vr1Of2nAVNbyPhJAvvXbKPaP5HUINwTBArcvmq6w2YLQjeqd7JjcaCsl3ztYwdG8TkUcKauoHb8bzyYmdeG3ihhir9nd+hkXg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac9d71a-c45f-4661-0650-08d74f5b1c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:23.4785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IliLhjlgdz40HtcEJlI8/4UbPNA2JYidp8Klm0aGWjRYXMijE+RhC+licBAEQ5Iy5g+MBDwZHrb97WAaOBeAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:30:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:30:11 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUFL9006558
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 37/72] libmultipath: use -Wno-unused-parameter
	for dict.c
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 21:34:36 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This file contains just too many "handler" and "snprintf" methods
which don't use every argument.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libmultipath/Makefile b/libmultipath/Makefile
index a2be42ea..e5651e49 100644
--- a/libmultipath/Makefile
+++ b/libmultipath/Makefile
@@ -50,6 +50,11 @@ all: $(LIBS)
 nvme-lib.o: nvme-lib.c nvme-ioctl.c nvme-ioctl.h
 	$(CC) $(CFLAGS) -Wno-unused-function -c -o $@ $<
 
+# there are lots of "unused parameters" in dict.c
+# because not all handler / snprint methods nees all parameters
+dict.o:	dict.c
+	$(CC) $(CFLAGS) -Wno-unused-parameter -c -o $@ $<
+
 make_static = $(shell sed '/^static/!s/^\([a-z]\{1,\} \)/static \1/' <$1 >$2)
 
 nvme-ioctl.c: nvme/nvme-ioctl.c
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
