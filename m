Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E29926BE84
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 09:52:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600242724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EIc6W2s3KR80LmyKHfTTFhTlLu7hfoRxBKvui88d5bk=;
	b=iLe8WBpnNT6IGqHuMeGuRMlMHlZPPoWoBCWNL/GRA14m4RF/IrjKOnHx0ErwiALfzW30xV
	dGiPFDP4IDbwO4FODV9U7gQATXvRbj0SW2BJijgfSs7JzFp7zsoN5lDauWKFAxS/bgRbBd
	nC8g+ys1mfd3xm/yJODAmIrIEL7nMn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-1Mctu1JBNq-MFLCW0uvenA-1; Wed, 16 Sep 2020 03:52:02 -0400
X-MC-Unique: 1Mctu1JBNq-MFLCW0uvenA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9474F1868420;
	Wed, 16 Sep 2020 07:51:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C58219C71;
	Wed, 16 Sep 2020 07:51:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E8FB183D029;
	Wed, 16 Sep 2020 07:51:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G7pJER027446 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 03:51:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27AD267CF0; Wed, 16 Sep 2020 07:51:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-18.pek2.redhat.com [10.72.12.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53F767CFF;
	Wed, 16 Sep 2020 07:51:06 +0000 (UTC)
Date: Wed, 16 Sep 2020 15:51:02 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200916075102.GD791425@T590>
References: <20200915172357.83215-1-snitzer@redhat.com>
	<20200915172357.83215-5-snitzer@redhat.com>
	<20200916010817.GB791425@T590> <20200916012813.GA23236@redhat.com>
	<20200916014802.GC791425@T590> <20200916033946.GB23236@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200916033946.GB23236@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH v2 4/4] dm: unconditionally call
 blk_queue_split() in dm_process_bio()
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

On Tue, Sep 15, 2020 at 11:39:46PM -0400, Mike Snitzer wrote:
> On Tue, Sep 15 2020 at  9:48pm -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > On Tue, Sep 15, 2020 at 09:28:14PM -0400, Mike Snitzer wrote:
> > > On Tue, Sep 15 2020 at  9:08pm -0400,
> > > Ming Lei <ming.lei@redhat.com> wrote:
> > > 
> > > > On Tue, Sep 15, 2020 at 01:23:57PM -0400, Mike Snitzer wrote:
> > > > > blk_queue_split() has become compulsory from .submit_bio -- regardless
> > > > > of whether it is recursing.  Update DM core to always call
> > > > > blk_queue_split().
> > > > > 
> > > > > dm_queue_split() is removed because __split_and_process_bio() handles
> > > > > splitting as needed.
> > > > > 
> > > > > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > > > > ---
> > > > >  drivers/md/dm.c | 45 +--------------------------------------------
> > > > >  1 file changed, 1 insertion(+), 44 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > > > > index fb0255d25e4b..0bae9f26dc8e 100644
> > > > > --- a/drivers/md/dm.c
> > > > > +++ b/drivers/md/dm.c
> > > > > @@ -1530,22 +1530,6 @@ static int __send_write_zeroes(struct clone_info *ci, struct dm_target *ti)
> > > > >  	return __send_changing_extent_only(ci, ti, get_num_write_zeroes_bios(ti));
> > > > >  }
> > > > >  
> > > > > -static bool is_abnormal_io(struct bio *bio)
> > > > > -{
> > > > > -	bool r = false;
> > > > > -
> > > > > -	switch (bio_op(bio)) {
> > > > > -	case REQ_OP_DISCARD:
> > > > > -	case REQ_OP_SECURE_ERASE:
> > > > > -	case REQ_OP_WRITE_SAME:
> > > > > -	case REQ_OP_WRITE_ZEROES:
> > > > > -		r = true;
> > > > > -		break;
> > > > > -	}
> > > > > -
> > > > > -	return r;
> > > > > -}
> > > > > -
> > > > >  static bool __process_abnormal_io(struct clone_info *ci, struct dm_target *ti,
> > > > >  				  int *result)
> > > > >  {
> > > > > @@ -1723,23 +1707,6 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
> > > > >  	return ret;
> > > > >  }
> > > > >  
> > > > > -static void dm_queue_split(struct mapped_device *md, struct dm_target *ti, struct bio **bio)
> > > > > -{
> > > > > -	unsigned len, sector_count;
> > > > > -
> > > > > -	sector_count = bio_sectors(*bio);
> > > > > -	len = min_t(sector_t, max_io_len((*bio)->bi_iter.bi_sector, ti), sector_count);
> > > > > -
> > > > > -	if (sector_count > len) {
> > > > > -		struct bio *split = bio_split(*bio, len, GFP_NOIO, &md->queue->bio_split);
> > > > > -
> > > > > -		bio_chain(split, *bio);
> > > > > -		trace_block_split(md->queue, split, (*bio)->bi_iter.bi_sector);
> > > > > -		submit_bio_noacct(*bio);
> > > > > -		*bio = split;
> > > > > -	}
> > > > > -}
> > > > > -
> > > > >  static blk_qc_t dm_process_bio(struct mapped_device *md,
> > > > >  			       struct dm_table *map, struct bio *bio)
> > > > >  {
> > > > > @@ -1759,17 +1726,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
> > > > >  		}
> > > > >  	}
> > > > >  
> > > > > -	/*
> > > > > -	 * If in ->queue_bio we need to use blk_queue_split(), otherwise
> > > > > -	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
> > > > > -	 * won't be imposed.
> > > > > -	 */
> > > > > -	if (current->bio_list) {
> > > > > -		if (is_abnormal_io(bio))
> > > > > -			blk_queue_split(&bio);
> > > > > -		else
> > > > > -			dm_queue_split(md, ti, &bio);
> > > > > -	}
> > > > > +	blk_queue_split(&bio);
> > > > 
> > > > In max_io_len(), target boundary is taken into account when figuring out
> > > > the max io len. However, this info won't be used any more after
> > > > switching to blk_queue_split(). Is that one potential problem?
> > > 
> > > Thanks for your review.  But no, as the patch header says:
> > > "dm_queue_split() is removed because __split_and_process_bio() handles
> > > splitting as needed."
> > > 
> > > (__split_and_process_non_flush calls max_io_len, as does
> > > __process_abnormal_io by calling __send_changing_extent_only)
> > > 
> > > SO the blk_queue_split() bio will be further split if needed (due to
> > > DM target boundary, etc).
> > 
> > Thanks for your explanation.
> > 
> > Then looks there is double split issue since both blk_queue_split()
> > and __split_and_process_non_flush() may split bio from same bioset(md->queue->bio_split),
> > and this way may cause deadlock, see comment of bio_alloc_bioset(), especially
> > the paragraph of 'callers must never allocate more than 1 bio at a time
> > from this pool.'
> 
> Next sentence is:
> "Callers that need to allocate more than 1 bio must always submit the
> previously allocated bio for IO before attempting to allocate a new
> one."

Yeah, I know that. This sentence actually means that the previous
submission should make forward progress, then the bio may be completed &
freed, so that new allocation can move on.

However, in this situation, __split_and_process_non_flush() doesn't
provide such forward progress, see below.

> 
> __split_and_process_non_flush -> __map_bio -> submit_bio_noacct
> bio_split
> submit_bio_noacct

Yeah, the above submission is done on clone bio & underlying queue. What
matters is if the submission can make forward progress. After
__split_and_process_non_flush() returns, the splitted 'bio'(original bio)
can't be done by previous submission because this bio won't be freed until
dec_pending() from __split_and_process_bio() returns.

So when ci.sector_count doesn't become zero, bio_split() is called again from
the same bio_set for allocating new bio, the allocation may never be made because
the original bio allocated from the same bio_set can't be freed during bio_split().

Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

