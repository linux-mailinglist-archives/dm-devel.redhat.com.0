Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 415F726D928
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 12:36:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-uxCGudbMPt-vPyeBn1hD9w-1; Thu, 17 Sep 2020 06:36:16 -0400
X-MC-Unique: uxCGudbMPt-vPyeBn1hD9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE521009456;
	Thu, 17 Sep 2020 10:36:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6521B19D6C;
	Thu, 17 Sep 2020 10:36:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82DB28C7D1;
	Thu, 17 Sep 2020 10:35:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HAZoq4019201 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 06:35:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1525E202450A; Thu, 17 Sep 2020 10:35:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F142200A4F4
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 10:35:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A097D85828E
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 10:35:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-391-KOYaCUDQO3W8kwnfLIdYIg-1;
	Thu, 17 Sep 2020 06:35:43 -0400
X-MC-Unique: KOYaCUDQO3W8kwnfLIdYIg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0F193AF74;
	Thu, 17 Sep 2020 10:36:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id E12DF1E12E1; Thu, 17 Sep 2020 12:35:40 +0200 (CEST)
Date: Thu, 17 Sep 2020 12:35:40 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917103540.GL7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:26, Christoph Hellwig wrote:
> Drivers shouldn't really mess with the readahead size, as that is a VM
> concept.  Instead set it based on the optimal I/O size by lifting the
> algorithm from the md driver when registering the disk.  Also set
> bdi->io_pages there as well by applying the same scheme based on
> max_sectors.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c         |  5 ++---
>  block/blk-sysfs.c            | 10 +++++++++-
>  block/genhd.c                |  5 +++--
>  drivers/block/aoe/aoeblk.c   |  2 --
>  drivers/block/drbd/drbd_nl.c | 12 +-----------
>  drivers/md/bcache/super.c    |  4 ----
>  drivers/md/dm-table.c        |  3 ---
>  drivers/md/raid0.c           | 16 ----------------
>  drivers/md/raid10.c          | 24 +-----------------------
>  drivers/md/raid5.c           | 13 +------------
>  10 files changed, 17 insertions(+), 77 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 76a7e03bcd6cac..01049e9b998f1d 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -452,6 +452,8 @@ EXPORT_SYMBOL(blk_limits_io_opt);
>  void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
>  {
>  	blk_limits_io_opt(&q->limits, opt);
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
>  }
>  EXPORT_SYMBOL(blk_queue_io_opt);
>  
> @@ -628,9 +630,6 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  		printk(KERN_NOTICE "%s: Warning: Device %s is misaligned\n",
>  		       top, bottom);
>  	}
> -
> -	t->backing_dev_info->io_pages =
> -		t->limits.max_sectors >> (PAGE_SHIFT - 9);
>  }
>  EXPORT_SYMBOL(disk_stack_limits);
>  
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 81722cdcf0cb21..95eb35324e1a61 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -245,7 +245,6 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
>  
>  	spin_lock_irq(&q->queue_lock);
>  	q->limits.max_sectors = max_sectors_kb << 1;
> -	q->backing_dev_info->io_pages = max_sectors_kb >> (PAGE_SHIFT - 10);
>  	spin_unlock_irq(&q->queue_lock);

So do I get it right that readahead won't now be limited if you store lower
value to max_sectors? Why? I'd consider io_pages a "cached value" of
max_sectors and thus expect it to change together with max_sectors...

> @@ -854,6 +853,15 @@ int blk_register_queue(struct gendisk *disk)
>  		percpu_ref_switch_to_percpu(&q->q_usage_counter);
>  	}
>  
> +	/*
> +	 * For read-ahead of large files to be effective, we need to read ahead
> +	 * at least twice the optimal I/O size.
> +	 */
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
> +	q->backing_dev_info->io_pages =
> +		queue_max_sectors(q) >> (PAGE_SHIFT - 9);
> +
>  	ret = blk_trace_init_sysfs(dev);
>  	if (ret)
>  		return ret;
> diff --git a/block/genhd.c b/block/genhd.c
> index 081f1039d9367f..db311a14ddc71a 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -772,6 +772,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  			      const struct attribute_group **groups,
>  			      bool register_queue)
>  {
> +	struct request_queue *q = disk->queue;
>  	dev_t devt;
>  	int retval;
>  
> @@ -782,7 +783,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  	 * registration.
>  	 */
>  	if (register_queue)
> -		elevator_init_mq(disk->queue);
> +		elevator_init_mq(q);
>  
>  	/* minors == 0 indicates to use ext devt from part0 and should
>  	 * be accompanied with EXT_DEVT flag.  Make sure all
> @@ -812,7 +813,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
>  		disk->flags |= GENHD_FL_SUPPRESS_PARTITION_INFO;
>  		disk->flags |= GENHD_FL_NO_PART_SCAN;
>  	} else {
> -		struct backing_dev_info *bdi = disk->queue->backing_dev_info;
> +		struct backing_dev_info *bdi = q->backing_dev_info;
>  		struct device *dev = disk_to_dev(disk);
>  		int ret;

Not sure how/why these changes got here... Not that I care too much :)

>  
> diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
> index 5ca7216e9e01f3..89b33b402b4e52 100644
> --- a/drivers/block/aoe/aoeblk.c
> +++ b/drivers/block/aoe/aoeblk.c
> @@ -347,7 +347,6 @@ aoeblk_gdalloc(void *vp)
>  	mempool_t *mp;
>  	struct request_queue *q;
>  	struct blk_mq_tag_set *set;
> -	enum { KB = 1024, MB = KB * KB, READ_AHEAD = 2 * MB, };
>  	ulong flags;
>  	int late = 0;
>  	int err;
> @@ -407,7 +406,6 @@ aoeblk_gdalloc(void *vp)
>  	WARN_ON(d->gd);
>  	WARN_ON(d->flags & DEVFL_UP);
>  	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
> -	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
>  	d->bufpool = mp;
>  	d->blkq = gd->queue = q;
>  	q->queuedata = d;

Shouldn't AOE set 2MB optimal IO size so that readahead is equivalent to
previous behavior?

> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 1bbdc410ee3c51..ff2101d56cd7f1 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1427,10 +1427,6 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  	if (ret)
>  		return ret;
>  
> -	dc->disk.disk->queue->backing_dev_info->ra_pages =
> -		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
> -		    q->backing_dev_info->ra_pages);
> -

So bcache is basically stacking readahead here on top of underlying cache
device. I don't see this being replicated by your patch so it is lost now?
Probably this should be replaced by properly inheriting optimal IO size?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

