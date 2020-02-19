Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B2457164882
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 16:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582126009;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wq+4/Ax+ZIsAS8qvLC/WPnQC4HDKD2tTIz1PaV/4Iqc=;
	b=iCOHDPmsC4n4SQy//5S35mdgRYfFdRBPku7ybuxCdc/vorIZ2kLG69ZaIxo96WlxuI3j7k
	ze/A6g5a/LFnv9okTGKxyppQMc8HhKz3Ppm+4WlIqEdQfYPqDlziRjtKffRthDjNyQV0LU
	hlPAHuYMufWMfnGhxN3QSv48nixaNjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-wP7cvYvEOMe2j6Ljdr-5bg-1; Wed, 19 Feb 2020 10:26:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E69107ACCD;
	Wed, 19 Feb 2020 15:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5848ECFE;
	Wed, 19 Feb 2020 15:26:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA09D35AE2;
	Wed, 19 Feb 2020 15:26:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JFPm2d013475 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 10:25:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D03B5C541; Wed, 19 Feb 2020 15:25:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4B45C219;
	Wed, 19 Feb 2020 15:25:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01JFPjJb027805; Wed, 19 Feb 2020 10:25:45 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01JFPjwc027801; Wed, 19 Feb 2020 10:25:45 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 19 Feb 2020 10:25:45 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>
Message-ID: <alpine.LRH.2.02.2002191023210.27631@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm cache: fix a crash due to incorrect work item
	canceling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wP7cvYvEOMe2j6Ljdr-5bg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I've got these crashes. The crashes can be reproduced by running the lvm2
test lvconvert-thin-external-cache.sh for several minutes:
  while :; do make check T=shell/lvconvert-thin-external-cache.sh; done

The crashes happen in this call chain:
do_waker -> policy_tick -> smq_tick -> end_hotspot_period -> clear_bitset
-> memset -> __memset accessed invalid pointer in the vmalloc arena

The work entry on the workqueue is executed even after the bitmap was
freed. The problem is that cancel_delayed_work doesn't wait for the
running work item to finish, so the work item can continue running and
re-submitting itself even after cache_postsuspend. In order to make sure
that the work item won't be running, we must use cancel_delayed_work_sync.

Also, change flush_workqueue to drain_workqueue, so that if some work item
submits itself or another work item, we are properly waiting for both of
them.

 Unable to handle kernel paging request at virtual address ffffffc0139d6000
 Mem abort info:
   ESR = 0x96000047
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000047
   CM = 0, WnR = 1
 swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000405e3000
 [ffffffc0139d6000] pgd=000000013ffff003, pud=000000013ffff003, pmd=0000000133130003, pte=0000000000000000
 Internal error: Oops: 96000047 [#1] PREEMPT SMP
 Modules linked in: dm_delay reiserfs hmac crc32_generic dm_zero dm_integrity dm_crypt dm_raid xfs dm_thin_pool dm_cache_smq dm_cache dm_persistent_data dm_bio_prison dm_mirror dm_region_hash dm_log dm_snapshot dm_bufio loop dm_writecache brd dm_mod ipv6 autofs4 binfmt_misc nls_utf8 nls_cp852 vfat fat aes_ce_blk crypto_simd cryptd aes_ce_cipher af_packet crct10dif_ce ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce efivars sha1_generic virtio_net net_failover failover sg virtio_rng rng_core virtio_console ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic async_raid6_recov async_memcpy async_pq raid6_pq async_xor xor xor_neon async_tx raid1 raid0 linear md_mod sd_mod t10_pi virtio_scsi scsi_mod virtio_blk virtio_mmio virtio_pci virtio_ring virtio [last unloaded: scsi_debug]
 CPU: 0 PID: 5871 Comm: kworker/0:0 Not tainted 5.6.0-rc2 #1
 Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
 Workqueue: dm-cache do_waker [dm_cache]
 pstate: 40000085 (nZcv daIf -PAN -UAO)
 pc : __memset+0x16c/0x188
 lr : smq_tick+0x70/0x2e0 [dm_cache_smq]
 sp : ffffff80c8a0bd60
 x29: ffffff80c8a0bd60 x28: ffffffc010646000
 x27: ffffff80d9f07d20 x26: ffffff80e5466cb8
 x25: 0000000000000002 x24: ffffff80f13eb150
 x23: fffffffebff3f300 x22: ffffff80c00f6080
 x21: 0000000000000000 x20: ffffffc010646000
 x19: ffffff80c00f6000 x18: 0000000000000000
 x17: 0000000000000000 x16: 0000000000000000
 x15: 00000026ffffffd9 x14: 0000000000000000
 x13: 0000000000000001 x12: 0000000000000000
 x11: 0000000000000015 x10: 00000000000007b0
 x9 : 0000000000000000 x8 : ffffffc0139d6000
 x7 : 0000000000000000 x6 : 000000000000003f
 x5 : 0000000000000040 x4 : 0000000000000000
 x3 : 0000000000000004 x2 : 0000000000000040
 x1 : 0000000000000000 x0 : ffffffc0139d6000
 Call trace:
  __memset+0x16c/0x188
  do_waker+0x28/0x70 [dm_cache]
  process_one_work+0x1a4/0x2f8
  worker_thread+0x48/0x3f8
  kthread+0xf8/0x128
  ret_from_fork+0x10/0x18
 Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
 ---[ end trace 76276b98b8f580fa ]---

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v3.9
Fixes: c6b4fcbad044 ("dm: add cache target")

---
 drivers/md/dm-cache-target.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-cache-target.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-cache-target.c	2019-12-11 09:33:14.000000000 +0100
+++ linux-2.6/drivers/md/dm-cache-target.c	2020-02-19 13:55:50.000000000 +0100
@@ -2846,8 +2846,8 @@ static void cache_postsuspend(struct dm_
 	prevent_background_work(cache);
 	BUG_ON(atomic_read(&cache->nr_io_migrations));
 
-	cancel_delayed_work(&cache->waker);
-	flush_workqueue(cache->wq);
+	cancel_delayed_work_sync(&cache->waker);
+	drain_workqueue(cache->wq);
 	WARN_ON(cache->tracker.in_flight);
 
 	/*

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

