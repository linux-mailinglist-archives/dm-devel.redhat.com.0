Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63BCBCE6
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 16:19:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE3ED2109;
	Fri,  4 Oct 2019 14:19:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F4C5C222;
	Fri,  4 Oct 2019 14:18:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50C061808878;
	Fri,  4 Oct 2019 14:18:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94EHidO025914 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 10:17:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E8CF5DA8C; Fri,  4 Oct 2019 14:17:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 960B55D9DC;
	Fri,  4 Oct 2019 14:17:38 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x94EHbKZ012459; Fri, 4 Oct 2019 10:17:37 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x94EHbpK012455; Fri, 4 Oct 2019 10:17:37 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 4 Oct 2019 10:17:37 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nikos Tsironis <ntsironis@arrikto.com>, Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.1910041015330.11863@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Vangelis Koukis <vkoukis@arrikto.com>, dm-devel@redhat.com,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: [dm-devel] [PATCH] dm-clone: replace spin_lock_irqsave with
	spin_lock_irq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Fri, 04 Oct 2019 14:19:06 +0000 (UTC)

If we are in a place where it is known that interrupts are enabled,
functions spin_lock_irq/spin_unlock_irq should be used instead of
spin_lock_irqsave/spin_unlock_irqrestore.

spin_lock_irq and spin_unlock_irq are faster because the don't need to
push and pop the flags register.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-clone-metadata.c |   29 ++++++++++++-----------------
 drivers/md/dm-clone-target.c   |   28 ++++++++++++----------------
 2 files changed, 24 insertions(+), 33 deletions(-)

Index: linux-2.6/drivers/md/dm-clone-metadata.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-clone-metadata.c	2019-10-04 14:49:46.000000000 +0200
+++ linux-2.6/drivers/md/dm-clone-metadata.c	2019-10-04 16:07:49.000000000 +0200
@@ -712,7 +712,7 @@ static int __metadata_commit(struct dm_c
 static int __flush_dmap(struct dm_clone_metadata *cmd, struct dirty_map *dmap)
 {
 	int r;
-	unsigned long word, flags;
+	unsigned long word;
 
 	word = 0;
 	do {
@@ -736,9 +736,9 @@ static int __flush_dmap(struct dm_clone_
 		return r;
 
 	/* Update the changed flag */
-	spin_lock_irqsave(&cmd->bitmap_lock, flags);
+	spin_lock_irq(&cmd->bitmap_lock);
 	dmap->changed = 0;
-	spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
+	spin_unlock_irq(&cmd->bitmap_lock);
 
 	return 0;
 }
@@ -746,7 +746,6 @@ static int __flush_dmap(struct dm_clone_
 int dm_clone_metadata_commit(struct dm_clone_metadata *cmd)
 {
 	int r = -EPERM;
-	unsigned long flags;
 	struct dirty_map *dmap, *next_dmap;
 
 	down_write(&cmd->lock);
@@ -770,9 +769,9 @@ int dm_clone_metadata_commit(struct dm_c
 	}
 
 	/* Swap dirty bitmaps */
-	spin_lock_irqsave(&cmd->bitmap_lock, flags);
+	spin_lock_irq(&cmd->bitmap_lock);
 	cmd->current_dmap = next_dmap;
-	spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
+	spin_unlock_irq(&cmd->bitmap_lock);
 
 	/*
 	 * No one is accessing the old dirty bitmap anymore, so we can flush
@@ -817,9 +816,9 @@ int dm_clone_cond_set_range(struct dm_cl
 {
 	int r = 0;
 	struct dirty_map *dmap;
-	unsigned long word, region_nr, flags;
+	unsigned long word, region_nr;
 
-	spin_lock_irqsave(&cmd->bitmap_lock, flags);
+	spin_lock_irq(&cmd->bitmap_lock);
 
 	if (cmd->read_only) {
 		r = -EPERM;
@@ -836,7 +835,7 @@ int dm_clone_cond_set_range(struct dm_cl
 		}
 	}
 out:
-	spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
+	spin_unlock_irq(&cmd->bitmap_lock);
 
 	return r;
 }
@@ -903,13 +902,11 @@ out:
 
 void dm_clone_metadata_set_read_only(struct dm_clone_metadata *cmd)
 {
-	unsigned long flags;
-
 	down_write(&cmd->lock);
 
-	spin_lock_irqsave(&cmd->bitmap_lock, flags);
+	spin_lock_irq(&cmd->bitmap_lock);
 	cmd->read_only = 1;
-	spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
+	spin_unlock_irq(&cmd->bitmap_lock);
 
 	if (!cmd->fail_io)
 		dm_bm_set_read_only(cmd->bm);
@@ -919,13 +916,11 @@ void dm_clone_metadata_set_read_only(str
 
 void dm_clone_metadata_set_read_write(struct dm_clone_metadata *cmd)
 {
-	unsigned long flags;
-
 	down_write(&cmd->lock);
 
-	spin_lock_irqsave(&cmd->bitmap_lock, flags);
+	spin_lock_irq(&cmd->bitmap_lock);
 	cmd->read_only = 0;
-	spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
+	spin_unlock_irq(&cmd->bitmap_lock);
 
 	if (!cmd->fail_io)
 		dm_bm_set_read_write(cmd->bm);
Index: linux-2.6/drivers/md/dm-clone-target.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-clone-target.c	2019-10-04 14:49:46.000000000 +0200
+++ linux-2.6/drivers/md/dm-clone-target.c	2019-10-04 16:03:39.000000000 +0200
@@ -332,8 +332,6 @@ static void submit_bios(struct bio_list
  */
 static void issue_bio(struct clone *clone, struct bio *bio)
 {
-	unsigned long flags;
-
 	if (!bio_triggers_commit(clone, bio)) {
 		generic_make_request(bio);
 		return;
@@ -352,9 +350,9 @@ static void issue_bio(struct clone *clon
 	 * Batch together any bios that trigger commits and then issue a single
 	 * commit for them in process_deferred_flush_bios().
 	 */
-	spin_lock_irqsave(&clone->lock, flags);
+	spin_lock_irq(&clone->lock);
 	bio_list_add(&clone->deferred_flush_bios, bio);
-	spin_unlock_irqrestore(&clone->lock, flags);
+	spin_unlock_irq(&clone->lock);
 
 	wake_worker(clone);
 }
@@ -469,7 +467,7 @@ static void complete_discard_bio(struct
 
 static void process_discard_bio(struct clone *clone, struct bio *bio)
 {
-	unsigned long rs, re, flags;
+	unsigned long rs, re;
 
 	bio_region_range(clone, bio, &rs, &re);
 	BUG_ON(re > clone->nr_regions);
@@ -501,9 +499,9 @@ static void process_discard_bio(struct c
 	/*
 	 * Defer discard processing.
 	 */
-	spin_lock_irqsave(&clone->lock, flags);
+	spin_lock_irq(&clone->lock);
 	bio_list_add(&clone->deferred_discard_bios, bio);
-	spin_unlock_irqrestore(&clone->lock, flags);
+	spin_unlock_irq(&clone->lock);
 
 	wake_worker(clone);
 }
@@ -1140,13 +1138,13 @@ static void process_deferred_discards(st
 	int r = -EPERM;
 	struct bio *bio;
 	struct blk_plug plug;
-	unsigned long rs, re, flags;
+	unsigned long rs, re;
 	struct bio_list discards = BIO_EMPTY_LIST;
 
-	spin_lock_irqsave(&clone->lock, flags);
+	spin_lock_irq(&clone->lock);
 	bio_list_merge(&discards, &clone->deferred_discard_bios);
 	bio_list_init(&clone->deferred_discard_bios);
-	spin_unlock_irqrestore(&clone->lock, flags);
+	spin_unlock_irq(&clone->lock);
 
 	if (bio_list_empty(&discards))
 		return;
@@ -1176,13 +1174,12 @@ out:
 
 static void process_deferred_bios(struct clone *clone)
 {
-	unsigned long flags;
 	struct bio_list bios = BIO_EMPTY_LIST;
 
-	spin_lock_irqsave(&clone->lock, flags);
+	spin_lock_irq(&clone->lock);
 	bio_list_merge(&bios, &clone->deferred_bios);
 	bio_list_init(&clone->deferred_bios);
-	spin_unlock_irqrestore(&clone->lock, flags);
+	spin_unlock_irq(&clone->lock);
 
 	if (bio_list_empty(&bios))
 		return;
@@ -1193,7 +1190,6 @@ static void process_deferred_bios(struct
 static void process_deferred_flush_bios(struct clone *clone)
 {
 	struct bio *bio;
-	unsigned long flags;
 	struct bio_list bios = BIO_EMPTY_LIST;
 	struct bio_list bio_completions = BIO_EMPTY_LIST;
 
@@ -1201,13 +1197,13 @@ static void process_deferred_flush_bios(
 	 * If there are any deferred flush bios, we must commit the metadata
 	 * before issuing them or signaling their completion.
 	 */
-	spin_lock_irqsave(&clone->lock, flags);
+	spin_lock_irq(&clone->lock);
 	bio_list_merge(&bios, &clone->deferred_flush_bios);
 	bio_list_init(&clone->deferred_flush_bios);
 
 	bio_list_merge(&bio_completions, &clone->deferred_flush_completions);
 	bio_list_init(&clone->deferred_flush_completions);
-	spin_unlock_irqrestore(&clone->lock, flags);
+	spin_unlock_irq(&clone->lock);
 
 	if (bio_list_empty(&bios) && bio_list_empty(&bio_completions) &&
 	    !(dm_clone_changed_this_transaction(clone->cmd) && need_commit_due_to_time(clone)))

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
