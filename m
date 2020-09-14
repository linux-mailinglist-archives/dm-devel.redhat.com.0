Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DC1DB268EE6
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 17:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600095859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/RcXCzGlsrM/uLWmDUOV42XO6iiNMP2nwO2fsmLjEd8=;
	b=aU5s0lxGvkJXXedNPyHvR40K9qplB0Zp7tStZ2dGuzBqc7mX1/pqdazqgrNfVvjJ8tKf1t
	NLMLxvsuKFH3KcHzF9cvqvz7FjjDNmLGQNsOjpLtqpADp/la/Gd7ZDiEW4PpNdPM9e3Op0
	SJyEAHVm/f9eCNApeNbaGQ1z9SpArAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-HBMPX7ogOPy9U2p1JrqfRQ-1; Mon, 14 Sep 2020 11:04:17 -0400
X-MC-Unique: HBMPX7ogOPy9U2p1JrqfRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 268EE913130;
	Mon, 14 Sep 2020 15:04:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9AA67512C;
	Mon, 14 Sep 2020 15:04:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B9B51832FE1;
	Mon, 14 Sep 2020 15:04:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08EF3xYe029121 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 11:03:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D53E5D9DC; Mon, 14 Sep 2020 15:03:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7655DC06;
	Mon, 14 Sep 2020 15:03:53 +0000 (UTC)
Date: Mon, 14 Sep 2020 11:03:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200914150352.GC14410@redhat.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Sep 13 2020 at  8:46pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/09/12 6:53, Mike Snitzer wrote:
> > blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> > REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> > those operations.
> > 
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
> 
> Doesn't this break md devices ? (I think does use chunk_sectors for stride size,
> no ?)
> 
> As mentioned in my reply to Ming's email, this will allow these commands to
> potentially cross over zone boundaries on zoned block devices, which would be an
> immediate command failure.

Depending on the implementation it is beneficial to get a large
discard (one not constrained by chunk_sectors, e.g. dm-stripe.c's
optimization for handling large discards and issuing N discards, one per
stripe).  Same could apply for other commands.

Like all devices, zoned devices should impose command specific limits in
the queue_limits (and not lean on chunk_sectors to do a
one-size-fits-all).

But that aside, yes I agree I didn't pay close enough attention to the
implications of deferring the splitting of these commands until they
were issued to underlying storage.  This chunk_sectors early splitting
override is a bit of a mess... not quite following the logic given we
were supposed to be waiting to split bios as late as possible.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

