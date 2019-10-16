Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8FD9261
	for <lists+dm-devel@lfdr.de>; Wed, 16 Oct 2019 15:24:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8F3B20F7;
	Wed, 16 Oct 2019 13:24:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B00795D9CD;
	Wed, 16 Oct 2019 13:24:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07A824EE68;
	Wed, 16 Oct 2019 13:24:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9GDLtMo023727 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Oct 2019 09:21:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1D04610C6; Wed, 16 Oct 2019 13:21:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1C2460C80;
	Wed, 16 Oct 2019 13:21:50 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x9GDLoql009080; Wed, 16 Oct 2019 09:21:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x9GDLops009076; Wed, 16 Oct 2019 09:21:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 16 Oct 2019 09:21:50 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Joe Thornber <thornber@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.1910160917260.8310@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-cache: fix bugs when a GFP_NOWAIT allocation
	fails
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Wed, 16 Oct 2019 13:24:39 +0000 (UTC)

GFP_NOWAIT allocation can fail anytime - it doesn't wait for memory being
available and it fails if the mempool is exhausted and there is not enough
memory.

If we go down this path:
  map_bio -> mg_start -> alloc_migration -> mempool_alloc(GFP_NOWAIT)
we can see that map_bio doesn't check the return value of mg_start, and
the bio is leaked.

If we go down this path:
  map_bio -> mg_start -> mg_lock_writes -> alloc_prison_cell ->
  dm_bio_prison_alloc_cell_v2 -> mempool_alloc(GFP_NOWAIT) ->
  mg_lock_writes -> mg_complete
the bio is ended with an error - it is unacceptable because it could cause
filesystem corruption if the machine ran out of memory temporarily.

This pactch changes GFP_NOWAIT to GFP_NOIO, so that the mempool code will
properly wait until memory becomes available. mempool_alloc with GFP_NOIO
can't fail, so I deleted the code paths that deal with the failure.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-cache-target.c |   28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

Index: linux-2.6/drivers/md/dm-cache-target.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-cache-target.c	2019-10-10 16:52:03.000000000 +0200
+++ linux-2.6/drivers/md/dm-cache-target.c	2019-10-16 13:23:13.000000000 +0200
@@ -542,7 +542,7 @@ static void wake_migration_worker(struct
 
 static struct dm_bio_prison_cell_v2 *alloc_prison_cell(struct cache *cache)
 {
-	return dm_bio_prison_alloc_cell_v2(cache->prison, GFP_NOWAIT);
+	return dm_bio_prison_alloc_cell_v2(cache->prison, GFP_NOIO);
 }
 
 static void free_prison_cell(struct cache *cache, struct dm_bio_prison_cell_v2 *cell)
@@ -554,9 +554,7 @@ static struct dm_cache_migration *alloc_
 {
 	struct dm_cache_migration *mg;
 
-	mg = mempool_alloc(&cache->migration_pool, GFP_NOWAIT);
-	if (!mg)
-		return NULL;
+	mg = mempool_alloc(&cache->migration_pool, GFP_NOIO);
 
 	memset(mg, 0, sizeof(*mg));
 
@@ -664,10 +662,6 @@ static bool bio_detain_shared(struct cac
 	struct dm_bio_prison_cell_v2 *cell_prealloc, *cell;
 
 	cell_prealloc = alloc_prison_cell(cache); /* FIXME: allow wait if calling from worker */
-	if (!cell_prealloc) {
-		defer_bio(cache, bio);
-		return false;
-	}
 
 	build_key(oblock, end, &key);
 	r = dm_cell_get_v2(cache->prison, &key, lock_level(bio), bio, cell_prealloc, &cell);
@@ -1493,11 +1487,6 @@ static int mg_lock_writes(struct dm_cach
 	struct dm_bio_prison_cell_v2 *prealloc;
 
 	prealloc = alloc_prison_cell(cache);
-	if (!prealloc) {
-		DMERR_LIMIT("%s: alloc_prison_cell failed", cache_device_name(cache));
-		mg_complete(mg, false);
-		return -ENOMEM;
-	}
 
 	/*
 	 * Prevent writes to the block, but allow reads to continue.
@@ -1535,11 +1524,6 @@ static int mg_start(struct cache *cache,
 	}
 
 	mg = alloc_migration(cache);
-	if (!mg) {
-		policy_complete_background_work(cache->policy, op, false);
-		background_work_end(cache);
-		return -ENOMEM;
-	}
 
 	mg->op = op;
 	mg->overwrite_bio = bio;
@@ -1628,10 +1612,6 @@ static int invalidate_lock(struct dm_cac
 	struct dm_bio_prison_cell_v2 *prealloc;
 
 	prealloc = alloc_prison_cell(cache);
-	if (!prealloc) {
-		invalidate_complete(mg, false);
-		return -ENOMEM;
-	}
 
 	build_key(mg->invalidate_oblock, oblock_succ(mg->invalidate_oblock), &key);
 	r = dm_cell_lock_v2(cache->prison, &key,
@@ -1669,10 +1649,6 @@ static int invalidate_start(struct cache
 		return -EPERM;
 
 	mg = alloc_migration(cache);
-	if (!mg) {
-		background_work_end(cache);
-		return -ENOMEM;
-	}
 
 	mg->overwrite_bio = bio;
 	mg->invalidate_cblock = cblock;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
