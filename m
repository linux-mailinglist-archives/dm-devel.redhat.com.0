Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 585833149F5
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 09:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612858112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/EEJZcGJNG1gxDovi3XqQphltw4l0WHCU4AkHSic6Lk=;
	b=CPJK5h7wjMCU51Jz+UM14Rymwsl2s6O/llzmU8FLbve1raWxS5kCVInHBML5kxFhsQv1lG
	MKndJ99r/vnRCdGzFgU3I3w9l8XuML5nJjpPjLyMEs15oLs02/2zDtUuuYcV/7ptKi3XWX
	Ewl2fOwKfHeJZPosPWq8dHY1/XaVD5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-7NdNH-IiMS6YmGjbKECLtg-1; Tue, 09 Feb 2021 03:08:30 -0500
X-MC-Unique: 7NdNH-IiMS6YmGjbKECLtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F81107ACFA;
	Tue,  9 Feb 2021 08:08:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 513EB60C04;
	Tue,  9 Feb 2021 08:08:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBDFF4E58E;
	Tue,  9 Feb 2021 08:08:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11987wd4015002 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 03:07:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1909A5D9CD; Tue,  9 Feb 2021 08:07:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-18.pek2.redhat.com [10.72.12.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D9CF5D9DC;
	Tue,  9 Feb 2021 08:07:43 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:07:39 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20210209080739.GB94287@T590>
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
	<20210208085243.82367-10-jefflexu@linux.alibaba.com>
	<20210209031122.GA63798@T590>
	<a499a33f-da2e-b5aa-5266-9e7c76a34b48@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <a499a33f-da2e-b5aa-5266-9e7c76a34b48@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, snitzer@redhat.com, caspar@linux.alibaba.com,
	io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH v3 09/11] dm: support IO polling for
	bio-based dm device
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

On Tue, Feb 09, 2021 at 02:13:38PM +0800, JeffleXu wrote:
> 
> 
> On 2/9/21 11:11 AM, Ming Lei wrote:
> > On Mon, Feb 08, 2021 at 04:52:41PM +0800, Jeffle Xu wrote:
> >> DM will iterate and poll all polling hardware queues of all target mq
> >> devices when polling IO for dm device. To mitigate the race introduced
> >> by iterating all target hw queues, a per-hw-queue flag is maintained
> > 
> > What is the per-hw-queue flag?
> 
> Sorry I forgot to update the commit message as the implementation
> changed. Actually this mechanism is implemented by patch 10 of this
> patch set.

It is hard to associate patch 10's spin_trylock() with per-hw-queue
flag. Also scsi's poll implementation is in-progress, and scsi's poll may
not be implemented in this way.

> 
> > 
> >> to indicate whether this polling hw queue currently being polled on or
> >> not. Every polling hw queue is exclusive to one polling instance, i.e.,
> >> the polling instance will skip this polling hw queue if this hw queue
> >> currently is being polled by another polling instance, and start
> >> polling on the next hw queue.
> > 
> > Not see such skip in dm_poll_one_dev() in which
> > queue_for_each_poll_hw_ctx() is called directly for polling all POLL
> > hctxs of the request queue, so can you explain it a bit more about this
> > skip mechanism?
> > 
> 
> It is implemented as patch 10 of this patch set. When spin_trylock()
> fails, the polling instance will return immediately, instead of busy
> waiting.
> 
> 
> > Even though such skipping is implemented, not sure if good performance
> > can be reached because hctx poll may be done in ping-pong style
> > among several CPUs. But blk-mq hctx is supposed to have its cpu affinities.
> > 
> 
> Yes, the mechanism of iterating all hw queues can make the competition
> worse.
> 
> If every underlying data device has **only** one polling hw queue, then
> this ping-pong style polling still exist, even when we implement split
> bio tracking mechanism, i.e., acquiring the specific hw queue the bio
> enqueued into. Because multiple polling instance has to compete for the
> only polling hw queue.
> 
> But if multiple polling hw queues per device are reserved for multiple
> polling instances, (e.g., every underlying data device has 3 polling hw
> queues when there are 3 polling instances), just as what we practice on
> mq polling, then the current implementation of iterating all hw queues
> will indeed works in a ping-pong style, while this issue shall not exist
> when accurate split bio tracking mechanism could be implemented.

In reality it could be possible to have one hw queue for each numa node.

And you may re-use blk_mq_map_queue() for getting the proper hw queue for poll.


-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

