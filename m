Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD23E2ACE
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 09:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571900950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TsEuUIXGmPUDvY65UhpSFJ7qRIxPuSYTjoaTER7uyrI=;
	b=bo/3kOvgfzT26HUqn3obRwPJ1Fkr5NSgkmXy8btmGZZwL7QqNLrpnegL7IvDmYP39iJv5P
	91Ddwl0DxLvHNnQ0rMhjjURfWZXkgT9LUPI4aiBI+rwJGBifF3GWmqS0ayXKu8q6gpekFY
	+vW4kJHMup9DDf5iJoyaACMf6eOMkWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-eHmXMpK0MBSzWqMwkE_D-g-1; Thu, 24 Oct 2019 03:09:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3948800D4C;
	Thu, 24 Oct 2019 07:09:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8C75C1B5;
	Thu, 24 Oct 2019 07:09:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A9FD4E58A;
	Thu, 24 Oct 2019 07:08:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O78lMd014208 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 03:08:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E0C2600CC; Thu, 24 Oct 2019 07:08:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25182600C4;
	Thu, 24 Oct 2019 07:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C8C0307D847;
	Thu, 24 Oct 2019 07:08:42 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iNXEc-0008Dq-6w; Thu, 24 Oct 2019 07:08:38 +0000
Date: Thu, 24 Oct 2019 00:08:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191024070838.GA19572@infradead.org>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
	<20191024065006.8684-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191024065006.8684-2-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Thu, 24 Oct 2019 07:08:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 24 Oct 2019 07:08:42 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+7d07f63deafc16831ef1+5905+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 1/4] block: Enhance
	blk_revalidate_disk_zones()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: eHmXMpK0MBSzWqMwkE_D-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 4bc5f260248a..293891b7068a 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -441,6 +441,57 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
>  	q->seq_zones_wlock = NULL;
>  }
>  
> +/**
> + * blk_check_zone - Check a zone information
> + * @q:		request queue
> + * @zone:	the zone to  check
> + * @sector:	start sector of the zone
> + *
> + * Helper function to check zones of a zoned block device. Returns true if the
> + * zone is correct and false if a problem is detected.
> + */
> +static bool blk_check_zone(struct gendisk *disk, struct blk_zone *zone,
> +			   sector_t *sector)

Maybe call this blk_zone_valid?  Also in many places we don't really
do the verbose kerneldoc comments with the duplicated parameter names
for local functions, as the scripts only pick up non-stack ones anyway.

> +	/*
> +	 * All zones must have the same size, with the exception on an eventual
> +	 * smaller last zone.
> +	 */
> +	if (zone->start + zone_sectors < capacity &&
> +	    zone->len != zone_sectors) {
> +		pr_warn("%s: Invalid zone device with non constant zone size\n",
> +			disk->disk_name);
> +		return false;
> +	}

I think we should also move the power of two zone size check here
instead of leaving it in the driver.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

