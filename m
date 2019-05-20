Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1924212
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 22:23:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 874ED3082133;
	Mon, 20 May 2019 20:22:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04EB87A42E;
	Mon, 20 May 2019 20:22:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B89EF1806B13;
	Mon, 20 May 2019 20:22:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KKKS6i026093 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 16:20:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97B17A422; Mon, 20 May 2019 20:20:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8FD2FC60;
	Mon, 20 May 2019 20:20:26 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71D2CF74B9;
	Mon, 20 May 2019 20:19:50 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 20 May 2019 14:19:39 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 20 May 2019 22:19:01 +0200
Message-Id: <20190520201901.29584-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 20 May 2019 20:20:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 20 May 2019 20:20:06 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2] multipath-tools (coverity): assert
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 20 May 2019 20:23:37 +0000 (UTC)

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
index f203d77f..4574dce1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -256,11 +256,10 @@ int set_config_state(enum daemon_status state)
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
@@ -1861,15 +1860,12 @@ static int check_path_reinstate_state(struct path * pp) {
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
@@ -1905,8 +1901,7 @@ static int check_path_reinstate_state(struct path * pp) {
 	 * delay the path, so there's no point in checking if we should
 	 */
 
-	if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0)
-		return 0;
+	get_monotonic_time(&curr_time);
 	/* when path failures has exceeded the san_path_err_threshold
 	 * place the path in delayed state till san_path_err_recovery_time
 	 * so that the cutomer can rectify the issue within this time. After
@@ -2288,17 +2283,14 @@ checkerloop (void *ap)
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
@@ -2357,8 +2349,8 @@ checkerloop (void *ap)
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
index 773bc878..13a37be0 100644
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
@@ -268,9 +268,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
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
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
