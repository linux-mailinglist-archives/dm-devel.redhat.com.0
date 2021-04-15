Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C00D361364
	for <lists+dm-devel@lfdr.de>; Thu, 15 Apr 2021 22:20:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-05nm-FrCOZu_uKBnE6MKRA-1; Thu, 15 Apr 2021 16:20:55 -0400
X-MC-Unique: 05nm-FrCOZu_uKBnE6MKRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF69281746C;
	Thu, 15 Apr 2021 20:20:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA6062677;
	Thu, 15 Apr 2021 20:20:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 158981806D15;
	Thu, 15 Apr 2021 20:20:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FKGrwi027450 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 16:16:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 094572182DB2; Thu, 15 Apr 2021 20:16:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047DC2180BD9
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 20:16:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F573185A7B8
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 20:16:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-388-xHYqM0-mMdiVe5gAHmZ58g-1; Thu, 15 Apr 2021 16:16:46 -0400
X-MC-Unique: xHYqM0-mMdiVe5gAHmZ58g-1
Received: by mail-pf1-f171.google.com with SMTP id n38so16836795pfv.2;
	Thu, 15 Apr 2021 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=R4MN2eqir+CBtD0tgtCkvzIAT+xpznMNoAirRW915JI=;
	b=bHvBG954AOxFKk1dYc8tcRHWBDl1S8p7qRg8kOD7uI1k7BaM4dtEQ9De4OiY0NFu0/
	uxgmvRF6JLaDTnU+Ric6YxdK8E2t+jArJfsn/61ni8rj5AFy3I0IN+0+SqXSyCNuDjdA
	hBrZf3+iBLnF966WRUEkS+rwGiAu2hMAbqG4ZbQu683JRcU6EwhgMU8V2uoLKCsqs+9w
	uHt7y3NtgI0DJ66fKNKlIArRJypZPojXgdzGW1n/z7S/lzwL/pI+X7TaISWGedHdLoKE
	TRhCLTeBsRHLfEI7WSmeKrZELg3PMgVMJ7qVEFxrQrUHlbWHqpvXYojjsqGk31SzTenj
	eF0w==
X-Gm-Message-State: AOAM532zWBcb1Qw2ANJSDAfVut+edBbZpfdCfFYM97xi99hyzdILIDF9
	1pGXjbejO9mFDT2tfA+o/MA=
X-Google-Smtp-Source: ABdhPJxasAeAsl5iQIA7O0Hpn7d6fx6L/z8/SVQlS1C09Khzz+GwalY1VdAAhZbxcExOg1StAuq49Q==
X-Received: by 2002:a65:53c8:: with SMTP id z8mr5048457pgr.340.1618517804655; 
	Thu, 15 Apr 2021 13:16:44 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:f031:1d3a:7e95:2876?
	([2601:647:4000:d7:f031:1d3a:7e95:2876])
	by smtp.gmail.com with ESMTPSA id
	y187sm2814668pfb.109.2021.04.15.13.16.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 15 Apr 2021 13:16:43 -0700 (PDT)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20210415103310.1513841-1-ming.lei@redhat.com>
	<20210415103310.1513841-3-ming.lei@redhat.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <af8f41f4-74e8-450d-fa63-6feb6b745222@acm.org>
Date: Thu, 15 Apr 2021 13:16:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415103310.1513841-3-ming.lei@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH 2/2] block: support to freeze bio based
 request queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/15/21 3:33 AM, Ming Lei wrote:
> 1) grab two queue usage refcount for blk-mq before submitting blk-mq
> bio, one is for bio, anther is for request;
                       ^^^^^^
                       another?

> diff --git a/block/blk-core.c b/block/blk-core.c
> index 09f774e7413d..f71e4b433030 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -431,12 +431,13 @@ EXPORT_SYMBOL(blk_cleanup_queue);
>  int blk_queue_enter(struct request_queue *q, blk_mq_req_flags_t flags)
>  {
>  	const bool pm = flags & BLK_MQ_REQ_PM;
> +	const unsigned int nr = (flags & BLK_MQ_REQ_DOUBLE_REF) ? 2 : 1;

Please leave out the parentheses from around the condition in the above
and in other ternary expressions. The ternary operator has a very low
precedence so adding parentheses around the condition in a ternary
operator is almost never necessary.

> @@ -480,8 +481,18 @@ static inline int bio_queue_enter(struct bio *bio)
>  	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
>  	bool nowait = bio->bi_opf & REQ_NOWAIT;
>  	int ret;
> +	blk_mq_req_flags_t flags = nowait ? BLK_MQ_REQ_NOWAIT : 0;
> +	bool reffed = bio_flagged(bio, BIO_QUEUE_REFFED);
>  
> -	ret = blk_queue_enter(q, nowait ? BLK_MQ_REQ_NOWAIT : 0);
> +	if (!reffed)
> +		bio_set_flag(bio, BIO_QUEUE_REFFED);
> +
> +	/*
> +	 * Grab two queue references for blk-mq, one is for bio, and
> +	 * another is for blk-mq request.
> +	 */
> +	ret = blk_queue_enter(q, q->mq_ops && !reffed ?
> +			(flags | BLK_MQ_REQ_DOUBLE_REF) : flags);

Consider rewriting the above code as follows to make it easier to read:

	if (q->mq_ops && !reffed)
		flags |= BLK_MQ_REQ_DOUBLE_REF;
	ret = blk_queue_enter(q, flags);

Please also expand the comment above this code. The comment only
explains the reffed == false case but not the reffed == true case. I
assume that the reffed == true case applies to stacked bio-based drivers?

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

