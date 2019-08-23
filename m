Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6CC9B5C7
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 19:49:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 828533090FC1;
	Fri, 23 Aug 2019 17:49:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB25850B;
	Fri, 23 Aug 2019 17:49:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0BB7180BA9C;
	Fri, 23 Aug 2019 17:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NHnKoo010267 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 13:49:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBA441813D; Fri, 23 Aug 2019 17:49:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0C660C44;
	Fri, 23 Aug 2019 17:49:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7NHnJg5006092; 
	Fri, 23 Aug 2019 12:49:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7NHnIcE006091;
	Fri, 23 Aug 2019 12:49:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Aug 2019 12:48:56 -0500
Message-Id: <1566582538-5979-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Muneendra Kumar <mkumar@redhat.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 12/14] libmutipath: deprecate delay_*_checks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 23 Aug 2019 17:49:31 +0000 (UTC)

The delay_checks shaky paths detection method works the same way as the
san_path_err method, but not as well, with less configurability, and
with the code spread all over check_path(). The only real difference is
that marks the path as marginal for a certain number of path checks
instead of for a specific time. This patch deprecates the delay_checks
method and maps it to the the san_path_err method.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c   | 18 +-------
 libmultipath/propsel.c     | 89 ++++++++++++++++++++++++++++----------
 libmultipath/propsel.h     |  3 +-
 libmultipath/structs.h     | 10 -----
 multipath/multipath.conf.5 | 40 +++++++++--------
 multipathd/main.c          | 34 ++-------------
 6 files changed, 96 insertions(+), 98 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 3238d485..9897cc37 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -342,8 +342,6 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	select_dev_loss(conf, mpp);
 	select_reservation_key(conf, mpp);
 	select_deferred_remove(conf, mpp);
-	select_delay_watch_checks(conf, mpp);
-	select_delay_wait_checks(conf, mpp);
 	select_marginal_path_err_sample_time(conf, mpp);
 	select_marginal_path_err_rate_threshold(conf, mpp);
 	select_marginal_path_err_recheck_gap_time(conf, mpp);
@@ -351,6 +349,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	select_san_path_err_threshold(conf, mpp);
 	select_san_path_err_forget_rate(conf, mpp);
 	select_san_path_err_recovery_time(conf, mpp);
+	select_delay_checks(conf, mpp);
 	select_skip_kpartx(conf, mpp);
 	select_max_sectors_kb(conf, mpp);
 	select_ghost_delay(conf, mpp);
@@ -360,21 +359,8 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
 	marginal_pathgroups = conf->marginal_pathgroups;
 	pthread_cleanup_pop(1);
 
-	if (marginal_path_check_enabled(mpp)) {
-		if (delay_check_enabled(mpp)) {
-			condlog(1, "%s: WARNING: both marginal_path and delay_checks error detection selected",
-				mpp->alias);
-			condlog(0, "%s: unexpected behavior may occur!",
-				mpp->alias);
-		}
+	if (marginal_path_check_enabled(mpp))
 		start_io_err_stat_thread(vecs);
-	}
-	if (san_path_check_enabled(mpp) && delay_check_enabled(mpp)) {
-		condlog(1, "%s: WARNING: both san_path_err and delay_checks error detection selected",
-			mpp->alias);
-		condlog(0, "%s: unexpected behavior may occur!",
-			mpp->alias);
-	}
 
 	n_paths = VECTOR_SIZE(mpp->paths);
         /*
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 6af2513d..27e8d68a 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -85,6 +85,10 @@ static const char autodetect_origin[] =
 	"(setting: storage device autodetected)";
 static const char marginal_path_origin[] =
 	"(setting: implied by marginal_path check)";
+static const char delay_watch_origin[] =
+	"(setting: implied by delay_watch_checks)";
+static const char delay_wait_origin[] =
+	"(setting: implied by delay_wait_checks)";
 
 #define do_default(dest, value)						\
 do {									\
@@ -877,39 +881,80 @@ out:
 	return 0;
 }
 
-int select_delay_watch_checks(struct config *conf, struct multipath *mp)
+static inline int san_path_check_options_set(const struct multipath *mp)
 {
-	const char *origin;
+	return mp->san_path_err_threshold > 0 ||
+	       mp->san_path_err_forget_rate > 0 ||
+	       mp->san_path_err_recovery_time > 0;
+}
+
+static int
+use_delay_watch_checks(struct config *conf, struct multipath *mp)
+{
+	int value = NU_UNDEF;
+	const char *origin = default_origin;
 	char buff[12];
 
-	mp_set_mpe(delay_watch_checks);
-	mp_set_ovr(delay_watch_checks);
-	mp_set_hwe(delay_watch_checks);
-	mp_set_conf(delay_watch_checks);
-	mp_set_default(delay_watch_checks, DEFAULT_DELAY_CHECKS);
+	do_set(delay_watch_checks, mp->mpe, value, multipaths_origin);
+	do_set(delay_watch_checks, conf->overrides, value, overrides_origin);
+	do_set_from_hwe(delay_watch_checks, mp, value, hwe_origin);
+	do_set(delay_watch_checks, conf, value, conf_origin);
 out:
-	if (print_off_int_undef(buff, 12, mp->delay_watch_checks) != 0)
-		condlog(3, "%s: delay_watch_checks = %s %s",
-			mp->alias, buff, origin);
-	return 0;
+	if (print_off_int_undef(buff, 12, value) != 0)
+		condlog(3, "%s: delay_watch_checks = %s %s", mp->alias, buff,
+			origin);
+	return value;
 }
 
-int select_delay_wait_checks(struct config *conf, struct multipath *mp)
+static int
+use_delay_wait_checks(struct config *conf, struct multipath *mp)
 {
-	const char *origin;
+	int value = NU_UNDEF;
+	const char *origin = default_origin;
 	char buff[12];
 
-	mp_set_mpe(delay_wait_checks);
-	mp_set_ovr(delay_wait_checks);
-	mp_set_hwe(delay_wait_checks);
-	mp_set_conf(delay_wait_checks);
-	mp_set_default(delay_wait_checks, DEFAULT_DELAY_CHECKS);
+	do_set(delay_wait_checks, mp->mpe, value, multipaths_origin);
+	do_set(delay_wait_checks, conf->overrides, value, overrides_origin);
+	do_set_from_hwe(delay_wait_checks, mp, value, hwe_origin);
+	do_set(delay_wait_checks, conf, value, conf_origin);
 out:
-	if (print_off_int_undef(buff, 12, mp->delay_wait_checks) != 0)
-		condlog(3, "%s: delay_wait_checks = %s %s",
-			mp->alias, buff, origin);
-	return 0;
+	if (print_off_int_undef(buff, 12, value) != 0)
+		condlog(3, "%s: delay_wait_checks = %s %s", mp->alias, buff,
+			origin);
+	return value;
+}
+
+int select_delay_checks(struct config *conf, struct multipath *mp)
+{
+	int watch_checks, wait_checks;
+	char buff[12];
 
+	watch_checks = use_delay_watch_checks(conf, mp);
+	wait_checks = use_delay_wait_checks(conf, mp);
+	if (watch_checks <= 0 && wait_checks <= 0)
+		return 0;
+	if (san_path_check_options_set(mp)) {
+		condlog(3, "%s: both marginal_path and delay_checks error detection options selected", mp->alias);
+		condlog(3, "%s: ignoring delay_checks options", mp->alias);
+		return 0;
+	}
+	mp->san_path_err_threshold = 1;
+	condlog(3, "%s: san_path_err_threshold = 1 %s", mp->alias,
+		(watch_checks > 0)? delay_watch_origin : delay_wait_origin);
+	if (watch_checks > 0) {
+		mp->san_path_err_forget_rate = watch_checks;
+		print_off_int_undef(buff, 12, mp->san_path_err_forget_rate);
+		condlog(3, "%s: san_path_err_forget_rate = %s %s", mp->alias,
+			buff, delay_watch_origin);
+	}
+	if (wait_checks > 0) {
+		mp->san_path_err_recovery_time = wait_checks *
+						 conf->max_checkint;
+		print_off_int_undef(buff, 12, mp->san_path_err_recovery_time);
+		condlog(3, "%s: san_path_err_recovery_time = %s %s", mp->alias,
+			buff, delay_wait_origin);
+	}
+	return 0;
 }
 
 static int san_path_deprecated_warned;
diff --git a/libmultipath/propsel.h b/libmultipath/propsel.h
index b352c16a..ddfd6262 100644
--- a/libmultipath/propsel.h
+++ b/libmultipath/propsel.h
@@ -22,8 +22,7 @@ int select_retain_hwhandler (struct config *conf, struct multipath * mp);
 int select_detect_prio(struct config *conf, struct path * pp);
 int select_detect_checker(struct config *conf, struct path * pp);
 int select_deferred_remove(struct config *conf, struct multipath *mp);
-int select_delay_watch_checks (struct config *conf, struct multipath * mp);
-int select_delay_wait_checks (struct config *conf, struct multipath * mp);
+int select_delay_checks(struct config *conf, struct multipath * mp);
 int select_skip_kpartx (struct config *conf, struct multipath * mp);
 int select_max_sectors_kb (struct config *conf, struct multipath * mp);
 int select_san_path_err_forget_rate(struct config *conf, struct multipath *mp);
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index a8b9d325..a3adf906 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -268,8 +268,6 @@ struct path {
 	int pgindex;
 	int detect_prio;
 	int detect_checker;
-	int watch_checks;
-	int wait_checks;
 	int tpgs;
 	char * uid_attribute;
 	char * getuid;
@@ -321,8 +319,6 @@ struct multipath {
 	int fast_io_fail;
 	int retain_hwhandler;
 	int deferred_remove;
-	int delay_watch_checks;
-	int delay_wait_checks;
 	int san_path_err_threshold;
 	int san_path_err_forget_rate;
 	int san_path_err_recovery_time;
@@ -393,12 +389,6 @@ static inline int san_path_check_enabled(const struct multipath *mpp)
 		mpp->san_path_err_recovery_time > 0;
 }
 
-static inline int delay_check_enabled(const struct multipath *mpp)
-{
-	return mpp->delay_watch_checks != NU_NO ||
-		mpp->delay_wait_checks != NU_NO;
-}
-
 struct pathgroup {
 	long id;
 	int status;
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index f7d21b4c..08297a41 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1013,10 +1013,12 @@ The default is: \fBno\fR
 .
 .TP
 .B delay_watch_checks
-If set to a value greater than 0, multipathd will watch paths that have
-recently become valid for this many checks. If they fail again while they are
-being watched, when they next become valid, they will not be used until they
-have stayed up for \fIdelay_wait_checks\fR checks. See "Shaky paths detection" below.
+This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_forget_rate\fR.
+If this is set to a value greater than 0 and no \fIsan_path_err\fR options
+are set, \fIsan_path_err_forget_rate\fR will be set to the value of
+\fIdelay_watch_checks\fR and \fIsan_path_err_threshold\fR will be set to 1.
+See the \fIsan_path_err_forget_rate\fR and \fIsan_path_err_threshold\fR
+options, and "Shaky paths detection" below for more information.
 .RS
 .TP
 The default is: \fBno\fR
@@ -1025,10 +1027,14 @@ The default is: \fBno\fR
 .
 .TP
 .B delay_wait_checks
-If set to a value greater than 0, when a device that has recently come back
-online fails again within \fIdelay_watch_checks\fR checks, the next time it
-comes back online, it will marked and delayed, and not used until it has passed
-\fIdelay_wait_checks\fR checks. See "Shaky paths detection" below.
+This option is \fBdeprecated\fR, and mapped to \fIsan_path_err_recovery_time\fR.
+If this is set to a value greater than 0 and no \fIsan_path_err\fR options
+are set, \fIsan_path_err_recovery_time\fR will be set to the value of
+\fIdelay_wait_checks\fR times \fImax_polling_interval\fR. This will give
+approximately the same wait time as delay_wait_checks previously did.
+Also, \fIsan_path_err_threshold\fR will be set to 1. See the
+\fIsan_path_err_recovery_time\fR and \fIsan_path_err_threshold\fR
+options, and "Shaky paths detection" below for more information.
 .RS
 .TP
 The default is: \fBno\fR
@@ -1689,13 +1695,10 @@ if the healthy state appears to be stable. The logic of determining
 differs between the three methods.
 .TP 8
 .B \(dqdelay_checks\(dq failure tracking
-If a path fails again within a
-\fIdelay_watch_checks\fR interval after a failure, don't
-reinstate it until it passes a \fIdelay_wait_checks\fR interval
-in always good status.
-The intervals are measured in \(dqticks\(dq, i.e. the
-time between path checks by multipathd, which is variable and controlled by the
-\fIpolling_interval\fR and \fImax_polling_interval\fR parameters.
+This method is \fBdeprecated\fR and mapped to the \(dqsan_path_err\(dq method.
+See the \fIdelay_watch_checks\fR and \fIdelay_wait_checks\fR options above
+for more information.
+
 .TP
 .B \(dqmarginal_path\(dq failure tracking
 If a second failure event (good->bad transition) occurs within
@@ -1712,12 +1715,13 @@ in seconds.
 .B \(dqsan_path_err\(dq failure tracking
 multipathd counts path failures for each path. Once the number of failures
 exceeds the value given by \fIsan_path_err_threshold\fR, the path is not
-reinstated for \fIsan_path_err_recovery_time\fR ticks. While counting
+reinstated for \fIsan_path_err_recovery_time\fR seconds. While counting
 failures, multipathd \(dqforgets\(dq one past failure every
 \(dqsan_path_err_forget_rate\(dq ticks; thus if errors don't occur more
 often then once in the forget rate interval, the failure count doesn't
-increase and the threshold is never reached. As for the \fIdelay_xy\fR method,
-intervals are measured in \(dqticks\(dq.
+increase and the threshold is never reached. Ticks are the time between
+path checks by multipathd, which is variable and controlled by the
+\fIpolling_interval\fR and \fImax_polling_interval\fR parameters.
 .
 .RS 8
 .LP
diff --git a/multipathd/main.c b/multipathd/main.c
index 7db15736..dca2214c 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2122,16 +2122,6 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 		return 1;
 	}
 
-	if ((newstate == PATH_UP || newstate == PATH_GHOST) &&
-	     pp->wait_checks > 0) {
-		if (pp->mpp->nr_active > 0) {
-			pp->state = PATH_DELAYED;
-			pp->wait_checks--;
-			return 1;
-		} else
-			pp->wait_checks = 0;
-	}
-
 	/*
 	 * don't reinstate failed path, if its in stand-by
 	 * and if target supports only implicit tpgs mode.
@@ -2162,19 +2152,10 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 			 * proactively fail path in the DM
 			 */
 			if (oldstate == PATH_UP ||
-			    oldstate == PATH_GHOST) {
+			    oldstate == PATH_GHOST)
 				fail_path(pp, 1);
-				if (pp->mpp->delay_wait_checks > 0 &&
-				    pp->watch_checks > 0) {
-					pp->wait_checks = pp->mpp->delay_wait_checks;
-					pp->watch_checks = 0;
-				}
-			} else {
+			else
 				fail_path(pp, 0);
-				if (pp->wait_checks > 0)
-					pp->wait_checks =
-						pp->mpp->delay_wait_checks;
-			}
 
 			/*
 			 * cancel scheduled failback
@@ -2200,15 +2181,10 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 		 * reinstate this path
 		 */
 		if (oldstate != PATH_UP &&
-		    oldstate != PATH_GHOST) {
-			if (pp->mpp->delay_watch_checks > 0)
-				pp->watch_checks = pp->mpp->delay_watch_checks;
+		    oldstate != PATH_GHOST)
 			add_active = 1;
-		} else {
-			if (pp->watch_checks > 0)
-				pp->watch_checks--;
+		else
 			add_active = 0;
-		}
 		if (!disable_reinstate && reinstate_path(pp, add_active)) {
 			condlog(3, "%s: reload map", pp->dev);
 			ev_add_path(pp, vecs, 1);
@@ -2253,8 +2229,6 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 				condlog(4, "%s: delay next check %is",
 					pp->dev_t, pp->checkint);
 			}
-			if (pp->watch_checks > 0)
-				pp->watch_checks--;
 			pp->tick = pp->checkint;
 		}
 	}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
