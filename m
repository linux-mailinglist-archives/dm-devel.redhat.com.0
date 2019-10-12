Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 12905D52B3
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 23:31:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0069910CC1F1;
	Sat, 12 Oct 2019 21:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4E55DA5B;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57A161803517;
	Sat, 12 Oct 2019 21:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CLUJJb006585 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 17:30:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95EEE60A97; Sat, 12 Oct 2019 21:30:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD70608C2;
	Sat, 12 Oct 2019 21:30:19 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03558308C21D;
	Sat, 12 Oct 2019 21:30:18 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Sat, 12 Oct 2019 21:29:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Sat, 12 Oct 2019 21:28:08 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Sat, 12 Oct 2019 21:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eyXzr1KDdxoqFxCxib24SmWAHtcidswVSLMHTUPmdgkdkDPhmLyoXAAIaO99qAZ5kI74S6kF58928tvC8t+iQVWE6Ehw5vfIiP5fHkn12DI8G6ElfX34I+XBFGqSJI5KpcC/zV640VtnD2PguJrwoFxCa3DsErNLHyikuVJWfqa7C9llyOLcvo5QHtUG8UYxfz1x7zYyFPG34FS7BPrRnbiJwdRqeeMYTBvO92bMZLdUp3P1668xeUh0KdAMreehtt5FsVRD99BfcDxUWq53I7aKxPuu2dmKbBVyIGU/MwxvyE/st3Ua9/O1HqRpk6lLFUDCT7heZz02KhJStU1J8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gZPbyZAMlyXz6JZVzRh+O91rX+gCngSjk/Aw5q5iJBY=;
	b=PLxNT/R1kPhxm19IA7N/+DyTC5waZtzlh4ceudkZa/nbVGBgWkmTn1AQQkTB5jzpYBig/0y0WXzVH6bHFVb4QpQzqLXxTOKCQg2hQoGxQ8Jlh4LTsVoEny5Gn00gDZLZ+SfZnvyUW1p9zrBOjYXFD15NbBmrVSxzxqcWZpOmPeZhuikSPUqhWnn7oFtzvGf9P23jDIF9HnfFlhv0LY83/czQs/oCDwZDaSo/nDWAm5MiiL/ecIwqy9NQsF15C6a1Ab0vNMe9GWxB+5tpiIuL0jdDdKISbvdFszvVIE5Jn70zkD1vuKsPlL5+YcdXfB7IFtGJIoW9QUX2T6oyPenL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3317.namprd18.prod.outlook.com (52.132.245.210) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.17; Sat, 12 Oct 2019 21:28:07 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.021;
	Sat, 12 Oct 2019 21:28:07 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 24/72] multipath-tools: mark unused params in signal and
	cleanup handlers
Thread-Index: AQHVgUPwO6+Sup1NoU+rWOMaFFGDWQ==
Date: Sat, 12 Oct 2019 21:28:07 +0000
Message-ID: <20191012212703.12989-25-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: a1d2b9ba-8027-4c6b-e4a7-08d74f5b12bd
x-ms-traffictypediagnostic: CH2PR18MB3317:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB331736D721D1DD7B68B62CAFFC960@CH2PR18MB3317.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0188D66E61
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(1496009)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(446003)(6512007)(11346002)(4326008)(8676002)(476003)(81156014)(71200400001)(71190400001)(99286004)(14454004)(8936002)(66066001)(107886003)(2616005)(486006)(81166006)(54906003)(256004)(14444005)(86362001)(110136005)(44832011)(50226002)(25786009)(316002)(6436002)(478600001)(26005)(102836004)(386003)(6506007)(5660300002)(1076003)(52116002)(305945005)(36756003)(2906002)(6116002)(76176011)(66446008)(6486002)(7736002)(66946007)(64756008)(66556008)(186003)(66476007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3317;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ckrd1xoG0pPoTmrt2kjc2V0UJHE5gT6kriXInNhPKLPq334c2HIzJm5Gs2/GvrthVhR03eYwS8CMASE4GOv6sEI3K896iTEfkFHy8jT5bGN62gULEH7NBSUgBqRMydVATChndFbs5ZL/FRZaE7sDoG4vqjY+koPtiPnDwK18BYuUPdPbRsUW7/p+7+8CLglCvaVWvH3kyZhEIptV1NblZ+Gpg8vbL1Z6WMexmJFhn/LF/GSZwsZa4iTK8dRfkDJGkkUjM/Jsxl1YicOlYJxwQYZpUvDxKjElmy4RpUhYErCHGTfXRrrQRh6oBz6W5WtDC99ivOj5oQjfnVOtnCxvbeKET14ulouSGUXKgHiF03svMt81f/nV+SzhuDCb3cjm+Si38hBUiwhgMWKFkESc4x0rt0Ag/h3es0R2lb+jQEQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d2b9ba-8027-4c6b-e4a7-08d74f5b12bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2019 21:28:07.2706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdvbZL+0UEcchdrsLwPVi8mNSjy/wW48rpwCtYJ4eXi5Dkab7KVbW8kSjX6VnG1/jg+ioSKw026ClD1omX9Rdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3317
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Sat, 12 Oct 2019 21:30:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sat, 12 Oct 2019 21:30:18 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9CLUJJb006585
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 24/72] multipath-tools: mark unused params in
 signal and cleanup handlers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Sat, 12 Oct 2019 21:31:47 +0000 (UTC)

From: Martin Wilck <mwilck@suse.com>

These parameters are all rightfully unused, yet need to be declared
because of the function prototypes.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/file.c        |  2 +-
 libmultipath/foreign.c     |  2 +-
 libmultipath/io_err_stat.c |  4 ++--
 mpathpersist/main.c        |  2 +-
 multipath/main.c           |  2 +-
 multipathd/dmevents.c      |  4 ++--
 multipathd/main.c          | 14 +++++++-------
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/libmultipath/file.c b/libmultipath/file.c
index 8727f160..5cb06e1f 100644
--- a/libmultipath/file.c
+++ b/libmultipath/file.c
@@ -74,7 +74,7 @@ ensure_directories_exist(const char *str, mode_t dir_mode)
 }
 
 static void
-sigalrm(int sig)
+sigalrm(__attribute__((unused)) int sig)
 {
 	/* do nothing */
 }
diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
index 9ef8ad19..f05db162 100644
--- a/libmultipath/foreign.c
+++ b/libmultipath/foreign.c
@@ -50,7 +50,7 @@ static void wrlock_foreigns(void)
 	pthread_rwlock_wrlock(&foreign_lock);
 }
 
-static void unlock_foreigns(void *unused)
+static void unlock_foreigns(__attribute__((unused)) void *unused)
 {
 	pthread_rwlock_unlock(&foreign_lock);
 }
diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 554b7778..6b3a3e19 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -84,7 +84,7 @@ io_context_t	ioctx;
 
 static void cancel_inflight_io(struct io_err_stat_path *pp);
 
-static void rcu_unregister(void *param)
+static void rcu_unregister(__attribute__((unused)) void *param)
 {
 	rcu_unregister_thread();
 }
@@ -689,7 +689,7 @@ static void cleanup_unlock(void *arg)
 	pthread_mutex_unlock((pthread_mutex_t*) arg);
 }
 
-static void cleanup_exited(void *arg)
+static void cleanup_exited(__attribute__((unused)) void *arg)
 {
 	uatomic_set(&io_err_thread_running, 0);
 }
diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 278b8d51..56761668 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -50,7 +50,7 @@ struct config *get_multipath_config(void)
 	return multipath_conf;
 }
 
-void put_multipath_config(void * arg)
+void put_multipath_config(__attribute__((unused)) void * arg)
 {
 	/* Noop for now */
 }
diff --git a/multipath/main.c b/multipath/main.c
index 4f4d8e89..b3f8c99b 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -86,7 +86,7 @@ struct config *get_multipath_config(void)
 	return multipath_conf;
 }
 
-void put_multipath_config(void *arg)
+void put_multipath_config(__attribute__((unused)) void *arg)
 {
 	/* Noop for now */
 }
diff --git a/multipathd/dmevents.c b/multipathd/dmevents.c
index 00348926..b22b47d2 100644
--- a/multipathd/dmevents.c
+++ b/multipathd/dmevents.c
@@ -370,12 +370,12 @@ static int dmevent_loop (void)
 	return -1; /* never reach there */
 }
 
-static void rcu_unregister(void *param)
+static void rcu_unregister(__attribute__((unused)) void *param)
 {
 	rcu_unregister_thread();
 }
 
-void *wait_dmevents (void *unused)
+void *wait_dmevents (__attribute__((unused)) void *unused)
 {
 	int r;
 
diff --git a/multipathd/main.c b/multipathd/main.c
index 34a57689..ef128a32 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -215,7 +215,7 @@ static void do_sd_notify(enum daemon_status old_state,
 }
 #endif
 
-static void config_cleanup(void *arg)
+static void config_cleanup(__attribute__((unused)) void *arg)
 {
 	pthread_mutex_unlock(&config_lock);
 }
@@ -306,7 +306,7 @@ struct config *get_multipath_config(void)
 	return rcu_dereference(multipath_conf);
 }
 
-void put_multipath_config(void *arg)
+void put_multipath_config(__attribute__((unused)) void *arg)
 {
 	rcu_read_unlock();
 }
@@ -1503,7 +1503,7 @@ out:
 	return r;
 }
 
-static void rcu_unregister(void *param)
+static void rcu_unregister(__attribute__((unused)) void *param)
 {
 	rcu_unregister_thread();
 }
@@ -2685,25 +2685,25 @@ handle_signals(bool nonfatal)
 }
 
 static void
-sighup (int sig)
+sighup(__attribute__((unused)) int sig)
 {
 	reconfig_sig = 1;
 }
 
 static void
-sigend (int sig)
+sigend(__attribute__((unused)) int sig)
 {
 	exit_sig = 1;
 }
 
 static void
-sigusr1 (int sig)
+sigusr1(__attribute__((unused)) int sig)
 {
 	log_reset_sig = 1;
 }
 
 static void
-sigusr2 (int sig)
+sigusr2(__attribute__((unused)) int sig)
 {
 	condlog(3, "SIGUSR2 received");
 }
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
