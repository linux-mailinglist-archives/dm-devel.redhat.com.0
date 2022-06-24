Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F2558F00
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jun 2022 05:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656040753;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r8oHJJ6AvbOXJBrAi8lcs8QvZqAQ1et7U5H2j0+HU0Y=;
	b=HxmFasAQie7lHmt21DsP+aq8JSorJWHmPRMY6wwfD6SseESSdRbgGmSpYaS25akUA1yW+d
	YiDERJZhP5hv0ZRhzICP5V3Be5MDRQTAtL8Adp0lmVDEfCENwDpF4c0emXZC/Twxie/FUe
	rRpehGXUMjw+A5zgh+0ELy4DoQ1Z14o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-Qg7qWW6XMtmpgAz9xUgROw-1; Thu, 23 Jun 2022 23:19:09 -0400
X-MC-Unique: Qg7qWW6XMtmpgAz9xUgROw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE550811E75;
	Fri, 24 Jun 2022 03:19:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5FA416171;
	Fri, 24 Jun 2022 03:19:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E8D8194B96A;
	Fri, 24 Jun 2022 03:19:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2064F1947065
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Jun 2022 03:19:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA9042166B29; Fri, 24 Jun 2022 03:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D711D2166B26
 for <dm-devel@redhat.com>; Fri, 24 Jun 2022 03:18:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC93785A589
 for <dm-devel@redhat.com>; Fri, 24 Jun 2022 03:18:59 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-VIMkKwEmM2u_2b2mG2YM1g-1; Thu, 23 Jun 2022 23:18:58 -0400
X-MC-Unique: VIMkKwEmM2u_2b2mG2YM1g-1
Received: by mail-qk1-f197.google.com with SMTP id
 g194-20020a379dcb000000b006aef700d954so1330173qke.1
 for <dm-devel@redhat.com>; Thu, 23 Jun 2022 20:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h4xUByCtEyPuFHXBYoP0amCXtuvgDG2xZPEiJrGByQU=;
 b=AaZB1ePICD/cl367S+IjgTKA7nnq/MoiNRqoTBriwO1ZZ+XzMKxgJscgIhWwv6CN7L
 o8mElQ9D1E6WIl4ziowGklV5gGUGyvwLmGBwaGRxPS8ncjqbN7jr3KbRtx1Sx+GJ7SFP
 iA+zl2Y1MHufSYI9rEpOzDxhCr+RCwpAlY9xOoVqHmMSQMPZnGoL9Atxx/lc7Pbu8usw
 jUKo8hcudxwlqdCEI9hVmmKs2wo/Anrg0+NVCJwsFe34eQPzldSIGoDNfnuznKRnN3kQ
 JtCPW5HP4TdtQj3EF7pepNfQg56Z59mDD7ZCxtm+ffBbkoyLgsu9f2ID+ZMZTMSyRpXI
 qgXw==
X-Gm-Message-State: AJIora+PEnUlZSHl0r6sfGpNLaOmv85lgTAK1Ri4zHBEzW+H2kCSQBpQ
 anRtdJL4GJNpcXNuRXIhoGiU9iuwUH9s8mYeUgiG4t74ZL38quQEjYS275WFtWptnznopyyDtZx
 nU77IH6d6XGhHqA==
X-Received: by 2002:a05:620a:15ed:b0:6a9:78fa:cca6 with SMTP id
 p13-20020a05620a15ed00b006a978facca6mr9033161qkm.129.1656040738136; 
 Thu, 23 Jun 2022 20:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6xXNvKeui6D3w0fZ3hfxaD+/04qyCHL1k6ukHN5JFSlXkIJ4eqltkIHX4UpZCvGxFtNneAA==
X-Received: by 2002:a05:620a:15ed:b0:6a9:78fa:cca6 with SMTP id
 p13-20020a05620a15ed00b006a978facca6mr9033151qkm.129.1656040737898; 
 Thu, 23 Jun 2022 20:18:57 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05620a295500b006a758ce2ae1sm1011981qkp.104.2022.06.23.20.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 20:18:57 -0700 (PDT)
Date: Thu, 23 Jun 2022 23:18:56 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <YrUtIMw88V0oNUcT@redhat.com>
References: <20220623132005.2179011-1-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220623132005.2179011-1-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] dm: fix dm io BLK_STS_DM_REQUEUE
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 23 2022 at  9:20P -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> Commit 7dd76d1feec7 ("dm: improve bio splitting and associated IO accounting")
> removes cloned bio when dm io splitting is needed. This way will make
> multiple dm io instance sharing same original bio, and it works fine if
> IOs are completed successfully. But regression may be caused if
> BLK_STS_DM_REQUEUE is returned from either one of cloned io.
> 
> If case of BLK_STS_DM_REQUEUE from one cloned io, only the mapped part
> of original bio for the current exact dm io needs to be re-submitted.
> However, since the original bio is shared among all dm io instances,
> actually the original bio only represents the last dm io instance, so
> requeue can't work as expected. Also when more than one dm io is
> requeued, the same original bio is requeued from all dm io's completion
> handler, then race is caused.
> 
> Fix the issue by still allocating one bio for completing io only, then
> io accounting can reply on ->orig_bio.
> 
> Based on one earlier version from Mike.
> 
> In theory, we can delay the bio clone when BLK_STS_DM_REQUEUE happens,
> but that approach is a bit complicated: 1) bio clone needs to be done in
> task context; 2) one block interface for unwinding bio is required.
> 
> Cc: Benjamin Marzinski <bmarzins@redhat.com>
> Fixes: 7dd76d1feec7 ("dm: improve bio splitting and associated IO accounting")
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
>  drivers/md/dm-core.h |  2 +-
>  drivers/md/dm.c      | 10 ++++++----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> index 54c0473a51dd..32f461c624c6 100644
> --- a/drivers/md/dm-core.h
> +++ b/drivers/md/dm-core.h
> @@ -273,7 +273,7 @@ struct dm_io {
>  	struct mapped_device *md;
>  
>  	/* The three fields represent mapped part of original bio */
> -	struct bio *orig_bio;
> +	struct bio *orig_bio, *bak_bio;
>  	unsigned int sector_offset; /* offset to end of orig_bio */
>  	unsigned int sectors;
>  
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 9ede55278eec..85d8f2f1c9c8 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -594,6 +594,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
>  	atomic_set(&io->io_count, 2);
>  	this_cpu_inc(*md->pending_io);
>  	io->orig_bio = bio;
> +	io->bak_bio = NULL;
>  	io->md = md;
>  	spin_lock_init(&io->lock);
>  	io->start_time = jiffies;
> @@ -887,7 +888,7 @@ static void dm_io_complete(struct dm_io *io)
>  {
>  	blk_status_t io_error;
>  	struct mapped_device *md = io->md;
> -	struct bio *bio = io->orig_bio;
> +	struct bio *bio = io->bak_bio ? io->bak_bio : io->orig_bio;
>  
>  	if (io->status == BLK_STS_DM_REQUEUE) {
>  		unsigned long flags;
> @@ -1693,9 +1694,10 @@ static void dm_split_and_process_bio(struct mapped_device *md,
>  	 * Remainder must be passed to submit_bio_noacct() so it gets handled
>  	 * *after* bios already submitted have been completely processed.
>  	 */
> -	bio_trim(bio, io->sectors, ci.sector_count);
> -	trace_block_split(bio, bio->bi_iter.bi_sector);
> -	bio_inc_remaining(bio);
> +	io->bak_bio = bio_split(bio, bio_sectors(bio) - ci.sector_count,
> +			GFP_NOIO, &md->queue->bio_split);
> +	bio_chain(io->bak_bio, bio);
> +	trace_block_split(io->bak_bio, bio->bi_iter.bi_sector);
>  	submit_bio_noacct(bio);
>  out:
>  	/*
> -- 
> 2.31.1

FYI, I renamed bak_bio to split_bio.  I also made use of io->sectors
and added a WARN_ON_ONCE, please see:

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.19&id=61b6e2e5321da281ab3c0c04e1962b3d000f6248

It worked in Ben's latest testing.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

