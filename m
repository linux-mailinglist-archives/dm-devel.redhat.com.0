Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 336BF3061F3
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jan 2021 18:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611768485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tfO2H39IeSHtokE+xCar5liu5UW5V7QhwuGLu8ZQ0G0=;
	b=K+bsbOTbNmWVB5v3Sf4/oY8lQFjYRYNHTbOaXNeWhKfH3KiXumdwrJ3eXFbm37lh7sMDCr
	w5dMOKjt//iQfHryF+C7yN2jzFA/UkzNsl+TbSBUDKpsPtaxKkzewL5acZ+weQuoxWrVob
	cAa0uPuePVsUsE2li7ewWrvNdzj554c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-EVFlC_btODO7SSbGNrTtyw-1; Wed, 27 Jan 2021 12:27:36 -0500
X-MC-Unique: EVFlC_btODO7SSbGNrTtyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C24802B46;
	Wed, 27 Jan 2021 17:27:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A142960C62;
	Wed, 27 Jan 2021 17:27:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21B0E180954D;
	Wed, 27 Jan 2021 17:27:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RHEu5H015329 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 12:14:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1FC2860C68; Wed, 27 Jan 2021 17:14:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088B460C77;
	Wed, 27 Jan 2021 17:14:42 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:14:42 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210127171442.GB11535@redhat.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
	<20210125121340.70459-4-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210125121340.70459-4-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 3/6] block: add iopoll method to support
 bio-based IO polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25 2021 at  7:13am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> ->poll_fn was introduced in commit ea435e1b9392 ("block: add a poll_fn
> callback to struct request_queue") to support bio-based queues such as
> nvme multipath, but was later removed in commit 529262d56dbe ("block:
> remove ->poll_fn").
> 
> Given commit c62b37d96b6e ("block: move ->make_request_fn to struct
> block_device_operations") restore the possibility of bio-based IO
> polling support by adding an ->iopoll method to gendisk->fops.
> Elevate bulk of blk_mq_poll() implementation to blk_poll() and reduce
> blk_mq_poll() to blk-mq specific code that is called from blk_poll().
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Suggested-by: Mike Snitzer <snitzer@redhat.com>

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

