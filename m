Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46EC1359DD6
	for <lists+dm-devel@lfdr.de>; Fri,  9 Apr 2021 13:49:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-43ltA6YPPpST6uCcV0T8rA-1; Fri, 09 Apr 2021 07:48:52 -0400
X-MC-Unique: 43ltA6YPPpST6uCcV0T8rA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9020A1922023;
	Fri,  9 Apr 2021 11:48:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7847018400;
	Fri,  9 Apr 2021 11:48:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B640444A5B;
	Fri,  9 Apr 2021 11:48:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139BmMJE000906 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 07:48:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18F2C10547B6; Fri,  9 Apr 2021 11:48:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1422810545F1
	for <dm-devel@redhat.com>; Fri,  9 Apr 2021 11:48:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE3F802816
	for <dm-devel@redhat.com>; Fri,  9 Apr 2021 11:48:19 +0000 (UTC)
Received: from mx4.veeam.com (mx4.veeam.com [104.41.138.86]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-272-bOu4Q6f-Naa7QOacZ7Aoyg-1;
	Fri, 09 Apr 2021 07:48:17 -0400
X-MC-Unique: bOu4Q6f-Naa7QOacZ7Aoyg-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx4.veeam.com (Postfix) with ESMTPS id 8DBDB84E3E;
	Fri,  9 Apr 2021 14:48:15 +0300 (MSK)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Fri, 9 Apr 2021 13:48:14 +0200
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: Christoph Hellwig <hch@infradead.org>, Hannes Reinecke <hare@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, 
	<dm-devel@redhat.com>, <linux-fsdevel@vger.kernel.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 9 Apr 2021 14:48:00 +0300
Message-ID: <1617968884-15149-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29D2A50B59657262
X-Veeam-MMEX: True
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH v8 0/4] block device interposer
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I think I'm ready to suggest the next version of block device interposer
(blk_interposer). It allows to redirect bio requests to other block
devices.

In this series of patches, I reviewed the process of attaching and
detaching device mapper via blk_interposer.

Now the dm-target is attached to the interposed block device when the
interposer dm-target is fully ready to accept requests, and the interposed
block device queue is locked, and the file system on it is frozen.
The detaching is also performed when the file system on the interposed
block device is in a frozen state, the queue is locked, and the interposer
dm-target is suspended.

To make it possible to lock the receipt of new bio requests without locking
the processing of bio requests that the interposer creates, I had to change
the submit_bio_noacct() function and add a lock. To minimize the impact of
locking, I chose percpu_rw_sem. I tried to do without a new lock, but I'm
afraid it's impossible.

Checking the operation of the interposer, I did not limit myself to
a simple dm-linear. When I experimented with dm-era, I noticed that it
accepts two block devices. Since Mike was against changing the logic in
the dm-targets itself to support the interrupter, I decided to add the
[interpose] option to the block device path.

 echo "0 ${DEV_SZ} era ${META} [interpose]${DEV} ${BLK_SZ}" | \
 	dmsetup create dm-era --interpose

I believe this option can replace the DM_INTERPOSE_FLAG flag. Of course,
we can assume that if the device cannot be opened with the FMODE_EXCL,
then it is considered an interposed device, but it seems to me that
algorithm is unsafe. I hope to get Mike's opinion on this.

I have successfully tried taking snapshots. But I ran into a problem
when I removed origin-target:
[   49.031156] ------------[ cut here ]------------
[   49.031180] kernel BUG at block/bio.c:1476!
[   49.031198] invalid opcode: 0000 [#1] SMP NOPTI
[   49.031213] CPU: 9 PID: 636 Comm: dmsetup Tainted: G            E     5.12.0-rc6-ip+ #52
[   49.031235] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[   49.031257] RIP: 0010:bio_split+0x74/0x80
[   49.031273] Code: 89 c7 e8 5f 56 03 00 41 8b 74 24 28 48 89 ef e8 12 ea ff ff f6 45 15 01 74 08 66 41 81 4c 24 14 00 01 4c 89 e0 5b 5d 41 5c c3 <0f> 0b 0f 0b 0f 0b 45 31 e4 eb ed 90 0f 1f 44 00 00 39 77 28 76 05
[   49.031322] RSP: 0018:ffff9a6100993ab0 EFLAGS: 00010246
[   49.031337] RAX: 0000000000000008 RBX: 0000000000000000 RCX: ffff8e26938f96d8
[   49.031357] RDX: 0000000000000c00 RSI: 0000000000000000 RDI: ffff8e26937d1300
[   49.031375] RBP: ffff8e2692ddc000 R08: 0000000000000000 R09: 0000000000000000
[   49.031394] R10: ffff8e2692b1de00 R11: ffff8e2692b1de58 R12: ffff8e26937d1300
[   49.031413] R13: ffff8e2692ddcd18 R14: ffff8e2691d22140 R15: ffff8e26937d1300
[   49.031432] FS:  00007efffa6e7800(0000) GS:ffff8e269bc80000(0000) knlGS:0000000000000000
[   49.031453] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   49.031470] CR2: 00007efffa96cda0 CR3: 0000000114bd0000 CR4: 00000000000506e0
[   49.031490] Call Trace:
[   49.031501]  dm_submit_bio+0x383/0x500 [dm_mod]
[   49.031522]  submit_bio_noacct+0x370/0x770
[   49.031537]  submit_bh_wbc+0x160/0x190
[   49.031550]  __sync_dirty_buffer+0x65/0x130
[   49.031564]  ext4_commit_super+0xbc/0x120 [ext4]
[   49.031602]  ext4_freeze+0x54/0x80 [ext4]
[   49.031631]  freeze_super+0xc8/0x160
[   49.031643]  freeze_bdev+0xb2/0xc0
[   49.031654]  lock_bdev_fs+0x1c/0x30 [dm_mod]
[   49.031671]  __dm_suspend+0x2b9/0x3b0 [dm_mod]
[   49.032095]  dm_suspend+0xed/0x160 [dm_mod]
[   49.032496]  ? __find_device_hash_cell+0x5b/0x2a0 [dm_mod]
[   49.032897]  ? remove_all+0x30/0x30 [dm_mod]
[   49.033299]  dev_remove+0x4c/0x1c0 [dm_mod]
[   49.033679]  ctl_ioctl+0x1a5/0x470 [dm_mod]
[   49.034067]  dm_ctl_ioctl+0xa/0x10 [dm_mod]
[   49.034432]  __x64_sys_ioctl+0x83/0xb0
[   49.034785]  do_syscall_64+0x33/0x80
[   49.035139]  entry_SYSCALL_64_after_hwframe+0x44/0xae
When suspend is executed for origin-target before the interposer is
being detached, in the origin_map() function the value of the
o->split_binary variable is zero, since no snapshots were connected to it.
I think that if no snapshots are connected, then it does not make sense
to split the bio request into parts.

Changes summary for this patchset v7:
  * The attaching and detaching to interposed device moved to
    __dm_suspend() and __dm_resume() functions.
  * Redesigned th submit_bio_noacct() function and added a lock for the
    block device interposer.
  * Adds [interpose] option to block device patch in dm table.
  * Fix origin_map() then o->split_binary value is zero.

History:
v7 - https://patchwork.kernel.org/project/linux-block/cover/1615563895-28565-1-git-send-email-sergei.shtepa@veeam.com/
  * the request interception mechanism. Now the interposer is
    a block device that receives requests instead of the original device;
  * code design fixes.

History:
v6 - https://patchwork.kernel.org/project/linux-block/cover/1614774618-22410-1-git-send-email-sergei.shtepa@veeam.com/
  * designed for 5.12;
  * thanks to the new design of the bio structure in v5.12, it is
    possible to perform interception not for the entire disk, but
    for each block device;
  * instead of the new ioctl DM_DEV_REMAP_CMD and the 'noexcl' option,
    the DM_INTERPOSED_FLAG flag for the ioctl DM_TABLE_LOAD_CMD is
    applied.

v5 - https://patchwork.kernel.org/project/linux-block/cover/1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com/
 * rebase for v5.11-rc7;
 * patch set organization;
 * fix defects in documentation;
 * add some comments;
 * change mutex names for better code readability;
 * remove calling bd_unlink_disk_holder() for targets with non-exclusive
   flag;
 * change type for struct dm_remap_param from uint8_t to __u8.

v4 - https://patchwork.kernel.org/project/linux-block/cover/1612367638-3794-1-git-send-email-sergei.shtepa@veeam.com/
Mostly changes were made, due to Damien's comments:
 * on the design of the code;
 * by the patch set organization;
 * bug with passing a wrong parameter to dm_get_device();
 * description of the 'noexcl' parameter in the linear.rst.
Also added remap_and_filter.rst.

v3 - https://patchwork.kernel.org/project/linux-block/cover/1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com/
In this version, I already suggested blk_interposer to apply to dm-linear.
Problems were solved:
 * Interception of bio requests from a specific device on the disk, not
   from the entire disk. To do this, we added the dm_interposed_dev
   structure and an interval tree to store these structures.
 * Implemented ioctl DM_DEV_REMAP_CMD. A patch with changes in the lvm2
   project was sent to the team lvm-devel@redhat.com.
 * Added the 'noexcl' option for dm-linear, which allows you to open
   the underlying block-device without FMODE_EXCL mode.

v2 - https://patchwork.kernel.org/project/linux-block/cover/1607518911-30692-1-git-send-email-sergei.shtepa@veeam.com/
I tried to suggest blk_interposer without using it in device mapper,
but with the addition of a sample of its use. It was then that I learned
about the maintainers' attitudes towards the samples directory :).

v1 - https://lwn.net/ml/linux-block/20201119164924.74401-1-hare@suse.de/
This Hannes's patch can be considered as a starting point, since this is
where the interception mechanism and the term blk_interposer itself
appeared. It became clear that blk_interposer can be useful for
device mapper.

before v1 - https://patchwork.kernel.org/project/linux-block/cover/1603271049-20681-1-git-send-email-sergei.shtepa@veeam.com/
I tried to offer a rather cumbersome blk-filter and a monster-like
blk-snap module for creating snapshots.

Thank you to everyone who was able to take the time to review
the previous versions.
I hope that this time I achieved the required quality.

Thanks,
Sergei.

Sergei Shtepa (4):
  Adds blk_interposer. It allows to redirect bio requests to another
    block device.
  Adds the blk_interposers logic to __submit_bio_noacct().
  Adds blk_interposer to md.
  fix origin_map - don't split a bio for the origin device if it does
    not have registered snapshots.

 block/bio.c                   |   2 +
 block/blk-core.c              | 194 ++++++++++++++------------
 block/genhd.c                 |  51 +++++++
 drivers/md/dm-core.h          |   1 +
 drivers/md/dm-ioctl.c         |  95 ++++++++++---
 drivers/md/dm-snap.c          |  15 +-
 drivers/md/dm-table.c         |  68 ++++++++-
 drivers/md/dm.c               | 254 ++++++++++++++++++++++++++++++----
 drivers/md/dm.h               |   8 +-
 fs/block_dev.c                |   3 +
 include/linux/blk_types.h     |   6 +
 include/linux/blkdev.h        |  32 +++++
 include/linux/device-mapper.h |   1 +
 include/uapi/linux/dm-ioctl.h |   6 +
 14 files changed, 586 insertions(+), 150 deletions(-)

--
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

