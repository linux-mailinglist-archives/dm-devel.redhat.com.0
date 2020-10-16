Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6457629030B
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:44:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-p1Yu1kr3N1WXp8w1JISPNw-1; Fri, 16 Oct 2020 06:44:11 -0400
X-MC-Unique: p1Yu1kr3N1WXp8w1JISPNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 674C1803657;
	Fri, 16 Oct 2020 10:44:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CBA55798;
	Fri, 16 Oct 2020 10:44:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F38FE181A87F;
	Fri, 16 Oct 2020 10:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhsGA020203 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86D7B16C2DE; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 817CD16C2DA
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A6B58582B3
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-460-uuEZfA3OO2aYH5zom3kLYg-1;
	Fri, 16 Oct 2020 06:43:49 -0400
X-MC-Unique: uuEZfA3OO2aYH5zom3kLYg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6EEA2AF3D;
	Fri, 16 Oct 2020 10:43:46 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:43:15 +0200
Message-Id: <20201016104329.8337-8-mwilck@suse.com>
In-Reply-To: <20201016104329.8337-1-mwilck@suse.com>
References: <20201016104329.8337-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhsGA020203
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 07/21] multipathd: set_config_state(): avoid
	code duplication
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Use __post_config_state() and __wait_for_state_change(). This
way __post_config_state() is the only place where running_state
is ever changed, and we avoid code duplication.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 1fb0ee6..39aea4a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -292,27 +292,14 @@ int set_config_state(enum daemon_status state)
 	pthread_cleanup_push(config_cleanup, NULL);
 	pthread_mutex_lock(&config_lock);
 	if (running_state != state) {
-#ifdef USE_SYSTEMD
-		enum daemon_status old_state = running_state;
-#endif
 
 		if (running_state == DAEMON_SHUTDOWN)
 			rc = EINVAL;
-		else if (running_state != DAEMON_IDLE) {
-			struct timespec ts;
-
-			get_monotonic_time(&ts);
-			ts.tv_sec += 1;
-			rc = pthread_cond_timedwait(&config_cond,
-						    &config_lock, &ts);
-		}
-		if (!rc && (running_state != DAEMON_SHUTDOWN)) {
-			running_state = state;
-			pthread_cond_broadcast(&config_cond);
-#ifdef USE_SYSTEMD
-			do_sd_notify(old_state, state);
-#endif
-		}
+		else
+			rc = __wait_for_state_change(
+				running_state != DAEMON_IDLE, 1000);
+		if (!rc)
+			__post_config_state(state);
 	}
 	pthread_cleanup_pop(1);
 	return rc;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

