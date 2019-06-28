Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A705A554
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 21:47:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34BD930860AB;
	Fri, 28 Jun 2019 19:47:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965005C640;
	Fri, 28 Jun 2019 19:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8143D1806B16;
	Fri, 28 Jun 2019 19:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SJbpr3032522 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 15:37:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 165D8608CA; Fri, 28 Jun 2019 19:37:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9E6660922;
	Fri, 28 Jun 2019 19:37:48 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B083C04FFF9;
	Fri, 28 Jun 2019 19:33:03 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 28 Jun 2019 19:33:42 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 28 Jun 2019 19:29:42 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 28 Jun 2019 19:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
	b=jGokM1YSLAceNGC+0NdGjnaMm6F/F7gP3V0n46hzaxwnPQWtpARs0US/GQagq9kHg+oh1ejfbTqvMcjlKslrjTqr13SBQDMinATsii+0AgVzACeEaZMnwhCp13sKHM5VWM75qfUpe1x6Ppbz5uPp4VAvR6esIeTdu8mcJr2Orzg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=testarcselector01;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lekMSQ0DNr/9Vbwv9suPiRpMMNnrPAbE2zZHSnYpXVE=;
	b=ZWyfsnt3V4M0v9/6EB69R7BR7UfMzRYo41zWboQHntWdqtBB2I5HzWJTQTNNTaHoPykLi1xHK0F80TN98uRboql2AO0uH+sOvN8dlI1VkKVIJ1KhHpLy0ijXZ/2GACu2VTjbeb1MdDOUN9HBYA/nJdoiQlJTCkN0/KadU4Ir2G8=
ARC-Authentication-Results: i=1; test.office365.com
	1;spf=none;dmarc=none;dkim=none;arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3205.namprd18.prod.outlook.com (52.132.244.219) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Fri, 28 Jun 2019 19:29:41 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::44b3:339c:b96c:69b]) by CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::44b3:339c:b96c:69b%7]) with mapi id 15.20.2008.018;
	Fri, 28 Jun 2019 19:29:41 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH] kpartx: recognize DASD on loop devices again
Thread-Index: AQHVLefVF6pI0ZIasU6jom1Ir3STlQ==
Date: Fri, 28 Jun 2019 19:29:41 +0000
Message-ID: <20190628192911.18192-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5P189CA0002.EURP189.PROD.OUTLOOK.COM
	(2603:10a6:206:15::15) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [88.78.145.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b0c0b6c-fcf0-41b5-6d8c-08d6fbfef743
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3205; 
x-ms-traffictypediagnostic: CH2PR18MB3205:
x-microsoft-antispam-prvs: <CH2PR18MB3205B3D8D67F9CEEA480D8D0FCFC0@CH2PR18MB3205.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(5660300002)(71200400001)(186003)(1076003)(54906003)(6486002)(486006)(53936002)(66066001)(81156014)(6116002)(316002)(44832011)(3846002)(6436002)(64756008)(476003)(66556008)(36756003)(66446008)(86362001)(6512007)(2906002)(66476007)(73956011)(66946007)(2616005)(50226002)(6506007)(7736002)(14454004)(52116002)(305945005)(107886003)(72206003)(6916009)(8676002)(8936002)(81166006)(386003)(25786009)(102836004)(68736007)(4326008)(256004)(26005)(71190400001)(99286004)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3205;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kNY81yCXbpW7FoVamsZbrnZb6rwAeh08RdnhnpyR6ChJTHXlZcgj1TClwTbj9/6CclCPs/13y5ajzYBWzJHuR7RRaW6qQ+heX5SvG/ELBQtxKyZd+xmcFnnsbR5mGYaXFhEjLmdkZCLc8gOq9/hP4Gyad1so33Ze+thQwPMLaZCtlxp04AzoMLE6SnbOmnRXYSgGGl/jMt3yYhmDwDS9bBPikyGpi3LVVaZXKJ7k8yFQAa6VfkwVdeue7/oYljV3QBrptj1hPyA59r4tSVepDBxtKuJtivlPcd2RdpQY+sAdPP6PQxh70Jt3lrJr5vdSsJ3gQ1psWZ+MAyVjq/k7/oJohEY87ZG+YL506YWk23eWAwTFJc61j00hJ23ztiT6NB8YUAc4omDuWNB3+W6jMivpJmDJyspjH/9YuinmuOE=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0c0b6c-fcf0-41b5-6d8c-08d6fbfef743
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 19:29:41.2397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: martin.wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3205
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 28 Jun 2019 19:37:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 28 Jun 2019 19:37:39 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5SJbpr3032522
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] kpartx: recognize DASD on loop devices again
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 28 Jun 2019 19:47:38 +0000 (UTC)

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
---
 kpartx/dasd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index 61b609a5..3fcef6ad 100644
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
 	}
@@ -277,6 +274,10 @@ read_dasd_pt(int fd, struct slice all, struct slice *sp, int ns)
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
2.21.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
