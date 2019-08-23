Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BF9B164
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 15:55:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 289C885542;
	Fri, 23 Aug 2019 13:55:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC49460A9F;
	Fri, 23 Aug 2019 13:55:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EED424F30;
	Fri, 23 Aug 2019 13:55:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NDtVrY000923 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 09:55:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F57C261A7; Fri, 23 Aug 2019 13:55:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B36DF19C77;
	Fri, 23 Aug 2019 13:55:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x7NDtQpQ002147; Fri, 23 Aug 2019 09:55:26 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x7NDtQo9002143; Fri, 23 Aug 2019 09:55:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 23 Aug 2019 09:55:26 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Zhang Tao <kontais@zoho.com>
In-Reply-To: <alpine.LRH.2.02.1908230705510.5296@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1908230954190.22174@file01.intranet.prod.int.rdu2.redhat.com>
References: <1566351211-13280-1-git-send-email-kontais@zoho.com>
	<alpine.LRH.2.02.1908230705510.5296@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Zhang Tao <zhangtao27@lenovo.com>, dm-devel@redhat.com, snitzer@redhat.com,
	agk@redhat.com, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH 2/2] dm: make dm_table_find_target return NULL
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 23 Aug 2019 13:55:37 +0000 (UTC)

Currently, if we pass too high sector number to dm_table_find_target, it
returns zeroed dm_target structure and callers test if the structure is
zeroed with the macro dm_target_is_valid.

However, returning NULL is common practice to indicate errors.

This patch refactors the dm code, so that dm_table_find_target returns
NULL and its callers test the returned value for NULL. The macro
dm_target_is_valid is deleted. In alloc_targets, we no longer allocate an
extra zeroed target.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ioctl.c |    2 +-
 drivers/md/dm-table.c |    8 +++-----
 drivers/md/dm.c       |    8 ++++----
 drivers/md/dm.h       |    5 -----
 4 files changed, 8 insertions(+), 15 deletions(-)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c	2019-08-23 15:45:46.000000000 +0200
+++ linux-2.6/drivers/md/dm.c	2019-08-23 15:45:46.000000000 +0200
@@ -457,7 +457,7 @@ static int dm_blk_report_zones(struct ge
 		return -EIO;
 
 	tgt = dm_table_find_target(map, sector);
-	if (!dm_target_is_valid(tgt)) {
+	if (!tgt) {
 		ret = -EIO;
 		goto out;
 	}
@@ -1072,7 +1072,7 @@ static struct dm_target *dm_dax_get_live
 		return NULL;
 
 	ti = dm_table_find_target(map, sector);
-	if (!dm_target_is_valid(ti))
+	if (!ti)
 		return NULL;
 
 	return ti;
@@ -1572,7 +1572,7 @@ static int __split_and_process_non_flush
 	int r;
 
 	ti = dm_table_find_target(ci->map, ci->sector);
-	if (!dm_target_is_valid(ti))
+	if (!ti)
 		return -EIO;
 
 	if (__process_abnormal_io(ci, ti, &r))
@@ -1748,7 +1748,7 @@ static blk_qc_t dm_process_bio(struct ma
 
 	if (!ti) {
 		ti = dm_table_find_target(map, bio->bi_iter.bi_sector);
-		if (unlikely(!ti || !dm_target_is_valid(ti))) {
+		if (unlikely(!ti)) {
 			bio_io_error(bio);
 			return ret;
 		}
Index: linux-2.6/drivers/md/dm-ioctl.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ioctl.c	2019-08-23 15:45:46.000000000 +0200
+++ linux-2.6/drivers/md/dm-ioctl.c	2019-08-23 15:45:46.000000000 +0200
@@ -1592,7 +1592,7 @@ static int target_message(struct file *f
 	}
 
 	ti = dm_table_find_target(table, tmsg->sector);
-	if (!dm_target_is_valid(ti)) {
+	if (!ti) {
 		DMWARN("Target message sector outside device.");
 		r = -EINVAL;
 	} else if (ti->type->message)
Index: linux-2.6/drivers/md/dm-table.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-table.c	2019-08-23 15:45:46.000000000 +0200
+++ linux-2.6/drivers/md/dm-table.c	2019-08-23 15:47:18.000000000 +0200
@@ -163,10 +163,8 @@ static int alloc_targets(struct dm_table
 
 	/*
 	 * Allocate both the target array and offset array at once.
-	 * Append an empty entry to catch sectors beyond the end of
-	 * the device.
 	 */
-	n_highs = (sector_t *) dm_vcalloc(num + 1, sizeof(struct dm_target) +
+	n_highs = (sector_t *) dm_vcalloc(num, sizeof(struct dm_target) +
 					  sizeof(sector_t));
 	if (!n_highs)
 		return -ENOMEM;
@@ -1359,7 +1357,7 @@ struct dm_target *dm_table_get_target(st
 /*
  * Search the btree for the correct target.
  *
- * Caller should check returned pointer with dm_target_is_valid()
+ * Caller should check returned pointer for NULL
  * to trap I/O beyond end of device.
  */
 struct dm_target *dm_table_find_target(struct dm_table *t, sector_t sector)
@@ -1368,7 +1366,7 @@ struct dm_target *dm_table_find_target(s
 	sector_t *node;
 
 	if (unlikely(sector >= dm_table_get_size(t)))
-		return &t->targets[t->num_targets];
+		return NULL;
 
 	for (l = 0; l < t->depth; l++) {
 		n = get_child(n, k);
Index: linux-2.6/drivers/md/dm.h
===================================================================
--- linux-2.6.orig/drivers/md/dm.h	2019-08-23 15:45:46.000000000 +0200
+++ linux-2.6/drivers/md/dm.h	2019-08-23 15:45:46.000000000 +0200
@@ -86,11 +86,6 @@ struct target_type *dm_get_immutable_tar
 int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t);
 
 /*
- * To check the return value from dm_table_find_target().
- */
-#define dm_target_is_valid(t) ((t)->table)
-
-/*
  * To check whether the target type is bio-based or not (request-based).
  */
 #define dm_target_bio_based(t) ((t)->type->map != NULL)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
