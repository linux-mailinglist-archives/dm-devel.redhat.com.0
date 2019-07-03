Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452F5E8B0
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jul 2019 18:24:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92271308222F;
	Wed,  3 Jul 2019 16:23:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78CC46090E;
	Wed,  3 Jul 2019 16:22:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 571B6206D2;
	Wed,  3 Jul 2019 16:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x63GL9rD017964 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jul 2019 12:21:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C46C15C5BB; Wed,  3 Jul 2019 16:21:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52BF35C29A;
	Wed,  3 Jul 2019 16:21:07 +0000 (UTC)
Date: Wed, 3 Jul 2019 12:21:06 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <20190703162106.GA13984@redhat.com>
References: <20190702231456.19121-1-junxiao.bi@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702231456.19121-1-junxiao.bi@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm bufio: fix deadlock issue with loop device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 03 Jul 2019 16:24:12 +0000 (UTC)

On Tue, Jul 02 2019 at  7:14pm -0400,
Junxiao Bi <junxiao.bi@oracle.com> wrote:

> The following deadlock was caputred on 4.1, since dm_bufio_shrink_count
> still had bufio lock acquired, this was already fixed by mainline. But
> shrinker will also invoke dm_bufio_shrink_scan by ->scan_objects, so
> looks like mainline will suffer the same deadlock issue.
> 
> This deadlock happened when both kswapd0 and loop1 were shrinking memory,
> kswapd0 hold bufio lock and waiting for an in-flight io done, but it will
> never done because loop1 who was issuing the io was hung by the same lock
> hold by kswapd0. This was ABBA deadlock.
> 
> The gfp_flags used in direct IO is GFP_KERNEL, so checking GFP_FS/IO won't
> work, just stop shrinking if lock was hold by others.
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
>   PID: 14127  TASK: ffff881455749c00  CPU: 11  COMMAND: "loop1"
>    #0 [ffff88272f5af228] __schedule at ffffffff8173f405
>    #1 [ffff88272f5af280] schedule at ffffffff8173fa27
>    #2 [ffff88272f5af2a0] schedule_preempt_disabled at ffffffff8173fd5e
>    #3 [ffff88272f5af2b0] __mutex_lock_slowpath at ffffffff81741fb5
>    #4 [ffff88272f5af330] mutex_lock at ffffffff81742133
>    #5 [ffff88272f5af350] dm_bufio_shrink_count at ffffffffa03865f9 [dm_bufio]
>    #6 [ffff88272f5af380] shrink_slab at ffffffff811a86bd
>    #7 [ffff88272f5af470] shrink_zone at ffffffff811ad778
>    #8 [ffff88272f5af500] do_try_to_free_pages at ffffffff811adb34
>    #9 [ffff88272f5af590] try_to_free_pages at ffffffff811adef8
>   #10 [ffff88272f5af610] __alloc_pages_nodemask at ffffffff811a09c3
>   #11 [ffff88272f5af710] alloc_pages_current at ffffffff811e8b71
>   #12 [ffff88272f5af760] new_slab at ffffffff811f4523
>   #13 [ffff88272f5af7b0] __slab_alloc at ffffffff8173a1b5
>   #14 [ffff88272f5af880] kmem_cache_alloc at ffffffff811f484b
>   #15 [ffff88272f5af8d0] do_blockdev_direct_IO at ffffffff812535b3
>   #16 [ffff88272f5afb00] __blockdev_direct_IO at ffffffff81255dc3
>   #17 [ffff88272f5afb30] xfs_vm_direct_IO at ffffffffa01fe3fc [xfs]
>   #18 [ffff88272f5afb90] generic_file_read_iter at ffffffff81198994
>   #19 [ffff88272f5afc50] __dta_xfs_file_read_iter_2398 at ffffffffa020c970 [xfs]
>   #20 [ffff88272f5afcc0] lo_rw_aio at ffffffffa0377042 [loop]
>   #21 [ffff88272f5afd70] loop_queue_work at ffffffffa0377c3b [loop]
>   #22 [ffff88272f5afe60] kthread_worker_fn at ffffffff810a8a0c
>   #23 [ffff88272f5afec0] kthread at ffffffff810a8428
>   #24 [ffff88272f5aff50] ret_from_fork at ffffffff81745242
> 
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
> ---
>  drivers/md/dm-bufio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index 2a48ea3f1b30..b6b5acc92ca2 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -1599,9 +1599,7 @@ dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  	unsigned long freed;
>  
>  	c = container_of(shrink, struct dm_bufio_client, shrinker);
> -	if (sc->gfp_mask & __GFP_FS)
> -		dm_bufio_lock(c);
> -	else if (!dm_bufio_trylock(c))
> +	if (!dm_bufio_trylock(c))
>  		return SHRINK_STOP;
>  
>  	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
> -- 
> 2.17.1
> 

I don't follow how this fixes the direct IO to DM device ontop of loop
case given that you're saying __GFP_FS will not have been set by the
direct IO path.  In that case it should resort to the trylock anyway,
no?

We need a reproducer in the context of the latest upstream kernel code,
not some 4.1 branch point for an Oracle kernel.

Please submit with a less conflated patch header that has a description
of the bufio issue that the upstream kernel has.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
