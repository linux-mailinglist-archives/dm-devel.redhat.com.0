Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 138A11A2907
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 21:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586372567;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IRc4CvW7Kc6cdzeIhs7TNTdLYp0g8a7r95jDBMhPU/c=;
	b=eSiAdYBOsZulTqMpJCCBk4LBD0/pDjyAUwqPrGI8vRxWgU3jxroNMpnYd4jF32BLKXsBHW
	KXQVPnIKwDqfpbTpFDq24NLIHMQ1uugFBZXVRv6ya9ZDEF8OAjxpiMHEisHdMzyGIAkClx
	PaxLVO2UAu9bSP/UMk5Ekyk11zmYP1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-VEMvqOCaM4uisVIm8bNDVw-1; Wed, 08 Apr 2020 15:02:45 -0400
X-MC-Unique: VEMvqOCaM4uisVIm8bNDVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 522E2A0CD1;
	Wed,  8 Apr 2020 19:02:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB03611B25D;
	Wed,  8 Apr 2020 19:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD9F293A88;
	Wed,  8 Apr 2020 19:02:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038J2HMO031041 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 15:02:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CCD5DA7C; Wed,  8 Apr 2020 19:02:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE2CA5D9C9;
	Wed,  8 Apr 2020 19:02:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 038J2E94015723; Wed, 8 Apr 2020 15:02:14 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 038J2EP0015719; Wed, 8 Apr 2020 15:02:14 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 8 Apr 2020 15:02:14 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
Message-ID: <alpine.LRH.2.02.2004081459520.14853@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm writecache: fix data corruption when
 reloading the target
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

The dm-writecache reads metadata in the target constructor. However, when 
we reload the target, there could be another active instance running on 
the same device. This is the sequence of operations when doing a reload:

1. construct new target
2. suspend old target
3. resume new target
4. destroy old target

Metadata that were written by the old target between steps 1 and 2 would
not be visible by the new target.

This patch fixes the data corruption by loading the metadata in the resume
handler.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.18+
Fixes: 48debafe4f2f ("dm: add writecache target")

---
 drivers/md/dm-writecache.c |   44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-08 14:47:17.000000000 +0200
+++ linux-2.6/drivers/md/dm-writecache.c	2020-04-08 20:59:15.000000000 +0200
@@ -931,6 +931,24 @@ static int writecache_alloc_entries(stru
 	return 0;
 }
 
+static int writecache_read_metadata(struct dm_writecache *wc, sector_t n_sectors)
+{
+	struct dm_io_region region;
+	struct dm_io_request req;
+
+	region.bdev = wc->ssd_dev->bdev;
+	region.sector = wc->start_sector;
+	region.count = wc->metadata_sectors;
+	req.bi_op = REQ_OP_READ;
+	req.bi_op_flags = REQ_SYNC;
+	req.mem.type = DM_IO_VMA;
+	req.mem.ptr.vma = (char *)wc->memory_map;
+	req.client = wc->dm_io;
+	req.notify.fn = NULL;
+
+	return dm_io(&req, 1, &region, NULL);
+}
+
 static void writecache_resume(struct dm_target *ti)
 {
 	struct dm_writecache *wc = ti->private;
@@ -941,8 +959,16 @@ static void writecache_resume(struct dm_
 
 	wc_lock(wc);
 
-	if (WC_MODE_PMEM(wc))
+	if (WC_MODE_PMEM(wc)) {
 		persistent_memory_invalidate_cache(wc->memory_map, wc->memory_map_size);
+	} else {
+		r = writecache_read_metadata(wc, wc->metadata_sectors);
+		if (r) {
+			writecache_error(wc, r, "unable to read metadata: %d", r);
+			memset((char *)wc->memory_map + offsetof(struct wc_memory_superblock, entries), -1,
+			       (wc->metadata_sectors << SECTOR_SHIFT) - offsetof(struct wc_memory_superblock, entries));
+		}
+	}
 
 	wc->tree = RB_ROOT;
 	INIT_LIST_HEAD(&wc->lru);
@@ -2200,8 +2226,6 @@ invalid_optional:
 			goto bad;
 		}
 	} else {
-		struct dm_io_region region;
-		struct dm_io_request req;
 		size_t n_blocks, n_metadata_blocks;
 		uint64_t n_bitmap_bits;
 
@@ -2258,17 +2282,9 @@ invalid_optional:
 			goto bad;
 		}
 
-		region.bdev = wc->ssd_dev->bdev;
-		region.sector = wc->start_sector;
-		region.count = wc->metadata_sectors;
-		req.bi_op = REQ_OP_READ;
-		req.bi_op_flags = REQ_SYNC;
-		req.mem.type = DM_IO_VMA;
-		req.mem.ptr.vma = (char *)wc->memory_map;
-		req.client = wc->dm_io;
-		req.notify.fn = NULL;
-
-		r = dm_io(&req, 1, &region, NULL);
+		r = writecache_read_metadata(wc,
+			min((sector_t)bdev_logical_block_size(wc->ssd_dev->bdev) >> SECTOR_SHIFT,
+			    (sector_t)wc->metadata_sectors));
 		if (r) {
 			ti->error = "Unable to read metadata";
 			goto bad;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

