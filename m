Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E42DDD52CC
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:34:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46DE418C8923;
	Sat, 12 Oct 2019 21:34:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5505D71C;
	Sat, 12 Oct 2019 21:34:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1B1A4EE6A;
	Sat, 12 Oct 2019 21:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLWEIu007201 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:32:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C64B608A5; Sat, 12 Oct 2019 21:32:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51280614C1;
	Sat, 12 Oct 2019 21:32:12 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A017300D219;
	Sat, 12 Oct 2019 21:32:10 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:31:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:56 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FiCLQminW5r22k13IN/jjr7oCl7dzCymuZIv7eDgajF7boYwn+ea37+ZlLYqD2JiOsNuindXtshvNITbnoDj3a/GrjO9HgedNe2/yYmJxK0ueBkIk+yoFq3ZM3qNGzLdueFDOab4h2wWh7DFUYYUHueW3eZV6DsPA0tCRrKZsnyJlYE9k9bjittI9z6pBBj1/OszECEIGcIHXgOTbDtggdTmr62UZlkvQ3Vuo6JHUIbg12jRw4AIsQ7oLVyz633/G4Bm9YwLVm8GZvyZth3cDpYaYrzQGq2hLM7Gof3jffY0c9fildiz+uVnhro0wKTLmR/9nqfp2B1QWOEcMKpD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=faKryIjIPQ8OlmFrR/l6HS3S+5Z2dcxqIZE8RNBizEk=;
	b=HTMdeyh4DF42paaeQ/PuNvZQ+/vtAvd8nuqYXXuBbQ736nYCtPid5nt7d7tfkbt5D40SRA5d5YMBxr1ON39eZfFeeaMjGZFhb9OR7j8bZNwTdcr9FRlxTKfgnwz03g+Kv/BUujUijEgMjSGYmZGJqAP41ox7/x5nFyZMWRfKGahxdVvLJWITqq0ICH5/6MdUxtsnLha/wS2Fy4TgPTmUDyAZWIaj3p6yRODiiMLb+EYr0VnUp0c4kF23WJTZgZBbNZs1eUkZf72U2NfIKXWu0L3i/SEJTWdaZQD7mbtis8UWWijrkzrUQJqNag8GHMUmh6QBVHcJzQgagX75gX9kjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:52 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 43/72] libmultipath: dev_loss_tmo is unsigned
Thread-Index: AQHVgUP+4Qw4ZbbjPUyr3guZtEcXsQ==
Date: Sat, 12 Oct 2019 21:28:31 +0000
Message-ID: <20191012212703.12989-44-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 31797ed3-00c4-47c3-e2a9-08d74f5b20e4
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317C1C6886D42619238D7BAFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsElujCpPsLo6IHJV9FzBI9ECQ/1TrloEcCp9Bfei5KDYqmrSSj+K3LJFIorDGOI8odcMnTmVn2dCilfup6/BMzXeqjy/cOziRK8+QxuaXGtjdcvdpUeFQbD7TUnOn2oBIcID8VT/n00NpB/s/3STQ+FuIRk80e1cVDbMCiy/RN64Xc6R0FMZQsmW0a7MZxZq2MxnoB/oT5zITYOo4AYLer/561dq1RdtynGfPOpwZWJCTw1zYw5pGMEkFq1uQHKafh+/SJmioO5ENJEB252Jb72eT7ZKNt5DTxA5kUkNZfIUc0FFfkUvb8ULwH9Cet3cD19NtjJrsh4KLbzvBN6ryProboV+sYRDQ2I8BXftOGckM2RHy1oTjafMjk7iXZ+YpM7uUl9rWzfgD+J3YugPtiBSXzxgM/OhJfia3Y07aY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31797ed3-00c4-47c3-e2a9-08d74f5b20e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:31.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKGZinnEWAttXKxjaj9pZtmmUoq69AQehVS1Aq+H3bfnkNLfsaJ/V14OyeW8as65BgWFtPTYQTTpYddmX8HVtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Sat, 12 Oct 2019 21:32:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Sat, 12 Oct 2019 21:32:11 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLWEIu007201
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 43/72] libmultipath: dev_loss_tmo is unsigned
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Sat, 12 Oct 2019 21:34:15 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Make MAX_DEV_LOSS_TMO reflect the fact that the kernel supports
timeouts up to UINT_MAX, and fix comparisons in discovery.c.

Cc: Hannes Reinecke <hare@suse.de>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/defaults.h  |  4 +++-
 libmultipath/discovery.c | 13 ++++++++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 4dfe007c..d7034655 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -1,5 +1,7 @@
 #ifndef _DEFAULTS_H
 #define _DEFAULTS_H
+#include <limits.h>
+
 /*
  * If you add or modify a value also update multipath/multipath.conf.5
  * and the TEMPLATE in libmultipath/hwtable.c
@@ -55,7 +57,7 @@
 #define DEFAULT_CHECKINT	5
 #define MAX_CHECKINT(a)		(a << 2)
 
-#define MAX_DEV_LOSS_TMO	0x7FFFFFFF
+#define MAX_DEV_LOSS_TMO	UINT_MAX
 #define DEFAULT_PIDFILE		"/" RUN_DIR "/multipathd.pid"
 #define DEFAULT_SOCKET		"/org/kernel/linux/storage/multipathd"
 #define DEFAULT_CONFIGFILE	"/etc/multipath.conf"
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 4d93c91b..5fbc2ac7 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -624,9 +624,10 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 	    mpp->fast_io_fail != MP_FAST_IO_FAIL_ZERO &&
 	    mpp->fast_io_fail != MP_FAST_IO_FAIL_OFF) {
 		/* Check if we need to temporarily increase dev_loss_tmo */
-		if (mpp->fast_io_fail >= tmo) {
+		if ((unsigned int)mpp->fast_io_fail >= tmo) {
 			/* Increase dev_loss_tmo temporarily */
-			snprintf(value, 16, "%u", mpp->fast_io_fail + 1);
+			snprintf(value, sizeof(value), "%u",
+				 (unsigned int)mpp->fast_io_fail + 1);
 			ret = sysfs_attr_set_value(rport_dev, "dev_loss_tmo",
 						   value, strlen(value));
 			if (ret <= 0) {
@@ -757,10 +758,11 @@ sysfs_set_scsi_tmo (struct multipath *mpp, int checkint)
 {
 	struct path *pp;
 	int i;
-	int dev_loss_tmo = mpp->dev_loss;
+	unsigned int dev_loss_tmo = mpp->dev_loss;
 
 	if (mpp->no_path_retry > 0) {
-		uint64_t no_path_retry_tmo = (uint64_t)mpp->no_path_retry * checkint;
+		uint64_t no_path_retry_tmo =
+			(uint64_t)mpp->no_path_retry * checkint;
 
 		if (no_path_retry_tmo > MAX_DEV_LOSS_TMO)
 			no_path_retry_tmo = MAX_DEV_LOSS_TMO;
@@ -774,7 +776,8 @@ sysfs_set_scsi_tmo (struct multipath *mpp, int checkint)
 			mpp->alias, dev_loss_tmo);
 	}
 	mpp->dev_loss = dev_loss_tmo;
-	if (mpp->dev_loss && mpp->fast_io_fail >= (int)mpp->dev_loss) {
+	if (mpp->dev_loss && mpp->fast_io_fail > 0 &&
+	    (unsigned int)mpp->fast_io_fail >= mpp->dev_loss) {
 		condlog(3, "%s: turning off fast_io_fail (%d is not smaller than dev_loss_tmo)",
 			mpp->alias, mpp->fast_io_fail);
 		mpp->fast_io_fail = MP_FAST_IO_FAIL_OFF;
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
