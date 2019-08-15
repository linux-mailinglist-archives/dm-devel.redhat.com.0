Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 063348EECF
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 16:58:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1FC430A7B99;
	Thu, 15 Aug 2019 14:58:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C499543FD2;
	Thu, 15 Aug 2019 14:58:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 670341806B00;
	Thu, 15 Aug 2019 14:58:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FEu3KQ008942 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 10:56:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6ABF1001947; Thu, 15 Aug 2019 14:56:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4656D10016EB;
	Thu, 15 Aug 2019 14:56:01 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E283C05AA71;
	Thu, 15 Aug 2019 14:55:58 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 15 Aug 2019 14:55:25 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 15 Aug 2019 14:46:57 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 15 Aug 2019 14:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nWiFW6c6DuZHSImjOeNosUndaG8DgsZlkveJrbkpVDYHMVslXIzdLEQJP+3dTcvBS03YU9EQZvfx5Z2OWD9KSsakWzzyfZ0yVXLa1hXRKtbhY9zOo6GP4RT0w43xmxIQOQ0HVpjgBR3ZFpYZ5FrIADmlNnSaaKrvqwy1lZ45+XdAxeHg4OM530XoPTbVeiWRdC7Vz8kM5/zDGF/pZ0jBCii/8XCzG2vENjZjQrwloxIN1M8Zo6C9Qc6JV9BPMoG47pN07O94jzPfrqB4gv7DAUNCW51HmFI/ZbzKvUfEGcKvmRIuzyTgJzbHi/6ArnRXZTNQEkK+wwyi7BsKgaeWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6qYhflQ6b3qmcsOyjXvlTKnFhSxjetQa3oZz0yjedVE=;
	b=nnKi3HPTOBf+9rVA281velYSnT6LPTTZnB4bUsV0w5RrBvnnCSW4m0KU85RWIdjbgS3MKlCLrpdACXeRqlc87604uf+V0jD2rta1WbI7wzbM0qv14a5/86hYBAG+SqiKiKq/YRCHGxiYBfn7C1dp6HSRDenq9cbR57m6kbv6ImC5dK19gj09fXQeTWbJGAzzFg/wJZyB75Xj2xvIqIBNeLIdbpgh/iTLAwO8lprsOKD9B5ISLidi+f9+DBdE6zZY7+SJxB9osmSxwb3JFZvK4A+pIMY73g9Gr3H7YwI+0PwUKjxisTddRSXgFgIhbCTtc9kA+DeJbQqaEMlF+mGqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.14; Thu, 15 Aug 2019 14:46:56 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Thu, 15 Aug 2019 14:46:56 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 2/2] multipath.conf.5: document foreign library support
Thread-Index: AQHVU3hI4d5KIryb8ESfZf5TOc5T3g==
Date: Thu, 15 Aug 2019 14:46:56 +0000
Message-ID: <20190815144638.5664-3-martin.wilck@suse.com>
References: <20190815144638.5664-1-martin.wilck@suse.com>
In-Reply-To: <20190815144638.5664-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM7PR04CA0018.eurprd04.prod.outlook.com
	(2603:10a6:20b:110::28) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad5df423-1499-4335-5459-08d7218f6b48
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3349; 
x-ms-traffictypediagnostic: CH2PR18MB3349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3349686767F4F3C565A02FECFCAC0@CH2PR18MB3349.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(4326008)(446003)(11346002)(256004)(2616005)(66066001)(186003)(44832011)(6486002)(25786009)(476003)(486006)(107886003)(53936002)(99286004)(14454004)(102836004)(6512007)(386003)(6506007)(2906002)(26005)(36756003)(76176011)(6436002)(6116002)(66446008)(71190400001)(71200400001)(66556008)(81166006)(66476007)(305945005)(52116002)(8676002)(8936002)(1076003)(64756008)(81156014)(7736002)(110136005)(66946007)(86362001)(3846002)(54906003)(478600001)(50226002)(5660300002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3349;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JJ20VXYR15OZtJvywTwaH0OSqRhZBBT3tSgUWfqTL/ajBhSsGgJr1b7PDfjKgbsw4y96hyc3fGDWenyEb60JrJRm5puEFu6r1cr/oQ8FMZox2AufXK9ZBweiD+02ntV8bzUZEallx4vN1tCJSxVXe8GCn79lF4UHeE84Ef15EcDO9QdAIvKanD/iROG+vSh0DKbW2etdKBssTmpY94exG3vSmpBMFIinIINSa/5I6zEhCJ6hFGUN0dvU4zAjgftimJ+IJ7ZTwzMDj/btn96GUtzMrNeloWNtKTdHDgCauYxpowsUrcO59hDj38tqu4UAXSyxiRyoIQNTcZUbAkIEf7iMGI8YTcVRyqlYIteuQJ+3SFpRMXileMnh5cWwX1HNvtKhiJ3Ivw7MT6VzCFyCkAZ9xBEzDCvZmyaVGrVLol0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5df423-1499-4335-5459-08d7218f6b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:46:56.2205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3rNvW1rC2aFRrvoDNnY/1XBk7xDeNE90vICi90pTwqB8dC5nb1eC765ph0qxujKNZtH+rDBroTgaUe9eyWDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3349
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Thu, 15 Aug 2019 14:55:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 15 Aug 2019 14:55:59 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7FEu3KQ008942
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/2] multipath.conf.5: document foreign library
	support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 14:58:46 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Add documentation for foreign library support, and for the
"enable_foreign" parameter.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/multipath.conf.5 | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index f7d21b4c..c1446231 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1194,6 +1194,21 @@ makes multipath immediately mark a device with only ghost paths as ready.
 The default is: \fBno\fR
 .RE
 .
+.
+.TP
+.B enable_foreign
+Enables or disables foreign libraries (see section
+.I FOREIGN MULTIPATH SUPPORT
+below). The value is a regular expression; foreign libraries are loaded
+if their name (e.g. \(dqnvme\(dq) matches the expression. By default,
+all foreign libraries are enabled.
+.RS
+.TP
+The default is: \fB\(dq\(dq\fR (the empty regular expression)
+.RE
+.
+.
+
 .
 .\" ----------------------------------------------------------------------------
 .SH "blacklist and blacklist_exceptions sections"
@@ -1735,6 +1750,31 @@ unpredictable ways. If the \(dqmarginal_path\(dq method is active, the
 .
 .
 .\" ----------------------------------------------------------------------------
+.SH "FOREIGN MULTIPATH SUPPORT"
+.\" ----------------------------------------------------------------------------
+.
+multipath and multipathd can load \(dqforeign\(dq libraries to add
+support for other multipathing technologies besides the Linux device mapper.
+Currently this support is limited to printing detected information about
+multipath setup. In topology output, the names of foreign maps are prefixed by
+the foreign library name in square brackets, as in this example:
+.
+.P
+.EX
+# multipath -ll
+uuid.fedcba98-3579-4567-8765-123456789abc [nvme]:nvme4n9 NVMe,Some NVMe controller,FFFFFFFF
+size=167772160 features='n/a' hwhandler='ANA' wp=rw
+|-+- policy='n/a' prio=50 status=optimized
+| `- 4:38:1    nvme4c38n1 0:0     n/a   optimized    live
+`-+- policy='n/a' prio=50 status=optimized
+  `- 4:39:1    nvme4c39n1 0:0     n/a   optimized    live
+.EE
+.
+.P
+The \(dqnvme\(dq foreign library provides support for NVMe native multipathing
+in the kernel. It is part of the standard multipath package.
+.
+.\" ----------------------------------------------------------------------------
 .SH "KNOWN ISSUES"
 .\" ----------------------------------------------------------------------------
 .
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
