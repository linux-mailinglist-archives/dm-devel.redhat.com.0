Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 820F614A0EB
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jan 2020 10:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580117673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=78g85rAq7VGe//v7+8KjTtzKQlmVX1/7+jof1ahCErA=;
	b=I0Meh/E/6rJm5hZFjwfZebEi7VXd7jQrnOpYky+tO4gdZiIL8avGxNGqw0tNDS7Kvs7G61
	aVp7OyJntVQjagn5lDkX2qt3E9n26CD+bjpYoQ2iwhjsAg/ovyaUd2plc3Ja0oMj2oyjc/
	yJRllHeLHscVAyOyVUgHzGvAdSGWB20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-JkxZTWSENJaVtkYPk0cWfQ-1; Mon, 27 Jan 2020 04:34:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230D1801E6C;
	Mon, 27 Jan 2020 09:34:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25B360BF1;
	Mon, 27 Jan 2020 09:34:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9E6E85779;
	Mon, 27 Jan 2020 09:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P3JsKM016744 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 22:19:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EEA1B2166B2F; Sat, 25 Jan 2020 03:19:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2D52166B28
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 03:19:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90B82800185
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 03:19:51 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-128-Kq4gE05pPyCIzMq-qslhgA-1; Fri, 24 Jan 2020 22:19:47 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P3JHlp073406; Sat, 25 Jan 2020 03:19:17 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2xrd3tr1vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 03:19:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P3IKka071709; Sat, 25 Jan 2020 03:19:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2xratary01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 03:19:16 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00P3JB74007541;
	Sat, 25 Jan 2020 03:19:11 GMT
Received: from [192.168.0.110] (/39.176.206.183)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Jan 2020 19:19:11 -0800
To: Kirill Tkhai <ktkhai@virtuozzo.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
	axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com, song@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, Chaitanya.Kulkarni@wdc.com,
	darrick.wong@oracle.com, ming.lei@redhat.com, osandov@fb.com,
	jthumshirn@suse.de, minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	bvanassche@acm.org, dhowells@redhat.com, asml.silence@gmail.com
References: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
	<157969069360.174869.18184061012552778480.stgit@localhost.localdomain>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <b33500eb-8e7c-9e25-b7bc-9309e426cfc3@oracle.com>
Date: Sat, 25 Jan 2020 11:18:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <157969069360.174869.18184061012552778480.stgit@localhost.localdomain>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-2001250028
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-2001250028
X-MC-Unique: Kq4gE05pPyCIzMq-qslhgA-1
X-MC-Unique: JkxZTWSENJaVtkYPk0cWfQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Jan 2020 04:34:01 -0500
Subject: Re: [dm-devel] [PATCH v5 4/6] block: Add support for REQ_ALLOCATE
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

On 1/22/20 6:58 PM, Kirill Tkhai wrote:
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
> ---
>  block/blk-lib.c           |   17 ++++++++++-------
>  block/blk-settings.c      |    4 ++++
>  fs/block_dev.c            |    4 ++++
>  include/linux/blk_types.h |    5 ++++-
>  include/linux/blkdev.h    |   13 ++++++++++---
>  5 files changed, 32 insertions(+), 11 deletions(-)
> 

This patch and following two are looks fine to me.
Feel free to add.
Reviewed-by: Bob Liu <bob.liu@oracle.com>

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
> index 264202fa3bf8..20c94a7f9411 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -337,6 +337,7 @@ struct queue_limits {
>  	unsigned int		max_hw_discard_sectors;
>  	unsigned int		max_write_same_sectors;
>  	unsigned int		max_write_zeroes_sectors;
> +	unsigned int		max_allocate_sectors;
>  	unsigned int		discard_granularity;
>  	unsigned int		discard_alignment;
>  
> @@ -991,6 +992,8 @@ static inline struct bio_vec req_bvec(struct request *rq)
>  static inline unsigned int blk_queue_get_max_write_zeroes_sectors(
>  		struct request_queue *q, unsigned int op_flags)
>  {
> +	if (op_flags & REQ_ALLOCATE)
> +		return q->limits.max_allocate_sectors;
>  	return q->limits.max_write_zeroes_sectors;
>  }
>  
> @@ -1227,6 +1230,7 @@ extern int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>  
>  #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
>  #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
> +#define BLKDEV_ZERO_ALLOCATE	(1 << 2)  /* allocate range of blocks */
>  
>  extern int __blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>  		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop,
> @@ -1431,10 +1435,13 @@ static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev,
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

