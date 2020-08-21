Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB87F24D361
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 12:59:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-S9OrrbG8N5eYJFQfiS0SAA-1; Fri, 21 Aug 2020 06:59:14 -0400
X-MC-Unique: S9OrrbG8N5eYJFQfiS0SAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6218B1007469;
	Fri, 21 Aug 2020 10:59:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20D135C89C;
	Fri, 21 Aug 2020 10:59:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C659181A06B;
	Fri, 21 Aug 2020 10:58:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LAwiUk012684 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 06:58:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 898E8EE84D; Fri, 21 Aug 2020 10:58:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 859ABF5598
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:58:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 241DA811E7A
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:58:42 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-563-Fzd7QobsPoSEWznNyuJbdA-1; Fri, 21 Aug 2020 06:58:38 -0400
X-MC-Unique: Fzd7QobsPoSEWznNyuJbdA-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 2F3D4C07D719994DB57F;
	Fri, 21 Aug 2020 18:58:31 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 21 Aug 2020 18:58:20 +0800
To: <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "Christophe
	Varoqui" <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <b2c96dc6-1e01-beb2-0ccb-22e1d0d980a6@huawei.com>
Date: Fri, 21 Aug 2020 18:58:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V2 1/5] multipathd: adopt static char* arr in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


We adopt static char* array (demon_status_msg) in daemon_status func,
so it looks more simpler and easier to expand.

V1->V2:
- use "int" as the type of "status" (suggested by Martin)

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 30 +++++++++++++++---------------
 multipathd/main.h |  3 ++-
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 9ec65856..62cf4ff4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -153,24 +153,24 @@ static volatile sig_atomic_t exit_sig;
 static volatile sig_atomic_t reconfig_sig;
 static volatile sig_atomic_t log_reset_sig;

+static const char *daemon_status_msg[DAEMON_STATUS_SIZE] = {
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
+	int status = get_running_state();
+
+	if (status < DAEMON_INIT || status >= DAEMON_STATUS_SIZE)
+		return NULL;
+
+	return daemon_status_msg[status];
 }

 /*
diff --git a/multipathd/main.h b/multipathd/main.h
index 5dff17e5..6a5592c0 100644
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
2.24.0.windows.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

