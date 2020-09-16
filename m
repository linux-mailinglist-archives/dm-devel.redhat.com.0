Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F026BAAE
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 05:40:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600227629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OEGW6sIynYrK5caCqdOr7nvUjkvTw+i5b9jIrlqjHyM=;
	b=N/jKSUEAF8xp/WuCKqZRjWaFH7wQDT1jOw73hCpeJUq8uZW8VczzMRHGWANfquYPxbRPWp
	WGXGyxX6WzcENzEcn8VbHv4gBdh7t6nyX+L8bHYuis+tzy/mRDonRixb8LE4hrWNElHL28
	50Ho6v+VRE9khQ9KBBEDC/PQadB8p5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-2rzFhy5oM7avFHJ3EElnTg-1; Tue, 15 Sep 2020 23:40:26 -0400
X-MC-Unique: 2rzFhy5oM7avFHJ3EElnTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F188802B7E;
	Wed, 16 Sep 2020 03:40:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 588DA7513B;
	Wed, 16 Sep 2020 03:40:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3812183D021;
	Wed, 16 Sep 2020 03:40:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G3dqYw032577 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 23:39:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF01A7EB74; Wed, 16 Sep 2020 03:39:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCF87BE76;
	Wed, 16 Sep 2020 03:39:46 +0000 (UTC)
Date: Tue, 15 Sep 2020 23:39:46 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200916033946.GB23236@redhat.com>
References: <20200915172357.83215-1-snitzer@redhat.com>
	<20200915172357.83215-5-snitzer@redhat.com>
	<20200916010817.GB791425@T590> <20200916012813.GA23236@redhat.com>
	<20200916014802.GC791425@T590>
MIME-Version: 1.0
In-Reply-To: <20200916014802.GC791425@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15 2020 at  9:48pm -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> On Tue, Sep 15, 2020 at 09:28:14PM -0400, Mike Snitzer wrote:
> > On Tue, Sep 15 2020 at  9:08pm -0400,
> > Ming Lei <ming.lei@redhat.com> wrote:
> > 
> > > On Tue, Sep 15, 2020 at 01:23:57PM -0400, Mike Snitzer wrote:
> > > > blk_queue_split() has become compulsory from .submit_bio -- regardless
> > > > of whether it is recursing.  Update DM core to always call
> > > > blk_queue_split().
> > > > 
> > > > dm_queue_split() is removed because __split_and_process_bio() handles
> > > > splitting as needed.
> > > > 
> > > > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > > > ---
> > > >  drivers/md/dm.c | 45 +--------------------------------------------
> > > >  1 file changed, 1 insertion(+), 44 deletions(-)
> > > > 
> > > > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > > > index fb0255d25e4b..0bae9f26dc8e 100644
> > > > --- a/drivers/md/dm.c
> > > > +++ b/drivers/md/dm.c
> > > > @@ -1530,22 +1530,6 @@ static int __send_write_zeroes(struct clone_info *ci, struct dm_target *ti)
> > > >  	return __send_changing_extent_only(ci, ti, get_num_write_zeroes_bios(ti));
> > > >  }
> > > >  
> > > > -static bool is_abnormal_io(struct bio *bio)
> > > > -{
> > > > -	bool r = false;
> > > > -
> > > > -	switch (bio_op(bio)) {
> > > > -	case REQ_OP_DISCARD:
> > > > -	case REQ_OP_SECURE_ERASE:
> > > > -	case REQ_OP_WRITE_SAME:
> > > > -	case REQ_OP_WRITE_ZEROES:
> > > > -		r = true;
> > > > -		break;
> > > > -	}
> > > > -
> > > > -	return r;
> > > > -}
> > > > -
> > > >  static bool __process_abnormal_io(struct clone_info *ci, struct dm_target *ti,
> > > >  				  int *result)
> > > >  {
> > > > @@ -1723,23 +1707,6 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
> > > >  	return ret;
> > > >  }
> > > >  
> > > > -static void dm_queue_split(struct mapped_device *md, struct dm_target *ti, struct bio **bio)
> > > > -{
> > > > -	unsigned len, sector_count;
> > > > -
> > > > -	sector_count = bio_sectors(*bio);
> > > > -	len = min_t(sector_t, max_io_len((*bio)->bi_iter.bi_sector, ti), sector_count);
> > > > -
> > > > -	if (sector_count > len) {
> > > > -		struct bio *split = bio_split(*bio, len, GFP_NOIO, &md->queue->bio_split);
> > > > -
> > > > -		bio_chain(split, *bio);
> > > > -		trace_block_split(md->queue, split, (*bio)->bi_iter.bi_sector);
> > > > -		submit_bio_noacct(*bio);
> > > > -		*bio = split;
> > > > -	}
> > > > -}
> > > > -
> > > >  static blk_qc_t dm_process_bio(struct mapped_device *md,
> > > >  			       struct dm_table *map, struct bio *bio)
> > > >  {
> > > > @@ -1759,17 +1726,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
> > > >  		}
> > > >  	}
> > > >  
> > > > -	/*
> > > > -	 * If in ->queue_bio we need to use blk_queue_split(), otherwise
> > > > -	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
> > > > -	 * won't be imposed.
> > > > -	 */
> > > > -	if (current->bio_list) {
> > > > -		if (is_abnormal_io(bio))
> > > > -			blk_queue_split(&bio);
> > > > -		else
> > > > -			dm_queue_split(md, ti, &bio);
> > > > -	}
> > > > +	blk_queue_split(&bio);
> > > 
> > > In max_io_len(), target boundary is taken into account when figuring out
> > > the max io len. However, this info won't be used any more after
> > > switching to blk_queue_split(). Is that one potential problem?
> > 
> > Thanks for your review.  But no, as the patch header says:
> > "dm_queue_split() is removed because __split_and_process_bio() handles
> > splitting as needed."
> > 
> > (__split_and_process_non_flush calls max_io_len, as does
> > __process_abnormal_io by calling __send_changing_extent_only)
> > 
> > SO the blk_queue_split() bio will be further split if needed (due to
> > DM target boundary, etc).
> 
> Thanks for your explanation.
> 
> Then looks there is double split issue since both blk_queue_split()
> and __split_and_process_non_flush() may split bio from same bioset(md->queue->bio_split),
> and this way may cause deadlock, see comment of bio_alloc_bioset(), especially
> the paragraph of 'callers must never allocate more than 1 bio at a time
> from this pool.'

Next sentence is:
"Callers that need to allocate more than 1 bio must always submit the
previously allocated bio for IO before attempting to allocate a new
one."

__split_and_process_non_flush -> __map_bio -> submit_bio_noacct
bio_split
submit_bio_noacct

With commit 18a25da84354c, NeilBrown wrote the __split_and_process_bio()
with an eye toward depth-first submission to avoid this deadlock you're
concerned about.  That commit header speaks to it directly.

I did go on to change Neil's code a bit with commit f21c601a2bb31 -- but
I _think_ the current code is still OK relative to bio_split mempool
use.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

