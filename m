Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 49BE8337B69
	for <lists+dm-devel@lfdr.de>; Thu, 11 Mar 2021 18:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615485323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vMJB/pA8vatPRo8vTdx3DIaH3/SJn2VJj6sLRV/T834=;
	b=JJhaCEKGunzHWfFIj7g6Pzs7kQkbHNa82ToFRQ0MVLE3EqwBmrO1WTnx3/7fHo9tjSarqG
	+t5Pw6+mk1WFjGaQ6v6n+DzvmpRLEd2NVa9YW3k4C/8Ei9YzB8hhj75HAxf1WONWAr7BF2
	QPi32UubPkhcIVBRmDcPAltEckgAqLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-8Ng4xtNKNve0VEcn78kc3g-1; Thu, 11 Mar 2021 12:55:20 -0500
X-MC-Unique: 8Ng4xtNKNve0VEcn78kc3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A9F18460E4;
	Thu, 11 Mar 2021 17:55:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC785DAA5;
	Thu, 11 Mar 2021 17:55:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0B3018006D9;
	Thu, 11 Mar 2021 17:54:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BHsiKD027114 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 12:54:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF63F59464; Thu, 11 Mar 2021 17:54:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB182C15A;
	Thu, 11 Mar 2021 17:54:41 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:54:40 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Message-ID: <20210311175440.GA28509@redhat.com>
References: <20210310082547.576372-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20210310082547.576372-1-shinichiro.kawasaki@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com,
	Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [dm-devel] dm table: Fix zoned model check and zone sectors
	check
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 10 2021 at  3:25am -0500,
Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com> wrote:

> Commit 24f6b6036c9e ("dm table: fix zoned iterate_devices based device
> capability checks") triggered dm table load failure when dm-zoned device
> is set up for zoned block devices and a regular device for cache.
> 
> The commit inverted logic of two callback functions for iterate_devices:
> device_is_zoned_model() and device_matches_zone_sectors(). The logic of
> device_is_zoned_model() was inverted then all destination devices of all
> targets in dm table are required to have the expected zoned model. This
> is fine for dm-linear, dm-flakey and dm-crypt on zoned block devices
> since each target has only one destination device. However, this results
> in failure for dm-zoned with regular cache device since that target has
> both regular block device and zoned block devices.
> 
> As for device_matches_zone_sectors(), the commit inverted the logic to
> require all zoned block devices in each target have the specified
> zone_sectors. This check also fails for regular block device which does
> not have zones.
> 
> To avoid the check failures, fix the zone model check and the zone
> sectors check. For zone model check, invert the device_is_zoned_model()
> logic again to require at least one destination device in one target has
> the specified zoned model. For zone sectors check, skip the check if the
> destination device is not a zoned block device. Also add comments and
> improve error messages to clarify expectations to the two checks.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: 24f6b6036c9e ("dm table: fix zoned iterate_devices based device capability checks")
> ---
>  drivers/md/dm-table.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 95391f78b8d5..04b7a3978ef8 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -1585,13 +1585,13 @@ bool dm_table_has_no_data_devices(struct dm_table *table)
>  	return true;
>  }
>  
> -static int device_not_zoned_model(struct dm_target *ti, struct dm_dev *dev,
> -				  sector_t start, sector_t len, void *data)
> +static int device_is_zoned_model(struct dm_target *ti, struct dm_dev *dev,
> +				 sector_t start, sector_t len, void *data)
>  {
>  	struct request_queue *q = bdev_get_queue(dev->bdev);
>  	enum blk_zoned_model *zoned_model = data;
>  
> -	return blk_queue_zoned_model(q) != *zoned_model;
> +	return blk_queue_zoned_model(q) == *zoned_model;
>  }
>  
>  static bool dm_table_supports_zoned_model(struct dm_table *t,
> @@ -1608,7 +1608,7 @@ static bool dm_table_supports_zoned_model(struct dm_table *t,
>  			return false;
>  
>  		if (!ti->type->iterate_devices ||
> -		    ti->type->iterate_devices(ti, device_not_zoned_model, &zoned_model))
> +		    !ti->type->iterate_devices(ti, device_is_zoned_model, &zoned_model))
>  			return false;
>  	}

The point here is to ensure all zoned devices match the specific model,
right?

I understand commit 24f6b6036c9e wasn't correct, sorry about that.
But I don't think your change is correct either.  It'll allow a mix of
various zoned models (that might come after the first positive match for
the specified zoned_model)... but because the first match short-circuits
the loop those later mismatched zoned devices aren't checked.

Should device_is_zoned_model() also be trained to ignore BLK_ZONED_NONE
(like you did below)?

But _not_ invert the logic, so keep device_not_zoned_model.. otherwise
the first positive return of a match will short-circuit checking all
other devices match.

>  
> @@ -1621,9 +1621,18 @@ static int device_not_matches_zone_sectors(struct dm_target *ti, struct dm_dev *
>  	struct request_queue *q = bdev_get_queue(dev->bdev);
>  	unsigned int *zone_sectors = data;
>  
> +	if (blk_queue_zoned_model(q) == BLK_ZONED_NONE)
> +		return 0;
> +
>  	return blk_queue_zone_sectors(q) != *zone_sectors;
>  }

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

