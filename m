Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 351145BA8D2
	for <lists+dm-devel@lfdr.de>; Fri, 16 Sep 2022 11:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663318851;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X/t3W248vr6LcqlpTxI5EbiVGhlURmzwRvVW+6WmHWo=;
	b=OmQ6lQx4k1ummbR5dyKynpIYN5G9/P2lrFdEp4pxUPruUEiEDplAXcbPTQ5B9EvW6nbuPH
	yak3xE2AAwTZtz557BTZkOYlmBJCevjbFrOMK9LWB7toXyGwiD6yPS/yR5MgA45hyS6O2j
	cXGoxDE1SdYufjvdlK1VF88q+bksdJE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-VOoO7ppYMqqhR2gm2fVRsw-1; Fri, 16 Sep 2022 05:00:50 -0400
X-MC-Unique: VOoO7ppYMqqhR2gm2fVRsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0C14811731;
	Fri, 16 Sep 2022 09:00:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBADDC15BA4;
	Fri, 16 Sep 2022 09:00:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94F8719465A3;
	Fri, 16 Sep 2022 09:00:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A812E1946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 16 Sep 2022 09:00:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 94FA4140EBF5; Fri, 16 Sep 2022 09:00:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E1E9140EBF3;
 Fri, 16 Sep 2022 09:00:46 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 28G90kwr000940; Fri, 16 Sep 2022 05:00:46 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 28G90kgJ000937; Fri, 16 Sep 2022 05:00:46 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Fri, 16 Sep 2022 05:00:46 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>, Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2209151604410.13231@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2209160500190.543@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2209151604410.13231@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 4/4] brd: implement secure erase and write zeroes
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch implements REQ_OP_SECURE_ERASE and REQ_OP_WRITE_ZEROES on brd.
Write zeroes will free the pages just like discard, but the difference is
that it writes zeroes to the preceding and following page if the range is
not aligned on page boundary. Secure erase is just like write zeroes,
except that it clears the page content before freeing the page.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/block/brd.c |   28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/block/brd.c
===================================================================
--- linux-2.6.orig/drivers/block/brd.c
+++ linux-2.6/drivers/block/brd.c
@@ -118,7 +118,7 @@ static void brd_free_page_rcu(struct rcu
 	__free_page(page);
 }
 
-static void brd_free_page(struct brd_device *brd, sector_t sector)
+static void brd_free_page(struct brd_device *brd, sector_t sector, bool secure)
 {
 	struct page *page;
 	pgoff_t idx;
@@ -127,8 +127,11 @@ static void brd_free_page(struct brd_dev
 	idx = sector >> PAGE_SECTORS_SHIFT;
 	page = radix_tree_delete(&brd->brd_pages, idx);
 	spin_unlock(&brd->brd_lock);
-	if (page)
+	if (page) {
+		if (secure)
+			clear_highpage(page);
 		call_rcu(&page->rcu_head, brd_free_page_rcu);
+	}
 }
 
 /*
@@ -308,16 +311,29 @@ static void brd_submit_bio(struct bio *b
 	struct bio_vec bvec;
 	struct bvec_iter iter;
 
-	if (bio_op(bio) == REQ_OP_DISCARD) {
+	if (bio_op(bio) == REQ_OP_DISCARD ||
+	    bio_op(bio) == REQ_OP_SECURE_ERASE ||
+	    bio_op(bio) == REQ_OP_WRITE_ZEROES) {
+		bool zero_padding = bio_op(bio) == REQ_OP_SECURE_ERASE || bio_op(bio) == REQ_OP_WRITE_ZEROES;
 		sector_t len = bio_sectors(bio);
 		sector_t front_pad = -sector & (PAGE_SECTORS - 1);
+		sector_t end_pad;
+
+		if (zero_padding && unlikely(front_pad != 0))
+			copy_to_brd(brd, page_address(ZERO_PAGE(0)), sector, min(len, front_pad) << SECTOR_SHIFT);
+
 		sector += front_pad;
 		if (unlikely(len <= front_pad))
 			goto endio;
 		len -= front_pad;
-		len = round_down(len, PAGE_SECTORS);
+
+		end_pad = len & (PAGE_SECTORS - 1);
+		if (zero_padding && unlikely(end_pad != 0))
+			copy_to_brd(brd, page_address(ZERO_PAGE(0)), sector + len - end_pad, end_pad << SECTOR_SHIFT);
+		len -= end_pad;
+
 		while (len) {
-			brd_free_page(brd, sector);
+			brd_free_page(brd, sector, bio_op(bio) == REQ_OP_SECURE_ERASE);
 			sector += PAGE_SECTORS;
 			len -= PAGE_SECTORS;
 			cond_resched();
@@ -448,6 +464,8 @@ static int brd_alloc(int i)
 
 	disk->queue->limits.discard_granularity = PAGE_SIZE;
 	blk_queue_max_discard_sectors(disk->queue, UINT_MAX);
+	blk_queue_max_write_zeroes_sectors(disk->queue, UINT_MAX);
+	blk_queue_max_secure_erase_sectors(disk->queue, UINT_MAX);
 
 	/* Tell the block layer that this is not a rotational device */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

