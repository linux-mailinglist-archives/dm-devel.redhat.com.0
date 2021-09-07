Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1C2F4021C6
	for <lists+dm-devel@lfdr.de>; Tue,  7 Sep 2021 03:30:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630978212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sl4eBN1HSsTJgPC6vjKSD/RtgbiGig81EkaetkueiRw=;
	b=MqCLN8GrD8x0vUoUPd5EewJVUvD4zoKJ1b9GWHFdpdyCjHiOTuYgl19zM8gx04FjReX1lK
	JSq49DwnZttuliMy3UBbjyKXOyZ+e6gT9ijtJOURAMhdY2uPWJf678iux+4YQSmy5yBDGL
	+vuwsJtxNKZwl6Ydpt9qthlzUbYF0Rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-TX6CxNgVPSiFcF2GYIQbhg-1; Mon, 06 Sep 2021 21:30:10 -0400
X-MC-Unique: TX6CxNgVPSiFcF2GYIQbhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8898310054F6;
	Tue,  7 Sep 2021 01:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 168205D9DD;
	Tue,  7 Sep 2021 01:29:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B77F1809C98;
	Tue,  7 Sep 2021 01:29:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1871TTEw019260 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Sep 2021 21:29:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 011A427080; Tue,  7 Sep 2021 01:29:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B103271B3;
	Tue,  7 Sep 2021 01:29:06 +0000 (UTC)
Date: Tue, 7 Sep 2021 09:29:07 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <YTbAYyo0+rqUZ+L0@T590>
References: <20210830212538.148729-1-mcgrof@kernel.org>
	<20210830212538.148729-2-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210830212538.148729-2-mcgrof@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: ulf.hansson@linaro.org, snitzer@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, agk@redhat.com,
	beanhuo@micron.com, sagi@grimberg.me, linux-scsi@vger.kernel.org,
	hch@infradead.org, jejb@linux.ibm.com, josef@toxicpanda.com,
	swboyd@chromium.org, linux-block@vger.kernel.org,
	avri.altman@wdc.com, kbusch@kernel.org, nbd@other.debian.org,
	bvanassche@acm.org, axboe@kernel.dk, martin.petersen@oracle.com,
	linux-mmc@vger.kernel.org, adrian.hunter@intel.com
Subject: Re: [dm-devel] [PATCH v3 1/8] scsi/sd: add error handling support
	for add_disk()
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

On Mon, Aug 30, 2021 at 02:25:31PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/scsi/sd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index 610ebba0d66e..8c1273fff23e 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3487,7 +3487,11 @@ static int sd_probe(struct device *dev)
>  		pm_runtime_set_autosuspend_delay(dev,
>  			sdp->host->hostt->rpm_autosuspend_delay);
>  	}
> -	device_add_disk(dev, gd, NULL);
> +
> +	error = device_add_disk(dev, gd, NULL);
> +	if (error)
> +		goto out_free_index;
> +

The error handling is actually wrong, see 

	https://lore.kernel.org/linux-scsi/c93f3010-13c9-e07f-1458-b6b47a27057b@acm.org/T/#t

Maybe you can base on that patch.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

