Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1DC22A4893
	for <lists+dm-devel@lfdr.de>; Tue,  3 Nov 2020 15:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604414978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/V7OLYi7AM4omqHXgP0nXhYcGHmQ5QKhtcMNFLX+hB0=;
	b=QYyJvKtR3kTPYw1xgAq/kHY5oO5Z2ySr1NGwomks5+NM8GoLjrUR8hbrbaOIFnzmHKYbX0
	K/HKPXl/LPf+j8pq4h5RIIaHOtwhFZyEkLBEnMCaleZm1iZuxcutHWETH0earS0PBWXj4c
	C259cOTpTJ0uEf0lfnTscniWAtRmtUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-h6ocUSCTOdm3JFR1zyModQ-1; Tue, 03 Nov 2020 09:49:36 -0500
X-MC-Unique: h6ocUSCTOdm3JFR1zyModQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37218107465A;
	Tue,  3 Nov 2020 14:49:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC4AA385;
	Tue,  3 Nov 2020 14:49:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B27921826D35;
	Tue,  3 Nov 2020 14:49:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A3EmwXt032521 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Nov 2020 09:48:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E17D7747C6; Tue,  3 Nov 2020 14:48:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C297D75127;
	Tue,  3 Nov 2020 14:48:55 +0000 (UTC)
Date: Tue, 3 Nov 2020 08:48:25 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20201103134824.GA26430@redhat.com>
References: <20201103092329.17694-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20201103092329.17694-1-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, dm-devel@redhat.com
Subject: Re: [dm-devel] Why queue_work unneeded for REQUEUE bio
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 03 2020 at  4:23am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Hi Mike,
> 
> Why queue_work() is unnecessary here for bio with BLK_STS_DM_REQUEUE
> returned?
> 
> Thanks
> Jeffle Xu
> 
> ---
>  drivers/md/dm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index c18fc2548518..ae550daa99b5 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -908,9 +908,11 @@ static void dec_pending(struct dm_io *io, blk_status_t error)
>  			 * Target requested pushing back the I/O.
>  			 */
>  			spin_lock_irqsave(&md->deferred_lock, flags);
> -			if (__noflush_suspending(md))
> +			if (__noflush_suspending(md)) {
>  				/* NOTE early return due to BLK_STS_DM_REQUEUE below */
>  				bio_list_add_head(&md->deferred, io->orig_bio);
> +				queue_work(md->wq, &md->work);
> +			}
>  			else
>  				/* noflush suspend was interrupted. */
>  				io->status = BLK_STS_IOERR;
> -- 
> 2.27.0
> 

For the case you highlighted (BLK_STS_DM_REQUEUE + __noflush_suspending)
I think the missing queue_work is because we're actively dealing with
the fact that we do _not_ want to flush IO.  SO kicking the workqueue
there isn't helpful because it just processes work that cannot be issued
yet -- the workqueue will be kicked upon resume (see __dm_resume's
dm_queue_flush).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

