Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E22494A5364
	for <lists+dm-devel@lfdr.de>; Tue,  1 Feb 2022 00:39:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-1S1ajycbN7mvboCkAwXO2g-1; Mon, 31 Jan 2022 18:39:39 -0500
X-MC-Unique: 1S1ajycbN7mvboCkAwXO2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC8983DD21;
	Mon, 31 Jan 2022 23:39:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F57955F52;
	Mon, 31 Jan 2022 23:39:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1362D4BB7C;
	Mon, 31 Jan 2022 23:39:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VNd5a6017697 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 18:39:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A6DA62166B4E; Mon, 31 Jan 2022 23:39:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A20742166B40
	for <dm-devel@redhat.com>; Mon, 31 Jan 2022 23:39:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7795B3C0218E
	for <dm-devel@redhat.com>; Mon, 31 Jan 2022 23:39:02 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-180-AtK2be4iNyuy91GXreP2sw-2; Mon, 31 Jan 2022 18:39:00 -0500
X-MC-Unique: AtK2be4iNyuy91GXreP2sw-2
X-IronPort-AV: E=Sophos;i="5.88,332,1635177600"; d="scan'208";a="303728893"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2022 07:37:54 +0800
IronPort-SDR: QH8V/lYCBRYL0+I8zL8gVm5Np70QMbOC4X1Y6sKd4Wehaw2bZowcZVlR5A3xW610GtmH/nQweR
	NOCvpJ18sLl6Je9yLj8jttWv2H6MKR5xHaQiMOd57Qif+Mde/5bBGIXq8HxwHI/nV9+Brdaulw
	iLD5u1CC0Jn4RDciq90Ps6mIl0atmaLxmY4yqJWOI2pMFeK73qSkX/7xhVTcIiMFrIGQ/JPw6d
	L+T0E2Fgy7It3nwlLmC62pM/VTbE84XMLxmTKGfTBOLjsM77UqQ3z0xyzkgX4TTIkuFPMMDSGb
	R97TSphVPJV5+709rOirqc/R
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	31 Jan 2022 15:09:53 -0800
IronPort-SDR: CbZ+EjTyATZKmjCWKtL6DBg44nS+FaQEMyiqawOaCfDHCTuHh6mx0aTplcVVYcWHhqEo72gkhg
	EWhCRClTmAUWlf2h5kXG/m6SU06yTgewvpl0d6SjwWQGO7Sba1+NQc3KHIBBPH0pZTHlzqhbL9
	Xh/c3FTSVoL+ZnYxW0F9XF1RxZ5UiRG0tGAyDTQzm4UNYXLwPrmUEGokEuJ0Xqxcm22sVKRGkd
	fxEogAvioFDsT32uMgvfCaz3MeP7mrTF4WHjNV6Alw+VsqmHMBs6kOg29tuAMTvWry4POzObC2
	+pc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
	by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	31 Jan 2022 15:37:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JnkyB2jrdz1SHwl
	for <dm-devel@redhat.com>; Mon, 31 Jan 2022 15:37:54 -0800 (PST)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	(amavisd-new, port 10026)
	with ESMTP id tXlQ_1FyZBQq for <dm-devel@redhat.com>;
	Mon, 31 Jan 2022 15:37:53 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jnky91pfcz1RvlN;
	Mon, 31 Jan 2022 15:37:53 -0800 (PST)
Message-ID: <4872a450-de83-9751-e463-422ee0cc9f9a@opensource.wdc.com>
Date: Tue, 1 Feb 2022 08:37:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.5.1
To: Kirill Tkhai <ktkhai@virtuozzo.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <315cd58c-7605-ed88-23c4-a9509169231c@virtuozzo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <315cd58c-7605-ed88-23c4-a9509169231c@virtuozzo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm: Fix use-after-free in dm_cleanup_zoned_dev()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/02/01 1:21, Kirill Tkhai wrote:
> dm_cleanup_zoned_dev() uses queue, so it must be called before blk_cleanup_disk() starts its killing:
> 
> blk_cleanup_disk->blk_cleanup_queue()->kobject_put()->blk_release_queue()->...RCU...->blk_free_queue_rcu()->kmem_cache_free()
> 
> Otherwise, RCU callback may be executed first, and dm_cleanup_zoned_dev() touches freed memory:
> 
> [   85.074005] BUG: KASAN: use-after-free in dm_cleanup_zoned_dev+0x33/0xd0
> [   85.075448] Read of size 8 at addr ffff88805ac6e430 by task dmsetup/681
> 
> [   85.076102] CPU: 4 PID: 681 Comm: dmsetup Not tainted 5.17.0-rc2+ #6
> [   85.076570] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
> [   85.077150] Call Trace:
> [   85.077332]  <TASK>
> [   85.077478]  dump_stack_lvl+0x57/0x7d
> [   85.077763]  print_address_description.constprop.0+0x1f/0x150
> [   85.078229]  ? dm_cleanup_zoned_dev+0x33/0xd0
> [   85.078579]  kasan_report.cold+0x7f/0x11b
> [   85.078910]  ? dm_cleanup_zoned_dev+0x33/0xd0
> [   85.079219]  dm_cleanup_zoned_dev+0x33/0xd0
> [   85.079499]  __dm_destroy+0x26a/0x400
> [   85.079781]  ? dm_blk_ioctl+0x230/0x230
> [   85.080090]  ? up_write+0xd8/0x270
> [   85.080364]  dev_remove+0x156/0x1d0
> [   85.080639]  ctl_ioctl+0x269/0x530
> [   85.080910]  ? table_clear+0x140/0x140
> [   85.081209]  ? lock_release+0xb2/0x750
> [   85.081518]  ? remove_all+0x40/0x40
> [   85.081796]  ? rcu_read_lock_sched_held+0x12/0x70
> [   85.082166]  ? lock_downgrade+0x3c0/0x3c0
> [   85.082468]  ? rcu_read_lock_sched_held+0x12/0x70
> [   85.082833]  dm_ctl_ioctl+0xa/0x10
> [   85.083094]  __x64_sys_ioctl+0xb9/0xf0
> [   85.083350]  do_syscall_64+0x3b/0x90
> [   85.083595]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   85.083955] RIP: 0033:0x7fb6dfa95c27
> [   85.084277] Code: 00 00 00 48 8b 05 69 92 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 39 92 0c 00 f7 d8 64 89 01 48
> [   85.086009] RSP: 002b:00007fff882c6c28 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> [   85.086914] RAX: ffffffffffffffda RBX: 00007fb6dfb73a8e RCX: 00007fb6dfa95c27
> [   85.087607] RDX: 00007fb6e01d7ca0 RSI: 00000000c138fd04 RDI: 0000000000000003
> [   85.088272] RBP: 00007fff882c6ce0 R08: 00007fb6dfbc3558 R09: 00007fff882c6a90
> [   85.088956] R10: 00007fb6dfbc28a2 R11: 0000000000000206 R12: 00007fb6dfbc28a2
> [   85.089477] R13: 00007fb6dfbc28a2 R14: 00007fb6dfbc28a2 R15: 00007fb6dfbc28a2
> [   85.090038]  </TASK>
> 
> [   85.090348] Allocated by task 673:
> [   85.090625]  kasan_save_stack+0x1e/0x40
> [   85.090978]  __kasan_slab_alloc+0x66/0x80
> [   85.091336]  kmem_cache_alloc_node+0x1ca/0x460
> [   85.091742]  blk_alloc_queue+0x33/0x4e0
> [   85.092112]  __blk_alloc_disk+0x1b/0x60
> [   85.092464]  dm_create+0x368/0xa20
> [   85.092764]  dev_create+0xb9/0x170
> [   85.093118]  ctl_ioctl+0x269/0x530
> [   85.093521]  dm_ctl_ioctl+0xa/0x10
> [   85.093921]  __x64_sys_ioctl+0xb9/0xf0
> [   85.094177]  do_syscall_64+0x3b/0x90
> [   85.094420]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> [   85.094868] Freed by task 0:
> [   85.095062]  kasan_save_stack+0x1e/0x40
> [   85.095319]  kasan_set_track+0x21/0x30
> [   85.095569]  kasan_set_free_info+0x20/0x30
> [   85.095858]  __kasan_slab_free+0xfb/0x130
> [   85.096141]  slab_free_freelist_hook+0x7d/0x150
> [   85.096502]  kmem_cache_free+0x13c/0x340
> [   85.096778]  rcu_do_batch+0x2d9/0x820
> [   85.097049]  rcu_core+0x3b8/0x570
> [   85.097330]  __do_softirq+0x1c4/0x63d
> 
> [   85.097792] Last potentially related work creation:
> [   85.098226]  kasan_save_stack+0x1e/0x40
> [   85.098549]  __kasan_record_aux_stack+0x96/0xa0
> [   85.098951]  call_rcu+0xc4/0x8f0
> [   85.099220]  kobject_put+0xd9/0x270
> [   85.099557]  disk_release+0xee/0x120
> [   85.099864]  device_release+0x59/0xf0
> [   85.100208]  kobject_put+0xd9/0x270
> [   85.100509]  cleanup_mapped_device+0x12b/0x1b0
> [   85.100910]  __dm_destroy+0x26a/0x400
> [   85.101247]  dev_remove+0x156/0x1d0
> [   85.101555]  ctl_ioctl+0x269/0x530
> [   85.101859]  dm_ctl_ioctl+0xa/0x10
> [   85.102198]  __x64_sys_ioctl+0xb9/0xf0
> [   85.102527]  do_syscall_64+0x3b/0x90
> [   85.102811]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> [   85.103347] The buggy address belongs to the object at ffff88805ac6e180
> 	    which belongs to the cache request_queue of size 2992
> [   85.104338] The buggy address is located 688 bytes inside of
> 	    2992-byte region [ffff88805ac6e180, ffff88805ac6ed30)
> [   85.105255] The buggy address belongs to the page:
> [   85.105633] page:000000000837df3c refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x5ac68
> [   85.106363] head:000000000837df3c order:3 compound_mapcount:0 compound_pincount:0
> [   85.106948] flags: 0xfffffc0010200(slab|head|node=0|zone=1|lastcpupid=0x1fffff)
> [   85.107494] raw: 000fffffc0010200 0000000000000000 dead000000000122 ffff888001e58280
> [   85.108091] raw: 0000000000000000 00000000800a000a 00000001ffffffff 0000000000000000
> [   85.108695] page dumped because: kasan: bad access detected
> 
> [   85.109257] Memory state around the buggy address:
> [   85.109625]  ffff88805ac6e300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   85.110178]  ffff88805ac6e380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   85.110973] >ffff88805ac6e400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   85.111891]                                      ^
> [   85.112353]  ffff88805ac6e480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   85.113036]  ffff88805ac6e500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   85.113800] ==================================================================
> 
> Fixes: bb37d77239af "dm: introduce zone append emulation"
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index dcbd6d201619..d472fe5dbc1d 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1607,6 +1607,7 @@ static void cleanup_mapped_device(struct mapped_device *md)
>  		md->dax_dev = NULL;
>  	}
>  
> +	dm_cleanup_zoned_dev(md);
>  	if (md->disk) {
>  		spin_lock(&_minor_lock);
>  		md->disk->private_data = NULL;
> @@ -1627,7 +1628,6 @@ static void cleanup_mapped_device(struct mapped_device *md)
>  	mutex_destroy(&md->swap_bios_lock);
>  
>  	dm_mq_cleanup_mapped_device(md);
> -	dm_cleanup_zoned_dev(md);
>  }
>  
>  /*
> 

The commit message format is strange (long lines).
Apart from that, the fix looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

