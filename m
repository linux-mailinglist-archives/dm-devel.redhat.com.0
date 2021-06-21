Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E97C3AE5A9
	for <lists+dm-devel@lfdr.de>; Mon, 21 Jun 2021 11:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624266642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aBA6aOIjSUyWE6UTbudWsFPe0Or57JCbRTRGe04FA+c=;
	b=CGYCgnQel31ijTop/Oo3DQ3YyWWLW1Itan2Jwgm4AtghTMDNX4cI4HBHtmIl0TcQ8G6+UY
	vH0MK1tk1/z7pNWRQ6hlS+//26OMonGRICIOfDGx1z96XpGXv1YskH0jWuBY/8pl8pjpxH
	DjKk+PEs5XZjHIpVn3v00slUIySGKRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Z7nPgeYINzquZZXqpxiaEw-1; Mon, 21 Jun 2021 05:10:40 -0400
X-MC-Unique: Z7nPgeYINzquZZXqpxiaEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97BB89F92B;
	Mon, 21 Jun 2021 09:10:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75E0C5D9CA;
	Mon, 21 Jun 2021 09:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3BA24EA2A;
	Mon, 21 Jun 2021 09:10:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15L9AH4h026282 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 05:10:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF7B4100EBAF; Mon, 21 Jun 2021 09:10:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-237.pek2.redhat.com [10.72.13.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89401009962;
	Mon, 21 Jun 2021 09:10:02 +0000 (UTC)
Date: Mon, 21 Jun 2021 17:09:49 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YNBXXVD9lko84IEZ@T590>
References: <20210617103549.930311-1-ming.lei@redhat.com>
	<20210617103549.930311-4-ming.lei@redhat.com>
	<20210621073656.GB6896@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210621073656.GB6896@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [RFC PATCH V2 3/3] dm: support bio polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 21, 2021 at 09:36:56AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 17, 2021 at 06:35:49PM +0800, Ming Lei wrote:
> > +	/*
> > +	 * Only support bio polling for normal IO, and the target io is
> > +	 * exactly inside the dm io instance
> > +	 */
> > +	ci->io->submit_as_polled = !!(ci->bio->bi_opf & REQ_POLLED);
> 
> Nit: the !! is not needed.

OK.

> 
> > @@ -1608,6 +1625,22 @@ static void init_clone_info(struct clone_info *ci, struct mapped_device *md,
> >  	ci->map = map;
> >  	ci->io = alloc_io(md, bio);
> >  	ci->sector = bio->bi_iter.bi_sector;
> > +
> > +	if (bio->bi_opf & REQ_POLLED) {
> > +		INIT_HLIST_NODE(&ci->io->node);
> > +
> > +		/*
> > +		 * Save .bi_end_io into dm_io, so that we can reuse .bi_end_io
> > +		 * for storing dm_io list
> > +		 */
> > +		if (bio->bi_opf & REQ_SAVED_END_IO) {
> > +			ci->io->saved_bio_end_io = NULL;
> 
> So if it already was saved the list gets cleared here?  Can you explain
> this logic a little more?

Inside dm_poll_bio() we recognize non-NULL ->saved_bio_end_io as
valid, so it has to be initialized it here.

> 
> > +		} else {
> > +			ci->io->saved_bio_end_io = bio->bi_end_io;
> > +			INIT_HLIST_HEAD((struct hlist_head *)&bio->bi_end_io);
> 
> I think you want to hide these casts in helpers that clearly document
> why this is safe rather than sprinkling the casts all over the code.
> I also wonder if there is any better way to structur this.

OK, I will add a helper of dm_get_bio_hlist_head() with comment.

> 
> > +static int dm_poll_bio(struct bio *bio, unsigned int flags)
> > +{
> > +	struct dm_io *io;
> > +	void *saved_bi_end_io = NULL;
> > +	struct hlist_head tmp = HLIST_HEAD_INIT;
> > +	struct hlist_head *head = (struct hlist_head *)&bio->bi_end_io;
> > +	struct hlist_node *next;
> > +
> > +	/*
> > +	 * This bio can be submitted from FS as POLLED so that FS may keep
> > +	 * polling even though the flag is cleared by bio splitting or
> > +	 * requeue, so return immediately.
> > +	 */
> > +	if (!(bio->bi_opf & REQ_POLLED))
> > +		return 0;
> 
> I can't really parse the comment, can you explain this a little more?
> But if we need this check, shouldn't it move to bio_poll()?

Upper layer keeps to poll one bio with POLLED, but the flag can be
cleared by driver or block layer. Once it is cleared, we should return
immediately.

Yeah, we can move it to bio_poll().

> 
> > +	hlist_for_each_entry(io, &tmp, node) {
> > +		if (io->saved_bio_end_io && !saved_bi_end_io) {
> > +			saved_bi_end_io = io->saved_bio_end_io;
> > +			break;
> > +		}
> > +	}
> 
> So it seems like you don't use bi_cookie at all.  Why not turn
> bi_cookie into a union to stash the hlist_head and use that?

hlist_head is 'void *', but ->bi_cookie is 'unsigned int'.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

