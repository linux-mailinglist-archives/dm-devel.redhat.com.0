Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C025D1BC94F
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 20:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588099290;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U8Sz57AN3PUVI6vVHcnn9aiBNiF9ex7FaFQSrrFjoa0=;
	b=AVVWH1cOQunePrObwqjIARoDqcFYS5lwLqCmjFqieC7fTfLULiFOkDJlabbSezdsd0LDSz
	P8FZK4wF1NsFb29iSPQDD1i+YjYdbz2qXQlX5r6zlaTJ4W2YWLVZZtD7KcmQVNtLWGCqi8
	699HqczNcDjvCrUrCNNORKrMmvWKOYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-4bUSveUTNTuPiG7yx0joUQ-1; Tue, 28 Apr 2020 14:41:27 -0400
X-MC-Unique: 4bUSveUTNTuPiG7yx0joUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B831005510;
	Tue, 28 Apr 2020 18:41:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6546600D2;
	Tue, 28 Apr 2020 18:41:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E67AF4CAA0;
	Tue, 28 Apr 2020 18:41:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SIcG1D029828 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 14:38:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB9B51002397; Tue, 28 Apr 2020 18:38:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD261002388;
	Tue, 28 Apr 2020 18:38:13 +0000 (UTC)
Date: Tue, 28 Apr 2020 14:38:13 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200428183812.GA17609@redhat.com>
References: <20200425075336.721021-1-hch@lst.de>
	<20200425075336.721021-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200425075336.721021-3-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/3] dm: remove the make_request_fn check in
 device_area_is_invalid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Apr 25 2020 at  3:53am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Think it'd be useful to add a commit message like you did for revert
commit f01b411f41f91fc3196eae4317cf8b4d872830a6 , e.g.:

We can't have queues without a make_request_fn any more (and the loop
device uses blk-mq these days anyway..).

But that aside:

Acked-by: Mike Snitzer <snitzer@redhat.com>

Thanks.

> ---
>  drivers/md/dm-table.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 0a2cc197f62b4..8277b959e00bd 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -279,7 +279,6 @@ static struct dm_dev_internal *find_device(struct list_head *l, dev_t dev)
>  static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
>  				  sector_t start, sector_t len, void *data)
>  {
> -	struct request_queue *q;
>  	struct queue_limits *limits = data;
>  	struct block_device *bdev = dev->bdev;
>  	sector_t dev_size =
> @@ -288,22 +287,6 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
>  		limits->logical_block_size >> SECTOR_SHIFT;
>  	char b[BDEVNAME_SIZE];
>  
> -	/*
> -	 * Some devices exist without request functions,
> -	 * such as loop devices not yet bound to backing files.
> -	 * Forbid the use of such devices.
> -	 */
> -	q = bdev_get_queue(bdev);
> -	if (!q || !q->make_request_fn) {
> -		DMWARN("%s: %s is not yet initialised: "
> -		       "start=%llu, len=%llu, dev_size=%llu",
> -		       dm_device_name(ti->table->md), bdevname(bdev, b),
> -		       (unsigned long long)start,
> -		       (unsigned long long)len,
> -		       (unsigned long long)dev_size);
> -		return 1;
> -	}
> -
>  	if (!dev_size)
>  		return 0;
>  
> -- 
> 2.26.1
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

