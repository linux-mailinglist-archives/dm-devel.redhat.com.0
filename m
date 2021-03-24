Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8D446346E32
	for <lists+dm-devel@lfdr.de>; Wed, 24 Mar 2021 01:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616544656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H3ThZVZG6JfCTUZXMgKS5f5fFgRfjNEF6QuCeF8V9yk=;
	b=GHMHAHGOloY4s/H5QeZ3Mo56VBbBJdf6uXTAC7YvEB0XMhWbES1voAiDBSnrRDhcS5+ogl
	fuCu5IEp64GL9bGcrOkmZMGhHHDcNSwlz2YejryPuoAnxqCXhDUNMxvHsE3GNoxDCGnoDT
	l/w3NcdmZNoM/GCYfZmCPjkNr2/K3VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Xgqn4bM6OpeZU0iyD9LGig-1; Tue, 23 Mar 2021 20:10:54 -0400
X-MC-Unique: Xgqn4bM6OpeZU0iyD9LGig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29A6D190B2A0;
	Wed, 24 Mar 2021 00:10:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F6A61F59;
	Wed, 24 Mar 2021 00:10:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F63D1809C83;
	Wed, 24 Mar 2021 00:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O0ANEE001757 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 20:10:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF30217D7E; Wed, 24 Mar 2021 00:10:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-85.pek2.redhat.com [10.72.12.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D219F18B84;
	Wed, 24 Mar 2021 00:10:10 +0000 (UTC)
Date: Wed, 24 Mar 2021 08:10:05 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <YFqDXeEsDNBfoWqW@T590>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-10-ming.lei@redhat.com>
	<522a2c87-e9f3-e62a-e09b-084821c698a0@grimberg.me>
	<YFnYhBIiFhiyX8Wb@T590>
	<713f2a27-4a2c-8723-3dfd-de6d68956eb2@grimberg.me>
MIME-Version: 1.0
In-Reply-To: <713f2a27-4a2c-8723-3dfd-de6d68956eb2@grimberg.me>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH V2 09/13] block: use per-task poll
 context to implement bio based io poll
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 23, 2021 at 09:54:36AM -0700, Sagi Grimberg wrote:
> 
> > > > +static void blk_bio_poll_post_submit(struct bio *bio, blk_qc_t cookie)
> > > > +{
> > > > +	bio->bi_iter.bi_private_data = cookie;
> > > > +}
> > > > +
> > > 
> > > Hey Ming, thinking about nvme-mpath, I'm thinking that this should be
> > > an exported function for failover. nvme-mpath updates bio.bi_dev
> > > when re-submitting I/Os to an alternate path, so I'm thinking
> > > that if this function is exported then nvme-mpath could do as little
> > > as the below to allow polling?
> > > 
> > > --
> > > diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> > > index 92adebfaf86f..e562e296153b 100644
> > > --- a/drivers/nvme/host/multipath.c
> > > +++ b/drivers/nvme/host/multipath.c
> > > @@ -345,6 +345,7 @@ static void nvme_requeue_work(struct work_struct *work)
> > >          struct nvme_ns_head *head =
> > >                  container_of(work, struct nvme_ns_head, requeue_work);
> > >          struct bio *bio, *next;
> > > +       blk_qc_t cookie;
> > > 
> > >          spin_lock_irq(&head->requeue_lock);
> > >          next = bio_list_get(&head->requeue_list);
> > > @@ -359,7 +360,8 @@ static void nvme_requeue_work(struct work_struct *work)
> > >                   * path.
> > >                   */
> > >                  bio_set_dev(bio, head->disk->part0);
> > > -               submit_bio_noacct(bio);
> > > +               cookie = submit_bio_noacct(bio);
> > > +               blk_bio_poll_post_submit(bio, cookie);
> > >          }
> > >   }
> > > --
> > > 
> > > I/O failover will create misalignment from the polling context cpu and
> > > the submission cpu (running requeue_work), but I don't see if there is
> > > something that would break here...
> > 
> > I understand requeue shouldn't be one usual event, and I guess it is just
> > fine to fallback to IRQ based mode?
> 
> Well, when it will failover, it will probably be directed to the poll
> queues. Maybe I'm missing something...

In this patchset, because it isn't submitted directly from FS, there
isn't one polling context associated with this bio, so its HIPRI flag
will be cleared, then fallback to irq mode.

> 
> > This patchset actually doesn't cover such bio submission from kernel context.
> 
> What is the difference?

So far upper layer(io_uring, or dio, ..) needs to get the returned cookie, then
pass it to blk_poll().

For this case, the cookie can't be passed to FS caller of submit_bio(FS bio), so
it can't be polled by in-tree's code.



Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

