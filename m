Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AB4D8EB4
	for <lists+dm-devel@lfdr.de>; Mon, 14 Mar 2022 22:32:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-OU52InABOCiudLMnSafzog-1; Mon, 14 Mar 2022 17:31:34 -0400
X-MC-Unique: OU52InABOCiudLMnSafzog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291F52999B38;
	Mon, 14 Mar 2022 21:31:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E625C1410DD5;
	Mon, 14 Mar 2022 21:31:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FC211956BBE;
	Mon, 14 Mar 2022 21:31:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA38E1953543
 for <dm-devel@listman.corp.redhat.com>; Mon, 14 Mar 2022 21:31:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93499C44AE5; Mon, 14 Mar 2022 21:31:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FAE5C44AE3
 for <dm-devel@redhat.com>; Mon, 14 Mar 2022 21:31:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 739663806736
 for <dm-devel@redhat.com>; Mon, 14 Mar 2022 21:31:21 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-npxBBDO5NYy0XB-LmbhtxQ-1; Mon, 14 Mar 2022 17:31:19 -0400
X-MC-Unique: npxBBDO5NYy0XB-LmbhtxQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7442121900;
 Mon, 14 Mar 2022 21:31:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3591E13B3D;
 Mon, 14 Mar 2022 21:31:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gJ8WCya0L2JBGwAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 14 Mar 2022 21:31:18 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Guozhonghua <guozh88@chinatelecom.cn>
Date: Mon, 14 Mar 2022 22:30:32 +0100
Message-Id: <20220314213036.12074-2-mwilck@suse.com>
In-Reply-To: <20220314213036.12074-1-mwilck@suse.com>
References: <20220314213036.12074-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH 1/5] multipathd: child(): remove superfluous if
 condition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

No need to test for state == DAEMON_CONFIGURE at this point, we
know that this is the case.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index f2c0b28..1c8839d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3395,6 +3395,8 @@ child (__attribute__((unused)) void *param)
 	pthread_attr_destroy(&misc_attr);
 
 	while (1) {
+		int rc = 0;
+
 		pthread_cleanup_push(config_cleanup, NULL);
 		pthread_mutex_lock(&config_lock);
 		while (running_state != DAEMON_CONFIGURE &&
@@ -3404,23 +3406,21 @@ child (__attribute__((unused)) void *param)
 		pthread_cleanup_pop(1);
 		if (state == DAEMON_SHUTDOWN)
 			break;
-		if (state == DAEMON_CONFIGURE) {
-			int rc = 0;
 
-			pthread_cleanup_push(cleanup_lock, &vecs->lock);
-			lock(&vecs->lock);
-			pthread_testcancel();
-			if (!need_to_delay_reconfig(vecs))
-				rc = reconfigure(vecs);
-			else
-				enable_delayed_reconfig();
-			lock_cleanup_pop(vecs->lock);
-			if (!rc)
-				post_config_state(DAEMON_IDLE);
-			else {
-				condlog(0, "fatal error applying configuration - aborting");
-				exit_daemon();
-			}
+		/* handle DAEMON_CONFIGURE */
+		pthread_cleanup_push(cleanup_lock, &vecs->lock);
+		lock(&vecs->lock);
+		pthread_testcancel();
+		if (!need_to_delay_reconfig(vecs))
+			rc = reconfigure(vecs);
+		else
+			enable_delayed_reconfig();
+		lock_cleanup_pop(vecs->lock);
+		if (!rc)
+			post_config_state(DAEMON_IDLE);
+		else {
+			condlog(0, "fatal error applying configuration - aborting");
+			exit_daemon();
 		}
 	}
 
-- 
2.35.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

