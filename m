Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 357AF31FA74
	for <lists+dm-devel@lfdr.de>; Fri, 19 Feb 2021 15:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613744280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Wt17+540MZM5VrJnbtbBsBogMoMfqoGTqHCfWfZblI=;
	b=b+jIjk6oAWLRMwcsLO3H9xHNd+wVDPzPCRdMdVyEqnN6Elgq5ZWFKbl3imr3ow9M3jBOej
	lIZwL3M+OPzCB8zFAEN7Ceok3z8cDL5J9825W4YlK0CAeURLixwXxI8fNXXZjSSIaPU/44
	JDgIfD9I4oxqobV61W28MjBWA8OyXd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159--nfHaXlXNi-e95CWSMO1Cg-1; Fri, 19 Feb 2021 09:17:57 -0500
X-MC-Unique: -nfHaXlXNi-e95CWSMO1Cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84841AFA80;
	Fri, 19 Feb 2021 14:17:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FCB75D9C2;
	Fri, 19 Feb 2021 14:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 970AE18095CB;
	Fri, 19 Feb 2021 14:17:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11JEHLSb028125 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 09:17:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D9D505D9C2; Fri, 19 Feb 2021 14:17:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B40145D9C6;
	Fri, 19 Feb 2021 14:17:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 11JEHEkJ007662; Fri, 19 Feb 2021 09:17:14 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 11JEHCXs007658; Fri, 19 Feb 2021 09:17:13 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 19 Feb 2021 09:17:12 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jeffle Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20210208085243.82367-10-jefflexu@linux.alibaba.com>
Message-ID: <alpine.LRH.2.02.2102190907560.10545@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
	<20210208085243.82367-10-jefflexu@linux.alibaba.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, snitzer@redhat.com, caspar@linux.alibaba.com,
	io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH v3 09/11] dm: support IO polling for
 bio-based dm device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 8 Feb 2021, Jeffle Xu wrote:

> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index c2945c90745e..8423f1347bb8 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1657,6 +1657,68 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
>  	return BLK_QC_T_NONE;
>  }
>  
> +static int dm_poll_one_md(struct mapped_device *md);
> +
> +static int dm_poll_one_dev(struct dm_target *ti, struct dm_dev *dev,
> +				sector_t start, sector_t len, void *data)
> +{
> +	int i, *count = data;
> +	struct request_queue *q = bdev_get_queue(dev->bdev);
> +	struct blk_mq_hw_ctx *hctx;
> +
> +	if (queue_is_mq(q)) {
> +		if (!percpu_ref_tryget(&q->q_usage_counter))
> +			return 0;
> +
> +		queue_for_each_poll_hw_ctx(q, hctx, i)
> +			*count += blk_mq_poll_hctx(q, hctx);
> +
> +		percpu_ref_put(&q->q_usage_counter);
> +	} else
> +		*count += dm_poll_one_md(dev->bdev->bd_disk->private_data);

This is fragile, because in the future there may be other bio-based 
drivers that support polling. You should check that "q" is really a device 
mapper device before calling dm_poll_one_md on it.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

