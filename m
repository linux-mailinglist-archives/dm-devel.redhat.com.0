Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 37C5824DB62
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:39:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-7mv4czpQNRuNsObErfLvew-1; Fri, 21 Aug 2020 12:38:21 -0400
X-MC-Unique: 7mv4czpQNRuNsObErfLvew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD2081F03E;
	Fri, 21 Aug 2020 16:38:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB317AECB;
	Fri, 21 Aug 2020 16:38:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A392662C2;
	Fri, 21 Aug 2020 16:38:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LAxaoN012757 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 06:59:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BC12F5681; Fri, 21 Aug 2020 10:59:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55371F5698
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:59:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9BF389CD41
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 10:59:33 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-7ZjkPfQ8PoO96Ffx8XBEtw-1; Fri, 21 Aug 2020 06:59:31 -0400
X-MC-Unique: 7ZjkPfQ8PoO96Ffx8XBEtw-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 0E9D564152A61CD2F692;
	Fri, 21 Aug 2020 18:59:28 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 21 Aug 2020 18:59:21 +0800
To: <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "Christophe
	Varoqui" <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <8e3e5a81-dcd5-b3d5-41c7-2f443b854367@huawei.com>
Date: Fri, 21 Aug 2020 18:59:20 +0800
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
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V2 2/5] multipathd: use daemon_status_msg to
 construct sd notify msg in do_sd_notify func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


sd_notify_status() is very similar with daemon_status(), except
DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
we can create the sd notification string in a dynamic buffer,
and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
we can use daemon_status_msg[state] for other cases.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 62cf4ff4..4ba015bb 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -85,6 +85,7 @@

 #define FILE_NAME_SIZE 256
 #define CMDSIZE 160
+#define MSG_SIZE 64

 #define LOG_MSG(lvl, verb, pp)					\
 do {								\
@@ -177,28 +178,12 @@ daemon_status(void)
  * I love you too, systemd ...
  */
 #ifdef USE_SYSTEMD
-static const char *
-sd_notify_status(enum daemon_status state)
-{
-	switch (state) {
-	case DAEMON_INIT:
-		return "STATUS=init";
-	case DAEMON_START:
-		return "STATUS=startup";
-	case DAEMON_CONFIGURE:
-		return "STATUS=configure";
-	case DAEMON_IDLE:
-	case DAEMON_RUNNING:
-		return "STATUS=up";
-	case DAEMON_SHUTDOWN:
-		return "STATUS=shutdown";
-	}
-	return NULL;
-}
-
 static void do_sd_notify(enum daemon_status old_state,
 			 enum daemon_status new_state)
 {
+	char notify_msg[MSG_SIZE];
+	const char prefix[] = "STATUS=";
+	const char *msg = NULL;
 	/*
 	 * Checkerloop switches back and forth between idle and running state.
 	 * No need to tell systemd each time.
@@ -207,7 +192,18 @@ static void do_sd_notify(enum daemon_status old_state,
 	if ((new_state == DAEMON_IDLE || new_state == DAEMON_RUNNING) &&
 	    (old_state == DAEMON_IDLE || old_state == DAEMON_RUNNING))
 		return;
-	sd_notify(0, sd_notify_status(new_state));
+
+	if (new_state == DAEMON_IDLE || new_state == DAEMON_RUNNING)
+		msg = "up";
+	else
+		msg = daemon_status_msg[new_state];
+
+	if (snprintf(notify_msg, MSG_SIZE, "%s%s", prefix, msg) >= MSG_SIZE) {
+		condlog(2, "len of msg is should be shorter than %d", MSG_SIZE);
+		return;
+	}
+
+	sd_notify(0, notify_msg);
 }
 #endif

-- 
2.24.0.windows.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

