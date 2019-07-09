Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E576324F
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 09:45:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CFC3C05B1CA;
	Tue,  9 Jul 2019 07:43:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C4281840A;
	Tue,  9 Jul 2019 07:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEF5418184A5;
	Tue,  9 Jul 2019 07:42:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x697fctZ030789 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 03:41:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A2241001B02; Tue,  9 Jul 2019 07:41:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8411001281;
	Tue,  9 Jul 2019 07:41:35 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8A83C0586C4;
	Tue,  9 Jul 2019 07:40:58 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  9 Jul 2019 07:40:54 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 9 Jul 2019 07:40:06 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 07:40:06 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.246.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Tue, 9 Jul 2019 07:40:05 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Tue, 9 Jul 2019 07:40:05 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 4/4] libmultipath: trigger uevents for partitions, too
Thread-Index: AQHVNimGkr+11WhtHUKMLNds+BG+ow==
Date: Tue, 9 Jul 2019 07:40:05 +0000
Message-ID: <20190709073909.32112-5-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: de6b46ee-f88e-4ada-674c-08d70440a8a3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3319; 
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-microsoft-antispam-prvs: <CH2PR18MB3319BA707D14C6A4CA450D47FCF10@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(386003)(14444005)(52116002)(6506007)(6512007)(107886003)(110136005)(81166006)(81156014)(478600001)(54906003)(8936002)(26005)(2616005)(256004)(6436002)(4326008)(72206003)(6486002)(316002)(76176011)(102836004)(5660300002)(36756003)(44832011)(66556008)(66476007)(73956011)(1076003)(66446008)(7736002)(305945005)(6116002)(3846002)(486006)(68736007)(14454004)(86362001)(66066001)(99286004)(66946007)(64756008)(71190400001)(71200400001)(476003)(53936002)(186003)(11346002)(2906002)(8676002)(50226002)(25786009)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IboujvqO014OIbKRDmGHZd6S4nRqmdT/e6sx9aF68NRRz/3Sg+bPJOyOsKvM+Thwy5yyruxxhOznczQfeIrcSKmboSDkkpffw9pZqDGwsUTXsye0fsnamULbaXzDQ6qre3vZWsNg3pW/iS0mum3C4dZZIIXtY2ei9BHIQ3GKzsMgXcMSdVtz4eKBgkaG0IDDTJcUvizrytmnep0QYV4Qb8XpsdJxmlBnIUax4U4XXWyRUabZBJ0MeN/77rhRqU4ciKAw2OnNtIsg0rwIVOvXkwuaT4FrIZ7c1KoY17liBj+uXAObgD+iz3x7aSnjpvS4G10dAuE49k6+lUdj+rGkZdC54LdSj6bbkufkCCauOnQhCZk+vIQRV1RP4FqwsTk//w1lk81MDfzX1W8EI8iI2xO8PWkuZDS8A6UfukZCX7g=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de6b46ee-f88e-4ada-674c-08d70440a8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 07:40:05.1242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 09 Jul 2019 07:41:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 09 Jul 2019 07:41:23 +0000 (UTC) for IP:'15.124.2.86'
	DOMAIN:'m4a0040g.houston.softwaregrp.com'
	HELO:'m4a0040g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.86
	m4a0040g.houston.softwaregrp.com 15.124.2.86
	m4a0040g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x697fctZ030789
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for partitions,
	too
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 09 Jul 2019 07:45:07 +0000 (UTC)

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
index b09ef529..4cdf1363 100644
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
