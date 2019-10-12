Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A177DD52D5
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:35:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1311308FBB4;
	Sat, 12 Oct 2019 21:35:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B299719C6A;
	Sat, 12 Oct 2019 21:35:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5073B4EE68;
	Sat, 12 Oct 2019 21:35:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUhbX006778 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBDC65D71C; Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BFD5D6A3;
	Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABE0C87630;
	Sat, 12 Oct 2019 21:30:42 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:04 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:39 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IDDqcBEAF05RbFp17afeu/ciM/TV2ny4ZZA2kBzNp9tT98TEOqf0bFHNVEVbXo2Bi59r07OLQssY4trtSYEFLRKWV1roVvesT+QDu7e632sNfuQGfFp6ZiWlHHg9/Mm9dXO4WVWE2g2PDuLZZiaoQj9zo6Wd3FrcO6nR4ApjEeSQuuSlp79T+t3zFYiC3lT1lMaMaMr8snQp+DPasoyXiQilZYQXpdMLxg0T4rK/dFp7MA1XvOFD/LK/E4wljwCkFCHZM9eDm2UaaPcYctz0UDyvUiSvTSwCKVEUQMQpZZXYJU3KBMaF50rxLd8eHeOxkvqqd94InsTyLnhEDGwX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=N94FX26rRr2GXdnndxIHYSnWb8yXjVhJt+OEbOshW5I=;
	b=IfOO2o6Mb5vDm0lthpJyaZWfKCy1YVtxE9HNhlipX3VZm+mhWy8JVsfHPSjxD9mrAIxiy+uEwQDVAgs4XAd96u31Q4zenoRx9/DHcHbJu6TDn44t5YdhLw0oLG4mxUyJxpjYCJ0l1qomCziNY3KyAr4Fx2fwTES3ChuhdqlQO5NBh6bS3SROZRof5TiBBJFc2dcl4YbG9blHRaFEyvyHkZpfnOy1ZQyviijMjSWF01rA2DQT9U1bBsxmnuNdbADXKhfVUIpMa2JHvkwBK1BUMq/LXdVaGTt1O9+cZvGE8IceA8d/8NvSGx4pDft6lP8EOseeE0WcgVsCG4kFwAoOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:34 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:34 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 67/72] multipath-tools: Makefile.inc: use -Wp,... for
	compiling only
Thread-Index: AQHVgUQQrs8Dqva3Z0a4xAGFDisHnw==
Date: Sat, 12 Oct 2019 21:29:01 +0000
Message-ID: <20191012212703.12989-68-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 7eb49f36-3349-4019-b487-08d74f5b32cd
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33176198A6C33CA9C53980B7FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9w5o/M1ZznrChwpi2PB+5GzpVHJ7C7Uaxq00VbrrsVDjsDHzN3iieYQbjkC3L/VbY1W6mo0sF3lmTIlZHKxFegYq954eN2pLGIeLGPp7vzM7Fn0KeSTXKX8F7YbXL+/dB3e2I7kj1zPf7sZJY/ZNug+7WEbF0MbcjtBrWjKCgpWd+ktk8F1PgQ8XUNvdS4tqSx4bVCXnokIF97c4c7kQeZG/CC6Bokf+jVyPuGTpjP3trDWOt8KwnZhl2FWYID9pHr1nyG1TpKGkYu5ycI5FNFCuyRohuojn7pKH/ZP/Dr0PojLcx1l81tPSoKZ/uq6sXXfxGDWIUP1KCGpqMAhYHfsjV2ufQfvmrMvVBDODqM8ZaBNBe1C3bEAD3GMEyVawf5WkDPs6bvHo3OrlwJIlxQr36EWsK8mezSRMlzRPpc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb49f36-3349-4019-b487-08d74f5b32cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:29:01.2063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 697Ov7vzWEGuDIeGG6dA+gKqz04JOy6KZ32yKB8iQegbccd9BJMoTQFnSxEds7cooj1EF7c4Z45Uav1gAJmF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 12 Oct 2019 21:30:43 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUhbX006778
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 67/72] multipath-tools: Makefile.inc: use -Wp,
 ... for compiling only
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 12 Oct 2019 21:35:38 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang-3.9 errors out if -Wp,... preprocessor flags are used in the
linking stage.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Makefile.inc b/Makefile.inc
index d4d08fe9..f309a274 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -96,9 +96,8 @@ OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
 		  -Werror=implicit-function-declaration -Werror=format-security \
 		  -Wno-clobbered \
 		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
-		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
-		  --param=ssp-buffer-size=4
-
+		  $(STACKPROT) --param=ssp-buffer-size=4
+CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
 CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
 		   -MMD -MP $(CFLAGS)
 BIN_CFLAGS	= -fPIE -DPIE
@@ -135,4 +134,4 @@ check_file = $(shell \
 
 %.o:	%.c
 	@echo building $@ because of $?
-	$(CC) $(CFLAGS) -c -o $@ $<
+	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
