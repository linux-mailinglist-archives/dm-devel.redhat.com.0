Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8FC35C3C8
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 12:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618223018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qZUFNTj5gdS2EvMRNRMAF7ZT1Vcj98J0v2mkcFySRVQ=;
	b=epUOAQCxWrfVwELpkwZAh12z0n4n7qiDCc9yzm2tyBIbNGCjxBs+/OOUVvJSQ7D6m9+Pkl
	9FEkWbKA5Plp8xbkp0ZU0JTBvLomyMG5iM2yuMUHLqgRhjQDISRSKeCEWJ4jnoQLxQEN0F
	7l258KPP9V2XFsDpQcwVsXhuZiNpUZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-nF7VTFKNOAyG0o22e4nRgw-1; Mon, 12 Apr 2021 06:23:36 -0400
X-MC-Unique: nF7VTFKNOAyG0o22e4nRgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45318030B5;
	Mon, 12 Apr 2021 10:23:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4906919C59;
	Mon, 12 Apr 2021 10:23:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA4F91806D0E;
	Mon, 12 Apr 2021 10:23:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13CALF64030194 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 06:21:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE3A41037E81; Mon, 12 Apr 2021 10:21:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-111.pek2.redhat.com [10.72.12.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF63101E663;
	Mon, 12 Apr 2021 10:20:59 +0000 (UTC)
Date: Mon, 12 Apr 2021 18:20:55 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YHQfB83n8dQSwD3O@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-9-ming.lei@redhat.com>
	<20210412095427.GA987123@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210412095427.GA987123@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [PATCH V5 08/12] block: use per-task poll context to
 implement bio based io polling
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

On Mon, Apr 12, 2021 at 10:54:27AM +0100, Christoph Hellwig wrote:
> On Thu, Apr 01, 2021 at 10:19:23AM +0800, Ming Lei wrote:
> > Currently bio based IO polling needs to poll all hw queue blindly, this
> > way is very inefficient, and one big reason is that we can't pass any
> > bio submission result to blk_poll().
> > 
> > In IO submission context, track associated underlying bios by per-task
> > submission queue and store returned 'cookie' in
> > bio->bi_iter.bi_private_data, and return current->pid to caller of
> > submit_bio() for any bio based driver's IO, which is submitted from FS.
> > 
> > In IO poll context, the passed cookie tells us the PID of submission
> > context, then we can find bios from the per-task io pull context of
> > submission context. Moving bios from submission queue to poll queue of
> > the poll context, and keep polling until these bios are ended. Remove
> > bio from poll queue if the bio is ended. Add bio flags of BIO_DONE and
> > BIO_END_BY_POLL for such purpose.
> > 
> > In was found in Jeffle Xu's test that kfifo doesn't scale well for a
> > submission queue as queue depth is increased, so a new mechanism for
> > tracking bios is needed. So far bio's size is close to 2 cacheline size,
> > and it may not be accepted to add new field into bio for solving the
> > scalability issue by tracking bios via linked list, switch to bio group
> > list for tracking bio, the idea is to reuse .bi_end_io for linking bios
> > into a linked list for all sharing same .bi_end_io(call it bio group),
> > which is recovered before ending bio really, since BIO_END_BY_POLL is
> > added for enhancing this point. Usually .bi_end_bio is same for all
> > bios in same layer, so it is enough to provide very limited groups, such
> > as 16 or less for fixing the scalability issue.
> > 
> > Usually submission shares context with io poll. The per-task poll context
> > is just like stack variable, and it is cheap to move data between the two
> > per-task queues.
> > 
> > Also when the submission task is exiting, drain pending IOs in the context
> > until all are done.
> > 
> > Tested-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  block/bio.c               |   5 +
> >  block/blk-core.c          | 155 +++++++++++++++++++++++-
> >  block/blk-ioc.c           |   3 +
> >  block/blk-mq.c            | 244 +++++++++++++++++++++++++++++++++++++-
> >  block/blk.h               |  10 ++
> >  include/linux/blk_types.h |  26 +++-
> >  6 files changed, 439 insertions(+), 4 deletions(-)
> > 
> > diff --git a/block/bio.c b/block/bio.c
> > index 26b7f721cda8..04c043dc60fc 100644
> > --- a/block/bio.c
> > +++ b/block/bio.c
> > @@ -1402,6 +1402,11 @@ static inline bool bio_remaining_done(struct bio *bio)
> >   **/
> >  void bio_endio(struct bio *bio)
> >  {
> > +	/* BIO_END_BY_POLL has to be set before calling submit_bio */
> > +	if (bio_flagged(bio, BIO_END_BY_POLL)) {
> > +		bio_set_flag(bio, BIO_DONE);
> > +		return;
> > +	}
> 
> Why can't driver that implements bio based polling call a separate
> bio_endio_polled instead?

This bio is blk-mq IO which is underlying bio of DM or bio based driver, so
they doesn't belong to DM or bio based driver. Actually the bio_endio()
is called by blk_update_request().

The patch just tracks underlying bio-mq bios in current context, then
poll them until all are done.

> 
> > +static inline void *bio_grp_data(struct bio *bio)
> > +{
> > +	return bio->bi_poll;
> > +}
> 
> What is the purpose of this helper?  And why does it have to lose the
> type information?

This patch stores bio->bi_end_io(shared with ->bi_poll) into one per-task
data structure, and links all bios sharing same .bi_end_io into one list
via ->bi_end_io. And their ->bi_end_io is recovered before calling
bio_endio().

The helper is used for checking if one bio can be added to bio group,
and storing the data. The helper just serves for document purpose.

And the type info doesn't matter.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

