Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6A204229FC2
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 21:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595444538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n3hQU0kv4UUgDtZiMgEYykv/bwd4T6mAd4marHafyGY=;
	b=MV5rzGYdDIlhru+aDQootlcGrqI1WEqbyBCUZAen9fY/Iirugy8a35DOeFGZlk7weInKfi
	3/gJbPfdHkdPuQbWMgdPEU/7de9wJ9rMCwt+CpkZI96PCJtijW41rTWYsm2scR0tOl20ED
	1Pief48EJ6rz+De4FT1gIlLV424Lk18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-UJmHy4ywObuOChHhked67Q-1; Wed, 22 Jul 2020 15:02:16 -0400
X-MC-Unique: UJmHy4ywObuOChHhked67Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23468800688;
	Wed, 22 Jul 2020 19:02:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 486B1100EBB8;
	Wed, 22 Jul 2020 19:02:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A3D11809557;
	Wed, 22 Jul 2020 19:01:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MIkUa3008281 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 14:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30B9D5D9D3; Wed, 22 Jul 2020 18:46:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE305D9D7;
	Wed, 22 Jul 2020 18:46:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 06MIkOtd016788; Wed, 22 Jul 2020 14:46:24 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 06MIkOVj016784; Wed, 22 Jul 2020 14:46:24 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 22 Jul 2020 14:46:24 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Marian Csontos <mcsontos@redhat.com>, 
	Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: revert adc0daad366b to fix
	recalculation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mike

Please submit this to Linus and to RHEL-8.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

The patch adc0daad366b62ca1bce3e2958a40b0b71a8b8b3 broke recalculation on
dm-integrity. The patch replaces a private variable "suspending" with a
call to "dm_suspended".

The problem is that dm_suspended returns true not only during suspend, but
also during resume. This race condition could occur:
1. dm_integrity_resume calls queue_work(ic->recalc_wq, &ic->recalc_work)
2. integrity_recalc (&ic->recalc_work) preempts the current thread
3. integrity_recalc calls if (unlikely(dm_suspended(ic->ti))) goto unlock_ret;
4. integrity_recalc exits and no recalculating is done.

In order to fix this race condition, we stop using dm_suspended and start
using the variable "suspending" (that is only set during suspend, not
during resume).

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: adc0daad366b ("dm: report suspended device during destroy")
Cc: stable@vger.kernel.org	# v4.18+

---
 drivers/md/dm-integrity.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-06-29 14:49:59.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2020-07-22 15:48:49.000000000 +0200
@@ -204,13 +204,12 @@ struct dm_integrity_c {
 	__u8 log2_blocks_per_bitmap_bit;
 
 	unsigned char mode;
+	int suspending;
 
 	int failed;
 
 	struct crypto_shash *internal_hash;
 
-	struct dm_target *ti;
-
 	/* these variables are locked with endio_wait.lock */
 	struct rb_root in_progress;
 	struct list_head wait_list;
@@ -2420,7 +2419,7 @@ static void integrity_writer(struct work
 	unsigned prev_free_sectors;
 
 	/* the following test is not needed, but it tests the replay code */
-	if (unlikely(dm_suspended(ic->ti)) && !ic->meta_dev)
+	if (READ_ONCE(ic->suspending) && !ic->meta_dev)
 		return;
 
 	spin_lock_irq(&ic->endio_wait.lock);
@@ -2481,7 +2480,7 @@ static void integrity_recalc(struct work
 
 next_chunk:
 
-	if (unlikely(dm_suspended(ic->ti)))
+	if (unlikely(READ_ONCE(ic->suspending)))
 		goto unlock_ret;
 
 	range.logical_sector = le64_to_cpu(ic->sb->recalc_sector);
@@ -2909,6 +2908,8 @@ static void dm_integrity_postsuspend(str
 
 	del_timer_sync(&ic->autocommit_timer);
 
+	WRITE_ONCE(ic->suspending, 1);
+
 	if (ic->recalc_wq)
 		drain_workqueue(ic->recalc_wq);
 
@@ -2937,6 +2938,8 @@ static void dm_integrity_postsuspend(str
 #endif
 	}
 
+	WRITE_ONCE(ic->suspending, 0);
+
 	BUG_ON(!RB_EMPTY_ROOT(&ic->in_progress));
 
 	ic->journal_uptodate = true;
@@ -3767,7 +3770,6 @@ static int dm_integrity_ctr(struct dm_ta
 	}
 	ti->private = ic;
 	ti->per_io_data_size = sizeof(struct dm_integrity_io);
-	ic->ti = ti;
 
 	ic->in_progress = RB_ROOT;
 	INIT_LIST_HEAD(&ic->wait_list);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

