Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6518A232AAC
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jul 2020 06:03:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-3eQmJXDyOAG_fRCuhL9erA-1; Thu, 30 Jul 2020 00:03:37 -0400
X-MC-Unique: 3eQmJXDyOAG_fRCuhL9erA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC7558;
	Thu, 30 Jul 2020 04:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F341002382;
	Thu, 30 Jul 2020 04:03:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DF5B4EDB7;
	Thu, 30 Jul 2020 04:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06U41xUV003378 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 00:01:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F865D0B33; Thu, 30 Jul 2020 04:01:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ACF2E77BE
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 04:01:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F37A8007CD
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 04:01:57 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-95-YGj4ar8rMRuBF3QlJnp5QQ-1; Thu, 30 Jul 2020 00:01:52 -0400
X-MC-Unique: YGj4ar8rMRuBF3QlJnp5QQ-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id F1AAF2FC80355504992C;
	Thu, 30 Jul 2020 12:01:47 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Jul 2020
	12:01:37 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <e2fb3241-6829-86e1-bc0c-5ba6b0e399c7@huawei.com>
Date: Thu, 30 Jul 2020 12:01:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: [dm-devel] [dm- devel][PATCH] libmultipath: fix a memory leak in
	dm_get_maps
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

In dm_get_maps func, if vector_alloc_slot(mp) fails, the
mpp should be free.

Here we call free_multipath(mpp, KEEP_PATHS) to free map.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

---
 libmultipath/devmapper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f597ff8b..92eef6f1 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1198,8 +1198,10 @@ dm_get_maps (vector mp)
 		if (!mpp)
 			goto out;

-		if (!vector_alloc_slot(mp))
+		if (!vector_alloc_slot(mp)) {
+			free_multipath(mpp, KEEP_PATHS);
 			goto out;
+		}

 		vector_set_slot(mp, mpp);
 		mpp = NULL;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

