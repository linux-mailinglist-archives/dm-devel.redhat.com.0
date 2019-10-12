Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B9117D52C7
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:33:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04B3D309BDBC;
	Sat, 12 Oct 2019 21:33:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C856B6031D;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3240A1803517;
	Sat, 12 Oct 2019 21:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLU2Q5006474 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78BD860C5D; Sat, 12 Oct 2019 21:30:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D767960BF1;
	Sat, 12 Oct 2019 21:29:59 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 382F4308424C;
	Sat, 12 Oct 2019 21:29:57 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:13 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:51 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=a+NdwTuOFcGvTHG/lUM3nw/mbSuqLV7UjEtHUV6wBJR+txLUD/kRvoHXMgg+WB2TfUN5KyrXe8tw5F5qx878DDSIHA7Fxk6BiZgnpfTx+dr99x5DdQoFkRDpWdHnaMPpG1rgQk21AYWpdpbbr1hBfltV4l0nX42lnZ5A3+pzL8ITjDb6gf1BpG1gLFXGRifpFydKqf7MwIKUozuqlgpanEiEAmJpQqHYknFyNvlIB86URF62Y7Ck1uLqzPJAcAz7gHs8smryZwS4bIztEyGkrHQOBPhNVG2F0MdCyYZ9rkEY91yXcjCvDiJJXkAwY9CKPyoKAPoJUof1oy/AYwfxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SAqF1Lz5H7iht9gjZFeovo27x8XJH4QA6eog20U+TOU=;
	b=UavpDhydq+SBFBWbO2TdBDw5WhVe4oomdUw0PhK7D+mLlDiYqBLFG8zPMIZDigs1+tLYLi4WkCvjrDVqbBrWtKqZd5hix4EM/PBMBS+75NeO+lE/PzaFSJ+c710poQZsLz/vm7VBVTzV6/oFgj97l2xfXbNDttWkTg99pLe5vEBnG9zMCSGZKderX3Lerr/cbQ0BXrqdv3X34U2CiYWGVkBeAH2r2cq3kYdGtDM62arHZbedU9lRHOvvImS4Atg1YGF4GoSvJw9SCXaqpFoPR61J4MlhJf9WV1B5ZZXMqkeVXkHTVx6MiFKfpLeqytGtzgE/PwOJ0BpH8wM/RVfDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:46 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:46 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 33/72] libmultipath: mark missing arguments in functions
	matching prototypes
Thread-Index: AQHVgUP3Z8xnh7/KSU2b7x3Mw9hlew==
Date: Sat, 12 Oct 2019 21:28:18 +0000
Message-ID: <20191012212703.12989-34-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 145c5888-d2a4-4541-2c04-08d74f5b1967
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331725490066F14DF3C08304FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:214;
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
x-microsoft-antispam-message-info: am95TV2PQF4XHTNG7iY40KHneTejxh8GS4KhguN/X1O4w4ERB38JkDeIDtHEquyHLdsoHVH+bD5XmoAekbNUQBDHJpJJgnFOO3PBe0mU3cfMoUvNt2UyptN/Ui4ueDVG7bxMawpgUc6GIAdZfXyHIFbOijly/Q9ULfRjvrZtTb0KX05gFIwyW2e7bAD9BopEcAb75kkVk10zcbEUpBr+GpRvWCOqkPfgHJAGH2AH9+3DbnTuHFHxNhxHIGnrmEJDq9MnpopN2Iu5ho0fvRhG1FyWAFoCOQJjggiHmdlYIsQKbxBxJMBisWjBq4RGAgSFBXjV6PwLXWWPhm7/zQ/AYoZX9WDaJy5lpRjVkEWxtt5+7SINPN0mtTkSM0gEGPrzEzRNZeZVTyw1faRSh7bGypxDwmD2s4fchZkKl0mhpdY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 145c5888-d2a4-4541-2c04-08d74f5b1967
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:18.4563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCHY4abEMwMPhy2ue54I0G2CXikPusr0REgYnlmuzVH2HE9UcPSIMJWlrBQWOb6gDnUtJaMhYicGuSxS4Fo7jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Sat, 12 Oct 2019 21:29:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Sat, 12 Oct 2019 21:29:58 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLU2Q5006474
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 33/72] libmultipath: mark missing arguments in
 functions matching prototypes
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 12 Oct 2019 21:33:31 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dm-generic.c   |  6 ++++--
 libmultipath/foreign/nvme.c | 20 +++++++++++++-------
 libmultipath/generic.c      |  2 +-
 libmultipath/print.c        |  6 ++++--
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/libmultipath/dm-generic.c b/libmultipath/dm-generic.c
index d7529919..1b42fa0b 100644
--- a/libmultipath/dm-generic.c
+++ b/libmultipath/dm-generic.c
@@ -31,7 +31,8 @@ dm_mp_get_pgs(const struct gen_multipath *gmp)
 			      struct pathgroup, dm_pathgroup_to_gen);
 }
 
-static void dm_mp_rel_pgs(const struct gen_multipath *gmp,
+static void dm_mp_rel_pgs(__attribute__((unused))
+			  const struct gen_multipath *gmp,
 			  const struct _vector* v)
 {
 	vector_free_const(v);
@@ -44,7 +45,8 @@ dm_pg_get_paths(const struct gen_pathgroup *gpg)
 			      struct path, dm_path_to_gen);
 }
 
-static void dm_mp_rel_paths(const struct gen_pathgroup *gpg,
+static void dm_mp_rel_paths(__attribute__((unused))
+			    const struct gen_pathgroup *gpg,
 			    const struct _vector* v)
 {
 	vector_free_const(v);
diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index 7e654ec5..e8ca516c 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -123,7 +123,8 @@ nvme_mp_get_pgs(const struct gen_multipath *gmp) {
 }
 
 static void
-nvme_mp_rel_pgs(const struct gen_multipath *gmp, const struct _vector *v)
+nvme_mp_rel_pgs(__attribute__((unused)) const struct gen_multipath *gmp,
+		__attribute__((unused)) const struct _vector *v)
 {
 	/* empty */
 }
@@ -207,7 +208,8 @@ nvme_pg_get_paths(const struct gen_pathgroup *gpg) {
 }
 
 static void
-nvme_pg_rel_paths(const struct gen_pathgroup *gpg, const struct _vector *v)
+nvme_pg_rel_paths(__attribute__((unused)) const struct gen_pathgroup *gpg,
+		  __attribute__((unused)) const struct _vector *v)
 {
 	/* empty */
 }
@@ -331,8 +333,9 @@ static int snprint_nvme_pg(const struct gen_pathgroup *gmp,
 	}
 }
 
-static int nvme_style(const struct gen_multipath* gm,
-		      char *buf, int len, int verbosity)
+static int nvme_style(__attribute__((unused)) const struct gen_multipath* gm,
+		      char *buf, int len,
+		      __attribute__((unused)) int verbosity)
 {
 	int n = snprintf(buf, len, "%%w [%%G]:%%d %%s");
 
@@ -821,7 +824,8 @@ int add(struct context *ctx, struct udev_device *ud)
 	return rc;
 }
 
-int change(struct context *ctx, struct udev_device *ud)
+int change(__attribute__((unused)) struct context *ctx,
+	   __attribute__((unused)) struct udev_device *ud)
 {
 	condlog(5, "%s called for \"%s\"", __func__, THIS);
 	return FOREIGN_IGNORED;
@@ -903,7 +907,8 @@ const struct _vector *get_multipaths(const struct context *ctx)
 	return ctx->mpvec;
 }
 
-void release_multipaths(const struct context *ctx, const struct _vector *mpvec)
+void release_multipaths(__attribute__((unused)) const struct context *ctx,
+			__attribute__((unused)) const struct _vector *mpvec)
 {
 	condlog(5, "%s called for \"%s\"", __func__, THIS);
 	/* NOP */
@@ -927,7 +932,8 @@ const struct _vector * get_paths(const struct context *ctx)
 	return paths;
 }
 
-void release_paths(const struct context *ctx, const struct _vector *mpvec)
+void release_paths(__attribute__((unused)) const struct context *ctx,
+		   const struct _vector *mpvec)
 {
 	condlog(5, "%s called for \"%s\"", __func__, THIS);
 	vector_free_const(mpvec);
diff --git a/libmultipath/generic.c b/libmultipath/generic.c
index 0d1e632a..5f03b9e0 100644
--- a/libmultipath/generic.c
+++ b/libmultipath/generic.c
@@ -21,7 +21,7 @@
 #include "structs.h"
 
 int generic_style(const struct gen_multipath* gm,
-		  char *buf, int len, int verbosity)
+		  char *buf, int len, __attribute__((unused)) int verbosity)
 {
 	char alias_buf[WWID_SIZE];
 	char wwid_buf[WWID_SIZE];
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 907469ad..74c0d62d 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -334,7 +334,8 @@ snprint_multipath_rev (char * buff, size_t len, const struct multipath * mpp)
 }
 
 static int
-snprint_multipath_foreign (char * buff, size_t len, const struct multipath * pp)
+snprint_multipath_foreign (char * buff, size_t len,
+			   __attribute__((unused)) const struct multipath * pp)
 {
 	return snprintf(buff, len, "%s", "--");
 }
@@ -627,7 +628,8 @@ snprint_path_checker (char * buff, size_t len, const struct path * pp)
 }
 
 static int
-snprint_path_foreign (char * buff, size_t len, const struct path * pp)
+snprint_path_foreign (char * buff, size_t len,
+		      __attribute__((unused)) const struct path * pp)
 {
 	return snprintf(buff, len, "%s", "--");
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
