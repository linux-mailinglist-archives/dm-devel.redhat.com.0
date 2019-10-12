Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA07D52AE
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 541AC316E533;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2417F60C5E;
	Sat, 12 Oct 2019 21:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9348E4E58A;
	Sat, 12 Oct 2019 21:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUJFU006584 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93B9AF6E1; Sat, 12 Oct 2019 21:30:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 871E519C70;
	Sat, 12 Oct 2019 21:30:19 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D3D9300BEAB;
	Sat, 12 Oct 2019 21:30:18 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:34 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:59 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=UDTbWyB5TpzhlwF08tfDaCYuuUoWKJdOQqs9t6lRg+S6v5z3ffA8Y1ySha3Nc19aOIG+oqV6+vgl4NUujf+w7njmfDMaHAl7kW6roF428p41tH361ZupIHaGBVBjZd5IOxx/j8R01H64QzyNPEtoHX/0bPbvcIO1TiSoLNuhNwroekOUicZtiPkHBus+KRyj81xDrcGEv9y8l/Nz9aJDE6Et9JVnHHzIRAXm7UrQ+Tmv8qW7noir1tgBGk9vfoyVNqtHpyc3kfgBLPJof+aQ4+XGw9H9XX/IxoEK4K3mN5aW66dmeS6B1tT3m298OFMJYm58ggedyVMqwiapVS4XbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rgjc6dqCf4sVCU93dqnP3WjIfoVCatAZI2Xp158RssU=;
	b=QqmZUi9/P0JaGtptRyfF4AI4mAKGxknYbPRnmv8jul8SOjX39UmEw7I9WT8h7Kmfy2WQs9rYSurv2SGjDy2z0EwKpZB9JVglVQczZGcUdVaqGwiTKU0kpD7xmROhSg4wDwdUldGRLCzVjMHaR14v2oRqlpjNkmHyx2t+I6NPaY86SdxwsNPvK2u0sFfU7HwVIyEvxk5EkzO7H9jZGEXABDECmcBXmcvyfTrSaIutaFFGCSk3M+flKJVPVmW45kq8kfK9iAtTlaiQmoWvrhCR43XpdOgNs4+0cqmwBsky1WQPnbrC6Bu6zUKNJNxVGAGhHJVhaF4Kn0S/tF22S7UGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:56 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:56 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 51/72] libmultipath: make "checkint" unsigned
Thread-Index: AQHVgUQEn/EfbojPIEGiRqSOTky+KQ==
Date: Sat, 12 Oct 2019 21:28:40 +0000
Message-ID: <20191012212703.12989-52-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 760750c7-7d50-433c-cb67-08d74f5b267d
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331728E648836D3970F40E2DFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:36;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(6666004)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOttwWlbfbftTACY7/ovWNCZurEu8rZuaGLYQzQ/B9SGPqL5SR/HuJZ7yWiGQpDqGT+WbBG4TX/k9KamrBbMJsFjdUb4lfesUAUkklMyrvliQ5rYYPZJqdBHIVsbgbUtKhSt6vKDHaS1skJ3htErLOdc3v5Gy9tA4z7Og+25m7yxDykKfTUtmvHUDMYWnoV3cXh7nZRfGAPpBoBB8EgObIPdI1rsbNbmnrx5QFC1zgwDDpquPyKJqGGwGvzS15ktT7fte0CSdaOiVe21gjr39jpU4Y5N0jyBbwxRG1JvgTypvjE8Iexvq2goOzHvjW/mzY8Awr/popYnuNw62RE/+5uhqExFR95PAxjLwnLElhObwK7jrQ4KsKBWGbdTICS/zsSRPpjMQPrRRonjXOyClUctf9lJ/9cuDogJ7LfSFpU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 760750c7-7d50-433c-cb67-08d74f5b267d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:40.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvP87pZi/QoRA7PqCSJa/gwPC7J9RQnNCp2sgAuE1q+2YEjF22t1cOUaRe73vjan6QuA9ODBdM/45sJLDR9EhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Sat, 12 Oct 2019 21:30:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 12 Oct 2019 21:30:18 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUJFU006584
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 51/72] libmultipath: make "checkint" unsigned
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 12 Oct 2019 21:31:26 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

path->checkint was unsigned already, now use this type everywhere.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.h      |  4 ++--
 libmultipath/dict.c        |  4 ++--
 libmultipath/discovery.c   |  2 +-
 libmultipath/discovery.h   |  2 +-
 libmultipath/io_err_stat.c |  2 +-
 libmultipath/structs_vec.c |  2 +-
 multipathd/main.c          | 10 ++++++----
 7 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index ffec3103..2ab7b42c 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -137,8 +137,8 @@ struct config {
 	int pgpolicy;
 	int minio;
 	int minio_rq;
-	int checkint;
-	int max_checkint;
+	unsigned int checkint;
+	unsigned int max_checkint;
 	int pgfailback;
 	int remove;
 	int rr_weight;
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index c23d525b..a90690fa 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -314,7 +314,7 @@ snprint_mp_ ## option (struct config *conf, char * buff, int len,	\
 
 static int checkint_handler(struct config *conf, vector strvec)
 {
-	int rc = set_int(strvec, &conf->checkint);
+	int rc = set_uint(strvec, &conf->checkint);
 
 	if (rc)
 		return rc;
@@ -325,7 +325,7 @@ static int checkint_handler(struct config *conf, vector strvec)
 
 declare_def_snprint(checkint, print_int)
 
-declare_def_handler(max_checkint, set_int)
+declare_def_handler(max_checkint, set_uint)
 declare_def_snprint(max_checkint, print_int)
 
 declare_def_handler(verbosity, set_int)
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 6288c3e0..4288c9fd 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -754,7 +754,7 @@ sysfs_set_nexus_loss_tmo(struct multipath *mpp, struct path *pp)
 }
 
 int
-sysfs_set_scsi_tmo (struct multipath *mpp, int checkint)
+sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 {
 	struct path *pp;
 	int i;
diff --git a/libmultipath/discovery.h b/libmultipath/discovery.h
index 8d04c2af..0516e41b 100644
--- a/libmultipath/discovery.h
+++ b/libmultipath/discovery.h
@@ -42,7 +42,7 @@ int alloc_path_with_pathinfo (struct config *conf, struct udev_device *udevice,
 int store_pathinfo (vector pathvec, struct config *conf,
 		    struct udev_device *udevice, int flag,
 		    struct path **pp_ptr);
-int sysfs_set_scsi_tmo (struct multipath *mpp, int checkint);
+int sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint);
 int sysfs_get_timeout(const struct path *pp, unsigned int *timeout);
 int sysfs_get_host_pci_name(const struct path *pp, char *pci_name);
 int sysfs_get_iscsi_ip_address(const struct path *pp, char *ip_address);
diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 6b3a3e19..d7e296fa 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -357,7 +357,7 @@ int io_err_stat_handle_pathfail(struct path *path)
 		if (path->state != PATH_DOWN) {
 			struct config *conf;
 			int oldstate = path->state;
-			int checkint;
+			unsigned int checkint;
 
 			conf = get_multipath_config();
 			checkint = conf->checkint;
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index c43b58fb..6991f9ac 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -292,7 +292,7 @@ update_multipath_strings(struct multipath *mpp, vector pathvec, int is_daemon)
 
 void enter_recovery_mode(struct multipath *mpp)
 {
-	int checkint;
+	unsigned int checkint;
 	struct config *conf = get_multipath_config();
 	checkint = conf->checkint;
 	put_multipath_config(conf);
diff --git a/multipathd/main.c b/multipathd/main.c
index 26d5aa9c..bb5c1f1d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -493,7 +493,7 @@ int update_multipath (struct vectors *vecs, char *mapname, int reset)
 			if (pp->state != PATH_DOWN) {
 				struct config *conf;
 				int oldstate = pp->state;
-				int checkint;
+				unsigned int checkint;
 
 				conf = get_multipath_config();
 				checkint = conf->checkint;
@@ -1985,7 +1985,7 @@ should_skip_path(struct path *pp){
  * and '0' otherwise
  */
 int
-check_path (struct vectors * vecs, struct path * pp, int ticks)
+check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 {
 	int newstate;
 	int new_path_up = 0;
@@ -1993,7 +1993,8 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 	int add_active;
 	int disable_reinstate = 0;
 	int oldchkrstate = pp->chkrstate;
-	int retrigger_tries, checkint, max_checkint, verbosity;
+	int retrigger_tries, verbosity;
+	unsigned int checkint, max_checkint;
 	struct config *conf;
 	int marginal_pathgroups, marginal_changed = 0;
 	int ret;
@@ -2333,7 +2334,8 @@ checkerloop (void *ap)
 
 	while (1) {
 		struct timespec diff_time, start_time, end_time;
-		int num_paths = 0, ticks = 0, strict_timing, rc = 0;
+		int num_paths = 0, strict_timing, rc = 0;
+		unsigned int ticks = 0;
 
 		get_monotonic_time(&start_time);
 		if (start_time.tv_sec && last_time.tv_sec) {
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
