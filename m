Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 54BC32CB9C8
	for <lists+dm-devel@lfdr.de>; Wed,  2 Dec 2020 10:56:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-l6qKzDB_OnqN2yAjxDEObg-1; Wed, 02 Dec 2020 04:55:31 -0500
X-MC-Unique: l6qKzDB_OnqN2yAjxDEObg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0331101AFC0;
	Wed,  2 Dec 2020 09:55:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A3B55C1D0;
	Wed,  2 Dec 2020 09:55:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BF6E1809CA0;
	Wed,  2 Dec 2020 09:55:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B23d62r001304 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 22:39:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 532DD2166B29; Wed,  2 Dec 2020 03:39:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DFFC2166B27
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 03:39:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE97F80088F
	for <dm-devel@redhat.com>; Wed,  2 Dec 2020 03:39:03 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-173-8igplLuXNaqXJkhpAkRz7g-1;
	Tue, 01 Dec 2020 22:39:00 -0500
X-MC-Unique: 8igplLuXNaqXJkhpAkRz7g-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0UHHIzwn_1606880336
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UHHIzwn_1606880336) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 02 Dec 2020 11:38:56 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com
Date: Wed,  2 Dec 2020 11:38:55 +0800
Message-Id: <20201202033855.60882-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20201202033855.60882-1-jefflexu@linux.alibaba.com>
References: <20201201160709.31748-1-snitzer@redhat.com>
	<20201202033855.60882-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Wed, 02 Dec 2020 04:55:04 -0500
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm: use gcd() to fix chunk_sectors limit stacking
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As it said in commit 7e7986f9d3ba ("block: use gcd() to fix
chunk_sectors limit stacking"), chunk_sectors should reflect the most
limited of all devices in the IO stack.

The previous commit only fixes block/blk-settings.c:blk_stack_limits(),
while leaving dm.c:dm_calculate_queue_limits() unfixed.

Fixes: 882ec4e609c1 ("dm table: stack 'chunk_sectors' limit to account for target-specific splitting")
cc: stable@vger.kernel.org
Reported-by: John Dorminy <jdorminy@redhat.com>
Reported-by: Bruce Johnston <bjohnsto@redhat.com>
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 drivers/md/dm-table.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index ce543b761be7..dcc0a27355d7 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -22,6 +22,7 @@
 #include <linux/blk-mq.h>
 #include <linux/mount.h>
 #include <linux/dax.h>
+#include <linux/gcd.h>
 
 #define DM_MSG_PREFIX "table"
 
@@ -1457,7 +1458,7 @@ int dm_calculate_queue_limits(struct dm_table *table,
 
 		/* Stack chunk_sectors if target-specific splitting is required */
 		if (ti->max_io_len)
-			ti_limits.chunk_sectors = lcm_not_zero(ti->max_io_len,
+			ti_limits.chunk_sectors = gcd(ti->max_io_len,
 							       ti_limits.chunk_sectors);
 		/* Set I/O hints portion of queue limits */
 		if (ti->type->io_hints)
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

