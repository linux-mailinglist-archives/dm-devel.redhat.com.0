Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEF836039D
	for <lists+dm-devel@lfdr.de>; Thu, 15 Apr 2021 09:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618472659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sdfKAyL4UKI4FibY68JiKC14+qiygGHhCOL34tsZ3zM=;
	b=ScIfHeoQDeDCysoiHqGbqy8j2tzNYmHcT1p/hQKD6byexiMc3z9taBU+EUSlh32TFjq8gs
	Vgpgs5lhezGaO/RvrM8r/XclMd74lcSYuG/QdOK9qlkyvbrdDQGdvtsQe1+CAt8hNAlcNp
	v2r6NkdItSyAtHHs3CBlaIr8Tx4wNVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-zaL3y3T2Py2SsSA0CopAGQ-1; Thu, 15 Apr 2021 03:44:17 -0400
X-MC-Unique: zaL3y3T2Py2SsSA0CopAGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15EA218766D3;
	Thu, 15 Apr 2021 07:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A1810074E1;
	Thu, 15 Apr 2021 07:44:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A4011806D0F;
	Thu, 15 Apr 2021 07:43:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13F7hcCl016052 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 03:43:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E5A02AAAA; Thu, 15 Apr 2021 07:43:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-200.pek2.redhat.com [10.72.13.200])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B613816C70;
	Thu, 15 Apr 2021 07:43:26 +0000 (UTC)
Date: Thu, 15 Apr 2021 15:43:22 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YHfumsTKHuvPGp47@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-12-ming.lei@redhat.com>
	<20210412093856.GA978201@infradead.org>
	<a6d46979-810e-bc53-bc19-8acd449e3718@linux.alibaba.com>
	<YHbQ/rZUPoTFUMDs@T590>
	<5f30059d-6650-8268-b681-d8567ac1c509@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <5f30059d-6650-8268-b681-d8567ac1c509@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH V5 11/12] block: add poll_capable method to
 support bio-based IO polling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 15, 2021 at 09:34:36AM +0800, JeffleXu wrote:
> 
> 
> On 4/14/21 7:24 PM, Ming Lei wrote:
> > On Wed, Apr 14, 2021 at 04:38:25PM +0800, JeffleXu wrote:
> >>
> >>
> >> On 4/12/21 5:38 PM, Christoph Hellwig wrote:
> >>> On Thu, Apr 01, 2021 at 10:19:26AM +0800, Ming Lei wrote:
> >>>> From: Jeffle Xu <jefflexu@linux.alibaba.com>
> >>>>
> >>>> This method can be used to check if bio-based device supports IO polling
> >>>> or not. For mq devices, checking for hw queue in polling mode is
> >>>> adequate, while the sanity check shall be implementation specific for
> >>>> bio-based devices. For example, dm device needs to check if all
> >>>> underlying devices are capable of IO polling.
> >>>>
> >>>> Though bio-based device may have done the sanity check during the
> >>>> device initialization phase, cacheing the result of this sanity check
> >>>> (such as by cacheing in the queue_flags) may not work. Because for dm
> >>>> devices, users could change the state of the underlying devices through
> >>>> '/sys/block/<dev>/io_poll', bypassing the dm device above. In this case,
> >>>> the cached result of the very beginning sanity check could be
> >>>> out-of-date. Thus the sanity check needs to be done every time 'io_poll'
> >>>> is to be modified.
> >>>
> >>> I really don't think thi should be a method, and I really do dislike
> >>> how we have all this "if (is_mq)" junk.  Why can't we have a flag on
> >>> the gendisk that signals if the device can support polling that
> >>> is autoamtically set for blk-mq and as-needed by bio based drivers?
> >>
> >> That would consume one more bit of queue->queue_flags.
> >>
> >> Besides, DM/MD is somehow special here that when one of the underlying
> >> devices is disabled polling through '/sys/block/<dev>/io_poll',
> >> currently there's no mechanism notifying the above MD/DM to clear the
> >> previously set queue_flags. Thus the outdated queue_flags still
> >> indicates this DM/MD is capable of polling, while in fact one of the
> >> underlying device has been disabled for polling.
> > 
> > Right, just like there isn't queue limit progagation.
> > 
> > Another blocker could be that bio based queue doesn't support queue
> > freezing.
> 
> Do you mean the queue freezing is called in the following code snippet?
> 
> ```
> static ssize_t queue_poll_store(struct request_queue *q, const char
> *page, size_t count)
> {
> 	...
> 	if (poll_on) {
> 		blk_queue_flag_set(QUEUE_FLAG_POLL, q);
> 	} else {
> 		blk_mq_freeze_queue(q);
> 		blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
> 		blk_mq_unfreeze_queue(q);
> 	}
> ```

Yes, if it is a bio based queue. Or bio queued queue(DM, MD or others) may
use freeze_queue to do similar thing.

> 
> And I can't understand how bio-based queue doesn't support queue freezing.
> 
> ```
> submit_bio_noacct
> 	__submit_bio_noacct
> 		bio_queue_enter
> ```
> 
> Every time submitting a bio, bio_queue_enter() will be called, and once
> the queue has been frozen, bio_queue_enter() will wait there until the
> queue is unfrozen.

Not like blk-mq, the refcount is just grabbed during submission for bio based
queue. I will research a bit and see if we can extend freeze queue for
covering bio based queue. One trouble is that bio is ended before
freeing request.

> 
> > 
> >>
> >> Mike had ever suggested that we can trust the queue_flag, and clear the
> >> outdated queue_flags when later the IO submission or polling routine
> >> finally finds that the device is not capable of polling. Currently
> >> submit_bio_checks() will silently clear the REQ_HIPRI flag and still
> >> submit the bio when the device is actually not capable of polling. To
> >> fix the issue, could we break the submission and return an error code in
> >> submit_bio_checks() if the device is not capable of polling when
> >> submitting HIPRI bio?
> > 
> > I think we may just leave it alone, if underlying queue becomes not pollable,
> > the bio still can be submitted & completed via IRQ, just not efficient enough.
> 
> Yes it still works. I agree if there's no better solution...
> 
> And what about the issue Christoph originally concerned? Do we use one
> more flag bit indicating if the queue capable of polling, or the
> poll_capable() method way?

Just wondering why we can't use QUEUE_FLAG_POLL simply? If user wants to
enable it, let's do it for them. And bio driver can start with default poll
state by checking underlying queues.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

