Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F86324E
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 09:45:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1164A300183C;
	Tue,  9 Jul 2019 07:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE07CB23E1;
	Tue,  9 Jul 2019 07:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7638641F53;
	Tue,  9 Jul 2019 07:42:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x697g13u031237 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 03:42:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBFE81840A; Tue,  9 Jul 2019 07:42:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FBAE183D1;
	Tue,  9 Jul 2019 07:41:59 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AB36A3B5D;
	Tue,  9 Jul 2019 07:41:50 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  9 Jul 2019 07:41:50 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 9 Jul 2019 07:40:03 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 07:40:03 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.246.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Tue, 9 Jul 2019 07:40:02 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Tue, 9 Jul 2019 07:40:02 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 2/4] kpartx: recognize DASD on loop devices again
Thread-Index: AQHVNimEVSLHgKBLPkyYh5HfJ+6UTA==
Date: Tue, 9 Jul 2019 07:40:02 +0000
Message-ID: <20190709073909.32112-3-martin.wilck@suse.com>
References: <20190709073909.32112-1-martin.wilck@suse.com>
In-Reply-To: <20190709073909.32112-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P192CA0014.EURP192.PROD.OUTLOOK.COM
	(2603:10a6:209:83::27) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0695c101-83b8-404d-eadd-08d70440a714
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3319; 
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-microsoft-antispam-prvs: <CH2PR18MB3319DACF90E8391C2AF6D3C2FCF10@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(386003)(52116002)(6506007)(6512007)(107886003)(110136005)(81166006)(81156014)(478600001)(54906003)(8936002)(26005)(2616005)(256004)(6436002)(4326008)(72206003)(6486002)(316002)(76176011)(102836004)(5660300002)(36756003)(44832011)(66556008)(66476007)(73956011)(1076003)(66446008)(7736002)(305945005)(6116002)(3846002)(486006)(68736007)(14454004)(86362001)(66066001)(99286004)(66946007)(64756008)(71190400001)(71200400001)(476003)(53936002)(186003)(11346002)(2906002)(8676002)(50226002)(25786009)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iE55XHqjI6hW8so7WechzvJItKYFzePpaw7933fCYOmZaRBqQIrWT7m1yUtpvn5c1cEdY35VykcFifRsaHasXl7e8SqtMtT3p8uFtNQk/BtrRE4TwLq1aGGayURoIwSGV1Z7SpQth3JWEOXnFKqZocAfp8m+CeXqkAzuNUf/VnDvJuYxNAbVxayvpEPSn/v+KCrWxZRbUc46Vt8s9sqHLNVLzOK4+onUIxDPwn9Ju/RK3oYxohIAKkPtZO41IV0nMr3Ajv4MWgE+EGjOVwqnOMV520+nGglX73pRwZswXsdJT8c/bqk3MxR5AnA6GhQwo9XEEeimHqk40RJxWjiQGFW0euuNZKb1tnnBbJlLEBdjb9oqPunHlGMjC4A4QZ7D+hGqBEHzPykH7OWvSSpAmrml/NTLij7hwYhznTiFjSc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0695c101-83b8-404d-eadd-08d70440a714
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 07:40:02.5297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 09 Jul 2019 07:41:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 09 Jul 2019 07:41:51 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x697g13u031237
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] kpartx: recognize DASD on loop devices again
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 09 Jul 2019 07:45:02 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Since 4d57b868, DASD partition tables are only recognized on
DASD hardware. This turns out to break certain software that works
e.g. with DASD partition tables on loop devices. The problem that
4d57b868 attempted to fix was that "unlabeled disk" format has
no signature at all and is detected on any volume, including
empty ones.

With this patch, DASD partition table formats other than "unlabeled
disk" are detected on non-DASD devices again.

Fixes: 4d57b868 "kpartx: only recognize dasd part table on DASD"
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/dasd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index d95d8ca0..4e7e4743 100644
--- a/kpartx/dasd.c
+++ b/kpartx/dasd.c
@@ -133,9 +133,6 @@ read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
 			/* Couldn't open the device */
 			return -1;
 		}
-	} else if ((unsigned int)major(sbuf.st_rdev) != 94) {
-			/* Not a DASD */
-			return -1;
 	} else {
 		fd_dasd = dup(fd);
 		if (fd_dasd < 0)
@@ -279,6 +276,10 @@ read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
 			size = disksize;
 			if (fmt_size < size)
 				size = fmt_size;
+		} else if ((unsigned int)major(sbuf.st_rdev) != 94) {
+			/* Not a DASD */
+			retval = -1;
+			goto out;
 		} else
 			size = disksize;
 
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
