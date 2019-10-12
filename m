Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0883AD52A1
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B048D3066F04;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A05C1C945;
	Sat, 12 Oct 2019 21:30:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B948B1808878;
	Sat, 12 Oct 2019 21:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSTOd006053 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5C44608C2; Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9CB6092F;
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AEFEB18CB911;
	Sat, 12 Oct 2019 21:28:28 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:49 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:04 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Y/EeVZxNkcI42IzLXCx0j4ThfrR4dmaAjBRLR6nonXeCoHXB2gEmdkIOSBBkQeZn8azTrWNET1ESYIOjf0KICCyrXwBWyl/4hQzqP4QHXiu+peKIoaw8dSzTbpSuE+Hujqxitdop1gss5lp3mlTnqup5FsgJOROsGWLnPc1pJrDbupdUMdr4p2WNn8+utdCwKC3sEMov034QqvrRGCYH7n/MOmxqBpJ+tiQeCW284XvdGR/Vv+uofzaQ2ZFZ2nWZsDT4HGBdMPMH7Ak/AWN3pT7WcnAHNWtCkPZYTKM3pmGiApyWkTy/IEXwbjclSX/JA94Ejl4I+7jnmanK14cOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PehmhR5xseIHIlbqwiI3iTUfHqlApcH5xM0DvPlaRlU=;
	b=kaBysfyRz8l9wF7p7gwI0QkiIKu2SKKjRc/yalAoebA9UPHPwoLBnAG4aMDLuF88RROZVCLXHFxjHD11t8mIJpHm6c5fkZW3AcHHgQpbwUG2YRXQj0T+smOSABomvzEUxCqBzGXkl+EleUAaGX2fVc1gk+d0QSePK9kEOVRNPW3yBowqFPS1Oj2g4YUc2nOYv74CADS/IwqZV3tYlXtLH6vuSiCcSkwkWhMAYPnpRNXmNT0q2DAMg2IK7ZftmlcinPRRgXm7ZIcebV3jM9PcWUt1mCnTgLI9uA/+YApa+EmpGYTO6O6rp7TjXPgeCGuQXPuUExG6hvDhjFnrYfJT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:59 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:59 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 18/72] libmultipath: replace_wwids(): fix possible fd leak
Thread-Index: AQHVgUPr6yMRc5vuHES2mGT1672frg==
Date: Sat, 12 Oct 2019 21:27:59 +0000
Message-ID: <20191012212703.12989-19-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: bf147db9-1736-42c9-f25d-08d74f5b0e2e
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317BC5CEF7F7A0EFFDCF16DFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(4744005)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xYan9guyW6/UPvlZFuj08HcAq4oa6ONb4Ovb0R5GTyluUOQGCD/Pyq4fs+u2be5cv9wHnSgud3DXKABsdBNRs4sa3WG1FRdejJiDFu9HdoSIfhsxuN8m/ON51p2MofhJAHIbb8XJnExbod9B9irXa+VwvD/sc49vnVKLNHXn/TFI+3EucwsJLr7HnBmOtbrawpjNRlS1vtvIQ25TQzb4oYmAPeym2dlt/m/loY01f3s/EvvYBTbmLYSXuszMscApuAxUePR6EHCFPBoNHucpG8KQXirAr53Je7YhPuNCl1Qc/ThX61HvrH4yAZkK6nHzfUtWE6V84J18mDQPbCQ8Wv0Vs+zUEPL0f16ZjV4wastBVti5VFEQl2JZqNCwqKqy54TnlP+qfv9407NfZTO794O1EPh4tSr3g6Ue2o0ovLg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf147db9-1736-42c9-f25d-08d74f5b0e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:59.7618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svap+4W4U+J0jwzNti2OBa9u+zT9RWTpWfqNix5m0gZVTaJCeQ6T+o0ffSRDDwP77eEQCMYMAXcUrEJnjpjv9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Sat, 12 Oct 2019 21:28:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Sat, 12 Oct 2019 21:28:29 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSTOd006053
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 18/72] libmultipath: replace_wwids(): fix
	possible fd leak
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sat, 12 Oct 2019 21:30:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

... in case the thread is cancelled.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/wwids.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index ef748125..f69ed6f5 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -7,6 +7,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 
+#include "util.h"
 #include "checkers.h"
 #include "vector.h"
 #include "structs.h"
@@ -87,7 +88,8 @@ write_out_wwid(int fd, char *wwid) {
 int
 replace_wwids(vector mp)
 {
-	int i, fd, can_write;
+	int i, can_write;
+	long fd;
 	struct multipath * mpp;
 	size_t len;
 	int ret = -1;
@@ -99,6 +101,8 @@ replace_wwids(vector mp)
 	pthread_cleanup_pop(1);
 	if (fd < 0)
 		goto out;
+
+	pthread_cleanup_push(close_fd, (void*)fd);
 	if (!can_write) {
 		condlog(0, "cannot replace wwids. wwids file is read-only");
 		goto out_file;
@@ -132,7 +136,7 @@ replace_wwids(vector mp)
 	}
 	ret = 0;
 out_file:
-	close(fd);
+	pthread_cleanup_pop(1);
 out:
 	return ret;
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
