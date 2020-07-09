Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2E317219E49
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-p5OaUhFGM6CPLivRF8Y5sg-1; Thu, 09 Jul 2020 06:52:38 -0400
X-MC-Unique: p5OaUhFGM6CPLivRF8Y5sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE5919200C3;
	Thu,  9 Jul 2020 10:52:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD1290E61;
	Thu,  9 Jul 2020 10:52:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD2AC1809554;
	Thu,  9 Jul 2020 10:52:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqIuQ000586 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D71CD114B2F8; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2529100405E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61BB3100E7C2
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-349-h7kAVh5CN6CUOiE2Hl4L9Q-1;
	Thu, 09 Jul 2020 06:52:15 -0400
X-MC-Unique: h7kAVh5CN6CUOiE2Hl4L9Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A12E1AEEE;
	Thu,  9 Jul 2020 10:52:13 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:34 +0200
Message-Id: <20200709105145.9211-11-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqIuQ000586
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 63/74] multipathd: deal with INIT_REMOVED during
	path addition
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

With the introduction of INIT_REMOVED, we have to deal with the situation
when a path is re-added in this state. This enables us to detect the
situation where a path is added while still part of a map after a failed
removal, which we couldn't before. Dealing with this correctly requires
some additional logic. There's a good case (re-added path is still mapped
by a map with matching WWID) and a bad case (non-matching WWID).

The logic is very similar in uev_add_path() and cli_add_path().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli_handlers.c | 49 +++++++++++++++++++++++++++++++++--
 multipathd/main.c         | 54 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 782bb00..679fd57 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -713,11 +713,56 @@ cli_add_path (void * v, char ** reply, int * len, void * data)
 		goto blacklisted;
 
 	pp = find_path_by_dev(vecs->pathvec, param);
-	if (pp) {
+	if (pp && pp->initialized != INIT_REMOVED) {
 		condlog(2, "%s: path already in pathvec", param);
 		if (pp->mpp)
 			return 0;
-	} else {
+	} else if (pp) {
+		/* Trying to add a path in INIT_REMOVED state */
+		struct multipath *prev_mpp;
+
+		prev_mpp = pp->mpp;
+		pp->mpp = NULL;
+		pp->initialized = INIT_NEW;
+		pp->wwid[0] = '\0';
+		conf = get_multipath_config();
+		pthread_cleanup_push(put_multipath_config, conf);
+		r = pathinfo(pp, conf, DI_ALL | DI_BLACKLIST);
+		pthread_cleanup_pop(1);
+
+		if (prev_mpp) {
+			/* Similar logic as in uev_add_path() */
+			pp->mpp = prev_mpp;
+			if (r == PATHINFO_OK &&
+			    !strncmp(prev_mpp->wwid, pp->wwid, WWID_SIZE)) {
+				condlog(2, "%s: path re-added to %s", pp->dev,
+					pp->mpp->alias);
+				return 0;
+			} else if (!ev_remove_path(pp, vecs, true))
+				/* Path removed in ev_remove_path() */
+				pp = NULL;
+			else {
+				/* Init state is now INIT_REMOVED again */
+				pp->dmstate = PSTATE_FAILED;
+				dm_fail_path(pp->mpp->alias, pp->dev_t);
+				condlog(1, "%s: failed to re-add path still mapped in %s",
+					pp->dev, pp->mpp->alias);
+				return 1;
+			}
+		} else {
+			switch (r) {
+			case PATHINFO_SKIPPED:
+				goto blacklisted;
+			case PATHINFO_OK:
+				break;
+			default:
+				condlog(0, "%s: failed to get pathinfo", param);
+				return 1;
+			}
+		}
+	}
+
+	if (!pp) {
 		struct udev_device *udevice;
 
 		udevice = udev_device_new_from_subsystem_sysname(udev,
diff --git a/multipathd/main.c b/multipathd/main.c
index 545eb6d..7b2d320 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -842,9 +842,21 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 	pp = find_path_by_dev(vecs->pathvec, uev->kernel);
 	if (pp) {
 		int r;
+		struct multipath *prev_mpp = NULL;
+		bool was_removed = pp->initialized == INIT_REMOVED;
+
+		if (was_removed) {
+			condlog(3, "%s: re-adding removed path", pp->dev);
+			pp->initialized = INIT_NEW;
+			prev_mpp = pp->mpp;
+			pp->mpp = NULL;
+			/* make sure get_uid() is called */
+			pp->wwid[0] = '\0';
+		} else
+			condlog(3,
+				"%s: spurious uevent, path already in pathvec",
+				uev->kernel);
 
-		condlog(3, "%s: spurious uevent, path already in pathvec",
-			uev->kernel);
 		if (!pp->mpp && !strlen(pp->wwid)) {
 			condlog(3, "%s: reinitialize path", uev->kernel);
 			udev_device_unref(pp->udev);
@@ -854,9 +866,43 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 			r = pathinfo(pp, conf,
 				     DI_ALL | DI_BLACKLIST);
 			pthread_cleanup_pop(1);
-			if (r == PATHINFO_OK)
+			if (r == PATHINFO_OK && !prev_mpp)
 				ret = ev_add_path(pp, vecs, need_do_map);
-			else if (r == PATHINFO_SKIPPED) {
+			else if (r == PATHINFO_OK &&
+				 !strncmp(pp->wwid, prev_mpp->wwid, WWID_SIZE)) {
+				/*
+				 * Path was unsuccessfully removed, but now
+				 * re-added, and still belongs to the right map
+				 * - all fine.
+				 */
+				pp->mpp = prev_mpp;
+				ret = 0;
+			} else if (prev_mpp) {
+				/*
+				 * Bad: re-added path still hangs in wrong map
+				 * Make another attempt to remove the path
+				 */
+				pp->mpp = prev_mpp;
+				ret = ev_remove_path(pp, vecs, true);
+				if (r == PATHINFO_OK && !ret)
+					/*
+					 * Path successfully freed, move on to
+					 * "new path" code path below
+					 */
+					pp = NULL;
+				else {
+					/*
+					 * Failure in ev_remove_path will keep
+					 * path in pathvec in INIT_REMOVED state
+					 * Fail the path to make sure it isn't
+					 * used any more.
+					 */
+					pp->dmstate = PSTATE_FAILED;
+					dm_fail_path(pp->mpp->alias, pp->dev_t);
+					condlog(1, "%s: failed to re-add path still mapped in %s",
+						pp->dev, pp->mpp->alias);
+				}
+			} else if (r == PATHINFO_SKIPPED) {
 				condlog(3, "%s: remove blacklisted path",
 					uev->kernel);
 				i = find_slot(vecs->pathvec, (void *)pp);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

