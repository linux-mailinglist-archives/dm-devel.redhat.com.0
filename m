Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C911406AD1
	for <lists+dm-devel@lfdr.de>; Fri, 10 Sep 2021 13:43:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-fTiX05dlNn-7u-NsOwahdQ-1; Fri, 10 Sep 2021 07:43:22 -0400
X-MC-Unique: fTiX05dlNn-7u-NsOwahdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E63218B312A;
	Fri, 10 Sep 2021 11:43:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 120CA18FD2;
	Fri, 10 Sep 2021 11:43:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5D341806D00;
	Fri, 10 Sep 2021 11:43:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ABgwu6010162 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 07:42:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 930871FA848; Fri, 10 Sep 2021 11:42:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE281FA849
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77FA3800182
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:58 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-534-h2Ou1qfuN1urtWyvl8wEEA-1; Fri, 10 Sep 2021 07:42:56 -0400
X-MC-Unique: h2Ou1qfuN1urtWyvl8wEEA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67CC82020A;
	Fri, 10 Sep 2021 11:42:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BA4313D34;
	Fri, 10 Sep 2021 11:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id wIOyBL9EO2GPOAAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 10 Sep 2021 11:42:55 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 10 Sep 2021 13:41:00 +0200
Message-Id: <20210910114120.13665-16-mwilck@suse.com>
In-Reply-To: <20210910114120.13665-1-mwilck@suse.com>
References: <20210910114120.13665-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18ABgwu6010162
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 15/35] multipathd: uxlsnr: avoid stalled clients
	during reconfigure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Since 47cc1d3 ("multipathd: fix client response for socket
activation"), we hold back clients while reconfigure is running.
The idea of 47cc1d3 was to fix the behavior during initial
start up. When multipathd reconfigures itself during runtime,
and the reconfiguration takes a long time (a minute or more is
not unusual in big configurations), clients will time out with
no response ("timeout receiving packet"). Waiting for reconfigure
to finish breaks our timeout handling.

Therefore we should only apply the logic of 47cc1d3 during initial
configuration. In this case, the client that triggered socket
activation may still encounter a timeout, but there's not much we can
do about that.

Fixes: 47cc1d3 ("multipathd: fix client response for socket activation")
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c   |  9 +++++++++
 multipathd/uxlsnr.c | 12 ------------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 6d7c8c9..c6357ef 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1695,6 +1695,15 @@ uxlsnrloop (void * ap)
 
 	init_handler_callbacks();
 	umask(077);
+
+	/*
+	 * Wait for initial reconfiguration to finish, while
+	 * hadling signals
+	 */
+	while (wait_for_state_change_if(DAEMON_CONFIGURE, 50)
+	       == DAEMON_CONFIGURE)
+		handle_signals(false);
+
 	uxsock_listen(&uxsock_trigger, ux_sock, ap);
 
 out_sock:
diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index dbee0d6..20efbd3 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -391,18 +391,6 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 			continue;
 		}
 
-		/*
-		 * Client connection. We shouldn't answer while we're
-		 * configuring - nothing may be configured yet.
-		 * But we can't wait forever either, because this thread
-		 * must handle signals. So wait a short while only.
-		 */
-		if (wait_for_state_change_if(DAEMON_CONFIGURE, 10)
-		    == DAEMON_CONFIGURE) {
-			handle_signals(false);
-			continue;
-		}
-
 		/* see if a client wants to speak to us */
 		for (i = POLLFDS_BASE; i < n_pfds; i++) {
 			if (polls[i].revents & POLLIN) {
-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

