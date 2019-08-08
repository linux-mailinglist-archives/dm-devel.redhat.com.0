Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66A867B1
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 19:08:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDD75C049E1A;
	Thu,  8 Aug 2019 17:08:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39E54608AB;
	Thu,  8 Aug 2019 17:08:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4119118005A4;
	Thu,  8 Aug 2019 17:07:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78H7Xra017059 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 13:07:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B55F360A35; Thu,  8 Aug 2019 17:07:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E49B3608A7;
	Thu,  8 Aug 2019 17:07:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x78H7OnY008926; Thu, 8 Aug 2019 13:07:24 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x78H7ODh008923; Thu, 8 Aug 2019 13:07:24 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 8 Aug 2019 13:07:24 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Junxiao Bi <junxiao.bi@oracle.com>
In-Reply-To: <a3105129-b49f-be70-aa56-f0d31e40dc2e@oracle.com>
Message-ID: <alpine.LRH.2.02.1908081253560.4997@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908080537540.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190808144056.GA13168@redhat.com>
	<alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com>
	<a3105129-b49f-be70-aa56-f0d31e40dc2e@oracle.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-13240435-1565283516=:4997"
Content-ID: <alpine.LRH.2.02.1908081258530.4997@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 17:08:07 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185206533-13240435-1565283516=:4997
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.02.1908081258531.4997@file01.intranet.prod.int.rdu2.redhat.com>



On Thu, 8 Aug 2019, Junxiao Bi wrote:

> 
> On 8/8/19 8:01 AM, Mikulas Patocka wrote:
> 
> Note that the patch bd293d071ffe doesn't really prevent the deadlock from
> occuring - if we look at the stacktrace reported by Junxiao Bi, we see
> that it hangs in bit_wait_io and not on the mutex - i.e. it has already
> successfully taken the mutex. Changing the mutex from mutex_lock to
> mutex_trylock won't help with deadlocks that happen afterwards.
> 
> PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
>    #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
>    #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
>    #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
>    #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
>    #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
>    #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
>    #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
>    #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
>    #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
>    #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
>   #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
>   #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
>   #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
>   #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
>   #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
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

I think that your patch fixes the stacktrace that you observed, but it 
doesn't fix the problem entirely.

Now, that Jens Axboe applied the loop driver patch, we don't need any 
patch to dm-bufio at all.

> The problem with the "dm_bufio_trylock" patch is - suppose that we are 
> called with GFP_KERNEL context - we succeed with dm_bufio_trylock and then 
> go to __make_buffer_clean->out_of_line_wait_on_bit->__wait_on_bit - if 
> this wait depends no some I/O completion on the loop device, we still get 
> a deadlock.
> 
> No, this is not right, see the source code in __try_evict_buffer(). It will never wait io in GFP_KERENL case.
> 
> 1546     if (!(gfp & __GFP_FS)) {
> 1547         if (test_bit(B_READING, &b->state) ||
> 1548             test_bit(B_WRITING, &b->state) ||
> 1549             test_bit(B_DIRTY, &b->state))
> 1550             return false;
> 1551     }

GFP_KERNEL includes the bit __GFP_FS. GFP_NOIO doesn't include __GFP_FS.

So, for GFP_NOIO, we exit if either B_READING, B_WRITING or B_DIRTY is 
set.

For GFP_KERNEL, we don't exit and continue with __make_buffer_clean (that 
writes the buffer if it's dirty and waits for I/O).

Mikulas

> Thanks,
> 
> Junxiao.
> 
> 
> The patch fixes some case of the deadlock, but it doesn't fix it entirely.
> 
> Mikulas
> 
> 
> 
--185206533-13240435-1565283516=:4997
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--185206533-13240435-1565283516=:4997--

