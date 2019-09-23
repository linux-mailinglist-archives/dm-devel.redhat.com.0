Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E80E7BBC43
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 21:29:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD82130820C9;
	Mon, 23 Sep 2019 19:29:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AD7A6012D;
	Mon, 23 Sep 2019 19:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EFD53FA5E;
	Mon, 23 Sep 2019 19:29:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NJTMNH026866 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 15:29:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3125C601B6; Mon, 23 Sep 2019 19:29:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6136012D;
	Mon, 23 Sep 2019 19:29:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8NJTIjw006379; 
	Mon, 23 Sep 2019 14:29:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8NJTHSO006378;
	Mon, 23 Sep 2019 14:29:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 23 Sep 2019 14:29:16 -0500
Message-Id: <1569266956-6339-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] multipathd: warn when configuration has been
	changed.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 23 Sep 2019 19:29:54 +0000 (UTC)

It would be helpful if multipathd could log a message when
multipath.conf or files in the config_dir have been written to, both so
that it can be used to send a notification to users, and to help with
determining after the fact if multipathd was running with an older
config, when the logs of multipathd's behaviour don't match with the
current multipath.conf.

To do this, the multipathd uxlsnr thread now sets up inotify watches on
both /etc/multipath.conf and the config_dir to watch if the files are
deleted or closed after being opened for writing.  In order to keep
uxlsnr from polling repeatedly if the multipath.conf or the config_dir
aren't present, it will only set up the watches once per reconfigure.
However, since multipath.conf is far more likely to be replaced by a
text editor than modified in place, if it gets removed, multipathd will
immediately try to restart the watch on it (which will succeed if the
file was simply replaced by a new copy).  This does mean that if
multipath.conf or the config_dir are actually removed and then later
re-added, multipathd won't log any more messages for changes until the
next reconfigure. But that seems like a fair trade-off to avoid
repeatedly polling for files that aren't likely to appear.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h |   1 +
 multipathd/main.c     |   1 +
 multipathd/uxlsnr.c   | 134 ++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index ffec3103..e69aa07c 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -188,6 +188,7 @@ struct config {
 	int find_multipaths_timeout;
 	int marginal_pathgroups;
 	unsigned int version[3];
+	unsigned int sequence_nr;
 
 	char * multipath_dir;
 	char * selector;
diff --git a/multipathd/main.c b/multipathd/main.c
index 8826620d..7b7fe1b1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2609,6 +2609,7 @@ reconfigure (struct vectors * vecs)
 	uxsock_timeout = conf->uxsock_timeout;
 
 	old = rcu_dereference(multipath_conf);
+	conf->sequence_nr = old->sequence_nr + 1;
 	rcu_assign_pointer(multipath_conf, conf);
 	call_rcu(&old->rcu, rcu_free_config);
 
diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 04cbb7c7..f2ae2684 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -23,6 +23,7 @@
 #include <sys/time.h>
 #include <signal.h>
 #include <stdbool.h>
+#include <sys/inotify.h>
 #include "checkers.h"
 #include "memory.h"
 #include "debug.h"
@@ -51,6 +52,8 @@ struct client {
 LIST_HEAD(clients);
 pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
 struct pollfd *polls;
+int notify_fd = -1;
+char *config_dir;
 
 static bool _socket_client_is_root(int fd);
 
@@ -151,6 +154,8 @@ void uxsock_cleanup(void *arg)
 	long ux_sock = (long)arg;
 
 	close(ux_sock);
+	close(notify_fd);
+	free(config_dir);
 
 	pthread_mutex_lock(&client_lock);
 	list_for_each_entry_safe(client_loop, client_tmp, &clients, node) {
@@ -162,6 +167,106 @@ void uxsock_cleanup(void *arg)
 	free_polls();
 }
 
+/* failing to set the watch descriptor is o.k. we just miss a warning
+ * message */
+void reset_watch(int notify_fd, int *wds, unsigned int *sequence_nr)
+{
+	struct config *conf;
+	int dir_reset = 0;
+	int conf_reset = 0;
+
+	if (notify_fd == -1)
+		return;
+
+	conf = get_multipath_config();
+	/* instead of repeatedly try to reset the inotify watch if
+	 * the config directory or multipath.conf isn't there, just
+	 * do it once per reconfigure */
+	if (*sequence_nr != conf->sequence_nr) {
+		*sequence_nr = conf->sequence_nr;
+		if (wds[0] == -1)
+			conf_reset = 1;
+		if (!config_dir || !conf->config_dir ||
+		    strcmp(config_dir, conf->config_dir)) {
+			dir_reset = 1;
+			if (config_dir)
+				free(config_dir);
+			if (conf->config_dir)
+				config_dir = strdup(conf->config_dir);
+			else
+				config_dir = NULL;
+		} else if (wds[1] == -1)
+			dir_reset = 1;
+	}
+	put_multipath_config(conf);
+
+	if (dir_reset) {
+		if (wds[1] != -1) {
+			inotify_rm_watch(notify_fd, wds[1]);
+			wds[1] = -1;
+		}
+		if (config_dir) {
+			wds[1] = inotify_add_watch(notify_fd, config_dir,
+						   IN_CLOSE_WRITE | IN_DELETE |
+						   IN_ONLYDIR);
+			if (wds[1] == -1)
+				condlog(3, "didn't set up notifications on %s: %s", config_dir, strerror(errno));
+		}
+	}
+	if (conf_reset) {
+		wds[0] = inotify_add_watch(notify_fd, DEFAULT_CONFIGFILE,
+					   IN_CLOSE_WRITE);
+		if (wds[0] == -1)
+			condlog(3, "didn't set up notifications on /etc/multipath.conf: %s", strerror(errno));
+	}
+	return;
+}
+
+void handle_inotify(int fd, int  *wds)
+{
+	char buff[1024]
+		__attribute__ ((aligned(__alignof__(struct inotify_event))));
+	const struct inotify_event *event;
+	ssize_t len;
+	char *ptr;
+	int i, got_notify = 0;
+
+	for (;;) {
+		len = read(fd, buff, sizeof(buff));
+		if (len <= 0) {
+			if (len < 0 && errno != EAGAIN) {
+				condlog(3, "error reading from inotify_fd");
+				for (i = 0; i < 2; i++) {
+					if (wds[i] != -1) {
+						inotify_rm_watch(fd, wds[0]);
+						wds[i] = -1;
+					}
+				}
+			}
+			break;
+		}
+
+		got_notify = 1;
+		for (ptr = buff; ptr < buff + len;
+		     ptr += sizeof(struct inotify_event) + event->len) {
+			event = (const struct inotify_event *) ptr;
+
+			if (event->mask & IN_IGNORED) {
+				/* multipathd.conf may have been overwritten.
+				 * Try once to reset the notification */
+				if (wds[0] == event->wd)
+					wds[0] = inotify_add_watch(notify_fd,
+							DEFAULT_CONFIGFILE,
+							IN_CLOSE_WRITE);
+				else if (wds[1] == event->wd)
+					wds[1] = -1;
+			}
+		}
+	}
+	if (got_notify)
+		condlog(1, "Multipath configuration updated.\nReload multipathd for changes to take effect");
+}
+
 /*
  * entry point
  */
@@ -173,13 +278,19 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 	char *reply;
 	sigset_t mask;
 	int old_clients = MIN_POLLS;
+	/* conf->sequence_nr will be 1 when uxsock_listen is first called */
+	unsigned int sequence_nr = 0;
+	int wds[2] = { -1, -1 };
 
 	condlog(3, "uxsock: startup listener");
-	polls = (struct pollfd *)MALLOC((MIN_POLLS + 1) * sizeof(struct pollfd));
+	polls = (struct pollfd *)MALLOC((MIN_POLLS + 2) * sizeof(struct pollfd));
 	if (!polls) {
 		condlog(0, "uxsock: failed to allocate poll fds");
 		exit_daemon();
 	}
+	notify_fd = inotify_init1(IN_NONBLOCK);
+	if (notify_fd == -1) /* it's fine if notifications fail */
+		condlog(3, "failed to start up configuration notifications");
 	sigfillset(&mask);
 	sigdelset(&mask, SIGINT);
 	sigdelset(&mask, SIGTERM);
@@ -198,18 +309,18 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		if (num_clients != old_clients) {
 			struct pollfd *new;
 			if (num_clients <= MIN_POLLS && old_clients > MIN_POLLS) {
-				new = REALLOC(polls, (1 + MIN_POLLS) *
+				new = REALLOC(polls, (2 + MIN_POLLS) *
 						sizeof(struct pollfd));
 			} else if (num_clients <= MIN_POLLS && old_clients <= MIN_POLLS) {
 				new = polls;
 			} else {
-				new = REALLOC(polls, (1+num_clients) *
+				new = REALLOC(polls, (2 + num_clients) *
 						sizeof(struct pollfd));
 			}
 			if (!new) {
 				pthread_mutex_unlock(&client_lock);
 				condlog(0, "%s: failed to realloc %d poll fds",
-					"uxsock", 1 + num_clients);
+					"uxsock", 2 + num_clients);
 				sched_yield();
 				continue;
 			}
@@ -219,8 +330,15 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		polls[0].fd = ux_sock;
 		polls[0].events = POLLIN;
 
+		reset_watch(notify_fd, wds, &sequence_nr);
+		if (notify_fd == -1 || (wds[0] == -1 && wds[1] == -1))
+			polls[1].fd = -1;
+		else
+			polls[1].fd = notify_fd;
+		polls[1].events = POLLIN;
+
 		/* setup the clients */
-		i = 1;
+		i = 2;
 		list_for_each_entry(c, &clients, node) {
 			polls[i].fd = c->fd;
 			polls[i].events = POLLIN;
@@ -262,7 +380,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		}
 
 		/* see if a client wants to speak to us */
-		for (i = 1; i < num_clients + 1; i++) {
+		for (i = 2; i < num_clients + 2; i++) {
 			if (polls[i].revents & POLLIN) {
 				struct timespec start_time;
 
@@ -323,6 +441,10 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		if (polls[0].revents & POLLIN) {
 			new_client(ux_sock);
 		}
+
+		/* handle inotify events on config files */
+		if (polls[1].revents & POLLIN)
+			handle_inotify(notify_fd, wds);
 	}
 
 	return NULL;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
