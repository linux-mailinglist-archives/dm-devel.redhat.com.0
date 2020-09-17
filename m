Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 799E426FB4F
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 13:21:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-T7lVwEaKNqeleC8V23sIQQ-1; Fri, 18 Sep 2020 07:21:24 -0400
X-MC-Unique: T7lVwEaKNqeleC8V23sIQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7230100A448;
	Fri, 18 Sep 2020 11:21:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB3233782;
	Fri, 18 Sep 2020 11:20:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E035E44A7F;
	Fri, 18 Sep 2020 11:20:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HMI3qf026452 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 18:18:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B87E115DA6; Thu, 17 Sep 2020 22:18:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 270E1115DA2
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:18:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B8F98007A4
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 22:18:01 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-132-XC224IUlO2mwOgo2ayIYIg-1; Thu, 17 Sep 2020 18:17:58 -0400
X-MC-Unique: XC224IUlO2mwOgo2ayIYIg-1
Received: by mail-pl1-f194.google.com with SMTP id d19so1892139pld.0
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 15:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=c+4ph0tZxAltz1VN10j3r0ou5+B9luLqkBN/ND6jA8Y=;
	b=Gf1AAUGkRTqxhiz22LFg5Zv/AS/BzSygC59UQNGwoZ1hZuzxISAyzrywIt6aEiqqNg
	7BTfXNszPfzjiheFwVVEPxtK5QDP9rUf5qvhWUXtJre4ai4ECxXez/EjBm9UK+gadYfN
	RdL+tnAd+Keb6Zac28Xn4+f4lCHel6IXucv1JYOXVxDTBUvmewpdd+Zmy234aj89muME
	92F+P7fJtsdPs2QrsVmf7xGiIjOXiDpcI22y+cxcPGt+Crs2mQRaFfMmE7p3gDHJksKO
	c7IYL4MaIkUufxS9sJZkOyTGL0IB5NKhfpwywvnk+uzsD7u/uagD9yvmGt7UpqDYnd/l
	kv0w==
X-Gm-Message-State: AOAM531mtdAa3y4rJKsvwPoqMK3O32ij5HNfNwzuHRLo8tlbJr/G0P7b
	CSX7hfosfmUBgQ0s42ec4DGSNA==
X-Google-Smtp-Source: ABdhPJzQ5LC5wQL53AW0SgR+ExyQHxB64LONHJn9M9xZqnDVikgKGqlol6lu/mS5yJ1tMTIXE5N0KQ==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
	ck7mr10274476pjb.20.1600381077417; 
	Thu, 17 Sep 2020 15:17:57 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
	[35.199.190.124]) by smtp.gmail.com with ESMTPSA id
	br22sm603711pjb.35.2020.09.17.15.17.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Sep 2020 15:17:56 -0700 (PDT)
Date: Thu, 17 Sep 2020 22:17:52 +0000
From: Satya Tangirala <satyat@google.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200917221752.GA421296@google.com>
References: <20200916035315.34046-1-ebiggers@kernel.org>
	<20200916035315.34046-2-ebiggers@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200916035315.34046-2-ebiggers@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 07:20:50 -0400
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [dm-devel] [PATCH v2 1/3] block: make bio_crypt_clone() able to
	fail
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 08:53:13PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> bio_crypt_clone() assumes its gfp_mask argument always includes
> __GFP_DIRECT_RECLAIM, so that the mempool_alloc() will always succeed.
> 
> However, bio_crypt_clone() might be called with GFP_ATOMIC via
> setup_clone() in drivers/md/dm-rq.c, or with GFP_NOWAIT via
> kcryptd_io_read() in drivers/md/dm-crypt.c.
> 
> Neither case is currently reachable with a bio that actually has an
> encryption context.  However, it's fragile to rely on this.  Just make
> bio_crypt_clone() able to fail, analogous to bio_integrity_clone().
> 
> Reported-by: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Satya Tangirala <satyat@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  block/bio.c                | 20 +++++++++-----------
>  block/blk-crypto.c         |  5 ++++-
>  block/bounce.c             | 19 +++++++++----------
>  drivers/md/dm.c            |  7 ++++---
>  include/linux/blk-crypto.h | 20 ++++++++++++++++----
>  5 files changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/block/bio.c b/block/bio.c
> index a9931f23d9332..b42e046b12eb3 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -713,20 +713,18 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
>  
>  	__bio_clone_fast(b, bio);
>  
> -	bio_crypt_clone(b, bio, gfp_mask);
> +	if (bio_crypt_clone(b, bio, gfp_mask) < 0)
> +		goto err_put;
>  
> -	if (bio_integrity(bio)) {
> -		int ret;
> -
> -		ret = bio_integrity_clone(b, bio, gfp_mask);
> -
> -		if (ret < 0) {
> -			bio_put(b);
> -			return NULL;
> -		}
> -	}
> +	if (bio_integrity(bio) &&
> +	    bio_integrity_clone(b, bio, gfp_mask) < 0)
> +		goto err_put;
>  
>  	return b;
> +
> +err_put:
> +	bio_put(b);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(bio_clone_fast);
>  
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index 2d5e60023b08b..a3f27a19067c9 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -95,10 +95,13 @@ void __bio_crypt_free_ctx(struct bio *bio)
>  	bio->bi_crypt_context = NULL;
>  }
>  
> -void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
> +int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask)
>  {
>  	dst->bi_crypt_context = mempool_alloc(bio_crypt_ctx_pool, gfp_mask);
> +	if (!dst->bi_crypt_context)
> +		return -ENOMEM;
>  	*dst->bi_crypt_context = *src->bi_crypt_context;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(__bio_crypt_clone);
>  
> diff --git a/block/bounce.c b/block/bounce.c
> index 431be88a02405..162a6eee89996 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -267,22 +267,21 @@ static struct bio *bounce_clone_bio(struct bio *bio_src, gfp_t gfp_mask,
>  		break;
>  	}
>  
> -	bio_crypt_clone(bio, bio_src, gfp_mask);
> +	if (bio_crypt_clone(bio, bio_src, gfp_mask) < 0)
> +		goto err_put;
>  
> -	if (bio_integrity(bio_src)) {
> -		int ret;
> -
> -		ret = bio_integrity_clone(bio, bio_src, gfp_mask);
> -		if (ret < 0) {
> -			bio_put(bio);
> -			return NULL;
> -		}
> -	}
> +	if (bio_integrity(bio_src) &&
> +	    bio_integrity_clone(bio, bio_src, gfp_mask) < 0)
> +		goto err_put;
>  
>  	bio_clone_blkg_association(bio, bio_src);
>  	blkcg_bio_issue_init(bio);
>  
>  	return bio;
> +
> +err_put:
> +	bio_put(bio);
> +	return NULL;
>  }
>  
>  static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 3dedd9cc4fb65..5487c3ff74b51 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1326,14 +1326,15 @@ static int clone_bio(struct dm_target_io *tio, struct bio *bio,
>  		     sector_t sector, unsigned len)
>  {
>  	struct bio *clone = &tio->clone;
> +	int r;
>  
>  	__bio_clone_fast(clone, bio);
>  
> -	bio_crypt_clone(clone, bio, GFP_NOIO);
> +	r = bio_crypt_clone(clone, bio, GFP_NOIO);
> +	if (r < 0)
> +		return r;
>  
>  	if (bio_integrity(bio)) {
> -		int r;
> -
>  		if (unlikely(!dm_target_has_integrity(tio->ti->type) &&
>  			     !dm_target_passes_integrity(tio->ti->type))) {
>  			DMWARN("%s: the target %s doesn't support integrity data.",
> diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
> index e82342907f2b1..69b24fe92cbf1 100644
> --- a/include/linux/blk-crypto.h
> +++ b/include/linux/blk-crypto.h
> @@ -112,12 +112,24 @@ static inline bool bio_has_crypt_ctx(struct bio *bio)
>  
>  #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
>  
> -void __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
> -static inline void bio_crypt_clone(struct bio *dst, struct bio *src,
> -				   gfp_t gfp_mask)
> +int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
> +/**
> + * bio_crypt_clone - clone bio encryption context
> + * @dst: destination bio
> + * @src: source bio
> + * @gfp_mask: memory allocation flags
> + *
> + * If @src has an encryption context, clone it to @dst.
> + *
> + * Return: 0 on success, -ENOMEM if out of memory.  -ENOMEM is only possible if
> + *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
> + */
> +static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
> +				  gfp_t gfp_mask)
>  {
>  	if (bio_has_crypt_ctx(src))
> -		__bio_crypt_clone(dst, src, gfp_mask);
> +		return __bio_crypt_clone(dst, src, gfp_mask);
> +	return 0;
>  }
>  
>  #endif /* __LINUX_BLK_CRYPTO_H */
Looks good to me :). Please feel free to add

Reviewed-by: Satya Tangirala <satyat@google.com>

> -- 
> 2.28.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

