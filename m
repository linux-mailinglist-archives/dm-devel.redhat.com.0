Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B33AE245CC6
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 09:01:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-VQ5KcEf2PSe0hPMFCf7m9Q-1; Mon, 17 Aug 2020 03:01:10 -0400
X-MC-Unique: VQ5KcEf2PSe0hPMFCf7m9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19ACF1014DEC;
	Mon, 17 Aug 2020 07:01:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B44B97D664;
	Mon, 17 Aug 2020 07:01:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0471B181A050;
	Mon, 17 Aug 2020 07:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G1iNhG024805 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 21:44:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27379114B9C2; Sun, 16 Aug 2020 01:44:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F83114B9C1
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89DD480121D
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:44:20 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-rz1tDE5dPSyrTf51KYj1cA-1; Sat, 15 Aug 2020 21:44:16 -0400
X-MC-Unique: rz1tDE5dPSyrTf51KYj1cA-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 1FDECBC783EBA25A2C6C;
	Sun, 16 Aug 2020 09:44:12 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 16 Aug 2020 09:44:04 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <2d7cd13e-d1df-5fc7-9403-1f845faf64d7@huawei.com>
Date: Sun, 16 Aug 2020 09:44:02 +0800
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
X-Mailman-Approved-At: Mon, 17 Aug 2020 03:00:28 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 3/6] multipathd: adopt static char* arr in
 sd_notify_status func
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


We adopt static char* array (sd_notify_status_msg) in
sd_notify_status func, so it looks more simpler and easier
to expand.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/main.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index cab1d0d..a09ccd1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -177,23 +177,21 @@ daemon_status(void)
  * I love you too, systemd ...
  */
 #ifdef USE_SYSTEMD
+static const char *sd_notify_status_msg[DAEMON_STATUS_SIZE] = {
+	[DAEMON_INIT] = "STATUS=init",
+	[DAEMON_START] = "STATUS=startup",
+	[DAEMON_CONFIGURE] = "STATUS=configure",
+	[DAEMON_IDLE] = "STATUS=up",
+	[DAEMON_RUNNING] = "STATUS=up",
+	[DAEMON_SHUTDOWN] = "STATUS=shutdown",
+};
+
 static const char *
 sd_notify_status(enum daemon_status state)
 {
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
+	if (state < DAEMON_INIT || state >= DAEMON_STATUS_SIZE)
+		return NULL;
+	return sd_notify_status_msg[state];
 }

 static void do_sd_notify(enum daemon_status old_state,
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

