Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 518B926FB4D
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 13:21:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-ssNlfa37PAOJ4vBdKY_dbw-1; Fri, 18 Sep 2020 07:21:24 -0400
X-MC-Unique: ssNlfa37PAOJ4vBdKY_dbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FC0C108872D;
	Fri, 18 Sep 2020 11:21:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFED73672;
	Fri, 18 Sep 2020 11:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1F9E8C7AA;
	Fri, 18 Sep 2020 11:21:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HMJfV8026605 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 18:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 179B62156A30; Thu, 17 Sep 2020 22:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1158D2156A2D
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:19:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BC6018AE949
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:19:37 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-zU9mVsTMM4uzyd42cs6wqw-1; Thu, 17 Sep 2020 18:19:35 -0400
X-MC-Unique: zU9mVsTMM4uzyd42cs6wqw-1
Received: by mail-pg1-f196.google.com with SMTP id d13so2187553pgl.6
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 15:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OYY9tIc9xfhOWrpXdHXfLce1m2xJL6GRbyCPd8OZlow=;
	b=n7NaUuaezU1lQf/hNuz1mY5CNdm1o7QJePwE92tGLkTcNNPN4+egtR5Z09pgDez/7i
	lvFFL+rUftjn7HDdsG5BSxHnuzQ7eESncZZFxyVPTn29/5XDpnReIebHDzmWkuxYmlyn
	orsP8mALjIvZHeUiV5zCo4DkAqWEvT1CSdB+MkNBu+HVAy5T9NrHnHxD16hu/J7erLGI
	RTZgSjD6tx31MXEZ4aavIrMWX6IFkSbytj8Owc3ZwVdobvAiTaLWc8877q8gOPPTadp/
	lgWHOHr4uPFPc3Qu6LZUkiPxFSFlmGjz/lhB1DyC5BDSNwlz9jxTlqZ3MpW3LvuU0Kgg
	/wLw==
X-Gm-Message-State: AOAM532Ial4ILDJPDTJSBSU6oX2AEdzPDPfSlBTLf7PgDK5Js31zc7m1
	AibziAOWhdYCJaot7pOICnaIfA==
X-Google-Smtp-Source: ABdhPJwalTHkX//endIf1ifjkPFrtGZZIq50ErBqLzyNrlwAewdAv9az3kJqdJS8SBSV6gXwxC0n3w==
X-Received: by 2002:a63:4a19:: with SMTP id x25mr23535695pga.56.1600381173884; 
	Thu, 17 Sep 2020 15:19:33 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
	[35.199.190.124])
	by smtp.gmail.com with ESMTPSA id d8sm627085pgt.19.2020.09.17.15.19.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Sep 2020 15:19:33 -0700 (PDT)
Date: Thu, 17 Sep 2020 22:19:29 +0000
From: Satya Tangirala <satyat@google.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200917221929.GB421296@google.com>
References: <20200916035315.34046-1-ebiggers@kernel.org>
	<20200916035315.34046-3-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200916035315.34046-3-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:20:50 -0400
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [dm-devel] [PATCH v2 2/3] block: make blk_crypto_rq_bio_prep()
	able to fail
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 08:53:14PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> blk_crypto_rq_bio_prep() assumes its gfp_mask argument always includes
> __GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.
> 
> However, blk_crypto_rq_bio_prep() might be called with GFP_ATOMIC via
> setup_clone() in drivers/md/dm-rq.c.
> 
> This case isn't currently reachable with a bio that actually has an
> encryption context.  However, it's fragile to rely on this.  Just make
> blk_crypto_rq_bio_prep() able to fail.
> 
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Suggested-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  block/blk-core.c            |  8 +++++---
>  block/blk-crypto-internal.h | 21 ++++++++++++++++-----
>  block/blk-crypto.c          | 18 +++++++-----------
>  block/blk-mq.c              |  7 ++++++-
>  4 files changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index ca3f0f00c9435..fbeaa49f6fe2c 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1620,8 +1620,10 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
>  		if (rq->bio) {
>  			rq->biotail->bi_next = bio;
>  			rq->biotail = bio;
> -		} else
> +		} else {
>  			rq->bio = rq->biotail = bio;
> +		}
> +		bio = NULL;
>  	}
>  
>  	/* Copy attributes of the original request to the clone request. */
> @@ -1634,8 +1636,8 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
>  	rq->nr_phys_segments = rq_src->nr_phys_segments;
>  	rq->ioprio = rq_src->ioprio;
>  
> -	if (rq->bio)
> -		blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask);
> +	if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
> +		goto free_and_out;
>  
>  	return 0;
>  
> diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
> index d2b0f565d83cb..0d36aae538d7b 100644
> --- a/block/blk-crypto-internal.h
> +++ b/block/blk-crypto-internal.h
> @@ -142,13 +142,24 @@ static inline void blk_crypto_free_request(struct request *rq)
>  		__blk_crypto_free_request(rq);
>  }
>  
> -void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> -			      gfp_t gfp_mask);
> -static inline void blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> -					  gfp_t gfp_mask)
> +int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> +			     gfp_t gfp_mask);
> +/**
> + * blk_crypto_rq_bio_prep - Prepare a request's crypt_ctx when its first bio
> + *			    is inserted
> + * @rq: The request to prepare
> + * @bio: The first bio being inserted into the request
> + * @gfp_mask: Memory allocation flags
> + *
> + * Return: 0 on success, -ENOMEM if out of memory.  -ENOMEM is only possible if
> + *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
> + */
> +static inline int blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> +					 gfp_t gfp_mask)
>  {
>  	if (bio_has_crypt_ctx(bio))
> -		__blk_crypto_rq_bio_prep(rq, bio, gfp_mask);
> +		return __blk_crypto_rq_bio_prep(rq, bio, gfp_mask);
> +	return 0;
>  }
>  
>  /**
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index a3f27a19067c9..bbe7974fd74f0 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -283,20 +283,16 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
>  	return false;
>  }
>  
> -/**
> - * __blk_crypto_rq_bio_prep - Prepare a request's crypt_ctx when its first bio
> - *			      is inserted
> - *
> - * @rq: The request to prepare
> - * @bio: The first bio being inserted into the request
> - * @gfp_mask: gfp mask
> - */
> -void __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> -			      gfp_t gfp_mask)
> +int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
> +			     gfp_t gfp_mask)
>  {
> -	if (!rq->crypt_ctx)
> +	if (!rq->crypt_ctx) {
>  		rq->crypt_ctx = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
> +		if (!rq->crypt_ctx)
> +			return -ENOMEM;
> +	}
>  	*rq->crypt_ctx = *bio->bi_crypt_context;
> +	return 0;
>  }
>  
>  /**
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index e04b759add758..9ec0e7149ae69 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -1940,13 +1940,18 @@ void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
>  static void blk_mq_bio_to_request(struct request *rq, struct bio *bio,
>  		unsigned int nr_segs)
>  {
> +	int err;
> +
>  	if (bio->bi_opf & REQ_RAHEAD)
>  		rq->cmd_flags |= REQ_FAILFAST_MASK;
>  
>  	rq->__sector = bio->bi_iter.bi_sector;
>  	rq->write_hint = bio->bi_write_hint;
>  	blk_rq_bio_prep(rq, bio, nr_segs);
> -	blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
> +
> +	/* This can't fail, since GFP_NOIO includes __GFP_DIRECT_RECLAIM. */
> +	err = blk_crypto_rq_bio_prep(rq, bio, GFP_NOIO);
> +	WARN_ON_ONCE(err);
>  
>  	blk_account_io_start(rq);
>  }
Looks good!

Reviewed-by: Satya Tangirala <satyat@google.com>

> -- 
> 2.28.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

