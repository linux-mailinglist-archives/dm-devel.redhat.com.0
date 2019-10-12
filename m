Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796AD52D8
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:36:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D1B418C4279;
	Sat, 12 Oct 2019 21:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 041E25D9CC;
	Sat, 12 Oct 2019 21:36:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 753EE1808878;
	Sat, 12 Oct 2019 21:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUtEd006871 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C33A60BF4; Sat, 12 Oct 2019 21:30:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 406AC60BF1;
	Sat, 12 Oct 2019 21:30:55 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68C7EC08E2B0;
	Sat, 12 Oct 2019 21:30:53 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:09 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:41 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=AitRiiEpBK8WbsmOJcHlAllw8iSniiilQcxnwGkco7ayqyljMrSTh+YyoY+SuVOEkFadVaOYRvjCmJRD6vYjyOHLUeTcSO1uEBENsq0zm8YnXY14Qw3NK/rxuwFygRsv0E33uZSUSpm2cdXZTX8vDbe2qdwb8Avqlaj1xc5Do5kpHRyVHFXztw+P6WF5K3hqeQoHEMcjJd7AYClcxAxLcenC8L+ZM4VFWW40faonUKe5ejUuw0W2fmTHBrNtojfgPqtdt31W5rM6HBobexmabbpm8LikSk3M8lwJ7YIlKaJsCQWAoMHMX3QEK8Aonk6+fqXK/7I4o2DZo/kIDVnzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nVOG1NdvQtDogdxN9SYOxB+eDFlG+1hX78AEJwJITGk=;
	b=azd1DYBlurm64L/UfOpMfS60wt4aM/Hh9+zeaq0p4iiYqQ0O9z6O8vPg5pV8xGhzrzKpnnn1rLkUMUnbzSt4ioW8RBkpt9lGF5V+LbYtmrBOdPdyqp+CiZKCBpPLA8qp+md87U4OzTqmhzSlM0A4ICRrvGCpc9AoWLFpTpKLIVmqwxhcvt62jIYy+iXFJnrOrWa/Yrq4br2LtR33qjn/CYJZe/l/4I02KZzJlStJdLdaAAroS6G9M8O41kwgKUzmy8MzaZE2JnGP8h65K5ud42VubLeG0QRJMwxX7o1cDQdoxbRJMb+nMyBY4Ky/uxBZyRTSTQFzHHQyXToNx3vHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:36 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:36 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 72/72] multipath-tools: Makefile.inc: test for
	-Wno-clobbered support
Thread-Index: AQHVgUQUVITbEeq6XUCzXREs5jQlzA==
Date: Sat, 12 Oct 2019 21:29:07 +0000
Message-ID: <20191012212703.12989-73-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 91f738ef-3c66-4723-6b9e-08d74f5b36bf
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331764761FCA90734EF29CF5FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:233;
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
x-microsoft-antispam-message-info: ZfpHvVRqSaHsLiOig2hWcEKBs1TRki0W2p+Zgl4kAqFrqQ46/QBmv3bpJ2nCsoRixtvrIlifryhRbOO9gtQIT7MSLANXpAZG8/2HYfS7PXtxnDSz9WBzSUBf4ysaQ1mC7u8t6RCSb59K1uzqH5jMAvPoxJ8yLqrCT88QGdfNRnm0lHdIO+/M5JCR1uoSsK1r0vjppZTnrLr6gNuTm0jaGjQ0mSAre+hZBeRrBQ1Up6r/Sf0cPFXZ7VEg2IILEQVKQ3iN+omu9T29cWl7VyZ6ZpDs1yYnxQ2w1sbWMnufohNGzuUzzaF3zHHOI36XgWd98T7pbc7jT0Av6wdKVsvZJCk6m41Qqag10xV2g48Jfa6q/RdgiQ2l10XaGe5IVWLVBRiDbMaFgI4mqYJtXWVRDDmnHbLYsmjiArNsdJGv4+I=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f738ef-3c66-4723-6b9e-08d74f5b36bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:29:07.7895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P7kDDa57TaS7yPdoxKdZL9O3TCzZCryzVlJfqtghEfhi7CHpDx+rjgiJtTOhcpkIDyYwD/mEoU8QYtzcEKBbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:30:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:30:54 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUtEd006871
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 72/72] multipath-tools: Makefile.inc: test for
 -Wno-clobbered support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 12 Oct 2019 21:36:04 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang doesn't support this option.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index 59a36cd3..d4d1e0dd 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -91,10 +91,11 @@ TEST_CC_OPTION = $(shell \
 
 STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
+WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered,)
 
 OPTFLAGS	= -O2 -g -pipe -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
 		  -Werror=implicit-function-declaration -Werror=format-security \
-		  -Wno-clobbered \
+		  $(WNOCLOBBERED) \
 		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
 		  $(STACKPROT) --param=ssp-buffer-size=4
 CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
