Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 92324D52BC
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:32:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D51A6309BF1C;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE5735D772;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BD4A1803518;
	Sat, 12 Oct 2019 21:32:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUVOA006689 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98EC65C22F; Sat, 12 Oct 2019 21:30:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FB955C223;
	Sat, 12 Oct 2019 21:30:31 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17365C049E12;
	Sat, 12 Oct 2019 21:30:30 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:29:01 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eAn4v4IIC5QBHjLRL3NmFg77+1+7fl0Np2gEYfCLyA8pNVG5TSnUEhu+8rUJhMS7BgUNXeWNt5z1OA8lA6gWRkE/36yRn4aQFQFxtx19w3AltPUrfKbkhuzOstgup7I+p3mM65x/lJRNjyOuDNc8TZhKI93IwLyiP70lvgE+TQAXlyFCTOdavbMAOZUZhzWdvxWmwEPZ/WDczd5z2YMdkULZ46aqAE0bFvauwYtv1uS5ZKkXYc2pKyexN55U+gRHbCLywibtVKBQs8NsKpVNl81M4wy2VcM+R1KxIEA3esHziHMpL616n9HWGM0BzUI06qdkOVgigSudq5ONxrABuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I0sTLvrqsXPdlOifkXLxCW+ekI7YZ/5qZE3oTGnKQAM=;
	b=Dc3vIeANMnXGylPz41mcjHnZ/DTW4/6t/iW6AQpDhS08p/185IdVX/cRQ9YwzR1GOj1fLcvoFigbESgQ6vaF4BaRdUAS+NVmBmWj/EvwoKXlZh1MUPdnCFWSX4LZuTUMpvbIjZ+S7bVG6Hz22ZCsKj1pAo1Jdo0l+YTgjnmYF6kvo7rgVEDwKUjKvBtAOEZ5nb758MzIIZNkPjQA9E6lNhf2GezHQu+Ts44bIM/kQgBNOHKSCViWmrQV72hfVjGH6ue+2q/mg589D0nSTm3HahJh+yoGNwaS0yG2JX8HhFHsTCcXIQu9rX1qL2vAZwAT/9VkRssgYfSfL57jVasbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:58 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:58 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 56/72] kpartx: use unsigned arguments in dm_devn() and
	dm_prereq()
Thread-Index: AQHVgUQHj6XK5cW6JEuzyaULOf8Hcw==
Date: Sat, 12 Oct 2019 21:28:46 +0000
Message-ID: <20191012212703.12989-57-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: a419ac1d-ecb8-420b-3a01-08d74f5b2a1e
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3317B4A2F8B43DE782882DEEFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
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
x-microsoft-antispam-message-info: O/SZKY3//Ls0nOIRcdLD8I4OrDRFNJaVGe24pOW6i3xHqMiUnVyA4zUVTKA/B/aAiLGpEK5s3S0KkOJP7X6RkYV4iHsjxGoiD4yf0uSs2RvLIdSE0FsHgp7rRrLDDOk9hsU3SUKQggp101LCUxOyhQvAAqQRnb+xfCRFFfSeDdd2NaTY+YahCPGuPxQwk7g1PDf4XRb77zGoAtOTxVZnW8DRsRKWvLK9+ifh0ASlZDSgH/O3PvVEx7ZvhskLgJehN4oSFc1c9hjOIu7nysubNGXYosIEHJHKpbYXH4/4mHvV221nlj2rUpta3A/fLEHtTTOsi1hCLLISXgMZ6ir4f/LmipM9aZGoGPCvGnK3zoevjXUKfMuPZf65F2vwz7tFbEoQKnyxG7oiNgXmfXuRAdyyv3kDUp3FClcLOCTuuuU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a419ac1d-ecb8-420b-3a01-08d74f5b2a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:46.6694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zA5P9fyCL14aHseRhQQMgKdZ5+joXpAbtC6NuxD+EKY+4nUyx+HwhFpxEDnpkgWAMkPMhVf5rS16m7opDpG00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sat, 12 Oct 2019 21:30:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sat, 12 Oct 2019 21:30:31 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUVOA006689
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 56/72] kpartx: use unsigned arguments in
 dm_devn() and dm_prereq()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 12 Oct 2019 21:32:29 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

In both cases, the corresponding libdevmapper values are unsigned.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/devmapper.c | 10 +++++-----
 kpartx/devmapper.h |  7 ++++---
 kpartx/kpartx.h    |  7 ++++---
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/kpartx/devmapper.c b/kpartx/devmapper.c
index 7e599e07..9a3dd5f8 100644
--- a/kpartx/devmapper.c
+++ b/kpartx/devmapper.c
@@ -17,7 +17,7 @@
 #define MAX_PREFIX_LEN (_UUID_PREFIX_LEN + 4)
 #define PARAMS_SIZE 1024
 
-int dm_prereq(char * str, int x, int y, int z)
+int dm_prereq(char * str, uint32_t x, uint32_t y, uint32_t z)
 {
 	int r = 1;
 	struct dm_task *dmt;
@@ -359,7 +359,7 @@ out:
 }
 
 int
-dm_devn (const char * mapname, int *major, int *minor)
+dm_devn (const char * mapname, unsigned int *major, unsigned int *minor)
 {
 	int r = 1;
 	struct dm_task *dmt;
@@ -528,7 +528,7 @@ do_foreach_partmaps (const char * mapname, const char *uuid,
 	struct remove_data *rd = data;
 	unsigned next = 0;
 	char params[PARAMS_SIZE];
-	int major, minor;
+	unsigned int major, minor;
 	char dev_t[32];
 	int r = 1;
 	int is_dmdev = 1;
@@ -645,7 +645,7 @@ int dm_find_part(const char *parent, const char *delim, int part,
 	char params[PARAMS_SIZE];
 	char *tmp;
 	char *uuid;
-	int major, minor;
+	unsigned int major, minor;
 	char dev_t[32];
 
 	if (!format_partname(name, namesiz, parent, delim, part)) {
@@ -715,7 +715,7 @@ char *nondm_create_uuid(dev_t devt)
 	return uuid_buf;
 }
 
-int nondm_parse_uuid(const char *uuid, int *major, int *minor)
+int nondm_parse_uuid(const char *uuid, unsigned int *major, unsigned int *minor)
 {
 	const char *p;
 	char *e;
diff --git a/kpartx/devmapper.h b/kpartx/devmapper.h
index 73b80f2f..701bdf6e 100644
--- a/kpartx/devmapper.h
+++ b/kpartx/devmapper.h
@@ -9,14 +9,14 @@
 
 extern int udev_sync;
 
-int dm_prereq (char *, int, int, int);
+int dm_prereq (char *, uint32_t, uint32_t, uint32_t);
 int dm_simplecmd (int, const char *, int, uint16_t);
 int dm_addmap (int, const char *, const char *, const char *, uint64_t,
 	       int, const char *, int, mode_t, uid_t, gid_t);
 char * dm_mapname(int major, int minor);
 dev_t dm_get_first_dep(char *devname);
 char * dm_mapuuid(const char *mapname);
-int dm_devn (const char * mapname, int *major, int *minor);
+int dm_devn (const char * mapname, unsigned int *major, unsigned int *minor);
 int dm_remove_partmaps (char * mapname, char *uuid, dev_t devt, int verbose);
 int dm_find_part(const char *parent, const char *delim, int part,
 		 const char *parent_uuid,
@@ -34,5 +34,6 @@ int dm_find_part(const char *parent, const char *delim, int part,
 #define NONDM_UUID_PREFIX "devnode"
 #define NONDM_UUID_SUFFIX "Wh5pYvM"
 char *nondm_create_uuid(dev_t devt);
-int nondm_parse_uuid(const char *uuid, int *major, int *minor);
+int nondm_parse_uuid(const char *uuid,
+		     unsigned int *major, unsigned int *minor);
 #endif /* _KPARTX_DEVMAPPER_H */
diff --git a/kpartx/kpartx.h b/kpartx/kpartx.h
index 3ec13dbc..015dcab4 100644
--- a/kpartx/kpartx.h
+++ b/kpartx/kpartx.h
@@ -33,11 +33,12 @@ struct slice {
 	uint64_t start;
 	uint64_t size;
 	int container;
-	int major;
-	int minor;
+	unsigned int major;
+	unsigned int minor;
 };
 
-typedef int (ptreader)(int fd, struct slice all, struct slice *sp, int ns);
+typedef int (ptreader)(int fd, struct slice all, struct slice *sp,
+		       int ns);
 
 extern int force_gpt;
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
