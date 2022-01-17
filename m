Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90223490C83
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jan 2022 17:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642436959;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j0bfcFrwsW2phMAvR+XuIsJApLLhHZSlIHKgwzbDHEg=;
	b=ZWEmDrWQ5Nty9PPaeR/gwlxKcbvAKNJL2X7hcP5wuMA9HzcrbCFgZtr/cgV0oh97Vh4U4a
	siypshjkfwe/45WxtY/uVePxN1C78BbK838PLQvVXbDeSHVHvUY/4vvWZA6bHkYy1xOefL
	o09QLfhZCYliTO2EmwWwBr2gGNWT6nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-RH5xMpE1Ph2AlTnKm7ti0Q-1; Mon, 17 Jan 2022 11:29:18 -0500
X-MC-Unique: RH5xMpE1Ph2AlTnKm7ti0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BEF612A1;
	Mon, 17 Jan 2022 16:29:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E72D67D3D1;
	Mon, 17 Jan 2022 16:29:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E23324CA93;
	Mon, 17 Jan 2022 16:28:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HGSafv005971 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 11:28:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43FAF77CA5; Mon, 17 Jan 2022 16:28:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E8877C86;
	Mon, 17 Jan 2022 16:27:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 20HGRbkJ021180; 
	Mon, 17 Jan 2022 10:27:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 20HGRZlL021177;
	Mon, 17 Jan 2022 10:27:35 -0600
Date: Mon, 17 Jan 2022 10:27:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20220117162735.GH24684@octiron.msp.redhat.com>
References: <1642183128-17875-1-git-send-email-bmarzins@redhat.com>
	<YeUf9dRHky81/bs4@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YeUf9dRHky81/bs4@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm rq: clear cloned bio ->bi_bdev to fix I/O
 accounting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 16, 2022 at 11:51:17PM -0800, Christoph Hellwig wrote:
> So I actually noticed this during code inspection a while ago, but I
> think we need to use the actual underlying device instead of NULL here
> to keep our block layer gurantees.  See the patch in my queue below.

Makes sense.

> ---
> >From 1e330b8e57fc0d6c6fb07c0ec2915dca5d7a585a Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Thu, 13 Jan 2022 10:53:59 +0100
> Subject: block: assign bi_bdev for cloned bios in blk_rq_prep_clone
> 
> The cloned bios for the cloned request in blk_rq_prep_clone currently
> still point to the original bi_bdev.  This is harmless because dm-mpath
> doesn't look at bi_bdev but violates the invariants of always having
> the correct bi_bdev.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-mq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index a6d4780580fcd..b5e35e63adad4 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2976,6 +2976,7 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
>  		bio = bio_clone_fast(bio_src, gfp_mask, bs);
>  		if (!bio)
>  			goto free_and_out;
> +		bio->bi_bdev = rq->q->disk->part0;
>  
>  		if (bio_ctr && bio_ctr(bio, bio_src, data))
>  			goto free_and_out;
> -- 
> 2.30.2

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

