Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 890274E6611
	for <lists+dm-devel@lfdr.de>; Thu, 24 Mar 2022 16:35:03 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-5vgYyN9eMmGay7XKUnUY_w-1; Thu, 24 Mar 2022 11:34:56 -0400
X-MC-Unique: 5vgYyN9eMmGay7XKUnUY_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39A64106655C;
	Thu, 24 Mar 2022 15:34:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2084F40F694;
	Thu, 24 Mar 2022 15:34:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C6C90194036A;
	Thu, 24 Mar 2022 15:34:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D07BC1940340
 for <dm-devel@listman.corp.redhat.com>; Tue, 22 Mar 2022 21:38:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B106C40D0160; Tue, 22 Mar 2022 21:38:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC35C40D0168
 for <dm-devel@redhat.com>; Tue, 22 Mar 2022 21:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F8013C14847
 for <dm-devel@redhat.com>; Tue, 22 Mar 2022 21:38:39 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-7-r-BBc6N8S8HFxqGsnqHw-1; Tue, 22 Mar 2022 17:38:35 -0400
X-MC-Unique: 7-r-BBc6N8S8HFxqGsnqHw-1
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2e592e700acso206434607b3.5; 
 Tue, 22 Mar 2022 14:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhLarTeeHq9Nw1QHwQ6lX7PivjIpiPg5RT82IKgrTQg=;
 b=J/VKTYKVzt2TN8xEecSPa/lOxWrE6e4Pl0bj6CqP5bZhWcw+T6euUoar2U0jIVZYNm
 4sSZ89S+82sFFPEziLWMcMr9yY/4IHQ9Y4FdRjDe6kuDx58Xgkp115XYa1vlU/3LUGH0
 rBoAAJ4KhTRls2LY1/JTEMjkbBRlhTTjrevxAWF8LRzu9ZVHzxnGMCFVCIX5ZYF5ff83
 QUIFwco9/B21XdhbCT10t8dNepriYscjT8uhjlfx3xznV3pO6yxaCN9M5tgTEXwRhX+M
 ds+Rp4LthX62F3tLMDQiKOK5ti7WgtKzcUo7w33thyxtpylgHcERKq4w0APHJ985wmpC
 s6/g==
X-Gm-Message-State: AOAM532bgPxZ58T+Z7xOjY472kfKbzwQZFApBzy7spsFq68ambhSraCL
 DL5WprXuo++VxhDX3htjpqmTPo1x2vLCdpRB4S4=
X-Google-Smtp-Source: ABdhPJw0CYtdti1wVV2bzL0irqt0sBusP9ofAFMscIeoyKl0lzXWGgn2B6cpzjxnKIOUPgO6Hm94TeUp8pnZ5ssFqRM=
X-Received: by 2002:a81:148f:0:b0:2e5:d8d9:5116 with SMTP id
 137-20020a81148f000000b002e5d8d95116mr25793876ywu.111.1647985114087; Tue, 22
 Mar 2022 14:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de>
 <20220124091107.642561-2-hch@lst.de>
 <20220322211915.GA2413063@roeck-us.net>
In-Reply-To: <20220322211915.GA2413063@roeck-us.net>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 23 Mar 2022 06:38:22 +0900
Message-ID: <CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Thu, 24 Mar 2022 15:34:43 +0000
Subject: Re: [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-nfs@vger.kernel.org, linux-nilfs <linux-nilfs@vger.kernel.org>,
 Mike Snitzer <snitzer@redhat.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>,
 device-mapper development <dm-devel@redhat.com>,
 "Md . Haris Iqbal" <haris.iqbal@ionos.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
 ntfs3@lists.linux.dev, Jack Wang <jinpu.wang@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, drbd-dev@lists.linbit.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 23, 2022 at 6:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Jan 24, 2022 at 10:10:49AM +0100, Christoph Hellwig wrote:
> > open code mpage_alloc in it's two callers and simplify the results
> > because of the context:
> >
> >  - __mpage_writepage always passes GFP_NOFS and can thus always sleep and
> >     will never get a NULL return from bio_alloc at all.
> >  - do_mpage_readpage can only get a non-sleeping context for readahead
> >    which never sets PF_MEMALLOC and thus doesn't need the retry loop
> >    either.
> >
> > Both cases will never have __GFP_HIGH set.
> >
>
> With this patch in the tree, I get:
>
> [    1.198134] Unexpected gfp: 0x2 (__GFP_HIGHMEM). Fixing up to gfp: 0x1192888 (GFP_NOWAIT|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_NOMEMALLOC|__GFP_HARDWALL|__GFP_MOVABLE|__GFP_SKIP_KASAN_POISON). Fix your code!
> [    1.198783] CPU: 0 PID: 1 Comm: init Not tainted 5.17.0-01402-g8565d64430f8 #1
> [    1.199165] Stack : 0000000000000042 0000000000000000 0000000000000008 dae882cc7dea7ec4
> [    1.199563]         a8000000014f0c00 0000000000000000 a80000000146b2c8 ffffffff80d3a920
> [    1.199750]         a80000000146b0e0 0000000000000001 0000000000000000 0000000000000000
> [    1.199936]         000000000003087f 0000000000000000 ffffffff806d9f54 0000000000000000
> [    1.200121]         a80000000146b16f ffffffff80da0000 0000000000000001 000000000119288a
> [    1.200306]         ffffffff80da0000 ffffffffffffffff 000000000119288a 000000000119288a
> [    1.200491]         a800000001416f00 0000000000000000 ffffffff80774d30 ffffffffa0042718
> [    1.200676]         ffffffff80ec2158 a800000001468000 a80000000146b2c0 0000000000000000
> [    1.200861]         ffffffff80b55730 0000000000000000 a80000000146b3f8 ffffffff80d3a920
> [    1.201046]         0000000000000001 000000000119288a ffffffff80108fa0 dae882cc7dea7ec4
> [    1.201236]         ...
> [    1.201548] Call Trace:
> [    1.201622] [<ffffffff80108fa0>] show_stack+0x38/0x118
> [    1.201960] [<ffffffff80b55730>] dump_stack_lvl+0x50/0x6c
> [    1.202105] [<ffffffff80b4d8a4>] kmalloc_fix_flags+0x60/0x88
> [    1.202249] [<ffffffff802b40f8>] new_slab+0x2d8/0x320
> [    1.202375] [<ffffffff802b6844>] ___slab_alloc.constprop.0+0x33c/0x5e8
> [    1.202528] [<ffffffff802b6b24>] __slab_alloc.constprop.0+0x34/0x50
> [    1.202675] [<ffffffff802b72b8>] kmem_cache_alloc+0x320/0x368
> [    1.202811] [<ffffffff805e2a68>] bvec_alloc+0x78/0x128
> [    1.202936] [<ffffffff805e2fac>] bio_alloc_bioset+0x194/0x340
> [    1.203073] [<ffffffff80325bd8>] do_mpage_readpage+0x540/0x6e0
> [    1.203213] [<ffffffff80325e38>] mpage_readahead+0xc0/0x198
> [    1.203346] [<ffffffff802583a8>] read_pages+0xc0/0x2e0
> [    1.203472] [<ffffffff802589a4>] page_cache_ra_unbounded+0x1cc/0x290
> [    1.203622] [<ffffffff8024e2fc>] filemap_fault+0x4f4/0x7e8
> [    1.203753] [<ffffffff80282b2c>] __do_fault+0x44/0x190
> [    1.203878] [<ffffffff80288e0c>] __handle_mm_fault+0x7e4/0xcd0
> [    1.204015] [<ffffffff80289408>] handle_mm_fault+0x110/0x258
> [    1.204149] [<ffffffff801220e0>] do_page_fault+0x110/0x4f0
> [    1.204278] [<ffffffff801288d8>] tlb_do_page_fault_1+0x108/0x110
> [    1.204421] [<ffffffff8035eddc>] padzero+0x64/0x98
> [    1.204538] [<ffffffff80360618>] load_elf_binary+0x1808/0x18d0
> [    1.204677] [<ffffffff802d9f40>] bprm_execve+0x240/0x5a8
> [    1.204806] [<ffffffff802db49c>] kernel_execve+0x144/0x200
> [    1.204937] [<ffffffff80b4a658>] try_to_run_init_process+0x18/0x58
> [    1.205085] [<ffffffff80b5ecc0>] kernel_init+0xb4/0x10c
> [    1.205220] [<ffffffff80102558>] ret_from_kernel_thread+0x14/0x1c
>
> with some qemu emulations. Bisect log is attached.
>
> I can not easily revert the patch since an attempt to do so causes
> conflicts, so I can not test upstream without this patch.
>
> Guenter

This looks because the mask of GFP_KERNEL is removed along with
the removal of mpage_alloc().

-static struct bio *
-mpage_alloc(struct block_device *bdev,
-               sector_t first_sector, int nr_vecs,
-               gfp_t gfp_flags)
-{
-       struct bio *bio;
-
-       /* Restrict the given (page cache) mask for slab allocations */
-       gfp_flags &= GFP_KERNEL;
-       bio = bio_alloc(gfp_flags, nr_vecs);

In read ahead mode, do_mpage_readpage() uses the gfp flag of page->mapping.

        if (args->is_readahead) {
                op |= REQ_RAHEAD;
                gfp = readahead_gfp_mask(page->mapping);
        } else {
                gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
        }

The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
inode_init_always().
So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
do_mpage_readpage() calls.


Ryusuke Konishi


>
> ---
> # bad: [8565d64430f8278bea38dab0a3ab60b4e11c71e4] Merge tag 'bounds-fixes-v5.18-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
> # good: [f443e374ae131c168a065ea1748feac6b2e76613] Linux 5.17
> git bisect start 'HEAD' 'v5.17'
> # good: [5628b8de1228436d47491c662dc521bc138a3d43] Merge tag 'random-5.18-rc1-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/crng/random
> git bisect good 5628b8de1228436d47491c662dc521bc138a3d43
> # bad: [69d1dea852b54eecd8ad2ec92a7fd371e9aec4bd] Merge tag 'for-5.18/drivers-2022-03-18' of git://git.kernel.dk/linux-block
> git bisect bad 69d1dea852b54eecd8ad2ec92a7fd371e9aec4bd
> # good: [b080cee72ef355669cbc52ff55dc513d37433600] Merge tag 'for-5.18/io_uring-statx-2022-03-18' of git://git.kernel.dk/linux-block
> git bisect good b080cee72ef355669cbc52ff55dc513d37433600
> # bad: [22027a9811349de28f81e13e20e83299099acd3a] nvmet: replace ida_simple[get|remove] with the simler ida_[alloc|free]
> git bisect bad 22027a9811349de28f81e13e20e83299099acd3a
> # bad: [672fdcf0e7de3b1e39416ac85abf178f023271f1] block: partition include/linux/blk-cgroup.h
> git bisect bad 672fdcf0e7de3b1e39416ac85abf178f023271f1
> # bad: [b42c1fc3d55e077d36718ad9800d89100b2aff81] block: fix the kerneldoc for bio_end_io_acct
> git bisect bad b42c1fc3d55e077d36718ad9800d89100b2aff81
> # bad: [4b1dc86d1857f1007865cab759f2285280692eee] drbd: bio_alloc can't fail if it is allow to sleep
> git bisect bad 4b1dc86d1857f1007865cab759f2285280692eee
> # bad: [f0d911927b3c7cf5f9edb5941d0287144a602d0d] nilfs2: remove nilfs_alloc_seg_bio
> git bisect bad f0d911927b3c7cf5f9edb5941d0287144a602d0d
> # good: [e7243285c0fc87054990fcde630583586ff8ed5f] block: move blk_drop_partitions to blk.h
> git bisect good e7243285c0fc87054990fcde630583586ff8ed5f
> # bad: [d5f68a42da7a4516e7503c281a54a58727f07dc3] fs: remove mpage_alloc
> git bisect bad d5f68a42da7a4516e7503c281a54a58727f07dc3
> # good: [322cbb50de711814c42fb088f6d31901502c711a] block: remove genhd.h
> git bisect good 322cbb50de711814c42fb088f6d31901502c711a
> # first bad commit: [d5f68a42da7a4516e7503c281a54a58727f07dc3] fs: remove mpage_alloc

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

