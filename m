Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05664BA4
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 19:48:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A0DC30BD1A7;
	Wed, 10 Jul 2019 17:48:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 633A760143;
	Wed, 10 Jul 2019 17:48:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53BFE18521DB;
	Wed, 10 Jul 2019 17:48:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AHm5GR007891 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 13:48:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0164D5C25A; Wed, 10 Jul 2019 17:48:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7045C5C220;
	Wed, 10 Jul 2019 17:48:02 +0000 (UTC)
Date: Wed, 10 Jul 2019 13:48:01 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <20190710174801.GA20281@redhat.com>
References: <20190710001719.2504-1-junxiao.bi@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710001719.2504-1-junxiao.bi@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2] dm-bufio: fix deadlock with loop device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 10 Jul 2019 17:48:17 +0000 (UTC)

On Tue, Jul 09 2019 at  8:17pm -0400,
Junxiao Bi <junxiao.bi@oracle.com> wrote:

> When thin-volume was built on loop device, if available memory is low,
> the following deadlock can be triggered.
> 
> One process P1 was allocating memory with GFP_FS flag, direct alloc fail,
> memory reclaim invoked memory shrinker in dm_bufio, dm_bufio_shrink_scan()
> run, mutex dm_bufio_client->lock was acquired, then P1 wait for dm_buffer
> io done in __try_evict_buffer->()__try_evict_buffer().
> 
> But this io may never done as it was issued to the underlying loop device
> who forward it using fs direct-io, there some memory allocation were using
> GFP_FS(like do_blockdev_direct_IO()), if direct alloc fail, memory reclaim
> will invoke memory shrinker in dm_bufio, where dm_bufio_shrink_scan()
> will be invoked, since the mutex was already hold by P1, the loop thread
> will hung, io will never done. ABBA deadlock.
> 
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
> ---
> Changes in v2:
>   - refine the commit log
> 
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

This needs more careful review and understanding.

I'll commit to getting that done (hopefully with Mikulas' assistance)
during the 5.3-rcX cycle.  But I'm not ready to stage this change yet.

Revisiting dm-bufio on loop is needed.  Commit 9d28eb12447ee ("dm bufio:
change __GFP_IO to __GFP_FS in shrinker callbacks") was meant to address
deadlocks reported whern running on loop.  And __try_evict_buffer() has
a check for GFP_NOFS ("!(gfp & __GFP_FS"); but that is only relevant to
__scan() callers and dm_bufio_shrink_scan() is looking to take the lock
before __scan() is called.  So it does seem like we have issues in the
bufio code in general.  Needs a proper audit though.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
