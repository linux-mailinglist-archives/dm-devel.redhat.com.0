Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91143700EF3
	for <lists+dm-devel@lfdr.de>; Fri, 12 May 2023 20:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683916667;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9O1fBt+peY3gsFV7FHnHK2FLTzH8wwLzsTbiaNb5+PM=;
	b=FsTWCXGzfw/LBxJJZk8d02UwAColveEYHliVd1l93qur8DDa75JfwtqpNrpax3AhyrS3Zb
	cxZ6e2La8e61CG6qrkuXK+jhDdJNFpZyt8Y7/56lUwEP9ARp5gq04MufDcWLaqv3RH/HzE
	Q4MZFXGAyHu6jdjoM31gEAOAqLaa24w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-g9H1JATFPXGirOY9RqYgTA-1; Fri, 12 May 2023 14:37:45 -0400
X-MC-Unique: g9H1JATFPXGirOY9RqYgTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED0B38123B1;
	Fri, 12 May 2023 18:37:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92AFF63F5F;
	Fri, 12 May 2023 18:37:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A83B19451EB;
	Fri, 12 May 2023 18:37:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3F0019451E3
 for <dm-devel@listman.corp.redhat.com>; Fri, 12 May 2023 18:37:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 997C8492B07; Fri, 12 May 2023 18:37:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B94492C13
 for <dm-devel@redhat.com>; Fri, 12 May 2023 18:37:36 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7277838123BB
 for <dm-devel@redhat.com>; Fri, 12 May 2023 18:37:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-nDL0FCFmPEq4o9H9pi9-jw-1; Fri, 12 May 2023 14:37:32 -0400
X-MC-Unique: nDL0FCFmPEq4o9H9pi9-jw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51C4A65820;
 Fri, 12 May 2023 18:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFC8C433D2;
 Fri, 12 May 2023 18:37:30 +0000 (UTC)
Date: Fri, 12 May 2023 11:37:29 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>
Message-ID: <20230512183729.GE858791@frogsfrogsfrogs>
References: <20230420004850.297045-1-sarthakkukreti@chromium.org>
 <20230506062909.74601-1-sarthakkukreti@chromium.org>
 <20230506062909.74601-3-sarthakkukreti@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230506062909.74601-3-sarthakkukreti@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH v6 2/5] block: Introduce provisioning
 primitives
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
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Theodore Ts'o <tytso@mit.edu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 05, 2023 at 11:29:06PM -0700, Sarthak Kukreti wrote:
> Introduce block request REQ_OP_PROVISION. The intent of this request
> is to request underlying storage to preallocate disk space for the given
> block range. Block devices that support this capability will export
> a provision limit within their request queues.
> 
> This patch also adds the capability to call fallocate() in mode 0
> on block devices, which will send REQ_OP_PROVISION to the block
> device for the specified range,
> 
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
> ---
>  block/blk-core.c          |  5 ++++
>  block/blk-lib.c           | 53 +++++++++++++++++++++++++++++++++++++++
>  block/blk-merge.c         | 18 +++++++++++++
>  block/blk-settings.c      | 19 ++++++++++++++
>  block/blk-sysfs.c         |  9 +++++++
>  block/bounce.c            |  1 +
>  block/fops.c              | 10 +++++++-
>  include/linux/bio.h       |  6 +++--
>  include/linux/blk_types.h |  5 +++-
>  include/linux/blkdev.h    | 16 ++++++++++++
>  10 files changed, 138 insertions(+), 4 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 42926e6cb83c..4a2342ba3a8b 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -123,6 +123,7 @@ static const char *const blk_op_name[] = {
>  	REQ_OP_NAME(WRITE_ZEROES),
>  	REQ_OP_NAME(DRV_IN),
>  	REQ_OP_NAME(DRV_OUT),
> +	REQ_OP_NAME(PROVISION)
>  };
>  #undef REQ_OP_NAME
>  
> @@ -798,6 +799,10 @@ void submit_bio_noacct(struct bio *bio)
>  		if (!q->limits.max_write_zeroes_sectors)
>  			goto not_supported;
>  		break;
> +	case REQ_OP_PROVISION:
> +		if (!q->limits.max_provision_sectors)
> +			goto not_supported;
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index e59c3069e835..647b6451660b 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -343,3 +343,56 @@ int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
>  	return ret;
>  }
>  EXPORT_SYMBOL(blkdev_issue_secure_erase);
> +
> +/**
> + * blkdev_issue_provision - provision a block range
> + * @bdev:	blockdev to write
> + * @sector:	start sector
> + * @nr_sects:	number of sectors to provision
> + * @gfp_mask:	memory allocation flags (for bio_alloc)
> + *
> + * Description:
> + *  Issues a provision request to the block device for the range of sectors.
> + *  For thinly provisioned block devices, this acts as a signal for the
> + *  underlying storage pool to allocate space for this block range.
> + */
> +int blkdev_issue_provision(struct block_device *bdev, sector_t sector,
> +		sector_t nr_sects, gfp_t gfp)
> +{
> +	sector_t bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
> +	unsigned int max_sectors = bdev_max_provision_sectors(bdev);
> +	struct bio *bio = NULL;
> +	struct blk_plug plug;
> +	int ret = 0;
> +
> +	if (max_sectors == 0)
> +		return -EOPNOTSUPP;
> +	if ((sector | nr_sects) & bs_mask)
> +		return -EINVAL;
> +	if (bdev_read_only(bdev))
> +		return -EPERM;
> +
> +	blk_start_plug(&plug);
> +	for (;;) {
> +		unsigned int req_sects = min_t(sector_t, nr_sects, max_sectors);
> +
> +		bio = blk_next_bio(bio, bdev, 0, REQ_OP_PROVISION, gfp);
> +		bio->bi_iter.bi_sector = sector;
> +		bio->bi_iter.bi_size = req_sects << SECTOR_SHIFT;
> +
> +		sector += req_sects;
> +		nr_sects -= req_sects;
> +		if (!nr_sects) {
> +			ret = submit_bio_wait(bio);
> +			if (ret == -EOPNOTSUPP)
> +				ret = 0;

Why do we convert EOPNOTSUPP to success here?  If the device suddenly
forgets how to provision space, wouldn't we want to pass that up to the
caller?

(I'm not sure when this would happen -- perhaps the bdev has the general
provisioning capability but not for the specific range requested?)

The rest of the patch looks ok to me.

--D

> +			bio_put(bio);
> +			break;
> +		}
> +		cond_resched();
> +	}
> +	blk_finish_plug(&plug);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(blkdev_issue_provision);
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index 6460abdb2426..a3ffebb97a1d 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -158,6 +158,21 @@ static struct bio *bio_split_write_zeroes(struct bio *bio,
>  	return bio_split(bio, lim->max_write_zeroes_sectors, GFP_NOIO, bs);
>  }
>  
> +static struct bio *bio_split_provision(struct bio *bio,
> +					const struct queue_limits *lim,
> +					unsigned int *nsegs, struct bio_set *bs)
> +{
> +	*nsegs = 0;
> +
> +	if (!lim->max_provision_sectors)
> +		return NULL;
> +
> +	if (bio_sectors(bio) <= lim->max_provision_sectors)
> +		return NULL;
> +
> +	return bio_split(bio, lim->max_provision_sectors, GFP_NOIO, bs);
> +}
> +
>  /*
>   * Return the maximum number of sectors from the start of a bio that may be
>   * submitted as a single request to a block device. If enough sectors remain,
> @@ -366,6 +381,9 @@ struct bio *__bio_split_to_limits(struct bio *bio,
>  	case REQ_OP_WRITE_ZEROES:
>  		split = bio_split_write_zeroes(bio, lim, nr_segs, bs);
>  		break;
> +	case REQ_OP_PROVISION:
> +		split = bio_split_provision(bio, lim, nr_segs, bs);
> +		break;
>  	default:
>  		split = bio_split_rw(bio, lim, nr_segs, bs,
>  				get_max_io_size(bio, lim) << SECTOR_SHIFT);
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 896b4654ab00..d303e6614c36 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -59,6 +59,7 @@ void blk_set_default_limits(struct queue_limits *lim)
>  	lim->zoned = BLK_ZONED_NONE;
>  	lim->zone_write_granularity = 0;
>  	lim->dma_alignment = 511;
> +	lim->max_provision_sectors = 0;
>  }
>  
>  /**
> @@ -82,6 +83,7 @@ void blk_set_stacking_limits(struct queue_limits *lim)
>  	lim->max_dev_sectors = UINT_MAX;
>  	lim->max_write_zeroes_sectors = UINT_MAX;
>  	lim->max_zone_append_sectors = UINT_MAX;
> +	lim->max_provision_sectors = UINT_MAX;
>  }
>  EXPORT_SYMBOL(blk_set_stacking_limits);
>  
> @@ -208,6 +210,20 @@ void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
>  }
>  EXPORT_SYMBOL(blk_queue_max_write_zeroes_sectors);
>  
> +/**
> + * blk_queue_max_provision_sectors - set max sectors for a single provision
> + *
> + * @q:  the request queue for the device
> + * @max_provision_sectors: maximum number of sectors to provision per command
> + **/
> +
> +void blk_queue_max_provision_sectors(struct request_queue *q,
> +		unsigned int max_provision_sectors)
> +{
> +	q->limits.max_provision_sectors = max_provision_sectors;
> +}
> +EXPORT_SYMBOL(blk_queue_max_provision_sectors);
> +
>  /**
>   * blk_queue_max_zone_append_sectors - set max sectors for a single zone append
>   * @q:  the request queue for the device
> @@ -578,6 +594,9 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  	t->max_segment_size = min_not_zero(t->max_segment_size,
>  					   b->max_segment_size);
>  
> +	t->max_provision_sectors = min_not_zero(t->max_provision_sectors,
> +						b->max_provision_sectors);
> +
>  	t->misaligned |= b->misaligned;
>  
>  	alignment = queue_limit_alignment_offset(b, start);
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index f1fce1c7fa44..0a3165211c66 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -213,6 +213,13 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
>  	return queue_var_show(0, page);
>  }
>  
> +static ssize_t queue_provision_max_show(struct request_queue *q,
> +		char *page)
> +{
> +	return sprintf(page, "%llu\n",
> +		(unsigned long long)q->limits.max_provision_sectors << 9);
> +}
> +
>  static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
>  {
>  	return queue_var_show(0, page);
> @@ -604,6 +611,7 @@ QUEUE_RO_ENTRY(queue_discard_max_hw, "discard_max_hw_bytes");
>  QUEUE_RW_ENTRY(queue_discard_max, "discard_max_bytes");
>  QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
>  
> +QUEUE_RO_ENTRY(queue_provision_max, "provision_max_bytes");
>  QUEUE_RO_ENTRY(queue_write_same_max, "write_same_max_bytes");
>  QUEUE_RO_ENTRY(queue_write_zeroes_max, "write_zeroes_max_bytes");
>  QUEUE_RO_ENTRY(queue_zone_append_max, "zone_append_max_bytes");
> @@ -661,6 +669,7 @@ static struct attribute *queue_attrs[] = {
>  	&queue_discard_max_entry.attr,
>  	&queue_discard_max_hw_entry.attr,
>  	&queue_discard_zeroes_data_entry.attr,
> +	&queue_provision_max_entry.attr,
>  	&queue_write_same_max_entry.attr,
>  	&queue_write_zeroes_max_entry.attr,
>  	&queue_zone_append_max_entry.attr,
> diff --git a/block/bounce.c b/block/bounce.c
> index 7cfcb242f9a1..ab9d8723ae64 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -176,6 +176,7 @@ static struct bio *bounce_clone_bio(struct bio *bio_src)
>  	case REQ_OP_DISCARD:
>  	case REQ_OP_SECURE_ERASE:
>  	case REQ_OP_WRITE_ZEROES:
> +	case REQ_OP_PROVISION:
>  		break;
>  	default:
>  		bio_for_each_segment(bv, bio_src, iter)
> diff --git a/block/fops.c b/block/fops.c
> index 4c70fdc546e7..be2e41f160bf 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -613,7 +613,8 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  
>  #define	BLKDEV_FALLOC_FL_SUPPORTED					\
>  		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
> -		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_NO_HIDE_STALE)
> +		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_NO_HIDE_STALE |	\
> +		 FALLOC_FL_UNSHARE_RANGE)
>  
>  static long blkdev_fallocate(struct file *file, int mode, loff_t start,
>  			     loff_t len)
> @@ -653,6 +654,13 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
>  	 * de-allocate mode calls to fallocate().
>  	 */
>  	switch (mode) {
> +	case 0:
> +	case FALLOC_FL_UNSHARE_RANGE:
> +	case FALLOC_FL_KEEP_SIZE:
> +	case FALLOC_FL_UNSHARE_RANGE | FALLOC_FL_KEEP_SIZE:
> +		error = blkdev_issue_provision(bdev, start >> SECTOR_SHIFT,
> +					       len >> SECTOR_SHIFT, GFP_KERNEL);
> +		break;
>  	case FALLOC_FL_ZERO_RANGE:
>  	case FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE:
>  		error = truncate_bdev_range(bdev, file->f_mode, start, end);
> diff --git a/include/linux/bio.h b/include/linux/bio.h
> index d766be7152e1..9820b3b039f2 100644
> --- a/include/linux/bio.h
> +++ b/include/linux/bio.h
> @@ -57,7 +57,8 @@ static inline bool bio_has_data(struct bio *bio)
>  	    bio->bi_iter.bi_size &&
>  	    bio_op(bio) != REQ_OP_DISCARD &&
>  	    bio_op(bio) != REQ_OP_SECURE_ERASE &&
> -	    bio_op(bio) != REQ_OP_WRITE_ZEROES)
> +	    bio_op(bio) != REQ_OP_WRITE_ZEROES &&
> +	    bio_op(bio) != REQ_OP_PROVISION)
>  		return true;
>  
>  	return false;
> @@ -67,7 +68,8 @@ static inline bool bio_no_advance_iter(const struct bio *bio)
>  {
>  	return bio_op(bio) == REQ_OP_DISCARD ||
>  	       bio_op(bio) == REQ_OP_SECURE_ERASE ||
> -	       bio_op(bio) == REQ_OP_WRITE_ZEROES;
> +	       bio_op(bio) == REQ_OP_WRITE_ZEROES ||
> +	       bio_op(bio) == REQ_OP_PROVISION;
>  }
>  
>  static inline void *bio_data(struct bio *bio)
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 99be590f952f..27bdf88f541c 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -385,7 +385,10 @@ enum req_op {
>  	REQ_OP_DRV_IN		= (__force blk_opf_t)34,
>  	REQ_OP_DRV_OUT		= (__force blk_opf_t)35,
>  
> -	REQ_OP_LAST		= (__force blk_opf_t)36,
> +	/* request device to provision block */
> +	REQ_OP_PROVISION        = (__force blk_opf_t)37,
> +
> +	REQ_OP_LAST		= (__force blk_opf_t)38,
>  };
>  
>  enum req_flag_bits {
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 941304f17492..239e2f418b6e 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -303,6 +303,7 @@ struct queue_limits {
>  	unsigned int		discard_granularity;
>  	unsigned int		discard_alignment;
>  	unsigned int		zone_write_granularity;
> +	unsigned int		max_provision_sectors;
>  
>  	unsigned short		max_segments;
>  	unsigned short		max_integrity_segments;
> @@ -921,6 +922,8 @@ extern void blk_queue_max_discard_sectors(struct request_queue *q,
>  		unsigned int max_discard_sectors);
>  extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
>  		unsigned int max_write_same_sectors);
> +extern void blk_queue_max_provision_sectors(struct request_queue *q,
> +		unsigned int max_provision_sectors);
>  extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
>  extern void blk_queue_max_zone_append_sectors(struct request_queue *q,
>  		unsigned int max_zone_append_sectors);
> @@ -1060,6 +1063,9 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>  int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
>  		sector_t nr_sects, gfp_t gfp);
>  
> +extern int blkdev_issue_provision(struct block_device *bdev, sector_t sector,
> +		sector_t nr_sects, gfp_t gfp_mask);
> +
>  #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
>  #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
>  
> @@ -1139,6 +1145,11 @@ static inline unsigned short queue_max_discard_segments(const struct request_que
>  	return q->limits.max_discard_segments;
>  }
>  
> +static inline unsigned short queue_max_provision_sectors(const struct request_queue *q)
> +{
> +	return q->limits.max_provision_sectors;
> +}
> +
>  static inline unsigned int queue_max_segment_size(const struct request_queue *q)
>  {
>  	return q->limits.max_segment_size;
> @@ -1281,6 +1292,11 @@ static inline bool bdev_nowait(struct block_device *bdev)
>  	return test_bit(QUEUE_FLAG_NOWAIT, &bdev_get_queue(bdev)->queue_flags);
>  }
>  
> +static inline unsigned int bdev_max_provision_sectors(struct block_device *bdev)
> +{
> +	return bdev_get_queue(bdev)->limits.max_provision_sectors;
> +}
> +
>  static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
>  {
>  	return blk_queue_zoned_model(bdev_get_queue(bdev));
> -- 
> 2.40.1.521.gf1e218fcd8-goog
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

