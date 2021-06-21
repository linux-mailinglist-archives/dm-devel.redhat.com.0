Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC3AD3AE515
	for <lists+dm-devel@lfdr.de>; Mon, 21 Jun 2021 10:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624264787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e6zevQ3Xfkq7e3tGN5fvDkyhw9MFrH9oH9o12YpIHog=;
	b=OzF7dE23P09LPmYy7pXjGUbh0Ajq3oPVMGZNYVLYtvIxyf/BmMBvan61ZizH9cA8c4Y8ie
	i1dbILkFU+bvt5q15g0nY6+7qPdrfsSli4EOzWgYOWg7kU2t+9oRG6xnqA8HpO7bUMoh/D
	BNOwSGEY4R3xWp/sI8d9BH0CvAi0mGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-u-i7F4BIP4uX6KLH7CNR2g-1; Mon, 21 Jun 2021 04:39:45 -0400
X-MC-Unique: u-i7F4BIP4uX6KLH7CNR2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD9F1922036;
	Mon, 21 Jun 2021 08:39:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66E465D9F0;
	Mon, 21 Jun 2021 08:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33E551809C99;
	Mon, 21 Jun 2021 08:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15L8dFvf022512 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 04:39:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AE3A5D9F0; Mon, 21 Jun 2021 08:39:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-237.pek2.redhat.com [10.72.13.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 854A35DA2D;
	Mon, 21 Jun 2021 08:38:59 +0000 (UTC)
Date: Mon, 21 Jun 2021 16:38:54 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YNBQHq1hwytjvXyR@T590>
References: <20210617103549.930311-1-ming.lei@redhat.com>
	<20210617103549.930311-2-ming.lei@redhat.com>
	<20210621072036.GB6651@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210621072036.GB6651@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [RFC PATCH V2 1/3] block: add helper of
	blk_queue_poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 21, 2021 at 09:20:36AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 17, 2021 at 06:35:47PM +0800, Ming Lei wrote:
> > There has been 3 users, and will be more, so add one such helper.
> > 
> > Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> > Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> 
> I still don't like hiding a simple flag test like this, it just adds
> another step to grepping what is going on.

It is actually one pattern in block layer since there is so many such
macros of blk_queue_*. And it makes the check line shorter.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

