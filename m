Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D81A2773D7
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 16:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957463;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/NTB0XzjhoOyncEq7eMZVonAILZGdTAMcgaUFCee4z4=;
	b=CeZ1V7E4Z5aAkmfq7jKmGdMCNmaSt/lnDaTrP5464NxFNZMrp+u4imKoV4cFdHzNFzZnvQ
	QYIwgY4LWQpppLAxP6nW0h57Y0uxrwHY9fcCWDk8Mdn+UjJXVbkSloAxf6aRE+jHr6R2JH
	wy7OLRI4px37hSH9P0Gc3SMWVB8C98k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-l-DOWVV8MKWSH6ddthV4Gg-1; Thu, 24 Sep 2020 10:24:21 -0400
X-MC-Unique: l-DOWVV8MKWSH6ddthV4Gg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4ABA1882FB3;
	Thu, 24 Sep 2020 14:24:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B5D5C1C7;
	Thu, 24 Sep 2020 14:24:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C18DA8C7A1;
	Thu, 24 Sep 2020 14:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OENw59032733 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:23:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 329D278816; Thu, 24 Sep 2020 14:23:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E23702E7;
	Thu, 24 Sep 2020 14:23:54 +0000 (UTC)
Date: Thu, 24 Sep 2020 10:23:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200924142353.GC13849@redhat.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200924012103.GE10500@redhat.com>
	<20200924073842.GA1894729@google.com>
MIME-Version: 1.0
In-Reply-To: <20200924073842.GA1894729@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@google.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at  3:38am -0400,
Satya Tangirala <satyat@google.com> wrote:

> On Wed, Sep 23, 2020 at 09:21:03PM -0400, Mike Snitzer wrote:
> > On Wed, Sep 09 2020 at  7:44pm -0400,
> > Satya Tangirala <satyat@google.com> wrote:
> > 
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Update the device-mapper core to support exposing the inline crypto
> > > support of the underlying device(s) through the device-mapper device.
> > > 
> > > This works by creating a "passthrough keyslot manager" for the dm
> > > device, which declares support for encryption settings which all
> > > underlying devices support.  When a supported setting is used, the bio
> > > cloning code handles cloning the crypto context to the bios for all the
> > > underlying devices.  When an unsupported setting is used, the blk-crypto
> > > fallback is used as usual.
> > > 
> > > Crypto support on each underlying device is ignored unless the
> > > corresponding dm target opts into exposing it.  This is needed because
> > > for inline crypto to semantically operate on the original bio, the data
> > > must not be transformed by the dm target.  Thus, targets like dm-linear
> > > can expose crypto support of the underlying device, but targets like
> > > dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)
> > > 
> > > When a key is evicted from the dm device, it is evicted from all
> > > underlying devices.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > Co-developed-by: Satya Tangirala <satyat@google.com>
> > > Signed-off-by: Satya Tangirala <satyat@google.com>
> > > ---
> > >  block/blk-crypto.c              |  1 +
> > >  block/keyslot-manager.c         | 34 ++++++++++++
> > >  drivers/md/dm-core.h            |  4 ++
> > >  drivers/md/dm-table.c           | 52 +++++++++++++++++++
> > >  drivers/md/dm.c                 | 92 ++++++++++++++++++++++++++++++++-
> > >  include/linux/device-mapper.h   |  6 +++
> > >  include/linux/keyslot-manager.h |  7 +++
> > >  7 files changed, 195 insertions(+), 1 deletion(-)
> > > 

> > > diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> > > index c4ef1fceead6..4542050eebfc 100644
> > > --- a/drivers/md/dm-core.h
> > > +++ b/drivers/md/dm-core.h
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/kthread.h>
> > >  #include <linux/ktime.h>
> > >  #include <linux/blk-mq.h>
> > > +#include <linux/keyslot-manager.h>
> > >  
> > >  #include <trace/events/block.h>
> > >  
> > > @@ -49,6 +50,9 @@ struct mapped_device {
> > >  
> > >  	int numa_node_id;
> > >  	struct request_queue *queue;
> > > +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> > > +	struct blk_keyslot_manager ksm;
> > > +#endif
> > >  
> > >  	atomic_t holders;
> > >  	atomic_t open_count;
> > 
> > Any reason you placed the ksm member where you did?
> > 
> > Looking at 'struct blk_keyslot_manager' I'm really hating adding that
> > bloat to every DM device for a feature that really won't see much broad
> > use (AFAIK).
> > 
> > Any chance you could allocate 'struct blk_keyslot_manager' as needed so
> > that most users of DM would only be carrying 1 extra pointer (set to
> > NULL)?
>
> I don't think there's any technical problem with doing that - the only
> other thing that would need addressing is that the patch uses
> "container_of" on that blk_keyslot_manager in dm_keyslot_evict() to get
> a pointer to the struct mapped_device. I could try adding a "private"
> field to struct blk_keyslot_manager and store a pointer to the struct
> mapped_device there).

Yes, that'd be ideal.

As for the lifetime of the struct blk_keyslot_manager pointer DM would
manage (in your future code revision): you meantioned in one reply that
the request_queue takes care of setting up the ksm... but the ksm
is tied to the queue at a later phase using blk_ksm_register(). 

In any case, I think my feature reequest (to have DM allocate the ksm
struct only as needed) is a bit challenging because of how DM allocates
the request_queue upfront in alloc_dev() and then later completes the
request_queue initialization based on DM_TYPE* in dm_setup_md_queue().

It _could_ be that you'll need to add a new DM_TYPE_KSM_BIO_BASED or
something.  But you have a catch-22 in that the dm-table.c code to
establish the intersection of supported modes assumes ksm is already
allocated.  So something needs to give by reasoning through: _what_ is
the invariant that will trigger the delayed allocation of the ksm
struct?  I don't yet see how you can make that informed decision that
the target(s) in the DM table _will_ use the ksm if it exists.

But then once the ksm is allocated, it never gets allocated again
because md->queue->ksm is already set, and it inherits the lifetime that
is used when destroying the mapped_device (md->queue, etc).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

