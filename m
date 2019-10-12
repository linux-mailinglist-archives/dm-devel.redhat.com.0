Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E3D52D3
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:35:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 175FE300C72B;
	Sat, 12 Oct 2019 21:35:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D66495D717;
	Sat, 12 Oct 2019 21:35:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 315E24EE69;
	Sat, 12 Oct 2019 21:35:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUgtp006759 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68C2060C05; Sat, 12 Oct 2019 21:30:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AC960BF1;
	Sat, 12 Oct 2019 21:30:39 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 617253C93D;
	Sat, 12 Oct 2019 21:30:38 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:30:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:38 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hwkqmoG2mI9V+ezHDokl3blSx+6ipsRHVRYIBE4Pq43CxjMA75CVpz7VlT6cbF1mXxGFeI3dAviHt6qGQI9WZMW8cj+Ram1dadHsVZ9l2XNDxeyrG8NQk45uIFf6BO4qd5tMoNstCcmazAa1CGElroIz6mx+K6JwGtCNH2gV87UWF4bh8Y1XrIeVRDc4Kfp8IiO62f0MDTQSiFp+Egl0gDIYp3RY+CM3qFyPDSVqQT7aAhgYjgyiyKaCCSPxGXNscz8uJsSY7h/9KNhGouNXA6zFac6yisbC/+93hmwKnNLClYaQGpMzfipfr+Hx0KDUHJ2kDD+q72Rmc3SfHxx33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NsOTssjS5AupurRQsoUNtIyw1m3MrEEK2msenUWWuAQ=;
	b=aY2mBm13WJF/wrqVrbAst0simgM4zgh7gpVf8Dh+Mwtj50fv4AgBV8weqx93zqgSB28l0ezgFnK7WsDxbXTqBMG/ltjKJWczx5oxSVZfS0Hif34p24OKwkX5hOFmtJWWw0aN0395ovdY2JQ4lMh2vaVuNh8ssC7KM+r9CjEqmGAW+8dHbZtmqiQ0x11u0h74ot3yOvAAXxEq0Xti/6ritpiCJDYqZwgXB8fg+OCnxSBuV0bDmukSAoWayU22MJBZj20Mlvh7cAPsvLIaJ05dLna3Tt1Wo1P2c9SB+0UKGN2napVdQDVtGTgHmZv+4aZbLqtswC4n24nAdoPWKBHntA==
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
Thread-Topic: [PATCH 66/72] multipath-tools: Makefile.inc: fix TEST_CC_OPTION
Thread-Index: AQHVgUQPMCA/4ifDbE+SjlQthdBdMw==
Date: Sat, 12 Oct 2019 21:28:59 +0000
Message-ID: <20191012212703.12989-67-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 35cf0c6d-a95f-4e61-89a0-08d74f5b3206
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331718222392B354863801D1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
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
x-microsoft-antispam-message-info: AnJMk9r2kTRqe28dLoUHzzf9xnfiXrFo1HSqfzsmAQYBLfSRQbQ4p4c56i0qyO+6dFul6oFGALcyCwd4GMt7Hju3HjvxuCeqwGjCL0nI4ZSSQjEl7k1N1IMOCBgI/OufZA1vH4vg3ZtrqEvzIuKDPaB33vHbGYqDsB6w/8ieZcMelhNbeEX91vzfxfGW9WVNI87ZRkDORiccrQlIb7vhEzPj+CE44XAz8Kk0ipKkwzGm28hXwVkj9BE6wzvwNtR8Nf399XYs4eOar9yFB0Dw4U/wrw5ubzFWps3R7ammq3pBOMYOSW2cJCqY3Q/ehva04agjjhHt7j3s3GDEzkgxQ/gGmCNWhL3d8BJQJh80Sdru0Abl6L0A/PNlAbVL0zGkWY0WseUC4+KmlomWtkPRItgMr34TLbx2KhRNOuZlTaU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cf0c6d-a95f-4e61-89a0-08d74f5b3206
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:59.9240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oB2KpfBITdN47C3Mh/7DbAYh8S0aU2cJDeTjFy+24tXUm6uA+c/qCtJuWs6Z1Jxv6XIQ6GjpMDDsXvOazm2jpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Sat, 12 Oct 2019 21:30:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sat, 12 Oct 2019 21:30:39 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUgtp006759
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 66/72] multipath-tools: Makefile.inc: fix
	TEST_CC_OPTION
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 12 Oct 2019 21:35:17 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

The test works only if the compiler actually errors out for an
unsupported warning option, which requires setting -Werror.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index 0c800ab3..d4d08fe9 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -81,7 +81,8 @@ INSTALL_PROGRAM	= install
 # Test if the C compiler supports the option.
 # Evaluates to "option" if yes, and "fallback" otherwise.
 TEST_CC_OPTION = $(shell \
-	if echo 'int main(void){return 0;}' | $(CC) -o /dev/null -c "$(1)" -xc - >/dev/null 2>&1; \
+	if echo 'int main(void){return 0;}' | \
+		$(CC) -o /dev/null -c -Werror "$(1)" -xc - >/dev/null 2>&1; \
 	then \
 		echo "$(1)"; \
 	else \
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
