Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 904342EF66D
	for <lists+dm-devel@lfdr.de>; Fri,  8 Jan 2021 18:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610126834;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UPagLOSKjhzbWrGcMjqf43XliS5X1SaqsOxWp/63pvU=;
	b=DaXnZI1Mq5NjrM7V+gyMAJEqXXYt2neseVjkBDD+xX6fTYG7r7n2mAlAbFR1v8XJO2znwG
	84GX2XoGgyHAiEfmIs+9mp9trqS56DHOkRVUi1dwNlTmQ11E1IF0XgI8ZApQDxfuHMCAL0
	tW0MkNInBKL0pKP2xVx70SiECNUfiso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-yvNgBgFaOOOBwS2iS_QwFQ-1; Fri, 08 Jan 2021 12:27:11 -0500
X-MC-Unique: yvNgBgFaOOOBwS2iS_QwFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F349180A086;
	Fri,  8 Jan 2021 17:27:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D79D614FA;
	Fri,  8 Jan 2021 17:27:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC052180954D;
	Fri,  8 Jan 2021 17:26:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 108HQdh4024594 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Jan 2021 12:26:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C246D10016F4; Fri,  8 Jan 2021 17:26:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42EE910013C1;
	Fri,  8 Jan 2021 17:26:35 +0000 (UTC)
Date: Fri, 8 Jan 2021 12:26:35 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20210108172635.GA29915@redhat.com>
References: <20201223112624.78955-1-jefflexu@linux.alibaba.com>
	<20201223112624.78955-7-jefflexu@linux.alibaba.com>
	<20210107221825.GF21239@redhat.com>
	<97ec2025-4937-b476-4f15-446cc304e799@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <97ec2025-4937-b476-4f15-446cc304e799@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH RFC 6/7] block: track cookies of split bios
 for bio-based device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 07 2021 at 10:08pm -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> Thanks for reviewing.
> 
> 
> On 1/8/21 6:18 AM, Mike Snitzer wrote:
> > On Wed, Dec 23 2020 at  6:26am -0500,
> > Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> > 
> >> This is actuaaly the core when supporting iopoll for bio-based device.
> >>
> >> A list is maintained in the top bio (the original bio submitted to dm
> >> device), which is used to maintain all valid cookies of split bios. The
> >> IO polling routine will actually iterate this list and poll on
> >> corresponding hardware queues of the underlying mq devices.
> >>
> >> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > 
> > Like I said in response to patch 4 in this series: please fold patch 4
> > into this patch and _really_ improve this patch header.
> > 
> > In particular, the (ab)use of bio_inc_remaining() needs be documented in
> > this patch header very well.
> > 
> > But its use could easily be why you're seeing a performance hit (coupled
> > with the extra spinlock locking and list management used).  Just added
> > latency and contention across CPUs.
> 
> Indeed bio_inc_remaining() is abused here and the code seems quite hacky
> here.
> 
> Actually I'm regarding implementing the split bio tracking mechanism in
> a recursive way you had ever suggested. That is, the split bios could be
> maintained in an array, which is allocated with 'struct dm_io'. This way
> the overhead of spinlock protecting the &root->bi_plist may be omitted
> here. Also the lifetime management may be simplified somehow. But the
> block core needs to fetch the per-bio private data now, just like what
> you had ever suggested before.
> 
> How do you think, Mike?

Yes, using per-bio-data is a requirement (we cannot bloat 'struct bio').

As for using an array, how would you index the array?  blk-mq is able to
use an array (with cookie to hctx index translation) because there are a
finite number of fixed hctx for the life of the device.  But with
stacked bio-based DM devices, each DM table associated with a DM device
can change via table reload.  Any reloads should flush outstanding IO,
but there are cases where no flushing occurs (e.g. dm-multipath when no
paths are available, _but_ in that instance, there wouldn't be any
mapping that results in a blk-mq hctx endpoint).

All the DM edge cases aside, you need to ensure that the lifetime of the
per-bio-data that holds the 'struct node' (that you correctly detailed
needing below) doesn't somehow get used _after_ the hctx and/or cookie
are no longer valid.  So to start we'll need some BUG_ON() to validate
the lifetime is correct.

> Besides the lifetime management is quite annoying to me. As long as the
> tracking object representing a valid split bio) is dynamically
> allocated, no matter it's embedded directly in 'struct bio' (in this
> patch), or allocated with 'struct dm_io', the lifetime management of the
> tracking object comes in. Here the so called tracking object is
> something like
> 
> struct node {
>     struct blk_mq_hw_ctx *hctx;
>     blk_qc_t cookie;
> };

Needs a better name, think I had 'struct dm_poll_data'
 
> Actually currently the tracking objects are all allocated with 'struct
> bio', then the lifetime management of the tracking objects is actually
> equivalent to lifetime management of bio. Since the returned cookie is
> actually a pointer to the bio, the refcount of this bio must be
> incremented, since we release a reference to this bio through the
> returned cookie, in which case the abuse of the refcount trick seems
> unavoidable? Unless we allocate the tracking object individually, then
> the returned cookie is actually pointing to the tracking object, and the
> refcount is individually maintained for the tracking object.

The refcounting and lifetime of the per-bio-data should all work as is.
Would hope you can avoid extra bio_inc_remaining().. that infratsructure
is way too tightly coupled to bio_chain()'ing, etc.

The challenge you have is the array that would point at these various
per-bio-data needs to be rooted somewhere (you put it in the topmost
original bio with the current patchset).  But why not manage that as
part of 'struct mapped_device'?  It'd need proper management at DM table
reload boundaries and such but it seems like the most logical place to
put the array.  But again, this array needs to be dynamic.. so thinking
further, maybe a better model would be to have a fixed array in 'struct
dm_table' for each hctx associated with a blk_mq _data_ device directly
used/managed by that dm_table?

And ideally, access to these arrays should be as lockless as possible
(rcu, or whatever) so that scaling to many cpus isn't a problem.

> >> ---
> >>  block/bio.c               |  8 ++++
> >>  block/blk-core.c          | 84 ++++++++++++++++++++++++++++++++++++++-
> >>  include/linux/blk_types.h | 39 ++++++++++++++++++
> >>  3 files changed, 129 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/block/bio.c b/block/bio.c
> >> index 1f2cc1fbe283..ca6d1a7ee196 100644
> >> --- a/block/bio.c
> >> +++ b/block/bio.c
> >> @@ -284,6 +284,10 @@ void bio_init(struct bio *bio, struct bio_vec *table,
> >>  
> >>  	bio->bi_io_vec = table;
> >>  	bio->bi_max_vecs = max_vecs;
> >> +
> >> +	INIT_LIST_HEAD(&bio->bi_plist);
> >> +	INIT_LIST_HEAD(&bio->bi_pnode);
> >> +	spin_lock_init(&bio->bi_plock);
> >>  }
> >>  EXPORT_SYMBOL(bio_init);
> >>  
> >> @@ -689,6 +693,7 @@ void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
> >>  	bio->bi_write_hint = bio_src->bi_write_hint;
> >>  	bio->bi_iter = bio_src->bi_iter;
> >>  	bio->bi_io_vec = bio_src->bi_io_vec;
> >> +	bio->bi_root = bio_src->bi_root;
> >>  
> >>  	bio_clone_blkg_association(bio, bio_src);
> >>  	blkcg_bio_issue_init(bio);
> >> @@ -1425,6 +1430,8 @@ void bio_endio(struct bio *bio)
> >>  	if (bio->bi_disk)
> >>  		rq_qos_done_bio(bio->bi_disk->queue, bio);
> >>  
> >> +	bio_del_poll_list(bio);
> >> +
> >>  	/*
> >>  	 * Need to have a real endio function for chained bios, otherwise
> >>  	 * various corner cases will break (like stacking block devices that
> >> @@ -1446,6 +1453,7 @@ void bio_endio(struct bio *bio)
> >>  	blk_throtl_bio_endio(bio);
> >>  	/* release cgroup info */
> >>  	bio_uninit(bio);
> >> +
> >>  	if (bio->bi_end_io)
> >>  		bio->bi_end_io(bio);
> >>  }
> >> diff --git a/block/blk-core.c b/block/blk-core.c
> >> index 2f5c51ce32e3..5a332af01939 100644
> >> --- a/block/blk-core.c
> >> +++ b/block/blk-core.c
> >> @@ -960,12 +960,31 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
> >>  {
> >>  	struct bio_list bio_list_on_stack[2];
> >>  	blk_qc_t ret = BLK_QC_T_NONE;
> >> +	bool iopoll;
> >> +	struct bio *root;
> >>  
> >>  	BUG_ON(bio->bi_next);
> >>  
> >>  	bio_list_init(&bio_list_on_stack[0]);
> >>  	current->bio_list = bio_list_on_stack;
> >>  
> >> +	iopoll = test_bit(QUEUE_FLAG_POLL, &bio->bi_disk->queue->queue_flags);
> >> +	iopoll = iopoll && (bio->bi_opf & REQ_HIPRI);
> >> +
> >> +	if (iopoll) {
> >> +		bio->bi_root = root = bio;
> >> +		/*
> >> +		 * We need to pin root bio here since there's a reference from
> >> +		 * the returned cookie. bio_get() is not enough since the whole
> >> +		 * bio and the corresponding kiocb/dio may have already
> >> +		 * completed and thus won't call blk_poll() at all, in which
> >> +		 * case the pairing bio_put() in blk_bio_poll() won't be called.
> >> +		 * The side effect of bio_inc_remaining() is that, the whole bio
> >> +		 * won't complete until blk_poll() called.
> >> +		 */
> >> +		bio_inc_remaining(root);
> >> +	}
> >> +
> >>  	do {
> >>  		struct request_queue *q = bio->bi_disk->queue;
> >>  		struct bio_list lower, same;
> >> @@ -979,7 +998,18 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
> >>  		bio_list_on_stack[1] = bio_list_on_stack[0];
> >>  		bio_list_init(&bio_list_on_stack[0]);
> >>  
> >> -		ret = __submit_bio(bio);
> >> +		if (iopoll) {
> >> +			/* See the comments of above bio_inc_remaining(). */
> >> +			bio_inc_remaining(bio);
> >> +			bio->bi_cookie = __submit_bio(bio);
> >> +
> >> +			if (blk_qc_t_valid(bio->bi_cookie))
> >> +				bio_add_poll_list(bio);
> >> +
> >> +			bio_endio(bio);
> >> +		} else {
> >> +			ret = __submit_bio(bio);
> >> +		}
> >>  
> >>  		/*
> >>  		 * Sort new bios into those for a lower level and those for the
> >> @@ -1002,7 +1032,11 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
> >>  	} while ((bio = bio_list_pop(&bio_list_on_stack[0])));
> >>  
> >>  	current->bio_list = NULL;
> >> -	return ret;
> >> +
> >> +	if (iopoll)
> >> +		return (blk_qc_t)root;
> >> +
> >> +	return BLK_QC_T_NONE;
> >>  }
> >>  
> >>  static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
> >> @@ -1131,6 +1165,52 @@ blk_qc_t submit_bio(struct bio *bio)
> >>  }
> >>  EXPORT_SYMBOL(submit_bio);
> >>  
> >> +int blk_bio_poll(struct request_queue *q, blk_qc_t cookie)
> >> +{
> >> +	int ret = 0;
> >> +	struct bio *bio, *root = (struct bio*)cookie;
> >> +
> >> +	if (list_empty(&root->bi_plist)) {
> >> +		bio_endio(root);
> >> +		return 1;
> >> +	}
> >> +
> >> +	spin_lock(&root->bi_plock);
> >> +	bio = list_first_entry_or_null(&root->bi_plist, struct bio, bi_pnode);
> >> +
> >> +	while (bio) {
> >> +		struct request_queue *q = bio->bi_disk->queue;
> >> +		blk_qc_t cookie = bio->bi_cookie;
> >> +
> >> +		spin_unlock(&root->bi_plock);
> >> +		BUG_ON(!blk_qc_t_valid(cookie));
> >> +
> >> +		ret += blk_mq_poll(q, cookie);
> > 
> > Not yet clear to me how you _know_ this q is blk-mq...
> > What about a deep stack of bio-based DM devices?
> > 
> 
> This design works in arbitrary bio-based DM stacking.
> 
> 
> > Or are you confining bio-based DM IO polling support to bio-based
> > stacked directly on blk-mq? (patch 7 likely shows that to be the case).
> > 
> 
> patch 7 works in arbitrary bio-based DM stacking. Please see the reply
> for patch 7 for details.

OK, I see.  Definitely need to capture that aspect of the design in the
relevant patch header(s).

And likely a block comment in blk_bio_poll().

> > If so, I'm not liking that at all.  So if your implementation doesn't
> > support arbitrary bio-based IO stacks then this bio-based IO polling
> > support really has limited utility still.
> > 
> > Helps explin how you got away with having bio-based DM always returning
> > BLK_QC_T_NONE in patch 5 though... feels far too simplistic.  Patch 5+6
> > together are implicitly ignoring the complexity that results from
> > arbitrary bio-based DM stacking.
> > 
> > Or am I missing something?
> 
> The magic is in patch 5. Bios submitted directly to DM device won't be
> enqueue into this &root->bi_plist list, since all bios submitted
> directly to DM device will return BLK_QC_T_NONE since patch 5, and
> __submit_bio_noacct() only enqueues split bios with valid cookie into
> &root->bi_plist list. Thus only bios submitted to mq device will be
> enqueued into this &root->bi_plist list.
> 
> Following is the related logic (the blk_qc_t_valid() part).
> 
> 
> >> -		ret = __submit_bio(bio);
> >> +		if (iopoll) {
> >> +			/* See the comments of above bio_inc_remaining(). */
> >> +			bio_inc_remaining(bio);
> >> +			bio->bi_cookie = __submit_bio(bio);
> >> +
> >> +			if (blk_qc_t_valid(bio->bi_cookie))
> >> +				bio_add_poll_list(bio);
> >> +
> >> +			bio_endio(bio);
> >> +		} else {
> >> +			ret = __submit_bio(bio);
> >> +		}
> 
> 
> 
> Suppose we have the following device stack hierarchy, that is, dm0 is
> stacked on dm1, while dm1 is stacked on nvme0 and nvme1.
> 
>     dm0
>     dm1
> nvme0  nvme1
> 
> 
> Then the bio graph is like:
> 
> 
>                                    +------------+
>                                    |bio0(to dm0)|
>                                    +------------+
>                                          ^
>                                          | orig_bio
>                                    +--------------------+
>                                    |struct dm_io of bio0|
> +--------------------+ bi_private  ----------------------
> |bio3(to dm1)        |------------>|bio1(to dm1)        |
> +--------------------+             +--------------------+
>         ^                                ^
>         | ->orig_bio                     | ->orig_bio
> +--------------------+             +--------------------+
> |struct dm_io        |             |struct dm_io        |
> ----------------------             ----------------------
> |bio2(to nvme0)      |             |bio4(to nvme1)      |
> +--------------------+             +--------------------+
> 
> In this way, bio 0/1/3 will return BLK_QC_T_NONE and won't be enqueued
> into &root->bi_plist list, while bio 2/4 will be enqueued if they return
> valid cookie.

Yes, useful insight, thanks.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

