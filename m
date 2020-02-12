Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 27B0215ADE9
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 17:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581526788;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+1pzJV2dXAkk0SA8vdoT/Yij/invJz11MNoNntCIEmc=;
	b=g9KDohf212u5zpzM690QZTYIH6U3GN4oqP/Px5Cr9eVN3R5OLsWFT1EQxaog57AcmuuaF0
	1CZKa8Je8i4rlASio7CKmqKBijbfp9TAJRv8Q8kk+BZFqMR1HCP5PdaY4VGX6nz54HEA4/
	wb0YuJA/yGumkN9Em6o0foj0qVSGvDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-XpszUZT2PEWaAQAJchQaeA-1; Wed, 12 Feb 2020 11:59:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A72B918B60B8;
	Wed, 12 Feb 2020 16:59:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F95060C63;
	Wed, 12 Feb 2020 16:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78C121803C33;
	Wed, 12 Feb 2020 16:59:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CGxKAx000389 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 11:59:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 045B31000D89; Wed, 12 Feb 2020 16:59:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3EE6107CD1D
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 16:59:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DC7A8032B5
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 16:59:17 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-WDnzl2obPkm8UuOtp8I-ow-1; Wed, 12 Feb 2020 11:59:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CGtOVl121429; Wed, 12 Feb 2020 16:58:45 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2y2k88cb8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Feb 2020 16:58:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CGvj0n119038; Wed, 12 Feb 2020 16:58:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 2y4k7x0tv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2020 16:58:44 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01CGwesf008138;
	Wed, 12 Feb 2020 16:58:40 GMT
Received: from localhost (/10.159.151.237)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 12 Feb 2020 08:58:40 -0800
Date: Wed, 12 Feb 2020 08:58:37 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200212165837.GL6874@magnolia>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
	<158132723311.239613.5269033996109738831.stgit@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <158132723311.239613.5269033996109738831.stgit@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	adultscore=0
	suspectscore=2 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	lowpriorityscore=0
	suspectscore=2 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
	malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120128
X-MC-Unique: WDnzl2obPkm8UuOtp8I-ow-1
X-MC-Unique: XpszUZT2PEWaAQAJchQaeA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CGxKAx000389
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, bob.liu@oracle.com, minwoo.im.dev@gmail.com,
	jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v6 4/6] block: Add support for REQ_ALLOCATE
	flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 10, 2020 at 12:33:53PM +0300, Kirill Tkhai wrote:
> This adds support for REQ_ALLOCATE extension of REQ_OP_WRITE_ZEROES
> operation, which encourages a block device driver to just allocate
> blocks (or mark them allocated) instead of actual blocks zeroing.
> REQ_ALLOCATE is aimed to be used for network filesystems providing
> a block device interface. Also, block devices, which map a file
> on other filesystem (like loop), may use this for less fragmentation
> and batching fallocate() requests. Hypervisors like QEMU may
> introduce optimizations of clusters allocations based on this.
> 
> BLKDEV_ZERO_ALLOCATE is a new corresponding flag for
> blkdev_issue_zeroout().
> 
> Stacking devices start from zero max_allocate_sectors limit for now,
> and the support is going to be implemented separate for each device
> in the future.
> 
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  block/blk-lib.c           |   17 ++++++++++-------
>  block/blk-settings.c      |    4 ++++
>  fs/block_dev.c            |    4 ++++
>  include/linux/blk_types.h |    5 ++++-
>  include/linux/blkdev.h    |   13 ++++++++++---
>  5 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 3e38c93cfc53..9cd6f86523ba 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -214,7 +214,7 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
>  		struct bio **biop, unsigned flags)
>  {
>  	struct bio *bio = *biop;
> -	unsigned int max_write_zeroes_sectors;
> +	unsigned int max_write_zeroes_sectors, req_flags = 0;
>  	struct request_queue *q = bdev_get_queue(bdev);
>  
>  	if (!q)
> @@ -224,18 +224,21 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
>  		return -EPERM;
>  
>  	/* Ensure that max_write_zeroes_sectors doesn't overflow bi_size */
> -	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev, 0);
> +	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev, flags);
>  
>  	if (max_write_zeroes_sectors == 0)
>  		return -EOPNOTSUPP;
>  
> +	if (flags & BLKDEV_ZERO_NOUNMAP)
> +		req_flags |= REQ_NOUNMAP;
> +	if (flags & BLKDEV_ZERO_ALLOCATE)
> +		req_flags |= REQ_ALLOCATE|REQ_NOUNMAP;
> +
>  	while (nr_sects) {
>  		bio = blk_next_bio(bio, 0, gfp_mask);
>  		bio->bi_iter.bi_sector = sector;
>  		bio_set_dev(bio, bdev);
> -		bio->bi_opf = REQ_OP_WRITE_ZEROES;
> -		if (flags & BLKDEV_ZERO_NOUNMAP)
> -			bio->bi_opf |= REQ_NOUNMAP;
> +		bio->bi_opf = REQ_OP_WRITE_ZEROES | req_flags;
>  
>  		if (nr_sects > max_write_zeroes_sectors) {
>  			bio->bi_iter.bi_size = max_write_zeroes_sectors << 9;
> @@ -362,7 +365,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>  	sector_t bs_mask;
>  	struct bio *bio;
>  	struct blk_plug plug;
> -	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev, 0);
> +	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev, flags);
>  
>  	bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
>  	if ((sector | nr_sects) & bs_mask)
> @@ -391,7 +394,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>  			try_write_zeroes = false;
>  			goto retry;
>  		}
> -		if (!bdev_write_zeroes_sectors(bdev, 0)) {
> +		if (!bdev_write_zeroes_sectors(bdev, flags)) {
>  			/*
>  			 * Zeroing offload support was indicated, but the
>  			 * device reported ILLEGAL REQUEST (for some devices
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index c8eda2e7b91e..8d5df9d37239 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -48,6 +48,7 @@ void blk_set_default_limits(struct queue_limits *lim)
>  	lim->chunk_sectors = 0;
>  	lim->max_write_same_sectors = 0;
>  	lim->max_write_zeroes_sectors = 0;
> +	lim->max_allocate_sectors = 0;
>  	lim->max_discard_sectors = 0;
>  	lim->max_hw_discard_sectors = 0;
>  	lim->discard_granularity = 0;
> @@ -83,6 +84,7 @@ void blk_set_stacking_limits(struct queue_limits *lim)
>  	lim->max_dev_sectors = UINT_MAX;
>  	lim->max_write_same_sectors = UINT_MAX;
>  	lim->max_write_zeroes_sectors = UINT_MAX;
> +	lim->max_allocate_sectors = 0;
>  }
>  EXPORT_SYMBOL(blk_set_stacking_limits);
>  
> @@ -506,6 +508,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  					b->max_write_same_sectors);
>  	t->max_write_zeroes_sectors = min(t->max_write_zeroes_sectors,
>  					b->max_write_zeroes_sectors);
> +	t->max_allocate_sectors = min(t->max_allocate_sectors,
> +					b->max_allocate_sectors);
>  	t->bounce_pfn = min_not_zero(t->bounce_pfn, b->bounce_pfn);
>  
>  	t->seg_boundary_mask = min_not_zero(t->seg_boundary_mask,
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 69bf2fb6f7cd..1ffef894b3bd 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -2122,6 +2122,10 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
>  		error = blkdev_issue_zeroout(bdev, start >> 9, len >> 9,
>  					     GFP_KERNEL, BLKDEV_ZERO_NOFALLBACK);
>  		break;
> +	case FALLOC_FL_KEEP_SIZE:
> +		error = blkdev_issue_zeroout(bdev, start >> 9, len >> 9,
> +			GFP_KERNEL, BLKDEV_ZERO_ALLOCATE | BLKDEV_ZERO_NOFALLBACK);

I think this should be ^^^ indented to match the other calls.

> +		break;
>  	case FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE | FALLOC_FL_NO_HIDE_STALE:
>  		error = blkdev_issue_discard(bdev, start >> 9, len >> 9,
>  					     GFP_KERNEL, 0);
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 70254ae11769..86accd2caa4e 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -335,7 +335,9 @@ enum req_flag_bits {
>  
>  	/* command specific flags for REQ_OP_WRITE_ZEROES: */
>  	__REQ_NOUNMAP,		/* do not free blocks when zeroing */
> -
> +	__REQ_ALLOCATE,		/* only notify about allocated blocks,
> +				 * and do not actually zero them

"only notify"?  Is someone getting a notification?  Or are we simply
"notifying" the device that it must ensure allocated blocks?

If it's that last one, then perhaps this should be reworded:

/*
 * Ensure the LBA range is backed by physical storage
 * without writing zeroes to the blocks.
 */

--D

> +				 */
>  	__REQ_HIPRI,
>  
>  	/* for driver use */
> @@ -362,6 +364,7 @@ enum req_flag_bits {
>  #define REQ_CGROUP_PUNT		(1ULL << __REQ_CGROUP_PUNT)
>  
>  #define REQ_NOUNMAP		(1ULL << __REQ_NOUNMAP)
> +#define REQ_ALLOCATE		(1ULL << __REQ_ALLOCATE)
>  #define REQ_HIPRI		(1ULL << __REQ_HIPRI)
>  
>  #define REQ_DRV			(1ULL << __REQ_DRV)
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 55a714161684..40707f980a2e 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -336,6 +336,7 @@ struct queue_limits {
>  	unsigned int		max_hw_discard_sectors;
>  	unsigned int		max_write_same_sectors;
>  	unsigned int		max_write_zeroes_sectors;
> +	unsigned int		max_allocate_sectors;
>  	unsigned int		discard_granularity;
>  	unsigned int		discard_alignment;
>  
> @@ -990,6 +991,8 @@ static inline struct bio_vec req_bvec(struct request *rq)
>  static inline unsigned int blk_queue_get_max_write_zeroes_sectors(
>  		struct request_queue *q, unsigned int op_flags)
>  {
> +	if (op_flags & REQ_ALLOCATE)
> +		return q->limits.max_allocate_sectors;
>  	return q->limits.max_write_zeroes_sectors;
>  }
>  
> @@ -1226,6 +1229,7 @@ extern int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>  
>  #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
>  #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
> +#define BLKDEV_ZERO_ALLOCATE	(1 << 2)  /* allocate range of blocks */
>  
>  extern int __blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>  		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop,
> @@ -1430,10 +1434,13 @@ static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev,
>  {
>  	struct request_queue *q = bdev_get_queue(bdev);
>  
> -	if (q)
> -		return q->limits.max_write_zeroes_sectors;
> +	if (!q)
> +		return 0;
>  
> -	return 0;
> +	if (flags & BLKDEV_ZERO_ALLOCATE)
> +		return q->limits.max_allocate_sectors;
> +	else
> +		return q->limits.max_write_zeroes_sectors;
>  }
>  
>  static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

