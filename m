Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E65B847DE3A
	for <lists+dm-devel@lfdr.de>; Thu, 23 Dec 2021 05:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640233043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oQagGeAXhW9wcvIWIgCzStQv+d3xnuHKG8hPsgiS3fk=;
	b=eE+bUSDT9Sqr3L9eR22UoqWx31i93m1tXbv+KYzUc5+YH+YqsZqHT8iXwn39tOy/IQ3UjG
	xmviWsAV2glkQwXltWaes5uR7fS74ggukxVYIUTFx1j/SfLLEo+RKjT316Az01Qdgj98vT
	eQN/iDLscKLI+Ltvo8nrWSWuYsAEA6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-oosaMoDqM62THn4Ovi9n_Q-1; Wed, 22 Dec 2021 23:17:21 -0500
X-MC-Unique: oosaMoDqM62THn4Ovi9n_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 169E5100C612;
	Thu, 23 Dec 2021 04:17:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A064E2D0;
	Thu, 23 Dec 2021 04:17:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 159EB4CA93;
	Thu, 23 Dec 2021 04:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BN4Goi9018791 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 23:16:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F084101E87D; Thu, 23 Dec 2021 04:16:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-24.pek2.redhat.com [10.72.8.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2FC1017E27;
	Thu, 23 Dec 2021 04:16:27 +0000 (UTC)
Date: Thu, 23 Dec 2021 12:16:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YcP4FMG9an5ReIiV@T590>
References: <20211221141459.1368176-1-ming.lei@redhat.com>
	<YcH/E4JNag0QYYAa@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YcH/E4JNag0QYYAa@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/3] blk-mq/dm-rq: support BLK_MQ_F_BLOCKING
	for dm-rq
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

On Tue, Dec 21, 2021 at 08:21:39AM -0800, Christoph Hellwig wrote:
> On Tue, Dec 21, 2021 at 10:14:56PM +0800, Ming Lei wrote:
> > Hello,
> > 
> > dm-rq may be built on blk-mq device which marks BLK_MQ_F_BLOCKING, so
> > dm_mq_queue_rq() may become to sleep current context.
> > 
> > Fixes the issue by allowing dm-rq to set BLK_MQ_F_BLOCKING in case that
> > any underlying queue is marked as BLK_MQ_F_BLOCKING.
> > 
> > DM request queue is allocated before allocating tagset, this way is a
> > bit special, so we need to pre-allocate srcu payload, then use the queue
> > flag of QUEUE_FLAG_BLOCKING for locking dispatch.
> 
> What is the benefit over just forcing bio-based dm-mpath for these
> devices?

At least IO scheduler can't be used for bio based dm-mpath, also there should
be other drawbacks for bio based mpath and request mpath is often the default
option, maybe Mike has more input about bio vs request dm-mpath.



Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

