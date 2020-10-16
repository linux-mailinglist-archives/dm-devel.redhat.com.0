Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1D86290310
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:44:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-QaEnmUgiOj2unkzOkXaM1Q-1; Fri, 16 Oct 2020 06:44:14 -0400
X-MC-Unique: QaEnmUgiOj2unkzOkXaM1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC918064BE;
	Fri, 16 Oct 2020 10:44:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C92A5C22D;
	Fri, 16 Oct 2020 10:44:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9B47181A894;
	Fri, 16 Oct 2020 10:44:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhs0t020219 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0482201155E; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB34A2011559
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B03FF811E79
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-533-f7oclt19O5yN_Yf4YdJ4yg-1;
	Fri, 16 Oct 2020 06:43:52 -0400
X-MC-Unique: f7oclt19O5yN_Yf4YdJ4yg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 70029AF37;
	Fri, 16 Oct 2020 10:43:50 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:43:29 +0200
Message-Id: <20201016104329.8337-22-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhs0t020219
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 21/21] multipathd: remove logsink and udev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We can use the symbols from libmultipath now.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
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

