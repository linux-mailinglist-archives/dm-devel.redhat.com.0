Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 148777FECB
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:41:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B05D315C002;
	Fri,  2 Aug 2019 16:41:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18B0310018F9;
	Fri,  2 Aug 2019 16:41:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1A393FA9A;
	Fri,  2 Aug 2019 16:41:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GYIiu001450 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:34:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C46C3600C8; Fri,  2 Aug 2019 16:34:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A1B7600D1;
	Fri,  2 Aug 2019 16:34:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GYAgY031851; 
	Fri, 2 Aug 2019 11:34:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GY9iZ031850;
	Fri, 2 Aug 2019 11:34:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:41 -0500
Message-Id: <1564763622-31752-16-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 15/16] multipathd: use marginal_pathgroups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 02 Aug 2019 16:41:54 +0000 (UTC)

This commit makes the marginal_pathgroups option work with the
existing methods for determining marginal paths.  It also merges the
code for the marginal_path and sand_path_err methods. This has the
side effect of making the marginal_path code set a marginal path's state
to "delayed" instead of "shaky" like it previously did.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 53 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index dca2214c..04b2b56a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1960,6 +1960,18 @@ reinstate_path:
 	return 0;
 }
 
+static int
+should_skip_path(struct path *pp){
+	if (marginal_path_check_enabled(pp->mpp)) {
+		if (pp->io_err_disable_reinstate && need_io_err_check(pp))
+			return 1;
+	} else if (san_path_check_enabled(pp->mpp)) {
+		if (check_path_reinstate_state(pp))
+			return 1;
+	}
+	return 0;
+}
+
 /*
  * Returns '1' if the path has been checked, '-1' if it was blacklisted
  * and '0' otherwise
@@ -1975,6 +1987,7 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 	int oldchkrstate = pp->chkrstate;
 	int retrigger_tries, checkint, max_checkint, verbosity;
 	struct config *conf;
+	int marginal_pathgroups, marginal_changed = 0;
 	int ret;
 
 	if ((pp->initialized == INIT_OK ||
@@ -1991,6 +2004,7 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 	checkint = conf->checkint;
 	max_checkint = conf->max_checkint;
 	verbosity = conf->verbosity;
+	marginal_pathgroups = conf->marginal_pathgroups;
 	put_multipath_config(conf);
 
 	if (pp->checkint == CHECKINT_UNDEF) {
@@ -2106,20 +2120,27 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 	set_no_path_retry(pp->mpp);
 
 	if ((newstate == PATH_UP || newstate == PATH_GHOST) &&
-			check_path_reinstate_state(pp)) {
-		pp->state = PATH_DELAYED;
-		return 1;
-	}
-
-	if ((newstate == PATH_UP || newstate == PATH_GHOST) &&
-	    pp->io_err_disable_reinstate && need_io_err_check(pp)) {
-		pp->state = PATH_SHAKY;
-		/*
-		 * to reschedule as soon as possible,so that this path can
-		 * be recoverd in time
-		 */
-		pp->tick = 1;
-		return 1;
+	    (san_path_check_enabled(pp->mpp) ||
+	     marginal_path_check_enabled(pp->mpp))) {
+		int was_marginal = pp->marginal;
+		if (should_skip_path(pp)) {
+			if (!marginal_pathgroups) {
+				if (marginal_path_check_enabled(pp->mpp))
+					/* to reschedule as soon as possible,
+					 * so that this path can be recovered
+					 * in time */
+					pp->tick = 1;
+				pp->state = PATH_DELAYED;
+				return 1;
+			}
+			if (!was_marginal) {
+				pp->marginal = 1;
+				marginal_changed = 1;
+			}
+		} else if (marginal_pathgroups && was_marginal) {
+			pp->marginal = 0;
+			marginal_changed = 1;
+		}
 	}
 
 	/*
@@ -2258,7 +2279,9 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 	 */
 	condlog(4, "path prio refresh");
 
-	if (update_prio(pp, new_path_up) &&
+	if (marginal_changed)
+		update_path_groups(pp->mpp, vecs, 1);
+	else if (update_prio(pp, new_path_up) &&
 	    (pp->mpp->pgpolicyfn == (pgpolicyfn *)group_by_prio) &&
 	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE)
 		update_path_groups(pp->mpp, vecs, !new_path_up);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
