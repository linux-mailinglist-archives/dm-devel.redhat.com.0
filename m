Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6B8026A056
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 10:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600156968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dZlONauYTj82qBBnAvEWPi3/w4+bEuapPnbxNFjlQyo=;
	b=A9jrwxIsQ9tp8Z7JSuxlIN4THWOxhKYSywrJC/EazKwZgMocSv7ZAQVY53Mj/SkBoxk4WR
	Td9L3/teSIQcYTID5gF1c/EdOi6tDFBS/6Ud4/vg4+0L1ZFsuQaLEWZSY7qtPDoO0p7exs
	VKAM1/qSJswaketZ4FmQGv7y3rSGuKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-8JuaRtp1MZyVfBU21Mmldg-1; Tue, 15 Sep 2020 04:02:45 -0400
X-MC-Unique: 8JuaRtp1MZyVfBU21Mmldg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90B9F64096;
	Tue, 15 Sep 2020 08:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E2EE27BC4;
	Tue, 15 Sep 2020 08:02:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1F3844A56;
	Tue, 15 Sep 2020 08:02:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F82EwJ021476 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 04:02:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8357B5DC1E; Tue, 15 Sep 2020 08:02:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-38.pek2.redhat.com [10.72.12.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF275DE1B;
	Tue, 15 Sep 2020 08:01:59 +0000 (UTC)
Date: Tue, 15 Sep 2020 16:01:54 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200915080154.GB761522@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200914150352.GC14410@redhat.com>
	<CY4PR04MB37510A739D28F993250E2B66E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
	<CY4PR04MB3751822DB93B9E155A0BE462E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751822DB93B9E155A0BE462E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 04:21:54AM +0000, Damien Le Moal wrote:
> On 2020/09/15 10:10, Damien Le Moal wrote:
> > On 2020/09/15 0:04, Mike Snitzer wrote:
> >> On Sun, Sep 13 2020 at  8:46pm -0400,
> >> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> >>
> >>> On 2020/09/12 6:53, Mike Snitzer wrote:
> >>>> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> >>>> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> >>>> those operations.
> >>>>
> >>>> Also, there is no need to avoid blk_max_size_offset() if
> >>>> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> >>>>
> >>>> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> >>>> ---
> >>>>  include/linux/blkdev.h | 19 +++++++++++++------
> >>>>  1 file changed, 13 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> >>>> index bb5636cc17b9..453a3d735d66 100644
> >>>> --- a/include/linux/blkdev.h
> >>>> +++ b/include/linux/blkdev.h
> >>>> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> >>>>  						  sector_t offset)
> >>>>  {
> >>>>  	struct request_queue *q = rq->q;
> >>>> +	int op;
> >>>> +	unsigned int max_sectors;
> >>>>  
> >>>>  	if (blk_rq_is_passthrough(rq))
> >>>>  		return q->limits.max_hw_sectors;
> >>>>  
> >>>> -	if (!q->limits.chunk_sectors ||
> >>>> -	    req_op(rq) == REQ_OP_DISCARD ||
> >>>> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> >>>> -		return blk_queue_get_max_sectors(q, req_op(rq));
> >>>> +	op = req_op(rq);
> >>>> +	max_sectors = blk_queue_get_max_sectors(q, op);
> >>>>  
> >>>> -	return min(blk_max_size_offset(q, offset),
> >>>> -			blk_queue_get_max_sectors(q, req_op(rq)));
> >>>> +	switch (op) {
> >>>> +	case REQ_OP_DISCARD:
> >>>> +	case REQ_OP_SECURE_ERASE:
> >>>> +	case REQ_OP_WRITE_SAME:
> >>>> +	case REQ_OP_WRITE_ZEROES:
> >>>> +		return max_sectors;
> >>>> +	}
> >>>
> >>> Doesn't this break md devices ? (I think does use chunk_sectors for stride size,
> >>> no ?)
> >>>
> >>> As mentioned in my reply to Ming's email, this will allow these commands to
> >>> potentially cross over zone boundaries on zoned block devices, which would be an
> >>> immediate command failure.
> >>
> >> Depending on the implementation it is beneficial to get a large
> >> discard (one not constrained by chunk_sectors, e.g. dm-stripe.c's
> >> optimization for handling large discards and issuing N discards, one per
> >> stripe).  Same could apply for other commands.
> >>
> >> Like all devices, zoned devices should impose command specific limits in
> >> the queue_limits (and not lean on chunk_sectors to do a
> >> one-size-fits-all).
> > 
> > Yes, understood. But I think that  in the case of md, chunk_sectors is used to
> > indicate the boundary between drives for a raid volume. So it does indeed make
> > sense to limit the IO size on submission since otherwise, the md driver itself
> > would have to split that bio again anyway.
> > 
> >> But that aside, yes I agree I didn't pay close enough attention to the
> >> implications of deferring the splitting of these commands until they
> >> were issued to underlying storage.  This chunk_sectors early splitting
> >> override is a bit of a mess... not quite following the logic given we
> >> were supposed to be waiting to split bios as late as possible.
> > 
> > My view is that the multipage bvec (BIOs almost as large as we want) and late
> > splitting is beneficial to get larger effective BIO sent to the device as having
> > more pages on hand allows bigger segments in the bio instead of always having at
> > most PAGE_SIZE per segment. The effect of this is very visible with blktrace. A
> > lot of requests end up being much larger than the device max_segments * page_size.
> > 
> > However, if there is already a known limit on the BIO size when the BIO is being
> > built, it does not make much sense to try to grow a bio beyond that limit since
> > it will have to be split by the driver anyway. chunk_sectors is one such limit
> > used for md (I think) to indicate boundaries between drives of a raid volume.
> > And we reuse it (abuse it ?) for zoned block devices to ensure that any command
> > does not cross over zone boundaries since that triggers errors for writes within
> > sequential zones or read/write crossing over zones of different types
> > (conventional->sequential zone boundary).
> > 
> > I may not have the entire picture correctly here, but so far, this is my
> > understanding.
> 
> And I was wrong :) In light of Ming's comment + a little code refresher reading,
> indeed, chunk_sectors will split BIOs so that *requests* do not exceed that
> limit, but the initial BIO submission may be much larger regardless of
> chunk_sectors.
> 
> Ming, I think the point here is that building a large BIO first and splitting it
> later (as opposed to limiting the bio size by stopping bio_add_page()) is more
> efficient as there is only one bio submit instead of many, right ?

Yeah, this way allows generic_make_request(submit_bio_noacct) to handle arbitrarily
sized bios, so bio_add_page() becomes more efficiently and simplified a lot, and
stacking driver is simplified too, such as the original q->merge_bvec_fn() is killed.

On the other hand, the cost of bio splitting is added.

Especially for stacking driver, there may be two times of bio splitting,
one is in stacking driver, another is in underlying device driver.

Fortunately underlying queue's limits are propagated to stacking queue, so in theory
the bio splitting in stacking driver's ->submit_bio is enough most of times.



Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

