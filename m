Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 645142772E5
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:45:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-lZiOxgK4OVijU1BE-ZduSg-1; Thu, 24 Sep 2020 09:45:13 -0400
X-MC-Unique: lZiOxgK4OVijU1BE-ZduSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14E661008549;
	Thu, 24 Sep 2020 13:45:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB04A1974D;
	Thu, 24 Sep 2020 13:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AC678C7A6;
	Thu, 24 Sep 2020 13:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfjc3026812 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A12EF2166B27; Thu, 24 Sep 2020 13:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 994AC2166BA0
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A13B900C65
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-40-lxbF0UjWO9GBWM_JTCRKRg-1;
	Thu, 24 Sep 2020 09:41:38 -0400
X-MC-Unique: lxbF0UjWO9GBWM_JTCRKRg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D9BB7B083;
	Thu, 24 Sep 2020 13:41:36 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:32 +0200
Message-Id: <20200924134054.14632-2-mwilck@suse.com>
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
References: <20200924134054.14632-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfjc3026812
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 01/23] multipathd: uxlsnr: avoid deadlock on exit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The uxlsnr wouldn't always release the client lock when cancelled,
causing a deadlock in uxsock_cleanup(). While this hasn't been
caused by commit 3d611a2, the deadlock seems to have become much
more likely after that patch. Solving this means that we have to
treat reallocation failure of the pollfd array differently.
We will now just ignore any clients above the last valid pfd index.
That's a minor problem, as we're in an OOM situation anyway.

Moreover, client_lock is not a "struct lock", but a plain
pthread_mutex_t.

Fixes: 3d611a2 ("multipathd: cancel threads early during shutdown")
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/uxlsnr.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 1c5ce9d..d47ba1a 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -35,6 +35,7 @@
 #include "config.h"
 #include "mpath_cmd.h"
 #include "time-util.h"
+#include "util.h"
 
 #include "main.h"
 #include "cli.h"
@@ -116,7 +117,7 @@ static void _dead_client(struct client *c)
 
 static void dead_client(struct client *c)
 {
-	pthread_cleanup_push(cleanup_lock, &client_lock);
+	pthread_cleanup_push(cleanup_mutex, &client_lock);
 	pthread_mutex_lock(&client_lock);
 	_dead_client(c);
 	pthread_cleanup_pop(1);
@@ -306,6 +307,7 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 
 		/* setup for a poll */
 		pthread_mutex_lock(&client_lock);
+		pthread_cleanup_push(cleanup_mutex, &client_lock);
 		num_clients = 0;
 		list_for_each_entry(c, &clients, node) {
 			num_clients++;
@@ -322,14 +324,13 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 						sizeof(struct pollfd));
 			}
 			if (!new) {
-				pthread_mutex_unlock(&client_lock);
 				condlog(0, "%s: failed to realloc %d poll fds",
 					"uxsock", 2 + num_clients);
-				sched_yield();
-				continue;
+				num_clients = old_clients;
+			} else {
+				old_clients = num_clients;
+				polls = new;
 			}
-			old_clients = num_clients;
-			polls = new;
 		}
 		polls[0].fd = ux_sock;
 		polls[0].events = POLLIN;
@@ -347,8 +348,10 @@ void * uxsock_listen(uxsock_trigger_fn uxsock_trigger, long ux_sock,
 			polls[i].fd = c->fd;
 			polls[i].events = POLLIN;
 			i++;
+			if (i >= 2 + num_clients)
+				break;
 		}
-		pthread_mutex_unlock(&client_lock);
+		pthread_cleanup_pop(1);
 
 		/* most of our life is spent in this call */
 		poll_count = ppoll(polls, i, &sleep_time, &mask);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

