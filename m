Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 42947245531
	for <lists+dm-devel@lfdr.de>; Sun, 16 Aug 2020 03:43:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-nI0Te3CQM6W4l_thk7KM_w-1; Sat, 15 Aug 2020 21:43:13 -0400
X-MC-Unique: nI0Te3CQM6W4l_thk7KM_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5BF2106F8DB;
	Sun, 16 Aug 2020 01:43:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79602194B9;
	Sun, 16 Aug 2020 01:43:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAC774EE19;
	Sun, 16 Aug 2020 01:43:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G1h4c0024032 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 21:43:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F218B114B9C2; Sun, 16 Aug 2020 01:43:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB82114B9C1
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:43:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67C5C8007D1
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:43:01 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-444-udK3ODjJMG2zrhBrT2ejtw-1; Sat, 15 Aug 2020 21:42:56 -0400
X-MC-Unique: udK3ODjJMG2zrhBrT2ejtw-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 1DA83E0DADB4414D154E;
	Sun, 16 Aug 2020 09:42:51 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 16 Aug 2020 09:42:45 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <b6e1e24f-5695-f29f-ce88-bff2d5e3fac1@huawei.com>
Date: Sun, 16 Aug 2020 09:42:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [PATCH 2/6] multipathd: adopt static char* arr in
	daemon_status
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


We adopt static char* array (demon_status_msg) in daemon_status func,
so it looks more simpler and easier to expand.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 30 +++++++++++++++---------------
 multipathd/main.h |  3 ++-
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 9ec6585..cab1d0d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -153,24 +153,24 @@ static volatile sig_atomic_t exit_sig;
 static volatile sig_atomic_t reconfig_sig;
 static volatile sig_atomic_t log_reset_sig;

+static const char *demon_status_msg[DAEMON_STATUS_SIZE] = {
+	[DAEMON_INIT] = "init",
+	[DAEMON_START] = "startup",
+	[DAEMON_CONFIGURE] = "configure",
+	[DAEMON_IDLE] = "idle",
+	[DAEMON_RUNNING] = "running",
+	[DAEMON_SHUTDOWN] = "shutdown",
+};
+
 const char *
 daemon_status(void)
 {
-	switch (get_running_state()) {
-	case DAEMON_INIT:
-		return "init";
-	case DAEMON_START:
-		return "startup";
-	case DAEMON_CONFIGURE:
-		return "configure";
-	case DAEMON_IDLE:
-		return "idle";
-	case DAEMON_RUNNING:
-		return "running";
-	case DAEMON_SHUTDOWN:
-		return "shutdown";
-	}
-	return NULL;
+	enum daemon_status status = get_running_state();
+
+	if (status < DAEMON_INIT || status >= DAEMON_STATUS_SIZE)
+		return NULL;
+
+	return demon_status_msg[status];
 }

 /*
diff --git a/multipathd/main.h b/multipathd/main.h
index 5dff17e..6a5592c 100644
--- a/multipathd/main.h
+++ b/multipathd/main.h
@@ -4,12 +4,13 @@
 #define MAPGCINT 5

 enum daemon_status {
-	DAEMON_INIT,
+	DAEMON_INIT = 0,
 	DAEMON_START,
 	DAEMON_CONFIGURE,
 	DAEMON_IDLE,
 	DAEMON_RUNNING,
 	DAEMON_SHUTDOWN,
+	DAEMON_STATUS_SIZE,
 };

 struct prout_param_descriptor;
-- 
1.8.3.1



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

