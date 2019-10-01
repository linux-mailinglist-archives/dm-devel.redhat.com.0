Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4BC338D
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 13:58:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DE7010C0515;
	Tue,  1 Oct 2019 11:58:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D9A26343;
	Tue,  1 Oct 2019 11:58:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB0AC4EE6D;
	Tue,  1 Oct 2019 11:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91BwWqh020668 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 07:58:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E2CB10495B5; Tue,  1 Oct 2019 11:58:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C42410495D1
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 11:58:24 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F4DE30860A6
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 11:58:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z9so2020724wrl.11
	for <dm-devel@redhat.com>; Tue, 01 Oct 2019 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWuRxchipw8okvK4sNZmnOkcN9u0hZ3sgHSZlN+NGnE=;
	b=WWFiYiVjnGpJfiiMVrG36pNhgDgokMPqzfn2tbh5gSdEo3ggwd3/GPXgcyp/WRHYXP
	Ddi1x0Clx017wTY1dW/cpdv1j5sJficEjwZ/7uJKwdzbYq5R11O61kdcZHKWRbrY1oba
	ZFohjxphBa/8qrDqR96iLj7UmbE28jEhwDG20cKmv8qc1wMfwj/d0yTANkDMB0HLpfoJ
	qxYIMLiuvSykyPPBxNGX65TKM2hLsHrgwcnpeb/HQi2JMD3und0CwIKtWG+gJHr6qPm4
	+pR6Y25l4Bn8T+fpi5mRhXUa+DQGEUKYNQOoVIaGsWmcaL9ov9u4ovCP55L3GTiloo23
	R9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MWuRxchipw8okvK4sNZmnOkcN9u0hZ3sgHSZlN+NGnE=;
	b=WMZLcwOnJZ9cMMBfHVpcCAcMyZFP6Irn5e9lrnBKi8gVyuBmH2ZhNRl6ukM01OselG
	sAEDKmbdIFjLxAcmlGjZ8kSrnMjxY+ekNYU7CxXOZ/KFUlSN32vhL/cQwLBe7wK/9c+y
	vMLTRwzs8kkst9MvFWF4mb8eA6mbCsgLtjOMEvLAO9TBNkqiT1ZonxEULJO/pZkPEU7W
	O404hHWWFZ8Dbu1zg7P7D7mHs76PG3K8ZLdzJE7Szsrgwo7SAUSMJ5hj95J8oS+ElpP5
	1TRY32KEz81YhUVc+FIeu9YtvLV75cYWr7nDIvdqySmAvKaK81tdcNubD+feyiG15riw
	849Q==
X-Gm-Message-State: APjAAAXgwoD59PPqmBkvYAScDpG+9J5G/L4h3/H1aQl0e8Wgij4r4FTy
	Ips+oqXVQCCl+d6D3o11hPTAZg==
X-Google-Smtp-Source: APXvYqxdkW6rvw126w/F+h1asHQ0fHELlhVFg/iYJhQOX9SsbK08W0hMQxTJEyr+1bbMyjV3u4gLAQ==
X-Received: by 2002:adf:dc91:: with SMTP id r17mr17818849wrj.22.1569931097957; 
	Tue, 01 Oct 2019 04:58:17 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	b12sm15589174wrt.21.2019.10.01.04.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 04:58:17 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Tue,  1 Oct 2019 14:57:47 +0300
Message-Id: <20191001115747.4473-2-ntsironis@arrikto.com>
In-Reply-To: <20191001115747.4473-1-ntsironis@arrikto.com>
References: <20191001115747.4473-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 01 Oct 2019 11:58:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 01 Oct 2019 11:58:19 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com, guru2018@gmail.com
Subject: [dm-devel] [PATCH 1/1] dm snapshot: Fix bug in COW throttling
	mechanism causing deadlocks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Tue, 01 Oct 2019 11:58:52 +0000 (UTC)

Commit 721b1d98fb517a ("dm snapshot: Fix excessive memory usage and
workqueue stalls") introduced a semaphore to limit the maximum number of
in-flight kcopyd (COW) jobs.

The implementation of this throttling mechanism is prone to a deadlock:

1. One or more threads write to the origin device causing COW, which is
   performed by kcopyd.

2. At some point some of these threads might reach the s->cow_count
   semaphore limit and block in down(&s->cow_count), holding a read lock
   on _origins_lock.

3. Someone tries to acquire a write lock on _origins_lock, e.g.,
   snapshot_ctr(), which blocks because the threads at step (2) already
   hold a read lock on it.

4. A COW operation completes and kcopyd runs dm-snapshot's completion
   callback, which ends up calling pending_complete().
   pending_complete() tries to resubmit any deferred origin bios. This
   requires acquiring a read lock on _origins_lock, which blocks.

   This happens because the read-write semaphore implementation gives
   priority to writers, meaning that as soon as a writer tries to enter
   the critical section, no readers will be allowed in, until all
   writers have completed their work.

   So, pending_complete() waits for the writer at step (3) to acquire
   and release the lock. This writer waits for the readers at step (2)
   to release the read lock and those readers wait for
   pending_complete() (the kcopyd thread) to signal the s->cow_count
   semaphore: DEADLOCK.

Fix this by delegating the resubmission of any deferred origin bios to
another thread, so the kcopyd thread never tries to acquire
_origins_lock and it's free to continue its work and signal the
s->cow_count semaphore.

Cc: stable@vger.kernel.org
Fixes: 721b1d98fb517a ("dm snapshot: Fix excessive memory usage and workqueue stalls")
Reported-by: Guruswamy Basavaiah <guru2018@gmail.com>
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-snap.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index f150f5c5492b..d701fe53bc96 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -4,6 +4,7 @@
  * This file is released under the GPL.
  */
 
+#include <linux/bio.h>
 #include <linux/blkdev.h>
 #include <linux/device-mapper.h>
 #include <linux/delay.h>
@@ -19,6 +20,7 @@
 #include <linux/log2.h>
 #include <linux/dm-kcopyd.h>
 #include <linux/semaphore.h>
+#include <linux/workqueue.h>
 
 #include "dm.h"
 
@@ -94,11 +96,12 @@ struct dm_snapshot {
 	struct dm_exception_table pending;
 	struct dm_exception_table complete;
 
-	/*
-	 * pe_lock protects all pending_exception operations and access
-	 * as well as the snapshot_bios list.
-	 */
-	spinlock_t pe_lock;
+	/* Origin bios queued for resubmission to the origin device. */
+	spinlock_t deferred_bios_lock;
+	struct bio_list deferred_origin_bios;
+
+	struct workqueue_struct *wq;
+	struct work_struct deferred_bios_work;
 
 	/* Chunks with outstanding reads */
 	spinlock_t tracked_chunk_lock;
@@ -1224,6 +1227,8 @@ static int parse_snapshot_features(struct dm_arg_set *as, struct dm_snapshot *s,
 	return r;
 }
 
+static void process_deferred_bios(struct work_struct *work);
+
 /*
  * Construct a snapshot mapping:
  * <origin_dev> <COW-dev> <p|po|n> <chunk-size> [<# feature args> [<arg>]*]
@@ -1313,7 +1318,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	s->out_of_order_tree = RB_ROOT;
 	init_rwsem(&s->lock);
 	INIT_LIST_HEAD(&s->list);
-	spin_lock_init(&s->pe_lock);
+	spin_lock_init(&s->deferred_bios_lock);
+	bio_list_init(&s->deferred_origin_bios);
 	s->state_bits = 0;
 	s->merge_failed = 0;
 	s->first_merging_chunk = 0;
@@ -1336,6 +1342,15 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad_kcopyd;
 	}
 
+	s->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
+	if (!s->wq) {
+		ti->error = "Could not allocate workqueue";
+		r = -ENOMEM;
+		goto bad_workqueue;
+	}
+
+	INIT_WORK(&s->deferred_bios_work, process_deferred_bios);
+
 	r = mempool_init_slab_pool(&s->pending_pool, MIN_IOS, pending_cache);
 	if (r) {
 		ti->error = "Could not allocate mempool for pending exceptions";
@@ -1401,6 +1416,8 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 bad_load_and_register:
 	mempool_exit(&s->pending_pool);
 bad_pending_pool:
+	destroy_workqueue(s->wq);
+bad_workqueue:
 	dm_kcopyd_client_destroy(s->kcopyd_client);
 bad_kcopyd:
 	dm_exception_table_exit(&s->pending, pending_cache);
@@ -1423,6 +1440,12 @@ static void __free_exceptions(struct dm_snapshot *s)
 	dm_kcopyd_client_destroy(s->kcopyd_client);
 	s->kcopyd_client = NULL;
 
+	/*
+	 * destroy_workqueue() drains the workqueue so any pending origin bios
+	 * will be sumbitted before it returns.
+	 */
+	destroy_workqueue(s->wq);
+
 	dm_exception_table_exit(&s->pending, pending_cache);
 	dm_exception_table_exit(&s->complete, exception_cache);
 }
@@ -1534,9 +1557,11 @@ static int do_origin(struct dm_dev *origin, struct bio *bio);
  */
 static void retry_origin_bios(struct dm_snapshot *s, struct bio *bio)
 {
+	struct blk_plug plug;
 	struct bio *n;
 	int r;
 
+	blk_start_plug(&plug);
 	while (bio) {
 		n = bio->bi_next;
 		bio->bi_next = NULL;
@@ -1545,6 +1570,28 @@ static void retry_origin_bios(struct dm_snapshot *s, struct bio *bio)
 			generic_make_request(bio);
 		bio = n;
 	}
+	blk_finish_plug(&plug);
+}
+
+static void process_deferred_bios(struct work_struct *work)
+{
+	struct dm_snapshot *s = container_of(work, typeof(*s), deferred_bios_work);
+	struct bio *origin_bios;
+
+	spin_lock(&s->deferred_bios_lock);
+	origin_bios = bio_list_get(&s->deferred_origin_bios);
+	spin_unlock(&s->deferred_bios_lock);
+
+	retry_origin_bios(s, origin_bios);
+}
+
+static void issue_origin_bios(struct dm_snapshot *s, struct bio_list *origin_bios)
+{
+	spin_lock(&s->deferred_bios_lock);
+	bio_list_merge(&s->deferred_origin_bios, origin_bios);
+	spin_unlock(&s->deferred_bios_lock);
+
+	queue_work(s->wq, &s->deferred_bios_work);
 }
 
 /*
@@ -1592,7 +1639,6 @@ static void pending_complete(void *context, int success)
 	struct dm_snap_pending_exception *pe = context;
 	struct dm_exception *e;
 	struct dm_snapshot *s = pe->snap;
-	struct bio *origin_bios = NULL;
 	struct bio *snapshot_bios = NULL;
 	struct bio *full_bio = NULL;
 	struct dm_exception_table_lock lock;
@@ -1653,7 +1699,6 @@ static void pending_complete(void *context, int success)
 	dm_exception_table_unlock(&lock);
 
 	snapshot_bios = bio_list_get(&pe->snapshot_bios);
-	origin_bios = bio_list_get(&pe->origin_bios);
 	full_bio = pe->full_bio;
 	if (full_bio)
 		full_bio->bi_end_io = pe->full_bio_end_io;
@@ -1670,7 +1715,43 @@ static void pending_complete(void *context, int success)
 		flush_bios(snapshot_bios);
 	}
 
-	retry_origin_bios(s, origin_bios);
+	/*
+	 * In order to retry the origin bios we have to acquire a read lock on
+	 * _origins_lock. This could lead to a deadlock:
+	 *
+	 * 1. One or more threads write to the origin device causing COW, which
+	 *    is performed by kcopyd.
+	 *
+	 * 2. At some point some of these threads might reach the s->cow_count
+	 *    semaphore limit and block in down(&s->cow_count), holding a read
+	 *    lock on _origins_lock.
+	 *
+	 * 3. Someone tries to acquire a write lock on _origins_lock, e.g.,
+	 *    snapshot_ctr(), which blocks because the threads at step (2)
+	 *    already hold a read lock on it.
+	 *
+	 * 4. A COW operation completes and kcopyd runs our completion
+	 *    callback, which ends up calling pending_complete(). If we
+	 *    resubmit the origin bios from pending_complete(), which runs in
+	 *    the kcopyd thread, it will block trying to acquire a read lock on
+	 *    _origins_lock.
+	 *
+	 *    This happens because the read-write semaphore implementation
+	 *    gives priority to writers, meaning that as soon as a writer tries
+	 *    to enter the critical section, no readers will be allowed in,
+	 *    until all writers have completed their work.
+	 *
+	 *    So, we wait for the writer at step (3) to acquire and release the
+	 *    lock. This writer waits for the readers at step (2) to release
+	 *    the read lock and those readers wait for us (the kcopyd thread)
+	 *    to signal the s->cow_count semaphore: DEADLOCK.
+	 *
+	 * To avoid this we delegate the resubmission of the origin bios to
+	 * another thread, so the kcopyd thread never tries to acquire
+	 * _origins_lock and it's free to continue its work and signal the
+	 * s->cow_count semaphore.
+	 */
+	issue_origin_bios(s, &pe->origin_bios);
 
 	free_pending_exception(pe);
 }
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
