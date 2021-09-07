Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C948A4021C9
	for <lists+dm-devel@lfdr.de>; Tue,  7 Sep 2021 03:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630978668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DpYre6ow6DpXVFIak+ThGF86dzvyNckqJeWjz9Ez7wA=;
	b=R1VxsZ+CK6c2TdjBW+JFh2J9+gLrbbeA+sIFgePc/SDgLkFO1Rt0JGwkLuB0rQM7zBZLKY
	Qt7fB8FAcyGgYzYaTgJFVdvJFz8OKiCl8UjJnub4FxpC0djykmvtqVCtKI0VXb1lbVUlaC
	Enlx0bJoDZXS1mLtDFRt16aghGShvV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-lH5fmTUtMl6eGTZn_LaDIw-1; Mon, 06 Sep 2021 21:37:46 -0400
X-MC-Unique: lH5fmTUtMl6eGTZn_LaDIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9BB84A5E5;
	Tue,  7 Sep 2021 01:37:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 128D860C05;
	Tue,  7 Sep 2021 01:37:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6932144A59;
	Tue,  7 Sep 2021 01:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1871bRvk020505 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Sep 2021 21:37:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDEB3272A5; Tue,  7 Sep 2021 01:37:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8619927097;
	Tue,  7 Sep 2021 01:37:04 +0000 (UTC)
Date: Tue, 7 Sep 2021 09:37:05 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <YTbCQdieHG07Bz8W@T590>
References: <20210830212538.148729-1-mcgrof@kernel.org>
	<20210830212538.148729-3-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210830212538.148729-3-mcgrof@kernel.org>
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
Subject: Re: [dm-devel] [PATCH v3 2/8] scsi/sr: add error handling support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 30, 2021 at 02:25:32PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/scsi/sr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index 2942a4ec9bdd..72fd21844367 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -779,7 +779,10 @@ static int sr_probe(struct device *dev)
>  	dev_set_drvdata(dev, cd);
>  	disk->flags |= GENHD_FL_REMOVABLE;
>  	sr_revalidate_disk(cd);
> -	device_add_disk(&sdev->sdev_gendev, disk, NULL);
> +
> +	error = device_add_disk(&sdev->sdev_gendev, disk, NULL);
> +	if (error)
> +		goto fail_minor;

You don't undo register_cdrom(), maybe you can use kref_put(&cd->kref, sr_kref_release);
to simplify the error handling.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

