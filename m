Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF8442772B5
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:40:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-lvtsjBYUMAmsNWjcij-U_A-1; Thu, 24 Sep 2020 09:40:00 -0400
X-MC-Unique: lvtsjBYUMAmsNWjcij-U_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80D90100856C;
	Thu, 24 Sep 2020 13:39:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5955D9D2;
	Thu, 24 Sep 2020 13:39:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DDB91826D30;
	Thu, 24 Sep 2020 13:39:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdYhr026102 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EA42110E8C; Thu, 24 Sep 2020 13:39:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A3FF1140EA
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82DA418AE949
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-272-TPqWEq95P9ihxt1almX9ew-1;
	Thu, 24 Sep 2020 09:39:29 -0400
X-MC-Unique: TPqWEq95P9ihxt1almX9ew-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D3C1EB119;
	Thu, 24 Sep 2020 13:39:27 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:16 +0200
Message-Id: <20200924133716.14120-22-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdYhr026102
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 21/21] multipathd: remove logsink and udev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We can use the symbols from libmultipath now.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 00b66ba..c5c374b 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -115,7 +115,6 @@ struct mpath_event_param
 	struct multipath *mpp;
 };
 
-int logsink;
 int uxsock_timeout;
 int verbosity;
 int bindings_read_only;
@@ -151,8 +150,6 @@ int should_exit(void)
  */
 struct vectors * gvecs;
 
-struct udev * udev;
-
 struct config *multipath_conf;
 
 /* Local variables */
@@ -3123,8 +3120,6 @@ child (__attribute__((unused)) void *param)
 	conf = rcu_dereference(multipath_conf);
 	rcu_assign_pointer(multipath_conf, NULL);
 	call_rcu(&conf->rcu, rcu_free_config);
-	udev_unref(udev);
-	udev = NULL;
 	pthread_attr_destroy(&waiter_attr);
 	pthread_attr_destroy(&io_err_stat_attr);
 #ifdef _DEBUG_
@@ -3228,7 +3223,9 @@ main (int argc, char *argv[])
 
 	pthread_cond_init_mono(&config_cond);
 
-	udev = udev_new();
+	libmultipath_init();
+	if (atexit(libmultipath_exit))
+		condlog(3, "failed to register exit handler for libmultipath");
 	libmp_udev_set_sync_support(0);
 
 	while ((arg = getopt(argc, argv, ":dsv:k::Bniw")) != EOF ) {
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

