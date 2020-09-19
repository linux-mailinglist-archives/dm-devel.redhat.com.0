Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1D0270B7A
	for <lists+dm-devel@lfdr.de>; Sat, 19 Sep 2020 09:32:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-g4gfoyzVOi-GllHdQnSDxA-1; Sat, 19 Sep 2020 03:32:42 -0400
X-MC-Unique: g4gfoyzVOi-GllHdQnSDxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 835EA1074651;
	Sat, 19 Sep 2020 07:32:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B84355D9D5;
	Sat, 19 Sep 2020 07:32:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87699183D046;
	Sat, 19 Sep 2020 07:32:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08J7Vt0D011579 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 03:31:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EC912157F26; Sat, 19 Sep 2020 07:31:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4BC2157F24
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 07:31:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2465A858280
	for <dm-devel@redhat.com>; Sat, 19 Sep 2020 07:31:53 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-46-K2uMNDFHMn2VUnudngGASA-1;
	Sat, 19 Sep 2020 03:31:48 -0400
X-MC-Unique: K2uMNDFHMn2VUnudngGASA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 544E068BEB; Sat, 19 Sep 2020 09:31:45 +0200 (CEST)
Date: Sat, 19 Sep 2020 09:31:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200919073145.GA8514@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-7-hch@lst.de>
	<20200917103540.GL7347@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200917103540.GL7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 06/12] block: lift setting the readahead size
 into the block layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 17, 2020 at 12:35:40PM +0200, Jan Kara wrote:
> > diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> > index 81722cdcf0cb21..95eb35324e1a61 100644
> > --- a/block/blk-sysfs.c
> > +++ b/block/blk-sysfs.c
> > @@ -245,7 +245,6 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
> >  
> >  	spin_lock_irq(&q->queue_lock);
> >  	q->limits.max_sectors = max_sectors_kb << 1;
> > -	q->backing_dev_info->io_pages = max_sectors_kb >> (PAGE_SHIFT - 10);
> >  	spin_unlock_irq(&q->queue_lock);
> 
> So do I get it right that readahead won't now be limited if you store lower
> value to max_sectors? Why? I'd consider io_pages a "cached value" of
> max_sectors and thus expect it to change together with max_sectors...

Most to start untangling the bdi from the queue.  But I had to peddle
back on that in the follow on series anyway, so I can add this back.

> > @@ -812,7 +813,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
> >  		disk->flags |= GENHD_FL_SUPPRESS_PARTITION_INFO;
> >  		disk->flags |= GENHD_FL_NO_PART_SCAN;
> >  	} else {
> > -		struct backing_dev_info *bdi = disk->queue->backing_dev_info;
> > +		struct backing_dev_info *bdi = q->backing_dev_info;
> >  		struct device *dev = disk_to_dev(disk);
> >  		int ret;
> 
> Not sure how/why these changes got here... Not that I care too much :)

Because more changes in this area in earlier versions of the patches.
But yes, this shouldn't be here, so I'll drop it.

> > @@ -407,7 +406,6 @@ aoeblk_gdalloc(void *vp)
> >  	WARN_ON(d->gd);
> >  	WARN_ON(d->flags & DEVFL_UP);
> >  	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
> > -	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
> >  	d->bufpool = mp;
> >  	d->blkq = gd->queue = q;
> >  	q->queuedata = d;
> 
> Shouldn't AOE set 2MB optimal IO size so that readahead is equivalent to
> previous behavior?

Sure, I'll add a separate patch just for that.

> > diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> > index 1bbdc410ee3c51..ff2101d56cd7f1 100644
> > --- a/drivers/md/bcache/super.c
> > +++ b/drivers/md/bcache/super.c
> > @@ -1427,10 +1427,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
> >  	if (ret)
> >  		return ret;
> >  
> > -	dc->disk.disk->queue->backing_dev_info->ra_pages =
> > -		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
> > -		    q->backing_dev_info->ra_pages);
> > -
> 
> So bcache is basically stacking readahead here on top of underlying cache
> device. I don't see this being replicated by your patch so it is lost now?
> Probably this should be replaced by properly inheriting optimal IO size?

Yes, I'll add another patch.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

