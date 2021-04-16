Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97CB9361732
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 03:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618536549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u43DqkNchS13wQGpQEl2iaBMuXLCWXcrl+YAjMDhUkk=;
	b=hbCXwtCLF7KtOgIh2Tzd4NDtBKyWOwmxIo4jU6PMgQY/XFG/tkHOiZS1OTFlIMt0t1H/8q
	cJKJko3gY6DGZXyIek+BymLBJp0vEHDhd6wtLXGutn/tL6c4m/b0CODaeq3rgtN7inBeZs
	j/rcvav4KAEyP2EmcxJn4SN/fKjAv2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-_fFXARoPNTOo9ySjBJ9XKA-1; Thu, 15 Apr 2021 21:29:07 -0400
X-MC-Unique: _fFXARoPNTOo9ySjBJ9XKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D811883521;
	Fri, 16 Apr 2021 01:29:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F7B1A26A;
	Fri, 16 Apr 2021 01:28:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FE7C44A5B;
	Fri, 16 Apr 2021 01:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13G1Senp022046 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 21:28:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4412118B42; Fri, 16 Apr 2021 01:28:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-36.pek2.redhat.com [10.72.12.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E718D59457;
	Fri, 16 Apr 2021 01:28:26 +0000 (UTC)
Date: Fri, 16 Apr 2021 09:28:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YHjoNg/Z7KQ+4+YX@T590>
References: <20210415103310.1513841-1-ming.lei@redhat.com>
	<20210415103310.1513841-3-ming.lei@redhat.com>
	<af8f41f4-74e8-450d-fa63-6feb6b745222@acm.org>
MIME-Version: 1.0
In-Reply-To: <af8f41f4-74e8-450d-fa63-6feb6b745222@acm.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH 2/2] block: support to freeze bio based
 request queue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 15, 2021 at 01:16:42PM -0700, Bart Van Assche wrote:
> On 4/15/21 3:33 AM, Ming Lei wrote:
> > 1) grab two queue usage refcount for blk-mq before submitting blk-mq
> > bio, one is for bio, anther is for request;
>                        ^^^^^^
>                        another?
> 
> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index 09f774e7413d..f71e4b433030 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -431,12 +431,13 @@ EXPORT_SYMBOL(blk_cleanup_queue);
> >  int blk_queue_enter(struct request_queue *q, blk_mq_req_flags_t flags)
> >  {
> >  	const bool pm = flags & BLK_MQ_REQ_PM;
> > +	const unsigned int nr = (flags & BLK_MQ_REQ_DOUBLE_REF) ? 2 : 1;
> 
> Please leave out the parentheses from around the condition in the above
> and in other ternary expressions. The ternary operator has a very low
> precedence so adding parentheses around the condition in a ternary
> operator is almost never necessary.
> 
> > @@ -480,8 +481,18 @@ static inline int bio_queue_enter(struct bio *bio)
> >  	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
> >  	bool nowait = bio->bi_opf & REQ_NOWAIT;
> >  	int ret;
> > +	blk_mq_req_flags_t flags = nowait ? BLK_MQ_REQ_NOWAIT : 0;
> > +	bool reffed = bio_flagged(bio, BIO_QUEUE_REFFED);
> >  
> > -	ret = blk_queue_enter(q, nowait ? BLK_MQ_REQ_NOWAIT : 0);
> > +	if (!reffed)
> > +		bio_set_flag(bio, BIO_QUEUE_REFFED);
> > +
> > +	/*
> > +	 * Grab two queue references for blk-mq, one is for bio, and
> > +	 * another is for blk-mq request.
> > +	 */
> > +	ret = blk_queue_enter(q, q->mq_ops && !reffed ?
> > +			(flags | BLK_MQ_REQ_DOUBLE_REF) : flags);
> 
> Consider rewriting the above code as follows to make it easier to read:
> 
> 	if (q->mq_ops && !reffed)
> 		flags |= BLK_MQ_REQ_DOUBLE_REF;
> 	ret = blk_queue_enter(q, flags);
> 
> Please also expand the comment above this code. The comment only
> explains the reffed == false case but not the reffed == true case. I
> assume that the reffed == true case applies to stacked bio-based drivers?

'reffed == true' means we have got one queue usage count already for
this bio, so only need to grab one usage count for blk-mq request.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

