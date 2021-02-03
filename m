Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3289430DF3E
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 17:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612368632;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+f66qfNxXOpMZGXwGtxnx6zPxmJeWh7ZevqUuV5H0YY=;
	b=HufCWrRGW/r2+lTzkl6yt1q+xEHDu8zF3kQvokRAd6EdhbS4Ills9kAM/995oJDNkTqUfD
	13rH/QB2r1lVGKDOJu+XqxiDSTkNfu6uytOX1JfxkG6mvIkBAzOkQXBLwHAMnjpKqnMK2A
	P/LrSON65vLtQbLTSUnmkTSjNBYy4dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-NEc-UT_DNie8D4Sn8tUEjQ-1; Wed, 03 Feb 2021 11:10:29 -0500
X-MC-Unique: NEc-UT_DNie8D4Sn8tUEjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5525107ACC7;
	Wed,  3 Feb 2021 16:10:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D06605B4A1;
	Wed,  3 Feb 2021 16:10:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7745D18095CB;
	Wed,  3 Feb 2021 16:10:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113GA3Cl011208 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 11:10:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 067D41E6; Wed,  3 Feb 2021 16:10:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AF005FC3A;
	Wed,  3 Feb 2021 16:09:56 +0000 (UTC)
Date: Wed, 3 Feb 2021 11:09:55 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <20210203160955.GA21359@redhat.com>
References: <1612367638-3794-1-git-send-email-sergei.shtepa@veeam.com>
	<1612367638-3794-4-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
In-Reply-To: <1612367638-3794-4-git-send-email-sergei.shtepa@veeam.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Damien.LeMoal@wdc.com, jack@suse.cz, corbet@lwn.net,
	johannes.thumshirn@wdc.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	gregkh@linuxfoundation.org, steve@sk2.org, koct9i@gmail.com,
	agk@redhat.com, pavgel.tide@veeam.com
Subject: Re: [dm-devel] [PATCH v4 3/6] block: add blk_mq_is_queue_frozen()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 03 2021 at 10:53am -0500,
Sergei Shtepa <sergei.shtepa@veeam.com> wrote:

> blk_mq_is_queue_frozen() allow to assert that the queue is frozen.
> 
> Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
> ---
>  block/blk-mq.c         | 13 +++++++++++++
>  include/linux/blk-mq.h |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index f285a9123a8b..924ec26fae5f 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -161,6 +161,19 @@ int blk_mq_freeze_queue_wait_timeout(struct request_queue *q,
>  }
>  EXPORT_SYMBOL_GPL(blk_mq_freeze_queue_wait_timeout);
>  
> +
> +bool blk_mq_is_queue_frozen(struct request_queue *q)
> +{
> +	bool ret;
> +
> +	mutex_lock(&q->mq_freeze_lock);
> +	ret = percpu_ref_is_dying(&q->q_usage_counter) && percpu_ref_is_zero(&q->q_usage_counter);
> +	mutex_unlock(&q->mq_freeze_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(blk_mq_is_queue_frozen);
> +
>  /*
>   * Guarantee no request is in use, so we can change any data structure of
>   * the queue afterward.
> diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
> index d705b174d346..9d1e8c4e922e 100644
> --- a/include/linux/blk-mq.h
> +++ b/include/linux/blk-mq.h
> @@ -525,6 +525,7 @@ void blk_freeze_queue_start(struct request_queue *q);
>  void blk_mq_freeze_queue_wait(struct request_queue *q);
>  int blk_mq_freeze_queue_wait_timeout(struct request_queue *q,
>  				     unsigned long timeout);
> +bool blk_mq_is_queue_frozen(struct request_queue *q);
>  
>  int blk_mq_map_queues(struct blk_mq_queue_map *qmap);
>  void blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set, int nr_hw_queues);
> -- 
> 2.20.1
> 

This needs to come before patch 2 (since patch 2 uses it).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

