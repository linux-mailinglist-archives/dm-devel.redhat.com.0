Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BDD013057C1
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jan 2021 11:05:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-bON6bsTWNhuPoWcM9bGvJg-1; Wed, 27 Jan 2021 05:05:50 -0500
X-MC-Unique: bON6bsTWNhuPoWcM9bGvJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10CB58145F4;
	Wed, 27 Jan 2021 10:05:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9CD21F41A;
	Wed, 27 Jan 2021 10:05:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 309D2180954D;
	Wed, 27 Jan 2021 10:05:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q9cP00005024 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 04:38:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8453A2166B29; Tue, 26 Jan 2021 09:38:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F3992166B28
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 09:38:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C680D1875049
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 09:38:22 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-504-JPQV9dedMOuvivjAxvOmVw-1;
	Tue, 26 Jan 2021 04:38:20 -0500
X-MC-Unique: JPQV9dedMOuvivjAxvOmVw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1;
	HT=alimailimapcm10staff010182156082;
	MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UMyJmYd_1611653554
Received: from
	j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
	fp:SMTPD_---0UMyJmYd_1611653554) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 26 Jan 2021 17:32:51 +0800
From: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To: agk@redhat.com
Date: Tue, 26 Jan 2021 17:32:32 +0800
Message-Id: <1611653552-84056-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 27 Jan 2021 05:02:17 -0500
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, snitzer@redhat.com,
	Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [dm-devel] [PATCH] dm writecache: remove redundant NULL check
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix below warnings reported by coccicheck:
./drivers/md/dm-writecache.c:2008:2-7: WARNING: NULL check before some
freeing functions is not needed.
./drivers/md/dm-writecache.c:2024:2-7: WARNING: NULL check before some
freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/md/dm-writecache.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index d5223a0..8abf185 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2004,8 +2004,7 @@ static void writecache_dtr(struct dm_target *ti)
 	if (wc->ssd_dev)
 		dm_put_device(ti, wc->ssd_dev);
 
-	if (wc->entries)
-		vfree(wc->entries);
+	vfree(wc->entries);
 
 	if (wc->memory_map) {
 		if (WC_MODE_PMEM(wc))
@@ -2020,8 +2019,7 @@ static void writecache_dtr(struct dm_target *ti)
 	if (wc->dm_io)
 		dm_io_client_destroy(wc->dm_io);
 
-	if (wc->dirty_bitmap)
-		vfree(wc->dirty_bitmap);
+	vfree(wc->dirty_bitmap);
 
 	kfree(wc);
 }
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

