Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 666ADD765D
	for <lists+dm-devel@lfdr.de>; Tue, 15 Oct 2019 14:20:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93FAC61B27;
	Tue, 15 Oct 2019 12:20:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC58760BE2;
	Tue, 15 Oct 2019 12:20:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 434A4180B536;
	Tue, 15 Oct 2019 12:20:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9FCGtrL013363 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Oct 2019 08:16:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B71E23DB4; Tue, 15 Oct 2019 12:16:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A132A453B;
	Tue, 15 Oct 2019 12:16:51 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x9FCGpGX006177; Tue, 15 Oct 2019 08:16:51 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x9FCGpEJ006174; Tue, 15 Oct 2019 08:16:51 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 15 Oct 2019 08:16:51 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.1910150408480.26857@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-bio-prison-v1: replace spin_lock_irqsave with
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 15 Oct 2019 12:20:21 +0000 (UTC)

Replace spin_lock_irqsave/irqrestore with spin_lock_irq/spin_unlock_irq.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bio-prison-v1.c |   27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

Index: linux-2.6/drivers/md/dm-bio-prison-v1.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bio-prison-v1.c	2019-10-10 16:52:03.000000000 +0200
+++ linux-2.6/drivers/md/dm-bio-prison-v1.c	2019-10-11 21:37:00.000000000 +0200
@@ -150,11 +150,10 @@ static int bio_detain(struct dm_bio_pris
 		      struct dm_bio_prison_cell **cell_result)
 {
 	int r;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prison->lock, flags);
+	spin_lock_irq(&prison->lock);
 	r = __bio_detain(prison, key, inmate, cell_prealloc, cell_result);
-	spin_unlock_irqrestore(&prison->lock, flags);
+	spin_unlock_irq(&prison->lock);
 
 	return r;
 }
@@ -198,11 +197,9 @@ void dm_cell_release(struct dm_bio_priso
 		     struct dm_bio_prison_cell *cell,
 		     struct bio_list *bios)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&prison->lock, flags);
+	spin_lock_irq(&prison->lock);
 	__cell_release(prison, cell, bios);
-	spin_unlock_irqrestore(&prison->lock, flags);
+	spin_unlock_irq(&prison->lock);
 }
 EXPORT_SYMBOL_GPL(dm_cell_release);
 
@@ -250,12 +247,10 @@ void dm_cell_visit_release(struct dm_bio
 			   void *context,
 			   struct dm_bio_prison_cell *cell)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&prison->lock, flags);
+	spin_lock_irq(&prison->lock);
 	visit_fn(context, cell);
 	rb_erase(&cell->node, &prison->cells);
-	spin_unlock_irqrestore(&prison->lock, flags);
+	spin_unlock_irq(&prison->lock);
 }
 EXPORT_SYMBOL_GPL(dm_cell_visit_release);
 
@@ -275,11 +270,10 @@ int dm_cell_promote_or_release(struct dm
 			       struct dm_bio_prison_cell *cell)
 {
 	int r;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prison->lock, flags);
+	spin_lock_irq(&prison->lock);
 	r = __promote_or_release(prison, cell);
-	spin_unlock_irqrestore(&prison->lock, flags);
+	spin_unlock_irq(&prison->lock);
 
 	return r;
 }
@@ -379,10 +373,9 @@ EXPORT_SYMBOL_GPL(dm_deferred_entry_dec)
 int dm_deferred_set_add_work(struct dm_deferred_set *ds, struct list_head *work)
 {
 	int r = 1;
-	unsigned long flags;
 	unsigned next_entry;
 
-	spin_lock_irqsave(&ds->lock, flags);
+	spin_lock_irq(&ds->lock);
 	if ((ds->sweeper == ds->current_entry) &&
 	    !ds->entries[ds->current_entry].count)
 		r = 0;
@@ -392,7 +385,7 @@ int dm_deferred_set_add_work(struct dm_d
 		if (!ds->entries[next_entry].count)
 			ds->current_entry = next_entry;
 	}
-	spin_unlock_irqrestore(&ds->lock, flags);
+	spin_unlock_irq(&ds->lock);
 
 	return r;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
