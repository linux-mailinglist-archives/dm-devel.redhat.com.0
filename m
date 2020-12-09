Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 55EE52D38FF
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 03:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607482394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wnbiIpE7TC5/zaB04AAtI2ovw0ejbyRfFdWyATAV3v8=;
	b=U1ZIxo/vJhPKwadlklmx9x15w6PmlBPU9UJIBzYwC0DkLBVA2FR3seUuyWwgLByfbLW4jb
	XBNeS0GNafuoar1fCc6vte60DA9lgYojk467Ac5xtHqq2JkP4u1AN1cX728eVzoEJIhvXb
	CfiaaaS520WaN7x8CPwvhyGBfExZrLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-eLjE4l3nN2WL7-IC7opwAA-1; Tue, 08 Dec 2020 21:53:12 -0500
X-MC-Unique: eLjE4l3nN2WL7-IC7opwAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE54F858182;
	Wed,  9 Dec 2020 02:53:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F35C5D6AB;
	Wed,  9 Dec 2020 02:53:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A209A4BB7B;
	Wed,  9 Dec 2020 02:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B92qvNX016890 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 21:52:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7800E60BD8; Wed,  9 Dec 2020 02:52:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84BED6064B;
	Wed,  9 Dec 2020 02:52:41 +0000 (UTC)
Date: Wed, 9 Dec 2020 10:52:36 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201209025236.GE1217988@T590>
References: <20201208162829.2424563-1-hch@lst.de>
	<20201208162829.2424563-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201208162829.2424563-6-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 5/6] rbd: remove the ->set_read_only method
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 05:28:28PM +0100, Christoph Hellwig wrote:
> Now that the hardware read-only state can't be changed by the BLKROSET
> ioctl, the code in this method is not required anymore.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Acked-by: Ilya Dryomov <idryomov@gmail.com>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>  drivers/block/rbd.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 2ed79b09439a82..2c64ca15ca079f 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -692,29 +692,10 @@ static void rbd_release(struct gendisk *disk, fmode_t mode)
>  	put_device(&rbd_dev->dev);
>  }
>  
> -static int rbd_set_read_only(struct block_device *bdev, bool ro)
> -{
> -	struct rbd_device *rbd_dev = bdev->bd_disk->private_data;
> -
> -	/*
> -	 * Both images mapped read-only and snapshots can't be marked
> -	 * read-write.
> -	 */
> -	if (!ro) {
> -		if (rbd_is_ro(rbd_dev))
> -			return -EROFS;
> -
> -		rbd_assert(!rbd_is_snap(rbd_dev));
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct block_device_operations rbd_bd_ops = {
>  	.owner			= THIS_MODULE,
>  	.open			= rbd_open,
>  	.release		= rbd_release,
> -	.set_read_only		= rbd_set_read_only,
>  };
>  
>  /*
> -- 
> 2.29.2
> 

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

