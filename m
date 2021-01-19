Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E86CD2FAF95
	for <lists+dm-devel@lfdr.de>; Tue, 19 Jan 2021 05:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611031599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k7r2GtOEnDa6k8XZzsFnpQQ+CtFyj728bzMQ/13VwqY=;
	b=baga5+UcIpdBWtBEkrbGVpHcvD06ZMqqAZ0CnX2HFSQECc7CsDD1YNBBtBLw0vuWphGT9Y
	NMqfXkKeS40goShUSfWWeO5l7j+gAk4YX5paCsx1y9fCH0unTKMQzP9Xs9tvV5/OXVUOC/
	10aSJg+5tXCmxw58KWjm9OCrvTzOvU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-T5tRDIgRPzCkbhjZ1lwHuw-1; Mon, 18 Jan 2021 23:46:37 -0500
X-MC-Unique: T5tRDIgRPzCkbhjZ1lwHuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A541934102;
	Tue, 19 Jan 2021 04:46:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42C3E7095A;
	Tue, 19 Jan 2021 04:46:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6D2F4E58E;
	Tue, 19 Jan 2021 04:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10J4kACI017566 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 23:46:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2E4605D9D3; Tue, 19 Jan 2021 04:46:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 425275D9CD;
	Tue, 19 Jan 2021 04:46:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10J4k58J018705; 
	Mon, 18 Jan 2021 22:46:05 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10J4k5Rn018704;
	Mon, 18 Jan 2021 22:46:05 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 18 Jan 2021 22:46:04 -0600
Message-Id: <1611031564-18663-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1611031564-18663-1-git-send-email-bmarzins@redhat.com>
References: <1611031564-18663-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 1/1] multipathd: cleanup logging for marginal
	paths
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

io_err_stat logged at level 2 whenever it enqueued a path to check,
which could happen multiple times while a path was marginal.  On the
other hand if marginal_pathgroups wasn't set, multipathd didn't log when
paths were set to marginal. Now io_err_stat only logs at level 2 when
something unexpected happens, but multipathd will always log when a
path switches its marginal state.

This patch also fixes an issue where paths in the delayed state could
get set to the pending state if they could not be checked in time.
Aside from going against the idea the paths should not be set to pending
if they already have a valid state, this caused multipathd to log a
message whenever the path state switched to from delayed to pending and
then back.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/io_err_stat.c |  7 +++----
 multipathd/main.c          | 25 ++++++++++++++-----------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index bf78a236..abdd0b4f 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -252,7 +252,7 @@ static int enqueue_io_err_stat_by_path(struct path *path)
 	vector_set_slot(io_err_pathvec, p);
 	pthread_mutex_unlock(&io_err_pathvec_lock);
 
-	io_err_stat_log(2, "%s: enqueue path %s to check",
+	io_err_stat_log(3, "%s: enqueue path %s to check",
 			path->mpp->alias, path->dev);
 	return 0;
 
@@ -343,7 +343,7 @@ int need_io_err_check(struct path *pp)
 	if (uatomic_read(&io_err_thread_running) == 0)
 		return 0;
 	if (count_active_paths(pp->mpp) <= 0) {
-		io_err_stat_log(2, "%s: recover path early", pp->dev);
+		io_err_stat_log(2, "%s: no paths. recovering early", pp->dev);
 		goto recover;
 	}
 	if (pp->io_err_pathfail_cnt != PATH_IO_ERR_WAITING_TO_CHECK)
@@ -361,8 +361,7 @@ int need_io_err_check(struct path *pp)
 		 * Or else,  return 1 to set path state to PATH_SHAKY
 		 */
 		if (r == 1) {
-			io_err_stat_log(3, "%s: enqueue fails, to recover",
-					pp->dev);
+			io_err_stat_log(2, "%s: enqueue failed. recovering early", pp->dev);
 			goto recover;
 		} else
 			pp->io_err_pathfail_cnt = PATH_IO_ERR_IN_CHECKING;
diff --git a/multipathd/main.c b/multipathd/main.c
index 92c45d44..99a89a69 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2132,8 +2132,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 		pathinfo(pp, conf, 0);
 		pthread_cleanup_pop(1);
 		return 1;
-	} else if ((newstate != PATH_UP && newstate != PATH_GHOST) &&
-			(pp->state == PATH_DELAYED)) {
+	} else if ((newstate != PATH_UP && newstate != PATH_GHOST &&
+		    newstate != PATH_PENDING) && (pp->state == PATH_DELAYED)) {
 		/* If path state become failed again cancel path delay state */
 		pp->state = newstate;
 		/*
@@ -2200,8 +2200,9 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	if ((newstate == PATH_UP || newstate == PATH_GHOST) &&
 	    (san_path_check_enabled(pp->mpp) ||
 	     marginal_path_check_enabled(pp->mpp))) {
-		int was_marginal = pp->marginal;
 		if (should_skip_path(pp)) {
+			if (!pp->marginal && pp->state != PATH_DELAYED)
+				condlog(2, "%s: path is now marginal", pp->dev);
 			if (!marginal_pathgroups) {
 				if (marginal_path_check_enabled(pp->mpp))
 					/* to reschedule as soon as possible,
@@ -2211,13 +2212,18 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 				pp->state = PATH_DELAYED;
 				return 1;
 			}
-			if (!was_marginal) {
+			if (!pp->marginal) {
 				pp->marginal = 1;
 				marginal_changed = 1;
 			}
-		} else if (marginal_pathgroups && was_marginal) {
-			pp->marginal = 0;
-			marginal_changed = 1;
+		} else {
+			if (pp->marginal || pp->state == PATH_DELAYED)
+				condlog(2, "%s: path is no longer marginal",
+					pp->dev);
+			if (marginal_pathgroups && pp->marginal) {
+				pp->marginal = 0;
+				marginal_changed = 1;
+			}
 		}
 	}
 
@@ -2343,11 +2349,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	 */
 	condlog(4, "path prio refresh");
 
-	if (marginal_changed) {
-		condlog(2, "%s: path is %s marginal", pp->dev,
-			(pp->marginal)? "now" : "no longer");
+	if (marginal_changed)
 		reload_and_sync_map(pp->mpp, vecs, 1);
-	}
 	else if (update_prio(pp, new_path_up) &&
 	    (pp->mpp->pgpolicyfn == (pgpolicyfn *)group_by_prio) &&
 	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

