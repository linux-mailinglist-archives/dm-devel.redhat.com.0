Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A05D81F
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jul 2019 00:43:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 397CAC04959E;
	Tue,  2 Jul 2019 22:43:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A696A5C57D;
	Tue,  2 Jul 2019 22:43:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8AC954D3D;
	Tue,  2 Jul 2019 22:43:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62Mh0iw028557 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 18:43:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A13C217AE2; Tue,  2 Jul 2019 22:43:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7332A5D9D6;
	Tue,  2 Jul 2019 22:42:58 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3EC661980;
	Tue,  2 Jul 2019 22:42:41 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  2 Jul 2019 22:42:47 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 2 Jul 2019 22:09:44 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 22:09:44 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3142.namprd18.prod.outlook.com (52.132.244.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2032.18; Tue, 2 Jul 2019 22:09:43 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::44b3:339c:b96c:69b]) by CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::44b3:339c:b96c:69b%7]) with mapi id 15.20.2032.019;
	Tue, 2 Jul 2019 22:09:43 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH] libmultipath: trigger uevents for partitions, too
Thread-Index: AQHVMSLZuFJeQHtoO0KhRTWKvQOS0g==
Date: Tue, 2 Jul 2019 22:09:42 +0000
Message-ID: <20190702220911.16157-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P191CA0086.EURP191.PROD.OUTLOOK.COM
	(2603:10a6:209:8a::27) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:2c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [88.78.145.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d927b0e6-f8b5-477c-1a0b-08d6ff39fb6c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3142; 
x-ms-traffictypediagnostic: CH2PR18MB3142:
x-microsoft-antispam-prvs: <CH2PR18MB31427698797F2046505BB4D2FCF80@CH2PR18MB3142.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(81156014)(81166006)(478600001)(2906002)(102836004)(72206003)(107886003)(52116002)(53936002)(316002)(6436002)(54906003)(36756003)(110136005)(6116002)(305945005)(3846002)(5660300002)(68736007)(99286004)(26005)(25786009)(14454004)(4326008)(66556008)(186003)(66066001)(86362001)(50226002)(2616005)(476003)(8936002)(64756008)(66446008)(44832011)(256004)(14444005)(486006)(6512007)(6506007)(386003)(71200400001)(1076003)(8676002)(71190400001)(7736002)(6486002)(66946007)(73956011)(66476007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3142;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnA780YDErwLlJjuFReIZRNV4ysi9lkuIG/hZKm+KTyOdpsU3uJzIf1t4ZdgfDVksGIJrkqyQHGx2hkl1/5r7FLTRjh8cCRKw1q1MH1jJUAn3cx9X7EsI6AK0aUBurhYC/BDI3t+LuyidrmEwiNESSspNYz+UAzpYb/ypVvyo5lucO7oja66SRSl5HJgXUyOZulVGZAN9oDraFgcj+M6dXjzYPOibtUGszc/9PgF+aatiC5eJVQMIaNRLW2g7acCutW42XaRqzX4oQJV7WUi4r1GZFH982C4ILMqypTPO9O52oSp2xAooTRkoNBMZpofE2wEwLHTwEJkg+LJVjBydu1l8Bc9f7WxUJ7EFDapcE0oTLDfA34xGxRZvAF1JCpzYqIOUZzjSTkjsLkXexxwAHYoKUjbh5yBPeZUXUrHw2M=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d927b0e6-f8b5-477c-1a0b-08d6ff39fb6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 22:09:43.1549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3142
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 02 Jul 2019 22:42:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 02 Jul 2019 22:42:54 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x62Mh0iw028557
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: trigger uevents for partitions, too
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 22:43:18 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

We have added code to re-trigger uevents in various cases where
the status of a device changes from multipath to non-multipath,
or vice-versa. When multipathd triggers uevents for paths of a map
because the status of the map has changed, it needs to trigger
events for the partitions of the path devices, too. The kernel
doesn't do this automatically.

Fixes: c5023200 libmultipath: indicate wwid failure in dm_addmap_create()
Fixes: e5d3c3a0 libmultipath: trigger change uevent on new device creation
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index af4d78de..9f100008 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -519,6 +519,42 @@ trigger_udev_change(const struct multipath *mpp)
 	udev_device_unref(udd);
 }
 
+static void trigger_partitions_udev_change(struct udev_device *dev,
+					   const char *action, int len)
+{
+	struct udev_enumerate *part_enum;
+	struct udev_list_entry *item;
+
+	part_enum = udev_enumerate_new(udev);
+	if (!part_enum)
+		return;
+
+	if (udev_enumerate_add_match_parent(part_enum, dev) < 0 ||
+	    udev_enumerate_add_match_subsystem(part_enum, "block") < 0 ||
+	    udev_enumerate_scan_devices(part_enum) < 0)
+		goto unref;
+
+	udev_list_entry_foreach(item,
+				udev_enumerate_get_list_entry(part_enum)) {
+		const char *syspath;
+		struct udev_device *part;
+
+		syspath = udev_list_entry_get_name(item);
+		part = udev_device_new_from_syspath(udev, syspath);
+		if (!part)
+			continue;
+
+		if (!strcmp("partition", udev_device_get_devtype(part))) {
+			condlog(4, "%s: triggering %s event for %s", __func__,
+				action, syspath);
+			sysfs_attr_set_value(part, "uevent", action, len);
+		}
+		udev_device_unref(part);
+	}
+unref:
+	udev_enumerate_unref(part_enum);
+}
+
 void
 trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
 {
@@ -569,6 +605,8 @@ trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
 				action, pp->dev, is_mpath ? "" : "no ");
 			sysfs_attr_set_value(pp->udev, "uevent",
 					     action, strlen(action));
+			trigger_partitions_udev_change(pp->udev, action,
+						       strlen(action));
 		}
 	}
 
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
