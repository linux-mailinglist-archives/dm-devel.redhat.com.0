Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B945C570BCF
	for <lists+dm-devel@lfdr.de>; Mon, 11 Jul 2022 22:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657571495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QvOi4hzGv2RApGhsbAIo3u+WtXU1C8LEqpK8kYpd6YU=;
	b=aVFggoL3Hf3enQY7geRmeAL3Lb6/T2+zbC9wCSbSNm05HxbU6EoLn3STjALfEEVOeo989Q
	C1iG2u1hKI3XiVGsWLDDerjfFuygY167uyw3FFZ5ozNpO/8kszA5I9zo5yvjHPuUksXPuw
	cNnBzxJVAX3mgH54KgJgmeT3WOjvox0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-m8nAM0btPay_dO_ZoTyXzQ-1; Mon, 11 Jul 2022 16:31:34 -0400
X-MC-Unique: m8nAM0btPay_dO_ZoTyXzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 183763803916;
	Mon, 11 Jul 2022 20:31:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD60C2166B2A;
	Mon, 11 Jul 2022 20:31:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 493611947064;
	Mon, 11 Jul 2022 20:31:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB842194704A
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Jul 2022 20:31:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B4C832EF9E; Mon, 11 Jul 2022 20:31:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A962218EB7;
 Mon, 11 Jul 2022 20:31:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 26BKVQ4q005686; Mon, 11 Jul 2022 16:31:26 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 26BKVQ3K005682; Mon, 11 Jul 2022 16:31:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 11 Jul 2022 16:31:26 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Yu Kuai <yukuai1@huaweicloud.com>, Mike Snitzer <msnitzer@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2207111627260.5249@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2207111631000.5249@file01.intranet.prod.int.rdu2.redhat.com>
References: <20220706093146.1961598-1-yukuai1@huaweicloud.com>
 <alpine.LRH.2.02.2207111627260.5249@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH 3/4] dm-writecache: count the number of blocks
 written, not the number of write bios
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
Cc: yukuai3@huawei.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 agk@redhat.com, yi.zhang@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change dm-writecache, so that it counts the number of blocks written
instead of the number of write bios. Bios can be split and requeued using
the dm_accept_partial_bio function, so counting of bios provided
inaccurate results.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Yu Kuai <yukuai1@huaweicloud.com>

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c
+++ linux-2.6/drivers/md/dm-writecache.c
@@ -1413,6 +1413,9 @@ static void writecache_bio_copy_ssd(stru
 	bio->bi_iter.bi_sector = start_cache_sec;
 	dm_accept_partial_bio(bio, bio_size >> SECTOR_SHIFT);
 
+	wc->stats.writes += bio->bi_iter.bi_size >> wc->block_size_bits;
+	wc->stats.writes_allocate += (bio->bi_iter.bi_size - wc->block_size) >> wc->block_size_bits;
+
 	if (unlikely(wc->uncommitted_blocks >= wc->autocommit_blocks)) {
 		wc->uncommitted_blocks = 0;
 		queue_work(wc->writeback_wq, &wc->flush_work);
@@ -1428,9 +1431,10 @@ static enum wc_map_op writecache_map_wri
 	do {
 		bool found_entry = false;
 		bool search_used = false;
-		wc->stats.writes++;
-		if (writecache_has_error(wc))
+		if (writecache_has_error(wc)) {
+			wc->stats.writes += bio->bi_iter.bi_size >> wc->block_size_bits;
 			return WC_MAP_ERROR;
+		}
 		e = writecache_find_entry(wc, bio->bi_iter.bi_sector, 0);
 		if (e) {
 			if (!writecache_entry_is_committed(wc, e)) {
@@ -1454,9 +1458,10 @@ static enum wc_map_op writecache_map_wri
 		if (unlikely(!e)) {
 			if (!WC_MODE_PMEM(wc) && !found_entry) {
 direct_write:
-				wc->stats.writes_around++;
 				e = writecache_find_entry(wc, bio->bi_iter.bi_sector, WFE_RETURN_FOLLOWING);
 				writecache_map_remap_origin(wc, bio, e);
+				wc->stats.writes_around += bio->bi_iter.bi_size >> wc->block_size_bits;
+				wc->stats.writes += bio->bi_iter.bi_size >> wc->block_size_bits;
 				return WC_MAP_REMAP_ORIGIN;
 			}
 			wc->stats.writes_blocked_on_freelist++;
@@ -1470,6 +1475,7 @@ direct_write:
 bio_copy:
 		if (WC_MODE_PMEM(wc)) {
 			bio_copy_block(wc, bio, memory_data(wc, e));
+			wc->stats.writes++;
 		} else {
 			writecache_bio_copy_ssd(wc, bio, e, search_used);
 			return WC_MAP_REMAP;
Index: linux-2.6/Documentation/admin-guide/device-mapper/writecache.rst
===================================================================
--- linux-2.6.orig/Documentation/admin-guide/device-mapper/writecache.rst
+++ linux-2.6/Documentation/admin-guide/device-mapper/writecache.rst
@@ -80,11 +80,11 @@ Status:
 4. the number of blocks under writeback
 5. the number of read blocks
 6. the number of read blocks that hit the cache
-7. the number of write requests
-8. the number of write requests that hit uncommitted block
-9. the number of write requests that hit committed block
-10. the number of write requests that bypass the cache
-11. the number of write requests that are allocated in the cache
+7. the number of write blocks
+8. the number of write blocks that hit uncommitted block
+9. the number of write blocks that hit committed block
+10. the number of write blocks that bypass the cache
+11. the number of write blocks that are allocated in the cache
 12. the number of write requests that are blocked on the freelist
 13. the number of flush requests
 14. the number of discard requests

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

