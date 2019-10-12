Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C563D52BB
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2EDF4628B;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4485C241;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0514EE68;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLTGQQ006282 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:29:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAE4D1001B07; Sat, 12 Oct 2019 21:29:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 384DF1001B08;
	Sat, 12 Oct 2019 21:29:14 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3900300BEAC;
	Sat, 12 Oct 2019 21:29:12 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:28:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:05 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UOH0JBkuNO7ZQJxcBTBT2ibj6mRFKC1rUiApvRdOkVP9F5wNSGZ//lIO5J8iA9DxXApueSHSGtkHNaKsSyzfo2JL1z884fFs/QQ7b1ilUuQ7ODXGe+ByyWhq/JHhKijRO+rvmURWIhS5gI23BiRElDEKxa5itgBs4Hk0HmprEJKJLwLjvIjZOlVPzRI/DHLiTIZ8vmJejcOU0ODFheu+aEBBSRacmxk3cI+3zPrx+YAhRn0uWMcZwbGcIrPVg5C5/8Ko1J9v/ewDDLXdCRUx+A2SFHsQwoVb3lEsRq54e6Cm/URQarOMOHJ/JgoNZcH7k401dMi4n9NwmM3nu3foCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2DBGCrnJN/46u/YWt0oVwUd1qjTfjFNkmkr37gsXVpY=;
	b=etDE7uQ9Ss9ihi8xqsMMjRbnHF5zgWc0cZE10bn92s55xIGdzE48yN+0niJX3zhyX0rUNcCzDXvG5ILsmGe10THip1kvGxLp4/aJG3Z4m6hn3Fa/lU5hFKmDlnGar0jf94R8fUf5cA0l/qo/UvkpLgc0cZ+e3ZQ0YYqqyT3i1SKzfdx2oWft/KnVl/Vr2SH/bMR85w1DCfdnxyxEtMZJ4neh4titkWm37wbPmh/ho/bgAt/Zk+kCuAfYiWKw+70wLL7qJ++4Olp7Fu3nxGoFz76tPzE1Qy0kcJR/8pHrjlzGbZUNwmkw2UoBi76OnAfWOv4Cm4dmPQngn91vja1B4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:02 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:02 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 20/72] libmultipath: _init_foreign(): fix possible memory
	leak
Thread-Index: AQHVgUPtYZZkDLBj+EW4dhojrwgACw==
Date: Sat, 12 Oct 2019 21:28:02 +0000
Message-ID: <20191012212703.12989-21-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 100ce104-ab6d-4d91-3c15-08d74f5b0fb1
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317A9B9FE6A3F2F723BD8C9FC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:109;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Y0SuidAt9FBGbzwYwtP7SKHBycQ14pJy7o7PwI+0FPgXflR21cVlqlEVGQJe2mt7zNpVEdpY0bcfoX+qa2gL3FNJFWPOlPqkHJQ9OsyuBr0EwLQJutMJIUq83c/u0zOwE9WTE+8PHHbtIBdyWTBkO20DQgxXVINy+bD6tiEoHQwZ+ubIT6V2sNRYDXvTYb66rN5wNLvf713q+IKWVJmazG82Gc23PuMYYrlcfjKm1b3tL1UJGJT3V664h6vAjWfmvVVUDqv+Li0XatNospgJcAaTDX8CfbxVqenjD2+uJjvu7Y4kaUebvGNiwm70ka0avEllH9nDj41B4WNjRuKa7JCEDpVDUIluEoVrcgspoUaU5hxOi2L/yPjxKYfO4pxq57RycLquliftwfWkr3QpE84M7a84LZmipncEMRg/Wo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 100ce104-ab6d-4d91-3c15-08d74f5b0fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:02.1645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mYhKe20O9U6BGrHcL7/G69/UedbwFKJ2bKZ0KkGPAycU9oR1hg/JoDsdA2HrKiXKIn0PefYvZOfprmIJck28g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Sat, 12 Oct 2019 21:29:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Sat, 12 Oct 2019 21:29:13 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLTGQQ006282
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 20/72] libmultipath: _init_foreign(): fix
	possible memory leak
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sat, 12 Oct 2019 21:32:29 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

free_pre() wasn't called if scandir() failed. Fix it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/foreign.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
index 4b34e141..9ef8ad19 100644
--- a/libmultipath/foreign.c
+++ b/libmultipath/foreign.c
@@ -148,7 +148,7 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 			(void)regerror(r, enable_re, errbuf, sizeof(errbuf));
 			condlog (2, "%s: error compiling enable_foreign = \"%s\": \"%s\"",
 				 __func__, str, errbuf);
-			free_pre(&enable_re);
+			goto out_free_pre;
 		}
 	}
 
@@ -157,13 +157,13 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 	if (r == 0) {
 		condlog(3, "%s: no foreign multipath libraries found",
 			__func__);
-		return 0;
+		goto out_free_pre;
 	} else if (r < 0) {
-		r = errno;
-		condlog(1, "%s: error %d scanning foreign multipath libraries",
-			__func__, r);
+		r = -errno;
+		condlog(1, "%s: error scanning foreign multipath libraries: %m",
+			__func__);
 		_cleanup_foreign();
-		return -r;
+		goto out_free_pre;
 	}
 
 	sr.di = di;
@@ -249,9 +249,11 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 	dl_err:
 		free_foreign(fgn);
 	}
+	r = 0;
 	pthread_cleanup_pop(1); /* free_scandir_result */
+out_free_pre:
 	pthread_cleanup_pop(1); /* free_pre */
-	return 0;
+	return r;
 }
 
 int init_foreign(const char *multipath_dir, const char *enable)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
