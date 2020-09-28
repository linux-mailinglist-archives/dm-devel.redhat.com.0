Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 354AE27B15A
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 18:04:06 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601309045;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=maX42q49rUIdxPj8obJnIdf5CN5c0WwUDwrFElO+2Sk=;
	b=WIMpPFvoEX1F+bHxvPKqUonuD0SWxyUG1lzdK0Nk1sggDeQtu2+28ntBvlDN7ziZszKX+q
	YN91SVre9MgnL1U9zC0YwYGL4y3JKhrm6IYq9BD+UkmOqH74pPHifGhDK8EJwomrFQloCF
	2VugSReHocDqnXwatsB7Ctai2QJnZtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-_wPw5iv9PbWWfGSLZ_sW2w-1; Mon, 28 Sep 2020 12:04:02 -0400
X-MC-Unique: _wPw5iv9PbWWfGSLZ_sW2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7CCB10BBEC3;
	Mon, 28 Sep 2020 16:03:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B435D9CC;
	Mon, 28 Sep 2020 16:03:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 079A944A4E;
	Mon, 28 Sep 2020 16:03:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SG3VPw018836 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 12:03:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB6227BD1; Mon, 28 Sep 2020 16:03:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86EA51A8AC;
	Mon, 28 Sep 2020 16:03:23 +0000 (UTC)
Date: Mon, 28 Sep 2020 12:03:22 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20200928160322.GA23320@redhat.com>
References: <20200927120435.44118-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20200927120435.44118-1-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, ming.lei@redhat.com
Subject: Re: [dm-devel] dm: fix imposition of queue_limits in dm_wq_work()
	thread
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 27 2020 at  8:04am -0400,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Hi Mike, would you mind further expalin why bio processed by dm_wq_work()
> always gets a previous ->submit_bio. Considering the following call graph:
> 
> ->submit_bio, that is, dm_submit_bio
>   DMF_BLOCK_IO_FOR_SUSPEND set, thus queue_io()
> 
> then worker thread dm_wq_work()
>   dm_process_bio  // at this point. the input bio is the original bio
>                      submitted to dm device
> 
> Please let me know if I missed something.
> 
> Thanks.
> Jeffle

In general you have a valid point, that blk_queue_split() won't have
been done for the suspended device case, but blk_queue_split() cannot be
used if not in ->submit_bio -- IIUC you cannot just do it from a worker
thread and hope to have proper submission order (depth first) as
provided by __submit_bio_noacct().  Because this IO will be submitted
from worker you could have multiple threads allocating from the
q->bio_split mempool at the same time.

All said, I'm not quite sure how to address this report.  But I'll keep
at it and see what I can come up with.

Thanks,
Mike

> Original commit log:
> dm_process_bio() can be called by dm_wq_work(), and if the currently
> processing bio is the very beginning bio submitted to the dm device,
> that is it has not been handled by previous ->submit_bio, then we also
> need to impose the queue_limits when it's in thread (dm_wq_work()).
> 
> Fixes: cf9c37865557 ("dm: fix comment in dm_process_bio()")
> Fixes: 568c73a355e0 ("dm: update dm_process_bio() to split bio if in ->make_request_fn()")
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  drivers/md/dm.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 6ed05ca65a0f..54471c75ddef 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1744,17 +1744,13 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
>  	}
>  
>  	/*
> -	 * If in ->submit_bio we need to use blk_queue_split(), otherwise
> -	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
> -	 * won't be imposed.
> -	 * If called from dm_wq_work() for deferred bio processing, bio
> -	 * was already handled by following code with previous ->submit_bio.
> +	 * Call blk_queue_split() so that queue_limits for abnormal requests
> +	 * (e.g. discard, writesame, etc) are ensured to be imposed, while
> +	 * it's not needed for regular IO, since regular IO will be split by
> +	 * following __split_and_process_bio.
>  	 */
> -	if (current->bio_list) {
> -		if (is_abnormal_io(bio))
> -			blk_queue_split(&bio);
> -		/* regular IO is split by __split_and_process_bio */
> -	}
> +	if (is_abnormal_io(bio))
> +		blk_queue_split(&bio);
>  
>  	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
>  		return __process_bio(md, map, bio, ti);
> -- 
> 2.27.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

