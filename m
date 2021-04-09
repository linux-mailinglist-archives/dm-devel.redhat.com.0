Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA0035A22B
	for <lists+dm-devel@lfdr.de>; Fri,  9 Apr 2021 17:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617982818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n364uNKoUXjQDmPfY6AGNadvoMKeD7bQI4vo3N4l1+c=;
	b=deFvmG3q3dE7/vdW4HPRHQStj4xMEKz+YNTBUPXT8xNc8WkOia/iTWXC4Yyk8xfOs4zeGp
	4TydjyDTFf1wspKhQhIJWcvoJN+f78LiZ5cIupIjAppI9uNWrhcpwisJTc5EiYlHBChSeO
	jteCwZ6/AE6JN1RtN2lG5F6ZbjD/epA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-0XhuO_6lONutGEHm2LBpvQ-1; Fri, 09 Apr 2021 11:40:15 -0400
X-MC-Unique: 0XhuO_6lONutGEHm2LBpvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 882CE802B5B;
	Fri,  9 Apr 2021 15:40:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A1D36A97F;
	Fri,  9 Apr 2021 15:40:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A237755348;
	Fri,  9 Apr 2021 15:40:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139Fdx37030312 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 11:39:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86B065C1D5; Fri,  9 Apr 2021 15:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-213.pek2.redhat.com [10.72.13.213])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7EF5C1A1;
	Fri,  9 Apr 2021 15:39:56 +0000 (UTC)
Date: Fri, 9 Apr 2021 23:39:51 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YHB1R5qber/6kHn+@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401021927.343727-1-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V5 00/12] block: support bio based io polling
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

On Thu, Apr 01, 2021 at 10:19:15AM +0800, Ming Lei wrote:
> Hi Jens,
> 
> Add per-task io poll context for holding HIPRI blk-mq/underlying bios
> queued from bio based driver's io submission context, and reuse one bio
> padding field for storing 'cookie' returned from submit_bio() for these
> bios. Also explicitly end these bios in poll context by adding two
> new bio flags.
> 
> In this way, we needn't to poll all underlying hw queues any more,
> which is implemented in Jeffle's patches. And we can just poll hw queues
> in which there is HIPRI IO queued.
> 
> Usually io submission and io poll share same context, so the added io
> poll context data is just like one stack variable, and the cost for
> saving bios is cheap.
> 
> V5:
> 	- fix one use-after-free issue in case that polling is from another
> 	context: adds one new cookie of BLK_QC_T_NOT_READY for preventing
> 	this issue in patch 8/12
> 	- add reviewed-by & tested-by tag

Hello Guys,

Ping...


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

