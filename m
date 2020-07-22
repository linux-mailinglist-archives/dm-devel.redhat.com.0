Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 318C2229477
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 11:08:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-Y-uIlUppPmKoxmnVgpTmZQ-1; Wed, 22 Jul 2020 05:08:45 -0400
X-MC-Unique: Y-uIlUppPmKoxmnVgpTmZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3359102C848;
	Wed, 22 Jul 2020 09:08:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5255C1C3;
	Wed, 22 Jul 2020 09:08:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B567D730D6;
	Wed, 22 Jul 2020 09:08:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M8aRht024687 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 04:36:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58B76F885D; Wed, 22 Jul 2020 08:36:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 548A2F8859
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 08:36:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CDF78007CB
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 08:36:25 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-GVBNMTCBPVqWw9-JZeWXiw-1; Wed, 22 Jul 2020 04:36:18 -0400
X-MC-Unique: GVBNMTCBPVqWw9-JZeWXiw-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 94034109F8F93427FFF1;
	Wed, 22 Jul 2020 16:36:13 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 22 Jul 2020 16:36:05 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <e58b31e0-4f66-072f-b9c6-1047714cf3bf@huawei.com>
Date: Wed, 22 Jul 2020 16:36:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [PATCH] libmultipath: free pgp if add_pathgroup fails in
 disassemble_map func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In disassemble_map func, pgp will be added to mpp->pg by calling
add_pathgroup after allocing a pathgroup (pgp) successfully. However,
if add_pathgroup fails, the pgp is actually not inserted into mpp->pg.
So, calling free_pgvec(mpp->pg) cannot free the pgp, then memory leak
problem occurs.

disassemble_map:
-> pgp = alloc_pathgroup()
-> if add_pathgroup(mpp, pgp) fails
	-> goto out
out:
free_pgvec(mpp->pg, KEEP_PATHS);

Here, we will call free_pathgroup(pgp) before going to out tag.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/dmparser.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index ac13ec06..6225838b 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -268,8 +268,10 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 		if (!pgp)
 			goto out;

-		if (add_pathgroup(mpp, pgp))
+		if (add_pathgroup(mpp, pgp)) {
+			free_pathgroup(pgp, KEEP_PATHS);
 			goto out;
+		}

 		p += get_word(p, &word);

-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

