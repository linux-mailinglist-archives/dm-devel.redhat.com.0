Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 42A6C20A6EF
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qjdLZwG2URw6vznz/nzoL6Zbqx3SpJOfOgG90aa42tA=;
	b=YAMwnhWTR6toFZb7FS7Tz+ijNozFtq5LZu5XG9qQUah2l/Vl2alugacQsRtiMMs5v7Xron
	WDuLRhXVp9TqICEWIx9eMq4nZQRi8vHfIbQxZ9j7gDf4uCdc4r5B5bVjnTGKzLUbni5fRW
	YZniy5qoWOwLa/hHHROAbdx8uYOC/Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-r6cyVRK3PU-5JcN4pC0ljg-1; Thu, 25 Jun 2020 16:42:39 -0400
X-MC-Unique: r6cyVRK3PU-5JcN4pC0ljg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2E5107ACF6;
	Thu, 25 Jun 2020 20:42:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C5F47FEA6;
	Thu, 25 Jun 2020 20:42:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CAB5875A4;
	Thu, 25 Jun 2020 20:42:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgRLB013996 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A856E1DB; Thu, 25 Jun 2020 20:42:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60B25D9C9;
	Thu, 25 Jun 2020 20:42:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgONY028796; 
	Thu, 25 Jun 2020 15:42:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgOjn028795;
	Thu, 25 Jun 2020 15:42:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:16 -0500
Message-Id: <1593117741-28750-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/7] multipathd: fix check_path errors with
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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
 multipathd/main.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index d73b1b9a..22bc4363 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1615,22 +1615,18 @@ fail_path (struct path * pp, int del_active)
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
@@ -2091,9 +2087,13 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	/*
 	 * Synchronize with kernel state
 	 */
-	if (update_multipath_strings(pp->mpp, vecs->pathvec, 1) != DMP_PASS) {
+	ret = update_multipath_strings(pp->mpp, vecs->pathvec, 1);
+	if (ret != DMP_PASS) {
 		condlog(1, "%s: Could not synchronize with kernel state",
 			pp->dev);
+		if (ret == DMP_FAIL)
+			/* multipath device missing. Likely removed */
+			return 0;
 		pp->dmstate = PSTATE_UNDEF;
 	}
 	/* if update_multipath_strings orphaned the path, quit early */
@@ -2183,12 +2183,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
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
@@ -2204,15 +2200,10 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
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

