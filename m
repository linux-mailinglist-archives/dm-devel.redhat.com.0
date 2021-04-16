Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 211CB3629A6
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 22:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618606385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wnuYXlepP5Xht1kdvqNMbk1amSDK0dCSuvvCWlLZehw=;
	b=YffvYIu14a881mgcINCcwdo/Ybc5FZ1LZst5dCHZZiJY2ReUZqC9tpEIotTEVnS/o3QnsZ
	AhWnAiizvqKWKWZY8ps4bKziRXcgUYoiQJvoz7M7xRcNj5cB8PhfomWMaYarqQL9ySboW1
	298ihmy4a6rWZhYwxehoQSFWTwiYklk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-2KEXvnmWNGmE8uDNoiP6VQ-1; Fri, 16 Apr 2021 16:53:02 -0400
X-MC-Unique: 2KEXvnmWNGmE8uDNoiP6VQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B15A1006C80;
	Fri, 16 Apr 2021 20:52:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3300F1C4;
	Fri, 16 Apr 2021 20:52:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB33144A5E;
	Fri, 16 Apr 2021 20:52:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GKqbGX005025 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 16:52:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CD685D9E3; Fri, 16 Apr 2021 20:52:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-112-203.phx2.redhat.com (ovpn-112-203.phx2.redhat.com
	[10.3.112.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6963F5D9C6;
	Fri, 16 Apr 2021 20:52:31 +0000 (UTC)
Message-ID: <d679b46e86ee719deb87bd151f01563b2af223d3.camel@redhat.com>
From: "Ewan D. Milne" <emilne@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>, Jens
	Axboe <axboe@kernel.dk>
Date: Fri, 16 Apr 2021 16:52:31 -0400
In-Reply-To: <20210415231530.95464-4-snitzer@redhat.com>
References: <20210415231530.95464-1-snitzer@redhat.com>
	<20210415231530.95464-4-snitzer@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-15 at 19:15 -0400, Mike Snitzer wrote:
> If REQ_FAILFAST_TRANSPORT is set it means the driver should not retry
> IO that completed with transport errors. REQ_FAILFAST_TRANSPORT is
> set by multipathing software (e.g. dm-multipath) before it issues IO.
> 
> Update NVMe to allow failover of requests marked with either
> REQ_NVME_MPATH or REQ_FAILFAST_TRANSPORT. This allows such requests
> to be given a disposition of either FAILOVER or FAILUP respectively.
> FAILUP handling ensures a retryable error is returned up from NVMe.
> 
> Introduce nvme_failup_req() for use in nvme_complete_rq() if
> nvme_decide_disposition() returns FAILUP. nvme_failup_req() ensures
> the request is completed with a retryable IO error when appropriate.
> __nvme_end_req() was factored out for use by both nvme_end_req() and
> nvme_failup_req().
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  drivers/nvme/host/core.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 4134cf3c7e48..10375197dd53 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -299,6 +299,7 @@ enum nvme_disposition {
>  	COMPLETE,
>  	RETRY,
>  	FAILOVER,
> +	FAILUP,
>  };
>  
>  static inline enum nvme_disposition nvme_decide_disposition(struct
> request *req)
> @@ -318,10 +319,11 @@ static inline enum nvme_disposition
> nvme_decide_disposition(struct request *req)
>  	    nvme_req(req)->retries >= nvme_max_retries)
>  		return COMPLETE;
>  
> -	if (req->cmd_flags & REQ_NVME_MPATH) {
> +	if (req->cmd_flags & (REQ_NVME_MPATH | REQ_FAILFAST_TRANSPORT))
> {
>  		if (nvme_is_path_error(nvme_req(req)->status) ||
>  		    blk_queue_dying(req->q))
> -			return FAILOVER;
> +			return (req->cmd_flags & REQ_NVME_MPATH) ?
> +				FAILOVER : FAILUP;
>  	} else {
>  		if (blk_queue_dying(req->q))
>  			return COMPLETE;
> @@ -330,10 +332,8 @@ static inline enum nvme_disposition
> nvme_decide_disposition(struct request *req)
>  	return RETRY;
>  }
>  
> -static inline void nvme_end_req(struct request *req)
> +static inline void __nvme_end_req(struct request *req, blk_status_t
> status)
>  {
> -	blk_status_t status = nvme_error_status(nvme_req(req)->status);
> -
>  	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
>  	    req_op(req) == REQ_OP_ZONE_APPEND)
>  		req->__sector = nvme_lba_to_sect(req->q->queuedata,
> @@ -343,6 +343,24 @@ static inline void nvme_end_req(struct request
> *req)
>  	blk_mq_end_request(req, status);
>  }
>  
> +static inline void nvme_end_req(struct request *req)
> +{
> +	__nvme_end_req(req, nvme_error_status(nvme_req(req)->status));
> +}
> +
> +static void nvme_failup_req(struct request *req)
> +{
> +	blk_status_t status = nvme_error_status(nvme_req(req)->status);
> +
> +	if (WARN_ON_ONCE(!blk_path_error(status))) {
> +		pr_debug("Request meant for failover but blk_status_t
> (errno=%d) was not retryable.\n",
> +			 blk_status_to_errno(status));
> +		status = BLK_STS_IOERR;
> +	}
> +
> +	__nvme_end_req(req, status);

It seems like adding __nvme_end_req() was unnecessary, since
nvme_end_req() just calls it and does nothing else?

-Ewan

> +}
> +
>  void nvme_complete_rq(struct request *req)
>  {
>  	trace_nvme_complete_rq(req);
> @@ -361,6 +379,9 @@ void nvme_complete_rq(struct request *req)
>  	case FAILOVER:
>  		nvme_failover_req(req);
>  		return;
> +	case FAILUP:
> +		nvme_failup_req(req);
> +		return;
>  	}
>  }
>  EXPORT_SYMBOL_GPL(nvme_complete_rq);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

