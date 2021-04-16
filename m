Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C557536290E
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 22:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618603715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qgY5QuibSgAtZYTfBjHy2JgNy8mi8arGI38wOnc1Gjs=;
	b=U7xSU+9yzQfMNVeSkvB+tqYBEbutSRhOIexIyaMS7MuMd41BW/2jgeKD74h6uU6Vui4J/G
	L8esOqNmP5RLGfjfe8/LrFzHK4qqHQKq6fIH88f8F3oWKnxAE0PC6LyA57/Tw1qtP6geLh
	gZJitBc4dWqCHzhsD/aHcFMLJEHi2tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-MWq2dxDqOBCJTTFul-1mtw-1; Fri, 16 Apr 2021 16:08:32 -0400
X-MC-Unique: MWq2dxDqOBCJTTFul-1mtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9B518397A3;
	Fri, 16 Apr 2021 20:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 828742619A;
	Fri, 16 Apr 2021 20:08:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B25F244A5E;
	Fri, 16 Apr 2021 20:08:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GK3miI000998 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 16:03:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4484610023B5; Fri, 16 Apr 2021 20:03:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-112-203.phx2.redhat.com (ovpn-112-203.phx2.redhat.com
	[10.3.112.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF73107D5C0;
	Fri, 16 Apr 2021 20:03:40 +0000 (UTC)
Message-ID: <01f223290184e0b2301c8dadc435520594c3dee9.camel@redhat.com>
From: "Ewan D. Milne" <emilne@redhat.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Fri, 16 Apr 2021 16:03:40 -0400
In-Reply-To: <6185100e-89e6-0a7f-8901-9ce86fe8f1ac@suse.de>
References: <20210415231530.95464-1-snitzer@redhat.com>
	<20210415231530.95464-4-snitzer@redhat.com>
	<6185100e-89e6-0a7f-8901-9ce86fe8f1ac@suse.de>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v2 3/4] nvme: introduce FAILUP handling for
 REQ_FAILFAST_TRANSPORT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-04-16 at 16:07 +0200, Hannes Reinecke wrote:
> 
> Hmm. Quite convoluted, methinks.
> Shouldn't this achieve the same thing?
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index e89ec2522ca6..8c36a2196b66 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -303,8 +303,10 @@ static inline enum nvme_disposition
> nvme_decide_disposition(struct request *req)
>         if (likely(nvme_req(req)->status == 0))
>                 return COMPLETE;
> 
> -       if (blk_noretry_request(req) ||
> -           (nvme_req(req)->status & NVME_SC_DNR) ||
> +       if (blk_noretry_request(req))
> +               nvme_req(req)->status |= NVME_SC_DNR;
> +
> +       if ((nvme_req(req)->status & NVME_SC_DNR) ||
>             nvme_req(req)->retries >= nvme_max_retries)
>                 return COMPLETE;
> 

I am not in favor of altering ->status to set DNR jus to
simplify the following conditional.

-Ewan

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

