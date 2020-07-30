Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58A3A2333FA
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jul 2020 16:10:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-iHcRF8tvOReONNKgGv7hvQ-1; Thu, 30 Jul 2020 10:10:02 -0400
X-MC-Unique: iHcRF8tvOReONNKgGv7hvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FF7691271;
	Thu, 30 Jul 2020 14:09:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3AB019934;
	Thu, 30 Jul 2020 14:09:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C551395A6C;
	Thu, 30 Jul 2020 14:09:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UE7xDw019478 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 10:08:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C2F5111287B; Thu, 30 Jul 2020 14:07:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 978621112874
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 14:07:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52683800658
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 14:07:57 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-0KiW0paNNDya9MhaEUgwhQ-1; Thu, 30 Jul 2020 10:06:47 -0400
X-MC-Unique: 0KiW0paNNDya9MhaEUgwhQ-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C24D6542FBBE5E45A45B;
	Thu, 30 Jul 2020 22:06:43 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 30 Jul 2020 22:06:35 +0800
To: <bmarzins@redhat.com>, <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <0cbfeea7-5f30-a148-555b-19af2429c32c@huawei.com>
Date: Thu, 30 Jul 2020 22:06:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH] devmapper: remove useless using of memset in
 dm_get_info func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In dm_get_info func, if do_get_info fails, we donot need to
call memset to assign 0 to *dmi which will be freed.

Here, we remove the useless using of memset in dm_get_info func.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/devmapper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f597ff8b..00ee0dfc 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1464,7 +1464,6 @@ dm_get_info (const char * mapname, struct dm_info ** dmi)
 		return 1;

 	if (do_get_info(mapname, *dmi) != 0) {
-		memset(*dmi, 0, sizeof(struct dm_info));
 		FREE(*dmi);
 		*dmi = NULL;
 		return 1;
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

