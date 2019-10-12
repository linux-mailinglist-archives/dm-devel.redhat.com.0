Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 644CAD52A7
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78ABE7575B;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EEA15C241;
	Sat, 12 Oct 2019 21:30:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D39F74A460;
	Sat, 12 Oct 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTD8T006262 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 887F05D71C; Sat, 12 Oct 2019 21:29:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3696B5D6A3;
	Sat, 12 Oct 2019 21:29:11 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B841300BEAB;
	Sat, 12 Oct 2019 21:29:09 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:15 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:59 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GI6Wnl8eQXsEKWLERGhxp2sO15kjsBuLKuFkvhArFPKkYq26jJXWs4aR5wGNH2ZG44RyEiS3wxSbt8e+ToMISqU3mdM38dHcNBG1VXK53aDU4UJTitbo4E/J6yebH4AAVGIUjzuk3sA8GPcJkvFDrepfTuXUn6/Omir3Pk/fJTWDzJ08K4NBhYOQz6Ai+TovOtwAiZiRwQb3VpnEKwzJhsDFhprvJaQIgeA886pQNczOJgmaZAbCIZP67pDgGTA1HUABaW3+duVpZ1ZbdwBzPi+3Fp5JP2SXazPFBFNSyB5esO+Iisk0RjsqDU85pIzaGBIDmXo8ZgCM7PgOXyrevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9rRsifiFdp7m0VpnXoQ41KW/4ve+scFIKc3fKp/LunE=;
	b=Vfxd29mePcDjYp0/67aZPu0DadkpcjiytFc49KxGdJFvYZNpws+TWXrbXRb+vwfDccOmS+Gd/ZlTo2/oALPybfwVRI5Lcv57dR14PMt0SlSVHCRW5YIqSztq6YGNTdMON1zOYNwOikM0AL9fOh3fL/EP+uAvKhyKF/KOfV2VfKebzoni6T1D0peIUov0ww2zHLuMyxps/Xu3fgjKz/Jg7nVGBaGAexl19lE+CN2E61NiVjOrYV+EFK9PAglbxfNikvk1vg7rp2kqhZpnvB3RKzggS/r0Sasi8GmX0xFZ9eiBcxPawnm2UPqnvC696vTlark0pU3cV7c0llb1bZ/23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:55 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:55 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 50/72] libmultipath: set_int(): add error check and
	set_uint()
Thread-Index: AQHVgUQDFB2dz9prvU2Uj2e4S7uXag==
Date: Sat, 12 Oct 2019 21:28:39 +0000
Message-ID: <20191012212703.12989-51-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: f340fb8a-2f56-4a3d-808b-08d74f5b25cd
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331767431FAA492F0D38D0D9FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
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
x-microsoft-antispam-message-info: kVzQSgth9Uu9qpHa9sMS2xWSGCiQ2Spkhd2NLTJMRRo6H4l8GfD6FM3PY7y39cwQyMyCa2x7V1dDMo61b0z36QAV5z5lW6waeF36KKxU78tivrHWC525bLmu/A+1p739P+1JAzI8NMweoCU6yF7aIpIqyjChy/Tnl75nwTQMuCjmPLs496zSc8pEMv/EZHMVTYKSiUYevYGrnKbtJAU6HxxisktOUyR4rORE8C5z3kl8iuULbEUN8uw3pCaBInxEDpg1syLyHN3MwOR+/viWghlEFzfXuEllBDFqbzOm6cxAlGWpkvdu9cl4fHUAArZ+1Dq7BUqgyjXsRn9SvOsljmXwPIjTQ/l7cLwIfM7NSSY6wXfbVWpKzmpe7b0kks/neWbV35ybKsbCWPbNgPDmywr8uCKTrzGU6xnr3Yff1p8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f340fb8a-2f56-4a3d-808b-08d74f5b25cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:39.2596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6JFsfvxu8/QNIzeAhzPw3A8Mx+XkyDrvnF50945f1n2/WhwFpC4qmI4B7OuNMlRc9J6ddYhGbLgIAa+vkQcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Sat, 12 Oct 2019 21:29:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 12 Oct 2019 21:29:10 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTD8T006262
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 50/72] libmultipath: set_int(): add error check
	and set_uint()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sat, 12 Oct 2019 21:30:45 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Use strtol() to check for valid input, but don't return error
as that would cause config file parsing to fail because of a
single typo. Also, add set_uint() to parse an unsigned parameter.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dict.c | 48 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 2b046e1d..c23d525b 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -31,16 +31,58 @@ static int
 set_int(vector strvec, void *ptr)
 {
 	int *int_ptr = (int *)ptr;
-	char * buff;
+	char *buff, *eptr;
+	long res;
+	int rc;
 
 	buff = set_value(strvec);
 	if (!buff)
 		return 1;
 
-	*int_ptr = atoi(buff);
+	res = strtol(buff, &eptr, 10);
+	if (eptr > buff)
+		while (isspace(*eptr))
+			eptr++;
+	if (*buff == '\0' || *eptr != '\0' || res > INT_MAX || res < INT_MIN) {
+		condlog(1, "%s: invalid value for %s: \"%s\"",
+			__func__, (char*)VECTOR_SLOT(strvec, 0), buff);
+		rc = 1;
+	} else {
+		rc = 0;
+		*int_ptr = res;
+	}
 
 	FREE(buff);
-	return 0;
+	return rc;
+}
+
+static int
+set_uint(vector strvec, void *ptr)
+{
+	unsigned int *uint_ptr = (unsigned int *)ptr;
+	char *buff, *eptr;
+	long res;
+	int rc;
+
+	buff = set_value(strvec);
+	if (!buff)
+		return 1;
+
+	res = strtol(buff, &eptr, 10);
+	if (eptr > buff)
+		while (isspace(*eptr))
+			eptr++;
+	if (*buff == '\0' || *eptr != '\0' || res < 0 || res > UINT_MAX) {
+		condlog(1, "%s: invalid value for %s: \"%s\"",
+			__func__, (char*)VECTOR_SLOT(strvec, 0), buff);
+		rc = 1;
+	} else {
+		rc = 0;
+		*uint_ptr = res;
+	}
+
+	FREE(buff);
+	return rc;
 }
 
 static int
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
