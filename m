Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2AAFDCC
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 15:36:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 373A23174673;
	Wed, 11 Sep 2019 13:36:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5990B60852;
	Wed, 11 Sep 2019 13:36:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14240E203;
	Wed, 11 Sep 2019 13:35:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BDZTrS003913 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 09:35:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEDBE5C22C; Wed, 11 Sep 2019 13:35:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D66025C22F;
	Wed, 11 Sep 2019 13:35:24 +0000 (UTC)
Date: Wed, 11 Sep 2019 09:35:23 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20190911133523.GA32121@redhat.com>
References: <20190911113133.837-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911113133.837-1-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, stable@vger.kernel.org
Subject: Re: [dm-devel] [PATCH V2] dm-raid: fix updating of
	max_discard_sectors limit
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 11 Sep 2019 13:36:12 +0000 (UTC)

On Wed, Sep 11 2019 at  7:31am -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> Unit of 'chunk_size' is byte, instead of sector, so fix it.
> 
> Without this fix, too big max_discard_sectors is applied on the request queue
> of dm-raid, finally raid code has to split the bio again.
> 
> This re-split done by raid causes the following nested clone_endio:
> 
> 1) one big bio 'A' is submitted to dm queue, and served as the original
> bio
> 
> 2) one new bio 'B' is cloned from the original bio 'A', and .map()
> is run on this bio of 'B', and B's original bio points to 'A'
> 
> 3) raid code sees that 'B' is too big, and split 'B' and re-submit
> the remainded part of 'B' to dm-raid queue via generic_make_request().
> 
> 4) now dm will hanlde 'B' as new original bio, then allocate a new
> clone bio of 'C' and run .map() on 'C'. Meantime C's original bio
> points to 'B'.
> 
> 5) suppose now 'C' is completed by raid direclty, then the following
> clone_endio() is called recursively:
> 
> 	clone_endio(C)
> 		->clone_endio(B)		#B is original bio of 'C'
> 			->bio_endio(A)
> 
> 'A' can be big enough to make handreds of nested clone_endio(), then
> stack can be corrupted easily.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
> V2:
> 	- fix commit log a bit
> 
>  drivers/md/dm-raid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 8a60a4a070ac..c26aa4e8207a 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -3749,7 +3749,7 @@ static void raid_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  	 */
>  	if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
>  		limits->discard_granularity = chunk_size;
> -		limits->max_discard_sectors = chunk_size;
> +		limits->max_discard_sectors = chunk_size >> 9;
>  	}
>  }
>  
> -- 
> 2.20.1
> 

Thanks a lot Ming!  But oof, really embarassing oversight on my part!

FYI, I added a "Fixes:" tag to the commit header and switched to
shifting by SECTOR_SHIFT instead of 9, staged commit for 5.4 is here:

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=509818079bf1fefff4ed02d6a1b994e20efc0480

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
