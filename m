Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A5BB433EA4E
	for <lists+dm-devel@lfdr.de>; Wed, 17 Mar 2021 07:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615964203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CXgoTpUJr25KRooyX+MzqlWwMaB9/s/TGJbGpdSrVRU=;
	b=hNTsUcIxVJ8oFPzk06GUtafm4A434/QzCwrSGJCItahIbKDMsvLBmc0kJR0YVdXu6Wy3uw
	yVCVYOBIlXbJwrlTRHS5rn+ynwRU3rH+xceU+w6SDUEusCYwSZP5bT2cJSfS9YpnNZlN2B
	xLGaH1Y4OD1PbYn7a5C+BlJO/jELRW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-W_F0Q5IqOlKhbF0FTPRyFg-1; Wed, 17 Mar 2021 02:56:41 -0400
X-MC-Unique: W_F0Q5IqOlKhbF0FTPRyFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A3618C89CF;
	Wed, 17 Mar 2021 06:56:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 880865C1A3;
	Wed, 17 Mar 2021 06:56:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 985961800657;
	Wed, 17 Mar 2021 06:56:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H6tCCK029722 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 02:55:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 777E25D74F; Wed, 17 Mar 2021 06:55:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-221.pek2.redhat.com [10.72.13.221])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B215D747;
	Wed, 17 Mar 2021 06:54:59 +0000 (UTC)
Date: Wed, 17 Mar 2021 14:54:55 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YFGnv7Tlyb6njGL+@T590>
References: <20210316031523.864506-1-ming.lei@redhat.com>
	<20210316031523.864506-9-ming.lei@redhat.com>
	<b4dce8c6-61dd-9524-0a55-41db63eb084d@linux.alibaba.com>
	<YFBbjY+oDpjIHI3P@T590>
	<3848e80d-e7ad-9372-c96f-d32bfb9f0ae5@linux.alibaba.com>
	<YFFvYH6dRBoqARF6@T590>
	<06bd2e9e-68c9-f74b-f59f-b565a557c47d@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <06bd2e9e-68c9-f74b-f59f-b565a557c47d@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 08/11] block: use per-task poll context
 to implement bio based io poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 17, 2021 at 11:53:12AM +0800, JeffleXu wrote:
> 
> 
> On 3/17/21 10:54 AM, Ming Lei wrote:
> > On Tue, Mar 16, 2021 at 04:52:36PM +0800, JeffleXu wrote:
> >>
> >>
> >> On 3/16/21 3:17 PM, Ming Lei wrote:
> >>> On Tue, Mar 16, 2021 at 02:46:08PM +0800, JeffleXu wrote:
> >>>> It is a giant progress to gather all split bios that need to be polled
> >>>> in a per-task queue. Still some comments below.
> >>>>
> >>>>
> >>>> On 3/16/21 11:15 AM, Ming Lei wrote:
> >>>>> Currently bio based IO poll needs to poll all hw queue blindly, this way
> >>>>> is very inefficient, and the big reason is that we can't pass bio
> >>>>> submission result to io poll task.
> >>>>>
> >>>>> In IO submission context, store associated underlying bios into the
> >>>>> submission queue and save 'cookie' poll data in bio->bi_iter.bi_private_data,
> >>>>> and return current->pid to caller of submit_bio() for any DM or bio based
> >>>>> driver's IO, which is submitted from FS.
> >>>>>
> >>>>> In IO poll context, the passed cookie tells us the PID of submission
> >>>>> context, and we can find the bio from that submission context. Moving
> >>>>> bio from submission queue to poll queue of the poll context, and keep
> >>>>> polling until these bios are ended. Remove bio from poll queue if the
> >>>>> bio is ended. Add BIO_DONE and BIO_END_BY_POLL for such purpose.
> >>>>>
> >>>>> Usually submission shares context with io poll. The per-task poll context
> >>>>> is just like stack variable, and it is cheap to move data between the two
> >>>>> per-task queues.
> >>>>>
> >>>>> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> >>>>> ---
> >>>>>  block/bio.c               |   5 ++
> >>>>>  block/blk-core.c          |  74 +++++++++++++++++-
> >>>>>  block/blk-mq.c            | 156 +++++++++++++++++++++++++++++++++++++-
> >>>>>  include/linux/blk_types.h |   3 +
> >>>>>  4 files changed, 235 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/block/bio.c b/block/bio.c
> >>>>> index a1c4d2900c7a..bcf5eca0e8e3 100644
> >>>>> --- a/block/bio.c
> >>>>> +++ b/block/bio.c
> >>>>> @@ -1402,6 +1402,11 @@ static inline bool bio_remaining_done(struct bio *bio)
> >>>>>   **/
> >>>>>  void bio_endio(struct bio *bio)
> >>>>>  {
> >>>>> +	/* BIO_END_BY_POLL has to be set before calling submit_bio */
> >>>>> +	if (bio_flagged(bio, BIO_END_BY_POLL)) {
> >>>>> +		bio_set_flag(bio, BIO_DONE);
> >>>>> +		return;
> >>>>> +	}
> >>>>>  again:
> >>>>>  	if (!bio_remaining_done(bio))
> >>>>>  		return;
> >>>>> diff --git a/block/blk-core.c b/block/blk-core.c
> >>>>> index a082bbc856fb..970b23fa2e6e 100644
> >>>>> --- a/block/blk-core.c
> >>>>> +++ b/block/blk-core.c
> >>>>> @@ -854,6 +854,40 @@ static inline void blk_bio_poll_preprocess(struct request_queue *q,
> >>>>>  		bio->bi_opf |= REQ_TAG;
> >>>>>  }
> >>>>>  
> >>>>> +static bool blk_bio_poll_prep_submit(struct io_context *ioc, struct bio *bio)
> >>>>> +{
> >>>>> +	struct blk_bio_poll_data data = {
> >>>>> +		.bio	=	bio,
> >>>>> +	};
> >>>>> +	struct blk_bio_poll_ctx *pc = ioc->data;
> >>>>> +	unsigned int queued;
> >>>>> +
> >>>>> +	/* lock is required if there is more than one writer */
> >>>>> +	if (unlikely(atomic_read(&ioc->nr_tasks) > 1)) {
> >>>>> +		spin_lock(&pc->lock);
> >>>>> +		queued = kfifo_put(&pc->sq, data);
> >>>>> +		spin_unlock(&pc->lock);
> >>>>> +	} else {
> >>>>> +		queued = kfifo_put(&pc->sq, data);
> >>>>> +	}
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * Now the bio is added per-task fifo, mark it as END_BY_POLL,
> >>>>> +	 * so we can save cookie into this bio after submit_bio().
> >>>>> +	 */
> >>>>> +	if (queued)
> >>>>> +		bio_set_flag(bio, BIO_END_BY_POLL);
> >>>>> +	else
> >>>>> +		bio->bi_opf &= ~(REQ_HIPRI | REQ_TAG);
> >>>>> +
> >>>>> +	return queued;
> >>>>> +}
> >>>>
> >>>> The size of kfifo is limited, and it seems that once the sq of kfifio is
> >>>> full, REQ_HIPRI flag is cleared and the corresponding bio is actually
> >>>> enqueued into the default hw queue, which is IRQ driven.
> >>>
> >>> Yeah, this patch starts with 64 queue depth, and we can increase it to
> >>> 128, which should cover most of cases.
> >>
> >> It seems that the queue depth of kfifo will affect the performance as I
> >> did a fast test.
> >>
> >>
> >>
> >> Test Result:
> >>
> >> BLK_BIO_POLL_SQ_SZ | iodepth | IOPS
> >> ------------------ | ------- | ----
> >> 64                 | 128     | 301k (IRQ) -> 340k (iopoll)
> >> 64                 | 16      | 304k (IRQ) -> 392k (iopoll)
> >> 128                | 128     | 204k (IRQ) -> 317k (iopoll)
> >> 256                | 128     | 241k (IRQ) -> 391k (iopoll)
> >>
> >> It seems that BLK_BIO_POLL_SQ_SZ need to be increased accordingly when
> >> iodepth is quite large. But I don't know why the performance in IRQ mode
> >> decreases when BLK_BIO_POLL_SQ_SZ is increased.
> > 
> > This patchset is supposed to not affect IRQ mode because HIPRI isn't set
> > at IRQ mode. Or you mean '--hipri' & io_uring is setup but setting
> > nvme.poll_queues as 0 at your 'IRQ' mode test?
> > 
> > Thanks for starting to run performance test, and so far I just run test
> > in KVM, not start performance test yet.
> > 
> 
> 'IRQ' means 'hipri=0' of fio configuration.

'hipri=0' isn't supposed to be affected by this patchset.


thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

