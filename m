Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A49D61401C4
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227548;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2E1y/MSxObOD3a97LQ4WnEslozilC9SFnr0+yriJJXw=;
	b=fHr0Kw2Ea+T3J4rpVy6m97i8GGVao+2cDdUvt7uqbq3TA3uaxUfBnB1mGn0h6+xaDWGNoX
	PJ4h/ewInntEkOTvb04DjtaieN1lmVBCoRlD4nUwLQEwTvts+dTfNtdVj9sg81thdlXABq
	h1vlpPMKHxrupsR2bGDvmNKK4umMP9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-K1_hxs2WMJ6n0wm_tkLzHA-1; Thu, 16 Jan 2020 21:19:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079FBDB30;
	Fri, 17 Jan 2020 02:18:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB7D21C947;
	Fri, 17 Jan 2020 02:18:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6011187085;
	Fri, 17 Jan 2020 02:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2Iotp030775 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 164285DA75; Fri, 17 Jan 2020 02:18:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B175D9C9;
	Fri, 17 Jan 2020 02:18:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IkJK017293; 
	Thu, 16 Jan 2020 20:18:46 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IjcG017292;
	Thu, 16 Jan 2020 20:18:45 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:19 -0600
Message-Id: <1579227500-17196-15-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 14/15] libmultipath: make directio checker share
	io contexts
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: K1_hxs2WMJ6n0wm_tkLzHA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On systems with a large number of cores (>500), io_destroy() can take
tens to hundreds of milliseconds to complete, due to RCU
synchronization. If there are a large number of paths using the directio
checker on such a system, this can lead to multipath taking almost a
minute to complete, with the vast majority of time taken up by
io_destroy().

To solve this, the directio checker now allocates one aio context for
every 1024 checkers. This reduces the io_destroy() delay to a thousandth
of its previous level. However, this means that muliple checkers are
sharing the same aio context, and must be able to handle getting results
for other checkers.  Because only one checker is ever running at a
time, this doesn't require any locking.  However, locking could be added
in the future if necessary, to allow multiple checkers to run at the
same time.

When checkers are freed, they usually no longer destroy the io context.
Instead, they attempt to cancel any outstanding request. If that fails,
they put the request on an orphan list, so that it can be freed by other
checkers, once it has completed. IO contexts are only destroyed at three
times, during reconfigure (to deal with the possibility that multipathd
is holding more aio events than it needs to be, since there is a single
limit for the whole system), when the checker class is unloaded, and
in a corner case when checkers are freed. If an aio_group (which
contains the aio context) is entirely full of orphaned requests, then
no checker can use it. Since no checker is using it, there is no checker
to clear out the orphaned requests. In this (likely rare) case, the
last checker from that group to be freed and leave behind an orphaned
request will call io_destroy() and remove the group.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/directio.c | 337 +++++++++++++++++++++++++------
 1 file changed, 278 insertions(+), 59 deletions(-)

diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
index 1b00b775..0863db2a 100644
--- a/libmultipath/checkers/directio.c
+++ b/libmultipath/checkers/directio.c
@@ -17,6 +17,33 @@
 
 #include "checkers.h"
 #include "../libmultipath/debug.h"
+#include "../libmultipath/time-util.h"
+
+#define AIO_GROUP_SIZE 1024
+
+/* Note: This checker type relies on the fact that only one checker can be run
+ * at a time, since multiple checkers share the same aio_group, and must be
+ * able to modify other checker's async_reqs. If multple checkers become able
+ * to be run at the same time, this checker will need to add locking, and
+ * probably polling on event fds, to deal with that */
+
+struct aio_group {
+	struct list_head node;
+	int holders;
+	io_context_t ioctx;
+	struct list_head orphans;
+};
+
+struct async_req {
+	struct iocb io;
+	int blksize;
+	unsigned char *	buf;
+	unsigned char * ptr;
+	struct list_head node;
+	int state; /* PATH_REMOVED means this is an orphan */
+};
+
+static LIST_HEAD(aio_grp_list);
 
 enum {
 	MSG_DIRECTIO_UNKNOWN = CHECKER_FIRST_MSGID,
@@ -37,18 +64,134 @@ const char *libcheck_msgtable[] = {
 struct directio_context {
 	int		running;
 	int		reset_flags;
-	int		blksize;
-	unsigned char *	buf;
-	unsigned char * ptr;
-	io_context_t	ioctx;
-	struct iocb	io;
+	struct aio_group *aio_grp;
+	struct async_req *req;
 };
 
+static struct aio_group *
+add_aio_group(void)
+{
+	struct aio_group *aio_grp;
+
+	aio_grp = malloc(sizeof(struct aio_group));
+	if (!aio_grp)
+		return NULL;
+	memset(aio_grp, 0, sizeof(struct aio_group));
+	INIT_LIST_HEAD(&aio_grp->orphans);
+
+	if (io_setup(AIO_GROUP_SIZE, &aio_grp->ioctx) != 0) {
+		LOG(1, "io_setup failed");
+		free(aio_grp);
+		return NULL;
+	}
+	list_add(&aio_grp->node, &aio_grp_list);
+	return aio_grp;
+}
+
+static int
+set_aio_group(struct directio_context *ct)
+{
+	struct aio_group *aio_grp = NULL;
+
+	list_for_each_entry(aio_grp, &aio_grp_list, node)
+		if (aio_grp->holders < AIO_GROUP_SIZE)
+			goto found;
+	aio_grp = add_aio_group();
+	if (!aio_grp) {
+		ct->aio_grp = NULL;
+		return -1;
+	}
+found:
+	aio_grp->holders++;
+	ct->aio_grp = aio_grp;
+	return 0;
+}
+
+static void
+remove_aio_group(struct aio_group *aio_grp)
+{
+	struct async_req *req, *tmp;
+
+	io_destroy(aio_grp->ioctx);
+	list_for_each_entry_safe(req, tmp, &aio_grp->orphans, node) {
+		list_del(&req->node);
+		free(req->buf);
+		free(req);
+	}
+	list_del(&aio_grp->node);
+	free(aio_grp);
+}
+
+/* If an aio_group is completely full of orphans, then no checkers can
+ * use it, which means that no checkers can clear out the orphans. To
+ * avoid keeping the useless group around, simply remove remove the
+ * group */
+static void
+check_orphaned_group(struct aio_group *aio_grp)
+{
+	int count = 0;
+	struct list_head *item;
+
+	if (aio_grp->holders < AIO_GROUP_SIZE)
+		return;
+	list_for_each(item, &aio_grp->orphans)
+		count++;
+	if (count >= AIO_GROUP_SIZE) {
+		remove_aio_group(aio_grp);
+		if (list_empty(&aio_grp_list))
+			add_aio_group();
+	}
+}
+
+int libcheck_load (void)
+{
+	if (add_aio_group() == NULL) {
+		LOG(1, "libcheck_load failed: %s", strerror(errno));
+		return 1;
+	}
+	return 0;
+}
+
+void libcheck_unload (void)
+{
+	struct aio_group *aio_grp, *tmp;
+
+	list_for_each_entry_safe(aio_grp, tmp, &aio_grp_list, node)
+		remove_aio_group(aio_grp);
+}
+
+int libcheck_reset (void)
+{
+	struct aio_group *aio_grp, *tmp, *reset_grp = NULL;
+
+	/* If a clean existing aio_group exists, use that. Otherwise add a
+	 * new one */
+	list_for_each_entry(aio_grp, &aio_grp_list, node) {
+		if (aio_grp->holders == 0 &&
+		    list_empty(&aio_grp->orphans)) {
+			reset_grp = aio_grp;
+			break;
+		}
+	}
+	if (!reset_grp)
+		reset_grp = add_aio_group();
+	if (!reset_grp) {
+		LOG(1, "checker reset failed");
+		return 1;
+	}
+
+	list_for_each_entry_safe(aio_grp, tmp, &aio_grp_list, node) {
+		if (aio_grp != reset_grp)
+			remove_aio_group(aio_grp);
+	}
+	return 0;
+}
 
 int libcheck_init (struct checker * c)
 {
 	unsigned long pgsize = getpagesize();
 	struct directio_context * ct;
+	struct async_req *req = NULL;
 	long flags;
 
 	ct = malloc(sizeof(struct directio_context));
@@ -56,26 +199,31 @@ int libcheck_init (struct checker * c)
 		return 1;
 	memset(ct, 0, sizeof(struct directio_context));
 
-	if (io_setup(1, &ct->ioctx) != 0) {
-		condlog(1, "io_setup failed");
-		free(ct);
-		return 1;
+	if (set_aio_group(ct) < 0)
+		goto out;
+
+	req = malloc(sizeof(struct async_req));
+	if (!req) {
+		goto out;
 	}
+	memset(req, 0, sizeof(struct async_req));
+	INIT_LIST_HEAD(&req->node);
 
-	if (ioctl(c->fd, BLKBSZGET, &ct->blksize) < 0) {
+	if (ioctl(c->fd, BLKBSZGET, &req->blksize) < 0) {
 		c->msgid = MSG_DIRECTIO_BLOCKSIZE;
-		ct->blksize = 512;
+		req->blksize = 512;
 	}
-	if (ct->blksize > 4096) {
+	if (req->blksize > 4096) {
 		/*
 		 * Sanity check for DASD; BSZGET is broken
 		 */
-		ct->blksize = 4096;
+		req->blksize = 4096;
 	}
-	if (!ct->blksize)
+	if (!req->blksize)
 		goto out;
-	ct->buf = (unsigned char *)malloc(ct->blksize + pgsize);
-	if (!ct->buf)
+
+	req->buf = (unsigned char *)malloc(req->blksize + pgsize);
+	if (!req->buf)
 		goto out;
 
 	flags = fcntl(c->fd, F_GETFL);
@@ -88,17 +236,22 @@ int libcheck_init (struct checker * c)
 		ct->reset_flags = 1;
 	}
 
-	ct->ptr = (unsigned char *) (((unsigned long)ct->buf + pgsize - 1) &
+	req->ptr = (unsigned char *) (((unsigned long)req->buf + pgsize - 1) &
 		  (~(pgsize - 1)));
 
 	/* Successfully initialized, return the context. */
+	ct->req = req;
 	c->context = (void *) ct;
 	return 0;
 
 out:
-	if (ct->buf)
-		free(ct->buf);
-	io_destroy(ct->ioctx);
+	if (req) {
+		if (req->buf)
+			free(req->buf);
+		free(req);
+	}
+	if (ct->aio_grp)
+		ct->aio_grp->holders--;
 	free(ct);
 	return 1;
 }
@@ -106,6 +259,7 @@ out:
 void libcheck_free (struct checker * c)
 {
 	struct directio_context * ct = (struct directio_context *)c->context;
+	struct io_event event;
 	long flags;
 
 	if (!ct)
@@ -121,20 +275,73 @@ void libcheck_free (struct checker * c)
 		}
 	}
 
-	if (ct->buf)
-		free(ct->buf);
-	io_destroy(ct->ioctx);
+	if (ct->running &&
+	    (ct->req->state != PATH_PENDING ||
+	     io_cancel(ct->aio_grp->ioctx, &ct->req->io, &event) == 0))
+		ct->running = 0;
+	if (!ct->running) {
+		free(ct->req->buf);
+		free(ct->req);
+		ct->aio_grp->holders--;
+	} else {
+		LOG(3, "io_cancel error while freeing: %i", errno);
+		ct->req->state = PATH_REMOVED;
+		list_add(&ct->req->node, &ct->aio_grp->orphans);
+		check_orphaned_group(ct->aio_grp);
+	}
+
 	free(ct);
+	c->context = NULL;
+}
+
+static int
+get_events(struct aio_group *aio_grp, struct timespec *timeout)
+{
+	struct io_event events[128];
+	int i, nr, got_events = 0;
+	struct timespec zero_timeout = {0};
+	struct timespec *timep = (timeout)? timeout : &zero_timeout;
+
+	do {
+		errno = 0;
+		nr = io_getevents(aio_grp->ioctx, 1, 128, events, timep);
+		got_events |= (nr > 0);
+
+		for (i = 0; i < nr; i++) {
+			struct async_req *req = container_of(events[i].obj, struct async_req, io);
+
+			LOG(3, "io finished %lu/%lu", events[i].res,
+			    events[i].res2);
+
+			/* got an orphaned request */
+			if (req->state == PATH_REMOVED) {
+				list_del(&req->node);
+				free(req->buf);
+				free(req);
+				aio_grp->holders--;
+			} else
+				req->state = (events[i].res == req->blksize) ?
+					      PATH_UP : PATH_DOWN;
+		}
+		timep = &zero_timeout;
+	} while (nr == 128); /* assume there are more events and try again */
+
+	if (nr < 0)
+		LOG(3, "async io getevents returned %i (errno=%s)",
+		    nr, strerror(errno));
+
+	return got_events;
 }
 
 static int
 check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 {
 	struct timespec	timeout = { .tv_nsec = 5 };
-	struct io_event event;
 	struct stat	sb;
-	int		rc = PATH_UNCHECKED;
+	int		rc;
 	long		r;
+	struct timespec currtime, endtime;
+	struct timespec *timep = &timeout;
 
 	if (fstat(fd, &sb) == 0) {
 		LOG(4, "called for %x", (unsigned) sb.st_rdev);
@@ -145,50 +352,62 @@ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 		timeout.tv_nsec = 0;
 	}
 
-	if (!ct->running) {
-		struct iocb *ios[1] = { &ct->io };
+	if (ct->running) {
+		if (ct->req->state != PATH_PENDING) {
+			ct->running = 0;
+			return ct->req->state;
+		}
+	} else {
+		struct iocb *ios[1] = { &ct->req->io };
 
 		LOG(3, "starting new request");
-		memset(&ct->io, 0, sizeof(struct iocb));
-		io_prep_pread(&ct->io, fd, ct->ptr, ct->blksize, 0);
-		if (io_submit(ct->ioctx, 1, ios) != 1) {
+		memset(&ct->req->io, 0, sizeof(struct iocb));
+		io_prep_pread(&ct->req->io, fd, ct->req->ptr,
+			      ct->req->blksize, 0);
+		ct->req->state = PATH_PENDING;
+		if (io_submit(ct->aio_grp->ioctx, 1, ios) != 1) {
 			LOG(3, "io_submit error %i", errno);
 			return PATH_UNCHECKED;
 		}
 	}
 	ct->running++;
 
-	errno = 0;
-	r = io_getevents(ct->ioctx, 1L, 1L, &event, &timeout);
+	get_monotonic_time(&endtime);
+	endtime.tv_sec += timeout.tv_sec;
+	endtime.tv_nsec += timeout.tv_nsec;
+	normalize_timespec(&endtime);
+	while(1) {
+		r = get_events(ct->aio_grp, timep);
 
-	if (r < 0 ) {
-		LOG(3, "async io getevents returned %li (errno=%s)", r,
-		    strerror(errno));
-		ct->running = 0;
-		rc = PATH_UNCHECKED;
-	} else if (r < 1L) {
-		if (ct->running > timeout_secs || sync) {
-			struct iocb *ios[1] = { &ct->io };
-
-			LOG(3, "abort check on timeout");
-			r = io_cancel(ct->ioctx, ios[0], &event);
-			/*
-			 * Only reset ct->running if we really
-			 * could abort the pending I/O
-			 */
-			if (r)
-				LOG(3, "io_cancel error %i", errno);
-			else
-				ct->running = 0;
-			rc = PATH_DOWN;
-		} else {
-			LOG(3, "async io pending");
-			rc = PATH_PENDING;
-		}
+		if (ct->req->state != PATH_PENDING) {
+			ct->running = 0;
+			return ct->req->state;
+		} else if (r == 0 || !timep)
+			break;
+
+		get_monotonic_time(&currtime);
+		timespecsub(&endtime, &currtime, &timeout);
+		if (timeout.tv_sec < 0)
+			timep = NULL;
+	}
+	if (ct->running > timeout_secs || sync) {
+		struct io_event event;
+
+		LOG(3, "abort check on timeout");
+
+		r = io_cancel(ct->aio_grp->ioctx, &ct->req->io, &event);
+		/*
+		 * Only reset ct->running if we really
+		 * could abort the pending I/O
+		 */
+		if (r)
+			LOG(3, "io_cancel error %i", errno);
+		else
+			ct->running = 0;
+		rc = PATH_DOWN;
 	} else {
-		LOG(3, "io finished %lu/%lu", event.res, event.res2);
-		ct->running = 0;
-		rc = (event.res == ct->blksize) ? PATH_UP : PATH_DOWN;
+		LOG(3, "async io pending");
+		rc = PATH_PENDING;
 	}
 
 	return rc;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

