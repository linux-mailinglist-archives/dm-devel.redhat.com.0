Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1F63252
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 09:45:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2728081E0E;
	Tue,  9 Jul 2019 07:45:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCDC05D9E5;
	Tue,  9 Jul 2019 07:44:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A7B341F40;
	Tue,  9 Jul 2019 07:44:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x697gFvX031495 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 03:42:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B98383FA6; Tue,  9 Jul 2019 07:42:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C599196EE;
	Tue,  9 Jul 2019 07:42:13 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D33112E97C8;
	Tue,  9 Jul 2019 07:42:01 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Tue,  9 Jul 2019 07:42:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 9 Jul 2019 07:40:05 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 9 Jul 2019 07:40:05 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3319.namprd18.prod.outlook.com (52.132.246.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18; Tue, 9 Jul 2019 07:40:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2052.020;
	Tue, 9 Jul 2019 07:40:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Thread-Topic: [PATCH 3/4] multipath-tools (coverity): assert availability of
	CLOCK_MONOTONIC
Thread-Index: AQHVNimF3GuzXkxtG0+gh7r5Jhm0wQ==
Date: Tue, 9 Jul 2019 07:40:03 +0000
Message-ID: <20190709073909.32112-4-martin.wilck@suse.com>
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
x-ms-office365-filtering-correlation-id: 825213c4-72f5-44d7-e96f-08d70440a7e6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3319; 
x-ms-traffictypediagnostic: CH2PR18MB3319:
x-microsoft-antispam-prvs: <CH2PR18MB331947FFD703DF6FA805B4B4FCF10@CH2PR18MB3319.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(386003)(14444005)(52116002)(6506007)(6512007)(107886003)(110136005)(81166006)(81156014)(478600001)(54906003)(8936002)(26005)(2616005)(256004)(6436002)(4326008)(72206003)(6486002)(316002)(76176011)(102836004)(5660300002)(36756003)(44832011)(66556008)(66476007)(73956011)(1076003)(66446008)(7736002)(305945005)(6116002)(3846002)(486006)(68736007)(14454004)(86362001)(66066001)(99286004)(66946007)(64756008)(71190400001)(71200400001)(476003)(53936002)(186003)(11346002)(2906002)(8676002)(50226002)(25786009)(446003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3319;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 299uXb+4JHHyI0j5EmQp+g7XoodcnmMATWuOOolHG3nCo0R5FOBG8Y4Qd9uOmAuxptK+g6aDxTQLnm/PGngCdU9e4j2y9PlYWfrbkOaz4BmvpnDBX+lct472S0BCVfRSdCHReZD0t4RSKHvoMLSrDVxqCjLHm8Lh2X45c4o7Yi7XZUdBGw5drCp7bS7n2Cj/DIUM5Ig0QXLToRx2lWmK83HCRMdXu3TtLmpVotFNq3l0wHyJR4OOjKT9X8eYdwsBIYW8Q7UaK0C3kXoyFT6NtCqYjn64t5Vq9lW9sMPt2RggkJ4kWehX/3quSQcpHCzHd9Crxi9Ah7AwxUxOoBEtWfqUml8tbXX6qM2Wb0gjmmT2vJtL8VfIzBepHh8uu3gN4EA3VNQOWcOTMFegzQY720oayjMZ1hvnb99aQdKTXT8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 825213c4-72f5-44d7-e96f-08d70440a7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 07:40:03.9139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Martin.Wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3319
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 09 Jul 2019 07:42:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 09 Jul 2019 07:42:02 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x697gFvX031495
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/4] multipath-tools (coverity): assert
 availability of CLOCK_MONOTONIC
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 09 Jul 2019 07:45:42 +0000 (UTC)

From: Martin Wilck <Martin.Wilck@suse.com>

clock_gettime() fails only if either an invalid pointer is passed,
or if the requested clock ID is not available. While availability of
CLOCK_REALTIME is guaranteed, CLOCK_MONOTONIC is not, at least not
by POSIX (Linux seems to have it, always). Provide a wrapper that
can be called without error checking, and which aborts in the highly
unlikely case that the monotonic clock can't be obtained. That saves
us from checking the error code of clock_gettime() at every invocation
(handling this sort of error "correctly" is almost impossible anyway),
and should still satisfy coverity.

Not doing this for libdmmp here, as it has it's own error checking
and doesn't use headers from libmultipath.

----
v2: Fix mistake that with -DNDEBUG, clock_gettime wouldn't be called
at all (Bart van Assche).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/checkers/tur.c |  6 +++---
 libmultipath/time-util.c    |  9 +++++++++
 libmultipath/time-util.h    |  1 +
 multipathd/main.c           | 34 +++++++++++++---------------------
 multipathd/uxlsnr.c         |  8 +++-----
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
index 6b08dbbb..e886fcf8 100644
--- a/libmultipath/checkers/tur.c
+++ b/libmultipath/checkers/tur.c
@@ -290,7 +290,7 @@ static void *tur_thread(void *ctx)
 
 static void tur_timeout(struct timespec *tsp)
 {
-	clock_gettime(CLOCK_MONOTONIC, tsp);
+	get_monotonic_time(tsp);
 	tsp->tv_nsec += 1000 * 1000; /* 1 millisecond */
 	normalize_timespec(tsp);
 }
@@ -300,7 +300,7 @@ static void tur_set_async_timeout(struct checker *c)
 	struct tur_checker_context *ct = c->context;
 	struct timespec now;
 
-	clock_gettime(CLOCK_MONOTONIC, &now);
+	get_monotonic_time(&now);
 	ct->time = now.tv_sec + c->timeout;
 }
 
@@ -309,7 +309,7 @@ static int tur_check_async_timeout(struct checker *c)
 	struct tur_checker_context *ct = c->context;
 	struct timespec now;
 
-	clock_gettime(CLOCK_MONOTONIC, &now);
+	get_monotonic_time(&now);
 	return (now.tv_sec > ct->time);
 }
 
diff --git a/libmultipath/time-util.c b/libmultipath/time-util.c
index 6d79c0e5..a3739a2d 100644
--- a/libmultipath/time-util.c
+++ b/libmultipath/time-util.c
@@ -3,6 +3,15 @@
 #include <time.h>
 #include "time-util.h"
 
+void get_monotonic_time(struct timespec *res)
+{
+	struct timespec ts;
+	int rv = clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	assert(rv == 0);
+	*res = ts;
+}
+
 /* Initialize @cond as a condition variable that uses the monotonic clock */
 void pthread_cond_init_mono(pthread_cond_t *cond)
 {
diff --git a/libmultipath/time-util.h b/libmultipath/time-util.h
index b76d2aa4..b23d328a 100644
--- a/libmultipath/time-util.h
+++ b/libmultipath/time-util.h
@@ -5,6 +5,7 @@
 
 struct timespec;
 
+void get_monotonic_time(struct timespec *res);
 void pthread_cond_init_mono(pthread_cond_t *cond);
 void normalize_timespec(struct timespec *ts);
 void timespecsub(const struct timespec *a, const struct timespec *b,
diff --git a/multipathd/main.c b/multipathd/main.c
index 7a5cd115..2e4973d7 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -283,11 +283,10 @@ int set_config_state(enum daemon_status state)
 		else if (running_state != DAEMON_IDLE) {
 			struct timespec ts;
 
-			if (clock_gettime(CLOCK_MONOTONIC, &ts) == 0) {
-				ts.tv_sec += 1;
-				rc = pthread_cond_timedwait(&config_cond,
-							    &config_lock, &ts);
-			}
+			get_monotonic_time(&ts);
+			ts.tv_sec += 1;
+			rc = pthread_cond_timedwait(&config_cond,
+						    &config_lock, &ts);
 		}
 		if (!rc && (running_state != DAEMON_SHUTDOWN)) {
 			running_state = state;
@@ -1888,15 +1887,12 @@ static int check_path_reinstate_state(struct path * pp) {
 	}
 
 	if (pp->disable_reinstate) {
-		/* If we don't know how much time has passed, automatically
-		 * reinstate the path, just to be safe. Also, if there are
-		 * no other usable paths, reinstate the path
-		 */
-		if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0 ||
-				pp->mpp->nr_active == 0) {
+		/* If there are no other usable paths, reinstate the path */
+		if (pp->mpp->nr_active == 0) {
 			condlog(2, "%s : reinstating path early", pp->dev);
 			goto reinstate_path;
 		}
+		get_monotonic_time(&curr_time);
 		if ((curr_time.tv_sec - pp->dis_reinstate_time ) > pp->mpp->san_path_err_recovery_time) {
 			condlog(2,"%s : reinstate the path after err recovery time", pp->dev);
 			goto reinstate_path;
@@ -1932,8 +1928,7 @@ static int check_path_reinstate_state(struct path * pp) {
 	 * delay the path, so there's no point in checking if we should
 	 */
 
-	if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0)
-		return 0;
+	get_monotonic_time(&curr_time);
 	/* when path failures has exceeded the san_path_err_threshold
 	 * place the path in delayed state till san_path_err_recovery_time
 	 * so that the cutomer can rectify the issue within this time. After
@@ -2315,17 +2310,14 @@ checkerloop (void *ap)
 	condlog(2, "path checkers start up");
 
 	/* Tweak start time for initial path check */
-	if (clock_gettime(CLOCK_MONOTONIC, &last_time) != 0)
-		last_time.tv_sec = 0;
-	else
-		last_time.tv_sec -= 1;
+	get_monotonic_time(&last_time);
+	last_time.tv_sec -= 1;
 
 	while (1) {
 		struct timespec diff_time, start_time, end_time;
 		int num_paths = 0, ticks = 0, strict_timing, rc = 0;
 
-		if (clock_gettime(CLOCK_MONOTONIC, &start_time) != 0)
-			start_time.tv_sec = 0;
+		get_monotonic_time(&start_time);
 		if (start_time.tv_sec && last_time.tv_sec) {
 			timespecsub(&start_time, &last_time, &diff_time);
 			condlog(4, "tick (%lu.%06lu secs)",
@@ -2384,8 +2376,8 @@ checkerloop (void *ap)
 		}
 
 		diff_time.tv_nsec = 0;
-		if (start_time.tv_sec &&
-		    clock_gettime(CLOCK_MONOTONIC, &end_time) == 0) {
+		if (start_time.tv_sec) {
+			get_monotonic_time(&end_time);
 			timespecsub(&end_time, &start_time, &diff_time);
 			if (num_paths) {
 				unsigned int max_checkint;
diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 04cbb7c7..bc71679e 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -130,10 +130,10 @@ void check_timeout(struct timespec start_time, char *inbuf,
 {
 	struct timespec diff_time, end_time;
 
-	if (start_time.tv_sec &&
-	    clock_gettime(CLOCK_MONOTONIC, &end_time) == 0) {
+	if (start_time.tv_sec) {
 		unsigned long msecs;
 
+		get_monotonic_time(&end_time);
 		timespecsub(&end_time, &start_time, &diff_time);
 		msecs = diff_time.tv_sec * 1000 +
 			diff_time.tv_nsec / (1000 * 1000);
@@ -280,9 +280,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 						i, polls[i].fd);
 					continue;
 				}
-				if (clock_gettime(CLOCK_MONOTONIC, &start_time)
-				    != 0)
-					start_time.tv_sec = 0;
+				get_monotonic_time(&start_time);
 				if (recv_packet_from_client(c->fd, &inbuf,
 							    uxsock_timeout)
 				    != 0) {
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
