Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84263334A36
	for <lists+dm-devel@lfdr.de>; Wed, 10 Mar 2021 22:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615413477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HS0HTWlBju6RODLo+PDLAN1ZClQ5tdZvM6+8r3LQzWI=;
	b=KUeUcqJWSrPfwZxYdCbXr+UCV0cBKqvIGYeWghPAj3+ga6S4rYQjc4HzpcfYxSRaiVIbeG
	ylFh1FbyAAjZLVq8eqNc5784WW5yLZ1pGz2Ve9MAAns1g85poKDmL/mAmzbFNExKdGYunu
	apXCRv/xxDiU86y/j2mzBA7+cFbGSv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-QGZSoO3aNDCdChVLpynjTQ-1; Wed, 10 Mar 2021 16:57:55 -0500
X-MC-Unique: QGZSoO3aNDCdChVLpynjTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A76219067E4;
	Wed, 10 Mar 2021 21:57:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29CD19725;
	Wed, 10 Mar 2021 21:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E3875002F;
	Wed, 10 Mar 2021 21:57:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12ALvW9U020471 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 16:57:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 409155886A; Wed, 10 Mar 2021 21:57:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 864A15C22A;
	Wed, 10 Mar 2021 21:57:28 +0000 (UTC)
Date: Wed, 10 Mar 2021 16:57:27 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210310215727.GA23410@redhat.com>
References: <20210303115740.127001-1-jefflexu@linux.alibaba.com>
	<20210303115740.127001-10-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210303115740.127001-10-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, caspar@linux.alibaba.com, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com,
	mpatocka@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 09/12] nvme/pci: don't wait for locked
	polling queue
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 03 2021 at  6:57am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> There's no sense waiting for the hw queue when it currently has been
> locked by another polling instance. The polling instance currently
> occupying the hw queue will help reap the completion events.
> 
> It shall be safe to surrender the hw queue, as long as we could reapply
> for polling later. For Synchronous polling, blk_poll() will reapply for
> polling, since @spin is always True in this case. While For asynchronous
> polling, i.e. io_uring itself will reapply for polling when the previous
> polling returns 0.
> 
> Besides, it shall do no harm to the polling performance of mq devices.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

You should probably just send this to the linux-nvme list independent of
this patchset.

Mike


> ---
>  drivers/nvme/host/pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 38b0d694dfc9..150e56ed6d15 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1106,7 +1106,9 @@ static int nvme_poll(struct blk_mq_hw_ctx *hctx)
>  	if (!nvme_cqe_pending(nvmeq))
>  		return 0;
>  
> -	spin_lock(&nvmeq->cq_poll_lock);
> +	if (!spin_trylock(&nvmeq->cq_poll_lock))
> +		return 0;
> +
>  	found = nvme_process_cq(nvmeq);
>  	spin_unlock(&nvmeq->cq_poll_lock);
>  
> -- 
> 2.27.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

