Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7EAC4B28
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 12:14:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9305E82A498;
	Wed,  2 Oct 2019 10:14:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE5D1001B22;
	Wed,  2 Oct 2019 10:14:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEB6E1800B74;
	Wed,  2 Oct 2019 10:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92AEK4M022250 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 06:14:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE80F60C63; Wed,  2 Oct 2019 10:14:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BFC960BE0;
	Wed,  2 Oct 2019 10:14:18 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x92AEHEt005414; Wed, 2 Oct 2019 06:14:17 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x92AEHKr005396; Wed, 2 Oct 2019 06:14:17 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 2 Oct 2019 06:14:17 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nikos Tsironis <ntsironis@arrikto.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.1910020613070.973@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, guru2018@gmail.com
Subject: [dm-devel] [PATCH 1/2] dm-snapshot: introduce account_start_copy
 and account_end_copy
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 02 Oct 2019 10:14:27 +0000 (UTC)

This is simple refactoring that moves code for modifying the semaphore
cow_count into separate functions. It is needed by the following patch.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v5.0+
Fixes: 721b1d98fb51 ("dm snapshot: Fix excessive memory usage and workqueue stalls")

---
 drivers/md/dm-snap.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-snap.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-snap.c	2019-10-01 15:19:20.000000000 +0200
+++ linux-2.6/drivers/md/dm-snap.c	2019-10-01 15:23:10.000000000 +0200
@@ -1512,6 +1512,16 @@ static void snapshot_dtr(struct dm_targe
 	kfree(s);
 }
 
+static void account_start_copy(struct dm_snapshot *s)
+{
+	down(&s->cow_count);
+}
+
+static void account_end_copy(struct dm_snapshot *s)
+{
+	up(&s->cow_count);
+}
+
 /*
  * Flush a list of buffers.
  */
@@ -1732,7 +1742,7 @@ static void copy_callback(int read_err,
 		rb_link_node(&pe->out_of_order_node, parent, p);
 		rb_insert_color(&pe->out_of_order_node, &s->out_of_order_tree);
 	}
-	up(&s->cow_count);
+	account_end_copy(s);
 }
 
 /*
@@ -1756,7 +1766,7 @@ static void start_copy(struct dm_snap_pe
 	dest.count = src.count;
 
 	/* Hand over to kcopyd */
-	down(&s->cow_count);
+	account_start_copy(s);
 	dm_kcopyd_copy(s->kcopyd_client, &src, 1, &dest, 0, copy_callback, pe);
 }
 
@@ -1776,7 +1786,7 @@ static void start_full_bio(struct dm_sna
 	pe->full_bio = bio;
 	pe->full_bio_end_io = bio->bi_end_io;
 
-	down(&s->cow_count);
+	account_start_copy(s);
 	callback_data = dm_kcopyd_prepare_callback(s->kcopyd_client,
 						   copy_callback, pe);
 
@@ -1866,7 +1876,7 @@ static void zero_callback(int read_err,
 	struct bio *bio = context;
 	struct dm_snapshot *s = bio->bi_private;
 
-	up(&s->cow_count);
+	account_end_copy(s);
 	bio->bi_status = write_err ? BLK_STS_IOERR : 0;
 	bio_endio(bio);
 }
@@ -1880,7 +1890,7 @@ static void zero_exception(struct dm_sna
 	dest.sector = bio->bi_iter.bi_sector;
 	dest.count = s->store->chunk_size;
 
-	down(&s->cow_count);
+	account_start_copy(s);
 	WARN_ON_ONCE(bio->bi_private);
 	bio->bi_private = s;
 	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, bio);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
