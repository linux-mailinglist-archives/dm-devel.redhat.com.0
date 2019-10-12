Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B39D52CE
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D248530BBE88;
	Sat, 12 Oct 2019 21:34:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A75765D9CC;
	Sat, 12 Oct 2019 21:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44A791803517;
	Sat, 12 Oct 2019 21:34:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUVIW006694 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF85A5DA5B; Sat, 12 Oct 2019 21:30:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E475DA8D;
	Sat, 12 Oct 2019 21:30:31 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D8154628B;
	Sat, 12 Oct 2019 21:30:30 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:51 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:02 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Pb3hibnvmgoWewfYjARr9ZlnPHWqpl1fTIQjJ4zQ8A5oz2f+wdHvKhdJlyrl5eDJxsSrE98RMDqWFbnyzsHWBlaAF+8jr+Pzj10oZ/qw41f9if/3Uy4w4BCJc+AeLFEn34Xl/tS7zvvWIXN6VRXzQ7UYCuWqPWd4sFe9dhYV+pi2yNYW/YRmdtVRmy8J8pg5MjswCXoNF/h3PQ2jIceCh2fjn5IZ1Da+VY7BAr2BJdR5y8oeWo0UiUmaMGrznhu0Q+VOx4UI2cRFNxcJ35kN6ODl00nWGNvlw6v5tGr1GhnQUDoW3+ZPAIJjNHcy0H72fv5z2i45da07KUy+GXVapw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NJMppSmdmiyebriszpvI4QPX0FF+RiW/A8aS2KCIoHA=;
	b=Uy8gbP+5IOwIun3llYRngOFgt2FN8FSJ7y87DzYt3kD6K3LMsK9z4ZiWM1gjg8OPjqAkEZNy1Dt4CNEWiWVYRBX9YVwRaf8QE95BP+x/fAfCqqj8RbaUnMK7fjQUHnBvQPraAraN1CFP/LmlJ9ALpVMGIf3+/31dX2ak4cqqCRFYmlPplS7ozbRGji8CnN7bXX8WZ7KzdelZNmNx/Vrpz6MCwhh660xMB+6pe3UVs2x6gNj1Qs5DvubH/nEVURo58of9MBlqGS/QwbSSGNIpzzetM9m9v4ebVovNsf6NoqwQJaYpfVmyM3HscHGd14hOgx3OGRl4TJ+UxsNM9wScmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:29:00 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:29:00 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 59/72] libdmmp: fix clang -Wformat-nonliteral warnings
Thread-Index: AQHVgUQKSNjmgfwjGUCKoyYI5lGyPw==
Date: Sat, 12 Oct 2019 21:28:50 +0000
Message-ID: <20191012212703.12989-60-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 01cdd57a-4e0f-4f87-8673-08d74f5b2cb6
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331790A2EB33FA830B9B5E4CFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
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
x-microsoft-antispam-message-info: 1uGRiucplvOcbktua8kyRWkOy7G6VAKb4uxfUjgh3S5LIEAmCIWg2cIWOfGY5Qjs2lMqk+97uDVRMcPUXWNVx0nhA/WGdEsf8D3feCnPN2waBjD6TrTkjIC6NfYSy89TRUKefEOCVmBThlamiAHZvIB6zGodGJUkGdUyjp0w2YHpETuVGcQHs3UYK6a1dVKG1chzJ0C/6dQE3tQx8tCCOtDGL5wA83VJm4LI2T/1Z4kSo5y4y3xWGSKdu0Oi77lBtdCgmBDvW1cP3I0gdHLDrJBaGrU8QslacE0jql2n5bHd6K2yrP7uN2pzN1j4ynxIh2I0dO/84KdZVUluZzl0ll59sXmvDpz2WQgbCMADMQnBQ2ePiYAEri53DIcTYXf3+S4zfbXsMButEXA+IfuMkHnKfxuMSJzwm+PHcN+37jU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cdd57a-4e0f-4f87-8673-08d74f5b2cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:50.8791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVcPoxabj6wQz6epvvafrstyD5pJroPsODSPrIX8CvcoeSLxfs7ex/X0yh3V+hAV8UedPcxz/BAEDaz0ZNVG4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Sat, 12 Oct 2019 21:30:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Sat, 12 Oct 2019 21:30:30 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUVIW006694
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 59/72] libdmmp: fix clang -Wformat-nonliteral
	warnings
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 12 Oct 2019 21:34:35 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

clang enables -Wformat-nonliteral with our compiler flags, and
thus needs these format(printf, ...) attributes.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libdmmp/libdmmp_private.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
index 3e813cb4..ac85b63f 100644
--- a/libdmmp/libdmmp_private.h
+++ b/libdmmp/libdmmp_private.h
@@ -131,13 +131,15 @@ DMMP_DLL_LOCAL void _dmmp_path_free(struct dmmp_path *dmmp_p);
 DMMP_DLL_LOCAL void _dmmp_log(struct dmmp_context *ctx, int priority,
 			      const char *file, int line,
 			      const char *func_name,
-			      const char *format, ...);
+			      const char *format, ...)
+	__attribute__((format(printf, 6, 7)));
 DMMP_DLL_LOCAL void _dmmp_log_err_str(struct dmmp_context *ctx, int rc);
 
 DMMP_DLL_LOCAL void _dmmp_log_stderr(struct dmmp_context *ctx, int priority,
 				     const char *file, int line,
 				     const char *func_name, const char *format,
-				     va_list args);
+				     va_list args)
+	__attribute__((format(printf, 6, 0)));
 
 
 #define _dmmp_log_cond(ctx, prio, arg...) \
@@ -164,7 +166,7 @@ DMMP_DLL_LOCAL void _dmmp_log_stderr(struct dmmp_context *ctx, int priority,
 	do { \
 		if (ptr == NULL) { \
 			rc = DMMP_ERR_NO_MEMORY; \
-			_error(ctx, dmmp_strerror(rc)); \
+			_error(ctx, "%s", dmmp_strerror(rc));	\
 			goto goto_out; \
 		} \
 	} while(0)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
