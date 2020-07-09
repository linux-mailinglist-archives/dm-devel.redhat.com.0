Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 77419219D7F
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-6a7qbVVBORq0tvONaAQC4A-1; Thu, 09 Jul 2020 06:17:48 -0400
X-MC-Unique: 6a7qbVVBORq0tvONaAQC4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2101083E8A;
	Thu,  9 Jul 2020 10:17:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C898061981;
	Thu,  9 Jul 2020 10:17:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BE691809554;
	Thu,  9 Jul 2020 10:17:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH27P029510 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7832A208DD80; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73EF42026D67
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 518EE188499C
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-122-3D9m3sOKPqGz6vVy6ywRqA-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: 3D9m3sOKPqGz6vVy6ywRqA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A2554B05D;
	Thu,  9 Jul 2020 10:16:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:02 +0200
Message-Id: <20200709101620.6786-18-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH27P029510
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 17/35] libmultipath: remove uevent listener
	failback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

TL;DR: this code is obsolete.

The failback code uses the udev 'RUN+="socket:"' technique, which
has been deprecated since udev 178 and removed since udev 183,
in 2012. The corresponding udev rule in multipath-tools has been removed
in ad067ac ("multipath: do not install rules file"), in 0.5.0 (2013).
Since that time, the failback code has been non-functional and basically
unmaintained.

While there's yet another fallback to the netlink socket, this 2nd fallback
would only be used if the socket(AF_LOCAL, ...) call failed, which would be
very unlikely. Even with the AF_LOCAL failback removed, leaving this 2nd
fallback in place doesn't make sense because it's just a reimplementation
of udev_monitor_new_from_netlink(); it's hard to imagine a case where the
latter would fail but our code would succeed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/uevent.c | 245 +-----------------------------------------
 libmultipath/uevent.h |   4 -
 2 files changed, 2 insertions(+), 247 deletions(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index e0d13b1..6a3f8bd 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -450,243 +450,6 @@ int uevent_dispatch(int (*uev_trigger)(struct uevent *, void * trigger_data),
 	return 0;
 }
 
-struct uevent *uevent_from_buffer(char *buf, ssize_t buflen)
-{
-	struct uevent *uev;
-	char *buffer;
-	size_t bufpos;
-	int i;
-	char *pos;
-
-	uev = alloc_uevent();
-	if (!uev) {
-		condlog(1, "lost uevent, oom");
-		return NULL;
-	}
-
-	if ((size_t)buflen > sizeof(buf)-1)
-		buflen = sizeof(buf)-1;
-
-	/*
-	 * Copy the shared receive buffer contents to buffer private
-	 * to this uevent so we can immediately reuse the shared buffer.
-	 */
-	memcpy(uev->buffer, buf, HOTPLUG_BUFFER_SIZE + OBJECT_SIZE);
-	buffer = uev->buffer;
-	buffer[buflen] = '\0';
-
-	/* save start of payload */
-	bufpos = strlen(buffer) + 1;
-
-	/* action string */
-	uev->action = buffer;
-	pos = strchr(buffer, '@');
-	if (!pos) {
-		condlog(3, "bad action string '%s'", buffer);
-		FREE(uev);
-		return NULL;
-	}
-	pos[0] = '\0';
-
-	/* sysfs path */
-	uev->devpath = &pos[1];
-
-	/* hotplug events have the environment attached - reconstruct envp[] */
-	for (i = 0; (bufpos < (size_t)buflen) && (i < HOTPLUG_NUM_ENVP-1); i++) {
-		int keylen;
-		char *key;
-
-		key = &buffer[bufpos];
-		keylen = strlen(key);
-		uev->envp[i] = key;
-		/* Filter out sequence number */
-		if (strncmp(key, "SEQNUM=", 7) == 0) {
-			char *eptr;
-
-			uev->seqnum = strtoul(key + 7, &eptr, 10);
-			if (eptr == key + 7)
-				uev->seqnum = -1;
-		}
-		bufpos += keylen + 1;
-	}
-	uev->envp[i] = NULL;
-
-	condlog(3, "uevent %ld '%s' from '%s'", uev->seqnum,
-		uev->action, uev->devpath);
-	uev->kernel = strrchr(uev->devpath, '/');
-	if (uev->kernel)
-		uev->kernel++;
-
-	/* print payload environment */
-	for (i = 0; uev->envp[i] != NULL; i++)
-		condlog(5, "%s", uev->envp[i]);
-
-	return uev;
-}
-
-int failback_listen(void)
-{
-	int sock;
-	struct sockaddr_nl snl;
-	struct sockaddr_un sun;
-	socklen_t addrlen;
-	int retval;
-	int rcvbufsz = 128*1024;
-	int rcvsz = 0;
-	int rcvszsz = sizeof(rcvsz);
-	unsigned int *prcvszsz = (unsigned int *)&rcvszsz;
-	const int feature_on = 1;
-	/*
-	 * First check whether we have a udev socket
-	 */
-	memset(&sun, 0x00, sizeof(struct sockaddr_un));
-	sun.sun_family = AF_LOCAL;
-	strcpy(&sun.sun_path[1], "/org/kernel/dm/multipath_event");
-	addrlen = offsetof(struct sockaddr_un, sun_path) + strlen(sun.sun_path+1) + 1;
-
-	sock = socket(AF_LOCAL, SOCK_DGRAM, 0);
-	if (sock >= 0) {
-
-		condlog(3, "reading events from udev socket.");
-
-		/* the bind takes care of ensuring only one copy running */
-		retval = bind(sock, (struct sockaddr *) &sun, addrlen);
-		if (retval < 0) {
-			condlog(0, "bind failed, exit");
-			goto exit;
-		}
-
-		/* enable receiving of the sender credentials */
-		retval = setsockopt(sock, SOL_SOCKET, SO_PASSCRED,
-				    &feature_on, sizeof(feature_on));
-		if (retval < 0) {
-			condlog(0, "failed to enable credential passing, exit");
-			goto exit;
-		}
-
-	} else {
-		/* Fallback to read kernel netlink events */
-		memset(&snl, 0x00, sizeof(struct sockaddr_nl));
-		snl.nl_family = AF_NETLINK;
-		snl.nl_pid = getpid();
-		snl.nl_groups = 0x01;
-
-		sock = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
-		if (sock == -1) {
-			condlog(0, "error getting socket, exit");
-			return 1;
-		}
-
-		condlog(3, "reading events from kernel.");
-
-		/*
-		 * try to avoid dropping uevents, even so, this is not a guarantee,
-		 * but it does help to change the netlink uevent socket's
-		 * receive buffer threshold from the default value of 106,496 to
-		 * the maximum value of 262,142.
-		 */
-		retval = setsockopt(sock, SOL_SOCKET, SO_RCVBUF, &rcvbufsz,
-				    sizeof(rcvbufsz));
-
-		if (retval < 0) {
-			condlog(0, "error setting receive buffer size for socket, exit");
-			exit(1);
-		}
-		retval = getsockopt(sock, SOL_SOCKET, SO_RCVBUF, &rcvsz, prcvszsz);
-		if (retval < 0) {
-			condlog(0, "error setting receive buffer size for socket, exit");
-			exit(1);
-		}
-		condlog(3, "receive buffer size for socket is %u.", rcvsz);
-
-		/* enable receiving of the sender credentials */
-		if (setsockopt(sock, SOL_SOCKET, SO_PASSCRED,
-			       &feature_on, sizeof(feature_on)) < 0) {
-			condlog(0, "error on enabling credential passing for socket");
-			exit(1);
-		}
-
-		retval = bind(sock, (struct sockaddr *) &snl,
-			      sizeof(struct sockaddr_nl));
-		if (retval < 0) {
-			condlog(0, "bind failed, exit");
-			goto exit;
-		}
-	}
-
-	while (1) {
-		size_t bufpos;
-		ssize_t buflen;
-		struct uevent *uev;
-		struct msghdr smsg;
-		struct iovec iov;
-		char cred_msg[CMSG_SPACE(sizeof(struct ucred))];
-		struct cmsghdr *cmsg;
-		struct ucred *cred;
-		static char buf[HOTPLUG_BUFFER_SIZE + OBJECT_SIZE];
-
-		memset(buf, 0x00, sizeof(buf));
-		iov.iov_base = &buf;
-		iov.iov_len = sizeof(buf);
-		memset (&smsg, 0x00, sizeof(struct msghdr));
-		smsg.msg_iov = &iov;
-		smsg.msg_iovlen = 1;
-		smsg.msg_control = cred_msg;
-		smsg.msg_controllen = sizeof(cred_msg);
-
-		buflen = recvmsg(sock, &smsg, 0);
-		if (buflen < 0) {
-			if (errno != EINTR)
-				condlog(0, "error receiving message, errno %d", errno);
-			continue;
-		}
-
-		cmsg = CMSG_FIRSTHDR(&smsg);
-		if (cmsg == NULL || cmsg->cmsg_type != SCM_CREDENTIALS) {
-			condlog(3, "no sender credentials received, message ignored");
-			continue;
-		}
-
-		cred = (struct ucred *)CMSG_DATA(cmsg);
-		if (cred->uid != 0) {
-			condlog(3, "sender uid=%d, message ignored", cred->uid);
-			continue;
-		}
-
-		/* skip header */
-		bufpos = strlen(buf) + 1;
-		if (bufpos < sizeof("a@/d") || bufpos >= sizeof(buf)) {
-			condlog(3, "invalid message length");
-			continue;
-		}
-
-		/* check message header */
-		if (strstr(buf, "@/") == NULL) {
-			condlog(3, "unrecognized message header");
-			continue;
-		}
-		if ((size_t)buflen > sizeof(buf)-1) {
-			condlog(2, "buffer overflow for received uevent");
-			buflen = sizeof(buf)-1;
-		}
-
-		uev = uevent_from_buffer(buf, buflen);
-		if (!uev)
-			continue;
-		/*
-		 * Queue uevent and poke service pthread.
-		 */
-		pthread_mutex_lock(uevq_lockp);
-		list_add_tail(&uev->node, &uevq);
-		pthread_cond_signal(uev_condp);
-		pthread_mutex_unlock(uevq_lockp);
-	}
-
-exit:
-	close(sock);
-	return 1;
-}
-
 struct uevent *uevent_from_udev_device(struct udev_device *dev)
 {
 	struct uevent *uev;
@@ -786,7 +549,6 @@ int uevent_listen(struct udev *udev)
 	struct udev_monitor *monitor = NULL;
 	int fd, socket_flags, events;
 	struct timeval start_time;
-	int need_failback = 1;
 	int timeout = 30;
 	LIST_HEAD(uevlisten_tmp);
 
@@ -806,7 +568,7 @@ int uevent_listen(struct udev *udev)
 	monitor = udev_monitor_new_from_netlink(udev, "udev");
 	if (!monitor) {
 		condlog(2, "failed to create udev monitor");
-		goto failback;
+		goto out_udev;
 	}
 	pthread_cleanup_push(monitor_cleanup, monitor);
 #ifdef LIBUDEV_API_RECVBUF
@@ -891,12 +653,9 @@ int uevent_listen(struct udev *udev)
 		gettimeofday(&start_time, NULL);
 		timeout = 30;
 	}
-	need_failback = 0;
 out:
 	pthread_cleanup_pop(1);
-failback:
-	if (need_failback)
-		err = failback_listen();
+out_udev:
 	pthread_cleanup_pop(1);
 	return err;
 }
diff --git a/libmultipath/uevent.h b/libmultipath/uevent.h
index 0aa8675..4956bfc 100644
--- a/libmultipath/uevent.h
+++ b/libmultipath/uevent.h
@@ -9,10 +9,6 @@
 #define HOTPLUG_NUM_ENVP		32
 #define OBJECT_SIZE			512
 
-#ifndef NETLINK_KOBJECT_UEVENT
-#define NETLINK_KOBJECT_UEVENT		15
-#endif
-
 struct udev;
 
 struct uevent {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

