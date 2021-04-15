Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 196A2360B24
	for <lists+dm-devel@lfdr.de>; Thu, 15 Apr 2021 15:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618495019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l7uUkKf7jT70bgeyh2TMQhkdCFGRblovsmji66tmgnA=;
	b=Qr/vvSkKb6buaGNqIjYP3gtwxzVodOugCyHM7naGt5rc3Y8/cEQoj5cnlUe5Jz/4gK5VeD
	5dx7r9QqBclkrZeiGop1ax199bG9gPxzlSMMaqP61OAckpk9Kn8+5g2PxilgqOIn1dAybg
	AZ4w9fLxksTWTJ0y7OjRafvLtoOZVX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-dVgX4kGFNS-Ytj00xZohrQ-1; Thu, 15 Apr 2021 09:56:57 -0400
X-MC-Unique: dVgX4kGFNS-Ytj00xZohrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CFFB890E7A;
	Thu, 15 Apr 2021 13:56:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C7861141;
	Thu, 15 Apr 2021 13:56:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFFD71806D19;
	Thu, 15 Apr 2021 13:56:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FDuVq5021000 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 09:56:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14A9B7730C; Thu, 15 Apr 2021 13:56:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-95.pek2.redhat.com [10.72.12.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CB685D71F;
	Thu, 15 Apr 2021 13:56:16 +0000 (UTC)
Date: Thu, 15 Apr 2021 21:56:11 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YHhF+3Qw4Y+hv5X4@T590>
References: <20210415103310.1513841-1-ming.lei@redhat.com>
	<20210415103310.1513841-3-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415103310.1513841-3-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH 2/2] block: support to freeze bio based
	request queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 15, 2021 at 06:33:10PM +0800, Ming Lei wrote:
> For bio based request queue, the queue usage refcnt is only grabbed
> during submission, which isn't consistent with request base queue.
> 
> Queue freezing has been used widely, and turns out it is very useful
> to quiesce queue activity.
> 
> Support to freeze bio based request queue by the following approach:
> 
> 1) grab two queue usage refcount for blk-mq before submitting blk-mq
> bio, one is for bio, anther is for request;
> 
> 2) add bio flag of BIO_QUEUE_REFFED for making sure that only one
> refcnt is grabbed for each bio, so we can put the refcnt when the
> bio is going away
> 
> 3) nvme mpath is a bit special, because same bio is used for both
> mpath queue and underlying nvme queue. So we put the mpath queue's
> usage refcnt before completing the nvme request.

RAID needs similar handling too, but it is easy to do, see md_end_io().

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

