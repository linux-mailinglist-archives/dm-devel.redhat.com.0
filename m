Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD950B805
	for <lists+dm-devel@lfdr.de>; Fri, 22 Apr 2022 15:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650633236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H4ingJYNDwFhbOUuvqlFBaXLSk9TncB9blrHxsWHa4E=;
	b=BdloDVUrgxMzSUbfxmgdw+QTnhF8tyAKrJ6qPeQlwHjYErzapakHhs5yq6WBHGqXuoJNmd
	ltse+f2c6NU6kE9ywsRfFkntjH+K5COewHfYyYbsLh/V7J59m844WKbES6G+nkC3bWBw3Z
	fkUz6i/g7q9leluQZXotgAMxvSCF3Fs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-2fB6h2AENTe6KoLfwT755g-1; Fri, 22 Apr 2022 09:13:54 -0400
X-MC-Unique: 2fB6h2AENTe6KoLfwT755g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02419899ED0;
	Fri, 22 Apr 2022 13:13:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D081401E9A;
	Fri, 22 Apr 2022 13:13:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06D2F194035A;
	Fri, 22 Apr 2022 13:13:45 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 50FAA1940351
 for <dm-devel@listman.corp.redhat.com>; Fri, 22 Apr 2022 13:13:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3363CC27EBD; Fri, 22 Apr 2022 13:13:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EA45C28107
 for <dm-devel@redhat.com>; Fri, 22 Apr 2022 13:13:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152BF1C0514C
 for <dm-devel@redhat.com>; Fri, 22 Apr 2022 13:13:43 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-PBLt22XYOf25RolKEwt0Wg-1; Fri, 22 Apr 2022 09:13:42 -0400
X-MC-Unique: PBLt22XYOf25RolKEwt0Wg-1
Received: by mail-qv1-f70.google.com with SMTP id
 kd13-20020a056214400d00b0044c066d97dbso4773172qvb.22
 for <dm-devel@redhat.com>; Fri, 22 Apr 2022 06:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ymWTV/FdcyPsCH9VgDxmwbg3MDXoQ6i+EBWfdWIiiA=;
 b=lrYzBRx0CWIlMY8fMADcCK0wqIIJBOf/KEslznHaITClN6TaugIu0wjHUekJie87zf
 qjOWRybeLfsrI+CiUZDbl6NS34pWGEgHRhSEYcqeo0zGc0FEFCuHrgyWVopck8lpqTF2
 lR2SGZV4L+z40gW+nUirSgurOAF04nvnnqObEW72CAdtewDhltwtqpe08wxYMq+vVOZZ
 u6GjEg/nxozyaIpSUvMpbl3aLzfT5ldSHk5DpfS2YjQYurF0OkLgF72nao2t980m6Txs
 iHLOOt3srTW4YN+VfXRTDe+I0ByFwL68Q/NWeVASw6HJxji8+AO1cc11mmSp/WCheCNO
 Vtng==
X-Gm-Message-State: AOAM530XX2PFzA7JEgjgg5OKLAV2gQICTWX8ejueW0NI9DoYC6Tx48BT
 KJNYWcrDFyUa9B3FkaevKbECLcgPX7FfHMJDtWosXtijCbq66YKdGyIxEBWOw16w0PgwCMcivTB
 HGcnq5UkfCWEpVg==
X-Received: by 2002:a05:6214:2308:b0:432:e69f:5d71 with SMTP id
 gc8-20020a056214230800b00432e69f5d71mr3465872qvb.19.1650633220264; 
 Fri, 22 Apr 2022 06:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX5NST2c+uSzBIQrCznAb67jPQ9qOZ6HNq1mO4rPGExr9oQ9lIJIWMG4UE76CePYatWvQ5Lg==
X-Received: by 2002:a05:6214:2308:b0:432:e69f:5d71 with SMTP id
 gc8-20020a056214230800b00432e69f5d71mr3465834qvb.19.1650633219885; 
 Fri, 22 Apr 2022 06:13:39 -0700 (PDT)
Received: from localhost (200.sub-174-192-15.myvzw.com. [174.192.15.200])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm945063qkb.74.2022.04.22.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:13:39 -0700 (PDT)
Date: Fri, 22 Apr 2022 09:13:37 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <YmKqATrOXNpoBBQd@redhat.com>
References: <20220418022733.56168-1-snitzer@kernel.org>
 <20220418022733.56168-22-snitzer@kernel.org>
 <20220421040620.zbocicrqa76n4zqm@shindev>
MIME-Version: 1.0
In-Reply-To: <20220421040620.zbocicrqa76n4zqm@shindev>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [dm-5.19 PATCH 21/21] dm: improve abnormal bio
 processing
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, "ming.lei@redhat.com" <ming.lei@redhat.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "hch@lst.de" <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 21 2022 at 12:06P -0400,
Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com> wrote:

> On Apr 17, 2022 / 22:27, Mike Snitzer wrote:
> > Read/write/flush are the most common operations, optimize switch in
> > is_abnormal_io() for those cases. Follows same pattern established in
> > block perf-wip commit ("block: optimise blk_may_split for normal rw")
> > 
> > Also, push is_abnormal_io() check and blk_queue_split() down from
> > dm_submit_bio() to dm_split_and_process_bio() and set new
> > 'is_abnormal_io' flag in clone_info. Optimize __split_and_process_bio
> > and __process_abnormal_io by leveraging ci.is_abnormal_io flag.
> > 
> > Signed-off-by: Mike Snitzer <snitzer@kernel.org>
> > ---
> >  drivers/md/dm.c | 60 +++++++++++++++++++++++++++++----------------------------
> >  1 file changed, 31 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > index 3b87d151ef88..b9c30dfe0f2a 100644
> > --- a/drivers/md/dm.c
> > +++ b/drivers/md/dm.c
> > @@ -84,7 +84,8 @@ struct clone_info {
> >  	struct dm_io *io;
> >  	sector_t sector;
> 
> (snip)
> 
> >  	ci->sector = bio->bi_iter.bi_sector;
> >  	ci->sector_count = bio_sectors(bio);
> > @@ -1645,6 +1647,13 @@ static void dm_split_and_process_bio(struct mapped_device *md,
> >  		__send_empty_flush(&ci);
> >  		/* dm_io_complete submits any data associated with flush */
> >  		goto out;
> > +	} else if (unlikely(is_abnormal_io(bio))) {
> > +		/*
> > +		 * Use blk_queue_split() for abnormal IO (e.g. discard, etc)
> > +		 * otherwise associated queue_limits won't be imposed.
> > +		 */
> > +		blk_queue_split(&bio);
> > +		ci.is_abnormal_io = true;
> >  	}
> >  
> >  	error = __split_and_process_bio(&ci);
> 
> Hi Mike,
> 
> The hunk above triggered a WARNING [1] which is observed at mkfs.xfs for dm-
> zoned devices. With the hunk, the blk_queue_split(&bio) for abnormal I/O is
> called after init_clone_info(). I think it made the cloned bio different from
> the split bio. I suggest to move the "if (unlikely(is_abnormal_io(bio)))" block
> at the beginning of dm_split_and_process_bio(), so that blk_queue_split() is
> called before init_clone_info(). I created a patch for such change [2], and
> confirmed the WARNING goes away.
> 
> > @@ -1698,13 +1707,6 @@ static void dm_submit_bio(struct bio *bio)
> >  		goto out;
> >  	}
> >  
> > -	/*
> > -	 * Use blk_queue_split() for abnormal IO (e.g. discard, writesame, etc)
> > -	 * otherwise associated queue_limits won't be imposed.
> > -	 */
> > -	if (unlikely(is_abnormal_io(bio)))
> > -		blk_queue_split(&bio);
> > -
> >  	dm_split_and_process_bio(md, map, bio);
> >  out:
> >  	dm_put_live_table_bio(md, srcu_idx, bio);
> > -- 
> > 2.15.0
> > 
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://listman.redhat.com/mailman/listinfo/dm-devel
> > 
> 
> [1]
> 
> WARNING: CPU: 3 PID: 79434 at block/bio.c:1629 bio_trim+0x10a/0x150
> Modules linked in: dm_zoned null_blk f2fs crc32_generic dm_flakey iscsi_target_mod tcm_loop target_core_pscsi target_core_file target_core_iblock xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp bridge stp llc nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw rfkill iptable_security ip_set target_core_user nfnetlink target_core_mod ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter qrtr sunrpc intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel at24 iTCO_wdt intel_pmc_bxt iTCO_vendor_support btrfs kvm irqbypass rapl raid6_pq intel_cstate zstd_compress joydev
>  intel_uncore i2c_i801 pcspkr i2c_smbus intel_pch_thermal lpc_ich ses enclosure ie31200_edac video zram ip_tables crct10dif_pclmul crc32_pclmul crc32c_intel ast ghash_clmulni_intel drm_vram_helper drm_kms_helper drm_ttm_helper ttm igb drm mpt3sas e1000e dca i2c_algo_bit raid_class scsi_transport_sas fuse [last unloaded: zonefs]
> CPU: 3 PID: 79434 Comm: mkfs.xfs Kdump: loaded Not tainted 5.18.0-rc3+ #2
> Hardware name: Supermicro X10SLL-F/X10SLL-F, BIOS 3.0 04/24/2015
> RIP: 0010:bio_trim+0x10a/0x150
> Code: 8d 7c 24 68 48 89 fa 48 c1 ea 03 80 3c 02 00 75 58 49 83 7c 24 68 00 74 13 48 83 c4 10 4c 89 e7 5d 41 5c 41 5d e9 f6 aa 0f 00 <0f> 0b 48 83 c4 10 5d 41 5c 41 5d c3 4c 89 ef 48 89 54 24 08 48 89
> RSP: 0018:ffff8881977d7928 EFLAGS: 00010206
> RAX: 0000000008000000 RBX: ffff88852b000000 RCX: 0000000000040000
> RDX: 00000000003c0000 RSI: 0000000000040000 RDI: ffff8883215a3d00
> RBP: 0000000000400000 R08: 0000000000000001 R09: ffff8881124b9057
> R10: ffffed102249720a R11: 0000000000000001 R12: ffff8883215a3d00
> R13: ffff8883215a3d28 R14: ffff8881124b9098 R15: ffff8881124b9054
> FS:  00007ff3a993dbc0(0000) GS:ffff8886ecf80000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055a1bf241900 CR3: 0000000177074002 CR4: 00000000001706e0
> Call Trace:
>  <TASK>
>  dm_submit_bio+0x5fa/0x13b0
>  ? dm_dax_direct_access+0x1c0/0x1c0
>  ? lock_release+0x3a7/0x6c0
>  ? lock_downgrade+0x6a0/0x6a0
>  __submit_bio+0x1c2/0x2c0
>  ? __bio_queue_enter+0x570/0x570
>  submit_bio_noacct_nocheck+0x2f7/0x810
>  ? should_fail_request+0x70/0x70
>  ? rcu_read_lock_sched_held+0x3f/0x70
>  ? __lock_acquire+0x1591/0x5030
>  submit_bio+0x10a/0x270
>  ? submit_bio_noacct+0x15c0/0x15c0
>  submit_bio_wait+0xf2/0x1d0
>  ? submit_bio_wait_endio+0x40/0x40
>  ? lock_release+0x6c0/0x6c0
>  blkdev_issue_discard+0xb5/0x110
>  ? __blkdev_issue_discard+0x590/0x590
>  ? truncate_bdev_range+0x15d/0x240
>  blkdev_common_ioctl+0x853/0x1670
>  ? blkdev_bszset+0x160/0x160
>  ? __ia32_sys_readlinkat+0x87/0xf0
>  ? __ia32_compat_sys_newlstat+0x70/0x70
>  ? count_memcg_events.constprop.0+0x44/0x50
>  blkdev_ioctl+0x23b/0x690
>  ? blkdev_common_ioctl+0x1670/0x1670
>  ? security_file_ioctl+0x50/0x90
>  __x64_sys_ioctl+0x127/0x190
>  do_syscall_64+0x3b/0x90
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7ff3a970731b
> Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d dd 2a 0f 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffd79c8db68 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000e8000000 RCX: 00007ff3a970731b
> RDX: 00007ffd79c8db80 RSI: 0000000000001277 RDI: 0000000000000004
> RBP: 0000000000000004 R08: 0000000000000000 R09: 00007ffd79c8d997
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd79c8db80
> R13: 0000000000000001 R14: 0000000000000000 R15: 0000000080000000
>  </TASK>
> irq event stamp: 10213
> hardirqs last  enabled at (10223): [<ffffffffaa36e02e>] __up_console_sem+0x5e/0x70
> hardirqs last disabled at (10232): [<ffffffffaa36e013>] __up_console_sem+0x43/0x70
> softirqs last  enabled at (10190): [<ffffffffaa1faf06>] __irq_exit_rcu+0x1c6/0x260
> softirqs last disabled at (10185): [<ffffffffaa1faf06>] __irq_exit_rcu+0x1c6/0x260
> ---[ end trace 0000000000000000 ]---
> 
> [2]
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 7e3b5bdcf520..50382c98d7b3 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1639,6 +1639,15 @@ static void dm_split_and_process_bio(struct mapped_device *md,
>  	struct dm_io *io;
>  	blk_status_t error = BLK_STS_OK;
>  
> +	if (unlikely(is_abnormal_io(bio))) {
> +		/*
> +		 * Use blk_queue_split() for abnormal IO (e.g. discard, etc)
> +		 * otherwise associated queue_limits won't be imposed.
> +		 */
> +		blk_queue_split(&bio);
> +		ci.is_abnormal_io = true;
> +	}
> +
>  	init_clone_info(&ci, md, map, bio);
>  	io = ci.io;
>  
> @@ -1646,13 +1655,6 @@ static void dm_split_and_process_bio(struct mapped_device *md,
>  		__send_empty_flush(&ci);
>  		/* dm_io_complete submits any data associated with flush */
>  		goto out;
> -	} else if (unlikely(is_abnormal_io(bio))) {
> -		/*
> -		 * Use blk_queue_split() for abnormal IO (e.g. discard, etc)
> -		 * otherwise associated queue_limits won't be imposed.
> -		 */
> -		blk_queue_split(&bio);
> -		ci.is_abnormal_io = true;
>  	}
>  
>  	error = __split_and_process_bio(&ci);
> 
> -- 
> Best Regards,
> Shin'ichiro Kawasaki
> 

Thanks for your report, I'll sort it out but your patch doesn't seem right.

init_clone_info() will reset ci.is_abnormal_io so the bio won't be
processed properly.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

