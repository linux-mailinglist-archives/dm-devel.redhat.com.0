Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2573E206D19
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 08:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592981817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fVpy/OipNRkkTZHtP85sBiSpbpgDJRMM+Nw0MN+Fc1o=;
	b=HfXZH+ZurCB0/B/6XdGj836BOYMVuiCHYxXMUACEaI9c4ASki8CuAGEW2Bg8dWdqoq1kjV
	PnEDrFp7RK2W+9X9FExzccDS2lbRKEjdzVqWhtBVdes6xCwoXRLjBwpJZ6jYq+S6C55YPZ
	BxSdQGDh5FXzvMhQCUi2nwMzXCujJtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-prgRKuwVNea59gkMFYolrg-1; Wed, 24 Jun 2020 02:56:55 -0400
X-MC-Unique: prgRKuwVNea59gkMFYolrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CBC68015F0;
	Wed, 24 Jun 2020 06:56:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 932D719D7F;
	Wed, 24 Jun 2020 06:56:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32CAD833D3;
	Wed, 24 Jun 2020 06:56:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O6ub10029296 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 02:56:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AAE36217B437; Wed, 24 Jun 2020 06:56:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6952215671E
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 06:56:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B04C9858EE2
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 06:56:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-218-DEwESCaZMOmh4ZMQXa6OeA-1;
	Wed, 24 Jun 2020 02:56:31 -0400
X-MC-Unique: DEwESCaZMOmh4ZMQXa6OeA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4BA7568AEF; Wed, 24 Jun 2020 08:48:20 +0200 (CEST)
Date: Wed, 24 Jun 2020 08:48:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200624064820.GA17964@lst.de>
References: <20200624032752.4177-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200624032752.4177-1-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, snitzer@redhat.com, rdunlap@infradead.org,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, mingo@redhat.com, rostedt@goodmis.org,
	kbusch@kernel.org, hch@lst.de, agk@redhat.com
Subject: Re: [dm-devel] [PATCH RFC] block: blktrace framework cleanup
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



On Tue, Jun 23, 2020 at 08:27:52PM -0700, Chaitanya Kulkarni wrote:
> There are many places where trace API accepts the struct request_queue*
> parameter which can be derived from other function parameters.
> 
> This patch removes the struct request queue parameter from the
> blktrace framework and adjusts the tracepoints definition and usage
> along with the tracing API itself.

Good idea, and I had a half-ready patch for this already as well.

One issue, and two extra requests below:


>  	if (bio->bi_disk && bio_flagged(bio, BIO_TRACE_COMPLETION)) {
> -		trace_block_bio_complete(bio->bi_disk->queue, bio);
> +		trace_block_bio_complete(bio);

This one can also be called for a different queue than
bio->bi_disk->queue, so for this one particular tracepoint we'll need
to keep the request_queue argument.

> diff --git a/block/blk-mq-sched.c b/block/blk-mq-sched.c
> index fdcc2c1dd178..a3cade16ef80 100644
> --- a/block/blk-mq-sched.c
> +++ b/block/blk-mq-sched.c
> @@ -409,7 +409,7 @@ EXPORT_SYMBOL_GPL(blk_mq_sched_try_insert_merge);
>  
>  void blk_mq_sched_request_inserted(struct request *rq)
>  {
> -	trace_block_rq_insert(rq->q, rq);
> +	trace_block_rq_insert(rq);
>  }
>  EXPORT_SYMBOL_GPL(blk_mq_sched_request_inserted);

As a follow on patch we should also remove this function.

>  	}
>  
>  	spin_lock(&ctx->lock);
> @@ -2111,7 +2111,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *q, struct bio *bio)
>  		goto queue_exit;
>  	}
>  
> -	trace_block_getrq(q, bio, bio->bi_opf);
> +	trace_block_getrq(bio, bio->bi_opf);

The second argument can be removed as well.  Maybe as another patch.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

