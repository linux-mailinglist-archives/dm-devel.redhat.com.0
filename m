Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C34FC91B
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 02:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649722165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sJRWmWcIbHhWUoJw3RN+oct19gTGFu3gCTDcV1wDxOQ=;
	b=fNHGFiz6swsrcGoKtJOcb9+3zhpdezhKEdb5GTZe6YKHegikGFvd7eMdq0sau2A/L1DiXS
	M7eUI4Q/afsJPsNtneKSnxgiIbmJE+aV4OkWFRAFVmQReMrjoXEV72fQAufEump/2IHt4U
	56MyS0ZXE8nXqlCKFYa2fk8L6+DE8O0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-If95e5kQNMWj8hlXv9fN6A-1; Mon, 11 Apr 2022 20:09:23 -0400
X-MC-Unique: If95e5kQNMWj8hlXv9fN6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C38F4811E90;
	Tue, 12 Apr 2022 00:09:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8C88111D78A;
	Tue, 12 Apr 2022 00:09:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2185D1940373;
	Tue, 12 Apr 2022 00:09:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E56081947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 00:09:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B8B3B40147F; Tue, 12 Apr 2022 00:09:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9181C54ACB9;
 Tue, 12 Apr 2022 00:09:14 +0000 (UTC)
Date: Tue, 12 Apr 2022 08:09:08 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YlTDJMxutPBszCg7@T590>
References: <8b9078c2-7884-a5b5-5aa9-ad284b4068ef@opensource.wdc.com>
 <YlN4BC2qbGODxbVz@T590>
 <95d8a8ed-27f8-0d88-a543-16910dca83e3@opensource.wdc.com>
 <YlN+plgvwZQdPBGj@T590>
 <7ccf1709-8aec-18c3-1d09-fe03b4a57017@opensource.wdc.com>
 <6b617a59-1591-8323-9de8-b39247eb328f@opensource.wdc.com>
 <YlPZ7vSZGMZBaRDv@T590>
 <54279bbe-6e8b-2c0a-90fc-825b89863b3f@opensource.wdc.com>
 <YlQ4na/HwBSm5C3U@T590>
 <869a7210-a0f0-4aae-3e90-cdfe30a72434@opensource.wdc.com>
MIME-Version: 1.0
In-Reply-To: <869a7210-a0f0-4aae-3e90-cdfe30a72434@opensource.wdc.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH 1/3] dm: don't grab target io reference in
 dm_zone_map_bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
 Mike Snitzer <snitzer@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 08:33:04AM +0900, Damien Le Moal wrote:
> On 4/11/22 23:18, Ming Lei wrote:
> >>>> This fixes the issue:
> >>>>
> >>>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> >>>> index 3c5fad7c4ee6..3dd6735450c5 100644
> >>>> --- a/drivers/md/dm.c
> >>>> +++ b/drivers/md/dm.c
> >>>> @@ -581,7 +581,7 @@ static struct dm_io *alloc_io(struct mapped_device
> >>>> *md, struct bio *bio)
> >>>>         io->status = 0;
> >>>>         atomic_set(&io->io_count, 1);
> >>>>         this_cpu_inc(*md->pending_io);
> >>>> -       io->orig_bio = NULL;
> >>>> +       io->orig_bio = bio;
> >>>>         io->md = md;
> >>>>         io->map_task = current;
> >>>>         spin_lock_init(&io->lock);
> >>>>
> >>>> Otherwise, the dm-zone.c code sees a NULL orig_bio.
> >>>> However, this change may be messing up the bio accounting. Need to check that.
> >>>
> >>> Looks it is one recent regression since:
> >>>
> >>> commit 0fbb4d93b38b ("dm: add dm_submit_bio_remap interface")
> >>
> >> Yep, saw that. Problem is, I really do not understand that change setting
> >> io->orig_bio *after* __map_bio() is called. It seems that the accounting
> >> is done on each fragment of the orig_bio instead of once for the entire
> >> BIO... So my "fix" above seems wrong. Apart from passing along orig_bio as
> >> an argument to  __map_bio() from __split_and_process_bio(), I do not think
> >> my change is correct. Thoughts ?
> > 
> > Frankly speaking, both changing ->orig_bio after split and setting ->orig_bio
> > after ->map() looks ugly & tricky, and the following change should avoid the
> > issue, meantime simplify dm accounting a bit:
> > 
> > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > index 3c5fad7c4ee6..f1fe83113608 100644
> > --- a/drivers/md/dm.c
> > +++ b/drivers/md/dm.c
> > @@ -581,7 +581,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
> >  	io->status = 0;
> >  	atomic_set(&io->io_count, 1);
> >  	this_cpu_inc(*md->pending_io);
> > -	io->orig_bio = NULL;
> > +	io->orig_bio = bio;
> >  	io->md = md;
> >  	io->map_task = current;
> >  	spin_lock_init(&io->lock);
> > @@ -1223,19 +1223,11 @@ void dm_submit_bio_remap(struct bio *clone, struct bio *tgt_clone)
> >  	 * Account io->origin_bio to DM dev on behalf of target
> >  	 * that took ownership of IO with DM_MAPIO_SUBMITTED.
> >  	 */
> > -	if (io->map_task == current) {
> > +	if (io->map_task == current)
> >  		/* Still in target's map function */
> >  		dm_io_set_flag(io, DM_IO_START_ACCT);
> > -	} else {
> > -		/*
> > -		 * Called by another thread, managed by DM target,
> > -		 * wait for dm_split_and_process_bio() to store
> > -		 * io->orig_bio
> > -		 */
> > -		while (unlikely(!smp_load_acquire(&io->orig_bio)))
> > -			msleep(1);
> > +	else
> 
> Curly brackets around the else here.
> 
> >  		dm_start_io_acct(io, clone);
> > -	}
> >  
> >  	__dm_submit_bio_remap(tgt_clone, disk_devt(io->md->disk),
> >  			      tio->old_sector);
> > @@ -1562,7 +1554,7 @@ static void dm_split_and_process_bio(struct mapped_device *md,
> >  				     struct dm_table *map, struct bio *bio)
> >  {
> >  	struct clone_info ci;
> > -	struct bio *orig_bio = NULL;
> > +	struct bio *new_bio = NULL;
> >  	int error = 0;
> >  
> >  	init_clone_info(&ci, md, map, bio);
> > @@ -1578,22 +1570,14 @@ static void dm_split_and_process_bio(struct mapped_device *md,
> >  	if (error || !ci.sector_count)
> >  		goto out;
> >  
> > -	/*
> > -	 * Remainder must be passed to submit_bio_noacct() so it gets handled
> > -	 * *after* bios already submitted have been completely processed.
> > -	 * We take a clone of the original to store in ci.io->orig_bio to be
> > -	 * used by dm_end_io_acct() and for dm_io_complete() to use for
> > -	 * completion handling.
> > -	 */
> 
> This comment should remain with some adjustment.

Fine, just felt the approach is very straightforward.

> 
> > -	orig_bio = bio_split(bio, bio_sectors(bio) - ci.sector_count,
> > -			     GFP_NOIO, &md->queue->bio_split);
> > -	bio_chain(orig_bio, bio);
> > -	trace_block_split(orig_bio, bio->bi_iter.bi_sector);
> > -	submit_bio_noacct(bio);
> > +	new_bio = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOIO,
> > +			&md->queue->bio_split);
> 
> Why not keep using bio_split() ?

With bio_split(), 'bio' actually tracks the remainder, and the returned
'orig_bio' tracks the part for current target io, so ->orig_bio has to
be updated in this way.

With bio_alloc_clone() and bio_trim(), ->orig_bio needn't to be
changed, and assigning it in alloc_io() works perfectly.

> 
> > +	bio_trim(new_bio, bio_sectors(bio) - ci.sector_count, ci.sector_count);
> > +	bio_trim(bio, 0, bio_sectors(bio) - ci.sector_count);
> > +	bio_chain(new_bio, bio);
> > +	trace_block_split(new_bio, new_bio->bi_iter.bi_sector);
> > +	submit_bio_noacct(new_bio);
> >  out:
> > -	if (!orig_bio)
> > -		orig_bio = bio;
> > -	smp_store_release(&ci.io->orig_bio, orig_bio);
> >  	if (dm_io_flagged(ci.io, DM_IO_START_ACCT))
> >  		dm_start_io_acct(ci.io, NULL);
> 
> I tested this and it works. Need to check the accounting though.
> And I agree this is a lot cleaner :)

BTW, the cloned bio for split is just for accounting purpose, if
->bi_iter.bi_sector & ->bi_iter.bi_size can be stored in 'struct dm_io',
the cloned bio can be avoided, but code may become not readable as
before.


Thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

