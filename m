Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D91213BC7D
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jan 2020 10:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579080948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ftPn6ttc4RvJ0lUqOGQ2ktB/fJF8NVfD3lqHn8bzkA=;
	b=akX4+7JN1KvOxbYWoLrBLY5LVu4jdHZQKadzQVioS1CQGk0ika/DxNhYPxKgqD98wcuK95
	7+YLO7ugQgXfgaXeF0R+XK1vokW3E5C7SzkbseGdThmQqk1FAqOAk0kOYJ9Ujidy5ibD68
	2JFb+0HN6zIWsCWJzXbR8NljkJPBB6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-gFG-tJYfODetnQKZEamzjQ-1; Wed, 15 Jan 2020 04:35:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 528B9800D4E;
	Wed, 15 Jan 2020 09:35:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F15D5C1D6;
	Wed, 15 Jan 2020 09:35:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B50EB824EC;
	Wed, 15 Jan 2020 09:35:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F9ZP72021464 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 04:35:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0AC83272A2; Wed, 15 Jan 2020 09:35:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE49277A5;
	Wed, 15 Jan 2020 09:35:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 00F9ZMgd011096; Wed, 15 Jan 2020 04:35:22 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 00F9ZMGF011093; Wed, 15 Jan 2020 04:35:22 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 15 Jan 2020 04:35:22 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Nikhil Kshirsagar <nkshirsa@redhat.com>
Message-ID: <alpine.LRH.2.02.2001150432500.10972@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: improve performance of large
 linear writes on SSDs
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
X-MC-Unique: gFG-tJYfODetnQKZEamzjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When dm-writecache is used with SSD as a cache device, it would submit
separate bio for each written block. The I/Os would be merged by the disk
scheduler, but this merging degrades performance.

This patch makes dm-writecache submit larger bios - we can submit large
bio as long as there is consecutive free space on the cache device.

Benchmark (arm64 with 64k page size, using /dev/ram0 as a cache device):

fio --bs=512k --iodepth=32 --size=400M --direct=1 --filename=/dev/mapper/cache --rw=randwrite --numjobs=1 --name=test

block	old	new
size	MiB/s	MiB/s
---------------------
512	181	700
1k	347	1256
2k	644	2020
4k	1183	2759
8k	1852	3333
16k	2469	3509
32k	2974	3670
64k	3404	3810

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-01-14 16:11:09.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-01-14 21:42:44.000000000 +0100
@@ -626,7 +626,7 @@ static void writecache_add_to_freelist(s
 	wc->freelist_size++;
 }
 
-static struct wc_entry *writecache_pop_from_freelist(struct dm_writecache *wc)
+static struct wc_entry *writecache_pop_from_freelist(struct dm_writecache *wc, sector_t expected_sector)
 {
 	struct wc_entry *e;
 
@@ -635,6 +635,8 @@ static struct wc_entry *writecache_pop_f
 		if (unlikely(!wc->current_free))
 			return NULL;
 		e = wc->current_free;
+		if (expected_sector != (sector_t)-1 && unlikely(cache_sector(wc, e) != expected_sector))
+			return NULL;
 		next = rb_next(&e->rb_node);
 		rb_erase(&e->rb_node, &wc->freetree);
 		if (unlikely(!next))
@@ -644,6 +646,8 @@ static struct wc_entry *writecache_pop_f
 		if (unlikely(list_empty(&wc->freelist)))
 			return NULL;
 		e = container_of(wc->freelist.next, struct wc_entry, lru);
+		if (expected_sector != (sector_t)-1 && unlikely(cache_sector(wc, e) != expected_sector))
+			return NULL;
 		list_del(&e->lru);
 	}
 	wc->freelist_size--;
@@ -1194,7 +1198,7 @@ read_next_block:
 					goto bio_copy;
 				}
 			}
-			e = writecache_pop_from_freelist(wc);
+			e = writecache_pop_from_freelist(wc, (sector_t)-1);
 			if (unlikely(!e)) {
 				writecache_wait_on_freelist(wc);
 				continue;
@@ -1206,9 +1210,25 @@ bio_copy:
 			if (WC_MODE_PMEM(wc)) {
 				bio_copy_block(wc, bio, memory_data(wc, e));
 			} else {
-				dm_accept_partial_bio(bio, wc->block_size >> SECTOR_SHIFT);
+				unsigned bio_size = wc->block_size;
+				sector_t start_cache_sec = cache_sector(wc, e);
+				sector_t current_cache_sec = start_cache_sec + (bio_size >> SECTOR_SHIFT);
+
+				while (bio_size < bio->bi_iter.bi_size) {
+					struct wc_entry *f = writecache_pop_from_freelist(wc, current_cache_sec);
+					if (!f)
+						break;
+					write_original_sector_seq_count(wc, f, bio->bi_iter.bi_sector + (bio_size >> SECTOR_SHIFT), wc->seq_count);
+					writecache_insert_entry(wc, f);
+					wc->uncommitted_blocks++;
+					bio_size += wc->block_size;
+					current_cache_sec += wc->block_size >> SECTOR_SHIFT;
+				}
+
 				bio_set_dev(bio, wc->ssd_dev->bdev);
-				bio->bi_iter.bi_sector = cache_sector(wc, e);
+				bio->bi_iter.bi_sector = start_cache_sec;
+				dm_accept_partial_bio(bio, bio_size >> SECTOR_SHIFT);
+
 				if (unlikely(wc->uncommitted_blocks >= wc->autocommit_blocks)) {
 					wc->uncommitted_blocks = 0;
 					queue_work(wc->writeback_wq, &wc->flush_work);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

