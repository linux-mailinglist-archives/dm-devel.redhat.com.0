Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EF772268E46
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 16:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600095016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l3wYwcDIKefVYuqByu3+rLF/jPM++7w03bYE2WY6Ihk=;
	b=dqwyeQQYg3gOTHOb+pn0QUOCGTRJ0CXqry1oKlT08V+z2s8J1I7UPGNXmBiyKhVCgNEXDb
	21ZK/RvKNMX7Z9UFAbgqQhb7WUpmZTxybW608cnfGthTS76s6yXaZ/ApHrmM9E+Nmq89Dp
	IMjgtfm+nkQFuheJzP2UJPVo8ujZ9fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476--yhms8dvNmKGeXO2HXz1iw-1; Mon, 14 Sep 2020 10:50:13 -0400
X-MC-Unique: -yhms8dvNmKGeXO2HXz1iw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47A3F913150;
	Mon, 14 Sep 2020 14:50:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 704AC5DAA6;
	Mon, 14 Sep 2020 14:49:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C77D91832FE1;
	Mon, 14 Sep 2020 14:49:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08EEncLR027959 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 10:49:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55FE081C48; Mon, 14 Sep 2020 14:49:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D037481C4D;
	Mon, 14 Sep 2020 14:49:29 +0000 (UTC)
Date: Mon, 14 Sep 2020 10:49:28 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200914144928.GA14410@redhat.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
MIME-Version: 1.0
In-Reply-To: <20200912135252.GA210077@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Sat, Sep 12 2020 at  9:52am -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
> > blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> > REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> > those operations.
> 
> Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
> chunk_sectors is set:
> 
>         return min(blk_max_size_offset(q, offset),
>                         blk_queue_get_max_sectors(q, req_op(rq)));

Yes, but blk_rq_get_max_sectors() is a bit of a mess structurally.  he
duality of imposing chunk_sectors and/or considering offset when
calculating the return is very confused.

> > Also, there is no need to avoid blk_max_size_offset() if
> > 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> > 
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > ---
> >  include/linux/blkdev.h | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index bb5636cc17b9..453a3d735d66 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> >  						  sector_t offset)
> >  {
> >  	struct request_queue *q = rq->q;
> > +	int op;
> > +	unsigned int max_sectors;
> >  
> >  	if (blk_rq_is_passthrough(rq))
> >  		return q->limits.max_hw_sectors;
> >  
> > -	if (!q->limits.chunk_sectors ||
> > -	    req_op(rq) == REQ_OP_DISCARD ||
> > -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> > -		return blk_queue_get_max_sectors(q, req_op(rq));
> > +	op = req_op(rq);
> > +	max_sectors = blk_queue_get_max_sectors(q, op);
> >  
> > -	return min(blk_max_size_offset(q, offset),
> > -			blk_queue_get_max_sectors(q, req_op(rq)));
> > +	switch (op) {
> > +	case REQ_OP_DISCARD:
> > +	case REQ_OP_SECURE_ERASE:
> > +	case REQ_OP_WRITE_SAME:
> > +	case REQ_OP_WRITE_ZEROES:
> > +		return max_sectors;
> > +	}
> > +
> > +	return min(blk_max_size_offset(q, offset), max_sectors);
> >  }
> 
> It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
> needs to be considered.

Yes, I see that now.  But why don't they need to be considered for
REQ_OP_DISCARD and REQ_OP_SECURE_ERASE?  Is it because the intent of the
block core is to offer late splitting of bios?  If so, then why impose
chunk_sectors so early?

Obviously this patch 1/3 should be dropped.  I didn't treat
chunk_sectors with proper priority.

But like I said above, blk_rq_get_max_sectors() vs blk_max_size_offset()
is not at all straight-forward.  And the code looks prone to imposing
limits that shouldn't be (or vice-versa).

Also, when falling back to max_sectors, why not consider offset to treat
max_sectors like a granularity?  Would allow for much more consistent IO
patterns.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

