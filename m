Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EC27B24554D
	for <lists+dm-devel@lfdr.de>; Sun, 16 Aug 2020 03:47:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-u766JTOHMLS9RjAHKcR1RA-1; Sat, 15 Aug 2020 21:47:32 -0400
X-MC-Unique: u766JTOHMLS9RjAHKcR1RA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30FFD106B81E;
	Sun, 16 Aug 2020 01:47:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F12F74E36;
	Sun, 16 Aug 2020 01:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33CAC18408A1;
	Sun, 16 Aug 2020 01:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07G1krEB025440 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 21:46:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67688114B9C2; Sun, 16 Aug 2020 01:46:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62F76114B9C1
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:46:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC624811E79
	for <dm-devel@redhat.com>; Sun, 16 Aug 2020 01:46:50 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-mWSz8sulM6mVkyRuVhtjXg-1; Sat, 15 Aug 2020 21:46:46 -0400
X-MC-Unique: mWSz8sulM6mVkyRuVhtjXg-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 296593FBE733226DEBA7;
	Sun, 16 Aug 2020 09:46:39 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 16 Aug 2020 09:46:30 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <a0d6c479-7802-eb30-9f5d-0075ca1397f9@huawei.com>
Date: Sun, 16 Aug 2020 09:46:29 +0800
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
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>,
	liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 6/6] multipathd: return NULL if MALLOC fails in
 alloc_waiteri, func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In alloc_waiter func, if MALLOC fails, wp is equal to NULL.
If now we call memset(wp), segmentation fault will occur.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 multipathd/waiter.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/multipathd/waiter.c b/multipathd/waiter.c
index e645766..80e6e6e 100644
--- a/multipathd/waiter.c
+++ b/multipathd/waiter.c
@@ -33,8 +33,10 @@ static struct event_thread *alloc_waiter (void)
 	struct event_thread *wp;

 	wp = (struct event_thread *)MALLOC(sizeof(struct event_thread));
-	memset(wp, 0, sizeof(struct event_thread));
+	if (!wp)
+		return NULL;

+	memset(wp, 0, sizeof(struct event_thread));
 	return wp;
 }

-- 
1.8.3.1



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

