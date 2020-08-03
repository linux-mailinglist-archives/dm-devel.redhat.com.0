Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 62497239D84
	for <lists+dm-devel@lfdr.de>; Mon,  3 Aug 2020 04:40:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-SgVz3nWcMNKcSbjNyaj6oA-1; Sun, 02 Aug 2020 22:40:29 -0400
X-MC-Unique: SgVz3nWcMNKcSbjNyaj6oA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6621E57;
	Mon,  3 Aug 2020 02:40:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE8E10013C1;
	Mon,  3 Aug 2020 02:40:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE3691809554;
	Mon,  3 Aug 2020 02:40:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0732dogh011819 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 2 Aug 2020 22:39:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4552C82891; Mon,  3 Aug 2020 02:39:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 372C08289F
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:39:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6366D882640
	for <dm-devel@redhat.com>; Mon,  3 Aug 2020 02:39:47 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-lDgOFJCFOFCbxOZvazEmpQ-1; Sun, 02 Aug 2020 22:39:41 -0400
X-MC-Unique: lDgOFJCFOFCbxOZvazEmpQ-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id CEC536E7351FF901D46D;
	Mon,  3 Aug 2020 10:39:36 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 3 Aug 2020 10:39:30 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <94c8222f-a941-dee3-54eb-f243fd28b85a@huawei.com>
Date: Mon, 3 Aug 2020 10:39:29 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [dm- devel][PATCH] vector: fix upper boundary check of
 vector size in vector_del_slot
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In vector_del_slot func, legal value of input slot is in range of
[0, VECTOR_SIZE(v)), it means slot value should be less then VECTOR_SIZE(v).


Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/vector.c b/libmultipath/vector.c
index 501cf4c5..5b047e40 100644
--- a/libmultipath/vector.c
+++ b/libmultipath/vector.c
@@ -109,7 +109,7 @@ vector_del_slot(vector v, int slot)
 {
 	int i;

-	if (!v || !v->allocated || slot < 0 || slot > VECTOR_SIZE(v))
+	if (!v || !v->allocated || slot < 0 || slot >= VECTOR_SIZE(v))
 		return;

 	for (i = slot + 1; i < VECTOR_SIZE(v); i++)
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

