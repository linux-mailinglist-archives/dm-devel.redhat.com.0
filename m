Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C4BC31FDA2C
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rKXJFj5ZymWDUl1CpdlNgFoCIAPHZ5SJBMi2kz86/7Q=;
	b=Zw8towwK4ZEYp15dXv4rbDm3r6jh8S873I/r/REScuADGv1I53iJI/Wo+30pNkm2A0F+aS
	fZpLDqyIxqiAOx5i3bm42DC45WFftiQgDd7/eTnTRoewxX4U/jf5XVE+2OXOM4eENXNb1A
	5xc7fkV7iGyN3VQ5fIJ7TywbonFgyqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-p6VoOxHXM5GH6bXcKKwLrA-1; Wed, 17 Jun 2020 20:25:08 -0400
X-MC-Unique: p6VoOxHXM5GH6bXcKKwLrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C77D106B245;
	Thu, 18 Jun 2020 00:25:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BD145D9E4;
	Thu, 18 Jun 2020 00:25:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC88F833BD;
	Thu, 18 Jun 2020 00:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0OZuR026505 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AB7B1002388; Thu, 18 Jun 2020 00:24:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7480A1001E91;
	Thu, 18 Jun 2020 00:24:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OVid018473; 
	Wed, 17 Jun 2020 19:24:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OUhl018472;
	Wed, 17 Jun 2020 19:24:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:22 -0500
Message-Id: <1592439867-18427-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a multipath device is removed during, or immediately before the call
to check_path(), multipathd can behave incorrectly. A missing multpath
device will cause update_multipath_strings() to fail, setting
pp->dmstate to PSTATE_UNDEF.  If the path is up, this state will cause
reinstate_path() to be called, which will also fail.  This will trigger
a reload, restoring the recently removed device.

If update_multipath_strings() fails because there is no multipath
device, check_path should just quit, since the remove dmevent and uevent
are likely already queued up. Also, I don't see any reason to reload the
multipath device if reinstate fails. This code was added by
fac68d7a99ef17d496079538a5c6836acd7911ab, which clamined that reinstate
could fail if the path was disabled.  Looking through the current kernel
code, I can't see any reason why a reinstate would fail, where a reload
would help. If the path was missing from the multipath device,
update_multipath_strings() would already catch that, and quit
check_path() early, which make more sense to me than reloading does.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 6b7db2c0..8fb73922 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1611,22 +1611,18 @@ fail_path (struct path * pp, int del_active)
 /*
  * caller must have locked the path list before calling that function
  */
-static int
+static void
 reinstate_path (struct path * pp)
 {
-	int ret = 0;
-
 	if (!pp->mpp)
-		return 0;
+		return;
 
-	if (dm_reinstate_path(pp->mpp->alias, pp->dev_t)) {
+	if (dm_reinstate_path(pp->mpp->alias, pp->dev_t))
 		condlog(0, "%s: reinstate failed", pp->dev_t);
-		ret = 1;
-	} else {
+	else {
 		condlog(2, "%s: reinstated", pp->dev_t);
 		update_queue_mode_add_path(pp->mpp);
 	}
-	return ret;
 }
 
 static void
@@ -2088,8 +2084,13 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	 * Synchronize with kernel state
 	 */
 	if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
+		struct dm_info info;
 		condlog(1, "%s: Could not synchronize with kernel state",
 			pp->dev);
+		if (pp->mpp && pp->mpp->alias &&
+		    do_dm_get_info(pp->mpp->alias, &info) == 0)
+			/* multipath device missing. Likely removed */
+			return 0;
 		pp->dmstate = PSTATE_UNDEF;
 	}
 	/* if update_multipath_strings orphaned the path, quit early */
@@ -2179,12 +2180,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 		/*
 		 * reinstate this path
 		 */
-		if (!disable_reinstate && reinstate_path(pp)) {
-			condlog(3, "%s: reload map", pp->dev);
-			ev_add_path(pp, vecs, 1);
-			pp->tick = 1;
-			return 0;
-		}
+		if (!disable_reinstate)
+			reinstate_path(pp);
 		new_path_up = 1;
 
 		if (oldchkrstate != PATH_UP && oldchkrstate != PATH_GHOST)
@@ -2200,15 +2197,10 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	else if (newstate == PATH_UP || newstate == PATH_GHOST) {
 		if ((pp->dmstate == PSTATE_FAILED ||
 		    pp->dmstate == PSTATE_UNDEF) &&
-		    !disable_reinstate) {
+		    !disable_reinstate)
 			/* Clear IO errors */
-			if (reinstate_path(pp)) {
-				condlog(3, "%s: reload map", pp->dev);
-				ev_add_path(pp, vecs, 1);
-				pp->tick = 1;
-				return 0;
-			}
-		} else {
+			reinstate_path(pp);
+		else {
 			LOG_MSG(4, verbosity, pp);
 			if (pp->checkint != max_checkint) {
 				/*
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

