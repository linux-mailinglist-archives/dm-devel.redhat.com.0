Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C676330D
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jul 2023 12:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690365763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TQtOKFjmcbH2cfd+M0kcH5GpFgUMRJAnOHZ6yW2LoCg=;
	b=N4wYpalk3zPeacGvzhCbi0MZk/xDtCLUb4srOQXL2Dao/jZH1v+YC8v+NgzaO11u7hLCsb
	J5zdVd7a9aTL+sdqXWJEnL/Z45K881eHTPH7CIkXcTjlIBkfXvEXlVN9wUi37ZjA+qqs19
	BlIIatsZdZ1z0jHGWy6xi2dxzilc8wI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-qW7PVU47NhG6NE1dne3BdQ-1; Wed, 26 Jul 2023 06:02:41 -0400
X-MC-Unique: qW7PVU47NhG6NE1dne3BdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75FC51C07252;
	Wed, 26 Jul 2023 10:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB6661121330;
	Wed, 26 Jul 2023 10:02:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F757194E012;
	Wed, 26 Jul 2023 10:02:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B05E51946A69
 for <dm-devel@listman.corp.redhat.com>; Wed, 26 Jul 2023 10:02:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8EFE340732A; Wed, 26 Jul 2023 10:02:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEA43492B01;
 Wed, 26 Jul 2023 10:02:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Song Liu <song@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Alasdair Kergon <agk@redhat.com>
MIME-Version: 1.0
Date: Wed, 26 Jul 2023 11:02:27 +0100
Message-ID: <4919.1690365747@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] Processes hung in "D" state in ext4, mm, md and dmcrypt
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-ext4@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4918.1690365747.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

With 6.5-rc2 (6.5.0-0.rc2.20230721gitf7e3a1bafdea.20.fc39.x86_64), I'm seeing
a bunch of processes getting stuck in the D state on my desktop after a few
hours of reading email and compiling stuff.  It's happened every day this week
so far and I managed to grab stack traces of the stuck processes this morning
(see attached).

There are two blockdevs involved below, /dev/md2 and /dev/md3.  md3 is a raid1
array with two partitions with an ext4 partition on it.  md2 is similar but
it's dm-crypted and ext4 is on top of that.

David
---

   1015 ?        D      0:04 [md2_raid1]
   1074 ?        D      0:00 [jbd2/sda6-8]
   1138 ?        D      0:00 [jbd2/md3-8]
   1167 ?        D      0:10 [dmcrypt_write/253:0]
   1202 ?        D      0:03 [jbd2/dm-0-8]
 117547 ?        D      5:12 [kworker/u16:8+flush-9:3]
 121540 ?        D      0:46 [kworker/u16:10+flush-253:0]
 125431 pts/2    Dl+    0:00 emacs .stgit-edit.txt
 125469 ?        D      0:00 /usr/libexec/nmh/rcvstore +kernel

===1015===
    PID TTY      STAT   TIME COMMAND
   1015 ?        D      0:04 [md2_raid1]
[<0>] md_super_wait+0xa2/0xe0
[<0>] md_bitmap_daemon_work+0x183/0x3b0
[<0>] md_check_recovery+0x42/0x5a0
[<0>] raid1d+0x87/0x16f0 [raid1]
[<0>] md_thread+0xab/0x190
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===1074===
    PID TTY      STAT   TIME COMMAND
   1074 ?        D      0:00 [jbd2/sda6-8]
[<0>] jbd2_journal_commit_transaction+0x11a6/0x1a20
[<0>] kjournald2+0xad/0x280
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===1138===
    PID TTY      STAT   TIME COMMAND
   1138 ?        D      0:00 [jbd2/md3-8]
[<0>] jbd2_journal_commit_transaction+0x162d/0x1a20
[<0>] kjournald2+0xad/0x280
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===1167===
    PID TTY      STAT   TIME COMMAND
   1167 ?        D      0:10 [dmcrypt_write/253:0]
[<0>] md_super_wait+0xa2/0xe0
[<0>] md_bitmap_unplug+0xad/0x120
[<0>] flush_bio_list+0xf3/0x100 [raid1]
[<0>] raid1_unplug+0x3b/0xb0 [raid1]
[<0>] __blk_flush_plug+0xd8/0x160
[<0>] blk_finish_plug+0x29/0x40
[<0>] dmcrypt_write+0x132/0x140 [dm_crypt]
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===1202===
    PID TTY      STAT   TIME COMMAND
   1202 ?        D      0:03 [jbd2/dm-0-8]
[<0>] jbd2_journal_commit_transaction+0x162d/0x1a20
[<0>] kjournald2+0xad/0x280
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===117547===
    PID TTY      STAT   TIME COMMAND
 117547 ?        D      5:12 [kworker/u16:8+flush-9:3]
[<0>] blk_mq_get_tag+0x11e/0x2b0
[<0>] __blk_mq_alloc_requests+0x1bc/0x350
[<0>] blk_mq_submit_bio+0x2c7/0x680
[<0>] __submit_bio+0x8b/0x170
[<0>] submit_bio_noacct_nocheck+0x159/0x370
[<0>] __block_write_full_folio+0x1e1/0x400
[<0>] writepage_cb+0x1a/0x70
[<0>] write_cache_pages+0x144/0x3b0
[<0>] do_writepages+0x164/0x1e0
[<0>] __writeback_single_inode+0x3d/0x360
[<0>] writeback_sb_inodes+0x1ed/0x4b0
[<0>] __writeback_inodes_wb+0x4c/0xf0
[<0>] wb_writeback+0x298/0x310
[<0>] wb_workfn+0x35b/0x510
[<0>] process_one_work+0x1de/0x3f0
[<0>] worker_thread+0x51/0x390
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===121540===
    PID TTY      STAT   TIME COMMAND
 121540 ?        D      0:46 [kworker/u16:10+flush-253:0]
[<0>] folio_wait_bit_common+0x13d/0x350
[<0>] mpage_prepare_extent_to_map+0x309/0x4d0
[<0>] ext4_do_writepages+0x25d/0xc90
[<0>] ext4_writepages+0xad/0x180
[<0>] do_writepages+0xcf/0x1e0
[<0>] __writeback_single_inode+0x3d/0x360
[<0>] writeback_sb_inodes+0x1ed/0x4b0
[<0>] __writeback_inodes_wb+0x4c/0xf0
[<0>] wb_writeback+0x298/0x310
[<0>] wb_workfn+0x35b/0x510
[<0>] process_one_work+0x1de/0x3f0
[<0>] worker_thread+0x51/0x390
[<0>] kthread+0xe5/0x120
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1b/0x30

===125431===
    PID TTY      STAT   TIME COMMAND
 125431 pts/2    Dl+    0:00 emacs .stgit-edit.txt
[<0>] jbd2_log_wait_commit+0xd8/0x140
[<0>] ext4_sync_file+0x1cc/0x380
[<0>] __x64_sys_fsync+0x3b/0x70
[<0>] do_syscall_64+0x5d/0x90
[<0>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8

===125469===
    PID TTY      STAT   TIME COMMAND
 125469 ?        D      0:00 /usr/libexec/nmh/rcvstore +kernel
[<0>] folio_wait_bit_common+0x13d/0x350
[<0>] folio_wait_writeback+0x2c/0x90
[<0>] truncate_inode_partial_folio+0x5e/0x1a0
[<0>] truncate_inode_pages_range+0x1da/0x400
[<0>] truncate_pagecache+0x47/0x60
[<0>] ext4_setattr+0x685/0xba0
[<0>] notify_change+0x1e0/0x4a0
[<0>] do_truncate+0x98/0xf0
[<0>] do_sys_ftruncate+0x15c/0x1b0
[<0>] do_syscall_64+0x5d/0x90
[<0>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

