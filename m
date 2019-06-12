Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EDC45746
	for <lists+dm-devel@lfdr.de>; Fri, 14 Jun 2019 10:18:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9EE930821BE;
	Fri, 14 Jun 2019 08:18:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E316605CD;
	Fri, 14 Jun 2019 08:18:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28C021833004;
	Fri, 14 Jun 2019 08:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CKUDnd006995 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 16:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C084F2FC44; Wed, 12 Jun 2019 20:30:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8FDE53787
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 20:30:11 +0000 (UTC)
Received: from mail.mschade.de (mail.mschade.de [178.63.171.18])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4DD47E423
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 20:29:55 +0000 (UTC)
Received: from pegasus.fritz.box
	(p200300DF4F2D3B00B62E99FFFE42D2A7.dip0.t-ipconnect.de
	[IPv6:2003:df:4f2d:3b00:b62e:99ff:fe42:d2a7])
	by mail.mschade.de (Postfix) with ESMTPSA id DB63A205907
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 20:02:07 +0200 (CEST)
To: dm-devel@redhat.com
From: Markus Schade <markus.schade@gmail.com>
Message-ID: <3a15015b-95cf-fb0c-4582-a096f7832ea2@mschade.de>
Date: Wed, 12 Jun 2019 20:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Delayed for 02:27:51 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Wed, 12 Jun 2019 20:30:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 12 Jun 2019 20:30:01 +0000 (UTC) for IP:'178.63.171.18'
	DOMAIN:'mail.mschade.de' HELO:'mail.mschade.de'
	FROM:'markus.schade@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.204 * (DKIM_ADSP_CUSTOM_MED, FREEMAIL_FROM,
	NML_ADSP_CUSTOM_MED, SPF_HELO_NONE,
	SPF_NONE) 178.63.171.18 mail.mschade.de 178.63.171.18 mail.mschade.de
	<markus.schade@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Jun 2019 04:15:49 -0400
Subject: [dm-devel] dm thin block allocation failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 14 Jun 2019 08:18:18 +0000 (UTC)

Hi

On Linux 5.1 (confirmed up to 5.1.2) I am seeing more or less regular
lockups of the dm layer.

I first discovered this issue after upgrading to Ubuntu's 18.04 kernel
(based on 4.15).  The original bug report is at
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1777398

As can be seen, I have tested a number of their kernels and mainline
kernels since then.

I have the following storage stack:

VM (mostly single partition and ext4, but could be anything)
LVM thin volume
MD RAID 10
GPT partition
Intel P4510 NVMe

Discard passdown is enable throughout the whole stack.

VM thin volumes get created by taking a snapshot of a snapshot from a
source thin volume (containing an OS image) and then deleting the
intermediate snapshot, making the new volumes independent.

Judging from the call trace, my guess is that there is somewhere a race
condition, when a new block needs to be allocated which has still to be
discarded.

Unfortunately I have not yet been able to find an (easy) reproducer.

Best regards,
Markus


------------[ cut here ]------------
kernel BUG at drivers/md/persistent-data/dm-space-map-disk.c:178!
invalid opcode: 0000 [#1] SMP PTI
CPU: 24 PID: 4180452 Comm: kworker/u128:1 Not tainted
5.1.2-050102-generic #201905141830
Hardware name: Quanta Cloud Technology Inc. QuantaGrid D52B-1U/S5B-MB
(LBG-4), BIOS 3A13.Q402 11/16/2018
Workqueue: dm-thin do_worker [dm_thin_pool]
RIP: 0010:sm_disk_new_block+0x92/0xa0 [dm_persistent_data]
Code: 55 e4 48 83 c0 01 48 89 83 20 22 00 00 49 8b 34 24 e8 82 f7 ff ff
85 c0 75 c4 83 7d e4 01 75 0a 48 83 83 28 22 00 00 01 eb b4 <0f> 0b e8
a7 31 f8 d6 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89
RSP: 0018:ffffb42036cefca8 EFLAGS: 00010297
RAX: 0000000000000000 RBX: ffff98e6e7fa0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff98e6ff3bfe00
RBP: ffffb42036cefcc8 R08: 0000000000000000 R09: ffffb42036cefa38
R10: 000000003dc9bc00 R11: 0000000000000000 R12: ffffb42036cefd70
R13: ffffb42036cefd70 R14: ffff98e70934e000 R15: ffff9925a7c30fb0
FS:  0000000000000000(0000) GS:ffff9927bf600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000a095d80008 CR3: 0000009cf49be004 CR4: 00000000007626e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 dm_pool_alloc_data_block+0x3c/0x60 [dm_thin_pool]
 alloc_data_block.isra.61+0x6c/0x1a0 [dm_thin_pool]
 process_cell+0x2cd/0x4f0 [dm_thin_pool]
 ? u32_swap+0x10/0x10
 ? sort+0x13b/0x220
 ? u32_swap+0x10/0x10
 do_worker+0x27c/0x900 [dm_thin_pool]
 ? __schedule+0x2db/0x840
 process_one_work+0x20f/0x410
 worker_thread+0x34/0x400
 kthread+0x120/0x140
 ? process_one_work+0x410/0x410
 ? __kthread_parkme+0x70/0x70
 ret_from_fork+0x35/0x40
Modules linked in: xt_CHECKSUM xt_nat iptable_nat dm_snapshot veth dummy
bridge ip6table_filter ip6_tables iptable_mangle xt_tcpudp xt_conntrack
iptable_filter xt_CT iptable_raw ip_tables x_tables bpfilter vhost_net
vhost tap intel_rapl dm_thin_pool skx_edac dm_persistent_data nfit
dm_bio_prison dm_bufio x86_pkg_temp_thermal intel_powerclamp coretemp
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel aesni_intel aes_x86_64 crypto_simd cryptd
glue_helper intel_cstate intel_rapl_perf lpc_ich ioatdma dca ipmi_ssif
acpi_power_meter acpi_pad mac_hid ipmi_si ipmi_devintf ipmi_msghandler
nf_nat_ftp nf_conntrack_ftp nf_nat_sip nf_conntrack_sip nf_nat_pptp
nf_conntrack_pptp nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
tcp_htcp 8021q garp mrp stp llc bonding autofs4 btrfs zstd_compress
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor
raid6_pq libcrc32c raid0 multipath linear raid1 raid10 i2c_algo_bit ttm
drm_kms_helper syscopyarea
 sysfillrect sysimgblt fb_sys_fops i40e drm nvme ahci nvme_core libahci wmi
---[ end trace 82bb0f2c4f63c2ca ]---
RIP: 0010:sm_disk_new_block+0x92/0xa0 [dm_persistent_data]
Code: 55 e4 48 83 c0 01 48 89 83 20 22 00 00 49 8b 34 24 e8 82 f7 ff ff
85 c0 75 c4 83 7d e4 01 75 0a 48 83 83 28 22 00 00 01 eb b4 <0f> 0b e8
a7 31 f8 d6 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89
RSP: 0018:ffffb42036cefca8 EFLAGS: 00010297
RAX: 0000000000000000 RBX: ffff98e6e7fa0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff98e6ff3bfe00
RBP: ffffb42036cefcc8 R08: 0000000000000000 R09: ffffb42036cefa38
R10: 000000003dc9bc00 R11: 0000000000000000 R12: ffffb42036cefd70
R13: ffffb42036cefd70 R14: ffff98e70934e000 R15: ffff9925a7c30fb0
FS:  0000000000000000(0000) GS:ffff9927bf600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000a095d80008 CR3: 0000009cf49be004 CR4: 00000000007626e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
