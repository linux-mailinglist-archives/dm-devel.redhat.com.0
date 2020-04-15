Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 23C511A9E69
	for <lists+dm-devel@lfdr.de>; Wed, 15 Apr 2020 13:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586951916;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AdOGdSfMAL10czaQX+IxKbC3DD530VmWUGtKK7oq3mM=;
	b=VEw9TK3JD/lmtQtu6RmL6BCU+3YutnEHkp6ZAN9rCbGvKjnppdVOIeOG7d0vyhMwh8OCfn
	Vgjf49AJP7D8Qhc3PvkeaIlJqbxtMu9B8eu8lnt/TsnKU6M0f9u4d5nJ5wdo0KHRWQ770O
	iNth63Te0s0VXunvNCCdM3otgD6xkxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-KFYCHkqLMR-584RfrUaAKQ-1; Wed, 15 Apr 2020 07:58:34 -0400
X-MC-Unique: KFYCHkqLMR-584RfrUaAKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F37149C2;
	Wed, 15 Apr 2020 11:58:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CEF126571;
	Wed, 15 Apr 2020 11:58:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D46B7180CB3B;
	Wed, 15 Apr 2020 11:58:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FBvunX027353 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 07:57:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C9B82166B2B; Wed, 15 Apr 2020 11:57:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 576242166B2D
	for <dm-devel@redhat.com>; Wed, 15 Apr 2020 11:57:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8551F8056A3
	for <dm-devel@redhat.com>; Wed, 15 Apr 2020 11:57:53 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-393-PEZT8weWM1mKE9EfuyOYHg-1; Wed, 15 Apr 2020 07:57:48 -0400
X-MC-Unique: PEZT8weWM1mKE9EfuyOYHg-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id CCB38869BAD155A7B79A;
	Wed, 15 Apr 2020 19:57:40 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.183) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 15 Apr 2020 19:57:32 +0800
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <a7643d1a-940b-c8a8-686e-a660f0feeb96@huawei.com>
Date: Wed, 15 Apr 2020 19:57:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.173.220.183]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FBvunX027353
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, "wubo \(T\)" <wubo40@huawei.com>,
	Mingfangsen <mingfangsen@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>
Subject: [dm-devel] [PATCH] md/persistent-data: exit_ro_spine func return
	void
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

From: Zhiqiang Liu <liuzhiqiang26@huawei.com>

In commit 4c7da06f5a78 ("dm persistent data: eliminate unnecessary return values"),
r value in exit_ro_spine will not changes, so exit_ro_spine donot need
to return values.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 drivers/md/persistent-data/dm-btree-internal.h | 2 +-
 drivers/md/persistent-data/dm-btree-spine.c    | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/md/persistent-data/dm-btree-internal.h b/drivers/md/persistent-data/dm-btree-internal.h
index a240990a7f33..55a4096f1334 100644
--- a/drivers/md/persistent-data/dm-btree-internal.h
+++ b/drivers/md/persistent-data/dm-btree-internal.h
@@ -68,7 +68,7 @@ struct ro_spine {
 };

 void init_ro_spine(struct ro_spine *s, struct dm_btree_info *info);
-int exit_ro_spine(struct ro_spine *s);
+void exit_ro_spine(struct ro_spine *s);
 int ro_step(struct ro_spine *s, dm_block_t new_child);
 void ro_pop(struct ro_spine *s);
 struct btree_node *ro_node(struct ro_spine *s);
diff --git a/drivers/md/persistent-data/dm-btree-spine.c b/drivers/md/persistent-data/dm-btree-spine.c
index b27b8091a1ca..e03cb9e48773 100644
--- a/drivers/md/persistent-data/dm-btree-spine.c
+++ b/drivers/md/persistent-data/dm-btree-spine.c
@@ -132,15 +132,13 @@ void init_ro_spine(struct ro_spine *s, struct dm_btree_info *info)
 	s->nodes[1] = NULL;
 }

-int exit_ro_spine(struct ro_spine *s)
+void exit_ro_spine(struct ro_spine *s)
 {
-	int r = 0, i;
+	int i;

 	for (i = 0; i < s->count; i++) {
 		unlock_block(s->info, s->nodes[i]);
 	}
-
-	return r;
 }

 int ro_step(struct ro_spine *s, dm_block_t new_child)
-- 
2.19.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

