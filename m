Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8142269B9A
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 03:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600134659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZDv2NWV7BsDqtGtfFbTnCzB3qTGCIJUuLBA0ExGiJ8o=;
	b=Mq5b3byajxS9XlzGL3VZues7oYs4/KIrJfFZThgDfU3RlbK9s/IZdzzRxj/QBMh1jL7op2
	uIuh3nfXvxTevsoPoGbJHpJiHm+6vjtZ+OAtKS33lyLYwjuBfE3x6G5rDsvXbCMURUzgTC
	xGmNNOKz55xo/uQMK5RJWwh2Pb/9MKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-nFs5wUYROyOiRkBbDqufnA-1; Mon, 14 Sep 2020 21:50:57 -0400
X-MC-Unique: nFs5wUYROyOiRkBbDqufnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE8C7801AAC;
	Tue, 15 Sep 2020 01:50:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 961197B7AC;
	Tue, 15 Sep 2020 01:50:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98C3F1832FF6;
	Tue, 15 Sep 2020 01:50:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F1oUPh012951 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 21:50:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A78AE5F9DF; Tue, 15 Sep 2020 01:50:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-38.pek2.redhat.com [10.72.12.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6612E5C3E0;
	Tue, 15 Sep 2020 01:50:17 +0000 (UTC)
Date: Tue, 15 Sep 2020 09:50:13 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200915015013.GA738570@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590> <20200914144928.GA14410@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200914144928.GA14410@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 14, 2020 at 10:49:28AM -0400, Mike Snitzer wrote:
> On Sat, Sep 12 2020 at  9:52am -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
> > > blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> > > REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> > > those operations.
> > 
> > Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
> > chunk_sectors is set:
> > 
> >         return min(blk_max_size_offset(q, offset),
> >                         blk_queue_get_max_sectors(q, req_op(rq)));
> 
> Yes, but blk_rq_get_max_sectors() is a bit of a mess structurally.  he
> duality of imposing chunk_sectors and/or considering offset when
> calculating the return is very confused.
> 
> > > Also, there is no need to avoid blk_max_size_offset() if
> > > 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> > > 
> > > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > > ---
> > >  include/linux/blkdev.h | 19 +++++++++++++------
> > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > > index bb5636cc17b9..453a3d735d66 100644
> > > --- a/include/linux/blkdev.h
> > > +++ b/include/linux/blkdev.h
> > > @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> > >  						  sector_t offset)
> > >  {
> > >  	struct request_queue *q = rq->q;
> > > +	int op;
> > > +	unsigned int max_sectors;
> > >  
> > >  	if (blk_rq_is_passthrough(rq))
> > >  		return q->limits.max_hw_sectors;
> > >  
> > > -	if (!q->limits.chunk_sectors ||
> > > -	    req_op(rq) == REQ_OP_DISCARD ||
> > > -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> > > -		return blk_queue_get_max_sectors(q, req_op(rq));
> > > +	op = req_op(rq);
> > > +	max_sectors = blk_queue_get_max_sectors(q, op);
> > >  
> > > -	return min(blk_max_size_offset(q, offset),
> > > -			blk_queue_get_max_sectors(q, req_op(rq)));
> > > +	switch (op) {
> > > +	case REQ_OP_DISCARD:
> > > +	case REQ_OP_SECURE_ERASE:
> > > +	case REQ_OP_WRITE_SAME:
> > > +	case REQ_OP_WRITE_ZEROES:
> > > +		return max_sectors;
> > > +	}
> > > +
> > > +	return min(blk_max_size_offset(q, offset), max_sectors);
> > >  }
> > 
> > It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
> > needs to be considered.
> 
> Yes, I see that now.  But why don't they need to be considered for
> REQ_OP_DISCARD and REQ_OP_SECURE_ERASE?

This behavior is introduced int the following commit, and I guess it is
because we support multi-range discard request, maybe Jens can explain more.

commit e548ca4ee4595f65b262661d166310ad8a149bec
Author: Jens Axboe <axboe@fb.com>
Date:   Fri May 29 13:11:32 2015 -0600

    block: don't honor chunk sizes for data-less IO

    We don't need to honor chunk sizes for IO that doesn't carry any
    data.

    Signed-off-by: Jens Axboe <axboe@fb.com>

> Is it because the intent of the
> block core is to offer late splitting of bios?

block layer doesn't have late bio splitting, and bio is only splitted
via __blk_queue_split() before allocating request.

blk_rq_get_max_sectors() is only called by rq merge code, actually it
should have been defined in block/blk.h instead of public header.

> If so, then why impose
> chunk_sectors so early?

Not sure I understand your question. 'chunk_sectors' is firstly used
during bio split(get_max_io_size() from blk_bio_segment_split()), 

> 
> Obviously this patch 1/3 should be dropped.  I didn't treat
> chunk_sectors with proper priority.
> 
> But like I said above, blk_rq_get_max_sectors() vs blk_max_size_offset()
> is not at all straight-forward.  And the code looks prone to imposing
> limits that shouldn't be (or vice-versa).
> 
> Also, when falling back to max_sectors, why not consider offset to treat
> max_sectors like a granularity?  Would allow for much more consistent IO
> patterns.

blk_rq_get_max_sectors() is called when one bio or rq can be merged to
current request, and we have already considered all kinds of queue limits
when doing bio splitting, so not necessary to consider it again here during
merging rq.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

