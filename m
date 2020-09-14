Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5B8268E7B
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 16:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600095345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q+RzQAl95ywoZIq2hsibcOqBunPI2TESHH8a9fe5cuI=;
	b=htedtkx1eve9dkrq9YzA6wBJANJNB5Ixx4cmjv6ZPprURrJSHNZthO7O/tg2cmk0pWMIAO
	L4GEUAfruI37CkgpwYZtjHvqqHHLGitUUwS3ix6yv9MYJFeBeU0oVCxADA2WPr1GB21qnx
	ft5sOkm1m6tuE+cKUPX42+P7NfIIR5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-fcj0enhmN4Wh2A6nfP8n2Q-1; Mon, 14 Sep 2020 10:55:41 -0400
X-MC-Unique: fcj0enhmN4Wh2A6nfP8n2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A1C210BBEED;
	Mon, 14 Sep 2020 14:55:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB4675138;
	Mon, 14 Sep 2020 14:55:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8D221832FE1;
	Mon, 14 Sep 2020 14:55:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08EEqGIu028193 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Sep 2020 10:52:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8D7B5C1BB; Mon, 14 Sep 2020 14:52:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7CC5F9D1;
	Mon, 14 Sep 2020 14:52:10 +0000 (UTC)
Date: Mon, 14 Sep 2020 10:52:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200914145209.GB14410@redhat.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
	<20200912135252.GA210077@T590>
	<CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751DAB758BAF8EB8A792FD2E7230@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Sun, Sep 13 2020 at  8:43pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

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

Thanks for the additional context, sorry to make you so concerned! ;)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

