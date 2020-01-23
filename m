Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAF5146669
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 12:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579778015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZSmVTioFSfOiHEfLSaobMSiZageR4vhrhhXaQRBmqY4=;
	b=Aenusn8ZiLrqKEuCIQGjx0haPvJj8R3GAVNdQUQ3MbuBSCVot1ZU6vGMrOaE+W0tB9zTa9
	YDep0qljb8jvAJXtEuYCeqAjHWCximBygq/nKuHSraANUWDvWGJ2Io9vXHCt/Wu6FikNf8
	hPQytvJ9AGBAM6sOzwFs4wyuym90gsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-I5wu4uNzNO-sqcM2Y1J0Kw-1; Thu, 23 Jan 2020 06:13:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 810C9800D50;
	Thu, 23 Jan 2020 11:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 508D81001B2C;
	Thu, 23 Jan 2020 11:13:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDEBD870BE;
	Thu, 23 Jan 2020 11:13:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NANVoW021344 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 05:23:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A69292026D67; Thu, 23 Jan 2020 10:23:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B0F2063205
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 10:23:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E6C8028A0
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 10:23:29 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-4-QZLo6IfFPQeSh_weiQ_8hA-1; Thu, 23 Jan 2020 05:23:25 -0500
Received: from [154.119.55.242] (helo=elm)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <tyhicks@canonical.com>)
	id 1iuZdz-0002Zb-Ck; Thu, 23 Jan 2020 10:23:24 +0000
Date: Thu, 23 Jan 2020 12:23:17 +0200
From: Tyler Hicks <tyhicks@canonical.com>
To: Stefan Bader <stefan.bader@canonical.com>
Message-ID: <20200123102316.GB7611@elm>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20200123091713.12623-2-stefan.bader@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: QZLo6IfFPQeSh_weiQ_8hA-1
X-MC-Unique: I5wu4uNzNO-sqcM2Y1J0Kw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NANVoW021344
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jan 2020 06:13:07 -0500
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-23 11:17:13, Stefan Bader wrote:
> When device-mapper adapted for multi-queue functionality, they
> also re-organized the way the make-request function was set.
> Before, this happened when the device-mapper logical device was
> created. Now it is done once the mapping table gets loaded the
> first time (this also decides whether the block device is request
> or bio based).
> 
> However in generic_make_request(), the request function gets used
> without further checks and this happens if one tries to mount such
> a partially set up device.
> 
> This can easily be reproduced with the following steps:
>  - dmsetup create -n test
>  - mount /dev/dm-<#> /mnt
> 
> This maybe is something which also should be fixed up in device-
> mapper. But given there is already a check for an unset queue
> pointer and potentially there could be other drivers which do or
> might do the same, it sounds like a good move to add another check
> to generic_make_request_checks() and to bail out if the request
> function has not been set, yet.
> 
> BugLink: https://bugs.launchpad.net/bugs/1860231
> Fixes: ff36ab34583a ("dm: remove request-based logic from make_request_fn wrapper")
> Signed-off-by: Stefan Bader <stefan.bader@canonical.com>

I helped debug the crash with Stefan and I think this is the most
straightforward fix (and is trivial to backport for stable kernels). I
looked at delaying the queue allocation in the dm code until the table
load ioctl but I decided that was risky and doesn't help the general
case of preventing other subsystems from making this same mistake.

Tested-by: Tyler Hicks <tyhicks@canonical.com>
Reviewed-by: Tyler Hicks <tyhicks@canonical.com>

Tyler

> ---
>  block/blk-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 1075aaff606d..adcd042edd2d 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -884,6 +884,13 @@ generic_make_request_checks(struct bio *bio)
>  			bio_devname(bio, b), (long long)bio->bi_iter.bi_sector);
>  		goto end_io;
>  	}
> +	if (unlikely(!q->make_request_fn)) {
> +		printk(KERN_ERR
> +		       "generic_make_request: Trying to access "
> +		       "block-device without request function: %s\n",
> +		       bio_devname(bio, b));
> +		goto end_io;
> +	}
>  
>  	/*
>  	 * Non-mq queues do not honor REQ_NOWAIT, so complete a bio
> -- 
> 2.17.1
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

