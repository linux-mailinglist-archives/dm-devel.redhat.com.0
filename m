Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42310259
	for <lists+dm-devel@lfdr.de>; Wed,  1 May 2019 00:28:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9A58C058CA4;
	Tue, 30 Apr 2019 22:28:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2ED52D6;
	Tue, 30 Apr 2019 22:28:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0E7D18089CB;
	Tue, 30 Apr 2019 22:28:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UMS2oL016154 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 18:28:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EF6618979; Tue, 30 Apr 2019 22:28:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C4C78DD8;
	Tue, 30 Apr 2019 22:28:00 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76F0C30ADBA6;
	Tue, 30 Apr 2019 22:27:58 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Tue, 30 Apr 2019 16:27:53 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed,  1 May 2019 00:27:34 +0200
Message-Id: <20190430222734.18060-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Tue, 30 Apr 2019 22:27:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 30 Apr 2019 22:27:59 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.301  (RCVD_IN_DNSWL_MED,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipathd: fix client response for socket
	activation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 30 Apr 2019 22:28:37 +0000 (UTC)

When a client wakes up multipathd through the socket, it is likely that the
ux listener responds to client requests before multipathd startup has
completed. This means that client commands such as "show paths" or "show
topology" return success with an empty result, which is quite confusing.

Therefore, in the ux listener, don't start answering client requests while
the daemon is configuring. Rather, wait for some other daemon state. We
can't wait hard, because the ux listener must also handle signals. So just
wait for some short time, and poll again.

This has the side effect that command responses for commands that don't
require full initialization, such as "show wildcards", "show config" or
"shutdown", are also delayed until the configuration stage has completed.
But that seems to be a relatively cheap price to pay for getting the
expected response for other commands. To avoid this side effect, the client
handling would need to be rewritten such that the uxlsnr thread would have
a means to "know" which commands require the configuration stage to
complete and which do not.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c   | 29 ++++++++++++++++++++++++++++-
 multipathd/main.h   |  2 ++
 multipathd/uxlsnr.c | 12 ++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index f203d77f..cf220499 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -220,6 +220,33 @@ static void config_cleanup(void *arg)
 	pthread_mutex_unlock(&config_lock);
 }
 
+/*
+ * If the current status is @oldstate, wait for at most @ms milliseconds
+ * for the state to change, and return the new state, which may still be
+ * @oldstate.
+ */
+enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
+					    unsigned long ms)
+{
+	enum daemon_status st;
+	struct timespec tmo;
+
+	if (oldstate == DAEMON_SHUTDOWN)
+		return DAEMON_SHUTDOWN;
+
+	pthread_mutex_lock(&config_lock);
+	pthread_cleanup_push(config_cleanup, NULL);
+	st = running_state;
+	if (st == oldstate && clock_gettime(CLOCK_MONOTONIC, &tmo) == 0) {
+		tmo.tv_nsec += ms * 1000 * 1000;
+		normalize_timespec(&tmo);
+		(void)pthread_cond_timedwait(&config_cond, &config_lock, &tmo);
+		st = running_state;
+	}
+	pthread_cleanup_pop(1);
+	return st;
+}
+
 /* must be called with config_lock held */
 static void __post_config_state(enum daemon_status state)
 {
@@ -2861,7 +2888,7 @@ child (void * param)
 	 */
 	conf = NULL;
 
-	pthread_cleanup_push(config_cleanup, NULL);
+	pthread_cleanup_push_cast(config_cleanup, NULL);
 	pthread_mutex_lock(&config_lock);
 
 	__post_config_state(DAEMON_IDLE);
diff --git a/multipathd/main.h b/multipathd/main.h
index e5c1398f..7bb8463f 100644
--- a/multipathd/main.h
+++ b/multipathd/main.h
@@ -20,6 +20,8 @@ extern int uxsock_timeout;
 
 void exit_daemon(void);
 const char * daemon_status(void);
+enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
+					    unsigned long ms);
 int need_to_delay_reconfig (struct vectors *);
 int reconfigure (struct vectors *);
 int ev_add_path (struct path *, struct vectors *, int);
diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 773bc878..04cbb7c7 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -249,6 +249,18 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 			continue;
 		}
 
+		/*
+		 * Client connection. We shouldn't answer while we're
+		 * configuring - nothing may be configured yet.
+		 * But we can't wait forever either, because this thread
+		 * must handle signals. So wait a short while only.
+		 */
+		if (wait_for_state_change_if(DAEMON_CONFIGURE, 10)
+		    == DAEMON_CONFIGURE) {
+			handle_signals(false);
+			continue;
+		}
+
 		/* see if a client wants to speak to us */
 		for (i = 1; i < num_clients + 1; i++) {
 			if (polls[i].revents & POLLIN) {
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
