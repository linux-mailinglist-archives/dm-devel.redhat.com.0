Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3059A26D82F
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 11:55:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-33qU07QRPIWPf2oFDpxxuA-1; Thu, 17 Sep 2020 05:55:32 -0400
X-MC-Unique: 33qU07QRPIWPf2oFDpxxuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A910364085;
	Thu, 17 Sep 2020 09:55:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BB116D43;
	Thu, 17 Sep 2020 09:55:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D68628C7AD;
	Thu, 17 Sep 2020 09:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H9tGCe013792 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 05:55:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E6752144B2F; Thu, 17 Sep 2020 09:55:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A12D2166B27
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:55:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51E07186E120
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:55:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-301-4xJAC0yrOsyRYaole6yXXQ-1;
	Thu, 17 Sep 2020 05:55:09 -0400
X-MC-Unique: 4xJAC0yrOsyRYaole6yXXQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 40398AEC8;
	Thu, 17 Sep 2020 09:55:41 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 0A4781E12E1; Thu, 17 Sep 2020 11:55:07 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:55:07 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917095507.GJ7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 03/12] drbd: remove RB_CONGESTED_REMOTE
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:23, Christoph Hellwig wrote:
> This case isn't ever used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Are you sure it's never used? As far as I'm reading drdb code the contents
of the disk_conf structure seems to be received through netlink (that code
is really a macro hell) and so read_balancing attribute passed to
remote_due_to_read_balancing() can have any value userspace passed to it.

								Honza

> ---
>  drivers/block/drbd/drbd_req.c | 4 ----
>  include/linux/drbd.h          | 1 -
>  2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index 5c975af9c15fb8..481bc34fcf386a 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -901,13 +901,9 @@ static bool drbd_may_do_local_read(struct drbd_device *device, sector_t sector,
>  static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t sector,
>  		enum drbd_read_balancing rbm)
>  {
> -	struct backing_dev_info *bdi;
>  	int stripe_shift;
>  
>  	switch (rbm) {
> -	case RB_CONGESTED_REMOTE:
> -		bdi = device->ldev->backing_bdev->bd_disk->queue->backing_dev_info;
> -		return bdi_read_congested(bdi);
>  	case RB_LEAST_PENDING:
>  		return atomic_read(&device->local_cnt) >
>  			atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
> diff --git a/include/linux/drbd.h b/include/linux/drbd.h
> index 5755537b51b114..6a8286132751df 100644
> --- a/include/linux/drbd.h
> +++ b/include/linux/drbd.h
> @@ -94,7 +94,6 @@ enum drbd_read_balancing {
>  	RB_PREFER_REMOTE,
>  	RB_ROUND_ROBIN,
>  	RB_LEAST_PENDING,
> -	RB_CONGESTED_REMOTE,
>  	RB_32K_STRIPING,
>  	RB_64K_STRIPING,
>  	RB_128K_STRIPING,
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

