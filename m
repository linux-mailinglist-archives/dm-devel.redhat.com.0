Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E985F05
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 11:50:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 951CB30C746E;
	Thu,  8 Aug 2019 09:50:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9745419D70;
	Thu,  8 Aug 2019 09:50:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D891D24F30;
	Thu,  8 Aug 2019 09:50:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x789oEd4031248 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 05:50:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 164BA10016EB; Thu,  8 Aug 2019 09:50:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0CDB10018F9;
	Thu,  8 Aug 2019 09:50:11 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x789oBdl022367; Thu, 8 Aug 2019 05:50:11 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x789oAiA022363; Thu, 8 Aug 2019 05:50:11 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 8 Aug 2019 05:50:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Mike Snitzer <msnitzer@redhat.com>, junxiao.bi@oracle.com
Message-ID: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] direct-io: use GFP_NOIO to avoid deadlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 09:50:27 +0000 (UTC)

A deadlock with this stacktrace was observed.

The obvious problem here is that in the call chain 
xfs_vm_direct_IO->__blockdev_direct_IO->do_blockdev_direct_IO->kmem_cache_alloc 
we do a GFP_KERNEL allocation while we are in a filesystem driver and in a 
block device driver.

This patch changes the direct-io code to use GFP_NOIO.

PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
   #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
   #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
   #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
   #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
   #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
   #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
   #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
   #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
   #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
   #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
  #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
  #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
  #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
  #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
  #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242

  PID: 14127  TASK: ffff881455749c00  CPU: 11  COMMAND: "loop1"
   #0 [ffff88272f5af228] __schedule at ffffffff8173f405
   #1 [ffff88272f5af280] schedule at ffffffff8173fa27
   #2 [ffff88272f5af2a0] schedule_preempt_disabled at ffffffff8173fd5e
   #3 [ffff88272f5af2b0] __mutex_lock_slowpath at ffffffff81741fb5
   #4 [ffff88272f5af330] mutex_lock at ffffffff81742133
   #5 [ffff88272f5af350] dm_bufio_shrink_count at ffffffffa03865f9 [dm_bufio]
   #6 [ffff88272f5af380] shrink_slab at ffffffff811a86bd
   #7 [ffff88272f5af470] shrink_zone at ffffffff811ad778
   #8 [ffff88272f5af500] do_try_to_free_pages at ffffffff811adb34
   #9 [ffff88272f5af590] try_to_free_pages at ffffffff811adef8
  #10 [ffff88272f5af610] __alloc_pages_nodemask at ffffffff811a09c3
  #11 [ffff88272f5af710] alloc_pages_current at ffffffff811e8b71
  #12 [ffff88272f5af760] new_slab at ffffffff811f4523
  #13 [ffff88272f5af7b0] __slab_alloc at ffffffff8173a1b5
  #14 [ffff88272f5af880] kmem_cache_alloc at ffffffff811f484b
  #15 [ffff88272f5af8d0] do_blockdev_direct_IO at ffffffff812535b3
  #16 [ffff88272f5afb00] __blockdev_direct_IO at ffffffff81255dc3
  #17 [ffff88272f5afb30] xfs_vm_direct_IO at ffffffffa01fe3fc [xfs]
  #18 [ffff88272f5afb90] generic_file_read_iter at ffffffff81198994
  #19 [ffff88272f5afc50] __dta_xfs_file_read_iter_2398 at ffffffffa020c970 [xfs]
  #20 [ffff88272f5afcc0] lo_rw_aio at ffffffffa0377042 [loop]
  #21 [ffff88272f5afd70] loop_queue_work at ffffffffa0377c3b [loop]
  #22 [ffff88272f5afe60] kthread_worker_fn at ffffffff810a8a0c
  #23 [ffff88272f5afec0] kthread at ffffffff810a8428
  #24 [ffff88272f5aff50] ret_from_fork at ffffffff81745242

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 fs/direct-io.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/fs/direct-io.c
===================================================================
--- linux-2.6.orig/fs/direct-io.c	2019-08-02 08:51:56.000000000 +0200
+++ linux-2.6/fs/direct-io.c	2019-08-08 11:22:18.000000000 +0200
@@ -436,7 +436,7 @@ dio_bio_alloc(struct dio *dio, struct di
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
 	 * we request a valid number of vectors.
 	 */
-	bio = bio_alloc(GFP_KERNEL, nr_vecs);
+	bio = bio_alloc(GFP_NOIO, nr_vecs);
 
 	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = first_sector;
@@ -1197,7 +1197,7 @@ do_blockdev_direct_IO(struct kiocb *iocb
 	if (iov_iter_rw(iter) == READ && !count)
 		return 0;
 
-	dio = kmem_cache_alloc(dio_cache, GFP_KERNEL);
+	dio = kmem_cache_alloc(dio_cache, GFP_NOIO);
 	retval = -ENOMEM;
 	if (!dio)
 		goto out;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
