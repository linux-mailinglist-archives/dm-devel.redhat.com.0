Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 739C2269BBC
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 04:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600135464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CdJFX9RWlYjjmJDWoPSsHbvsLyrXBq2avWOsfC1v94M=;
	b=hHNemCcsE74PBRk0/SPeY84xOgrMnHzwEHWxQHS7TtXcsUM6IEDjosBagoC3pNqP1fduqQ
	0tj9cDXlLkbRARP0RjqkgN86hHMAaPi9xQ+OeH/25YThWKX1I8MjjJKsat4g3STpXDW4Xm
	N/MxlNX7yODj+yw0MA/EuoFqLAtdiaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-woA5oyXZMJqAm5sNh0ydfA-1; Mon, 14 Sep 2020 22:04:20 -0400
X-MC-Unique: woA5oyXZMJqAm5sNh0ydfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B351882FA8;
	Tue, 15 Sep 2020 02:04:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A697527BD8;
	Tue, 15 Sep 2020 02:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C2CC1832FFB;
	Tue, 15 Sep 2020 02:04:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F23xJx014656 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 22:03:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E84887EEB4; Tue, 15 Sep 2020 02:03:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-38.pek2.redhat.com [10.72.12.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CA27EEA7;
	Tue, 15 Sep 2020 02:03:48 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:03:44 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200915020344.GB738570@T590>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
	<CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Mon, Sep 14, 2020 at 12:43:06AM +0000, Damien Le Moal wrote:
> On 2020/09/12 22:53, Ming Lei wrote:
> > On Fri, Sep 11, 2020 at 05:53:36PM -0400, Mike Snitzer wrote:
> >> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> >> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> >> those operations.
> > 
> > Actually WRITE_SAME & WRITE_ZEROS are handled by the following if
> > chunk_sectors is set:
> > 
> >         return min(blk_max_size_offset(q, offset),
> >                         blk_queue_get_max_sectors(q, req_op(rq)));
> >  
> >> Also, there is no need to avoid blk_max_size_offset() if
> >> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> >>
> >> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> >> ---
> >>  include/linux/blkdev.h | 19 +++++++++++++------
> >>  1 file changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> >> index bb5636cc17b9..453a3d735d66 100644
> >> --- a/include/linux/blkdev.h
> >> +++ b/include/linux/blkdev.h
> >> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> >>  						  sector_t offset)
> >>  {
> >>  	struct request_queue *q = rq->q;
> >> +	int op;
> >> +	unsigned int max_sectors;
> >>  
> >>  	if (blk_rq_is_passthrough(rq))
> >>  		return q->limits.max_hw_sectors;
> >>  
> >> -	if (!q->limits.chunk_sectors ||
> >> -	    req_op(rq) == REQ_OP_DISCARD ||
> >> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> >> -		return blk_queue_get_max_sectors(q, req_op(rq));
> >> +	op = req_op(rq);
> >> +	max_sectors = blk_queue_get_max_sectors(q, op);
> >>  
> >> -	return min(blk_max_size_offset(q, offset),
> >> -			blk_queue_get_max_sectors(q, req_op(rq)));
> >> +	switch (op) {
> >> +	case REQ_OP_DISCARD:
> >> +	case REQ_OP_SECURE_ERASE:
> >> +	case REQ_OP_WRITE_SAME:
> >> +	case REQ_OP_WRITE_ZEROES:
> >> +		return max_sectors;
> >> +	}>> +
> >> +	return min(blk_max_size_offset(q, offset), max_sectors);
> >>  }
> > 
> > It depends if offset & chunk_sectors limit for WRITE_SAME & WRITE_ZEROS
> > needs to be considered.
> 
> That limit is needed for zoned block devices to ensure that *any* write request,
> no matter the command, do not cross zone boundaries. Otherwise, the write would
> be immediately failed by the device.

Looks both blk_bio_write_zeroes_split() and blk_bio_write_same_split()
don't consider chunk_sectors limit, is that an issue for zone block?


thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

