Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F426E0741
	for <lists+dm-devel@lfdr.de>; Thu, 13 Apr 2023 08:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681368961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=08AAIfcjL8AiBr1TuIJ33NCDeZNwMgBb/jlF/ibWtYY=;
	b=WzcQ9TMzd7sugokrzIvSM/fTuesMMhuPeE52bDq5BJ6yBQbbCFWX9r5hKzJ8qKXRbLeQ3a
	cwYuZDJl/IuKYCWjGmWYusxVvcWXDHEMVEvrkQV0mqUtbUGvvQQMZIXvHC2tuTJfIMxdFC
	Bur2g4xWZ5Py//rMuS5TfSr12SpGNfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-pYWDwrS7P5u8YScFIVhWRQ-1; Thu, 13 Apr 2023 02:55:18 -0400
X-MC-Unique: pYWDwrS7P5u8YScFIVhWRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34803857FB9;
	Thu, 13 Apr 2023 06:55:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20BC0BC88;
	Thu, 13 Apr 2023 06:55:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6AB901946A76;
	Thu, 13 Apr 2023 06:55:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E7229194658F
 for <dm-devel@listman.corp.redhat.com>; Wed, 12 Apr 2023 09:36:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D942A492B00; Wed, 12 Apr 2023 09:36:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1B8D492C3E
 for <dm-devel@redhat.com>; Wed, 12 Apr 2023 09:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE6E83822DEA
 for <dm-devel@redhat.com>; Wed, 12 Apr 2023 09:36:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-u3xYs32VMZCyKgNyOF1RGQ-1; Wed, 12 Apr 2023 05:36:31 -0400
X-MC-Unique: u3xYs32VMZCyKgNyOF1RGQ-1
Received: by mail-pl1-f182.google.com with SMTP id p8so10822125plk.9
 for <dm-devel@redhat.com>; Wed, 12 Apr 2023 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681292190; x=1683884190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEe8hBiVZGVRUXUAkMcCqAaNuITvRlmRpl8r5dCVshg=;
 b=dF1cRWZx0BYzhGfnaSa0inwoKicF0Ga/f3gM2zn283FoeVlV9jqHncshl43ESX//Cu
 kV7MpO33EjbBaEeV7bOUoDqSO2x0KvQCdwUdyiIB4zVSQf0uyOpoafYquoigdxPpkynP
 y6sYAigNA5Fi8KDK23NoF9ZdiPfWqzlg0BUfQjlUwY/lR/YSGiH5oTBQCsmbIqOBAYFs
 T29An/Wo9lE6fPAhxYPlOdBuxUHG9YPC7MTGZXy3/cq39MDo3a9i9PcYyx0Eet50SCs3
 j38zQ7KgoY+Gdx0j667/aWuip8c8gSTH8rCv92aCTUDA+e48URmP7IjeqUlXHEPcT0CE
 xqZw==
X-Gm-Message-State: AAQBX9eg2viLZ5xYVwpffotvvtemko+HxSXhecNpo66IfZJPi8YVHVB0
 hrPRm8e35wiKGHIY0S33oZpBow==
X-Google-Smtp-Source: AKy350Yuyqi9PvDH0Vwd39k3KHlVJ83Rk7wT+lEZyICoZ0hcAReJ0KiGRGXsrOp6YBiITphPH0p+sQ==
X-Received: by 2002:a17:90a:5b:b0:233:feb4:895f with SMTP id
 27-20020a17090a005b00b00233feb4895fmr18452539pjb.44.1681292189750; 
 Wed, 12 Apr 2023 02:36:29 -0700 (PDT)
Received: from localhost.localdomain ([124.123.191.81])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001a183ade911sm11109741plt.56.2023.04.12.02.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 02:36:29 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: michael.christie@oracle.com
Date: Wed, 12 Apr 2023 15:06:17 +0530
Message-Id: <20230412093617.285177-1-naresh.kamboju@linaro.org>
In-Reply-To: <20230407200551.12660-1-michael.christie@oracle.com>
References: <20230407200551.12660-1-michael.christie@oracle.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 13 Apr 2023 06:55:08 +0000
Subject: [dm-devel] [PATCH v6 00/18] Use block pr_ops in LIO
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
Cc: shy828301@gmail.com, roman.gushchin@linux.dev,
 linux-nvme@lists.infradead.org, james.bottomley@hansenpartnership.com,
 dm-devel@redhat.com, target-devel@vger.kernel.org, hch@lst.de,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, willy@infradead.org,
 chaitanyak@nvidia.com, ryan.roberts@arm.com, keescook@chromium.org,
 snitzer@kernel.org, linux-block@vger.kernel.org, kbusch@kernel.org,
 vbabka@suse.cz, yuzhao@google.com, axboe@kernel.dk, martin.petersen@oracle.com,
 halbuer@sra.uni-hannover.de, mkoutny@suse.com, akpm@linux-foundation.org,
 mgorman@techsingularity.net, zokeefe@google.com,
 kirill.shutemov@linux.intel.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[sorry for the adding you in CC]

While running LTP controllers test suite on this patch set applied on top of
the next-20230406 and the following kernel panic noticed on qemu-i386.

crash log:
---------
pids 1 TINFO: timeout per run is 0h 25m 0s
pids 1 TINFO: test starts with cgroup version 1
pids 1 TINFO: Running testcase 6 with 10 processes
pids 1 TINFO: set a limit that is smaller than current number of pids
<6>[  782.211806] cgroup: fork rejected by pids controller in /ltp/test-2724
pids 1 TPASS: fork failed as expected
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2760 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2761 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2762 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2763 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2764 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2765 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2766 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2767 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2768 Killed                  pids_task2
/opt/ltp/testcases/bin/tst_test.sh: line 150:  2769 Killed                  pids_task2
<4>[  782.594441] int3: 0000 [#1] PREEMPT SMP
<4>[  782.594783] CPU: 1 PID: 2724 Comm: pids.sh Not tainted 6.3.0-rc5-next-20230406 #1
<4>[  782.594915] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
<4>[  782.595168] EIP: get_page_from_freelist+0x157/0xccc
<4>[  782.595745] Code: 48 04 8d 43 08 85 c9 0f 85 fe 07 00 00 3b 73 0c 0f 82 f5 07 00 00 89 45 c8 8b 45 c8 8b 00 89 45 e0 85 c0 0f 84 fc 07 00 00 3e <8d> 74 26 00 8b 45 cc 80 78 14 00 0f 84 90 05 00 00 8b 45 e0 8b 58
<4>[  782.595850] EAX: 00000000 EBX: c7ab5ce4 ECX: 00000800 EDX: 00000000
<4>[  782.595889] ESI: 00400dc0 EDI: 00000000 EBP: c7ab5c78 ESP: c7ab5c04
<4>[  782.595928] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000297
<4>[  782.596017] CR0: 80050033 CR2: 086d1d54 CR3: 06eaa000 CR4: 000006d0
<4>[  782.596188] Call Trace:
<4>[  782.596503]  ? exc_int3+0x10/0x130
<4>[  782.596630]  ? __irq_exit_rcu+0x15/0xcc
<4>[  782.596655]  ? sysvec_call_function+0x3c/0x3c
<4>[  782.596677]  ? __irq_exit_rcu+0x15/0xcc
<4>[  782.596694]  ? irqentry_exit+0x26/0x58
<4>[  782.596733]  __alloc_pages+0x156/0xf50
<4>[  782.596783]  ? handle_exception+0x133/0x133
<4>[  782.596817]  ? __rcu_read_unlock+0x1e/0x30
<4>[  782.596843]  ? sysvec_call_function+0x3c/0x3c
<4>[  782.596880]  ? __irq_exit_rcu+0x15/0xcc
<4>[  782.596903]  pte_alloc_one+0x23/0x88
<4>[  782.596928]  __pte_alloc+0x21/0xb0
<4>[  782.596981]  ? trace_hardirqs_on+0x2c/0x88
<4>[  782.597002]  copy_page_range+0x67d/0xb40
<4>[  782.597049]  ? mas_wr_modify+0x10e/0x364
<4>[  782.597069]  ? mod_objcg_state+0x99/0x378
<4>[  782.597103]  ? mas_wr_store_entry.isra.0+0x10c/0x534
<4>[  782.597127]  ? mas_store+0x45/0xb0
<4>[  782.597160]  copy_process+0x1de6/0x1f9c
<4>[  782.597179]  ? lockref_get_not_dead+0x2c/0x38
<4>[  782.597246]  kernel_clone+0xc1/0x3dc
<4>[  782.597279]  __ia32_sys_clone+0x71/0x8c
<4>[  782.597320]  __do_fast_syscall_32+0x4c/0xb8
<4>[  782.597340]  do_fast_syscall_32+0x32/0x74
<4>[  782.597361]  do_SYSENTER_32+0x15/0x24
<4>[  782.597381]  entry_SYSENTER_32+0x98/0xf1
<4>[  782.597484] EIP: 0xb7f3e579
<4>[  782.597838] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
<4>[  782.597856] EAX: ffffffda EBX: 01200011 ECX: 00000000 EDX: 00000000
<4>[  782.597876] ESI: 00000000 EDI: b7f398e8 EBP: b7f01e3c ESP: bfa4599c
<4>[  782.597889] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000286
<4>[  782.598167] Modules linked in:
<4>[  782.616852]  ---[ end trace 0000000000000000 ] ---
<4>[  782.616998] EIP: get_page_from_freelist+0x157/0xccc
<4>[  782.617213] Code: 48 04 8d 43 08 85 c9 0f 85 fe 07 00 00 3b 73 0c 0f 82 f5 07 00 00 89 45 c8 8b 45 c8 8b 00 89 45 e0 85 c0 0f 84 fc 07 00 00 3e <8d> 74 26 00 8b 45 cc 80 78 14 00 0f 84 90 05 00 00 8b 45 e0 8b 58
<4>[  782.617234] EAX: 00000000 EBX: c7ab5ce4 ECX: 00000800 EDX: 00000000
<4>[  782.617247] ESI: 00400dc0 EDI: 00000000 EBP: c7ab5c78 ESP: c7ab5c04
<4>[  782.617260] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000297
<4>[  782.617276] CR0: 80050033 CR2: 086d1d54 CR3: 06eaa000 CR4: 000006d0
<0>[  782.617472] Kernel panic - not syncing: Fatal exception in interrupt
<0>[  782.619115] Kernel Offset: disabled


Crash log details,
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-block_20230404140835_25166-1-sergei_shtepa_veeam_com/testrun/16171777/suite/log-parser-test/test/check-kernel-panic/details/
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-block_20230404140835_25166-1-sergei_shtepa_veeam_com/testrun/16171777/suite/log-parser-test/test/check-kernel-panic/log

Build artifacts links,
https://storage.tuxsuite.com/public/linaro/anders/builds/2OGpRflnb14kT3aJdPte4NdjKoT/
vmlinux: https://storage.tuxsuite.com/public/linaro/anders/builds/2OGpRflnb14kT3aJdPte4NdjKoT/vmlinux.xz
System.map: https://storage.tuxsuite.com/public/linaro/anders/builds/2OGpRflnb14kT3aJdPte4NdjKoT/System.map


steps to reproduce:
# To install tuxrun on your system globally:
# sudo pip3 install -U tuxrun==0.41.0
#
# See https://tuxrun.org/ for complete documentation.

tuxrun   \
 --runtime podman   \
 --device qemu-i386   \
 --kernel https://storage.tuxsuite.com/public/linaro/anders/builds/2OGpRflnb14kT3aJdPte4NdjKoT/bzImage   \
 --modules https://storage.tuxsuite.com/public/linaro/anders/builds/2OGpRflnb14kT3aJdPte4NdjKoT/modules.tar.xz   \
 --rootfs https://storage.tuxsuite.com/public/linaro/lkft/oebuilds/2OFRZUbhWDZYvEcYrKKj1AJ618K/images/intel-core2-32/lkft-tux-image-intel-core2-32-20230410193126.rootfs.ext4.gz   \
 --parameters SKIPFILE=skipfile-lkft.yaml   \
 --parameters SHARD_NUMBER=10   \
 --parameters SHARD_INDEX=10   \
 --image docker.io/lavasoftware/lava-dispatcher:2023.01.0020.gc1598238f   \
 --tests ltp-controllers   \
 --timeouts boot=15 ltp-controllers=80


--
Linaro LKFT
https://lkft.linaro.org

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

