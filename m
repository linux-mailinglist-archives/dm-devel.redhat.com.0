Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1408030DF87
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 17:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612369148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JDYC3Oo2lD2luH9wDhH4CY9ArvFhMdv5tHcXqL3vMe8=;
	b=ZPAIO05rpbIuLHc13IfuTBVjYrrz0Q7uy8uj7Yxr6os27jQDao/cfoUKBcKY+oO5xwTO4w
	r4YNG+8Qi0+A/FQmeoL2swWJZSo6ukdawYZjmQT7jARjlYiAAWUTcNFXqZRYYsSxL0wzAU
	jnDkQskopagrF7qZ1gAWqTBs5QBD1RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-j7wEtlUANy23oi13G8Ck1g-1; Wed, 03 Feb 2021 11:19:04 -0500
X-MC-Unique: j7wEtlUANy23oi13G8Ck1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2918C10866DE;
	Wed,  3 Feb 2021 16:18:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ED9410013D7;
	Wed,  3 Feb 2021 16:18:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 137F318095CB;
	Wed,  3 Feb 2021 16:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113GIh3M013005 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 11:18:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D3FAE159; Wed,  3 Feb 2021 16:18:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02FAC1971C;
	Wed,  3 Feb 2021 16:18:36 +0000 (UTC)
Date: Wed, 3 Feb 2021 11:18:36 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <20210203161836.GB21359@redhat.com>
References: <1612367638-3794-1-git-send-email-sergei.shtepa@veeam.com>
	<1612367638-3794-3-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
In-Reply-To: <1612367638-3794-3-git-send-email-sergei.shtepa@veeam.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Damien.LeMoal@wdc.com, jack@suse.cz, corbet@lwn.net,
	johannes.thumshirn@wdc.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	gregkh@linuxfoundation.org, steve@sk2.org, koct9i@gmail.com,
	agk@redhat.com, pavgel.tide@veeam.com
Subject: Re: [dm-devel] [PATCH v4 2/6] block: add blk_interposer
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 03 2021 at 10:53am -0500,
Sergei Shtepa <sergei.shtepa@veeam.com> wrote:

> blk_interposer allows to intercept bio requests, remap bio to another devices or add new bios.
> 
> Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
> ---
>  block/bio.c               |  2 +
>  block/blk-core.c          | 33 ++++++++++++++++
>  block/genhd.c             | 82 +++++++++++++++++++++++++++++++++++++++
>  include/linux/blk_types.h |  6 ++-
>  include/linux/genhd.h     | 18 +++++++++
>  5 files changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/block/bio.c b/block/bio.c
> index 1f2cc1fbe283..f6f135eb84b5 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -684,6 +684,8 @@ void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
>  	bio_set_flag(bio, BIO_CLONED);
>  	if (bio_flagged(bio_src, BIO_THROTTLED))
>  		bio_set_flag(bio, BIO_THROTTLED);
> +	if (bio_flagged(bio_src, BIO_INTERPOSED))
> +		bio_set_flag(bio, BIO_INTERPOSED);
>  	bio->bi_opf = bio_src->bi_opf;
>  	bio->bi_ioprio = bio_src->bi_ioprio;
>  	bio->bi_write_hint = bio_src->bi_write_hint;
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 7663a9b94b80..c84bc42ba88b 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1032,6 +1032,32 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
>  	return ret;
>  }
>  
> +static blk_qc_t __submit_bio_interposed(struct bio *bio)
> +{
> +	struct bio_list bio_list[2] = { };
> +	blk_qc_t ret = BLK_QC_T_NONE;
> +
> +	current->bio_list = bio_list;
> +	if (likely(bio_queue_enter(bio) == 0)) {
> +		struct gendisk *disk = bio->bi_disk;
> +
> +		if (likely(blk_has_interposer(disk))) {
> +			bio_set_flag(bio, BIO_INTERPOSED);
> +			disk->interposer->ip_submit_bio(bio);
> +		} else /* interposer was removed */
> +			bio_list_add(&current->bio_list[0], bio);

style nit:

} else {
	/* interposer was removed */
	bio_list_add(&current->bio_list[0], bio);
}

> +
> +		blk_queue_exit(disk->queue);
> +	}
> +	current->bio_list = NULL;
> +
> +	/* Resubmit remaining bios */
> +	while ((bio = bio_list_pop(&bio_list[0])))
> +		ret = submit_bio_noacct(bio);
> +
> +	return ret;
> +}
> +
>  /**
>   * submit_bio_noacct - re-submit a bio to the block device layer for I/O
>   * @bio:  The bio describing the location in memory and on the device.
> @@ -1057,6 +1083,13 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
>  		return BLK_QC_T_NONE;
>  	}
>  
> +	/*
> +	 * Checking the BIO_INTERPOSED flag is necessary so that the bio
> +	 * created by the blk_interposer do not get to it for processing.
> +	 */
> +	if (blk_has_interposer(bio->bi_disk) &&
> +	    !bio_flagged(bio, BIO_INTERPOSED))
> +		return __submit_bio_interposed(bio);
>  	if (!bio->bi_disk->fops->submit_bio)
>  		return __submit_bio_noacct_mq(bio);
>  	return __submit_bio_noacct(bio);
> diff --git a/block/genhd.c b/block/genhd.c
> index 419548e92d82..39785a3ef703 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -30,6 +30,7 @@
>  static struct kobject *block_depr;
>  
>  DECLARE_RWSEM(bdev_lookup_sem);
> +DEFINE_MUTEX(bdev_interposer_mutex);

Seems you're using this mutex to protect access to disk->interposer in
attach/detach.  This is to prevent attach/detach races to same device?

Thankfully attach/detach isn't in the bio submission fast path but it'd
be helpful to document what this mutex is protecting).

A storm of attach or detach will all hit this global mutex though...

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

