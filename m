Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88EC47F3
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 08:51:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C747C0546D5;
	Wed,  2 Oct 2019 06:51:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1190C614C2;
	Wed,  2 Oct 2019 06:51:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25EEF4E589;
	Wed,  2 Oct 2019 06:51:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x926pZQa014229 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 02:51:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0230E5D9DC; Wed,  2 Oct 2019 06:51:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9648D5D9D3;
	Wed,  2 Oct 2019 06:51:32 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CC2918CB8E2;
	Wed,  2 Oct 2019 06:51:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Wed,  2 Oct 2019 06:50:28 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 2 Oct 2019 06:48:11 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 2 Oct 2019 06:48:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hOrqHKsMXNFMDtUFQJpnl24F/pp5vMnRtMXjxol92kIWJ9zWt8+YAa3/Rj9vU8SztJHrMydzxmpDPBH++hO/WsjBdGCFf8E4ysqAY4Eb/8f/PJKSbdZRy8U38mJdWnzAT3W2/zNHLCCTnJKH/F2Le/fxQO19DJlF37W+qGjryL0U3f8kCxjEgaAQ13c/LB5rvZcFNZFRqasor5xH8MRQZ4DFQMhovycHYBfCE+r+SnpjIbyrWnTOM0z+xJ23bKojqdSqUi9qwey+Wp3LvqZTEt6a71ECGP7J2uJfkaFekh/TiF5FWsJrR2itCk+jM+1Vt22NjXgzi2hbGkmrR9m0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=diE0/FHzmK3JsAo+CBN9lmFeILeAXUWNkSrbs/aOpn4=;
	b=WKZxXbhE/SJRtxxWE0Zc11tSPJFLJII4KAsq5FHa5GVTm922vcPPcYynFW8n35exIaeNPDHtTe/9UK+soe1LnGtox2Iu4bjrFVwK5reID/I8maqdCWr9UA76K+UWYwIP7L44ZtnB6WVUijMn3wocpxPVnRCqI2CFwd5ugsWhjQrwTWwXuVSqaKN647zDqajON8NAmylS9CedTwsGOwoL7Bv2DlHxEvy/CITmyoRdUj0s36In0GK1v3GXF09BBz4IGmQV5L9EJJwLAkmoCuRORtq1RPhEPGp0V9ShYp7KYvbkIuywpZ3j/Cx7Z0ikbV/OX2nTruYQwhebzm3iW115Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3176.namprd18.prod.outlook.com (52.132.244.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Wed, 2 Oct 2019 06:48:06 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.017;
	Wed, 2 Oct 2019 06:48:06 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Chongyun Wu
	<wu.chongyun@h3c.com>
Thread-Topic: [PATCH 2/3] multipath.conf.5: document foreign library support
Thread-Index: AQHVeO1YmXZf8a+h5E++fB/ILfCvmw==
Date: Wed, 2 Oct 2019 06:48:05 +0000
Message-ID: <20191002064655.2669-3-martin.wilck@suse.com>
References: <20191002064655.2669-1-martin.wilck@suse.com>
In-Reply-To: <20191002064655.2669-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0111.eurprd07.prod.outlook.com
	(2603:10a6:207:7::21) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62e65d75-9c41-4789-8d2e-08d747047a7a
x-ms-traffictypediagnostic: CH2PR18MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB31761FD0CBEDEDF669010B88FC9C0@CH2PR18MB3176.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6506007)(110136005)(25786009)(5660300002)(66066001)(2906002)(316002)(102836004)(478600001)(76176011)(14454004)(52116002)(26005)(4326008)(99286004)(6486002)(186003)(81166006)(81156014)(8936002)(50226002)(6116002)(6512007)(54906003)(66446008)(64756008)(66946007)(256004)(386003)(3846002)(107886003)(44832011)(8676002)(2616005)(66556008)(6436002)(66476007)(476003)(71200400001)(1076003)(86362001)(71190400001)(36756003)(486006)(446003)(11346002)(305945005)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3176;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HRw+6MWyx9yl9NXvp5r6/Fzhh83XrF41TEq9Mj34VnaFHrmN0i4xMdGCNRPindWd5y/w6x4+4R0aEosBv3rAHRxVNvG7RUqFUvP4eJQiVYXAW6o7m4mn0tgEBKsA4/tnJPNX3V+ZbYSZndYBIV7nP9bPuoTvSzb8sB/Gu8T4ES0D1PCYnK70g3qLIfTFIOSYwpHANfJYLZa6frHge/KRG8BEkOmg2KhqB6WN966hvq6Sd0gztrSxTASCd8/RTWd9Ob3kc7FQ2x9989IWs3+xEUR7nCZT0DHJE1RH2hIUkUvWdhdtKGtHwJuhMt6ub6+09W0X1AdHT/zUhFxI24sbJC7Bhp6waKiES7nD2IYwGUk8s6a1AVTHEHawf3/ylUcR4z3M8fF0fbKrwYw8vrxWmXEqQXbA5jOuXjQHDBUy+G4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e65d75-9c41-4789-8d2e-08d747047a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 06:48:05.8706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4ZLel2A4JApOchSVlNaQCnWOlBf1v+mKo76cFevx504b4azBT3lXoO4oA/8CY4dcix8pO32AGHCjTwnPMQHhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3176
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Wed, 02 Oct 2019 06:51:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Wed, 02 Oct 2019 06:51:31 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x926pZQa014229
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/3] multipath.conf.5: document foreign library
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 02 Oct 2019 06:51:39 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Add documentation for foreign library support, and for the
"enable_foreign" parameter.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/multipath.conf.5 | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 23a79e9b..e866da23 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1220,6 +1220,21 @@ makes multipath immediately mark a device with only ghost paths as ready.
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
@@ -1763,6 +1778,31 @@ unpredictable ways. If the \(dqmarginal_path\(dq method is active, the
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
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
