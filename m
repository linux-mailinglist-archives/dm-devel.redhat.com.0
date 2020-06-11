Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C12861F7299
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jun 2020 05:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591933487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4EFdsXRZ1IIRUOS3j4V9/bWYJ4fTA9yRaQmbINAyfZ0=;
	b=aADE4nBqj/l2HfZ02pYhCh12yjt/D4GVQoPso/jHXegYV6ANl3IXHY/MCMI50fSfwca7CJ
	dHfTczooKrT9mYYa24r0HJeFm4T+f8XF9BTFtKaYdqYRYv1rGYCzkVYAUGeTV9QhX/VaYw
	EpqhzaLxr8tponTij02me7g0gYVQZJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-zCRC3yWYP1-tHumqNNt7fQ-1; Thu, 11 Jun 2020 23:44:45 -0400
X-MC-Unique: zCRC3yWYP1-tHumqNNt7fQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B10480B71E;
	Fri, 12 Jun 2020 03:44:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2DB2B4DF;
	Fri, 12 Jun 2020 03:44:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10C11180954D;
	Fri, 12 Jun 2020 03:44:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05BHlTgO026901 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jun 2020 13:47:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFFB92017F11; Thu, 11 Jun 2020 17:47:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB87F2026D5D
	for <dm-devel@redhat.com>; Thu, 11 Jun 2020 17:47:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02EAC858EE5
	for <dm-devel@redhat.com>; Thu, 11 Jun 2020 17:47:27 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
	[209.85.161.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-z0QjlcV1PqeExT0ohDTOsA-1; Thu, 11 Jun 2020 13:47:24 -0400
X-MC-Unique: z0QjlcV1PqeExT0ohDTOsA-1
Received: by mail-oo1-f66.google.com with SMTP id k7so1384624ooo.12
	for <dm-devel@redhat.com>; Thu, 11 Jun 2020 10:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=voSYBN9M6VeiI8IczmLsMma7oiI9LbeqmU0KVV0JhQk=;
	b=tuK8mKMLH8T0wOMAz0Qf65cr7G2wGOaG2C2JFagUTZlELjaLOO+8GDZ19iwd/rg3qC
	f/dPEr4m4U/qw+sqcSeO3/HBaydDPmB5YNLrF0BKcoqW1p0L9SWAQpwrwOohXOSiyyeH
	9uSAPVSxZ55T4HiJ/krVqvUhuP1olIA3m8/ftuNCp4V01DhOo7Z1QiBcU1uaTmyoNSkT
	Tbl7LFRURbIefEV+YTQq/n8QupBABuMUZZaXWZ0R6ScYcqKDahc+JZz3w7D7lQe/VsRH
	ZyaVOXjHlEVDsJ54VsoBG6ETUFsl444lfhMGL4f5vHAYthYrBtiV3HW1tPvA2sReAZsV
	1zDA==
X-Gm-Message-State: AOAM531UxlcjJTcpZRVA0rtdt5Wy0MkdxLLlkZFlVXYO/fGgjTuHiWLz
	oxdzyopKB2AmmWV+QSRTUujwv2m2M6dSmaw5/CBY182ODaCBRQ==
X-Google-Smtp-Source: ABdhPJySYNPgDiitnt3mUFWNCR9+Ded+JaxYaScDEB6XKPpXGpHPqVYaDvuCwQ/yl/j5ml079IntISbC2KqoDUh4ADE=
X-Received: by 2002:a4a:85c3:: with SMTP id u3mr7593426ooh.78.1591897642896;
	Thu, 11 Jun 2020 10:47:22 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Babrou <ivan@cloudflare.com>
Date: Thu, 11 Jun 2020 10:47:12 -0700
Message-ID: <CABWYdi0FgAGcc2pprF2EYB=-ctw5UZQLbtfQqnKqd0GoiMNFuw@mail.gmail.com>
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 11 Jun 2020 23:44:12 -0400
Cc: linux-kernel <linux-kernel@vger.kernel.org>, snitzer@redhat.com,
	agk@redhat.com, kernel-team <kernel-team@cloudflare.com>
Subject: [dm-devel] BUG: KASAN: use-after-free in tasklet_action_common on
	boot
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

We're seeing the following KASAN complaint on some nodes. These use
AMD CPUs and NVMe storage, and we don't see the same issue on older
Intel machines with SATA drives.

[Thu Jun 11 14:14:44 2020] systemd[1]: Detected architecture x86-64.
[Thu Jun 11 14:15:12 2020] device-mapper: uevent: version 1.0.3
[Thu Jun 11 14:15:12 2020] device-mapper: ioctl: 4.41.0-ioctl
(2019-09-16) initialised: dm-devel@redhat.com
[Thu Jun 11 14:15:14 2020] NET: Registered protocol family 38
[Thu Jun 11 14:15:16 2020]
==================================================================
[Thu Jun 11 14:15:16 2020] BUG: KASAN: use-after-free in
tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:75
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:57
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] Write of size 8 at addr ffff88bdd8725f48 by
task swapper/92/0

[Thu Jun 11 14:15:16 2020] CPU: 92 PID: 0 Comm: swapper/92 Not tainted
5.4.46-cloudflare-kasan-2020.6.10 #1
[Thu Jun 11 14:15:16 2020] Hardware name: GIGABYTE
R162-Z12-CD/MZ12-HD4-CD, BIOS R08a 01/21/2020
[Thu Jun 11 14:15:16 2020] Call Trace:
[Thu Jun 11 14:15:16 2020]  <IRQ>
[Thu Jun 11 14:15:16 2020] dump_stack
(/cfsetup_build/build/linux-5.4.46/lib/dump_stack.c:120)
[Thu Jun 11 14:15:16 2020] print_address_description.constprop.0
(/cfsetup_build/build/linux-5.4.46/mm/kasan/report.c:375)
[Thu Jun 11 14:15:16 2020] __kasan_report.cold
(/cfsetup_build/build/linux-5.4.46/mm/kasan/report.c:514)
[Thu Jun 11 14:15:16 2020] ? clone_endio+0xd1/0x710 dm_mod
[Thu Jun 11 14:15:16 2020] ? tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:75
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:57
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] ? tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:75
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:57
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] kasan_report
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/smap.h:69
/cfsetup_build/build/linux-5.4.46/mm/kasan/common.c:635)
[Thu Jun 11 14:15:16 2020] ? tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:75
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:57
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] check_memory_region
(/cfsetup_build/build/linux-5.4.46/mm/kasan/generic.c:185
/cfsetup_build/build/linux-5.4.46/mm/kasan/generic.c:191)
[Thu Jun 11 14:15:16 2020] tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:75
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:57
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] __do_softirq
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/jump_label.h:25
/cfsetup_build/build/linux-5.4.46/include/linux/jump_label.h:200
/cfsetup_build/build/linux-5.4.46/include/trace/events/irq.h:142
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:293)
[Thu Jun 11 14:15:16 2020] irq_exit
(/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:373
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:413)
[Thu Jun 11 14:15:16 2020] do_IRQ
(/cfsetup_build/build/linux-5.4.46/arch/x86/kernel/irq.c:267
(discriminator 42))
[Thu Jun 11 14:15:16 2020] common_interrupt
(/cfsetup_build/build/linux-5.4.46/arch/x86/entry/entry_64.S:610)
[Thu Jun 11 14:15:16 2020]  </IRQ>
[Thu Jun 11 14:15:16 2020] RIP: 0010:cpuidle_enter_state
(/cfsetup_build/build/linux-5.4.46/drivers/cpuidle/cpuidle.c:249)
[Thu Jun 11 14:15:16 2020] Code: 24 0f 1f 44 00 00 31 ff e8 34 cf ab
fe 80 7c 24 08 00 74 12 9c 58 f6 c4 02 0f 85 b7 07 00 00 31 ff e8 fb
78 bc fe fb 45 85 e4 <0f> 89 ef 02 00 00 48 8d 7b 14 48 b8 00 00 00 00
00 fc ff df 48 89
All code
========
   0: 24 0f                and    $0xf,%al
   2: 1f                    (bad)
   3: 44 00 00              add    %r8b,(%rax)
   6: 31 ff                xor    %edi,%edi
   8: e8 34 cf ab fe        callq  0xfffffffffeabcf41
   d: 80 7c 24 08 00        cmpb   $0x0,0x8(%rsp)
  12: 74 12                je     0x26
  14: 9c                    pushfq
  15: 58                    pop    %rax
  16: f6 c4 02              test   $0x2,%ah
  19: 0f 85 b7 07 00 00    jne    0x7d6
  1f: 31 ff                xor    %edi,%edi
  21: e8 fb 78 bc fe        callq  0xfffffffffebc7921
  26: fb                    sti
  27: 45 85 e4              test   %r12d,%r12d
  2a:* 0f 89 ef 02 00 00    jns    0x31f <-- trapping instruction
  30: 48 8d 7b 14          lea    0x14(%rbx),%rdi
  34: 48 b8 00 00 00 00 00 movabs $0xdffffc0000000000,%rax
  3b: fc ff df
  3e: 48                    rex.W
  3f: 89                    .byte 0x89

Code starting with the faulting instruction
===========================================
   0: 0f 89 ef 02 00 00    jns    0x2f5
   6: 48 8d 7b 14          lea    0x14(%rbx),%rdi
   a: 48 b8 00 00 00 00 00 movabs $0xdffffc0000000000,%rax
  11: fc ff df
  14: 48                    rex.W
  15: 89                    .byte 0x89
[Thu Jun 11 14:15:16 2020] RSP: 0018:ffff88bfeaeafd80 EFLAGS: 00000202
ORIG_RAX: ffffffffffffffde
[Thu Jun 11 14:15:16 2020] RAX: dffffc0000000000 RBX: ffff889fdcfc0800
RCX: 000000000000001f
[Thu Jun 11 14:15:16 2020] RDX: 1ffff117fdce6555 RSI: 0000000037a6f9a0
RDI: ffff88bfee732aa8
[Thu Jun 11 14:15:16 2020] RBP: ffffffff9288d660 R08: 00000128214f54ce
R09: ffff889fe9e23000
[Thu Jun 11 14:15:16 2020] R10: ffff889fe9e23099 R11: 00000058eb5113bb
R12: 0000000000000002
[Thu Jun 11 14:15:16 2020] R13: 0000000000000002 R14: ffffffff9288d738
R15: 00000000000000c0
[Thu Jun 11 14:15:16 2020] ? menu_enable_device
(/cfsetup_build/build/linux-5.4.46/drivers/cpuidle/governors/menu.c:558)
[Thu Jun 11 14:15:16 2020] cpuidle_enter
(/cfsetup_build/build/linux-5.4.46/include/linux/compiler.h:226
/cfsetup_build/build/linux-5.4.46/drivers/cpuidle/cpuidle.c:346)
[Thu Jun 11 14:15:16 2020] ? call_cpuidle
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/bitops.h:207
/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:238
/cfsetup_build/build/linux-5.4.46/include/linux/thread_info.h:84
/cfsetup_build/build/linux-5.4.46/include/linux/sched/idle.h:55
/cfsetup_build/build/linux-5.4.46/kernel/sched/idle.c:106)
[Thu Jun 11 14:15:16 2020] do_idle
(/cfsetup_build/build/linux-5.4.46/kernel/sched/idle.c:205
/cfsetup_build/build/linux-5.4.46/kernel/sched/idle.c:263)
[Thu Jun 11 14:15:16 2020] ? arch_cpu_idle_exit (??:?)
[Thu Jun 11 14:15:16 2020] ? __kthread_bind_mask
(/cfsetup_build/build/linux-5.4.46/kernel/kthread.c:407
/cfsetup_build/build/linux-5.4.46/kernel/kthread.c:395)
[Thu Jun 11 14:15:16 2020] cpu_startup_entry
(/cfsetup_build/build/linux-5.4.46/kernel/sched/idle.c:354
(discriminator 1))
[Thu Jun 11 14:15:16 2020] start_secondary
(/cfsetup_build/build/linux-5.4.46/arch/x86/kernel/smpboot.c:272)
[Thu Jun 11 14:15:16 2020] ? set_cpu_sibling_map
(/cfsetup_build/build/linux-5.4.46/arch/x86/kernel/smpboot.c:212)
[Thu Jun 11 14:15:16 2020] secondary_startup_64
(/cfsetup_build/build/linux-5.4.46/arch/x86/kernel/head_64.S:241)

[Thu Jun 11 14:15:16 2020] Allocated by task 0:
[Thu Jun 11 14:15:16 2020] (stack is not available)

[Thu Jun 11 14:15:16 2020] Freed by task 0:
[Thu Jun 11 14:15:16 2020] save_stack
(/cfsetup_build/build/linux-5.4.46/mm/kasan/common.c:55
/cfsetup_build/build/linux-5.4.46/mm/kasan/common.c:70)
[Thu Jun 11 14:15:16 2020] __kasan_slab_free
(/cfsetup_build/build/linux-5.4.46/mm/kasan/common.c:473)
[Thu Jun 11 14:15:16 2020] slab_free_freelist_hook
(/cfsetup_build/build/linux-5.4.46/mm/slub.c:1457)
[Thu Jun 11 14:15:16 2020] kmem_cache_free
(/cfsetup_build/build/linux-5.4.46/mm/slub.c:3014
/cfsetup_build/build/linux-5.4.46/mm/slub.c:3030)
[Thu Jun 11 14:15:16 2020] dec_pending+0x21f/0x930 dm_mod
[Thu Jun 11 14:15:16 2020] clone_endio+0x1bd/0x710 dm_mod
[Thu Jun 11 14:15:16 2020] tasklet_action_common.constprop.0
(/cfsetup_build/build/linux-5.4.46/include/asm-generic/bitops-instrumented.h:56
/cfsetup_build/build/linux-5.4.46/include/linux/interrupt.h:623
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:524)
[Thu Jun 11 14:15:16 2020] __do_softirq
(/cfsetup_build/build/linux-5.4.46/arch/x86/include/asm/jump_label.h:25
/cfsetup_build/build/linux-5.4.46/include/linux/jump_label.h:200
/cfsetup_build/build/linux-5.4.46/include/trace/events/irq.h:142
/cfsetup_build/build/linux-5.4.46/kernel/softirq.c:293)

[Thu Jun 11 14:15:16 2020] The buggy address belongs to the object at
ffff88bdd8725f00
which belongs to the cache bio-5 of size 1144
[Thu Jun 11 14:15:16 2020] The buggy address is located 72 bytes inside of
1144-byte region [ffff88bdd8725f00, ffff88bdd8726378)
[Thu Jun 11 14:15:16 2020] The buggy address belongs to the page:
[Thu Jun 11 14:15:16 2020] page:ffffea00f761c800 refcount:1 mapcount:0
mapping:ffff889dce1d2000 index:0x0 compound_mapcount: 0
[Thu Jun 11 14:15:16 2020] flags: 0xeffff800010200(slab|head)
[Thu Jun 11 14:15:16 2020] raw: 00effff800010200 dead000000000100
dead000000000122 ffff889dce1d2000
[Thu Jun 11 14:15:16 2020] raw: 0000000000000000 0000000080190019
00000001ffffffff 0000000000000000
[Thu Jun 11 14:15:16 2020] page dumped because: kasan: bad access detected

[Thu Jun 11 14:15:16 2020] Memory state around the buggy address:
[Thu Jun 11 14:15:16 2020]  ffff88bdd8725e00: fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc fc
[Thu Jun 11 14:15:16 2020]  ffff88bdd8725e80: fc fc fc fc fc fc fc fc
fc fc fc fc fc fc fc fc
[Thu Jun 11 14:15:16 2020] >ffff88bdd8725f00: fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb fb
[Thu Jun 11 14:15:16 2020]                                               ^
[Thu Jun 11 14:15:16 2020]  ffff88bdd8725f80: fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb fb
[Thu Jun 11 14:15:16 2020]  ffff88bdd8726000: fb fb fb fb fb fb fb fb
fb fb fb fb fb fb fb fb
[Thu Jun 11 14:15:16 2020]
==================================================================
[Thu Jun 11 14:15:16 2020] Disabling lock debugging due to kernel taint
[Thu Jun 11 14:15:25 2020] XFS (dm-0): Mounting V5 Filesystem
[Thu Jun 11 14:15:25 2020] XFS (dm-0): Ending clean mount

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

