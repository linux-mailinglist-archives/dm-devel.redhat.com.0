Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3163DA8FA
	for <lists+dm-devel@lfdr.de>; Thu, 29 Jul 2021 18:27:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627576057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h8Lo2ytTB+AXNFbsos5+5Nn8vrtqOZ3R7rccTXqOTtA=;
	b=LIlU2fobA2/zbkYgnnugE+Tsf3NPZg7cRW+WQEe39CdpX3Ah20Qu6zYvwa+Lhl1l+eH5Yi
	Qel+SzD6LJ9quYpVPeMdKk8JBTuuIrQ2maXdUAvMiJgZSF6ZzbOFE0AuuSe8xGZlBwWunV
	jI4kdijNKHeMp683eN9f4vtqI0J/1CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46--GP7QViaOgWBgApxzhJkeA-1; Thu, 29 Jul 2021 12:27:35 -0400
X-MC-Unique: -GP7QViaOgWBgApxzhJkeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F9B1007495;
	Thu, 29 Jul 2021 16:27:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E681059A43;
	Thu, 29 Jul 2021 16:27:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9B2B180B7A2;
	Thu, 29 Jul 2021 16:27:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TGRIt9011709 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 12:27:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87EB920B6620; Thu, 29 Jul 2021 16:27:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EF820B6634
	for <dm-devel@redhat.com>; Thu, 29 Jul 2021 16:27:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11F558CA94A
	for <dm-devel@redhat.com>; Thu, 29 Jul 2021 16:27:15 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-OiMAoj7TNu2gGdWjDxD9DA-1; Thu, 29 Jul 2021 12:27:13 -0400
X-MC-Unique: OiMAoj7TNu2gGdWjDxD9DA-1
Received: by mail-qk1-f199.google.com with SMTP id
	i15-20020a05620a150fb02903b960837cbfso4098481qkk.10
	for <dm-devel@redhat.com>; Thu, 29 Jul 2021 09:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=uEOBn01l7YnL6KGZRxsv0+siSG/m90sijpHh9E6Gd6k=;
	b=oNw+UYBfki2OtOIAQOfB76z/AQWkCHh28bBBW/TbrkKeJJ/xurtsVViYw8opzIQqYZ
	S2F/D+AiMvYHD/yUMTraSwiwE04i3pXr4jzPyx4MuZhxy4L5TxnhX+UxnJwXRIDSnpoz
	09CszjNx1HVyDqfjbU6VxVuPX8pF4rEra4ry1NzMY6Pi2PyxlNK4E3lJTWRnz/bZeldn
	jhh44t9QJdRRjmpUnPvE071h6Ct2RCPaG6DumjT6wAHc+tcPa7FEQbXxqiH/gDn9ilBV
	8MWUZjCnGKFIxAeWr9yBZ5uSJ04GN273Jq9lUKkLE+GdWGLPgqO3eDTxLY2R9SxCcoi4
	VMmw==
X-Gm-Message-State: AOAM531RCt+c/U/z/eo2cBpwOs6FeXy21NrUJwpI19AF8woiX7/rF2Ot
	zoKwu6YhH/u33CAAa6wqJ9aKkw2beLnWQ8mOG0hq40/HVNfwntZ+ChaITckEqLUrKtRkRxBtKgC
	YkGRXeLnJumIOnQ==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr6091396qvi.44.1627576033082; 
	Thu, 29 Jul 2021 09:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF8lgU56Uj/RtYaTxheN50E/rxtVxZjsC/RZqw2WziWfxzdVJFRLWU0fwkN4K3N6/JjEI52A==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr6091376qvi.44.1627576032905; 
	Thu, 29 Jul 2021 09:27:12 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	d129sm1991921qkf.136.2021.07.29.09.27.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Jul 2021 09:27:12 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:27:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YQLW30arkuTQkKkJ@redhat.com>
References: <20210725055458.29008-1-hch@lst.de>
	<20210725055458.29008-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210725055458.29008-3-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/8] block: remove the extra kobject
 reference in bd_link_disk_holder
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 25 2021 at  1:54P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> With the new block_device life time rules there is no way for the
> bdev to go away as long as there is a holder, so remove these.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Might be useful to reference the primary commit that introduced "the
new block_device life time rules" just so readers can inform
themselves.

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

> ---
>  block/holder.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/block/holder.c b/block/holder.c
> index 904a1dcd5c12..960654a71342 100644
> --- a/block/holder.c
> +++ b/block/holder.c
> @@ -92,11 +92,6 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
>  	ret = add_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
>  	if (ret)
>  		goto out_del;
> -	/*
> -	 * bdev could be deleted beneath us which would implicitly destroy
> -	 * the holder directory.  Hold on to it.
> -	 */
> -	kobject_get(bdev->bd_holder_dir);
>  
>  	list_add(&holder->list, &bdev->bd_holder_disks);
>  	goto out_unlock;
> @@ -130,7 +125,6 @@ void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
>  	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
>  		del_symlink(disk->slave_dir, bdev_kobj(bdev));
>  		del_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
> -		kobject_put(bdev->bd_holder_dir);
>  		list_del_init(&holder->list);
>  		kfree(holder);
>  	}
> -- 
> 2.30.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

