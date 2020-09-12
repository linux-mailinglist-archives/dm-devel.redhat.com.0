Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77CFF267AB8
	for <lists+dm-devel@lfdr.de>; Sat, 12 Sep 2020 15:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599918837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GDzsmHvwIASe6BMuiqlAgoQTA0m2+yDXtfWOid7Lq/g=;
	b=jPcszE1Udtrdz38bafMpI4O91H+SIaHTG9u80r5/LvS6AvpaXmx6cu6CGx34jCl/tJbt3R
	b3jEp3F241LYp5nlG87YNtoO4HaZGjAQmrLLiIC8uH3Eq5CerNoQz6N4fqErnJKuXiMoh+
	jBqmZTkpAN2RbiSHKJR5ncjONorU5ZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-3Ai9PgWmN4efmhoRUDxHNg-1; Sat, 12 Sep 2020 09:53:54 -0400
X-MC-Unique: 3Ai9PgWmN4efmhoRUDxHNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2E818B9F84;
	Sat, 12 Sep 2020 13:53:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DF95D9CD;
	Sat, 12 Sep 2020 13:53:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55CFA922E8;
	Sat, 12 Sep 2020 13:53:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08CDr8C3029297 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Sep 2020 09:53:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20C8860C11; Sat, 12 Sep 2020 13:53:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-84.pek2.redhat.com [10.72.12.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E60C360BF1;
	Sat, 12 Sep 2020 13:52:56 +0000 (UTC)
Date: Sat, 12 Sep 2020 21:52:52 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200912135252.GA210077@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200911215338.44805-2-snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: fix blk_rq_get_max_sectors() to
 flow more carefully
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> those operations.

Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
chunk_sectors is set:

        return min(blk_max_size_offset(q, offset),
                        blk_queue_get_max_sectors(q, req_op(rq)));
 
> Also, there is no need to avoid blk_max_size_offset() if
> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  include/linux/blkdev.h | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index bb5636cc17b9..453a3d735d66 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>  						  sector_t offset)
>  {
>  	struct request_queue *q = rq->q;
> +	int op;
> +	unsigned int max_sectors;
>  
>  	if (blk_rq_is_passthrough(rq))
>  		return q->limits.max_hw_sectors;
>  
> -	if (!q->limits.chunk_sectors ||
> -	    req_op(rq) == REQ_OP_DISCARD ||
> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> -		return blk_queue_get_max_sectors(q, req_op(rq));
> +	op = req_op(rq);
> +	max_sectors = blk_queue_get_max_sectors(q, op);
>  
> -	return min(blk_max_size_offset(q, offset),
> -			blk_queue_get_max_sectors(q, req_op(rq)));
> +	switch (op) {
> +	case REQ_OP_DISCARD:
> +	case REQ_OP_SECURE_ERASE:
> +	case REQ_OP_WRITE_SAME:
> +	case REQ_OP_WRITE_ZEROES:
> +		return max_sectors;
> +	}
> +
> +	return min(blk_max_size_offset(q, offset), max_sectors);
>  }

It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
needs to be considered.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

