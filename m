Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D972C3499AB
	for <lists+dm-devel@lfdr.de>; Thu, 25 Mar 2021 19:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616697960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZXEF9VGbUp6kgaYDlD9ahIEvFpSN6MKAQQINrIfmFxg=;
	b=JHSYcdm5DR28P0t2/ZFil3VdNxpktAnF7hSjdpRmH1M0cQuqws989z41FZdIbMabwfmC3S
	Engpfj4sIpZ1zkuDbIVaCJugEC2HGzxQsUPKyZwa+JxSN4/BiDEedklM2xs6MQb9sljzDe
	W8UloeH3yLghZ+aInsjTKvHflHAToL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-6BE-iyMJOiiKj4QxHMPs5A-1; Thu, 25 Mar 2021 14:45:58 -0400
X-MC-Unique: 6BE-iyMJOiiKj4QxHMPs5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F17D410834E2;
	Thu, 25 Mar 2021 18:45:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D88425D9CA;
	Thu, 25 Mar 2021 18:45:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17ECA4BB7C;
	Thu, 25 Mar 2021 18:45:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12PIjP0d013860 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 14:45:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 364325C260; Thu, 25 Mar 2021 18:45:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7506E77520;
	Thu, 25 Mar 2021 18:45:19 +0000 (UTC)
Date: Thu, 25 Mar 2021 14:45:19 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210325184519.GB17820@redhat.com>
References: <20210324121927.362525-1-ming.lei@redhat.com>
	<20210324121927.362525-14-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210324121927.362525-14-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [PATCH V3 13/13] dm: support IO polling for
	bio-based dm device
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

On Wed, Mar 24 2021 at  8:19am -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> From: Jeffle Xu <jefflexu@linux.alibaba.com>
> 
> IO polling is enabled when all underlying target devices are capable
> of IO polling. The sanity check supports the stacked device model, in
> which one dm device may be build upon another dm device. In this case,
> the mapped device will check if the underlying dm target device
> supports IO polling.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
>  drivers/md/dm-table.c         | 24 ++++++++++++++++++++++++
>  drivers/md/dm.c               | 14 ++++++++++++++
>  include/linux/device-mapper.h |  1 +
>  3 files changed, 39 insertions(+)
> 

...

> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 50b693d776d6..fe6893b078dc 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1720,6 +1720,19 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
>  	return ret;
>  }
>  
> +static bool dm_bio_poll_capable(struct gendisk *disk)
> +{
> +	int ret, srcu_idx;
> +	struct mapped_device *md = disk->private_data;
> +	struct dm_table *t;
> +
> +	t = dm_get_live_table(md, &srcu_idx);
> +	ret = dm_table_supports_poll(t);
> +	dm_put_live_table(md, srcu_idx);
> +
> +	return ret;
> +}
> +

I know this code will only get called by blk-core if bio-based but there
isn't anything about this method's implementation that is inherently
bio-based only.

So please rename from dm_bio_poll_capable to dm_poll_capable

Other than that:

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

>  /*-----------------------------------------------------------------
>   * An IDR is used to keep track of allocated minor numbers.
>   *---------------------------------------------------------------*/
> @@ -3132,6 +3145,7 @@ static const struct pr_ops dm_pr_ops = {
>  };
>  
>  static const struct block_device_operations dm_blk_dops = {
> +	.poll_capable = dm_bio_poll_capable,
>  	.submit_bio = dm_submit_bio,
>  	.open = dm_blk_open,
>  	.release = dm_blk_close,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

