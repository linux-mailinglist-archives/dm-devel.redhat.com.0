Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71DD029034B
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:45:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-DcGDrZoYMsqfYaHKs6PS6A-1; Fri, 16 Oct 2020 06:45:32 -0400
X-MC-Unique: DcGDrZoYMsqfYaHKs6PS6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67FAD1019639;
	Fri, 16 Oct 2020 10:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FDF660C11;
	Fri, 16 Oct 2020 10:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFF9B58116;
	Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAjHdJ020661 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:45:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7360616C2DD; Fri, 16 Oct 2020 10:45:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0A016C2DB
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 565C580018D
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-327-cC7rJkeVMD-KSYaVJ9WkAw-1;
	Fri, 16 Oct 2020 06:45:14 -0400
X-MC-Unique: cC7rJkeVMD-KSYaVJ9WkAw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2CD8FAF68;
	Fri, 16 Oct 2020 10:45:12 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:44:39 +0200
Message-Id: <20201016104501.8700-8-mwilck@suse.com>
In-Reply-To: <20201016104501.8700-1-mwilck@suse.com>
References: <20201016104501.8700-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAjHdJ020661
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 07/29] multipathd: move conf destruction into
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 multipathd/main.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 8b9df55..722ef69 100644
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
@@ -3196,15 +3206,7 @@ child (__attribute__((unused)) void *param)
 
 	if (logsink == 1)
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

