Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C590D19
	for <lists+dm-devel@lfdr.de>; Sat, 17 Aug 2019 07:27:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8C481951D59;
	Sat, 17 Aug 2019 05:27:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6286842A6;
	Sat, 17 Aug 2019 05:27:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BEC04A486;
	Sat, 17 Aug 2019 05:26:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7H5QaKQ024186 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 17 Aug 2019 01:26:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 798C2646B7; Sat, 17 Aug 2019 05:26:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C33B084625;
	Sat, 17 Aug 2019 05:26:28 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86B3686663;
	Sat, 17 Aug 2019 05:26:26 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B753E7A753B45596DE92;
	Sat, 17 Aug 2019 13:26:21 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.439.0; Sat, 17 Aug 2019 13:26:14 +0800
From: ZhangXiaoxu <zhangxiaoxu5@huawei.com>
To: <dm-devel@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>,
	<zhangxiaoxu5@huawei.com>
Date: Sat, 17 Aug 2019 13:32:40 +0800
Message-ID: <1566019960-24788-1-git-send-email-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 17 Aug 2019 05:26:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 17 Aug 2019 05:26:27 +0000 (UTC) for IP:'45.249.212.32'
	DOMAIN:'szxga06-in.huawei.com' HELO:'huawei.com'
	FROM:'zhangxiaoxu5@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.32 szxga06-in.huawei.com
	45.249.212.32 szxga06-in.huawei.com <zhangxiaoxu5@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-btree: Fix the order of the block initialized
	on btree_split_beneath
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Sat, 17 Aug 2019 05:27:06 +0000 (UTC)

When splits a node to two new children, it will new two blocks: left
and right. If new right block failed, the left block will be unlocked
and mark it dirty. If this happened, the left blocks content is zero,
it won't be initialized with the btree struct. When flush the left
block to disk, the validator will failed when check this block. Then
BUG_ON will raised.

So, let's initialize the left block before new right block.

Signed-off-by: ZhangXiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/md/persistent-data/dm-btree.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/md/persistent-data/dm-btree.c b/drivers/md/persistent-data/dm-btree.c
index 58b3197..8aae062 100644
--- a/drivers/md/persistent-data/dm-btree.c
+++ b/drivers/md/persistent-data/dm-btree.c
@@ -628,39 +628,40 @@ static int btree_split_beneath(struct shadow_spine *s, uint64_t key)
 
 	new_parent = shadow_current(s);
 
+	pn = dm_block_data(new_parent);
+	size = le32_to_cpu(pn->header.flags) & INTERNAL_NODE ?
+		sizeof(__le64) : s->info->value_type.size;
+
+	/* create & init the left block */
 	r = new_block(s->info, &left);
 	if (r < 0)
 		return r;
 
+	ln = dm_block_data(left);
+	nr_left = le32_to_cpu(pn->header.nr_entries) / 2;
+
+	ln->header.flags = pn->header.flags;
+	ln->header.nr_entries = cpu_to_le32(nr_left);
+	ln->header.max_entries = pn->header.max_entries;
+	ln->header.value_size = pn->header.value_size;
+	memcpy(ln->keys, pn->keys, nr_left * sizeof(pn->keys[0]));
+	memcpy(value_ptr(ln, 0), value_ptr(pn, 0), nr_left * size);
+
+	/* create & init the right block */
 	r = new_block(s->info, &right);
 	if (r < 0) {
 		unlock_block(s->info, left);
 		return r;
 	}
 
-	pn = dm_block_data(new_parent);
-	ln = dm_block_data(left);
 	rn = dm_block_data(right);
-
-	nr_left = le32_to_cpu(pn->header.nr_entries) / 2;
 	nr_right = le32_to_cpu(pn->header.nr_entries) - nr_left;
 
-	ln->header.flags = pn->header.flags;
-	ln->header.nr_entries = cpu_to_le32(nr_left);
-	ln->header.max_entries = pn->header.max_entries;
-	ln->header.value_size = pn->header.value_size;
-
 	rn->header.flags = pn->header.flags;
 	rn->header.nr_entries = cpu_to_le32(nr_right);
 	rn->header.max_entries = pn->header.max_entries;
 	rn->header.value_size = pn->header.value_size;
-
-	memcpy(ln->keys, pn->keys, nr_left * sizeof(pn->keys[0]));
 	memcpy(rn->keys, pn->keys + nr_left, nr_right * sizeof(pn->keys[0]));
-
-	size = le32_to_cpu(pn->header.flags) & INTERNAL_NODE ?
-		sizeof(__le64) : s->info->value_type.size;
-	memcpy(value_ptr(ln, 0), value_ptr(pn, 0), nr_left * size);
 	memcpy(value_ptr(rn, 0), value_ptr(pn, nr_left),
 	       nr_right * size);
 
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
