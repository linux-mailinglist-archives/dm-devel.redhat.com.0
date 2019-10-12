Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA0D52CB
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59B7C10DCCA9;
	Sat, 12 Oct 2019 21:34:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 250C45C223;
	Sat, 12 Oct 2019 21:34:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 693134EE6A;
	Sat, 12 Oct 2019 21:34:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUN9g006631 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7C90413A; Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD241424F;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2ACB3076BC1;
	Sat, 12 Oct 2019 21:30:22 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:38 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:00 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SHj3jAxla7Fipm+7fcVbNq5Krq4blpABaCxhny7demEBnpu+PO48vtgjVr4xGCpQYdnsc5OvzsDy1z7gNgX2HyMryNUCvTSWxdtf4bNqPE9Ifo7wNBeNvdo4Tm84EN0m9SBEv02mAePE3WsLp3i/xI63y5P2pMg3nGAuOfKxbpUbAbY1otz/kWuttYGyvQrjywSPNOlyPxdRqnGUeV19Ghxz2/wjrD/Zd+SoUFl21yLfYE0ROZ3RmORPg+kNKs6wpbt0Q4fGv34bP0WSduB3+ETtHOJ6qpQolykTzvP2+BRc5Vougizz5XWMFLWjK9YChAho23gz4tWnSKO5D1F4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SPS4qFFk//nTqXswvFHn+6qHtTNDIj9apVglpQxjW7Y=;
	b=gC0peuSDtIntt3ac45lt7hy/lrb2KpZNdroA5BsPcPzoQwkyQblblWxSHzzx8DIsMEgBXKaDzs1ODZNqHj3xnyiGRUhIwMc6rDARQI9yhH6JLcbHwDwkGpCgLZwUaUC9XwZNszZn7F0U8mevVSaDjruhrV/nvrD8D0xRQ0tNWq6JsJyAYQgESm4TNiByw50rmzQQspC/WR1tRlj2kY5I3OLEwEPHrR/TxVJPUsHXj6PZFXJ30b7Wg5VhklZr1cLtS3qA3QZETQCN6J/P8qSZ8aS9mim3FfhVG+KKYRpG6YyrUdoTceR5L2+aUwt0jVDeMfVTa7P1aLQH6lxxGtHXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:56 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:56 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 52/72] libmultipath: use unsigned blksize in directio
	context
Thread-Index: AQHVgUQE65T1J0216UmsPbDPYrZ0Cw==
Date: Sat, 12 Oct 2019 21:28:41 +0000
Message-ID: <20191012212703.12989-53-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: e0577557-83f4-4254-4633-08d74f5b272a
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317AFC31EFE1BB4834114C1FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:288;
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
x-microsoft-antispam-message-info: XZoyjJXbzeuJ9Zr8OXlD0zIFXJszhTdsProLJQic5HnwZwBwKVgq8p6woFfD+gEFJchPcxgmalMYeLLUITGZGE32oIHXfYFOYmp85etZBw9qDQRAr2pVAz5PVcWgVFzQ9KGhm+7J/Iv/appgp79r+S2yM92c+IKAgxdoX+o0pWJlI5A1CbVZ3BBqXokv1QZLvKJ/SZKmfCZkhhM0oErCBDEfsPbIBMCNO5c1VQbgC27JuumLGSl0PFPm9gGJyjHuOQFNRH71YVom5jnPrMUN4TS0qBSmLaP8wT1PZLK9ldPekQb7EOTikiwmcyaYpraDeMEcEal6FPKgZrSeIlXomUXZVY6J2pGo6mi29ylfBS+m5NcbE3BX4rFTWruuDStRuNpjQ9T//C6Ej380Q9e4LrapRGNSAM2xU1LUeM6+0tc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e0577557-83f4-4254-4633-08d74f5b272a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:41.6883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VS9BrOVo7DulB1kLPeEgfj3m8BaG6RDo0ELgX92eNLOax3Ry78V3N3zQ0tCo5EqMTHudIqsJvdjrI5+Pd79xOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUN9g006631
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 52/72] libmultipath: use unsigned blksize in
	directio context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 21:34:15 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/checkers/directio.c | 2 +-
 libmultipath/io_err_stat.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
index 1b00b775..239a811c 100644
--- a/libmultipath/checkers/directio.c
+++ b/libmultipath/checkers/directio.c
@@ -37,7 +37,7 @@ const char *libcheck_msgtable[] = {
 struct directio_context {
 	int		running;
 	int		reset_flags;
-	int		blksize;
+	unsigned int	blksize;
 	unsigned char *	buf;
 	unsigned char * ptr;
 	io_context_t	ioctx;
diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index d7e296fa..dcc8690d 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -54,7 +54,7 @@ struct io_err_stat_pathvec {
 
 struct dio_ctx {
 	struct timespec	io_starttime;
-	int		blksize;
+	unsigned int	blksize;
 	void		*buf;
 	struct iocb	io;
 };
@@ -128,7 +128,7 @@ static int setup_directio_ctx(struct io_err_stat_path *p)
 {
 	unsigned long pgsize = getpagesize();
 	char fpath[PATH_MAX];
-	int blksize = 0;
+	unsigned int blksize = 0;
 	int i;
 
 	if (snprintf(fpath, PATH_MAX, "/dev/%s", p->devname) >= PATH_MAX)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
