Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AF645505BB
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DCAF5D619;
	Mon, 24 Jun 2019 09:30:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5608619729;
	Mon, 24 Jun 2019 09:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFC43206D4;
	Mon, 24 Jun 2019 09:30:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9T9nH004758 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 130785C225; Mon, 24 Jun 2019 09:29:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A12B5C22E;
	Mon, 24 Jun 2019 09:29:09 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 822D7C0578FA;
	Mon, 24 Jun 2019 09:29:00 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:50 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:31 +0200
Message-Id: <20190624092756.7769-7-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Mon, 24 Jun 2019 09:29:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 24 Jun 2019 09:29:00 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 06/30] multipath-tools: Fix more strncpy(X, Y,
	size - 1) calls
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 24 Jun 2019 09:30:49 +0000 (UTC)

The compiler emitted no warnings for these, but for consistency
it makes sense to fix them, too.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c | 2 +-
 libmultipath/configure.c        | 4 ++--
 libmultipath/prio.c             | 3 ++-
 libmultipath/structs_vec.c      | 3 ++-
 multipathd/waiter.c             | 3 ++-
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 4abcaed5..53022f5b 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -618,7 +618,7 @@ int send_prout_activepath(char * dev, int rq_servact, int rq_scope,
 	int rc;
 
 	memset(&thread, 0, sizeof(thread));
-	strncpy(param.dev, dev, FILE_NAME_SIZE - 1);
+	strlcpy(param.dev, dev, FILE_NAME_SIZE);
 	/* Initialize and set thread joinable attribute */
 	pthread_attr_init(&attr);
 	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 0648c0d6..52afa378 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -650,7 +650,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		if (cmpp) {
 			condlog(2, "%s: rename %s to %s", mpp->wwid,
 				cmpp->alias, mpp->alias);
-			strncpy(mpp->alias_old, cmpp->alias, WWID_SIZE - 1);
+			strlcpy(mpp->alias_old, cmpp->alias, WWID_SIZE);
 			mpp->action = ACT_RENAME;
 			if (force_reload) {
 				mpp->force_udev_reload = 1;
@@ -1257,7 +1257,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 			if (!deadmap(mpp))
 				continue;
 
-			strncpy(alias, mpp->alias, WWID_SIZE - 1);
+			strlcpy(alias, mpp->alias, WWID_SIZE);
 
 			vector_del_slot(newmp, i);
 			i--;
diff --git a/libmultipath/prio.c b/libmultipath/prio.c
index 0590218d..87de1f97 100644
--- a/libmultipath/prio.c
+++ b/libmultipath/prio.c
@@ -5,6 +5,7 @@
 #include <sys/stat.h>
 
 #include "debug.h"
+#include "util.h"
 #include "prio.h"
 
 static LIST_HEAD(prioritizers);
@@ -166,7 +167,7 @@ void prio_get (char *multipath_dir, struct prio * dst, char * name, char * args)
 
 	strncpy(dst->name, src->name, PRIO_NAME_LEN);
 	if (args)
-		strncpy(dst->args, args, PRIO_ARGS_LEN - 1);
+		strlcpy(dst->args, args, PRIO_ARGS_LEN);
 	dst->getprio = src->getprio;
 	dst->handle = NULL;
 
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index db5d19da..c43b58fb 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -2,6 +2,7 @@
 #include <string.h>
 #include <unistd.h>
 
+#include "util.h"
 #include "checkers.h"
 #include "vector.h"
 #include "defaults.h"
@@ -350,7 +351,7 @@ find_existing_alias (struct multipath * mpp,
 
 	vector_foreach_slot (vecs->mpvec, mp, i)
 		if (strncmp(mp->wwid, mpp->wwid, WWID_SIZE - 1) == 0) {
-			strncpy(mpp->alias_old, mp->alias, WWID_SIZE - 1);
+			strlcpy(mpp->alias_old, mp->alias, WWID_SIZE);
 			return;
 		}
 }
diff --git a/multipathd/waiter.c b/multipathd/waiter.c
index 5895f157..eb8d6996 100644
--- a/multipathd/waiter.c
+++ b/multipathd/waiter.c
@@ -11,6 +11,7 @@
 #include <signal.h>
 #include <urcu.h>
 
+#include "util.h"
 #include "vector.h"
 #include "memory.h"
 #include "checkers.h"
@@ -210,7 +211,7 @@ int start_waiter_thread (struct multipath *mpp, struct vectors *vecs)
 	if (!wp)
 		goto out;
 
-	strncpy(wp->mapname, mpp->alias, WWID_SIZE - 1);
+	strlcpy(wp->mapname, mpp->alias, WWID_SIZE);
 	wp->vecs = vecs;
 
 	if (pthread_create(&wp->thread, &waiter_attr, waitevent, wp)) {
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
