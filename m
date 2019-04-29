Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CEE331
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C379B305B16F;
	Mon, 29 Apr 2019 12:58:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C17A707BC;
	Mon, 29 Apr 2019 12:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 387C13FB14;
	Mon, 29 Apr 2019 12:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCw51u023695 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:58:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F15B1779A; Mon, 29 Apr 2019 12:58:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB531779E;
	Mon, 29 Apr 2019 12:58:03 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5r6-00081V-Gi; Mon, 29 Apr 2019 14:58:01 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:48 +0200
Message-Id: <20190429125748.619296680@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:26 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-bitmap-sync-mode.patch
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 10/10] dm-integrity: implement synchronous mode
	for reboot handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 29 Apr 2019 12:58:26 +0000 (UTC)

Unfortunatelly, there may be bios coming even after the reboot notifier
was called. We don't want these bios to make the bitmap dirty again.

This patch implements a synchronous mode - when a bio is about to be
terminated, we clean the bitmap and terminate the bio after the clean
operation succeeds. This obviously slows down bio processing, but it makes
sure that when all bios are finished, the bitmap will be clean.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-27 10:28:37.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-27 10:28:37.000000000 +0200
@@ -171,6 +171,8 @@ struct dm_integrity_c {
 	struct page_list *may_write_bitmap;
 	struct bitmap_block_status *bbs;
 	unsigned bitmap_flush_interval;
+	int synchronous_mode;
+	struct bio_list synchronous_bios;
 	struct delayed_work bitmap_flush_work;
 
 	struct crypto_skcipher *journal_crypt;
@@ -1382,6 +1384,14 @@ static void do_endio(struct dm_integrity
 	int r = dm_integrity_failed(ic);
 	if (unlikely(r) && !bio->bi_status)
 		bio->bi_status = errno_to_blk_status(r);
+	if (unlikely(ic->synchronous_mode) && bio_op(bio) == REQ_OP_WRITE) {
+		unsigned long flags;
+		spin_lock_irqsave(&ic->endio_wait.lock, flags);
+		bio_list_add(&ic->synchronous_bios, bio);
+		queue_delayed_work(ic->commit_wq, &ic->bitmap_flush_work, 0);
+		spin_unlock_irqrestore(&ic->endio_wait.lock, flags);
+		return;
+	}
 	bio_endio(bio);
 }
 
@@ -2494,6 +2504,7 @@ static void bitmap_flush_work(struct wor
 	struct dm_integrity_c *ic = container_of(work, struct dm_integrity_c, bitmap_flush_work.work);
 	struct dm_integrity_range range;
 	unsigned long limit;
+	struct bio *bio;
 
 	dm_integrity_flush_buffers(ic);
 
@@ -2514,13 +2525,20 @@ static void bitmap_flush_work(struct wor
 			>> (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit)
 			<< (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit);
 	}
-	DEBUG_print("zeroing journal\n");
+	/*DEBUG_print("zeroing journal\n");*/
 	block_bitmap_op(ic, ic->journal, 0, limit, BITMAP_OP_CLEAR);
 	block_bitmap_op(ic, ic->may_write_bitmap, 0, limit, BITMAP_OP_CLEAR);
 
 	rw_journal_sectors(ic, REQ_OP_WRITE, REQ_FUA | REQ_SYNC, 0, ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
 
-	remove_range(ic, &range);
+	spin_lock_irq(&ic->endio_wait.lock);
+	remove_range_unlocked(ic, &range);
+	while (unlikely((bio = bio_list_pop(&ic->synchronous_bios)) != NULL)) {
+		bio_endio(bio);
+		spin_unlock_irq(&ic->endio_wait.lock);
+		spin_lock_irq(&ic->endio_wait.lock);
+	}
+	spin_unlock_irq(&ic->endio_wait.lock);
 }
 
 
@@ -2720,16 +2738,27 @@ clear_journal:
 		init_journal_node(&ic->journal_tree[i]);
 }
 
-static int dm_integrity_reboot(struct notifier_block *n, unsigned long code, void *x)
+static void dm_integrity_enter_synchronous_mode(struct dm_integrity_c *ic)
 {
-	struct dm_integrity_c *ic = container_of(n, struct dm_integrity_c, reboot_notifier);
+	DEBUG_print("dm_integrity_enter_synchronous_mode\n");
 
 	if (ic->mode == 'B') {
-		DEBUG_print("dm_integrity_reboot\n");
+		ic->bitmap_flush_interval = msecs_to_jiffies(10) + 1;
+		ic->synchronous_mode = 1;
+
 		cancel_delayed_work_sync(&ic->bitmap_flush_work);
 		queue_delayed_work(ic->commit_wq, &ic->bitmap_flush_work, 0);
 		flush_workqueue(ic->commit_wq);
 	}
+}
+
+static int dm_integrity_reboot(struct notifier_block *n, unsigned long code, void *x)
+{
+	struct dm_integrity_c *ic = container_of(n, struct dm_integrity_c, reboot_notifier);
+
+	DEBUG_print("dm_integrity_reboot\n");
+
+	dm_integrity_enter_synchronous_mode(ic);
 
 	return NOTIFY_DONE;
 }
@@ -2853,6 +2882,10 @@ static void dm_integrity_resume(struct d
 	ic->reboot_notifier.next = NULL;
 	ic->reboot_notifier.priority = INT_MAX - 1;	/* be notified after md and before hardware drivers */
 	WARN_ON(register_reboot_notifier(&ic->reboot_notifier));
+
+#if 0
+	dm_integrity_enter_synchronous_mode(ic);
+#endif
 }
 
 static void dm_integrity_status(struct dm_target *ti, status_type_t type,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
