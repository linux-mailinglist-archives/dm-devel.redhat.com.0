Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2A5424DB52
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:38:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-Xd0Z-Fu3N5Owo-49i0IlTA-1; Fri, 21 Aug 2020 12:38:12 -0400
X-MC-Unique: Xd0Z-Fu3N5Owo-49i0IlTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5AFE100670C;
	Fri, 21 Aug 2020 16:38:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0027AED4;
	Fri, 21 Aug 2020 16:38:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 516EE181A06C;
	Fri, 21 Aug 2020 16:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L9hXGf003768 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 05:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D55E9F559F; Fri, 21 Aug 2020 09:43:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A45F51AD
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20A38EDF02
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:33 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-150-LYm9O37ZOyKIb3l2AS8pVA-1; Fri, 21 Aug 2020 05:43:25 -0400
X-MC-Unique: LYm9O37ZOyKIb3l2AS8pVA-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 5C2703FACCD50B1AB7AC;
	Fri, 21 Aug 2020 17:27:19 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 21 Aug 2020
	17:27:10 +0800
From: Ye Bin <yebin10@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Fri, 21 Aug 2020 17:26:49 +0800
Message-ID: <20200821092651.1587859-3-yebin10@huawei.com>
In-Reply-To: <20200821092651.1587859-1-yebin10@huawei.com>
References: <20200821092651.1587859-1-yebin10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07L9hXGf003768
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: yebin10@huawei.com
Subject: [dm-devel] [PATCH 2/4] dm thin metadata: Fix use-after-free in
	dm_bm_set_read_only
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We got follow error when test disk online/offline:
[  301.798344] device-mapper: thin: 253:5: aborting current metadata transaction
[  301.848441] device-mapper: thin: 253:5: failed to abort metadata transaction
[  301.849206] Aborting journal on device dm-26-8.
[  301.850489] EXT4-fs error (device dm-26) in __ext4_new_inode:943: Journal has aborted
[  301.851095] EXT4-fs (dm-26): Delayed block allocation failed for inode 398742 at logical offset 181 with max blocks 19 with error 30
[  301.854476] BUG: KASAN: use-after-free in dm_bm_set_read_only+0x3a/0x40 [dm_persistent_data]
[  301.854483] Write of size 1 at addr ffff88802d3c9688 by task dockerd/2201
[  301.854491]
[  301.855766] EXT4-fs error (device dm-26) in ext4_writepages:2934: Journal has aborted
[  301.857018] CPU: 2 PID: 2201 Comm: dockerd Kdump: loaded Not tainted 4.18.0-147.5.0.5.h126.eulerosv2r9.x86_64-debug #3
[  301.857025] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-20170502_104147-build9a64a246a203 04/01/2014
[  301.857031] Call Trace:
[  301.859617]  dump_stack+0xdd/0x18e
[  301.859624]  ? show_regs_print_info+0x12/0x12
[  301.859634]  ? __rwsem_mark_wake+0xa40/0xa40
[  301.859641]  print_address_description+0x6a/0x270
[  301.859647]  kasan_report+0x1a4/0x2f0
[  301.859658]  ? dm_bm_set_read_only+0x3a/0x40 [dm_persistent_data]
[  301.859668]  ? dm_bm_set_read_only+0x3a/0x40 [dm_persistent_data]
[  301.859677]  dm_bm_set_read_only+0x3a/0x40 [dm_persistent_data]
[  301.859687]  dm_pool_metadata_read_only+0x42/0x60 [dm_thin_pool]
[  301.859695]  set_pool_mode+0x606/0xd80 [dm_thin_pool]
[  301.859701]  ? up_read+0x40/0x40
[  301.859709]  ? process_prepared_discard_fail+0x80/0x80 [dm_thin_pool]
[  301.859717]  ? metadata_operation_failed+0x16b/0x1e0 [dm_thin_pool]
[  301.859725]  metadata_operation_failed+0x187/0x1e0 [dm_thin_pool]
[  301.859733]  commit+0x257/0x370 [dm_thin_pool]
[  301.859741]  ? metadata_operation_failed+0x1e0/0x1e0 [dm_thin_pool]
[  301.859750]  ? _parse_integer+0x130/0x130
[  301.859757]  ? memcpy+0x34/0x50
[  301.859765]  pool_message+0x24f/0xc70 [dm_thin_pool]
[  301.859782]  ? realloc_argv+0x73/0x110 [dm_mod]
[  301.859789]  ? commit+0x370/0x370 [dm_thin_pool]
[  301.859796]  ? kasan_unpoison_shadow+0x30/0x40
[  301.859803]  ? __kasan_slab_free+0x145/0x180
[  301.859813]  ? realloc_argv+0xcb/0x110 [dm_mod]
[  301.859818]  ? kfree+0x90/0x1a0
[  301.859824]  ? rcu_sync_dtor+0x160/0x160
[  301.859834]  ? dm_split_args+0x447/0x5c0 [dm_mod]
[  301.859844]  ? dm_get_live_table+0x76/0x140 [dm_mod]
[  301.859854]  ? dm_get_stats+0x20/0x20 [dm_mod]
[  301.859864]  ? dm_table_find_target+0x242/0x2b0 [dm_mod]
[  301.859872]  ? commit+0x370/0x370 [dm_thin_pool]
[  301.859881]  target_message+0x759/0xb80 [dm_mod]
[  301.859893]  ? __dev_status+0x6c0/0x6c0 [dm_mod]
[  301.859898]  ? selinux_inode_copy_up+0x180/0x180
[  301.859905]  ? __virt_addr_valid+0x17f/0x220
[  301.859911]  ? usercopy_abort+0xd0/0xd0
[  301.859916]  ? kasan_kmalloc_large+0x71/0xe0
[  301.859922]  ? kmalloc_large_node+0x68/0x80
[  301.859933]  ? __dev_status+0x6c0/0x6c0 [dm_mod]
[  301.859942]  ctl_ioctl+0x5b7/0xe40 [dm_mod]
[  301.859953]  ? free_params+0x50/0x50 [dm_mod]
[  301.859960]  ? avc_has_extended_perms+0x6d8/0x1030
[  301.859971]  ? mem_cgroup_throttle_swaprate+0x92/0x520
[  301.859980]  ? lru_cache_add_active_or_unevictable+0x12e/0x330
[  301.859991]  ? rcu_barrier+0x5f0/0x5f0
[  301.860001]  dm_ctl_ioctl+0x23/0x30 [dm_mod]
[  301.860016]  ? ctl_ioctl+0xe40/0xe40 [dm_mod]
[  301.860027]  do_vfs_ioctl+0x1a6/0x13c0
[  301.860038]  ? selinux_file_ioctl+0x418/0x6d0
[  301.860047]  ? ioctl_preallocate+0x2a0/0x2a0
[  301.860054]  ? selinux_file_mprotect+0x590/0x590
[  301.860064]  ? iterate_fd+0x2c0/0x2c0
[  301.860075]  ? trace_event_raw_event_sys_enter+0x670/0x670
[  301.860083]  ? handle_mm_fault+0x292/0x7a0
[  301.860089]  ? security_file_ioctl+0x5d/0xb0
[  301.860094]  ? selinux_file_mprotect+0x590/0x590
[  301.860100]  ksys_ioctl+0x89/0xa0
[  301.860107]  __x64_sys_ioctl+0x74/0xb0
[  301.860113]  do_syscall_64+0x172/0x590
[  301.860120]  ? syscall_return_slowpath+0x3c0/0x3c0
[  301.860128]  ? __do_page_fault+0xa80/0xa80
[  301.860135]  ? prepare_exit_to_usermode+0x1bb/0x290
[  301.860141]  ? enter_from_user_mode+0x70/0x70
[  301.860149]  ? __switch_to_asm+0x35/0x70
[  301.860155]  ? __switch_to_asm+0x41/0x70
[  301.860163]  entry_SYSCALL_64_after_hwframe+0x65/0xca
[  301.860169] RIP: 0033:0x7f7246f028a7
[  301.860179] Code: b3 66 90 48 8b 05 f9 15 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff
8 64 89 01 48
[  301.860182] RSP: 002b:00007f71e3ffeaf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  301.860189] RAX: ffffffffffffffda RBX: 0000564d3473cb30 RCX: 00007f7246f028a7
[  301.860193] RDX: 00007f71d4059c80 RSI: 00000000c138fd0e RDI: 000000000000000a
[  301.860196] RBP: 00007f7247013513 R08: 0000000000000000 R09: 0000000000000001
[  301.860200] R10: 000000c000eb44c0 R11: 0000000000000246 R12: 0000000000000000
[  301.860204] R13: 00007f71d4059cb0 R14: 00007f71d4059c80 R15: 00007f71d4006f20
[  301.860208]
[  301.860438] Allocated by task 2201:
[  301.860848]  kasan_kmalloc+0xa0/0xd0
[  301.860854]  kmem_cache_alloc_trace+0xf3/0x1e0
[  301.860864]  dm_block_manager_create+0x55/0x130 [dm_persistent_data]
[  301.860872]  __create_persistent_data_objects+0xbe/0x1820 [dm_thin_pool]
[  301.860879]  dm_pool_abort_metadata+0x136/0x1e0 [dm_thin_pool]
[  301.860886]  metadata_operation_failed+0xac/0x1e0 [dm_thin_pool]
[  301.860892]  commit+0x257/0x370 [dm_thin_pool]
[  301.860901]  pool_message+0x24f/0xc70 [dm_thin_pool]
[  301.860916]  target_message+0x759/0xb80 [dm_mod]
[  301.860930]  ctl_ioctl+0x5b7/0xe40 [dm_mod]
[  301.860943]  dm_ctl_ioctl+0x23/0x30 [dm_mod]
[  301.860949]  do_vfs_ioctl+0x1a6/0x13c0
[  301.860954]  ksys_ioctl+0x89/0xa0
[  301.860959]  __x64_sys_ioctl+0x74/0xb0
[  301.860964]  do_syscall_64+0x172/0x590
[  301.860970]  entry_SYSCALL_64_after_hwframe+0x65/0xca
[  301.860972]
[  301.861192] Freed by task 2201:
[  301.861642]  __kasan_slab_free+0x130/0x180
[  301.861649]  kfree+0x90/0x1a0
[  301.861657]  __create_persistent_data_objects+0x163/0x1820 [dm_thin_pool]
[  301.861665]  dm_pool_abort_metadata+0x136/0x1e0 [dm_thin_pool]
[  301.861672]  metadata_operation_failed+0xac/0x1e0 [dm_thin_pool]
[  301.861678]  commit+0x257/0x370 [dm_thin_pool]
[  301.861685]  pool_message+0x24f/0xc70 [dm_thin_pool]
[  301.860916]  target_message+0x759/0xb80 [dm_mod]
[  301.860930]  ctl_ioctl+0x5b7/0xe40 [dm_mod]
[  301.860943]  dm_ctl_ioctl+0x23/0x30 [dm_mod]
[  301.860949]  do_vfs_ioctl+0x1a6/0x13c0
[  301.860954]  ksys_ioctl+0x89/0xa0
[  301.860959]  __x64_sys_ioctl+0x74/0xb0
[  301.860964]  do_syscall_64+0x172/0x590
[  301.860970]  entry_SYSCALL_64_after_hwframe+0x65/0xca
[  301.860972]
[  301.861192] Freed by task 2201:
[  301.861642]  __kasan_slab_free+0x130/0x180
[  301.861649]  kfree+0x90/0x1a0
[  301.861657]  __create_persistent_data_objects+0x163/0x1820 [dm_thin_pool]
[  301.861665]  dm_pool_abort_metadata+0x136/0x1e0 [dm_thin_pool]
[  301.861672]  metadata_operation_failed+0xac/0x1e0 [dm_thin_pool]
[  301.861678]  commit+0x257/0x370 [dm_thin_pool]
[  301.861685]  pool_message+0x24f/0xc70 [dm_thin_pool]
[  301.861698]  target_message+0x759/0xb80 [dm_mod]
[  301.861708]  ctl_ioctl+0x5b7/0xe40 [dm_mod]
[  301.861717]  dm_ctl_ioctl+0x23/0x30 [dm_mod]
[  301.861722]  do_vfs_ioctl+0x1a6/0x13c0
[  301.861727]  ksys_ioctl+0x89/0xa0
[  301.861732]  __x64_sys_ioctl+0x74/0xb0
[  301.861737]  do_syscall_64+0x172/0x590
[  301.861743]  entry_SYSCALL_64_after_hwframe+0x65/0xca
[  301.861744]
[  301.862034] The buggy address belongs to the object at ffff88802d3c9680#012 which belongs to the cache kmalloc-16 of size 16
[  301.863534] The buggy address is located 8 bytes inside of#012 16-byte region [ffff88802d3c9680, ffff88802d3c9690)
[  301.864847] The buggy address belongs to the page:
[  301.865475] page:ffffea0000b4f240 count:1 mapcount:0 mapping:ffff888107c0f980 index:0xffff88802d3c9200
[  301.866815] flags: 0xfffffc0000100(slab)
[  301.867302] raw: 000fffffc0000100 ffffea00042b9bc8 ffff888107c00110 ffff888107c0f980
[  301.868192] raw: ffff88802d3c97c0 000000000080007d 00000001ffffffff 0000000000000000
[  301.869084] page dumped because: kasan: bad access detected
[  301.869729]
[  301.869916] Memory state around the buggy address:
[  301.870475]  ffff88802d3c9580: 00 00 fc fc fb fb fc fc fb fb fc fc fb fb fc fc
[  301.871290]  ffff88802d3c9600: fb fb fc fc fb fb fc fc fb fb fc fc fb fb fc fc
[  301.872114] >ffff88802d3c9680: fb fb fc fc fb fb fc fc fb fb fc fc fb fb fc fc
[  301.872944]                       ^
[  301.873362]  ffff88802d3c9700: fb fb fc fc fb fb fc fc fb fb fc fc 00 00 fc fc
[  301.874174]  ffff88802d3c9780: fb fb fc fc fb fb fc fc 00 00 fc fc fb fb fc fc
[  301.875000] ==================================================================

reason:
imetadata_operation_failed
    abort_transaction
        dm_pool_abort_metadata
	    __create_persistent_data_objects
	        r = __open_or_format_metadata
	        if (r)--> If failed will free pmd->bm but pmd->bm not set NULL
		    dm_block_manager_destroy(pmd->bm);
    set_pool_mode
	dm_pool_metadata_read_only(pool->pmd);
	dm_bm_set_read_only(pmd->bm);  --> use-after-free

Add judge pmd->dm if NULL in dm_pool_metadata_read_only and dm_pool_metadata_read_write
function.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/md/dm-thin-metadata.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index ddb7f1f0bc48..568a9d1c1667 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -2044,14 +2044,16 @@ int dm_pool_resize_metadata_dev(struct dm_pool_metadata *pmd, dm_block_t new_cou
 void dm_pool_metadata_read_only(struct dm_pool_metadata *pmd)
 {
 	pmd_write_lock_in_core(pmd);
-	dm_bm_set_read_only(pmd->bm);
+	if (pmd->bm)
+		dm_bm_set_read_only(pmd->bm);
 	pmd_write_unlock(pmd);
 }
 
 void dm_pool_metadata_read_write(struct dm_pool_metadata *pmd)
 {
 	pmd_write_lock_in_core(pmd);
-	dm_bm_set_read_write(pmd->bm);
+	if (pmd->bm)
+		dm_bm_set_read_write(pmd->bm);
 	pmd_write_unlock(pmd);
 }
 
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

