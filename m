Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C269E230BFE
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 16:04:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-IKLAqf4SP4G2gh3fn_UNqQ-1; Tue, 28 Jul 2020 10:04:51 -0400
X-MC-Unique: IKLAqf4SP4G2gh3fn_UNqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1AF51DFB;
	Tue, 28 Jul 2020 14:04:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7B510013C4;
	Tue, 28 Jul 2020 14:04:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9583A3599;
	Tue, 28 Jul 2020 14:04:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SE4UqV013378 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 10:04:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8412110E9BB; Tue, 28 Jul 2020 14:04:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3FB3110E9B9
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 14:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7070586BF47
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 14:04:26 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-121-q2d91B-QPIuFlfJoRijiSA-1; Tue, 28 Jul 2020 10:04:22 -0400
X-MC-Unique: q2d91B-QPIuFlfJoRijiSA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id F092FC6C022FD6012EED;
	Tue, 28 Jul 2020 21:48:12 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 28 Jul 2020 21:48:07 +0800
To: <mwilck@suse.com>, <bmarzins@redhat.com>, <christophe.varoqui@opensvc.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <9bc76686-747f-e85b-d25f-db5a056cf869@huawei.com>
Date: Tue, 28 Jul 2020 21:48:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH] libmultipath: fix a memory leak in
 disassemble_status func
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


In disassemble_status func, for dealing with selector args,
word is allocated by get_word func. However, word is not freed.
Then a memory leak occurs.

Here, we call FREE(word) to free word.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/dmparser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 3dc77242..a4a989b2 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -584,6 +584,7 @@ int disassemble_status(char *params, struct multipath *mpp)
 						   &def_minio) == 1 &&
 					    def_minio != mpp->minio)
 							mpp->minio = def_minio;
+					FREE(word);
 				} else
 					p += get_word(p, NULL);
 			}
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

