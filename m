Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6A460F0D
	for <lists+dm-devel@lfdr.de>; Mon, 29 Nov 2021 07:56:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-N7XV0Sg8NT--7fu_rUgNSQ-1; Mon, 29 Nov 2021 01:56:36 -0500
X-MC-Unique: N7XV0Sg8NT--7fu_rUgNSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B976418C89CC;
	Mon, 29 Nov 2021 06:56:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0E25D9C0;
	Mon, 29 Nov 2021 06:56:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98C974BB7C;
	Mon, 29 Nov 2021 06:56:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ARFJu8j000378 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Nov 2021 10:19:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C4182026D69; Sat, 27 Nov 2021 15:19:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D3D2026D65
	for <dm-devel@redhat.com>; Sat, 27 Nov 2021 15:19:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B55A101AA63
	for <dm-devel@redhat.com>; Sat, 27 Nov 2021 15:19:56 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-104-pXqM7HBFMtivYbppDDXuhA-1; Sat, 27 Nov 2021 10:19:54 -0500
X-MC-Unique: pXqM7HBFMtivYbppDDXuhA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19D1021639;
	Sat, 27 Nov 2021 15:19:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BECEB13AAD;
	Sat, 27 Nov 2021 15:19:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id EIdfLJhMomErFgAAMHmgww
	(envelope-from <mwilck@suse.com>); Sat, 27 Nov 2021 15:19:52 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 27 Nov 2021 16:19:23 +0100
Message-Id: <20211127151929.7727-31-mwilck@suse.com>
In-Reply-To: <20211127151929.7727-1-mwilck@suse.com>
References: <20211127151929.7727-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1ARFJu8j000378
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Nov 2021 01:55:52 -0500
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 30/35] multipathd: uxlsnr: add idle
	notification
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The previous patches added the state machine and the timeout handling,
but there was no wakeup mechanism for the uxlsnr for cases where
client connections were waiting for the vecs lock.

This patch uses the previously introduced wakeup mechanism of
struct mutex_lock for this purpose. Processes which unlock the
"global" vecs lock send an event in an eventfd which the uxlsnr
loop is polling for.

As we are now woken up for servicing client handlers that don't
wait for input but for the lock, we need to set up the pollfds
differently, and iterate over all clients when handling events,
not only over the ones that are receiving. The hangup handling
is changed, too. We have to look at every client, even if one has
hung up. Note that I don't take client_lock for the loop in
uxsock_listen(), it's not necessary and will be removed elsewhere
in a follow-up patch.

With this in place, the lock need not be taken in execute_handler()
any more. The uxlsnr only ever calls trylock() on the vecs lock,
avoiding any waiting for other threads to finish.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/uxlsnr.c | 183 +++++++++++++++++++++++++++++---------------
 1 file changed, 121 insertions(+), 62 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index c393477..f559a23 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -24,6 +24,7 @@
 #include <signal.h>
 #include <stdbool.h>
 #include <sys/inotify.h>
+#include <sys/eventfd.h>
 #include "checkers.h"
 #include "debug.h"
 #include "vector.h"
@@ -69,6 +70,7 @@ struct client {
 enum {
 	POLLFD_UX = 0,
 	POLLFD_NOTIFY,
+	POLLFD_IDLE,
 	POLLFDS_BASE,
 };
 
@@ -89,6 +91,7 @@ static LIST_HEAD(clients);
 static pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
 static struct pollfd *polls;
 static int notify_fd = -1;
+static int idle_fd = -1;
 static char *watch_config_dir;
 
 static bool _socket_client_is_root(int fd)
@@ -187,6 +190,17 @@ void uxsock_cleanup(void *arg)
 	free_polls();
 }
 
+void wakeup_cleanup(void *arg)
+{
+	struct mutex_lock *lck = arg;
+	int fd = idle_fd;
+
+	idle_fd = -1;
+	set_wakeup_fn(lck, NULL);
+	if (fd != -1)
+		close(fd);
+}
+
 struct watch_descriptors {
 	int conf_wd;
 	int dir_wd;
@@ -293,6 +307,18 @@ static void handle_inotify(int fd, struct watch_descriptors *wds)
 
 static const struct timespec ts_zero = { .tv_sec = 0, };
 
+/* call with clients lock held */
+static bool __need_vecs_lock(void)
+{
+	struct client *c;
+
+	list_for_each_entry(c, &clients, node) {
+		if (c->state == CLT_LOCKED_WORK)
+			return true;
+	}
+	return false;
+}
+
 static int parse_cmd(struct client *c)
 {
 	int r;
@@ -310,40 +336,31 @@ static int parse_cmd(struct client *c)
 	return r;
 }
 
-static int execute_handler(struct client *c, struct vectors *vecs, int timeout)
+static int execute_handler(struct client *c, struct vectors *vecs)
 {
-	int r;
-	struct timespec tmo;
 
-	if (!c->handler)
+	if (!c->handler || !c->handler->fn)
 		return -EINVAL;
 
-	if (clock_gettime(CLOCK_REALTIME, &tmo) == 0) {
-		tmo.tv_sec += timeout;
-	} else {
-		tmo.tv_sec = 0;
-	}
+	return c->handler->fn(c->cmdvec, &c->reply, vecs);
+}
 
-	if (c->handler->locked) {
-		int locked = 0;
+static void wakeup_listener(void)
+{
+	uint64_t one = 1;
 
-		pthread_cleanup_push(cleanup_lock, &vecs->lock);
-		if (tmo.tv_sec) {
-			r = timedlock(&vecs->lock, &tmo);
-		} else {
-			lock(&vecs->lock);
-			r = 0;
-		}
-		if (r == 0) {
-			locked = 1;
-			pthread_testcancel();
-			r = c->handler->fn(c->cmdvec, &c->reply, vecs);
-		}
-		pthread_cleanup_pop(locked);
-	} else
-		r = c->handler->fn(c->cmdvec, &c->reply, vecs);
+	if (idle_fd != -1 &&
+	    write(idle_fd, &one, sizeof(one)) != sizeof(one))
+		condlog(1, "%s: failed", __func__);
+}
 
-	return r;
+static void drain_idle_fd(int fd)
+{
+	uint64_t val;
+	int rc;
+
+	rc = read(fd, &val, sizeof(val));
+	condlog(4, "%s: %d, %"PRIu64, __func__, rc, val);
 }
 
 void default_reply(struct client *c, int r)
@@ -397,16 +414,19 @@ enum {
 	STM_BREAK,
 };
 
-static int client_state_machine(struct client *c, struct vectors *vecs)
+static int client_state_machine(struct client *c, struct vectors *vecs,
+				short revents)
 {
 	ssize_t n;
 	const char *buf;
 
-	condlog(4, "%s: cli[%d] state=%d cmd=\"%s\" repl \"%s\"", __func__,
-		c->fd, c->state, c->cmd, get_strbuf_str(&c->reply));
+	condlog(4, "%s: cli[%d] poll=%x state=%d cmd=\"%s\" repl \"%s\"", __func__,
+		c->fd, revents, c->state, c->cmd, get_strbuf_str(&c->reply));
 
 	switch (c->state) {
 	case CLT_RECV:
+		if (!(revents & POLLIN))
+			return STM_BREAK;
 		if (c->cmd_len == 0) {
 			/*
 			 * We got POLLIN; assume that at least the length can
@@ -462,17 +482,30 @@ static int client_state_machine(struct client *c, struct vectors *vecs)
 		}
 		if (c->error)
 			set_client_state(c, CLT_SEND);
+		else if (c->handler->locked)
+			set_client_state(c, CLT_LOCKED_WORK);
 		else
 			set_client_state(c, CLT_WORK);
 		return STM_CONT;
 
 	case CLT_LOCKED_WORK:
-		/* tbd */
-		set_client_state(c, CLT_WORK);
-		return STM_CONT;
+                if (trylock(&vecs->lock) == 0) {
+			/* don't use cleanup_lock(), lest we wakeup ourselves */
+			pthread_cleanup_push_cast(__unlock, &vecs->lock);
+			c->error = execute_handler(c, vecs);
+			pthread_cleanup_pop(1);
+			condlog(4, "%s: cli[%d] grabbed lock", __func__, c->fd);
+			free_keys(c->cmdvec);
+			c->cmdvec = NULL;
+			set_client_state(c, CLT_SEND);
+			return STM_CONT;
+		} else {
+			condlog(4, "%s: cli[%d] waiting for lock", __func__, c->fd);
+			return STM_BREAK;
+		}
 
 	case CLT_WORK:
-		c->error = execute_handler(c, vecs, uxsock_timeout / 1000);
+		c->error = execute_handler(c, vecs);
 		free_keys(c->cmdvec);
 		c->cmdvec = NULL;
 		set_client_state(c, CLT_SEND);
@@ -499,9 +532,14 @@ static int client_state_machine(struct client *c, struct vectors *vecs)
 	}
 }
 
-static void handle_client(struct client *c, struct vectors *vecs)
+static void handle_client(struct client *c, struct vectors *vecs, short revents)
 {
-	while (client_state_machine(c, vecs) == STM_CONT);
+	if (revents & (POLLHUP|POLLERR)) {
+		c->error = -ECONNRESET;
+		return;
+	}
+
+        while (client_state_machine(c, vecs, revents) == STM_CONT);
 }
 
 /*
@@ -514,6 +552,8 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
 	/* conf->sequence_nr will be 1 when uxsock_listen is first called */
 	unsigned int sequence_nr = 0;
 	struct watch_descriptors wds = { .conf_wd = -1, .dir_wd = -1 };
+	bool need_lock = false;
+	struct vectors *vecs = trigger_data;
 
 	condlog(3, "uxsock: startup listener");
 	polls = calloc(1, max_pfds * sizeof(*polls));
@@ -524,6 +564,15 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
 	notify_fd = inotify_init1(IN_NONBLOCK);
 	if (notify_fd == -1) /* it's fine if notifications fail */
 		condlog(3, "failed to start up configuration notifications");
+
+	pthread_cleanup_push(wakeup_cleanup, &vecs->lock);
+	idle_fd = eventfd(0, EFD_NONBLOCK|EFD_CLOEXEC);
+	if (idle_fd == -1) {
+		condlog(1, "failed to create idle fd");
+		exit_daemon();
+	} else
+		set_wakeup_fn(&vecs->lock, wakeup_listener);
+
 	sigfillset(&mask);
 	sigdelset(&mask, SIGINT);
 	sigdelset(&mask, SIGTERM);
@@ -575,11 +624,25 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
 		else
 			polls[POLLFD_NOTIFY].events = POLLIN;
 
+		need_lock = __need_vecs_lock();
+		polls[POLLFD_IDLE].fd = idle_fd;
+		if (need_lock)
+			polls[POLLFD_IDLE].events = POLLIN;
+		else
+			polls[POLLFD_IDLE].events = 0;
+
 		/* setup the clients */
 		i = POLLFDS_BASE;
 		list_for_each_entry(c, &clients, node) {
+			switch(c->state) {
+			case CLT_RECV:
+				polls[i].events = POLLIN;
+				break;
+			default:
+				/* don't poll for this client */
+				continue;
+			}
 			polls[i].fd = c->fd;
-			polls[i].events = POLLIN;
 			i++;
 			if (i >= max_pfds)
 				break;
@@ -607,33 +670,28 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
 			handle_signals(true);
 			continue;
 		}
+		if (polls[POLLFD_IDLE].fd != -1 &&
+		    polls[POLLFD_IDLE].revents & POLLIN)
+			drain_idle_fd(idle_fd);
 
-		/* see if a client wants to speak to us */
-		for (i = POLLFDS_BASE; i < n_pfds; i++) {
-			if (polls[i].revents & (POLLIN|POLLHUP|POLLERR)) {
-				c = NULL;
-				pthread_mutex_lock(&client_lock);
-				list_for_each_entry(tmp, &clients, node) {
-					if (tmp->fd == polls[i].fd) {
-						c = tmp;
-						break;
-					}
+		/* see if a client needs handling */
+		list_for_each_entry_safe(c, tmp, &clients, node) {
+			short revents = 0;
+
+			for (i = POLLFDS_BASE; i < n_pfds; i++) {
+				if (polls[i].fd == c->fd) {
+					revents = polls[i].revents;
+					break;
 				}
-				pthread_mutex_unlock(&client_lock);
-				if (!c) {
-					condlog(4, "cli%d: new fd %d",
-						i, polls[i].fd);
-					continue;
-				}
-				if (polls[i].revents & (POLLHUP|POLLERR)) {
-					condlog(4, "cli[%d]: Disconnected",
-						c->fd);
-					dead_client(c);
-					continue;
-				}
-				handle_client(c, trigger_data);
-				if (c->error == -ECONNRESET)
-					dead_client(c);
+			}
+
+			handle_client(c, trigger_data, revents);
+
+			if (c->error == -ECONNRESET) {
+				condlog(4, "cli[%d]: disconnected", c->fd);
+				dead_client(c);
+				if (i < n_pfds)
+					polls[i].fd = -1;
 			}
 		}
 		/* see if we got a non-fatal signal */
@@ -649,5 +707,6 @@ void *uxsock_listen(long ux_sock, void *trigger_data)
 			handle_inotify(notify_fd, &wds);
 	}
 
+	pthread_cleanup_pop(1);
 	return NULL;
 }
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

