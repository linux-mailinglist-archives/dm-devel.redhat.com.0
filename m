Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F85E341EB2
	for <lists+dm-devel@lfdr.de>; Fri, 19 Mar 2021 14:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616161657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IfhnxbY6oOsjJ+K1UAQpDbhLhELtVq+EEELZRoUFGTs=;
	b=SKT2ROm/ZsTbBanMkV4l+z8qKEkhWpNCzqIJuYtMnuJlZfvvHv0m4VAv/xJFL7bhetXXHx
	PbXhL9zLKXlKXll7FAIpXnO4SpkXMUfrOPCNurVjcfwDto8t2ZIKIlmDplGCAWQkuh/A0M
	HB/1nOyZs6RhDNyLk6nIVYFZrs19e9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-lYtikq9FOJ697KGJyWyidg-1; Fri, 19 Mar 2021 09:47:35 -0400
X-MC-Unique: lYtikq9FOJ697KGJyWyidg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E411084C8C;
	Fri, 19 Mar 2021 13:47:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A94860BF1;
	Fri, 19 Mar 2021 13:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 289BF1809C83;
	Fri, 19 Mar 2021 13:47:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JDkKXG022119 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 09:46:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E06CD179B3; Fri, 19 Mar 2021 13:46:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-86.pek2.redhat.com [10.72.12.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E448563B8C;
	Fri, 19 Mar 2021 13:46:07 +0000 (UTC)
Date: Fri, 19 Mar 2021 21:46:03 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YFSrG2/0/KA5QDhU@T590>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-10-ming.lei@redhat.com>
	<d5b26031-22ed-eeb2-222f-d690c919e2f9@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <d5b26031-22ed-eeb2-222f-d690c919e2f9@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH V2 09/13] block: use per-task poll
 context to implement bio based io poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 19, 2021 at 05:38:38PM +0800, JeffleXu wrote:
> I'm thinking how this mechanism could work with *original* bio-based
> devices that don't ne built upon mq devices, such as nvdimm. This

non-mq device needs driver to implement io polling by itself, block
layer can't help it, and that can't be this patchset's job.

> mechanism (also including my original design) mainly focuses on virtual
> devices that built upon mq devices, i.e., md/dm.
> 
> As the original bio-based devices wants to support IO polling in the
> future, then they should be somehow distingushed from md/dm.
> 
> 
> On 3/19/21 12:48 AM, Ming Lei wrote:
> > Currently bio based IO poll needs to poll all hw queue blindly, this way
> > is very inefficient, and the big reason is that we can't pass bio
> > submission result to io poll task.
> > 
> > In IO submission context, track associated underlying bios by per-task
> > submission queue and save 'cookie' poll data in bio->bi_iter.bi_private_data,
> > and return current->pid to caller of submit_bio() for any bio based
> > driver's IO, which is submitted from FS.
> > 
> > In IO poll context, the passed cookie tells us the PID of submission
> > context, and we can find the bio from that submission context. Moving
> > bio from submission queue to poll queue of the poll context, and keep
> > polling until these bios are ended. Remove bio from poll queue if the
> > bio is ended. Add BIO_DONE and BIO_END_BY_POLL for such purpose.
> > 
> > In previous version, kfifo is used to implement submission queue, and
> > Jeffle Xu found that kfifo can't scale well in case of high queue depth.
> > So far bio's size is close to 2 cacheline size, and it may not be
> > accepted to add new field into bio for solving the scalability issue by
> > tracking bios via linked list, switch to bio group list for tracking bio,
> > the idea is to reuse .bi_end_io for linking bios into a linked list for
> > all sharing same .bi_end_io(call it bio group), which is recovered before
> > really end bio, since BIO_END_BY_POLL is added for enhancing this point.
> > Usually .bi_end_bio is same for all bios in same layer, so it is enough to
> > provide very limited groups, such as 32 for fixing the scalability issue.
> > 
> > Usually submission shares context with io poll. The per-task poll context
> > is just like stack variable, and it is cheap to move data between the two
> > per-task queues.
> > 
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  block/bio.c               |   5 ++
> >  block/blk-core.c          | 149 +++++++++++++++++++++++++++++++-
> >  block/blk-mq.c            | 173 +++++++++++++++++++++++++++++++++++++-
> >  block/blk.h               |   9 ++
> >  include/linux/blk_types.h |  16 +++-
> >  5 files changed, 348 insertions(+), 4 deletions(-)
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
> >  again:
> >  	if (!bio_remaining_done(bio))
> >  		return;
> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index efc7a61a84b4..778d25a7e76c 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -805,6 +805,77 @@ static inline unsigned int bio_grp_list_size(unsigned int nr_grps)
> >  		sizeof(struct bio_grp_list_data);
> >  }
> >  
> > +static inline void *bio_grp_data(struct bio *bio)
> > +{
> > +	return bio->bi_poll;
> > +}
> > +
> > +/* add bio into bio group list, return true if it is added */
> > +static bool bio_grp_list_add(struct bio_grp_list *list, struct bio *bio)
> > +{
> > +	int i;
> > +	struct bio_grp_list_data *grp;
> > +
> > +	for (i = 0; i < list->nr_grps; i++) {
> > +		grp = &list->head[i];
> > +		if (grp->grp_data == bio_grp_data(bio)) {
> > +			__bio_grp_list_add(&grp->list, bio);
> > +			return true;
> > +		}
> > +	}
> > +
> > +	if (i == list->max_nr_grps)
> > +		return false;
> > +
> > +	/* create a new group */
> > +	grp = &list->head[i];
> > +	bio_list_init(&grp->list);
> > +	grp->grp_data = bio_grp_data(bio);
> > +	__bio_grp_list_add(&grp->list, bio);
> > +	list->nr_grps++;
> > +
> > +	return true;
> > +}
> > +
> > +static int bio_grp_list_find_grp(struct bio_grp_list *list, void *grp_data)
> > +{
> > +	int i;
> > +	struct bio_grp_list_data *grp;
> > +
> > +	for (i = 0; i < list->max_nr_grps; i++) {
> > +		grp = &list->head[i];
> > +		if (grp->grp_data == grp_data)
> > +			return i;
> > +	}
> > +	for (i = 0; i < list->max_nr_grps; i++) {
> > +		grp = &list->head[i];
> > +		if (bio_grp_list_grp_empty(grp))
> > +			return i;
> > +	}
> > +	return -1;
> > +}
> > +
> > +/* Move as many as possible groups from 'src' to 'dst' */
> > +void bio_grp_list_move(struct bio_grp_list *dst, struct bio_grp_list *src)
> > +{
> > +	int i, j, cnt = 0;
> > +	struct bio_grp_list_data *grp;
> > +
> > +	for (i = src->nr_grps - 1; i >= 0; i--) {
> > +		grp = &src->head[i];
> > +		j = bio_grp_list_find_grp(dst, grp->grp_data);
> > +		if (j < 0)
> > +			break;
> > +		if (bio_grp_list_grp_empty(&dst->head[j]))
> > +			dst->head[j].grp_data = grp->grp_data;
> > +		__bio_grp_list_merge(&dst->head[j].list, &grp->list);
> > +		bio_list_init(&grp->list);
> > +		cnt++;
> > +	}
> > +
> > +	src->nr_grps -= cnt;
> > +}
> 
> Not sure why it's checked in reverse order (starting from 'nr_grps - 1').

Then for bio group list in submission side, only first .nr_grps groups
includes bios.

> 
> 
> > +
> >  static void bio_poll_ctx_init(struct blk_bio_poll_ctx *pc)
> >  {
> >  	pc->sq = (void *)pc + sizeof(*pc);
> > @@ -866,6 +937,46 @@ static inline void blk_bio_poll_preprocess(struct request_queue *q,
> >  		bio->bi_opf |= REQ_TAG;
> >  }
> >  
> > +static bool blk_bio_poll_prep_submit(struct io_context *ioc, struct bio *bio)
> > +{
> > +	struct blk_bio_poll_ctx *pc = ioc->data;
> > +	unsigned int queued;
> > +
> > +	/*
> > +	 * We rely on immutable .bi_end_io between blk-mq bio submission
> > +	 * and completion. However, bio crypt may update .bi_end_io during
> > +	 * submitting, so simply not support bio based polling for this
> > +	 * setting.
> > +	 */
> > +	if (likely(!bio_has_crypt_ctx(bio))) {
> > +		/* track this bio via bio group list */
> > +		spin_lock(&pc->sq_lock);
> > +		queued = bio_grp_list_add(pc->sq, bio);
> > +		spin_unlock(&pc->sq_lock);
> > +	} else {
> > +		queued = false;
> > +	}
> > +
> > +	/*
> > +	 * Now the bio is added per-task fifo, mark it as END_BY_POLL,
> > +	 * and the bio is always completed from the pair poll context.
> > +	 *
> > +	 * One invariant is that if bio isn't completed, blk_poll() will
> > +	 * be called by passing cookie returned from submitting this bio.
> > +	 */
> > +	if (!queued)
> > +		bio->bi_opf &= ~(REQ_HIPRI | REQ_TAG);
> > +	else
> > +		bio_set_flag(bio, BIO_END_BY_POLL);
> > +
> > +	return queued;
> > +}
> > +
> > +static void blk_bio_poll_post_submit(struct bio *bio, blk_qc_t cookie)
> > +{
> > +	bio->bi_iter.bi_private_data = cookie;
> > +}
> > +
> >  static noinline_for_stack bool submit_bio_checks(struct bio *bio)
> >  {
> >  	struct block_device *bdev = bio->bi_bdev;
> > @@ -1020,7 +1131,7 @@ static blk_qc_t __submit_bio(struct bio *bio)
> >   * bio_list_on_stack[1] contains bios that were submitted before the current
> >   *	->submit_bio_bio, but that haven't been processed yet.
> >   */
> > -static blk_qc_t __submit_bio_noacct(struct bio *bio)
> > +static blk_qc_t __submit_bio_noacct_int(struct bio *bio, struct io_context *ioc)
> >  {
> >  	struct bio_list bio_list_on_stack[2];
> >  	blk_qc_t ret = BLK_QC_T_NONE;
> > @@ -1043,7 +1154,16 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
> >  		bio_list_on_stack[1] = bio_list_on_stack[0];
> >  		bio_list_init(&bio_list_on_stack[0]);
> >  
> > -		ret = __submit_bio(bio);
> > +		if (ioc && queue_is_mq(q) &&
> > +				(bio->bi_opf & (REQ_HIPRI | REQ_TAG))) {
> > +			bool queued = blk_bio_poll_prep_submit(ioc, bio);
> > +
> > +			ret = __submit_bio(bio);
> > +			if (queued)
> > +				blk_bio_poll_post_submit(bio, ret);
> > +		} else {
> > +			ret = __submit_bio(bio);
> > +		}
> 
> If input @ioc is NULL, it will still return cookie (returned by
> __submit_bio()), which will call into blk_bio_poll(), which is not
> expected. (It can pass blk_queue_poll() check in blk_poll(), e.g., dm
> device itself is marked as QUEUE_FLAG_POLL, but ->io_context of IO
> submitting process failed to allocate the io_context, and thus calls
> __submit_bio_noacct_int() with @ioc is NULL).

Good catch, looks the following change is needed:

diff --git a/block/blk-core.c b/block/blk-core.c
index 778d25a7e76c..dba12ba0fa48 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1211,7 +1211,8 @@ static inline blk_qc_t __submit_bio_noacct(struct bio *bio)
 	if (ioc && ioc->data && (bio->bi_opf & REQ_HIPRI))
 		return __submit_bio_noacct_poll(bio, ioc);
 
-	return __submit_bio_noacct_int(bio, NULL);
+	 __submit_bio_noacct_int(bio, NULL);
+	return 0;
 }
 
 static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)

> 
> 
> >  
> >  		/*
> >  		 * Sort new bios into those for a lower level and those for the
> > @@ -1069,6 +1189,31 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
> >  	return ret;
> >  }
> >  
> > +static inline blk_qc_t __submit_bio_noacct_poll(struct bio *bio,
> > +		struct io_context *ioc)
> > +{
> > +	struct blk_bio_poll_ctx *pc = ioc->data;
> > +
> > +	__submit_bio_noacct_int(bio, ioc);
> > +
> > +	/* bio submissions queued to per-task poll context */
> > +	if (READ_ONCE(pc->sq->nr_grps))
> > +		return current->pid;
> > +
> > +	/* swapper's pid is 0, but it can't submit poll IO for us */
> > +	return 0;
> > +}
> > +
> > +static inline blk_qc_t __submit_bio_noacct(struct bio *bio)
> > +{
> > +	struct io_context *ioc = current->io_context;
> > +
> > +	if (ioc && ioc->data && (bio->bi_opf & REQ_HIPRI))
> > +		return __submit_bio_noacct_poll(bio, ioc);
> > +
> 
> 
> > +	return __submit_bio_noacct_int(bio, NULL);
> > +}
> > +
> >  static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
> >  {
> >  	struct bio_list bio_list[2] = { };
> > diff --git a/block/blk-mq.c b/block/blk-mq.c
> > index 03f59915fe2c..f26950a51f4a 100644
> > --- a/block/blk-mq.c
> > +++ b/block/blk-mq.c
> > @@ -3865,14 +3865,185 @@ static inline int blk_mq_poll_hctx(struct request_queue *q,
> >  	return ret;
> >  }
> >  
> > +static blk_qc_t bio_get_poll_cookie(struct bio *bio)
> > +{
> > +	return bio->bi_iter.bi_private_data;
> > +}
> > +
> > +static int blk_mq_poll_io(struct bio *bio)
> > +{
> > +	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
> > +	blk_qc_t cookie = bio_get_poll_cookie(bio);
> > +	int ret = 0;
> > +
> > +	if (!bio_flagged(bio, BIO_DONE) && blk_qc_t_valid(cookie)) {
> > +		struct blk_mq_hw_ctx *hctx =
> > +			q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
> > +
> > +		ret += blk_mq_poll_hctx(q, hctx);
> > +	}
> > +	return ret;
> > +}
> > +
> > +static int blk_bio_poll_and_end_io(struct request_queue *q,
> > +		struct blk_bio_poll_ctx *poll_ctx)
> > +{
> > +	int ret = 0;
> > +	int i;
> > +
> > +	/*
> > +	 * Poll hw queue first.
> > +	 *
> > +	 * TODO: limit max poll times and make sure to not poll same
> > +	 * hw queue one more time.
> > +	 */
> > +	for (i = 0; i < poll_ctx->pq->max_nr_grps; i++) {
> > +		struct bio_grp_list_data *grp = &poll_ctx->pq->head[i];
> > +		struct bio *bio;
> > +
> > +		if (bio_grp_list_grp_empty(grp))
> > +			continue;
> > +
> > +		for (bio = grp->list.head; bio; bio = bio->bi_poll)
> > +			ret += blk_mq_poll_io(bio);
> > +	}
> > +
> > +	/* reap bios */
> > +	for (i = 0; i < poll_ctx->pq->max_nr_grps; i++) {
> > +		struct bio_grp_list_data *grp = &poll_ctx->pq->head[i];
> > +		struct bio *bio;
> > +		struct bio_list bl;
> > +
> > +		if (bio_grp_list_grp_empty(grp))
> > +			continue;
> > +
> > +		bio_list_init(&bl);
> > +
> > +		while ((bio = __bio_grp_list_pop(&grp->list))) {
> > +			if (bio_flagged(bio, BIO_DONE)) {
> > +
> > +				/* now recover original data */
> > +				bio->bi_poll = grp->grp_data;
> > +
> > +				/* clear BIO_END_BY_POLL and end me really */
> > +				bio_clear_flag(bio, BIO_END_BY_POLL);
> > +				bio_endio(bio);
> > +			} else {
> > +				__bio_grp_list_add(&bl, bio);
> > +			}
> > +		}
> > +		__bio_grp_list_merge(&grp->list, &bl);
> > +	}
> > +	return ret;
> > +}
> > +
> > +static int __blk_bio_poll_io(struct request_queue *q,
> > +		struct blk_bio_poll_ctx *submit_ctx,
> > +		struct blk_bio_poll_ctx *poll_ctx)
> > +{
> > +	/*
> > +	 * Move IO submission result from submission queue in submission
> > +	 * context to poll queue of poll context.
> > +	 */
> > +	spin_lock(&submit_ctx->sq_lock);
> > +	bio_grp_list_move(poll_ctx->pq, submit_ctx->sq);
> > +	spin_unlock(&submit_ctx->sq_lock);
> > +
> > +	return blk_bio_poll_and_end_io(q, poll_ctx);
> > +}
> > +
> > +static int blk_bio_poll_io(struct request_queue *q,
> > +		struct io_context *submit_ioc,
> > +		struct io_context *poll_ioc)
> > +{
> > +	struct blk_bio_poll_ctx *submit_ctx = submit_ioc->data;
> > +	struct blk_bio_poll_ctx *poll_ctx = poll_ioc->data;
> > +	int ret;
> > +
> > +	if (unlikely(atomic_read(&poll_ioc->nr_tasks) > 1)) {
> > +		mutex_lock(&poll_ctx->pq_lock);
> 
> Why mutex is used to protect pq here rather than spinlock? Where will

spinlock should be fine.

> the polling routine go to sleep?

The current blk_poll() can go to sleep really.

> 
> Besides, how to protect the concurrent bio_list operation to sq between
> producer (submission routine) and consumer (polling routine)? As far as

submit_ctx->sq_lock is held in __blk_bio_poll_io() for moving bios
from sq to pq, see __blk_bio_poll_io().

> I understand, pc->sq_lock is used to prevent concurrent access from
> multiple submission processes, while pc->pq_lock is used to prevent
> concurrent access from multiple polling processes.

Usually poll context needn't any lock except for shared io context,
because blk_bio_poll_ctx->pq is only accessed in poll context, and
it is still per-task.

> 
> 
> > +		ret = __blk_bio_poll_io(q, submit_ctx, poll_ctx);
> > +		mutex_unlock(&poll_ctx->pq_lock);
> > +	} else {
> > +		ret = __blk_bio_poll_io(q, submit_ctx, poll_ctx);
> > +	}
> > +	return ret;
> > +}
> > +
> > +static bool blk_bio_ioc_valid(struct task_struct *t)
> > +{
> > +	if (!t)
> > +		return false;
> > +
> > +	if (!t->io_context)
> > +		return false;
> > +
> > +	if (!t->io_context->data)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static int __blk_bio_poll(struct request_queue *q, blk_qc_t cookie)
> > +{
> > +	struct io_context *poll_ioc = current->io_context;
> > +	pid_t pid;
> > +	struct task_struct *submit_task;
> > +	int ret;
> > +
> > +	pid = (pid_t)cookie;
> > +
> > +	/* io poll often share io submission context */
> > +	if (likely(current->pid == pid && blk_bio_ioc_valid(current)))
> > +		return blk_bio_poll_io(q, poll_ioc, poll_ioc);
> > +
> 
> > +	submit_task = find_get_task_by_vpid(pid);
> 
> What if the process to which the returned cookie refers has exited?
> find_get_task_by_vpid() will return NULL, thus blk_poll() won't help
> reap anything, while maybe there are still bios in the poll context,
> waiting to be reaped.
> 
> Maybe we need to flush the poll context when a task detaches from the
> io_context.

Yeah, I know that issue, and just not address it in RFC stage.

It can be handled in the following way:

1) drain all bios in submission context until all bios are completed before
it exits since the code won't sleep.

OR

2) schedule wq for completing all submitted bios.

If poll context exits, and there is still bios not completed, not sure
if it can happen because the current in-tree code has the same issue.

> 
> 
> > +	if (likely(blk_bio_ioc_valid(submit_task)))
> > +		ret = blk_bio_poll_io(q, submit_task->io_context,
> > +				poll_ioc);
> 
> poll_ioc may be invalid in this case, since the previous
> blk_create_io_context() in blk_bio_poll() may fail.

Yeah, it can be addressed by above patch, 0 will be returned
for this case.


Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

