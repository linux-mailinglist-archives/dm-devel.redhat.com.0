Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92B78716
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jul 2019 10:13:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08287C057E9F;
	Mon, 29 Jul 2019 08:13:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD2419C77;
	Mon, 29 Jul 2019 08:13:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1046D1800207;
	Mon, 29 Jul 2019 08:13:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6T2fjd1023785 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jul 2019 22:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00D965C21A; Mon, 29 Jul 2019 02:41:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDE55C219
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 02:41:42 +0000 (UTC)
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
	[202.108.3.166]) by mx1.redhat.com (Postfix) with SMTP id 4CF5287638
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 02:41:39 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.77.31])
	by sina.com with ESMTP
	id 5D3E5CDF000021EF; Mon, 29 Jul 2019 10:41:37 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 73902045089784
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+03e5c8ebd22cc6c3a8cb@syzkaller.appspotmail.com>
Date: Mon, 29 Jul 2019 10:41:28 +0800
Message-Id: <000000000000aec4ec058ec71a3d@google.com>
In-Reply-To: <000000000000c75fb7058ba0c0e4@google.com>
References: 
MIME-Version: 1.0
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/000000000000aec4ec058ec71a3d@google.com/>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Mon, 29 Jul 2019 02:41:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Mon, 29 Jul 2019 02:41:41 +0000 (UTC) for IP:'202.108.3.166'
	DOMAIN:'mail3-166.sinamail.sina.com.cn'
	HELO:'mail3-166.sinamail.sina.com.cn' FROM:'hdanton@sina.com'
	RCPT:''
X-RedHat-Spam-Score: 1.475 * (FREEMAIL_FROM, MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE, SORTED_RECIPS, SPF_HELO_NONE,
	SPF_PASS) 202.108.3.166 mail3-166.sinamail.sina.com.cn 202.108.3.166
	mail3-166.sinamail.sina.com.cn <hdanton@sina.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jul 2019 04:12:24 -0400
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, hdanton@sina.com,
	snitzer@redhat.com, netdev@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	kaber@trash.net, linux-block@vger.kernel.org,
	dm-devel@redhat.com, coreteam@netfilter.org,
	netfilter-devel@vger.kernel.org, pablo@netfilter.org,
	kadlec@blackhole.kfki.hu, shli@kernel.org, davem@davemloft.net,
	agk@redhat.com
Subject: Re: [dm-devel] memory leak in bio_copy_user_iov
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 29 Jul 2019 08:13:48 +0000 (UTC)


Sun, 28 Jul 2019 17:38:00 -0700
> 
> syzbot has bisected this bug to:
> 
> commit 664820265d70a759dceca87b6eb200cd2b93cda8
> Author: Mike Snitzer <snitzer@redhat.com>
> Date:   Thu Feb 18 20:44:39 2016 +0000
> 
>      dm: do not return target from dm_get_live_table_for_ioctl()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13f4eb64600000
> start commit:   0011572c Merge branch 'for-5.2-fixes' of git://git.kernel...
> git tree:       upstream
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=100ceb64600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=17f4eb64600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cb38d33cd06d8d48
> dashboard link: https://syzkaller.appspot.com/bug?extid=03e5c8ebd22cc6c3a8cb
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13244221a00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117b2432a00000
> 
> Reported-by: syzbot+03e5c8ebd22cc6c3a8cb@syzkaller.appspotmail.com
> Fixes: 664820265d70 ("dm: do not return target from  
> dm_get_live_table_for_ioctl()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> 
> BUG: memory leak
> unreferenced object 0xffff8881204d7800 (size 2048):
>    comm "syz-executor855", pid 6936, jiffies 4294941958 (age 26.780s)
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      20 00 00 00 02 01 00 00 00 00 00 00 08 00 00 00   ...............
>    backtrace:
>      [<00000000c5e27070>] kmemleak_alloc_recursive  include/linux/kmemleak.h:43 [inline]
>      [<00000000c5e27070>] slab_post_alloc_hook mm/slab.h:439 [inline]
>      [<00000000c5e27070>] slab_alloc mm/slab.c:3326 [inline]
>      [<00000000c5e27070>] __do_kmalloc mm/slab.c:3658 [inline]
>      [<00000000c5e27070>] __kmalloc+0x161/0x2c0 mm/slab.c:3669
>      [<000000004415e750>] kmalloc include/linux/slab.h:552 [inline]
>      [<000000004415e750>] bio_alloc_bioset+0x1b8/0x2c0 block/bio.c:439
>      [<000000002da58d1d>] bio_kmalloc include/linux/bio.h:391 [inline]
>      [<000000002da58d1d>] bio_copy_user_iov+0x113/0x4a0 block/bio.c:1275
>      [<00000000b4b23d95>] __blk_rq_map_user_iov block/blk-map.c:67 [inline]
>      [<00000000b4b23d95>] blk_rq_map_user_iov+0xc6/0x2b0 block/blk-map.c:136
>      [<00000000edad5f7e>] blk_rq_map_user+0x71/0xb0 block/blk-map.c:166
>      [<00000000c94723b5>] sg_start_req drivers/scsi/sg.c:1813 [inline]
>      [<00000000c94723b5>] sg_common_write.isra.0+0x619/0xa10  drivers/scsi/sg.c:809
>      [<00000000b11f3605>] sg_write.part.0+0x325/0x570 drivers/scsi/sg.c:709
>      [<00000000aba41953>] sg_write+0x44/0x64 drivers/scsi/sg.c:617
>      [<00000000afecd177>] __vfs_write+0x43/0xa0 fs/read_write.c:494
>      [<00000000de690898>] vfs_write fs/read_write.c:558 [inline]
>      [<00000000de690898>] vfs_write+0xee/0x210 fs/read_write.c:542
>      [<00000000705a35b0>] ksys_write+0x7c/0x130 fs/read_write.c:611
>      [<000000009efb9e6c>] __do_sys_write fs/read_write.c:623 [inline]
>      [<000000009efb9e6c>] __se_sys_write fs/read_write.c:620 [inline]
>      [<000000009efb9e6c>] __x64_sys_write+0x1e/0x30 fs/read_write.c:620
>      [<00000000f9e48771>] do_syscall_64+0x76/0x1a0  arch/x86/entry/common.c:301
>      [<00000000d5cff9fc>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -151,7 +151,7 @@ int blk_rq_map_user_iov(struct request_q
 	return 0;
 
 unmap_rq:
-	__blk_rq_unmap_user(bio);
+	blk_rq_unmap_user(bio);
 fail:
 	rq->bio = NULL;
 	return ret;
--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
