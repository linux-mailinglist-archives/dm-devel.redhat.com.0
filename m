Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 730C43D7700
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jul 2021 15:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627393382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2B12+yKr8YzBFv/sK/nVYVAUz/gSWekHmSdg2+awHR8=;
	b=hlvEcnx5pwyOfhaiomQcQfP/KTbtrOWcxorVZrS4eJ+XR5bUw4NhoDra1IQVr4VceuEVCn
	Ej/dcc2WQdtxveB+04NFXyI+egg2VMSDZCxxciYUZHwriV4RL0vz1CeWXyMQEFc/5cc6JY
	kTQdYdueTQIRpHK0e//9j9dqlhHjCDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-htwrcmsuMWaRUKsFUzHZZw-1; Tue, 27 Jul 2021 09:43:00 -0400
X-MC-Unique: htwrcmsuMWaRUKsFUzHZZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143B51006C81;
	Tue, 27 Jul 2021 13:42:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0045160862;
	Tue, 27 Jul 2021 13:42:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19BAB4BB7C;
	Tue, 27 Jul 2021 13:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RDgPCL028225 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 09:42:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA0B35DEFB; Tue, 27 Jul 2021 13:42:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4537A5D9FC;
	Tue, 27 Jul 2021 13:42:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 16RDgLUC000592; Tue, 27 Jul 2021 09:42:21 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 16RDgLE3000588; Tue, 27 Jul 2021 09:42:21 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 27 Jul 2021 09:42:21 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2107270940580.494@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, dm-devel@redhat.com,
	Joe Thornber <thornber@redhat.com>
Subject: [dm-devel] [PATCH] dm-writecache: add event counters
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds 10 counters for various events and exports them in the
status line. It also adds a message "clear_stats" that resets the
counters.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 Documentation/admin-guide/device-mapper/writecache.rst |   16 ++++
 drivers/md/dm-writecache.c                             |   56 ++++++++++++++++-
 2 files changed, 67 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2021-07-26 18:46:19.000000000 +0200
+++ linux-2.6/drivers/md/dm-writecache.c	2021-07-27 15:29:19.000000000 +0200
@@ -206,6 +206,19 @@ struct dm_writecache {
 
 	struct bio_set bio_set;
 	mempool_t copy_pool;
+
+	struct {
+		unsigned long long reads;
+		unsigned long long read_hits;
+		unsigned long long writes;
+		unsigned long long write_hits_uncommitted;
+		unsigned long long write_hits_committed;
+		unsigned long long writes_around;
+		unsigned long long writes_allocate;
+		unsigned long long writes_blocked_on_freelist;
+		unsigned long long flushes;
+		unsigned long long discards;
+	} stats;
 };
 
 #define WB_LIST_INLINE		16
@@ -1157,6 +1170,18 @@ static int process_cleaner_mesg(unsigned
 	return 0;
 }
 
+static int process_clear_stats_mesg(unsigned argc, char **argv, struct dm_writecache *wc)
+{
+	if (argc != 1)
+		return -EINVAL;
+
+	wc_lock(wc);
+	memset(&wc->stats, 0, sizeof wc->stats);
+	wc_unlock(wc);
+
+	return 0;
+}
+
 static int writecache_message(struct dm_target *ti, unsigned argc, char **argv,
 			      char *result, unsigned maxlen)
 {
@@ -1169,6 +1194,8 @@ static int writecache_message(struct dm_
 		r = process_flush_on_suspend_mesg(argc, argv, wc);
 	else if (!strcasecmp(argv[0], "cleaner"))
 		r = process_cleaner_mesg(argc, argv, wc);
+	else if (!strcasecmp(argv[0], "clear_stats"))
+		r = process_clear_stats_mesg(argc, argv, wc);
 	else
 		DMERR("unrecognised message received: %s", argv[0]);
 
@@ -1321,8 +1348,10 @@ static enum wc_map_op writecache_map_rea
 	struct wc_entry *e;
 
 read_next_block:
+	wc->stats.reads++;
 	e = writecache_find_entry(wc, bio->bi_iter.bi_sector, WFE_RETURN_FOLLOWING);
 	if (e && read_original_sector(wc, e) == bio->bi_iter.bi_sector) {
+		wc->stats.read_hits++;
 		if (WC_MODE_PMEM(wc)) {
 			bio_copy_block(wc, bio, memory_data(wc, e));
 			if (bio->bi_iter.bi_size)
@@ -1401,14 +1430,17 @@ static enum wc_map_op writecache_map_wri
 	do {
 		bool found_entry = false;
 		bool search_used = false;
+		wc->stats.writes++;
 		if (writecache_has_error(wc))
 			return WC_MAP_ERROR;
 		e = writecache_find_entry(wc, bio->bi_iter.bi_sector, 0);
 		if (e) {
 			if (!writecache_entry_is_committed(wc, e)) {
+				wc->stats.write_hits_uncommitted++;
 				search_used = true;
 				goto bio_copy;
 			}
+			wc->stats.write_hits_committed++;
 			if (!WC_MODE_PMEM(wc) && !e->write_in_progress) {
 				wc->overwrote_committed = true;
 				search_used = true;
@@ -1424,15 +1456,18 @@ static enum wc_map_op writecache_map_wri
 		if (unlikely(!e)) {
 			if (!WC_MODE_PMEM(wc) && !found_entry) {
 direct_write:
+				wc->stats.writes_around++;
 				e = writecache_find_entry(wc, bio->bi_iter.bi_sector, WFE_RETURN_FOLLOWING);
 				return writecache_map_remap_origin(wc, bio, e);
 			}
+			wc->stats.writes_blocked_on_freelist++;
 			writecache_wait_on_freelist(wc);
 			continue;
 		}
 		write_original_sector_seq_count(wc, e, bio->bi_iter.bi_sector, wc->seq_count);
 		writecache_insert_entry(wc, e);
 		wc->uncommitted_blocks++;
+		wc->stats.writes_allocate++;
 bio_copy:
 		if (WC_MODE_PMEM(wc))
 			bio_copy_block(wc, bio, memory_data(wc, e));
@@ -1454,6 +1489,7 @@ static enum wc_map_op writecache_map_flu
 		return WC_MAP_ERROR;
 
 	if (WC_MODE_PMEM(wc)) {
+		wc->stats.flushes++;
 		writecache_flush(wc);
 		if (writecache_has_error(wc))
 			return WC_MAP_ERROR;
@@ -1464,12 +1500,15 @@ static enum wc_map_op writecache_map_flu
 	/* SSD: */
 	if (dm_bio_get_target_bio_nr(bio))
 		return WC_MAP_REMAP_ORIGIN;
+	wc->stats.flushes++;
 	writecache_offload_bio(wc, bio);
 	return WC_MAP_RETURN;
 }
 
 static enum wc_map_op writecache_map_discard(struct dm_writecache *wc, struct bio *bio)
 {
+	wc->stats.discards++;
+
 	if (writecache_has_error(wc))
 		return WC_MAP_ERROR;
 
@@ -2616,9 +2655,20 @@ static void writecache_status(struct dm_
 
 	switch (type) {
 	case STATUSTYPE_INFO:
-		DMEMIT("%ld %llu %llu %llu", writecache_has_error(wc),
+		DMEMIT("%ld %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
+		       writecache_has_error(wc),
 		       (unsigned long long)wc->n_blocks, (unsigned long long)wc->freelist_size,
-		       (unsigned long long)wc->writeback_size);
+		       (unsigned long long)wc->writeback_size,
+		       wc->stats.reads,
+		       wc->stats.read_hits,
+		       wc->stats.writes,
+		       wc->stats.write_hits_uncommitted,
+		       wc->stats.write_hits_committed,
+		       wc->stats.writes_around,
+		       wc->stats.writes_allocate,
+		       wc->stats.writes_blocked_on_freelist,
+		       wc->stats.flushes,
+		       wc->stats.discards);
 		break;
 	case STATUSTYPE_TABLE:
 		DMEMIT("%c %s %s %u ", WC_MODE_PMEM(wc) ? 'p' : 's',
@@ -2676,7 +2726,7 @@ static void writecache_status(struct dm_
 
 static struct target_type writecache_target = {
 	.name			= "writecache",
-	.version		= {1, 5, 0},
+	.version		= {1, 6, 0},
 	.module			= THIS_MODULE,
 	.ctr			= writecache_ctr,
 	.dtr			= writecache_dtr,
Index: linux-2.6/Documentation/admin-guide/device-mapper/writecache.rst
===================================================================
--- linux-2.6.orig/Documentation/admin-guide/device-mapper/writecache.rst	2021-07-12 15:29:03.000000000 +0200
+++ linux-2.6/Documentation/admin-guide/device-mapper/writecache.rst	2021-07-27 12:11:05.000000000 +0200
@@ -78,13 +78,23 @@ Status:
 2. the number of blocks
 3. the number of free blocks
 4. the number of blocks under writeback
+5. the number of read requests
+6. the number of read requests that hit the cache
+7. the number of write requests
+8. the number of write requests that hit uncommitted block
+9. the number of write requests that hit committed block
+10. the number of write requests that bypass the cache
+11. the number of write requests that are allocated in the cache
+12. the number of write requests that are blocked on the freelist
+13. the number of flush requests
+14. the number of discard requests
 
 Messages:
 	flush
-		flush the cache device. The message returns successfully
+		Flush the cache device. The message returns successfully
 		if the cache device was flushed without an error
 	flush_on_suspend
-		flush the cache device on next suspend. Use this message
+		Flush the cache device on next suspend. Use this message
 		when you are going to remove the cache device. The proper
 		sequence for removing the cache device is:
 
@@ -98,3 +108,5 @@ Messages:
 		6. the cache device is now inactive and it can be deleted
 	cleaner
 		See above "cleaner" constructor documentation.
+	clear_stats
+		Clear the statistics that are reported on the status line

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

