Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8DC52D5E46
	for <lists+dm-devel@lfdr.de>; Thu, 10 Dec 2020 15:46:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-jLoPd2bXP12vuNTExLDHOg-1; Thu, 10 Dec 2020 09:46:14 -0500
X-MC-Unique: jLoPd2bXP12vuNTExLDHOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E98FC1009466;
	Thu, 10 Dec 2020 14:46:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F785D71D;
	Thu, 10 Dec 2020 14:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61E051809C9F;
	Thu, 10 Dec 2020 14:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BAEIHKa013159 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Dec 2020 09:18:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02AAD2166B29; Thu, 10 Dec 2020 14:18:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2A42166B2C
	for <dm-devel@redhat.com>; Thu, 10 Dec 2020 14:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF4E85829A
	for <dm-devel@redhat.com>; Thu, 10 Dec 2020 14:18:12 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-21-igO0Cy2XNpmKKmoJTZev_A-1; Thu, 10 Dec 2020 09:18:08 -0500
X-MC-Unique: igO0Cy2XNpmKKmoJTZev_A-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CsFt04LkMz15b8N;
	Thu, 10 Dec 2020 22:00:08 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 10 Dec 2020 22:00:35 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>,
	<linux-kernel@vger.kernel.org>
Date: Thu, 10 Dec 2020 22:01:03 +0800
Message-ID: <20201210140103.1720-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BAEIHKa013159
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Dec 2020 09:44:21 -0500
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [dm-devel] [PATCH -next] drivers: md: simplify the return
	expression of load_mapping()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/md/dm-cache-target.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 4bc453f5bbaa..541c45027cc8 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2840,7 +2840,6 @@ static void cache_postsuspend(struct dm_target *ti)
 static int load_mapping(void *context, dm_oblock_t oblock, dm_cblock_t cblock,
 			bool dirty, uint32_t hint, bool hint_valid)
 {
-	int r;
 	struct cache *cache = context;
 
 	if (dirty) {
@@ -2849,11 +2848,7 @@ static int load_mapping(void *context, dm_oblock_t oblock, dm_cblock_t cblock,
 	} else
 		clear_bit(from_cblock(cblock), cache->dirty_bitset);
 
-	r = policy_load_mapping(cache->policy, oblock, cblock, dirty, hint, hint_valid);
-	if (r)
-		return r;
-
-	return 0;
+	return policy_load_mapping(cache->policy, oblock, cblock, dirty, hint, hint_valid);
 }
 
 /*
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

