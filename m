Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95D4635F239
	for <lists+dm-devel@lfdr.de>; Wed, 14 Apr 2021 13:25:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618399543;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nqgdt/ywsmk/nc0VxqQCXKwVFfEe+UObd0HWFdiPzrg=;
	b=VAWcrO/Q9KZmcvCgqOkFptDY5XcjMSvwAPUeHdBOkFcDPjviOA2ArriED5mN1XBw1zMjap
	DeB1ad+FCebn+uS3+TaNSiumwbjyrnTeIjnj8V135LaiUH7V4st55tjklPIU/7nABZw7je
	KY6ffGXeRSOHxVZ9xUkN6iOgtopSJpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-XNXgYQqnMaCW9OufjjRXvA-1; Wed, 14 Apr 2021 07:25:41 -0400
X-MC-Unique: XNXgYQqnMaCW9OufjjRXvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EBEA8018A7;
	Wed, 14 Apr 2021 11:25:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4F05D9CC;
	Wed, 14 Apr 2021 11:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C1B01806D0F;
	Wed, 14 Apr 2021 11:25:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13EBP3gX001958 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 07:25:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C6FE5D9CC; Wed, 14 Apr 2021 11:25:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1D15D9D0;
	Wed, 14 Apr 2021 11:24:51 +0000 (UTC)
Date: Wed, 14 Apr 2021 19:24:46 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YHbQ/rZUPoTFUMDs@T590>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-12-ming.lei@redhat.com>
	<20210412093856.GA978201@infradead.org>
	<a6d46979-810e-bc53-bc19-8acd449e3718@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <a6d46979-810e-bc53-bc19-8acd449e3718@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 14, 2021 at 04:38:25PM +0800, JeffleXu wrote:
> 
> 
> On 4/12/21 5:38 PM, Christoph Hellwig wrote:
> > On Thu, Apr 01, 2021 at 10:19:26AM +0800, Ming Lei wrote:
> >> From: Jeffle Xu <jefflexu@linux.alibaba.com>
> >>
> >> This method can be used to check if bio-based device supports IO polling
> >> or not. For mq devices, checking for hw queue in polling mode is
> >> adequate, while the sanity check shall be implementation specific for
> >> bio-based devices. For example, dm device needs to check if all
> >> underlying devices are capable of IO polling.
> >>
> >> Though bio-based device may have done the sanity check during the
> >> device initialization phase, cacheing the result of this sanity check
> >> (such as by cacheing in the queue_flags) may not work. Because for dm
> >> devices, users could change the state of the underlying devices through
> >> '/sys/block/<dev>/io_poll', bypassing the dm device above. In this case,
> >> the cached result of the very beginning sanity check could be
> >> out-of-date. Thus the sanity check needs to be done every time 'io_poll'
> >> is to be modified.
> > 
> > I really don't think thi should be a method, and I really do dislike
> > how we have all this "if (is_mq)" junk.  Why can't we have a flag on
> > the gendisk that signals if the device can support polling that
> > is autoamtically set for blk-mq and as-needed by bio based drivers?
> 
> That would consume one more bit of queue->queue_flags.
> 
> Besides, DM/MD is somehow special here that when one of the underlying
> devices is disabled polling through '/sys/block/<dev>/io_poll',
> currently there's no mechanism notifying the above MD/DM to clear the
> previously set queue_flags. Thus the outdated queue_flags still
> indicates this DM/MD is capable of polling, while in fact one of the
> underlying device has been disabled for polling.

Right, just like there isn't queue limit progagation.

Another blocker could be that bio based queue doesn't support queue
freezing.

> 
> Mike had ever suggested that we can trust the queue_flag, and clear the
> outdated queue_flags when later the IO submission or polling routine
> finally finds that the device is not capable of polling. Currently
> submit_bio_checks() will silently clear the REQ_HIPRI flag and still
> submit the bio when the device is actually not capable of polling. To
> fix the issue, could we break the submission and return an error code in
> submit_bio_checks() if the device is not capable of polling when
> submitting HIPRI bio?

I think we may just leave it alone, if underlying queue becomes not pollable,
the bio still can be submitted & completed via IRQ, just not efficient enough.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

