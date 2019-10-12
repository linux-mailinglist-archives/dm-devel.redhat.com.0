Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCED52A3
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:30:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A89E3308FEC6;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C91D60A97;
	Sat, 12 Oct 2019 21:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00C2E4A460;
	Sat, 12 Oct 2019 21:30:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLSYfC006092 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:28:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08CB310013D9; Sat, 12 Oct 2019 21:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3EC1001B08;
	Sat, 12 Oct 2019 21:28:33 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BCBB18C8906;
	Sat, 12 Oct 2019 21:28:32 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:27:37 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:11 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZHfsYlKD75S3Accoa2IQ6STZH1qKwXKk5wRHV0DkyQw6KCc4BriOXfsGx9CC0GjxfCf2qdekkS95xRqoas50ScEAKu3mnYX7cyZbvOO2ZxDfdPyUymGwYV67xtUtY3TZeD2fGjhtqVU9yDBCuDV6b8EeMFUGw+HwKQLIlN7+TSB1TiPh7riCzru9KfhJ6bxuMPTeuX40ES+LhILsaN6itGTTKlsGyfECEwrUX4xTSMZN/MxoVhgbQtUESNvVaxusxKQI2CnAUpxeEyEI/Z+bWTBcI+LXGocA8HKme1wZaRjDqL9j/aP24MjgRzvITewto6p4jOeEEdt6qufRU4ELRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XJuN81YgPpgmxjV1++nGPz0ex2akbh1bktDr9lp8QvM=;
	b=dkAP+2Gkw8WSOZUHAimNnaJbWstFn0Ib5cl3s6UGI/fz/kvyGONOyjoF0yebKTgcHJLokjfZm0UZogbfStwy+Kn6Z+9A3g+rN0tKflghuXyf5BjDXwf1KrCqB0sU2hb9WKtRLaNALVklRmMmK9D8XHhGB6SmVUrfMi2MXYUlkzgj97oFQX4Ztpje2zI7I2gHnYtth9Vk0iFBPt+p7tfLDtvq7L8Flz3DJteuwnGkunIv8OomIFiFez+5KReanqfdz7QldPJfGh/TOz1b6+Z8ZtArTi9Fsz4krflL5PpcHfkaSAQ8jOzL6Ir467X++TIExORUxkZ6egXhR0C132FnVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:09 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:09 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 26/72] libmultipath: mark unused params in getprio()
	methods
Thread-Index: AQHVgUPxTgFpS8Kf2UaecSgCqKwm7Q==
Date: Sat, 12 Oct 2019 21:28:09 +0000
Message-ID: <20191012212703.12989-27-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 99443876-04c9-45b0-5a83-08d74f5b1435
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331773680DB7FA939361B21BFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:46;
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
x-microsoft-antispam-message-info: FboqXN5dDBZu+x/2O4B+QoM3CuQTxaEJsL+xqrAxh1THv5dHsI/e6Xm/MFPdi6ZfE8C5QN6riKxANkM5rlhpxvkP5FPc85FsF9RFlDuC7dG838IX9sC1RvdQvt27TTmBT+eAm6Eu1FWybHK1QlPIRHWs7JPG81xzg81hhVSFP6EAG8LmCdq5Srf+tazGyV+O4KCOYTTHdmtOjWZi/B+vHYwkgBAh+2hwAAlz3rhyjnbWkfQJmn8mKn8NlEvjy4rjYCy3AefCQE3JbqbVvFTUUbVWq6UbD5dumUzDWAorh3kqbE/Yu4bCwDNgxYeWquGCoNX5fe6+DEycjLYkmaiAYw1DpS0ZwZj3oyMNlHLoO76QD2egnl+tx6mDljvnnLedkScpHBJZQjgoqAIKPSFcQ2zd6mT1+Zz814MAH8ab75k=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 99443876-04c9-45b0-5a83-08d74f5b1435
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:09.8552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyoqgGdABOHm5JkODbBRQb6ZT0/6NSn/q4mpSh4QH7dhKbwA7L+HrWna5ympUMKYlg5p9lCzDjrwXUzSuDpnQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Sat, 12 Oct 2019 21:28:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Sat, 12 Oct 2019 21:28:33 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLSYfC006092
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 26/72] libmultipath: mark unused params in
	getprio() methods
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 12 Oct 2019 21:30:24 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/prioritizers/ana.c          | 3 ++-
 libmultipath/prioritizers/const.c        | 4 +++-
 libmultipath/prioritizers/datacore.c     | 3 ++-
 libmultipath/prioritizers/emc.c          | 3 ++-
 libmultipath/prioritizers/hds.c          | 3 ++-
 libmultipath/prioritizers/hp_sw.c        | 3 ++-
 libmultipath/prioritizers/iet.c          | 3 ++-
 libmultipath/prioritizers/ontap.c        | 3 ++-
 libmultipath/prioritizers/random.c       | 4 +++-
 libmultipath/prioritizers/rdac.c         | 3 ++-
 libmultipath/prioritizers/sysfs.c        | 3 ++-
 libmultipath/prioritizers/weightedpath.c | 3 ++-
 12 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/libmultipath/prioritizers/ana.c b/libmultipath/prioritizers/ana.c
index bcb1dbf8..9f7adfa5 100644
--- a/libmultipath/prioritizers/ana.c
+++ b/libmultipath/prioritizers/ana.c
@@ -202,7 +202,8 @@ static int get_ana_info(struct path * pp)
  * - ALUA's LBA-dependent state has no ANA equivalent.
  */
 
-int getprio(struct path *pp, char *args, unsigned int timeout)
+int getprio(struct path *pp, __attribute__((unused)) char *args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	int rc;
 
diff --git a/libmultipath/prioritizers/const.c b/libmultipath/prioritizers/const.c
index aad69274..059d8593 100644
--- a/libmultipath/prioritizers/const.c
+++ b/libmultipath/prioritizers/const.c
@@ -2,7 +2,9 @@
 
 #include "prio.h"
 
-int getprio(struct path * pp, char * args, unsigned int timeout)
+int getprio(__attribute__((unused)) struct path * pp,
+	    __attribute__((unused)) char * args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	return 1;
 }
diff --git a/libmultipath/prioritizers/datacore.c b/libmultipath/prioritizers/datacore.c
index 59c98164..02dc2e27 100644
--- a/libmultipath/prioritizers/datacore.c
+++ b/libmultipath/prioritizers/datacore.c
@@ -98,7 +98,8 @@ int datacore_prio (const char *dev, int sg_fd, char * args)
 	return 0;
 }
 
-int getprio(struct path * pp, char * args, unsigned int timeout)
+int getprio(struct path * pp, char * args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	return datacore_prio(pp->dev, pp->fd, args);
 }
diff --git a/libmultipath/prioritizers/emc.c b/libmultipath/prioritizers/emc.c
index a2f74875..3b63cca0 100644
--- a/libmultipath/prioritizers/emc.c
+++ b/libmultipath/prioritizers/emc.c
@@ -81,7 +81,8 @@ out:
 	return(ret);
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path *pp, __attribute__((unused)) char *args,
+	     unsigned int timeout)
 {
 	return emc_clariion_prio(pp->dev, pp->fd, timeout);
 }
diff --git a/libmultipath/prioritizers/hds.c b/libmultipath/prioritizers/hds.c
index 70fb5d19..88cac5f0 100644
--- a/libmultipath/prioritizers/hds.c
+++ b/libmultipath/prioritizers/hds.c
@@ -168,7 +168,8 @@ int hds_modular_prio (const char *dev, int fd, unsigned int timeout)
 	return -1;
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path * pp, __attribute__((unused)) char *args,
+	     unsigned int timeout)
 {
 	return hds_modular_prio(pp->dev, pp->fd, timeout);
 }
diff --git a/libmultipath/prioritizers/hp_sw.c b/libmultipath/prioritizers/hp_sw.c
index 6b0ed398..5b85ad2e 100644
--- a/libmultipath/prioritizers/hp_sw.c
+++ b/libmultipath/prioritizers/hp_sw.c
@@ -95,7 +95,8 @@ out:
 	return(ret);
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path *pp, __attribute__((unused)) char *args,
+	     unsigned int timeout)
 {
 	return hp_sw_prio(pp->dev, pp->fd, timeout);
 }
diff --git a/libmultipath/prioritizers/iet.c b/libmultipath/prioritizers/iet.c
index a4ea61ef..e98773cf 100644
--- a/libmultipath/prioritizers/iet.c
+++ b/libmultipath/prioritizers/iet.c
@@ -138,7 +138,8 @@ int iet_prio(const char *dev, char * args)
 	return 10;
 }
 
-int getprio(struct path * pp, char * args, unsigned int timeout)
+int getprio(struct path * pp, char * args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	return iet_prio(pp->dev, args);
 }
diff --git a/libmultipath/prioritizers/ontap.c b/libmultipath/prioritizers/ontap.c
index 6505033f..262e69d2 100644
--- a/libmultipath/prioritizers/ontap.c
+++ b/libmultipath/prioritizers/ontap.c
@@ -241,7 +241,8 @@ prio_select:
 	}
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path *pp, __attribute__((unused)) char *args,
+	     unsigned int timeout)
 {
 	return ontap_prio(pp->dev, pp->fd, timeout);
 }
diff --git a/libmultipath/prioritizers/random.c b/libmultipath/prioritizers/random.c
index 4a27123b..b742ac23 100644
--- a/libmultipath/prioritizers/random.c
+++ b/libmultipath/prioritizers/random.c
@@ -5,7 +5,9 @@
 
 #include "prio.h"
 
-int getprio(struct path * pp, char * args, unsigned int timeout)
+int getprio(__attribute__((unused)) struct path *pp,
+	    __attribute__((unused)) char *args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	struct timeval tv;
 
diff --git a/libmultipath/prioritizers/rdac.c b/libmultipath/prioritizers/rdac.c
index f5df0321..92a2fb85 100644
--- a/libmultipath/prioritizers/rdac.c
+++ b/libmultipath/prioritizers/rdac.c
@@ -91,7 +91,8 @@ out:
 	return(ret);
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path *pp, __attribute__((unused)) char *args,
+	     unsigned int timeout)
 {
 	return rdac_prio(pp->dev, pp->fd, timeout);
 }
diff --git a/libmultipath/prioritizers/sysfs.c b/libmultipath/prioritizers/sysfs.c
index ff567df7..a6feb421 100644
--- a/libmultipath/prioritizers/sysfs.c
+++ b/libmultipath/prioritizers/sysfs.c
@@ -36,7 +36,8 @@ int get_exclusive_pref_arg(char *args)
 	return 1;
 }
 
-int getprio (struct path * pp, char * args, unsigned int timeout)
+int getprio (struct path * pp, char *args,
+	     __attribute__((unused)) unsigned int timeout)
 {
 	int prio = 0, rc, i;
 	char buff[512];
diff --git a/libmultipath/prioritizers/weightedpath.c b/libmultipath/prioritizers/weightedpath.c
index e0f3efbb..916970df 100644
--- a/libmultipath/prioritizers/weightedpath.c
+++ b/libmultipath/prioritizers/weightedpath.c
@@ -143,7 +143,8 @@ int prio_path_weight(struct path *pp, char *prio_args)
 	return priority;
 }
 
-int getprio(struct path *pp, char *args, unsigned int timeout)
+int getprio(struct path *pp, char *args,
+	    __attribute__((unused)) unsigned int timeout)
 {
 	return prio_path_weight(pp, args);
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
