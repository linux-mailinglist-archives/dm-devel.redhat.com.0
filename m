Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8DB2B9C24
	for <lists+dm-devel@lfdr.de>; Thu, 19 Nov 2020 21:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605818253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WDmr4MD/zzIJ4MULjPjhgd5IhjieRy316r/OR+oatF8=;
	b=JKlzxXS6/C/yzb+VIuCo22I7LTy4DYzGLJ8By2N+Fdkbpsz4/J56Q0+wcoJSvQzYxjIF6x
	8ge15HZ/mNN8PQWwFqpY0/fs+MDlgBOdAQQ1V458rGY1dO5FCuysrk5hhD5QSBpttkM7Ka
	nuqmUQC7ILngeDVyZKpKTFweHMaCdLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-vlfabPx7ND-NJczYXFwA8A-1; Thu, 19 Nov 2020 15:37:30 -0500
X-MC-Unique: vlfabPx7ND-NJczYXFwA8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9AE581C49A;
	Thu, 19 Nov 2020 20:37:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8300B60BE2;
	Thu, 19 Nov 2020 20:37:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A51574E58E;
	Thu, 19 Nov 2020 20:37:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJKatn6019298 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 15:36:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E26B560C05; Thu, 19 Nov 2020 20:36:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9859060BE2;
	Thu, 19 Nov 2020 20:36:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AJKaqp9012293; Thu, 19 Nov 2020 15:36:52 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AJKapuD012289; Thu, 19 Nov 2020 15:36:51 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 19 Nov 2020 15:36:51 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: David Teigland <teigland@redhat.com>, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <alpine.LRH.2.02.2011191337180.588@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2011191517360.10231@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201118203127.GA30066@redhat.com>
	<20201118203408.GB30066@redhat.com>
	<fc7c4efd-0bb3-f023-19c6-54359d279ca8@redhat.com>
	<alpine.LRH.2.02.2011190810001.32672@file01.intranet.prod.int.rdu2.redhat.com>
	<20201119172807.GC1879@redhat.com>
	<alpine.LRH.2.02.2011191337180.588@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, heinzm@redhat.com, dm-devel@redhat.com,
	Marian Csontos <mcsontos@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: [dm-devel] [PATCH] blk-settings: make sure that max_sectors is
 aligned on "logical_block_size" boundary.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We get these I/O errors when we run md-raid1 on the top of dm-integrity on 
the top of ramdisk:
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
 block/blk-settings.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

Index: linux-2.6/block/blk-settings.c
===================================================================
--- linux-2.6.orig/block/blk-settings.c	2020-10-29 12:20:46.000000000 +0100
+++ linux-2.6/block/blk-settings.c	2020-11-19 21:20:18.000000000 +0100
@@ -591,6 +591,16 @@ int blk_stack_limits(struct queue_limits
 		ret = -1;
 	}
 
+	t->max_sectors = round_down(t->max_sectors, t->logical_block_size / 512);
+	if (t->max_sectors < PAGE_SIZE / 512)
+		t->max_sectors = PAGE_SIZE / 512;
+	t->max_hw_sectors = round_down(t->max_hw_sectors, t->logical_block_size / 512);
+	if (t->max_sectors < PAGE_SIZE / 512)
+		t->max_hw_sectors = PAGE_SIZE / 512;
+	t->max_dev_sectors = round_down(t->max_dev_sectors, t->logical_block_size / 512);
+	if (t->max_sectors < PAGE_SIZE / 512)
+		t->max_dev_sectors = PAGE_SIZE / 512;
+
 	/* Discard alignment and granularity */
 	if (b->discard_granularity) {
 		alignment = queue_limit_discard_alignment(b, start);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

