Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C46220CB3A
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 02:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593391007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mE1pa+NkSLnG3YbgW5dq9sFV5r78YzWiSjx5oQHnodo=;
	b=XWjXsmk9xssvZtBvm2Y0qqAI0DEgW/pUgZndgWtTeD9btIH9FI6CS8Xhfi8QZbaG8GCstq
	MmXozUDHYQRq2p0tb+ZnbPUgXQokdBJAOX+rq4GsfV0UhRbergTGboHhPj0k/T30Uk1Xz0
	wrZXVpPdcuoWJfgNUsdNEYA4A0Wn0x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-evNL0WXMNlySrflf4G0bwA-1; Sun, 28 Jun 2020 20:36:44 -0400
X-MC-Unique: evNL0WXMNlySrflf4G0bwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D96608015CB;
	Mon, 29 Jun 2020 00:36:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB95719C58;
	Mon, 29 Jun 2020 00:36:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 606FB1809547;
	Mon, 29 Jun 2020 00:36:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T0a25X016676 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jun 2020 20:36:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9624E10C39FF; Mon, 29 Jun 2020 00:36:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9174310D16AE
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 00:36:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C151859163
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 00:36:00 +0000 (UTC)
Received: from mail106.syd.optusnet.com.au (mail106.syd.optusnet.com.au
	[211.29.132.42]) by relay.mimecast.com with ESMTP id
	us-mta-281-jdBfYtKGMJOqU5WVV4cD7g-1; Sun, 28 Jun 2020 20:35:56 -0400
X-MC-Unique: jdBfYtKGMJOqU5WVV4cD7g-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail106.syd.optusnet.com.au (Postfix) with ESMTPS id ED4835AD65B;
	Mon, 29 Jun 2020 10:35:52 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1jphm2-0001Ps-9X; Mon, 29 Jun 2020 10:35:50 +1000
Date: Mon, 29 Jun 2020 10:35:50 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200629003550.GJ2005@dread.disaster.area>
References: <20200625113122.7540-1-willy@infradead.org>
	<alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626230847.GI2005@dread.disaster.area>
	<alpine.LRH.2.02.2006270848540.14350@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006270848540.14350@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
	a=7-415B0cAAAA:8 a=xnkzwwwhM5RMNMzHtikA:9 a=kZMiiJAICkdOfVTb:21
	a=i3m0Sh721-YErq2I:21 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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
Content-Disposition: inline

On Sat, Jun 27, 2020 at 09:09:09AM -0400, Mikulas Patocka wrote:
> 
> 
> On Sat, 27 Jun 2020, Dave Chinner wrote:
> 
> > On Fri, Jun 26, 2020 at 11:02:19AM -0400, Mikulas Patocka wrote:
> > > Hi
> > > 
> > > I suggest to join memalloc_noio and memalloc_nofs into just one flag that 
> > > prevents both filesystem recursion and i/o recursion.
> > > 
> > > Note that any I/O can recurse into a filesystem via the loop device, thus 
> > > it doesn't make much sense to have a context where PF_MEMALLOC_NOFS is set 
> > > and PF_MEMALLOC_NOIO is not set.
> > 
> > Correct me if I'm wrong, but I think that will prevent swapping from
> > GFP_NOFS memory reclaim contexts.
> 
> Yes.
> 
> > IOWs, this will substantially
> > change the behaviour of the memory reclaim system under sustained
> > GFP_NOFS memory pressure. Sustained GFP_NOFS memory pressure is
> > quite common, so I really don't think we want to telling memory
> > reclaim "you can't do IO at all" when all we are trying to do is
> > prevent recursion back into the same filesystem.
> 
> So, we can define __GFP_ONLY_SWAP_IO and __GFP_IO.

Uh, why?

Exactly what problem are you trying to solve here?

> > Given that the loop device IO path already operates under
> > memalloc_noio context, (i.e. the recursion restriction is applied in
> > only the context that needs is) I see no reason for making that a
> > global reclaim limitation....
> 
> I think this is a problem.
> 
> Suppose that a filesystem does GFP_NOFS allocation, the allocation 
> triggers an IO and waits for it to finish, the loop device driver 
> redirects the IO to the same filesystem that did the GFP_NOFS allocation.

The loop device IO path is under memalloc_noio. By -definition-,
allocations in that context cannot recurse back into filesystem
level reclaim.

So either your aren't explaining the problem you are trying to solve
clearly, or you're talking about allocations in the IO path that are
broken because they don't use GFP_NOIO correctly...

> I saw this deadlock in the past in the dm-bufio subsystem - see the commit 
> 9d28eb12447ee08bb5d1e8bb3195cf20e1ecd1c0 that fixed it.

2014?

/me looks closer.

Hmmm. Only sent to dm-devel, no comments, no review, just merged.
No surprise that nobody else actually knows about this commit. Well,
time to review it ~6 years after it was merged....

| dm-bufio tested for __GFP_IO. However, dm-bufio can run on a loop block
| device that makes calls into the filesystem. If __GFP_IO is present and
| __GFP_FS isn't, dm-bufio could still block on filesystem operations if it
| runs on a loop block device.

OK, so from an architectural POV, this commit is fundamentally
broken - block/device layer allocation should not allow relcaim
recursion into filesystems because filesystems are dependent on
the block layer making forwards progress. This commit is trying to
work around the loop device doing GFP_KERNEL/GFP_NOFS context
allocation back end IO path of the loop device. This part of the
loop device is a block device, so needs to run under GFP_NOIO
context.

IOWs, this commit just papered over the reclaim context layering
violation in the loop device by trying to avoid blocking filesystem
IO in the dm-bufio shrinker context just in case it was IO from a
loop device that was incorrectly tagged as GFP_KERNEL.

So, step forward 5 years to 2019, and this change was made:

commit d0a255e795ab976481565f6ac178314b34fbf891
Author: Mikulas Patocka <mpatocka@redhat.com>
Date:   Thu Aug 8 11:17:01 2019 -0400

    loop: set PF_MEMALLOC_NOIO for the worker thread
    
    A deadlock with this stacktrace was observed.
    
    The loop thread does a GFP_KERNEL allocation, it calls into dm-bufio
    shrinker and the shrinker depends on I/O completion in the dm-bufio
    subsystem.
    
    In order to fix the deadlock (and other similar ones), we set the flag
    PF_MEMALLOC_NOIO at loop thread entry.
    
    PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
       #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
       #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
       #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
       #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
       #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
       #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
       #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
       #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
       #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
       #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
      #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
      #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
      #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
      #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
      #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
    
      PID: 14127  TASK: ffff881455749c00  CPU: 11  COMMAND: "loop1"
       #0 [ffff88272f5af228] __schedule at ffffffff8173f405
       #1 [ffff88272f5af280] schedule at ffffffff8173fa27
       #2 [ffff88272f5af2a0] schedule_preempt_disabled at ffffffff8173fd5e
       #3 [ffff88272f5af2b0] __mutex_lock_slowpath at ffffffff81741fb5
       #4 [ffff88272f5af330] mutex_lock at ffffffff81742133
       #5 [ffff88272f5af350] dm_bufio_shrink_count at ffffffffa03865f9 [dm_bufio]
       #6 [ffff88272f5af380] shrink_slab at ffffffff811a86bd
       #7 [ffff88272f5af470] shrink_zone at ffffffff811ad778
       #8 [ffff88272f5af500] do_try_to_free_pages at ffffffff811adb34
       #9 [ffff88272f5af590] try_to_free_pages at ffffffff811adef8
      #10 [ffff88272f5af610] __alloc_pages_nodemask at ffffffff811a09c3
      #11 [ffff88272f5af710] alloc_pages_current at ffffffff811e8b71
      #12 [ffff88272f5af760] new_slab at ffffffff811f4523
      #13 [ffff88272f5af7b0] __slab_alloc at ffffffff8173a1b5
      #14 [ffff88272f5af880] kmem_cache_alloc at ffffffff811f484b
      #15 [ffff88272f5af8d0] do_blockdev_direct_IO at ffffffff812535b3
      #16 [ffff88272f5afb00] __blockdev_direct_IO at ffffffff81255dc3
      #17 [ffff88272f5afb30] xfs_vm_direct_IO at ffffffffa01fe3fc [xfs]
      #18 [ffff88272f5afb90] generic_file_read_iter at ffffffff81198994
      #19 [ffff88272f5afc50] __dta_xfs_file_read_iter_2398 at ffffffffa020c970 [xfs]
      #20 [ffff88272f5afcc0] lo_rw_aio at ffffffffa0377042 [loop]
      #21 [ffff88272f5afd70] loop_queue_work at ffffffffa0377c3b [loop]
      #22 [ffff88272f5afe60] kthread_worker_fn at ffffffff810a8a0c
      #23 [ffff88272f5afec0] kthread at ffffffff810a8428
      #24 [ffff88272f5aff50] ret_from_fork at ffffffff81745242
    
    Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

That's the *same bug* as the 2014 commit was trying to address.  But
because the 2014 commit didn't actually address the underlying
architectural layering issue in the loop device, the problem was
still there.

The 2019 commit corrected the allocation context of the loop device
to unconditionally use GFP_NOIO, and so prevents recursion back into
both the filesystem and the block/device layers from the loop device
IO path. Hence reclaim contexts are layered correctly again, and the
deadlock in the dm-bufio code goes away.

And that means you probably should revert the 2014 commit because
it's a nasty layering violation that never should have been made....

> Other subsystems that do IO in GFP_NOFS context may deadlock just like 
> bufio.

Then they are as buggy as the dm-bufio code. Shrinkers needing to be
aware of reclaim contexts above the layer the shrinker belongs to is
a Big Red Flag that indicates something is violating reclaim
recursion rules. i.e. that an allocation is simply not using
GFP_NOFS/GFP_NOIO correctly. That's not a bug in the shrinker,
that's a bug in the code that is doing the memory allocation.

I still don't see a need for more reclaim recursion layers here...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

