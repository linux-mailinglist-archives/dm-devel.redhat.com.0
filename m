Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 742623374C9
	for <lists+dm-devel@lfdr.de>; Thu, 11 Mar 2021 14:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615471085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KoiFAnTsLc+5SY6dkreWlxBAUAJWoS3kxaeuQJhozRY=;
	b=HA3EWrKeIQjONlSEt52Uu2akcXu4w3yXCL2u7jhO3/5nsTUb//FOxJLVu3gtIRxIK7W8rA
	Bi/TALmoHFY42/w0ciLc25WW1L64uANEv+Gym1SqApUgqjiL45UEM/LAxtsqsMY/talH/d
	dkFcCyOeyB+KxNHra339F0r9feYdfRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-5Z4Z62k3Mz2p7f2BHRJaTw-1; Thu, 11 Mar 2021 08:58:03 -0500
X-MC-Unique: 5Z4Z62k3Mz2p7f2BHRJaTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EA7B107ACCA;
	Thu, 11 Mar 2021 13:57:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D103369A;
	Thu, 11 Mar 2021 13:57:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76E9657DC1;
	Thu, 11 Mar 2021 13:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BDuaKP004802 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 08:56:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F91F369A; Thu, 11 Mar 2021 13:56:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF3B92B16E;
	Thu, 11 Mar 2021 13:56:23 +0000 (UTC)
Date: Thu, 11 Mar 2021 21:56:19 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YEohgwIIy5ryme8x@T590>
References: <20210303115740.127001-1-jefflexu@linux.alibaba.com>
	<20210303115740.127001-11-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210303115740.127001-11-jefflexu@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, msnitzer@redhat.com, caspar@linux.alibaba.com,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, mpatocka@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 10/12] block: fastpath for bio-based
	polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 03, 2021 at 07:57:38PM +0800, Jeffle Xu wrote:
> Offer one fastpath for bio-based polling when bio submitted to dm
> device is not split.
> 
> In this case, there will be only one bio submitted to only one polling
> hw queue of one underlying mq device, and thus we don't need to track
> all split bios or iterate through all polling hw queues. The pointer to
> the polling hw queue the bio submitted to is returned here as the
> returned cookie. In this case, the polling routine will call
> mq_ops->poll() directly with the hw queue converted from the input
> cookie.
> 
> If the original bio submitted to dm device is split to multiple bios and
> thus submitted to multiple polling hw queues, the polling routine will
> fall back to iterating all hw queues (in polling mode) of all underlying
> mq devices.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  block/blk-core.c          | 73 +++++++++++++++++++++++++++++++++++++--
>  include/linux/blk_types.h | 66 +++++++++++++++++++++++++++++++++--
>  include/linux/types.h     |  2 +-
>  3 files changed, 135 insertions(+), 6 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 6d7d53030d7c..e5cd4ff08f5c 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -947,14 +947,22 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>  {
>  	struct bio_list bio_list_on_stack[2];
>  	blk_qc_t ret = BLK_QC_T_NONE;
> +	struct request_queue *top_q;
> +	bool poll_on;
>  
>  	BUG_ON(bio->bi_next);
>  
>  	bio_list_init(&bio_list_on_stack[0]);
>  	current->bio_list = bio_list_on_stack;
>  
> +	top_q = bio->bi_bdev->bd_disk->queue;
> +	poll_on = test_bit(QUEUE_FLAG_POLL, &top_q->queue_flags) &&
> +		  (bio->bi_opf & REQ_HIPRI);
> +
>  	do {
> -		struct request_queue *q = bio->bi_bdev->bd_disk->queue;
> +		blk_qc_t cookie;
> +		struct block_device *bdev = bio->bi_bdev;
> +		struct request_queue *q = bdev->bd_disk->queue;
>  		struct bio_list lower, same;
>  
>  		if (unlikely(bio_queue_enter(bio) != 0))
> @@ -966,7 +974,23 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>  		bio_list_on_stack[1] = bio_list_on_stack[0];
>  		bio_list_init(&bio_list_on_stack[0]);
>  
> -		ret = __submit_bio(bio);
> +		cookie = __submit_bio(bio);
> +
> +		if (poll_on && blk_qc_t_valid(cookie)) {

In patch 8, dm_submit_bio() is changed to return BLK_QC_T_NONE always,
so the returned cookie may be BLK_QC_T_NONE for DM device, such as, in
case of DM_MAPIO_SUBMITTED returned from ->map(), and underlying bios
can be submitted from another context, then nothing is fed to blk_poll().


thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

