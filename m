Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118A86509
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 17:02:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D9407BDB1;
	Thu,  8 Aug 2019 15:02:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7DF61000343;
	Thu,  8 Aug 2019 15:02:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3788383541;
	Thu,  8 Aug 2019 15:02:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78F26Rm024727 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 11:02:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5ED2D60BE1; Thu,  8 Aug 2019 15:02:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E9B060C63;
	Thu,  8 Aug 2019 15:01:58 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x78F1wGt016567; Thu, 8 Aug 2019 11:01:58 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x78F1wWB016563; Thu, 8 Aug 2019 11:01:58 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 8 Aug 2019 11:01:58 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190808144056.GA13168@redhat.com>
Message-ID: <alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908080537540.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190808144056.GA13168@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>, junxiao.bi@oracle.com
Subject: Re: [dm-devel] Revert "dm bufio: fix deadlock with loop device"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 15:02:36 +0000 (UTC)



On Thu, 8 Aug 2019, Mike Snitzer wrote:

> On Thu, Aug 08 2019 at  5:40am -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Revert the patch bd293d071ffe65e645b4d8104f9d8fe15ea13862. A proper fix
> > should be not to use GFP_KERNEL in the function do_blockdev_direct_IO.
> 
> Matthew Wilcox pointed out that the "proper fix" is loop should be using
> memalloc_noio_{save,restore}

He's right, I will post another patch that sets memalloc_noio_save in 
loop.

> > Note that the patch bd293d071ffe doesn't really prevent the deadlock from
> > occuring - if we look at the stacktrace reported by Junxiao Bi, we see
> > that it hangs in bit_wait_io and not on the mutex - i.e. it has already
> > successfully taken the mutex. Changing the mutex from mutex_lock to
> > mutex_trylock won't help with deadlocks that happen afterwards.
> > 
> > PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
> >    #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
> >    #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
> >    #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
> >    #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
> >    #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
> >    #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
> >    #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
> >    #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
> >    #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
> >    #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
> >   #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
> >   #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
> >   #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
> >   #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
> >   #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
> 
> The above stack trace doesn't tell the entire story though.  Yes, one
> process will have already gotten the the lock and is left waiting on
> IO.  But that IO isn't able to complete because it is blocked on mm's
> reclaim also trying to evict via same shrinker... so another thread will
> be blocked waiting on the mutex (e.g. PID 14127 in your recent patch
> header).
> 
> Please re-read the header for commit bd293d071ffe -- I think that fix is
> good.  But, I could still be wrong... ;)

The problem with the "dm_bufio_trylock" patch is - suppose that we are 
called with GFP_KERNEL context - we succeed with dm_bufio_trylock and then 
go to __make_buffer_clean->out_of_line_wait_on_bit->__wait_on_bit - if 
this wait depends no some I/O completion on the loop device, we still get 
a deadlock.

The patch fixes some case of the deadlock, but it doesn't fix it entirely.

Mikulas

> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org
> > Fixes: bd293d071ffe ("dm bufio: fix deadlock with loop device")
> > 
> > ---
> >  drivers/md/dm-bufio.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > Index: linux-2.6/drivers/md/dm-bufio.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-bufio.c	2019-08-02 08:52:35.000000000 +0200
> > +++ linux-2.6/drivers/md/dm-bufio.c	2019-08-08 11:19:13.000000000 +0200
> > @@ -1604,7 +1604,9 @@ dm_bufio_shrink_scan(struct shrinker *sh
> >  	unsigned long freed;
> >  
> >  	c = container_of(shrink, struct dm_bufio_client, shrinker);
> > -	if (!dm_bufio_trylock(c))
> > +	if (sc->gfp_mask & __GFP_FS)
> > +		dm_bufio_lock(c);
> > +	else if (!dm_bufio_trylock(c))
> >  		return SHRINK_STOP;
> >  
> >  	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
> 
> I don't see the performance win of micro-optimizing to not use
> dm_bufio_trylock() worth it.  BUT on the flip side, dm_bufio_lock()
> _was_ the canary in the coal mine here: meaning it caught that loop
> isn't properly using memalloc_noio_{save,restore}...
> 
> I'm just not liking the prospect of bufio being the smoking gun for
> future deadlocks.  But I could go either way with this...
> 
> But if we do revert, this patch header needs to:
> 
> Depends-on: XXXXXXXXX ("loop: use memalloc_noio_{save,restore}")
> 
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
