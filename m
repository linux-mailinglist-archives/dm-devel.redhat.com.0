Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0C997234432
	for <lists+dm-devel@lfdr.de>; Fri, 31 Jul 2020 12:43:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-UVirnvTJNNySbu4cDP7jBA-1; Fri, 31 Jul 2020 06:43:04 -0400
X-MC-Unique: UVirnvTJNNySbu4cDP7jBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0657518839C0;
	Fri, 31 Jul 2020 10:42:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 569C487B16;
	Fri, 31 Jul 2020 10:42:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2CEB1809554;
	Fri, 31 Jul 2020 10:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VAgGb3024371 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 06:42:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C5D8F5AC1; Fri, 31 Jul 2020 10:42:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77497F5AC2
	for <dm-devel@redhat.com>; Fri, 31 Jul 2020 10:42:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EAFE8008A5
	for <dm-devel@redhat.com>; Fri, 31 Jul 2020 10:42:14 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-e3TzsP83O-qelmUT_wFSGg-1; Fri, 31 Jul 2020 06:42:09 -0400
X-MC-Unique: e3TzsP83O-qelmUT_wFSGg-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id E3A88D384F893B4E6FC0;
	Fri, 31 Jul 2020 18:42:04 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 31 Jul 2020 18:41:59 +0800
To: <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	<christophe.varoqui@opensvc.com>, <kabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <a04e1267-0f1c-3a8b-c163-1697469ffeca@huawei.com>
Date: Fri, 31 Jul 2020 18:41:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [dm- devel][PATCH] vector: return null when realloc
 fails in vector_alloc_slot func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In vector_alloc_slot func, if REALLOC fails, it means new slot
allocation fails. However, it just update v->allocated and then
return the old v->slot without new slot. So, the caller will take
the last old slot as the new allocated slot, and use it by calling
vector_set_slot func. Finally, the data of last slot is lost.

Here, if REALLOC or MALLOC fails, we will return NULL.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/vector.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/libmultipath/vector.c b/libmultipath/vector.c
index 501cf4c5..29dc9848 100644
--- a/libmultipath/vector.c
+++ b/libmultipath/vector.c
@@ -49,12 +49,14 @@ vector_alloc_slot(vector v)
 	else
 		new_slot = (void *) MALLOC(sizeof (void *) * v->allocated);

-	if (!new_slot)
+	/* If REALLOC or MALLOC fails, it means new slot allocation fails, so return NULL. */
+	if (!new_slot) {
 		v->allocated -= VECTOR_DEFAULT_SIZE;
-	else
-		v->slot = new_slot;
+		return NULL;
+	}

-	return v->slot;
+	v->slot = new_slot;
+	return v->slot[VECTOR_SIZE(v) - 1];
 }

 int
-- 
2.24.0.windows.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

