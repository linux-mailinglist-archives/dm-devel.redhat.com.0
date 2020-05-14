Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5789B1D285D
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589439560;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oVe7mOO990081jGEFFGCk8PERPXuba3LpIywO8/8zQY=;
	b=J953wMrPE83Ule8MJMmZovGvdeKPUTC1BOcC2ZK127zMw9PKQ3eZcebgzJTgqEEccXQJet
	dxRsKkVzfnqrz/gae561kd8eoPL6kIMLwDYXfztji0yHrN/Lr1o3q5pyp23+ZePxRY1zrF
	3Jzup0+I98SviimhC2qUMYxIM946Wqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-9M08OgWZMmCTrS-KfzSqoQ-1; Thu, 14 May 2020 02:59:18 -0400
X-MC-Unique: 9M08OgWZMmCTrS-KfzSqoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 569B0835B40;
	Thu, 14 May 2020 06:59:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0B8E579AD;
	Thu, 14 May 2020 06:59:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED5244E982;
	Thu, 14 May 2020 06:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E6wQ6G031503 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:58:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9C1D2029F71; Thu, 14 May 2020 06:58:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E79B200A773
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:58:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD5418A6661
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:58:24 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-T1muVqhrNGGHBsKuJWv69Q-1; Thu, 14 May 2020 02:58:22 -0400
X-MC-Unique: T1muVqhrNGGHBsKuJWv69Q-1
IronPort-SDR: 0xxNBG3zcK/UnRXlyKQ+MmEMYyNESUlyVWZxGL7bjoAAXdtD2t48C6v84kwpck8iIPfdMTBC3+
	WlQCCO8mQZUK6UmJbrTM3OcN2LPnSbe06z39uOdupt6OKZCnlwVd4MGJr4THdMmKTLvW+K//0C
	FPHlHdY2dHOJFyw1/Sv6/pui8O72PBXPpbO+8qgeAR+OMSEmWSQWfLQrc0hCvpBQSXKODnR6Ex
	KfkkDuFIQJAz2jM0kvl2/ynGuznNA3LFkF452HyRm10ZpANxiS4a6Nq/Mgo12H5bHA8CdbhrFd
	td4=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="240361183"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 14:58:37 +0800
IronPort-SDR: 7LuIhVkR5KnG/32ZmY2wtt3xZobOEeULc7TpsNfrGVemEqdA5+DqfPZBIEKsB3SzMWZgWY8q3t
	kZdxdIpyFALIB3l+mXnHtDsY5ZWr5S1Tw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 May 2020 23:48:34 -0700
IronPort-SDR: 3muka8KvTa6xnEWniJ3JmJeimalLxxDU9I8aUCRbikqGt289fABnOEaqtp4neE1Rev4pzOxI6t
	5lXzgtCl2A0g==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 13 May 2020 23:58:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 14 May 2020 15:58:19 +0900
Message-Id: <20200514065819.1113949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] block: Improve io_opt limit stacking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When devices with different physical sector sizes are stacked, the
largest value is used as the stacked device physical sector size. For
the optimal IO size, the lowest common multiple (lcm) of the underlying
devices is used for the stacked device. In this scenario, if only one of
the underlying device reports an optimal IO size, that value is used as
is for the stacked device but that value may not be a multiple of the
stacked device physical sector size. In this case, blk_stack_limits()
returns an error resulting in warnings being printed on device mapper
startup (observed with dm-zoned dual drive setup combining a 512B
sector SSD with a 4K sector HDD).

To fix this, rather than returning an error, the optimal IO size limit
for the stacked device can be adjusted to the lowest common multiple
(lcm) of the stacked physical sector size and optimal IO size, resulting
in a value that is a multiple of the physical sector size while still
being an optimal size for the underlying devices.

This patch is complementary to the patch "nvme: Fix io_opt limit
setting" which prevents the nvme driver from reporting an optimal IO
size equal to a namespace sector size for a device that does not report
an optimal IO size.

Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-settings.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 9a2c23cd9700..9a2b017ff681 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -561,11 +561,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	}
 
 	/* Optimal I/O a multiple of the physical block size? */
-	if (t->io_opt & (t->physical_block_size - 1)) {
-		t->io_opt = 0;
-		t->misaligned = 1;
-		ret = -1;
-	}
+	if (t->io_opt & (t->physical_block_size - 1))
+		t->io_opt = lcm(t->io_opt, t->physical_block_size);
 
 	t->raid_partial_stripes_expensive =
 		max(t->raid_partial_stripes_expensive,
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

