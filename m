Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A955B2772FA
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-De0xFFyeOUurmt_uIym1Jg-1; Thu, 24 Sep 2020 09:46:12 -0400
X-MC-Unique: De0xFFyeOUurmt_uIym1Jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1118181F00B;
	Thu, 24 Sep 2020 13:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB8D5578B;
	Thu, 24 Sep 2020 13:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 418A31826D2C;
	Thu, 24 Sep 2020 13:46:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfkcf026838 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8143511921BB; Thu, 24 Sep 2020 13:41:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C281009BBD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9F6811E82
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-380-E3U_g6EJNS6hwdRwGYzC4A-1;
	Thu, 24 Sep 2020 09:41:40 -0400
X-MC-Unique: E3U_g6EJNS6hwdRwGYzC4A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 971B2B123;
	Thu, 24 Sep 2020 13:41:38 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:38 +0200
Message-Id: <20200924134054.14632-8-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfkcf026838
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 07/23] multipathd: move conf destruction into
	separate function
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

Also removing the comment about dlog() and dm_write_log().
dlog() can cope with get_multipath_config() returning NULL,
and dm_write_log() hasn't accessed the configuration for a while.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 8b9df55..4d5b40b 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2892,6 +2892,16 @@ set_oom_adj (void)
 	condlog(0, "couldn't adjust oom score");
 }
 
+static void cleanup_conf(void) {
+	struct config *conf;
+
+	conf = rcu_dereference(multipath_conf);
+	if (!conf)
+		return;
+	rcu_assign_pointer(multipath_conf, NULL);
+	call_rcu(&conf->rcu, rcu_free_config);
+}
+
 static void cleanup_maps(struct vectors *vecs)
 {
 	int queue_without_daemon, i;
@@ -3194,17 +3204,11 @@ child (__attribute__((unused)) void *param)
 
 	condlog(2, "--------shut down-------");
 
-	if (logsink == 1)
+	if (logsink == 1) {
+		logsink = 0;
 		log_thread_stop();
-
-	/*
-	 * Freeing config must be done after condlog() and dm_lib_exit(),
-	 * because logging functions like dlog() and dm_write_log()
-	 * reference the config.
-	 */
-	conf = rcu_dereference(multipath_conf);
-	rcu_assign_pointer(multipath_conf, NULL);
-	call_rcu(&conf->rcu, rcu_free_config);
+	}
+	cleanup_conf();
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

