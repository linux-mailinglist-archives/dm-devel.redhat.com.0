Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0928916A1F1
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BcT0Hy3qMU566Y4oabhFdSTY1HGs6LQS+dmeCZPt3+0=;
	b=ZurOXFODGBikCGNOV2hNb+/OOrkm3+9unNh4NHL+T1Rf8aOU07+lXZsM4jmpo4qIFdcSm6
	CGgoW/4lb8exJpfyobHmKfbp3kpxMz1iznBx9COF2xDdJ1k6fzGvHZKdqTvDsQPqBVXxIN
	xhyRlpuwpgz77l2U5T2HgeWOrulEt40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-PA7ESWrWNxqd7hcteAwQLQ-1; Mon, 24 Feb 2020 04:21:22 -0500
X-MC-Unique: PA7ESWrWNxqd7hcteAwQLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20069801E53;
	Mon, 24 Feb 2020 09:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB4648B755;
	Mon, 24 Feb 2020 09:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77F1B860E9;
	Mon, 24 Feb 2020 09:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9KuQd002009 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 58EEE60CCC; Mon, 24 Feb 2020 09:20:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA5F060BF4;
	Mon, 24 Feb 2020 09:20:55 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69v3-0001WT-DR; Mon, 24 Feb 2020 10:20:54 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:53 +0100
Message-Id: <20200224092053.135853080@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:33 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 6/7] dm-writecache: implement gradual cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-writecache-gradual-cleanup.patch

This patch implements gradual cleanup for dm-writecache - if the block is
stored in the cache for too long, it will be written to the underlying
device and cleaned up.

The patch adds a new option "max_age" that specified the maximum age of a
block in milliseconds.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-02-23 18:16:22.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-02-23 18:16:22.000000000 +0100
@@ -26,6 +26,7 @@
 #define AUTOCOMMIT_BLOCKS_SSD		65536
 #define AUTOCOMMIT_BLOCKS_PMEM		64
 #define AUTOCOMMIT_MSEC			1000
+#define MAX_AGE_DIV			16
 
 #define BITMAP_GRANULARITY	65536
 #if BITMAP_GRANULARITY < PAGE_SIZE
@@ -88,6 +89,7 @@ struct wc_entry {
 		:47
 #endif
 	;
+	unsigned long age;
 #ifdef DM_WRITECACHE_HANDLE_HARDWARE_ERRORS
 	uint64_t original_sector;
 	uint64_t seq_count;
@@ -119,6 +121,7 @@ struct dm_writecache {
 	size_t writeback_size;
 	size_t freelist_high_watermark;
 	size_t freelist_low_watermark;
+	unsigned long max_age;
 
 	unsigned uncommitted_blocks;
 	unsigned autocommit_blocks;
@@ -130,6 +133,8 @@ struct dm_writecache {
 	struct timer_list autocommit_timer;
 	struct wait_queue_head freelist_wait;
 
+	struct timer_list max_age_timer;
+
 	atomic_t bio_in_progress[2];
 	struct wait_queue_head bio_in_progress_wait[2];
 
@@ -597,6 +602,7 @@ static void writecache_insert_entry(stru
 	rb_link_node(&ins->rb_node, parent, node);
 	rb_insert_color(&ins->rb_node, &wc->tree);
 	list_add(&ins->lru, &wc->lru);
+	ins->age = jiffies;
 }
 
 static void writecache_unlink(struct dm_writecache *wc, struct wc_entry *e)
@@ -632,6 +638,15 @@ static inline void writecache_verify_wat
 		queue_work(wc->writeback_wq, &wc->writeback_work);
 }
 
+static void writecache_max_age_timer(struct timer_list *t)
+{
+	struct dm_writecache *wc = from_timer(wc, t, max_age_timer);
+	if (!dm_suspended(wc->ti) && !writecache_has_error(wc)) {
+		queue_work(wc->writeback_wq, &wc->writeback_work);
+		mod_timer(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
+	}
+}
+
 static struct wc_entry *writecache_pop_from_freelist(struct dm_writecache *wc, sector_t expected_sector)
 {
 	struct wc_entry *e;
@@ -838,6 +853,7 @@ static void writecache_suspend(struct dm
 	bool flush_on_suspend;
 
 	del_timer_sync(&wc->autocommit_timer);
+	del_timer_sync(&wc->max_age_timer);
 
 	wc_lock(wc);
 	writecache_flush(wc);
@@ -974,6 +990,9 @@ erase_this:
 
 	writecache_verify_watermark(wc);
 
+	if (wc->max_age != -1UL)
+		mod_timer(&wc->max_age_timer, jiffies + wc->max_age / MAX_AGE_DIV);
+
 	wc_unlock(wc);
 }
 
@@ -1661,7 +1680,8 @@ restart:
 	wbl.size = 0;
 	while (!list_empty(&wc->lru) &&
 	       (wc->writeback_all ||
-		wc->freelist_size + wc->writeback_size <= wc->freelist_low_watermark)) {
+		wc->freelist_size + wc->writeback_size <= wc->freelist_low_watermark ||
+		jiffies - container_of(wc->lru.prev, struct wc_entry, lru)->age >= wc->max_age - wc->max_age / MAX_AGE_DIV)) {
 
 		n_walked++;
 		if (unlikely(n_walked > WRITEBACK_LATENCY) &&
@@ -1924,9 +1944,11 @@ static int writecache_ctr(struct dm_targ
 	wc->ti = ti;
 
 	mutex_init(&wc->lock);
+	wc->max_age = -1UL;
 	writecache_poison_lists(wc);
 	init_waitqueue_head(&wc->freelist_wait);
 	timer_setup(&wc->autocommit_timer, writecache_autocommit_timer, 0);
+	timer_setup(&wc->max_age_timer, writecache_max_age_timer, 0);
 
 	for (i = 0; i < 2; i++) {
 		atomic_set(&wc->bio_in_progress[i], 0);
@@ -2100,6 +2122,14 @@ static int writecache_ctr(struct dm_targ
 				goto invalid_optional;
 			wc->autocommit_jiffies = msecs_to_jiffies(autocommit_msecs);
 			wc->autocommit_time_set = true;
+		} else if (!strcasecmp(string, "max_age") && opt_params >= 1) {
+			unsigned max_age_msecs;
+			string = dm_shift_arg(&as), opt_params--;
+			if (sscanf(string, "%u%c", &max_age_msecs, &dummy) != 1)
+				goto invalid_optional;
+			if (max_age_msecs > 86400000)
+				goto invalid_optional;
+			wc->max_age = msecs_to_jiffies(max_age_msecs);
 		} else if (!strcasecmp(string, "cleaner")) {
 			wc->cleaner = true;
 		} else if (!strcasecmp(string, "fua")) {
@@ -2361,6 +2391,8 @@ static void writecache_status(struct dm_
 			DMEMIT(" autocommit_blocks %u", wc->autocommit_blocks);
 		if (wc->autocommit_time_set)
 			DMEMIT(" autocommit_time %u", jiffies_to_msecs(wc->autocommit_jiffies));
+		if (wc->max_age != -1UL)
+			DMEMIT(" max_age %u", jiffies_to_msecs(wc->max_age));
 		if (wc->cleaner)
 			DMEMIT(" cleaner");
 		if (wc->writeback_fua_set)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

