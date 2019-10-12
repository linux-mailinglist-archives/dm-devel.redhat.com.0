Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42965D52A9
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88D2010DCCA6;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C5D560468;
	Sat, 12 Oct 2019 21:31:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEECC4E58A;
	Sat, 12 Oct 2019 21:31:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUB9e006537 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5CE75D71C; Sat, 12 Oct 2019 21:30:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F0E5D6A3;
	Sat, 12 Oct 2019 21:30:11 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C449082DA;
	Sat, 12 Oct 2019 21:30:09 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:31 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:27:57 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:27:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=X/UIvTlqbAczpYwL45suUoqab2qAojTQ7rdsye80lQefk6LiQruCMvgvZQ19SmSd2W7eUZz6y7JNjJoGbk1cA2wVvzVEh4RU16uNIdghF+ea9ki1wULzbdqnSBXSCQb+9C3WcEg3llmfG16yMqfw1CQGNSDZ8zMk4rtKuV5CFSaTJvPvesb3+Zpdx8LcxITrrP9Lvo/d/MWjPf13Dux0Kz3uWZ294Re0XXiU5xAh1IDiKJ7ngX9xPAYTE+OD5tlPmeYCl/n6FDqFDqsSMzX4HAQlXaJ3kH7jujN6tJU3WuzOFvpMyyNnFCwIKTh2DrDdSZ64yU0jpnkZUUokWR0Eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Vd/2lrKG73GXZdTv0cn8MuznbGImrIrYCLXjnUiyFVk=;
	b=c1qp8x3TEKu3iv73ChmRTEckSXLgCn6Ocbvp/Cu6/wd4gc1droNvzpQvAzKYJT+SCB82v/2Y5WHYKulg9Q69QcEZIfAfqTpD/UEdD8xFSbkREcLeyjyvIU/3OwqCe/P0KuGFNAXx7n5fGpo0M8Uas+yit9SI3Hlf+qiYNHQV/9Ub1K6JlxCsLvCFouKb3j4p3Z8di65fwirvAehDeouY8REcRH9MpzLzXgRyqU6K7um/vq54VGZ6wkCxcE7bEY0b3KIWRKftqAbnvI/mux+yh79WrwX2daezQPG0Km+MEtgSqgDcahEWm6iIN8kncDNbe4voUErD7PHxZ0QYJgO2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:27:56 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:27:56 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 15/72] libmultipath: path_discovery: handle libudev errors
Thread-Index: AQHVgUPpR7Z/P6K5y0qSWZA+rQnfJw==
Date: Sat, 12 Oct 2019 21:27:55 +0000
Message-ID: <20191012212703.12989-16-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 63641be2-5064-4beb-d2e0-08d74f5b0bfc
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB33174810A6A7946C34BAEB6FFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:313;
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
x-microsoft-antispam-message-info: G2Tjxn60BWYNwjBk9lZl0BDZFuj7aO7246GTRpOZ3RE65Znynxeq82PSgtRQmPwoHdY5BaMU+6JQ96/gO5pj29OBsStUk8twrYXKD8C2wLGiEn+mRaajJMNaIFTuPmzKm2gKZFWufu06wTCbGGeVpFHAVBBrrkuI5/LZQq2hGYhC/sOBVa1qB9zmIaX8U3XOpcyIUa6CfbVLCACLxSo0oQm1fTSZC9tCjxsI6qzYVbCeWRTehrGDe6J6KcFdstuHOi5dV6w8B0FzrG0/r6UUpuHcU85j3T34X9cvjiD/wIaT38LrSYcH7zc8s231Wt/ge7LakoPLrMY2QZHtRr3iOJPEnXqchPW5wahbMACcYREtjOvNrYypzVOezYsLPiuY5Cy+XCpAbqG1FVCnaWHZObyhUqWRjMI6p9BHwNBJYMY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63641be2-5064-4beb-d2e0-08d74f5b0bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:27:55.9500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fx6ZPMH7zkE+pJGvd/WQZ6M4coaiKxGj5M9V/q+BJTEzh/9V4vSGjGLcWH3VlM4ZRDXzmEMRFfT4QKdkNZhcIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Sat, 12 Oct 2019 21:30:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Sat, 12 Oct 2019 21:30:10 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUB9e006537
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 15/72] libmultipath: path_discovery: handle
	libudev errors
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Sat, 12 Oct 2019 21:31:06 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

pass out if any libudev helpers return an error code.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 72f455e8..e68b0e9f 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -148,15 +148,19 @@ path_discovery (vector pathvec, int flag)
 	struct udev_device *udevice;
 	struct config *conf;
 	const char *devpath;
-	int num_paths = 0, total_paths = 0;
+	int num_paths = 0, total_paths = 0, ret;
 
 	udev_iter = udev_enumerate_new(udev);
 	if (!udev_iter)
 		return -ENOMEM;
 
-	udev_enumerate_add_match_subsystem(udev_iter, "block");
-	udev_enumerate_add_match_is_initialized(udev_iter);
-	udev_enumerate_scan_devices(udev_iter);
+	if (udev_enumerate_add_match_subsystem(udev_iter, "block") < 0 ||
+	    udev_enumerate_add_match_is_initialized(udev_iter) < 0 ||
+	    udev_enumerate_scan_devices(udev_iter) < 0) {
+		condlog(1, "%s: error setting up udev_enumerate: %m", __func__);
+		ret = -1;
+		goto out;
+	}
 
 	udev_list_entry_foreach(entry,
 				udev_enumerate_get_list_entry(udev_iter)) {
@@ -180,9 +184,11 @@ path_discovery (vector pathvec, int flag)
 		}
 		udev_device_unref(udevice);
 	}
+	ret = total_paths - num_paths;
+out:
 	udev_enumerate_unref(udev_iter);
 	condlog(4, "Discovered %d/%d paths", num_paths, total_paths);
-	return (total_paths - num_paths);
+	return ret;
 }
 
 #define declare_sysfs_get_str(fname)					\
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
