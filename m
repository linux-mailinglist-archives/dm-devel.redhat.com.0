Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A049E2400A7
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 03:16:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-T7XTQCz5ObOGjnqsKRiPnw-1; Sun, 09 Aug 2020 21:16:04 -0400
X-MC-Unique: T7XTQCz5ObOGjnqsKRiPnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6489F8064A9;
	Mon, 10 Aug 2020 01:15:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 593386931A;
	Mon, 10 Aug 2020 01:15:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E5A59693C;
	Mon, 10 Aug 2020 01:15:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07A1F8LO027726 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 9 Aug 2020 21:15:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90566117DB0C; Mon, 10 Aug 2020 01:15:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C464117DB0A
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 01:15:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EA46185A78B
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 01:15:06 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-233-Y1843ftiP3GL_odmmjc_8g-1; Sun, 09 Aug 2020 21:14:53 -0400
X-MC-Unique: Y1843ftiP3GL_odmmjc_8g-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9F56FA58850E64BD220E;
	Mon, 10 Aug 2020 09:14:48 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 10 Aug 2020 09:14:40 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	<christophe.varoqui@opensvc.com>, <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <9c67963b-477f-b3f5-8c8c-048de9357ff9@huawei.com>
Date: Mon, 10 Aug 2020 09:14:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
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
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [dm- devel][PATCH] checker: add input check of state in
 checker_state_name func
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


In checker_state_name func, we donot check whether input i
is valid. It may cause array access violation problem.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/checkers.c | 26 +++++++++++++++-----------
 libmultipath/checkers.h |  3 ++-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index c3cf53db..c91e1686 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -22,23 +22,27 @@ struct checker_class {
 	short msgtable_size;
 };

-char *checker_state_names[] = {
-	"wild",
-	"unchecked",
-	"down",
-	"up",
-	"shaky",
-	"ghost",
-	"pending",
-	"timeout",
-	"removed",
-	"delayed",
+static const char *checker_state_names[PATH_MAX_STATE] = {
+	[PATH_WILD] = "wild",
+	[PATH_UNCHECKED] = "unchecked",
+	[PATH_DOWN] = "down",
+	[PATH_UP] = "up",
+	[PATH_SHAKY] = "shaky",
+	[PATH_GHOST] = "ghost",
+	[PATH_PENDING] = "pending",
+	[PATH_TIMEOUT] = "timeout",
+	[PATH_REMOVED] = "removed",
+	[PATH_DELAYED] = "delayed",
 };

 static LIST_HEAD(checkers);

 const char *checker_state_name(int i)
 {
+	if (i < 0 || i >= PATH_MAX_STATE) {
+		condlog (2, "invalid state index = %d", i);
+		return INVALID;
+	}
 	return checker_state_names[i];
 }

diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
index 5237e7ec..93052b72 100644
--- a/libmultipath/checkers.h
+++ b/libmultipath/checkers.h
@@ -67,7 +67,7 @@
  *   During this time, it is marked as "delayed"
  */
 enum path_check_state {
-	PATH_WILD,
+	PATH_WILD = 0,
 	PATH_UNCHECKED,
 	PATH_DOWN,
 	PATH_UP,
@@ -88,6 +88,7 @@ enum path_check_state {
 #define READSECTOR0  "readsector0"
 #define CCISS_TUR    "cciss_tur"
 #define NONE         "none"
+#define INVALID      "invalid"

 #define ASYNC_TIMEOUT_SEC	30

-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

