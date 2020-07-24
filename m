Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DAB2522BB9F
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 03:40:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-4Q5BqDuLMNKZ-_bCdu-MbA-1; Thu, 23 Jul 2020 21:40:52 -0400
X-MC-Unique: 4Q5BqDuLMNKZ-_bCdu-MbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E970100AA22;
	Fri, 24 Jul 2020 01:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9709719D81;
	Fri, 24 Jul 2020 01:40:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 071BAA3581;
	Fri, 24 Jul 2020 01:40:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06O1eZVV026194 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 21:40:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A0A022080F; Fri, 24 Jul 2020 01:40:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25E51298047
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 01:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20D0D8007C9
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 01:40:33 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-Weh1l28WN7Sf-kVPfhltvQ-1; Thu, 23 Jul 2020 21:40:28 -0400
X-MC-Unique: Weh1l28WN7Sf-kVPfhltvQ-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6ED1D171E6A0BDEE2315;
	Fri, 24 Jul 2020 09:40:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 24 Jul 2020 09:40:19 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	<christophe.varoqui@opensvc.com>, Zdenek Kabelac <zkabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
Date: Fri, 24 Jul 2020 09:40:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, yanxiaodan@huawei.com, dm-devel@redhat.com
Subject: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails in
 disassemble_map
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

In disassemble_map func, one pp will be allocated and stored in
pgp->paths. However, if store_path fails, pp will not be freed,
then memory leak problem occurs.

Here, we will call free_path to free pp when store_path fails.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
V1->V2: update based on ups/submit-2007 branch.

 libmultipath/dmparser.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index b9858fa5..8a0501ba 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -143,6 +143,7 @@ int disassemble_map(const struct _vector *pathvec,
 	int def_minio = 0;
 	struct path * pp;
 	struct pathgroup * pgp;
+	int pp_alloc_flag = 0;

 	assert(pathvec != NULL);
 	p = params;
@@ -292,6 +293,7 @@ int disassemble_map(const struct _vector *pathvec,

 		for (j = 0; j < num_paths; j++) {
 			pp = NULL;
+			pp_alloc_flag = 0;
 			p += get_word(p, &word);

 			if (!word)
@@ -304,13 +306,16 @@ int disassemble_map(const struct _vector *pathvec,

 				if (!pp)
 					goto out1;
-
+				pp_alloc_flag = 1;
 				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
 			}
 			FREE(word);

-			if (store_path(pgp->paths, pp))
+			if (store_path(pgp->paths, pp)) {
+				if (pp_alloc_flag)
+					free_path(pp);
 				goto out;
+			}

 			pgp->id ^= (long)pp;
 			pp->pgindex = i + 1;
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

