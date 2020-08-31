Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94AFE25897A
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-1wFUX4JxPByDWnuYeZwtZQ-1; Tue, 01 Sep 2020 03:44:09 -0400
X-MC-Unique: 1wFUX4JxPByDWnuYeZwtZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0014C801ADE;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FFF5C1C4;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 467AE181A720;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VBbSmq012254 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 07:37:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7AF21000DBD; Mon, 31 Aug 2020 11:37:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F13A110F759
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:37:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A007387EF64
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:37:25 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-lR8wrqS2Og-_-0HFL9KqMA-1; Mon, 31 Aug 2020 07:37:22 -0400
X-MC-Unique: lR8wrqS2Og-_-0HFL9KqMA-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C354EFE630CCE2F1CBFE;
	Mon, 31 Aug 2020 19:37:18 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 31 Aug 2020 19:37:12 +0800
To: Martin Wilck <mwilck@suse.com>
References: <50b2333d-8c5d-8705-a31a-11bb84980373@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <76528c71-f8b9-1595-edc1-e9061858a76f@huawei.com>
Date: Mon, 31 Aug 2020 19:37:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <50b2333d-8c5d-8705-a31a-11bb84980373@huawei.com>
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
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	zkabelac@redhat.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V4 2/5] multipathd: use daemon_status_msg to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US


sd_notify_status() is very similar with daemon_status(), except
DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
we can create the sd notification string in a dynamic buffer,
and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
we can use daemon_status_msg[state] for other cases.

V3->V4:
- put "STATUS=" in format string to avoid "prefix" var as suggested by
Martin.

V2->V3:
- set MSG_SIZE to 32 and use safe_sprintf as suggested by Martin.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 27c3a3ae..2ccf014a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -85,6 +85,7 @@

 #define FILE_NAME_SIZE 256
 #define CMDSIZE 160
+#define MSG_SIZE 32

 #define LOG_MSG(lvl, verb, pp)					\
 do {								\
@@ -177,30 +178,11 @@ daemon_status(void)
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
-	default:
-		return NULL;
-	}
-	return NULL;
-}
-
 static void do_sd_notify(enum daemon_status old_state,
 			 enum daemon_status new_state)
 {
+	char notify_msg[MSG_SIZE];
+	const char *msg;
 	/*
 	 * Checkerloop switches back and forth between idle and running state.
 	 * No need to tell systemd each time.
@@ -209,7 +191,14 @@ static void do_sd_notify(enum daemon_status old_state,
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
+	if (msg && !safe_sprintf(notify_msg, "STATUS=%s", msg))
+		sd_notify(0, notify_msg);
 }
 #endif

-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

