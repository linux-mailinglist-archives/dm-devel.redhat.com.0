Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 04188361CB3
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 11:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618564065;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=madAG/glkPZpprH3pVhF4bYY/INueN3/xHIcfI8U5oo=;
	b=L4CiC584/aYfIWb+kVgXfy5mo50TRnnT44nz9GhrgYTojG0+wP6CngRWJDwtk4LSZI9zh+
	trn9yfMde7wUtMx6K9OPnACarFD13GI8ZA+7BRtKBey2yOei1EaUDEEXQAPYKOVHeHW1ke
	XD6fMfb3zegrZS94pwG3gJ6VTLDSYJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-w3weLyVLOq-TFps3Y8WdPg-1; Fri, 16 Apr 2021 05:07:42 -0400
X-MC-Unique: w3weLyVLOq-TFps3Y8WdPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA84107ACE3;
	Fri, 16 Apr 2021 09:07:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D62F6F99C;
	Fri, 16 Apr 2021 09:07:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA4CB44A5E;
	Fri, 16 Apr 2021 09:07:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13G97Isl002163 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 05:07:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5CB55D9DE; Fri, 16 Apr 2021 09:07:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-36.pek2.redhat.com [10.72.12.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABCBA5D9C0;
	Fri, 16 Apr 2021 09:07:06 +0000 (UTC)
Date: Fri, 16 Apr 2021 17:07:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YHlTtVtTEBpxa8Gh@T590>
References: <20210401021927.343727-12-ming.lei@redhat.com>
	<20210416080037.26335-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210416080037.26335-1-jefflexu@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, dm-devel@redhat.com,
	snitzer@redhat.com
Subject: Re: [dm-devel] [PATCH] block: introduce QUEUE_FLAG_POLL_CAP flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 16, 2021 at 04:00:37PM +0800, Jeffle Xu wrote:
> Hi,
> How about this patch to remove the extra poll_capable() method?
> 
> And the following 'dm: support IO polling for bio-based dm device' needs
> following change.
> 
> ```
> +       /*
> +        * Check for request-based device is remained to
> +        * dm_mq_init_request_queue()->blk_mq_init_allocated_queue().
> +        * For bio-based device, only set QUEUE_FLAG_POLL when all underlying
> +        * devices supporting polling.
> +        */
> +       if (__table_type_bio_based(t->type)) {
> +               if (dm_table_supports_poll(t)) {
> +                       blk_queue_flag_set(QUEUE_FLAG_POLL_CAP, q);
> +                       blk_queue_flag_set(QUEUE_FLAG_POLL, q);
> +               }
> +               else {
> +                       blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
> +                       blk_queue_flag_clear(QUEUE_FLAG_POLL_CAP, q);
> +               }
> +       }
> ```

Frankly speaking, I don't see any value of using QUEUE_FLAG_POLL_CAP for
DM, and the result is basically subset of treating DM as always being capable
of polling.

Also underlying queue change(either limits or flag) won't be propagated
to DM/MD automatically. Strictly speaking it doesn't matter if all underlying
queues are capable of supporting polling at the exact time of 'write sysfs/poll',
cause any of them may change in future.

So why not start with the simplest approach(always capable of polling)
which does meet normal bio based polling requirement?



Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

