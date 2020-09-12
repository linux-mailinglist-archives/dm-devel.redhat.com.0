Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8F61D267ABC
	for <lists+dm-devel@lfdr.de>; Sat, 12 Sep 2020 15:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599919137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nX5hNxnkckU9GBcaJ8K2LHiiEk44QgvXyb7UuGmejtA=;
	b=OXufS4Or0MJrwqgbZuCiP0MJXayImMT3rzZePgIJLDHQJG5sh48Xy5uP0JA/U9dbjAG68P
	42icNqom2Hyk0LgQuIUYXE1GlAqSSv99RP6qQABfFScSb7xqlqKqJrcaZQKYFBmhdOXfC0
	H89QqvfT9thFpTW2VXHNeLYBPbMioAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-l9BDqZ84NXiYYMmqODVBOA-1; Sat, 12 Sep 2020 09:58:55 -0400
X-MC-Unique: l9BDqZ84NXiYYMmqODVBOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 986B6802B7C;
	Sat, 12 Sep 2020 13:58:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F62E9CBA;
	Sat, 12 Sep 2020 13:58:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD976A21EB;
	Sat, 12 Sep 2020 13:58:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08CDwbEO029811 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Sep 2020 09:58:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED25775135; Sat, 12 Sep 2020 13:58:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-84.pek2.redhat.com [10.72.12.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CEB75129;
	Sat, 12 Sep 2020 13:58:26 +0000 (UTC)
Date: Sat, 12 Sep 2020 21:58:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200912135822.GB210077@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-3-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200911215338.44805-3-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 2/3] block: use lcm_not_zero() when stacking
	chunk_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 11, 2020 at 05:53:37PM -0400, Mike Snitzer wrote:
> Like 'io_opt', blk_stack_limits() should stack 'chunk_sectors' using
> lcm_not_zero() rather than min_not_zero() -- otherwise the final
> 'chunk_sectors' could result in sub-optimal alignment of IO to
> component devices in the IO stack.
> 
> Also, if 'chunk_sectors' isn't a multiple of 'physical_block_size'
> then it is a bug in the driver and the device should be flagged as
> 'misaligned'.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  block/blk-settings.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 76a7e03bcd6c..b09642d5f15e 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -534,6 +534,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  
>  	t->io_min = max(t->io_min, b->io_min);
>  	t->io_opt = lcm_not_zero(t->io_opt, b->io_opt);
> +	t->chunk_sectors = lcm_not_zero(t->chunk_sectors, b->chunk_sectors);
>  
>  	/* Physical block size a multiple of the logical block size? */
>  	if (t->physical_block_size & (t->logical_block_size - 1)) {
> @@ -556,6 +557,13 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  		ret = -1;
>  	}
>  
> +	/* chunk_sectors a multiple of the physical block size? */
> +	if (t->chunk_sectors & (t->physical_block_size - 1)) {
> +		t->chunk_sectors = 0;
> +		t->misaligned = 1;
> +		ret = -1;
> +	}
> +
>  	t->raid_partial_stripes_expensive =
>  		max(t->raid_partial_stripes_expensive,
>  		    b->raid_partial_stripes_expensive);
> @@ -594,10 +602,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  			t->discard_granularity;
>  	}
>  
> -	if (b->chunk_sectors)
> -		t->chunk_sectors = min_not_zero(t->chunk_sectors,
> -						b->chunk_sectors);
> -
>  	t->zoned = max(t->zoned, b->zoned);
>  	return ret;
>  }

Looks fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

