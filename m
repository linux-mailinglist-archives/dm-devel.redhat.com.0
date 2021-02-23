Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC16322EB7
	for <lists+dm-devel@lfdr.de>; Tue, 23 Feb 2021 17:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614097771;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0taOcv+vQGRe3l++m9NUoc0XAwSLpjdx6GinTGQZo8s=;
	b=SkXUBCwCsYZ3yUozu3+Ugg7C9TMNSwhHKJjFW5ijPNFBPZQxIS/cOOGg5ShdiZJbvWH4vc
	S65g7JrBI66XyIk2+gPTh7c+YoaTXJwzUmznzGQlCNa8NarnWh11ziAGIwRCLHT+QevKCj
	5nNnYF+/iJLN8My8WckXikvKhQaZjPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Je_80wGSPoutrarRE2_2aA-1; Tue, 23 Feb 2021 11:29:27 -0500
X-MC-Unique: Je_80wGSPoutrarRE2_2aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5136818E1141;
	Tue, 23 Feb 2021 16:29:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED73719D61;
	Tue, 23 Feb 2021 16:29:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D48FE18095CB;
	Tue, 23 Feb 2021 16:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11NGSYxa032345 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 11:28:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E999D5D6BA; Tue, 23 Feb 2021 16:28:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE525D6AC;
	Tue, 23 Feb 2021 16:28:28 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 11NGSSLe028212; Tue, 23 Feb 2021 11:28:28 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 11NGSRxm028208; Tue, 23 Feb 2021 11:28:28 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 23 Feb 2021 11:28:27 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
In-Reply-To: <YDSwyrLeiP/fKgZH@T590>
Message-ID: <alpine.LRH.2.02.2102231125170.27597@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2102221312070.5407@file01.intranet.prod.int.rdu2.redhat.com>
	<YDSwyrLeiP/fKgZH@T590>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Mike Snitzer <msnitzer@redhat.com>,
	Marian Csontos <mcsontos@redhat.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH v2] blk-settings: make sure that max_sectors is
 aligned on "logical_block_size" boundary
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 23 Feb 2021, Ming Lei wrote:

> I'd suggest to add a helper(such as, blk_round_down_sectors()) to round_down each
> one.

Yes - Here I'm sending the updated patch.

> -- 
> Ming

From: Mikulas Patocka <mpatocka@redhat.com>

We get I/O errors when we run md-raid1 on the top of dm-integrity on the
top of ramdisk.
device-mapper: integrity: Bio not aligned on 8 sectors: 0xff00, 0xff
device-mapper: integrity: Bio not aligned on 8 sectors: 0xff00, 0xff
device-mapper: integrity: Bio not aligned on 8 sectors: 0xffff, 0x1
device-mapper: integrity: Bio not aligned on 8 sectors: 0xffff, 0x1
device-mapper: integrity: Bio not aligned on 8 sectors: 0x8048, 0xff
device-mapper: integrity: Bio not aligned on 8 sectors: 0x8147, 0xff
device-mapper: integrity: Bio not aligned on 8 sectors: 0x8246, 0xff
device-mapper: integrity: Bio not aligned on 8 sectors: 0x8345, 0xbb

The ramdisk device has logical_block_size 512 and max_sectors 255. The
dm-integrity device uses logical_block_size 4096 and it doesn't affect the
"max_sectors" value - thus, it inherits 255 from the ramdisk. So, we have
a device with max_sectors not aligned on logical_block_size.

The md-raid device sees that the underlying leg has max_sectors 255 and it
will split the bios on 255-sector boundary, making the bios unaligned on
logical_block_size.

In order to fix the bug, we round down max_sectors to logical_block_size.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 block/blk-settings.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: linux-2.6/block/blk-settings.c
===================================================================
--- linux-2.6.orig/block/blk-settings.c	2021-02-23 17:18:59.000000000 +0100
+++ linux-2.6/block/blk-settings.c	2021-02-23 17:23:58.000000000 +0100
@@ -481,6 +481,14 @@ void blk_queue_io_opt(struct request_que
 }
 EXPORT_SYMBOL(blk_queue_io_opt);
 
+static unsigned int blk_round_down_sectors(unsigned int sectors, unsigned int lbs)
+{
+	sectors = round_down(sectors, lbs >> SECTOR_SHIFT);
+	if (sectors < PAGE_SIZE >> SECTOR_SHIFT)
+		sectors = PAGE_SIZE >> SECTOR_SHIFT;
+	return sectors;
+}
+
 /**
  * blk_stack_limits - adjust queue_limits for stacked devices
  * @t:	the stacking driver limits (top device)
@@ -607,6 +615,10 @@ int blk_stack_limits(struct queue_limits
 		ret = -1;
 	}
 
+	t->max_sectors = blk_round_down_sectors(t->max_sectors, t->logical_block_size);
+	t->max_hw_sectors = blk_round_down_sectors(t->max_hw_sectors, t->logical_block_size);
+	t->max_dev_sectors = blk_round_down_sectors(t->max_dev_sectors, t->logical_block_size);
+
 	/* Discard alignment and granularity */
 	if (b->discard_granularity) {
 		alignment = queue_limit_discard_alignment(b, start);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

