Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC5E2139E6
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 14:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593778754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mXkAYcrnsDt2EoocFY/vX0oImesWrvXLxfEblP3dDKo=;
	b=XCvCnePboQ+sO8Q8zBL//egQPrNR5T7dNi+zvDRl5laARXuzRO29Z7CEux7vfZEw7q7G3U
	PN6R3LM18SVXR4HQmrfyZRy1ZXK5zBkNF3/ivG0hOQCqsmfgmbCc60mTza5yTc4PUTkRva
	TwzbwhtV+4rVmQpocyZNEKBrsq1VwLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-RApHo76pOaW8GiiEoI7rbA-1; Fri, 03 Jul 2020 08:19:12 -0400
X-MC-Unique: RApHo76pOaW8GiiEoI7rbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9826F107ACF7;
	Fri,  3 Jul 2020 12:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2133F7BD4A;
	Fri,  3 Jul 2020 12:19:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FC786C9CB;
	Fri,  3 Jul 2020 12:18:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063CIWes031071 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 08:18:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4029A100238C; Fri,  3 Jul 2020 12:18:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5611D10013D4;
	Fri,  3 Jul 2020 12:18:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 063CISbW014177; Fri, 3 Jul 2020 08:18:28 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 063CISKb014173; Fri, 3 Jul 2020 08:18:28 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 3 Jul 2020 08:18:28 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>
Message-ID: <alpine.LRH.2.02.2007030812320.13686@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: [dm-devel] a crash in md-raid
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I report a crash in md-raid. I have 5.8-rc3 kernel with debugging enabled. 
The crash happened when running the "shell/integrity-blocksize.sh" lvm 
test.

The crash is not reproducible.

Mikulas


[ 1188.640677] device-mapper: raid: Superblocks created for new raid set
[ 1188.679378] md/raid1:mdX: not clean -- starting background reconstruction
[ 1188.681072] md/raid1:mdX: active with 2 out of 2 mirrors
[ 1189.093707] mdX: bitmap file is out of date, doing full recovery
[ 1189.108688] md: resync of RAID array mdX
[ 1189.341925] Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b73
[ 1189.343183] Mem abort info:
[ 1189.343632]   ESR = 0x96000004
[ 1189.344219]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 1189.345012]   SET = 0, FnV = 0
[ 1189.345483]   EA = 0, S1PTW = 0
[ 1189.345998] Data abort info:
[ 1189.346483]   ISV = 0, ISS = 0x00000004
[ 1189.347109]   CM = 0, WnR = 0
[ 1189.347589] [006b6b6b6b6b6b73] address between user and kernel address ranges
[ 1189.348761] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[ 1189.349802] Modules linked in: brd reiserfs hmac crc32_generic dm_zero dm_integrity dm_crypt dm_writecache dm_raid xfs dm_thin_pool dm_cache_smq dm_cache dm_persistent_data dm_bio_prison dm_mirror dm_region_hash dm_log dm_snapshot dm_bufio loop ipv6 autofs4 binfmt_misc nls_utf8 nls_cp852 vfat fat dm_mod af_packet aes_ce_blk crypto_simd cryptd aes_ce_cipher crct10dif_ce ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce sha1_generic efivars sg virtio_rng virtio_net rng_core net_failover failover virtio_console ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic async_raid6_recov async_memcpy async_pq raid6_pq async_xor xor xor_neon async_tx raid1 raid0 linear md_mod sd_mod t10_pi virtio_scsi scsi_mod virtio_blk virtio_mmio virtio_pci virtio_ring virtio [last unloaded: scsi_debug]
[ 1189.370709] CPU: 2 PID: 20 Comm: ksoftirqd/2 Not tainted 5.8.0-rc3-debug #1
[ 1189.372088] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015
[ 1189.373400] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[ 1189.374492] pc : end_sync_write+0x38/0xf8 [raid1]
[ 1189.375408] lr : bio_endio+0x234/0x238
[ 1189.376134] sp : ffffff80fee87af0
[ 1189.376788] x29: ffffff80fee87af0 x28: 0000000000000004
[ 1189.377817] x27: 0000000000000100 x26: ffffffc010532916
[ 1189.378832] x25: 0000000100015b61 x24: 0000000100015b61
[ 1189.379860] x23: 0000000000000001 x22: ffffffc01062f8e8
[ 1189.380921] x21: 6b6b6b6b6b6b6b6b x20: ffffff80eaaa2058
[ 1189.381967] x19: ffffff80d2e01c00 x18: 0000000000000000
[ 1189.382970] x17: 0000000000000000 x16: 0000000000000000
[ 1189.383994] x15: 0000000000000000 x14: 0000000000000000
[ 1189.385003] x13: 0000000000000000 x12: 0000000000000001
[ 1189.386010] x11: 0000000000000000 x10: 00000000000010f0
[ 1189.387032] x9 : ffffff80f932cf98 x8 : 0000000000000000
[ 1189.388044] x7 : 0000000000000000 x6 : 0000000000000000
[ 1189.389050] x5 : 0000000000000001 x4 : ffffff80fee87aa0
[ 1189.390062] x3 : ffffff8000000000 x2 : 0000000000000001
[ 1189.391088] x1 : ffffff80fa22ca00 x0 : ffffff80d2e01c00
[ 1189.392230] Call trace:
[ 1189.392719]  end_sync_write+0x38/0xf8 [raid1]
[ 1189.393553]  bio_endio+0x234/0x238
[ 1189.394440]  dec_pending+0x1b8/0x1bc [dm_mod]
[ 1189.395307]  clone_endio+0x14c/0x160 [dm_mod]
[ 1189.396155]  bio_endio+0x234/0x238
[ 1189.397602]  blk_update_request+0x2f8/0x418
[ 1189.398473]  blk_mq_end_request+0x20/0x44
[ 1189.400709]  lo_complete_rq+0x5c/0xbc [loop]
[ 1189.401771]  blk_done_softirq+0xbc/0xc0
[ 1189.402564]  efi_header_end+0x368/0x4b8
[ 1189.403559]  run_ksoftirqd+0x34/0x64
[ 1189.404303]  smpboot_thread_fn+0x228/0x22c
[ 1189.405132]  kthread+0x114/0x124
[ 1189.405807]  ret_from_fork+0x10/0x18
[ 1189.406537] Code: f9400013 aa1303e0 f9401274 f9400295 (f94006a8)
[ 1189.414734] ---[ end trace 4538a7676b244523 ]---
[ 1189.415635] Kernel panic - not syncing: Fatal exception in interrupt
[ 1189.416874] SMP: stopping secondary CPUs
[ 1189.417691] Kernel Offset: disabled
[ 1189.418380] CPU features: 0x000022,00002000
[ 1189.419185] Memory Limit: none
[ 1189.419743] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

