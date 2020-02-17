Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 39AE7161245
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 13:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581943428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q2WhzEnPNC4lqq5KsnwCnnbxDnPzYGxw2QLIFCamP8I=;
	b=Tir4QKkqSeCwakm5t477mKlLenPSyb3/Lb1mHsJtqogM8UL1wbBULOn1995kTr+MTZEem+
	1UTliBSXhq8N+jyg/36jpGoKmHCaaPTNpylmWUrRc0rxoG9c17eIVHWJ3ci/y6Oo1UxF/u
	c3RHu6FfvRmMF1G6ARiLT7lNgrlwO9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-xbPJyv6uMjGSWIcpN6A0mw-1; Mon, 17 Feb 2020 07:43:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5652108442F;
	Mon, 17 Feb 2020 12:43:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4F760BF1;
	Mon, 17 Feb 2020 12:43:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8F1835AF1;
	Mon, 17 Feb 2020 12:43:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HCh7S4032754 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 07:43:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32E8519488; Mon, 17 Feb 2020 12:43:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6722526542;
	Mon, 17 Feb 2020 12:43:04 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01HCh3I5018785; Mon, 17 Feb 2020 07:43:03 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01HCh3hu018782; Mon, 17 Feb 2020 07:43:03 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 17 Feb 2020 07:43:03 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>, 
	David Teigland <teigland@redhat.com>, Ondrej Kozina <okozina@redhat.com>
Message-ID: <alpine.LRH.2.02.2002170739420.18605@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v2] dm integrity: fix a deadlock due to
 offloading to an incorrect workqueue (fwd)
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
X-MC-Unique: xbPJyv6uMjGSWIcpN6A0mw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we need to perform synchronous I/O in the function
dm_integrity_map_continue, we must make sure that we are not in the map
function - in order to avoid the deadlock due to bio queuing in
generic_make_request. To avoid the deadlock, we offload the request to
metadata_wq.

However, metadata_wq also processes metadata updates for write requests.
If there are too many requests that get offloaded to metadata_wq at the
beginning of dm_integrity_map_continue, the workqueue metadata_wq
becomes clogged and the system is incapable of processing any metadata updates.

This causes a deadlock because all the requests that need to do metadata
updates wait for metadata_wq to proceed and metadata_wq waits inside
wait_and_add_new_range until some existing request releases its range
lock (which doesn't happen because the range lock is released after
metadata update).

In order to fix the deadlock, we create a new workqueue offload_wq and
offload requests to it - so that processing of offload_wq is independent
from processing of metadata_wq.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Heinz Mauelshagen <heinzm@redhat.com>
Tested-by: Heinz Mauelshagen <heinzm@redhat.com>
Cc: stable@vger.kernel.org	# v4.12+
Fixes: 7eada909bfd7 ("dm: add integrity target")
Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 drivers/md/dm-integrity.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b225b3e445fa..996215d7dd61 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -212,6 +212,7 @@ struct dm_integrity_c {
 	struct list_head wait_list;
 	wait_queue_head_t endio_wait;
 	struct workqueue_struct *wait_wq;
+	struct workqueue_struct *offload_wq;
 
 	unsigned char commit_seq;
 	commit_id_t commit_ids[N_COMMIT_IDS];
@@ -1439,7 +1440,7 @@ static void dec_in_flight(struct dm_integrity_io *dio)
 			dio->range.logical_sector += dio->range.n_sectors;
 			bio_advance(bio, dio->range.n_sectors << SECTOR_SHIFT);
 			INIT_WORK(&dio->work, integrity_bio_wait);
-			queue_work(ic->wait_wq, &dio->work);
+			queue_work(ic->offload_wq, &dio->work);
 			return;
 		}
 		do_endio_flush(ic, dio);
@@ -1865,7 +1866,7 @@ static void dm_integrity_map_continue(struct dm_integrity_io *dio, bool from_map
 
 	if (need_sync_io && from_map) {
 		INIT_WORK(&dio->work, integrity_bio_wait);
-		queue_work(ic->metadata_wq, &dio->work);
+		queue_work(ic->offload_wq, &dio->work);
 		return;
 	}
 
@@ -2501,7 +2502,7 @@ static void bitmap_block_work(struct work_struct *w)
 				    dio->range.n_sectors, BITMAP_OP_TEST_ALL_SET)) {
 			remove_range(ic, &dio->range);
 			INIT_WORK(&dio->work, integrity_bio_wait);
-			queue_work(ic->wait_wq, &dio->work);
+			queue_work(ic->offload_wq, &dio->work);
 		} else {
 			block_bitmap_op(ic, ic->journal, dio->range.logical_sector,
 					dio->range.n_sectors, BITMAP_OP_SET);
@@ -2524,7 +2525,7 @@ static void bitmap_block_work(struct work_struct *w)
 
 		remove_range(ic, &dio->range);
 		INIT_WORK(&dio->work, integrity_bio_wait);
-		queue_work(ic->wait_wq, &dio->work);
+		queue_work(ic->offload_wq, &dio->work);
 	}
 
 	queue_delayed_work(ic->commit_wq, &ic->bitmap_flush_work, ic->bitmap_flush_interval);
@@ -3836,6 +3837,14 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		goto bad;
 	}
 
+	ic->offload_wq = alloc_workqueue("dm-integrity-offload", WQ_MEM_RECLAIM,
+					  METADATA_WORKQUEUE_MAX_ACTIVE);
+	if (!ic->offload_wq) {
+		ti->error = "Cannot allocate workqueue";
+		r = -ENOMEM;
+		goto bad;
+	}
+
 	ic->commit_wq = alloc_workqueue("dm-integrity-commit", WQ_MEM_RECLAIM, 1);
 	if (!ic->commit_wq) {
 		ti->error = "Cannot allocate workqueue";
@@ -4140,6 +4149,8 @@ static void dm_integrity_dtr(struct dm_target *ti)
 		destroy_workqueue(ic->metadata_wq);
 	if (ic->wait_wq)
 		destroy_workqueue(ic->wait_wq);
+	if (ic->offload_wq)
+		destroy_workqueue(ic->offload_wq);
 	if (ic->commit_wq)
 		destroy_workqueue(ic->commit_wq);
 	if (ic->writer_wq)
-- 
2.24.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

