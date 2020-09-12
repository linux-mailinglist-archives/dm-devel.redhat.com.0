Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5ED7267ABF
	for <lists+dm-devel@lfdr.de>; Sat, 12 Sep 2020 16:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599919629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TH396gHtalxJ3ttS3+Xyy25OzeivgryUjAT9PTGt8C0=;
	b=iWuASyYE7bARyJaDTGzLywzvLP+hPnXvbxqf7SuFnfylVGZMayFQOU1fhVPywcyKLzdh4b
	3/tFBWvIZL3YJeRQQEqJFuMAlUn+IVUBFNzAhc0ywRua6FxQPOdpE+ijlKFOMxF56HVl5M
	WrPui4WfBbfRBa1mBmb9H4SCc6HIu5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-wmlXqvXMPOeBW4piwhkkWw-1; Sat, 12 Sep 2020 10:07:07 -0400
X-MC-Unique: wmlXqvXMPOeBW4piwhkkWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3377781F007;
	Sat, 12 Sep 2020 14:07:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5025810013D9;
	Sat, 12 Sep 2020 14:06:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EB84181A71E;
	Sat, 12 Sep 2020 14:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08CE6lfq030577 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Sep 2020 10:06:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C68775129; Sat, 12 Sep 2020 14:06:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-84.pek2.redhat.com [10.72.12.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C30175141;
	Sat, 12 Sep 2020 14:06:35 +0000 (UTC)
Date: Sat, 12 Sep 2020 22:06:30 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200912140630.GC210077@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-4-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200911215338.44805-4-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 3/3] block: allow 'chunk_sectors' to be
	non-power-of-2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 11, 2020 at 05:53:38PM -0400, Mike Snitzer wrote:
> It is possible for a block device to use a non power-of-2 for chunk
> size which results in a full-stripe size that is also a non
> power-of-2.
> 
> Update blk_queue_chunk_sectors() and blk_max_size_offset() to
> accommodate drivers that need a non power-of-2 chunk_sectors.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  block/blk-settings.c   | 10 ++++------
>  include/linux/blkdev.h | 12 +++++++++---
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index b09642d5f15e..e40a162cc946 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -172,15 +172,13 @@ EXPORT_SYMBOL(blk_queue_max_hw_sectors);
>   *
>   * Description:
>   *    If a driver doesn't want IOs to cross a given chunk size, it can set
> - *    this limit and prevent merging across chunks. Note that the chunk size
> - *    must currently be a power-of-2 in sectors. Also note that the block
> - *    layer must accept a page worth of data at any offset. So if the
> - *    crossing of chunks is a hard limitation in the driver, it must still be
> - *    prepared to split single page bios.
> + *    this limit and prevent merging across chunks. Note that the block layer
> + *    must accept a page worth of data at any offset. So if the crossing of
> + *    chunks is a hard limitation in the driver, it must still be prepared
> + *    to split single page bios.
>   **/
>  void blk_queue_chunk_sectors(struct request_queue *q, unsigned int chunk_sectors)
>  {
> -	BUG_ON(!is_power_of_2(chunk_sectors));
>  	q->limits.chunk_sectors = chunk_sectors;
>  }
>  EXPORT_SYMBOL(blk_queue_chunk_sectors);
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 453a3d735d66..e72bcce22143 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1059,11 +1059,17 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>  static inline unsigned int blk_max_size_offset(struct request_queue *q,
>  					       sector_t offset)
>  {
> -	if (!q->limits.chunk_sectors)
> +	unsigned int chunk_sectors = q->limits.chunk_sectors;
> +
> +	if (!chunk_sectors)
>  		return q->limits.max_sectors;
>  
> -	return min(q->limits.max_sectors, (unsigned int)(q->limits.chunk_sectors -
> -			(offset & (q->limits.chunk_sectors - 1))));
> +	if (is_power_of_2(chunk_sectors))
> +		chunk_sectors -= (offset & (chunk_sectors - 1));
> +	else
> +		chunk_sectors -= sector_div(offset, chunk_sectors);
> +
> +	return min(q->limits.max_sectors, chunk_sectors);
>  }
>  
>  static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> -- 
> 2.15.0
> 

is_power_of_2() is cheap enough for fast path, so looks fine to support
non-power-of-2 chunk sectors.

Maybe NVMe PCI can remove the power_of_2() limit too.

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

