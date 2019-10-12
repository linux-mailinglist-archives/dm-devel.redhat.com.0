Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52CD52BD
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCB0130224AC;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABCBE60C4B;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 495E51808878;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTI2k006309 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C5551001B08; Sat, 12 Oct 2019 21:29:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52D4210013D9;
	Sat, 12 Oct 2019 21:29:18 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31F01859FC;
	Sat, 12 Oct 2019 21:29:17 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:02 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=M+cxy018ZpK1eMCHtc/fT5ZrEo3y4svOYpsjj01bdeXlMRZ9RNxO+GSAUew+38l1M8+pjILmhjVqhO1JjsRA8glX76SLnn/ys9kxE3TxG6USbNfUn4kGY/Crzo72uH+zLcCxWe3aZuNvJdXYy3iQJ3JQ/tSw+A9RbHv4e8FrfKd9mG2klTTc3I7ECHlLQLIpr7fbzGcA+GOv6aCYPddjMjZ0jQruEk6rluiSIYgzdM2+EXsRvHYBAcDqrZ4m7BWytp7fOzniU2fQ5LEe4X9dK4/rdnWGic70qzjHRgdiemqwTeiy7BhEv+y2ksMv3WDklY/AzhYwReVzGAskJD6JbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+oqMByhV6YvycWM6h+QBRDxGITatd1+q0tM5TMzRfzY=;
	b=CthP3tKyqU+2Ii95/+amAKSYk7WHetI02ySlna+lgbaQh3tN0go8Jn7dyiOFhSo6UO22GkQsrPaCovEtpfsmXa11NVHqSd1HnrFQz971ffPvgazJxjdkObX9yiCScmcKsDj13RlCBxBca7hmef7mtyqdyrYWCirK79uFSoNTBpj59P+1j69hFNjHxJTnY5Os6HjW5HiAXzGVi9XLxBY4dJXcIc+WUKuBwDOheGf4baDCXj4iG/9aI8S2+CXfWxzDRqWSjkQbMfCyBMfOp1ZRsjV4Gh4DWwAlpByYzCBNnS27L3u9EZhss/O2i/rBJ/2KQXbWFoXm7ROvdZX96I19OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:59 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:59 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 58/72] multipath-tools: Makefile.inc: enable
	-Wsign-compare
Thread-Index: AQHVgUQJOMBBmmL94Uu3pfBt1KATzQ==
Date: Sat, 12 Oct 2019 21:28:49 +0000
Message-ID: <20191012212703.12989-59-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 7ccfd836-b2b9-4873-2c33-08d74f5b2bea
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317A146B32E2E5D27349DA3FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:383;
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
x-microsoft-antispam-message-info: dOgCXnP9iQhPslL3EkOeEyLeCBeFG00jyG66CREOk6lYSyHHvO3unjcIZUDOC18Enm5/eG51AY1UGwDx/Rzpk2OixgAtFA5S8VihFLL+jjStaJQS0OiYZ1b2ysDQLjh5LQYhLAg3Taqy+wgSOQZSYKiuzdXUrr3ocjnt4hgHbvVbBj6rwL2uQhr0XUTdQgOnc/uTb2xi8IHGgDBFzSG+7WxRww14ZadwcCSpPW5ppWPyZm4FA5qLOXpzk0w5XAAe5m+vwx7R1XI/n3tJwVfPSyhMljb2KMxU1g0KDSEOQgHNmDM1IIL7u0bbWfLxp275Qf3TuTKd4UIvdpJTWi0+b20+RjDkYWEwNuRYGhbpVrH/RMURln5TQdrKF/whQdwmQt7HgaUqM3xuZa3JWwbgdDpZFxp4aduhgfhluI+De4E=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccfd836-b2b9-4873-2c33-08d74f5b2bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:49.7057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j99YH0zb0HaN+YCYJeL8egAUck8kOqYdOUQ+boHwvoXUEJWJxdjqrNm7BcL0n50H+tfmkcomC7oRjUTJr3CFng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 12 Oct 2019 21:29:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 12 Oct 2019 21:29:17 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTI2k006309
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 58/72] multipath-tools: Makefile.inc: enable
	-Wsign-compare
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 12 Oct 2019 21:32:29 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

With the previous patches, there are no signedness warnings any more.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index da9a3d7d..0c800ab3 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -93,7 +93,7 @@ ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers
 
 OPTFLAGS	= -O2 -g -pipe -Wall -Wextra -Wformat=2 -Werror=implicit-int \
 		  -Werror=implicit-function-declaration -Werror=format-security \
-		  -Wno-sign-compare -Wno-clobbered \
+		  -Wno-clobbered \
 		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
 		  -Wp,-D_FORTIFY_SOURCE=2 $(STACKPROT) \
 		  --param=ssp-buffer-size=4
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
