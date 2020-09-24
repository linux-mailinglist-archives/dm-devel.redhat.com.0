Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A58FA277334
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:56:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-JzEMlxEhP0GrM-XpIfU5_Q-1; Thu, 24 Sep 2020 09:56:20 -0400
X-MC-Unique: JzEMlxEhP0GrM-XpIfU5_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559AA801E53;
	Thu, 24 Sep 2020 13:56:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E93061002C06;
	Thu, 24 Sep 2020 13:56:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 404F58C7A1;
	Thu, 24 Sep 2020 13:56:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfkRR026837 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8309E11921D8; Thu, 24 Sep 2020 13:41:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AC9C118DF5D
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8121811E7A
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-254-bUCmMBcIOBGC2G6b44lieQ-1;
	Thu, 24 Sep 2020 09:41:41 -0400
X-MC-Unique: bUCmMBcIOBGC2G6b44lieQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7341CB126;
	Thu, 24 Sep 2020 13:41:39 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:41 +0200
Message-Id: <20200924134054.14632-11-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfkRR026837
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 09:56:00 -0400
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 10/23] multipathd: add helper for systemd
	notification at exit
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add sd_notify_exit().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 44c1bd1..e742aa5 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3023,6 +3023,17 @@ static void cleanup_rcu(int dummy __attribute__((unused)), void *arg)
 	rcu_unregister_thread();
 }
 
+static int sd_notify_exit(int err)
+{
+#ifdef USE_SYSTEMD
+	char msg[24];
+
+	snprintf(msg, sizeof(msg), "ERRNO=%d", err);
+	sd_notify(0, msg);
+#endif
+	return err;
+}
+
 static int
 child (__attribute__((unused)) void *param)
 {
@@ -3218,19 +3229,12 @@ child (__attribute__((unused)) void *param)
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-
-#ifdef USE_SYSTEMD
-	sd_notify(0, "ERRNO=0");
-#endif
-	exit(0);
+	exit(sd_notify_exit(0));
 
 failed:
-#ifdef USE_SYSTEMD
-	sd_notify(0, "ERRNO=1");
-#endif
 	if (pid_fd >= 0)
 		close(pid_fd);
-	exit(1);
+	exit(sd_notify_exit(1));
 }
 
 static int
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

