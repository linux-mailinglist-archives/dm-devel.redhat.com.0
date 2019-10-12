Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B757DD52EC
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:47:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9F3D3083362;
	Sat, 12 Oct 2019 21:47:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DBC35D6A3;
	Sat, 12 Oct 2019 21:47:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 385DE4EE69;
	Sat, 12 Oct 2019 21:47:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLVtR3007105 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:31:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 129E060BFB; Sat, 12 Oct 2019 21:31:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A789360C18;
	Sat, 12 Oct 2019 21:31:52 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49D9F69095;
	Sat, 12 Oct 2019 21:31:51 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:57 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:54 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=U03L1OlYMi42N8Vgfw2kN4/IYUL6n6CUbrYoDtIy/5+OCqtpT/Ak9ckT0BCoos7ktO2Le0jT5SPHnNQMHWmAAwOgjNgUAj/DqIs82uoqFzRszDGYB+++rV04zS/TKDwjIb/hwpq0gPMecuFl16iDaLdyiA9LIU8UBPOTUeqToMjCnPet9Fs8o9eA1yKimLTjR4pvBN+VdW7ZSlxfpXn+ThKZWtP+17zu+yQbY5VaPv0f4eCubJiHCJL46aTVjIjNl1mH1HnsGspZPoS9uDAOT2kpNoal2S3/7Luce1RaZtHHFt98ZinNjzroplK2NQklE3wDRkX0P+ysPo1Rx+IB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4AMozWMa/oyCOTOnoM3mE7y5yydA+XR0SF0g601C8e4=;
	b=K3dNrTTqqraAF4KDshsus1Twgz0B1+ZLCcB12dj8e1Ybpe6UgF/OePiZxRG5XgUgxp6sgljPYJ/TMEdtFqCj4LQ+kSCVVeNS7C/QEhIYNjl6MveQabVvvn+pRiKnXilTOf/mCgeiiTXFoX5UD8SF5yaBJ5e+jFlMDQ2SvfPDXN5xTEkpI9J002ppZYelUvkG0WMDfDDggWGKD01LWMIo++zAdDzT9JYz9bNIHoDXOueTgcANIg2SAPB3v2JwoI2wIOFIqEr6cY/CWPTYisR/z0P071X+z1uiucYfTOJn8a/3EGvKqCYeZ1cmpIQ9GAzGpK1+6KGuwxdCv14gN4osdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:50 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:50 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 38/72] multipathd: use -Wno-unused-parameter for
	cli_handlers.c
Thread-Index: AQHVgUP6Jvab8WUjc0KZ3oIyzXKM5w==
Date: Sat, 12 Oct 2019 21:28:24 +0000
Message-ID: <20191012212703.12989-39-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 61272b0f-1a87-46c8-4ff6-08d74f5b1d17
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317DE7261CA1869E9A5F28CFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:326;
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
x-microsoft-antispam-message-info: 3TCCOIYH5/3/bCwAwq8HoB/Y96/+WaB1RY3cM5Njk1Hmjooc/y0C4/Wk07xkxkUWjWjnFhXYr2f/Xfxthq1l0X/7ARTYzyyCpMENX753wQNlmyGmLntjRTXJoBqYZ1Z1tLpxgMW0/q4eymIyz6PvIHKkDYj1l0vN16HInWdDWP6eaMNPR+bnxEx+SckvIs9IEptDwzwMGRVAr8mrWvP6P263ON6cW/wVzJDIrue8JUdYMTRjGFKB8cBibSmKyw4yrIBNPzWsufZsesKRwtmGM5yEin16fGvQYi/g6rGejaLoq4Fk/1AoWUXWj3vNak2cSqekYfUNYAgao4chTxw9OjiIwisl5Zv1Yb+qar72ZSRVudZKkq0LCYnRJRzSpsKIDpvjVfQLv/72oBGmB4J/e8PIl2rsBWYoz1GY6TplEec=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 61272b0f-1a87-46c8-4ff6-08d74f5b1d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:24.7588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRVd6mzrMoYDnTonTY/kWKet0wYNUbuTDRp4PahuzcWrpfHYwamnKjvLX+EtjDSk00TJNuhtJRKqFYwmXweRpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Sat, 12 Oct 2019 21:31:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 12 Oct 2019 21:31:52 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLVtR3007105
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 38/72] multipathd: use -Wno-unused-parameter for
 cli_handlers.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 12 Oct 2019 21:47:07 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

This file contains many handlers that don't use all their arguments.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/multipathd/Makefile b/multipathd/Makefile
index d1a98637..8d901178 100644
--- a/multipathd/Makefile
+++ b/multipathd/Makefile
@@ -36,6 +36,9 @@ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathcmd.so
 	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(EXEC) $(LIBDEPS)
 	$(GZIP) $(EXEC).8 > $(EXEC).8.gz
 
+cli_handlers.o:	cli_handlers.c
+	$(CC) $(CFLAGS) -Wno-unused-parameter -c -o $@ $<
+
 install:
 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(bindir)
 	$(INSTALL_PROGRAM) -m 755 $(EXEC) $(DESTDIR)$(bindir)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
