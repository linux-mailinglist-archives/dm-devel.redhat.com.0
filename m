Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 45DF62134EA
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 09:26:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-Ol8Pa494Nc6XnZsFp3Zgwg-1; Fri, 03 Jul 2020 03:26:47 -0400
X-MC-Unique: Ol8Pa494Nc6XnZsFp3Zgwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF84D18A8222;
	Fri,  3 Jul 2020 07:26:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBFCC1A921;
	Fri,  3 Jul 2020 07:26:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78131180954D;
	Fri,  3 Jul 2020 07:26:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FFkhN016372 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:15:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ADAD2018299; Thu,  2 Jul 2020 15:15:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 815E6207ADF2
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:15:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F20A8EF3B1
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:15:44 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-wH_UDMPpOoGQtP1ya_EbcA-1; Thu, 02 Jul 2020 11:15:42 -0400
X-MC-Unique: wH_UDMPpOoGQtP1ya_EbcA-1
Received: by mail-lj1-f194.google.com with SMTP id s1so32702999ljo.0
	for <dm-devel@redhat.com>; Thu, 02 Jul 2020 08:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R/Xex7MZ8bFyQlM8Orr4KXrbDtUbhhyyCMB3wpQsPS4=;
	b=ofs6fhx5Bshh4YLM2piBAzVEx6NNRZXPfjpTiOT5uiUyXsLTxmMuGDnbP7nMDWJqAU
	WuBNj9Eqyzxk8ZkX0Ahh25qD7iGKfYw7KlCCv5bu36DUbYEptEMvbyRdo0e4iweA+Qw3
	nY9PLaQ3a1ty2hBOj7IUlTYKvf7nBWjRbnzCz583Y8Uigyi2EvGpkydfXcpRfnGvx72j
	D7uLPftKLzAmcx2CA2fo7H1m3r3YV1H91ancPmQKkveryOad3ya17DpLvABh86YpFRQt
	X67og6sF3NJ7rtJiBJPQ87fM4QpWHJA2CEHGuoek9NWMgHy3SNL5515eIPQ/cZ/2pniF
	tkQA==
X-Gm-Message-State: AOAM530D4GrlVP0x1dY4FQKTdW3rYyIJygENQLLa8EaW+lejgtfFkM8I
	fhvjt3TuZBXyuqaxRSnX8IYXPX2m4kHQ2peD5w8COg==
X-Google-Smtp-Source: ABdhPJwBMduJvE7FYCcb4hESdlIn76BHhduYWBz+R/cfmz0xIWta+cjolmesjd/AvLmdEf+PBUuV1aO/XJsOm/8GDNU=
X-Received: by 2002:a05:651c:1a6:: with SMTP id
	c6mr8528705ljn.358.1593702940271; 
	Thu, 02 Jul 2020 08:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200629193947.2705954-1-hch@lst.de>
	<20200629193947.2705954-19-hch@lst.de>
	<20200702141001.GA3834@lca.pw>
In-Reply-To: <20200702141001.GA3834@lca.pw>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 Jul 2020 20:45:28 +0530
Message-ID: <CA+G9fYuOWTZ51kUmx1nssZ8BLfcB5yzHQme8mcZWPmUoOm=zGA@mail.gmail.com>
To: Qian Cai <cai@lca.pw>, Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 03:26:16 -0400
Cc: linux-m68k@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	linux-nvme@lists.infradead.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, linux-s390@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-nvdimm@lists.01.org, john.fastabend@gmail.com,
	Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>,
	linux-xtensa@linux-xtensa.org,
	Alexei Starovoitov <ast@kernel.org>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, lkft-triage@lists.linaro.org,
	kpsingh@chromium.org, Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Martin KaFai Lau <kafai@fb.com>
Subject: Re: [dm-devel] [PATCH 18/20] block: refator submit_bio_noacct
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2020 at 19:40, Qian Cai <cai@lca.pw> wrote:
>
> On Mon, Jun 29, 2020 at 09:39:45PM +0200, Christoph Hellwig wrote:
> > Split out a __submit_bio_noacct helper for the actual de-recursion
> > algorithm, and simplify the loop by using a continue when we can't
> > enter the queue for a bio.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>

Kernel BUG: on arm64 and x86_64 devices running linux next-rc3-next-20200702
with KASAN config enabled. While running mkfs -t ext4.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: d37d57041350dff35dd17cbdf9aef4011acada38
  git describe: next-20200702
  make_kernelversion: 5.8.0-rc3
  kernel-config:
https://builds.tuxbuild.com/DnjQHvYrx586eUoFxtYZxQ/kernel.config

steps to reproduce:
 # mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SDSSDA120G_165193445014


BUG: KASAN: stack-out-of-bounds in bio_alloc_bioset+0x28c/0x2c8
[   59.398307] Read of size 8 at addr ffff0009084277e0 by task mkfs.ext4/417
[   59.405121]
[   59.406644] CPU: 5 PID: 417 Comm: mkfs.ext4 Not tainted
5.8.0-rc3-next-20200702 #1
[   59.414248] Hardware name: ARM Juno development board (r2) (DT)
[   59.420195] Call trace:
[   59.422683]  dump_backtrace+0x0/0x2b8
[   59.426386]  show_stack+0x18/0x28
[   59.429741]  dump_stack+0xec/0x144
[   59.433183]  print_address_description.isra.0+0x6c/0x448
[   59.438531]  kasan_report+0x134/0x200
[   59.442226]  __asan_load8+0x9c/0xd8
[   59.445751]  bio_alloc_bioset+0x28c/0x2c8
[   59.449796]  bio_clone_fast+0x28/0x98
[   59.453492]  bio_split+0x64/0x138
[   59.456842]  __blk_queue_split+0x534/0x698
[   59.460979]  blk_mq_submit_bio+0x10c/0x680
[   59.465118]  submit_bio_noacct+0x57c/0x640
[   59.469253]  submit_bio+0xc0/0x358
[   59.472688]  submit_bio_wait+0xc0/0x110
[   59.476561]  blkdev_issue_discard+0xd0/0x138
[   59.480877]  blk_ioctl_discard+0x1b8/0x238
[   59.485008]  blkdev_common_ioctl+0x594/0xd38
[   59.489312]  blkdev_ioctl+0x130/0x578
[   59.493010]  block_ioctl+0x78/0x98
[   59.496453]  ksys_ioctl+0xb8/0xf8
[   59.499808]  __arm64_sys_ioctl+0x44/0x60
[   59.503781]  el0_svc_common.constprop.0+0xa4/0x1e0
[   59.508615]  do_el0_svc+0x38/0xa0
[   59.511967]  el0_sync_handler+0x98/0x1a8
[   59.515922]  el0_sync+0x158/0x180
[   59.519255]
[   59.520761] The buggy address belongs to the page:
[   59.525590] page:fffffe00240109c0 refcount:0 mapcount:0
mapping:0000000000000000 index:0x0
[   59.533895] flags: 0x2ffff00000000000()
[   59.537779] raw: 2ffff00000000000 0000000000000000 fffffe00240109c8
0000000000000000
[   59.545575] raw: 0000000000000000 0000000000000000 00000000ffffffff
0000000000000000
[   59.553352] page dumped because: kasan: bad access detected
[   59.558947]
[   59.560463] addr ffff0009084277e0 is located in stack of task
mkfs.ext4/417 at offset 48 in frame:
[   59.569475]  submit_bio_noacct+0x0/0x640
[   59.573423]
[   59.574930] this frame has 2 objects:
[   59.578624]  [32, 48) 'bio_list'
[   59.578644]  [64, 96) 'bio_list_on_stack'
[   59.581889]
[   59.587412] Memory state around the buggy address:
[   59.592243]  ffff000908427680: 00 00 00 f2 00 00 00 f2 f2 f2 00 00
00 00 00 f3
[   59.599510]  ffff000908427700: f3 f3 f3 f3 00 00 00 00 00 00 00 00
00 00 00 00
[   59.606777] >ffff000908427780: 00 00 00 00 00 00 f1 f1 f1 f1 00 00
f2 f2 00 00
[   59.614031]                                                        ^
[   59.620427]  ffff000908427800: 00 00 f3 f3 f3 f3 00 00 00 00 00 00
00 00 00 00
[   59.627694]  ffff000908427880: 00 00 00 00 00 00 f1 f1 f1 f1 00 00
00 00 f3 f3
[   59.634946] ==================================================================
[   59.642198] Disabling lock debugging due to kernel taint


Kernel BUG on x86_64:

[   17.809563] ==================================================================
[   17.816786] BUG: KASAN: stack-out-of-bounds in bio_alloc_bioset+0x31f/0x340
[   17.823750] Read of size 8 at addr ffff888225f9f450 by task systemd-udevd/361
[   17.830881]
[   17.832384] CPU: 0 PID: 361 Comm: systemd-udevd Not tainted
5.8.0-rc3-next-20200702 #1
[   17.840294] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.2 05/23/2018
[   17.847686] Call Trace:
[   17.850143]  dump_stack+0x84/0xba
[   17.853462]  print_address_description.constprop.0+0x1f/0x210
[   17.859212]  ? _raw_spin_lock_irqsave+0x7c/0xd0
[   17.859214]  ? _raw_write_lock_irqsave+0xd0/0xd0
[   17.859217]  ? bio_alloc_bioset+0x31f/0x340
[   17.859220]  kasan_report.cold+0x37/0x7c
[   17.859222]  ? bio_alloc_bioset+0x31f/0x340
[   17.859224]  __asan_load8+0x86/0xb0
[   17.859226]  bio_alloc_bioset+0x31f/0x340
[   17.859228]  ? bvec_alloc+0x160/0x160
[   17.859230]  ? bio_alloc_bioset+0x253/0x340
[   17.859232]  ? mpage_alloc.isra.0+0x37/0x120
[   17.859234]  ? do_mpage_readpage+0x740/0xd40
[   17.859236]  ? mpage_readahead+0x196/0x280
[   17.859238]  ? blkdev_readahead+0x10/0x20
[   17.859241]  ? read_pages+0x149/0x470
[   17.859243]  ? page_cache_readahead_unbounded+0x2de/0x360
[   17.859246]  ? __do_page_cache_readahead+0x6c/0x80
[   17.859248]  bio_clone_fast+0x14/0x30
[   17.859250]  bio_split+0x64/0x1b0
[   17.859252]  __blk_queue_split+0x417/0x8d0
[   17.859255]  ? __blk_rq_map_sg+0x820/0x820
[   17.859258]  ? kmem_cache_alloc+0xc6/0x4b0
[   17.859260]  ? mempool_alloc_slab+0x12/0x20
[   17.859262]  blk_mq_submit_bio+0x150/0xb90
[   17.859265]  ? blk_mq_try_issue_directly+0xe0/0xe0
[   17.859267]  ? blk_queue_enter+0xea/0x460
[   17.859269]  ? submit_bio_checks+0x4cc/0xa00
[   17.859272]  ? bio_add_page+0x78/0x110
[   17.859274]  submit_bio_noacct+0x5ff/0x6c0
[   17.859276]  ? mpage_alloc.isra.0+0xab/0x120
[   17.859279]  ? blk_queue_enter+0x460/0x460
[   17.859281]  ? do_mpage_readpage+0xc02/0xd40
[   17.859283]  submit_bio+0xb5/0x2e0
[   17.859286]  ? submit_bio_noacct+0x6c0/0x6c0
[   17.859288]  ? __disk_get_part+0x3d/0x50
[   17.859290]  mpage_readahead+0x227/0x280
[   17.859293]  ? do_mpage_readpage+0xd40/0xd40
[   17.859295]  ? bdev_evict_inode+0x130/0x130
[   17.859297]  ? find_get_pages_contig+0x340/0x340
[   17.859299]  blkdev_readahead+0x10/0x20
[   17.859302]  read_pages+0x149/0x470
[   17.859304]  ? lru_cache_add+0xde/0xf0
[   17.859306]  ? read_cache_pages+0x280/0x280
[   17.859309]  ? add_to_page_cache_locked+0x10/0x10
[   17.859310]  ? alloc_pages_current+0x98/0x110
[   17.859313]  page_cache_readahead_unbounded+0x2de/0x360
[   17.859316]  ? read_pages+0x470/0x470
[   17.859319]  ? xas_load+0xee/0x110
[   17.859321]  ? find_get_entry+0xbf/0x250
[   17.859323]  __do_page_cache_readahead+0x6c/0x80
[   17.859326]  force_page_cache_readahead+0xee/0x180
[   17.859329]  page_cache_sync_readahead+0x131/0x140
[   17.859331]  generic_file_buffered_read+0x698/0x1130
[   17.859334]  ? get_page_from_freelist+0x1b13/0x1e60
[   17.859337]  ? pagecache_get_page+0x3a0/0x3a0
[   17.859340]  ? __isolate_free_page+0x210/0x210
[   17.859342]  ? __ia32_sys_mmap_pgoff+0x90/0x90
[   17.859345]  generic_file_read_iter+0x17f/0x1f0
[   17.859347]  ? memory_high_write+0x1c0/0x1c0
[   17.859349]  blkdev_read_iter+0x76/0x90
[   17.859352]  new_sync_read+0x298/0x3c0
[   17.859354]  ? __ia32_sys_llseek+0x230/0x230
[   17.859357]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
[   17.859359]  ? fsnotify+0x12c/0x5f0
[   17.859361]  ? __vfs_read+0x30/0x90
[   17.859363]  __vfs_read+0x76/0x90
[   17.859365]  vfs_read+0xc8/0x1e0
[   17.859368]  ksys_read+0xc8/0x170
[   17.859370]  ? kernel_write+0xc0/0xc0
[   17.859372]  ? syscall_trace_enter+0x166/0x280
[   17.859375]  __x64_sys_read+0x3e/0x50
[   17.859377]  do_syscall_64+0x43/0x70
[   17.859379]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   17.859381] RIP: 0033:0x7fe23cf4b56e
[   17.859382] Code: Bad RIP value.
[   17.859383] RSP: 002b:00007fff586583c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[   17.859386] RAX: ffffffffffffffda RBX: 00005620318bd8a0 RCX: 00007fe23cf4b56e
[   17.859387] RDX: 0000000000040000 RSI: 00007fe23dd56038 RDI: 000000000000000f
[   17.859388] RBP: 0000000000040000 R08: 00007fe23dd56010 R09: 0000000000000000
[   17.859390] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
[   17.859391] R13: 00005620318bd8f0 R14: 00007fe23dd56028 R15: 00007fe23dd56010
[   17.859392]
[   17.859393] The buggy address belongs to the page:
[   17.859396] page:ffffea000897e7c0 refcount:0 mapcount:0
mapping:0000000000000000 index:0x0
[   17.859397] flags: 0x200000000000000()
[   17.859400] raw: 0200000000000000 0000000000000000 ffffea000897e7c8
0000000000000000
[   17.859403] raw: 0000000000000000 0000000000000000 00000000ffffffff
0000000000000000
[   17.859403] page dumped because: kasan: bad access detected
[   17.859404]
[   17.859406] addr ffff888225f9f450 is located in stack of task
systemd-udevd/361 at offset 48 in frame:
[   17.859408]  submit_bio_noacct+0x0/0x6c0
[   17.859409]
[   17.859410] this frame has 2 objects:
[   17.859412]  [32, 48) 'bio_list'
[   17.859414]  [64, 96) 'bio_list_on_stack'
[   17.859414]
[   17.859415] Memory state around the buggy address:
[   17.859417]  ffff888225f9f300: f2 00 00 00 f2 00 00 00 f2 f2 f2 00
00 00 00 00
[   17.859418]  ffff888225f9f380: f3 f3 f3 f3 f3 00 00 00 00 00 00 00
00 00 00 00
[   17.859420] >ffff888225f9f400: 00 00 00 00 f1 f1 f1 f1 00 00 f2 f2
00 00 00 00
[   17.859421]                                                  ^
[   17.859422]  ffff888225f9f480: f3 f3 f3 f3 00 00 00 00 00 00 00 00
00 00 00 00
[   17.859424]  ffff888225f9f500: 00 00 00 f1 f1 f1 f1 00 00 00 00 f3
f3 f3 f3 00
[   17.859425] ==================================================================
[   17.859425] Disabling lock debugging due to kernel taint

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

