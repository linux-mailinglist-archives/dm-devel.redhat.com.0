Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1BCD52C4
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1948A308C389;
	Sat, 12 Oct 2019 21:33:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD91E19C70;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DC2D4EE50;
	Sat, 12 Oct 2019 21:33:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUn1Z006826 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B5F3F5C22F; Sat, 12 Oct 2019 21:30:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 723F05C226;
	Sat, 12 Oct 2019 21:30:47 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EAF83098442;
	Sat, 12 Oct 2019 21:30:46 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:07 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:39 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YwGiTdPf2nU40V/xKijO4O8+hyCb/fCI8PFEg3r9a+amW3fyLRH+Evdy/aJMAB5o9hn5WrULNShSf9WDHTC3qapYFTu5e5OCqwihTjMY1lQWQPL0wwUODWr7hxuupNy8L78+VpuugaLE63GPr7Wmw8zYIdMZ1ce/YlcI9kXAEITtoIRTye6rkWskgPbE9jz+3MHSJ4H8h4uf9UJL9ZLaKVJYiMq+PGaZx8c/tCplNvFE+fs1yMCRQ4ic8AHIguSfBz+gTFKqItkDbJrUSfOosh+aWryQ7mL9FS6VKcp3sXs86DjcNOclUgvULNL6tCldWDfVeAUb5X6NFy9d6BUmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LsURi/K5TvmNV2xGSHdFiyN/0KxdeKvqdz5tmpkaqvg=;
	b=feWzI5wAa9AVzIUAbh/uxN8TnxzKVDZEEE5HDV3Y8u+oCzagNSmUaskEsT23ShGiRgs/X+Sg2VrX4nHV4KpZ7GfAmI1VY8hJQ2QxEjCJRzG78JeOsOdG6BhiiNN+2qZgulj7U3Wkl1OEG1lut3+VfHLDiPzHA5ILlOaSzCc2RYeC4QWg6t5BxH+QzVpgMgTgybUhanu7umqgKC5ZjDMJxtKdwB72iF0KVojwh8K28UWY4Yhjh+aLzKTOVnG8gMjFmeMwybARPxeQ9ze/KEJ9bok3GlbnOAL0lDXgdXmH9e2hAhO58XntdWDf9tOffYPF/cxKX+IDj4QGgoqULeOWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:35 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:35 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 68/72] multipath-tools: Makefile: use proper directory
	recursion
Thread-Index: AQHVgUQRcBpHmz+TBEO/0nWdaG/Dag==
Date: Sat, 12 Oct 2019 21:29:02 +0000
Message-ID: <20191012212703.12989-69-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: dc40615c-8b43-4cba-5d79-08d74f5b3391
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317CBDC21B6F3BD950344B4FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7E7nr2wJ2qaXffp+NL4DecDOk7TQxrme/7Ou/0jeH4yACVgSX3qvPrr3CBklsV/dR1l8bwQzJHFh/EqBbniWyG/Nc+yW6SXIo2o9LvpUGF/ltjgw+45r8ss6RhCBJfXTzbxAaZ0gjKwxrA5dZNY819n+jVdP6ofMgJGQwepiFCgyBkeG7IMup09ts/ZKzmsO76C2QTWvdLZ1HOl6dSQEuYceUVva0WBG10V5OKVu4Wkpung1DHUbTWXJbfq2NFr8fvq7jNCIqApezCnpHNBbuGvSYC5fSbq12Vxuqb7fHWbafhCQPCVxmruxxJaR3zZvTXH8O0DLo3O0z2rnSx66rBUGwpAGPBG0hvzPtWX9j4Wd77DiFOlw5F7YJS+Xi02mQojB6xpdHPAGinF32lA0J1eJN8G354PLqUik/gxjM6A=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dc40615c-8b43-4cba-5d79-08d74f5b3391
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:29:02.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWy3J3fTorFz4auflN5u7hQcgvcak7MkJAAjo+vQjxdIWTlGAl9XKI8VAyQL0/jCyws+jqeVncA14v1vMXpVfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Sat, 12 Oct 2019 21:30:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 12 Oct 2019 21:30:46 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUn1Z006826
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 68/72] multipath-tools: Makefile: use proper
 directory recursion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 12 Oct 2019 21:33:10 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

"make -k" didn't work with the Makefile's subdirectory handling.
Do it the proper "make" way.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 4b145c59..1dee3680 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 # Copyright (C) 2003 Christophe Varoqui, <christophe.varoqui@opensvc.com>
 #
 
-BUILDDIRS = \
+BUILDDIRS := \
 	libmpathcmd \
 	libmultipath \
 	libmultipath/prioritizers \
@@ -19,32 +19,30 @@ BUILDDIRS += \
 	libdmmp
 endif
 
-all: recurse
+BUILDDIRS.clean := $(BUILDDIRS:=.clean) tests.clean
 
-recurse:
-	@for dir in $(BUILDDIRS); do $(MAKE) -C $$dir || exit $?; done
+.PHONY:	$(BUILDDIRS) $(BUILDDIRS:=.uninstall) $(BUILDDIRS:=.install) $(BUILDDIRS.clean)
 
-recurse_clean:
-	@for dir in $(BUILDDIRS); do \
-	$(MAKE) -C $$dir clean || exit $?; \
-	done
-	$(MAKE) -C tests clean
+all:	$(BUILDDIRS)
 
-recurse_install:
-	@for dir in $(BUILDDIRS); do \
-	$(MAKE) -C $$dir install || exit $?; \
-	done
+$(BUILDDIRS):
+	$(MAKE) -C $@
 
-recurse_uninstall:
-	@for dir in $(BUILDDIRS); do \
-	$(MAKE) -C $$dir uninstall || exit $?; \
-	done
+multipath multipathd mpathpersist: libmultipath
+mpathpersist:  libmpathpersist
 
-clean: recurse_clean
+$(BUILDDIRS.clean):
+	$(MAKE) -C ${@:.clean=} clean
 
-install: recurse_install
+$(BUILDDIRS:=.install):
+	$(MAKE) -C ${@:.install=} install
 
-uninstall: recurse_uninstall
+$(BUILDDIRS:=.uninstall):
+	$(MAKE) -C ${@:.uninstall=} uninstall
+
+clean: $(BUILDDIRS.clean)
+install: $(BUILDDIRS:=.install)
+uninstall: $(BUILDDIRS:=.uninstall)
 
 test:	all
 	$(MAKE) -C tests
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
