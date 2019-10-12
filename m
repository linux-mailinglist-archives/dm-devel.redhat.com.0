Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93AD52A8
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CD7C30ADBB0;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B90C60C05;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC9CF180B536;
	Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSQb5005991 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49122608C2; Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 404866092F;
	Sat, 12 Oct 2019 21:28:26 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDBF281DE0;
	Sat, 12 Oct 2019 21:28:24 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:31 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:51 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dIFh0ipWtiCagOqWeoMlrBM/KlVmgr9jI/IPq47UGpFwD6iYXm4JHDANqGNf0/PXa5g7cE4ZiEtIKk2b/sUu01mXg9glqzcnOjEiogT5HDeauEoKESZ9Iuc0pBprcRld7lj44QhnscX/drQ8u5ZXyo+BDo12dMIOuRRgP0CrThOi9jaBF1fRoARllTGovI+0hAnFEAbKDnXznZZXEEO+BQuUwEfZyz9DMzbL+MS4c9efC8h0HW2tPCI7aDTN8sev0kRTdTQcpn4t5D9B/eltWA/FxA/Dz4NQ7lRSr1EYvIrsSzBBEeTKubHrl/iu0CdV9K+BqPFMSWUY7qJpvl0Qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jLX1Z2WIt8y5BWAMHjQAJqnnf4p7cC09f8Z7oay6pCU=;
	b=CBPjTJ8JJoAmmNXrDK2YCQWOsAL6AL+YNCysWnF4OipaNfrmgXGzyb+KGDYatxEe1T0vdnXuzZm6p9GHxqakbMwn7FKbKdx5+Dy3gdIM0ShAzTsmJJeVXZS1yfihrDePYzyo80IJ4PhM9Moidw4wQLyjEEsGWtZ4+blVjtXgde1zakm/SawdJFH2FIP8IRv1pxza9SPQQONiA9lBPNgBLfw1GGe2vNyMiV2e0HJcV4km3qPKlItP9Ezel4o66Bw8ON2w+7J3Lc87HBNxCQftI1H2Segnby/Dh6AF1RS9P0XPexiYoEdXBltjND2lVLA0kLC81Ww80/MjQpItiR/3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:47 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:47 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 08/72] libmultipath: rlookup_binding(): removed unused
	parameter
Thread-Index: AQHVgUPkCeN2IDucrk+ZIP9PWbH0qA==
Date: Sat, 12 Oct 2019 21:27:46 +0000
Message-ID: <20191012212703.12989-9-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 2fb95730-f3ce-4599-5bca-08d74f5b0691
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331778A3F5BF2D0F0300173AFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UvfrQNdHQDiNP14N8F/hT0RL9hGWoXj3c1R+CyIU29l9thh+ItnRGrJh3IeKl/9G4HcDIjtI4k7rHzNv9UcwotoQwlWq+UdZ3Vl99h2MwB63LLSuy73hLASCNf5Kj2ozn1mQ1iLrNQhHVuGJwls7f7CFwXyPnHODDrfwNB0i43lCwoAjbx8AhgW1swHyYn9YHcASMDgksk7wFAZIQDwrxOZoq2WZSFc8VCB0qkA/Ft7b/cG7M5ptUgFHqcbzFWEZWGoXAhcbNVrgB/gnnSW595dR1Xm5P4WvPxQyZTsgexPRYa6sKHyp35Zl6F/hXbZcklt4rJm3tXrAqTEpUVQ20eosuruQ1v1/9/TLZ0wQG8nINA4pfmYrKnzb6jaQm4K022h6cKicI1zf6n0S+i4Cb9xvDQpsw0zHLun318NaG8Q=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb95730-f3ce-4599-5bca-08d74f5b0691
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:47.0020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuqlsO7zWab60bmac7b0ySwN0nHKuDJALCf8zAeteOCV+0y3k9TYSgztxMK/3J3aGbIleNRrLaCzB1z8hXwdMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Sat, 12 Oct 2019 21:28:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sat, 12 Oct 2019 21:28:25 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSQb5005991
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 08/72] libmultipath: rlookup_binding(): removed
 unused parameter
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 12 Oct 2019 21:30:45 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

The parameter "prefix" is unused in this function.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index ac342a54..767800d0 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -183,7 +183,7 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 }
 
 static int
-rlookup_binding(FILE *f, char *buff, const char *map_alias, const char *prefix)
+rlookup_binding(FILE *f, char *buff, const char *map_alias)
 {
 	char line[LINE_MAX];
 	unsigned int line_nr = 0;
@@ -297,7 +297,7 @@ use_existing_alias (const char *wwid, const char *file, const char *alias_old,
 	/* lookup the binding. if it exists, the wwid will be in buff
 	 * either way, id contains the id for the alias
 	 */
-	rlookup_binding(f, buff, alias_old, prefix);
+	rlookup_binding(f, buff, alias_old);
 
 	if (strlen(buff) > 0) {
 		/* if buff is our wwid, it's already
@@ -412,7 +412,7 @@ get_user_friendly_wwid(const char *alias, char *buff, const char *file)
 		return -1;
 	}
 
-	rlookup_binding(f, buff, alias, NULL);
+	rlookup_binding(f, buff, alias);
 	if (!strlen(buff)) {
 		fclose(f);
 		return -1;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
