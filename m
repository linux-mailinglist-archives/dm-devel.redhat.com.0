Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7D45FFC9
	for <lists+dm-devel@lfdr.de>; Sat, 27 Nov 2021 16:22:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-LgteZcZuNS6Abwtx-3qLLA-1; Sat, 27 Nov 2021 10:22:46 -0500
X-MC-Unique: LgteZcZuNS6Abwtx-3qLLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADE4D8042F7;
	Sat, 27 Nov 2021 15:22:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EFB076613;
	Sat, 27 Nov 2021 15:22:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CD01473D1;
	Sat, 27 Nov 2021 15:22:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ARFJrmZ032757 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Nov 2021 10:19:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 732DE404727A; Sat, 27 Nov 2021 15:19:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EE64047272
	for <dm-devel@redhat.com>; Sat, 27 Nov 2021 15:19:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DCDC101AA63
	for <dm-devel@redhat.com>; Sat, 27 Nov 2021 15:19:53 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-275-s7KRTiagObSTPNuLqAOoqw-1; Sat, 27 Nov 2021 10:19:49 -0500
X-MC-Unique: s7KRTiagObSTPNuLqAOoqw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE9812171F;
	Sat, 27 Nov 2021 15:19:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9259813AB0;
	Sat, 27 Nov 2021 15:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id OHWVIZNMomErFgAAMHmgww
	(envelope-from <mwilck@suse.com>); Sat, 27 Nov 2021 15:19:47 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 27 Nov 2021 16:19:09 +0100
Message-Id: <20211127151929.7727-17-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1ARFJrmZ032757
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 16/35] multipathd: uxlsnr: use symbolic values
	for pollfd indices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Avoid hardcoding the indices as 0, 1, 2...

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/uxlsnr.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 9a6ab72..a0653f6 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -45,8 +45,13 @@ struct client {
 	int fd;
 };
 
-/* The number of fds we poll on, other than individual client connections */
-#define POLLFDS_BASE 2
+/* Indices for array of poll fds */
+enum {
+	POLLFD_UX = 0,
+	POLLFD_NOTIFY,
+	POLLFDS_BASE,
+};
+
 #define POLLFD_CHUNK (4096 / sizeof(struct pollfd))
 /* Minimum mumber of pollfds to reserve for clients */
 #define MIN_POLLS (POLLFD_CHUNK - POLLFDS_BASE)
@@ -338,8 +343,8 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 			}
 		}
 		if (num_clients < MAX_CLIENTS) {
-			polls[0].fd = ux_sock;
-			polls[0].events = POLLIN;
+			polls[POLLFD_UX].fd = ux_sock;
+			polls[POLLFD_UX].events = POLLIN;
 		} else {
 			/*
 			 * New clients can't connect, num_clients won't grow
@@ -347,15 +352,15 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 			 */
 			condlog(1, "%s: max client connections reached, pausing polling",
 				__func__);
-			polls[0].fd = -1;
+			polls[POLLFD_UX].fd = -1;
 		}
 
 		reset_watch(notify_fd, &wds, &sequence_nr);
 		if (notify_fd == -1 || (wds.conf_wd == -1 && wds.dir_wd == -1))
-			polls[1].fd = -1;
+			polls[POLLFD_NOTIFY].fd = -1;
 		else
-			polls[1].fd = notify_fd;
-		polls[1].events = POLLIN;
+			polls[POLLFD_NOTIFY].fd = notify_fd;
+		polls[POLLFD_NOTIFY].events = POLLIN;
 
 		/* setup the clients */
 		i = POLLFDS_BASE;
@@ -453,12 +458,12 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 		handle_signals(true);
 
 		/* see if we got a new client */
-		if (polls[0].revents & POLLIN) {
+		if (polls[POLLFD_UX].revents & POLLIN) {
 			new_client(ux_sock);
 		}
 
 		/* handle inotify events on config files */
-		if (polls[1].revents & POLLIN)
+		if (polls[POLLFD_NOTIFY].revents & POLLIN)
 			handle_inotify(notify_fd, &wds);
 	}
 
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

